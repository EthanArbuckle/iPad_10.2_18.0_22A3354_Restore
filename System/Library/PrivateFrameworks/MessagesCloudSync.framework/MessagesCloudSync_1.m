char *sub_21780404C(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  void *v62;
  uint64_t v63;
  __int128 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  char *v71;
  _QWORD *v72;
  void *v73;
  __int128 v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  char *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;

  v6 = a2[1];
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  *((_QWORD *)a1 + 2) = a2[2];
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  *((_QWORD *)a1 + 4) = a2[4];
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  *((_QWORD *)a1 + 6) = a2[6];
  *((_QWORD *)a1 + 7) = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  *((_QWORD *)a1 + 8) = a2[8];
  *((_QWORD *)a1 + 9) = v10;
  swift_bridgeObjectRelease();
  v11 = a2[11];
  *((_QWORD *)a1 + 10) = a2[10];
  *((_QWORD *)a1 + 11) = v11;
  swift_bridgeObjectRelease();
  v12 = a3[10];
  v13 = &a1[v12];
  v14 = (char *)a2 + v12;
  v15 = sub_217847E3C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  v21 = a3[11];
  v22 = &a1[v21];
  v23 = (char *)a2 + v21;
  v24 = v17(&a1[v21], 1, v15);
  v25 = v17(v23, 1, v15);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v23, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    v26 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v22, v23, v15);
LABEL_13:
  v27 = a3[12];
  v28 = &a1[v27];
  v29 = (_QWORD *)((char *)a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *(_QWORD *)v28 = v31;
  *((_QWORD *)v28 + 1) = v30;
  swift_bridgeObjectRelease();
  v32 = a3[13];
  v33 = &a1[v32];
  v34 = (_QWORD *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *(_QWORD *)v33 = v36;
  *((_QWORD *)v33 + 1) = v35;
  swift_bridgeObjectRelease();
  v37 = a3[15];
  a1[a3[14]] = *((_BYTE *)a2 + a3[14]);
  a1[v37] = *((_BYTE *)a2 + v37);
  v38 = a3[16];
  v39 = &a1[v38];
  v40 = (char *)a2 + v38;
  v41 = v17(&a1[v38], 1, v15);
  v42 = v17(v40, 1, v15);
  if (v41)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v39, v40, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v39, 0, 1, v15);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v42)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v39, v15);
LABEL_18:
    v43 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v39, v40, v15);
LABEL_19:
  v44 = a3[17];
  v45 = &a1[v44];
  v46 = (_QWORD *)((char *)a2 + v44);
  v48 = *v46;
  v47 = v46[1];
  *(_QWORD *)v45 = v48;
  *((_QWORD *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  v49 = a3[18];
  v50 = &a1[v49];
  v51 = (_QWORD *)((char *)a2 + v49);
  v53 = *v51;
  v52 = v51[1];
  *(_QWORD *)v50 = v53;
  *((_QWORD *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
  v54 = a3[19];
  v55 = &a1[v54];
  v56 = (_QWORD *)((char *)a2 + v54);
  v58 = *v56;
  v57 = v56[1];
  *(_QWORD *)v55 = v58;
  *((_QWORD *)v55 + 1) = v57;
  swift_bridgeObjectRelease();
  v59 = a3[20];
  v60 = &a1[v59];
  v61 = (char *)a2 + v59;
  v62 = *(void **)&a1[v59 + 8];
  if (v62 == (void *)1)
  {
LABEL_22:
    v64 = *((_OWORD *)v61 + 1);
    *(_OWORD *)v60 = *(_OWORD *)v61;
    *((_OWORD *)v60 + 1) = v64;
    *((_OWORD *)v60 + 2) = *((_OWORD *)v61 + 2);
    *((_QWORD *)v60 + 6) = *((_QWORD *)v61 + 6);
    goto LABEL_24;
  }
  v63 = *((_QWORD *)v61 + 1);
  if (v63 == 1)
  {
    sub_217803DD8((id *)v60);
    goto LABEL_22;
  }
  *v60 = *v61;
  *((_QWORD *)v60 + 1) = v63;

  v65 = (void *)*((_QWORD *)v60 + 2);
  *((_QWORD *)v60 + 2) = *((_QWORD *)v61 + 2);

  v66 = (void *)*((_QWORD *)v60 + 3);
  *((_QWORD *)v60 + 3) = *((_QWORD *)v61 + 3);

  v67 = (void *)*((_QWORD *)v60 + 4);
  *((_QWORD *)v60 + 4) = *((_QWORD *)v61 + 4);

  v68 = (void *)*((_QWORD *)v60 + 5);
  *((_QWORD *)v60 + 5) = *((_QWORD *)v61 + 5);

  v69 = (void *)*((_QWORD *)v60 + 6);
  *((_QWORD *)v60 + 6) = *((_QWORD *)v61 + 6);

LABEL_24:
  v70 = a3[21];
  v71 = &a1[v70];
  v72 = (_QWORD *)((char *)a2 + v70);
  v73 = *(void **)&a1[v70];
  if (v73 != (void *)1)
  {
    if (*v72 != 1)
    {
      *(_QWORD *)v71 = *v72;

      v75 = (void *)*((_QWORD *)v71 + 1);
      *((_QWORD *)v71 + 1) = v72[1];

      v76 = (void *)*((_QWORD *)v71 + 2);
      *((_QWORD *)v71 + 2) = v72[2];

      v77 = (void *)*((_QWORD *)v71 + 3);
      *((_QWORD *)v71 + 3) = v72[3];

      goto LABEL_29;
    }
    sub_21776CCD0((id *)v71);
  }
  v74 = *((_OWORD *)v72 + 1);
  *(_OWORD *)v71 = *(_OWORD *)v72;
  *((_OWORD *)v71 + 1) = v74;
LABEL_29:
  v78 = a3[22];
  v79 = &a1[v78];
  v80 = (_QWORD *)((char *)a2 + v78);
  v82 = *v80;
  v81 = v80[1];
  *(_QWORD *)v79 = v82;
  *((_QWORD *)v79 + 1) = v81;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2178044F8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_217804504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_21776B790((uint64_t *)&unk_253F259D0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v9);
  }
}

uint64_t sub_217804590()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21780459C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = sub_21776B790((uint64_t *)&unk_253F259D0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ActionRecord()
{
  uint64_t result;

  result = qword_253F269E8;
  if (!qword_253F269E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_217804650()
{
  unint64_t v0;

  sub_21776DC78();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_217804704(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t *v25;
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
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char *v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t *v81;
  int *v82;
  _QWORD v83[5];
  char v84[8];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  char v88;

  v72 = a2;
  v74 = sub_21776B790(&qword_254F02F50);
  v73 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v75 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21776B790(&qword_253F26F38);
  v76 = *(_QWORD *)(v4 - 8);
  v77 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v78 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21776B790((uint64_t *)&unk_253F259D0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v68 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v68 - v13;
  v15 = sub_21776B790(&qword_253F26F58);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = (int *)type metadata accessor for ActionRecord();
  MEMORY[0x24BDAC7A8](v82);
  v80 = a1;
  v81 = (uint64_t *)((char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21776E3A4(a1, a1[3]);
  sub_21776E3C8();
  v20 = v79;
  sub_2178489B8();
  if (v20)
  {
    _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v80);
    return;
  }
  v71 = v14;
  v70 = v12;
  v69 = v9;
  v79 = v16;
  LOBYTE(v83[0]) = 0;
  v21 = v18;
  v22 = sub_2178487A8();
  v23 = v82;
  v24 = v15;
  v25 = v81;
  *v81 = v22;
  v25[1] = v26;
  LOBYTE(v83[0]) = 1;
  v25[2] = sub_2178487A8();
  v25[3] = v27;
  LOBYTE(v83[0]) = 2;
  v25[4] = sub_2178487A8();
  v25[5] = v28;
  LOBYTE(v83[0]) = 3;
  v25[6] = sub_2178487A8();
  v25[7] = v29;
  LOBYTE(v83[0]) = 4;
  v25[8] = sub_2178487A8();
  v25[9] = v30;
  LOBYTE(v83[0]) = 5;
  v25[10] = sub_2178487A8();
  v25[11] = v31;
  v32 = sub_217847E3C();
  LOBYTE(v83[0]) = 6;
  sub_21776DD28(&qword_253F26948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v33 = (uint64_t)v71;
  sub_2178487CC();
  sub_21777B58C(v33, (uint64_t)v25 + v23[10]);
  LOBYTE(v83[0]) = 7;
  v34 = (uint64_t)v70;
  sub_2178487CC();
  sub_21777B58C(v34, (uint64_t)v25 + v23[11]);
  LOBYTE(v83[0]) = 8;
  v35 = sub_2178487A8();
  v36 = v21;
  v37 = (uint64_t *)((char *)v25 + v23[12]);
  *v37 = v35;
  v37[1] = v38;
  sub_21776E3A4(v80, v80[3]);
  sub_21776EE80();
  sub_2178489B8();
  LOBYTE(v83[0]) = 0;
  v39 = sub_2178487A8();
  v40 = (uint64_t *)((char *)v81 + v82[13]);
  *v40 = v39;
  v40[1] = v41;
  v88 = 1;
  sub_21776EEC4();
  sub_2178487FC();
  *((_BYTE *)v81 + v82[14]) = v83[0];
  sub_21776E3A4(v80, v80[3]);
  sub_217806304();
  sub_2178489B8();
  v88 = 1;
  sub_2177BC474();
  sub_2178487FC();
  *((_BYTE *)v81 + v82[15]) = v83[0];
  LOBYTE(v83[0]) = 0;
  v42 = sub_2178487D8();
  v44 = 1;
  if ((v43 & 1) != 0)
    goto LABEL_7;
  v45 = objc_msgSend((id)objc_opt_self(), sel___im_dateWithNanosecondTimeIntervalSinceReferenceDate_, (double)v42);
  if (v45)
  {
    v46 = v45;
    sub_217847E18();

    v44 = 0;
LABEL_7:
    v47 = (uint64_t)v69;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v69, v44, 1, v32);
    sub_21777B58C(v47, (uint64_t)v81 + v82[16]);
    LOBYTE(v83[0]) = 1;
    v48 = sub_2178487A8();
    v49 = (uint64_t *)((char *)v81 + v82[17]);
    *v49 = v48;
    v49[1] = v50;
    LOBYTE(v83[0]) = 2;
    v51 = sub_2178487A8();
    v52 = (uint64_t *)((char *)v81 + v82[18]);
    *v52 = v51;
    v52[1] = v53;
    LOBYTE(v83[0]) = 3;
    v54 = sub_2178487A8();
    v55 = (uint64_t *)((char *)v81 + v82[19]);
    *v55 = v54;
    v55[1] = v56;
    sub_21776E4FC((uint64_t)v80, (uint64_t)v83);
    sub_2177BBDE0(v83, v84);
    v57 = (char *)v81 + v82[20];
    *(_QWORD *)v57 = v84[0];
    *(_OWORD *)(v57 + 8) = v85;
    *(_OWORD *)(v57 + 24) = v86;
    *(_OWORD *)(v57 + 40) = v87;
    sub_21776E4FC((uint64_t)v80, (uint64_t)v83);
    v58 = sub_2177F0F20(v83);
    v59 = (uint64_t *)((char *)v81 + v82[21]);
    *v59 = v58;
    v59[1] = v60;
    v59[2] = v61;
    v59[3] = v62;
    LOBYTE(v83[0]) = 4;
    v63 = sub_2178487A8();
    v65 = v64;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v74);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v77);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v36, v24);
    v66 = (uint64_t)v81;
    v67 = (uint64_t *)((char *)v81 + v82[22]);
    *v67 = v63;
    v67[1] = v65;
    sub_217806348(v66, v72);
    _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v80);
    sub_2177B94AC(v66);
    return;
  }
  __break(1u);
}

uint64_t sub_2178053B0()
{
  sub_21784897C();
  sub_217848988();
  return sub_2178489A0();
}

uint64_t sub_2178053F4()
{
  return sub_217848988();
}

uint64_t sub_217805420()
{
  sub_21784897C();
  sub_217848988();
  return sub_2178489A0();
}

uint64_t sub_217805460@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_217806590(*a1);
  *a2 = result;
  return result;
}

void sub_217805488(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 3;
}

uint64_t sub_217805498()
{
  sub_217806600();
  return sub_217848088();
}

void sub_2178054F4(char *a1)
{
  sub_217818C28(*a1);
}

void sub_217805500()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21784897C();
  __asm { BR              X9 }
}

uint64_t sub_217805544()
{
  sub_217848004();
  swift_bridgeObjectRelease();
  return sub_2178489A0();
}

void sub_2178055B4()
{
  __asm { BR              X10 }
}

uint64_t sub_2178055E8()
{
  sub_217848004();
  return swift_bridgeObjectRelease();
}

void sub_217805644()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21784897C();
  __asm { BR              X9 }
}

uint64_t sub_217805684()
{
  sub_217848004();
  swift_bridgeObjectRelease();
  return sub_2178489A0();
}

uint64_t sub_2178056F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2178065B8();
  *a1 = result;
  return result;
}

uint64_t sub_217805720()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_217805748 + 4 * byte_21784F47F[*v0]))();
}

void sub_217805748(_QWORD *a1@<X8>)
{
  *a1 = 0x7265646E6573;
  a1[1] = 0xE600000000000000;
}

void sub_217805760(_QWORD *a1@<X8>)
{
  *a1 = 0x6469754772;
  a1[1] = 0xE500000000000000;
}

void sub_217805778(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1682531172;
  a1[1] = v1;
}

void sub_217805788(_QWORD *a1@<X8>)
{
  *a1 = 0x444974616863;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_2178057A0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2178057C8 + 4 * byte_21784F484[*v0]))(1701669236, 0xE400000000000000);
}

uint64_t sub_2178057C8()
{
  return 0x7265646E6573;
}

uint64_t sub_2178057DC()
{
  return 0x6469754772;
}

uint64_t sub_2178057F0()
{
  return 1682531172;
}

uint64_t sub_2178057FC()
{
  return 0x444974616863;
}

uint64_t sub_217805810@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2178065B8();
  *a1 = result;
  return result;
}

void sub_217805834(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_217805840()
{
  sub_217806304();
  return sub_2178489D0();
}

uint64_t sub_217805868()
{
  sub_217806304();
  return sub_2178489DC();
}

void sub_217805890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;

  v1 = type metadata accessor for ActionRecord();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&loc_217805918 + dword_21780615C[*(unsigned __int8 *)(v0 + *(int *)(MEMORY[0x24BDAC7A8](v2) + 60))];
  __asm { BR              X10 }
}

void *sub_217805928()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  id v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  sub_217787748(0, &qword_254F02F80);
  sub_217806348((uint64_t)v0, v1);
  sub_217801198(v1);
  v6 = v5;
  v7 = (_QWORD *)((char *)v0 + v2[20]);
  v8 = (void *)v7[1];
  if (v8 != (void *)1)
  {
    v9 = *v7;
    v10 = (void *)v7[2];
    v11 = (void *)v7[3];
    v13 = (void *)v7[4];
    v12 = (void *)v7[5];
    v14 = (void *)v7[6];
    *(_QWORD *)(v4 - 168) = v9;
    *(_QWORD *)(v4 - 160) = v3;
    *(_BYTE *)(v4 - 136) = v9;
    *(_QWORD *)(v4 - 128) = v8;
    *(_QWORD *)(v4 - 120) = v10;
    *(_QWORD *)(v4 - 112) = v11;
    *(_QWORD *)(v4 - 104) = v13;
    *(_QWORD *)(v4 - 96) = v12;
    *(_QWORD *)(v4 - 88) = v14;
    *(_QWORD *)(v4 - 176) = v14;
    v15 = v14;
    v16 = v8;
    v17 = v10;
    v18 = v11;
    v19 = v13;
    *(_QWORD *)(v4 - 184) = v12;
    v20 = v12;
    v21 = objc_msgSend(v6, sel_guid);
    if (!v21)
    {
      __break(1u);
      JUMPOUT(0x21780615CLL);
    }
    v22 = v21;
    v23 = sub_217847F98();
    v25 = v24;

    sub_217801444(v4 - 136, v23, v25);
    swift_bridgeObjectRelease();
    sub_2178062A4(*(_QWORD *)(v4 - 168), v8, v10, v11, v13, *(void **)(v4 - 184), *(void **)(v4 - 176));
    v3 = *(_QWORD *)(v4 - 160);
  }
  if (v0[3])
    v26 = (void *)sub_217847F74();
  else
    v26 = 0;
  objc_msgSend(v6, sel_setService_, v26);

  v27 = (_QWORD *)((char *)v0 + v2[21]);
  v28 = *v27;
  v29 = (void *)v27[3];
  if (v28 != 1 && v29 != 0)
  {
    v31 = v29;
    if (objc_msgSend(v31, sel_hasActualService))
    {
      if (qword_253F25D98 != -1)
        swift_once();
      v32 = sub_217847ED8();
      sub_21776F584(v32, (uint64_t)qword_253F28DC8);
      sub_217806348((uint64_t)v0, v3);
      v33 = v31;
      v34 = sub_217847EC0();
      v35 = sub_2178482B0();
      if (os_log_type_enabled(v34, (os_log_type_t)v35))
      {
        *(_QWORD *)(v4 - 160) = v3;
        v36 = swift_slowAlloc();
        v37 = swift_slowAlloc();
        *(_QWORD *)(v4 - 168) = v37;
        *(_QWORD *)(v4 - 144) = v37;
        *(_DWORD *)v36 = 136315394;
        v38 = objc_msgSend(v33, sel_actualService);
        if (v38)
        {
          v39 = v38;
          v40 = sub_217847F98();
          v42 = v41;

        }
        else
        {
          v42 = 0xE300000000000000;
          v40 = 7104878;
        }
        *(_DWORD *)(v4 - 176) = v35;
        *(_QWORD *)(v4 - 152) = sub_2177D06AC(v40, v42, (uint64_t *)(v4 - 144));
        sub_2178484E4();

        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        v43 = *(_QWORD *)(v4 - 160);
        if (*(_QWORD *)(v43 + 24))
        {
          v44 = *(_QWORD *)(v43 + 16);
          v45 = *(_QWORD *)(v43 + 24);
        }
        else
        {
          v45 = 0xE300000000000000;
          v44 = 7104878;
        }
        swift_bridgeObjectRetain();
        *(_QWORD *)(v4 - 152) = sub_2177D06AC(v44, v45, (uint64_t *)(v4 - 144));
        sub_2178484E4();
        swift_bridgeObjectRelease();
        sub_2177B94AC(v43);
        _os_log_impl(&dword_217765000, v34, (os_log_type_t)*(_DWORD *)(v4 - 176), "using proto4 service %s over %s", (uint8_t *)v36, 0x16u);
        v46 = *(_QWORD *)(v4 - 168);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v46, -1, -1);
        MEMORY[0x219A13268](v36, -1, -1);

      }
      else
      {

        sub_2177B94AC(v3);
      }
      v31 = objc_msgSend(v33, sel_actualService);
      objc_msgSend(v6, sel_setService_, v31);

    }
  }
  if (*(_QWORD *)((char *)v0 + v2[19] + 8))
    v47 = (void *)sub_217847F74();
  else
    v47 = 0;
  objc_msgSend(v6, sel_setDestinationCallerID_, v47);

  if (*(_QWORD *)((char *)v0 + v2[18] + 8))
    v48 = (void *)sub_217847F74();
  else
    v48 = 0;
  objc_msgSend(v6, sel_setReplyToGUID_, v48);

  if (*(_QWORD *)((char *)v0 + v2[22] + 8))
    v49 = (void *)sub_217847F74();
  else
    v49 = 0;
  objc_msgSend(v6, sel_setParentChatID_, v49);

  if (v0[7])
    v50 = (void *)sub_217847F74();
  else
    v50 = 0;
  objc_msgSend(v6, sel_setCloudKitRecordID_, v50);

  if (v0[5])
    v51 = (void *)sub_217847F74();
  else
    v51 = 0;
  objc_msgSend(v6, sel_setCloudKitRecordChangeTag_, v51);

  objc_msgSend(v6, sel_setCloudKitSyncState_, 1);
  objc_msgSend(v6, sel_setCloudKitServerChangeTokenBlob_, 0);
  return v6;
}

void sub_217806170(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_217804704(a1, a2);
}

uint64_t sub_217806184(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_21776B790(&qword_254F02F88);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21776E3A4(a1, a1[3]);
  sub_217806304();
  sub_2178489C4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_217806248(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_21776DD28(&qword_254F02F40, (uint64_t (*)(uint64_t))type metadata accessor for ActionRecord, (uint64_t)&unk_21784F550);
  result = sub_21776DD28(&qword_254F02F48, (uint64_t (*)(uint64_t))type metadata accessor for ActionRecord, (uint64_t)&unk_21784F528);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_2178062A4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  if (a2 != (void *)1)
  {

  }
}

unint64_t sub_217806304()
{
  unint64_t result;

  result = qword_254F02F58;
  if (!qword_254F02F58)
  {
    result = MEMORY[0x219A13184](&unk_21784F764, &type metadata for ActionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F02F58);
  }
  return result;
}

uint64_t sub_217806348(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ActionRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for ActionRecord.CodingKeys()
{
  return &type metadata for ActionRecord.CodingKeys;
}

uint64_t _s17MessagesCloudSync10ActionTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2178063F0 + 4 * byte_21784F48E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_217806424 + 4 * byte_21784F489[v4]))();
}

uint64_t sub_217806424(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21780642C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217806434);
  return result;
}

uint64_t sub_217806440(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217806448);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21780644C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217806454(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActionType()
{
  return &type metadata for ActionType;
}

unint64_t sub_217806474()
{
  unint64_t result;

  result = qword_254F02F90;
  if (!qword_254F02F90)
  {
    result = MEMORY[0x219A13184](&unk_21784F624, &type metadata for ActionType);
    atomic_store(result, (unint64_t *)&qword_254F02F90);
  }
  return result;
}

unint64_t sub_2178064BC()
{
  unint64_t result;

  result = qword_254F02F98;
  if (!qword_254F02F98)
  {
    result = MEMORY[0x219A13184](&unk_21784F714, &type metadata for ActionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F02F98);
  }
  return result;
}

unint64_t sub_217806504()
{
  unint64_t result;

  result = qword_254F02FA0;
  if (!qword_254F02FA0)
  {
    result = MEMORY[0x219A13184](&unk_21784F64C, &type metadata for ActionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F02FA0);
  }
  return result;
}

unint64_t sub_21780654C()
{
  unint64_t result;

  result = qword_254F02FA8;
  if (!qword_254F02FA8)
  {
    result = MEMORY[0x219A13184](&unk_21784F674, &type metadata for ActionRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F02FA8);
  }
  return result;
}

uint64_t sub_217806590(unint64_t a1)
{
  if (a1 >= 8)
    return 5;
  else
    return (0x403020100050505uLL >> (8 * a1));
}

uint64_t sub_2178065B8()
{
  unint64_t v0;

  v0 = sub_217848790();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_217806600()
{
  unint64_t result;

  result = qword_254F02FB0;
  if (!qword_254F02FB0)
  {
    result = MEMORY[0x219A13184](&unk_21784F5AC, &type metadata for ActionType);
    atomic_store(result, (unint64_t *)&qword_254F02FB0);
  }
  return result;
}

uint64_t sub_217806644(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[10];

  v3 = type metadata accessor for DatabaseRecord();
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16))
  {
    v10[1] = a1;
    v10[2] = v1;
    v7 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v10[9] = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    sub_217811450(v7, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    v8 = (char *)&loc_217806734 + 4 * byte_21784F7C0[swift_getEnumCaseMultiPayload()];
    __asm { BR              X9 }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_217806958(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[10];

  v3 = type metadata accessor for DatabaseRecord();
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16))
  {
    v10[1] = a1;
    v10[2] = v1;
    v7 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v10[9] = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    sub_217811450(v7, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    v8 = (char *)&loc_217806A48 + 4 * byte_21784F7C7[swift_getEnumCaseMultiPayload()];
    __asm { BR              X9 }
  }
  return MEMORY[0x24BEE4AF8];
}

void sub_217806C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for DatabaseRecord();
  MEMORY[0x24BDAC7A8](v1);
  sub_217811450(v0, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_217806CF4 + 4 * byte_21784F7CE[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_217806CF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;

  *(_QWORD *)(v1 - 48) = type metadata accessor for ChatLockRecord();
  *(_QWORD *)(v1 - 40) = sub_21776DD28(&qword_254F01E98, (uint64_t (*)(uint64_t))type metadata accessor for ChatLockRecord, (uint64_t)&unk_21784B9D0);
  v2 = sub_21778E764((uint64_t *)(v1 - 72));
  sub_2177969C4(v0, (uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for ChatLockRecord);
  v3 = *(_QWORD *)(v1 - 48);
  v4 = *(_QWORD *)(v1 - 40);
  sub_21776E3A4((_QWORD *)(v1 - 72), v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 56))(v3, v4);
  v6 = v5;
  _s17MessagesCloudSync9SyncFilesVwxx_0(v1 - 72);
  v7 = 6;
  if (v6)
  {
    v8 = sub_217800010();
    if (v8 == 7)
      return 6;
    else
      return v8;
  }
  return v7;
}

void sub_217806E98()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _BYTE v8[24];
  uint64_t v9;

  if (qword_253F25CA0 != -1)
    swift_once();
  v0 = qword_253F28E28;
  v1 = unk_253F28E30;
  v2 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v3 = objc_msgSend(v2, sel_defaultManager);
  if (qword_253F25B88 != -1)
    swift_once();
  sub_21776E4FC((uint64_t)&unk_253F28E58, (uint64_t)v8);
  v4 = sub_21777A080((uint64_t)v8, v9);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(void))(v5 + 16))();
  v6 = v3;
  v7 = sub_21780F934(v0, v1, (uint64_t)v6);
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v8);

  qword_253F28E50 = v7;
}

uint64_t sub_217806FEC(uint64_t a1, char a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v8 + 136) = a7;
  *(_QWORD *)(v8 + 144) = v7;
  *(_QWORD *)(v8 + 120) = a3;
  *(_QWORD *)(v8 + 128) = a6;
  *(_BYTE *)(v8 + 27) = a5;
  *(_BYTE *)(v8 + 26) = a4;
  *(_BYTE *)(v8 + 25) = a2;
  *(_QWORD *)(v8 + 112) = a1;
  v9 = sub_21776B790(&qword_253F26E30);
  *(_QWORD *)(v8 + 152) = v9;
  *(_QWORD *)(v8 + 160) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 168) = swift_task_alloc();
  *(_QWORD *)(v8 + 176) = swift_task_alloc();
  *(_QWORD *)(v8 + 184) = *(_QWORD *)(type metadata accessor for DatabaseRecord() - 8);
  *(_QWORD *)(v8 + 192) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217807098()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  char v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void *v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t ObjectType;
  _QWORD *v35;
  uint64_t v36;
  uint64_t (*v38)(id, uint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v39;

  if (*(_BYTE *)(v0 + 27) == 1)
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    v1 = sub_217847ED8();
    sub_21776F584(v1, (uint64_t)qword_253F28FE8);
    v2 = sub_217847EC0();
    v3 = sub_217848280();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = *(_BYTE *)(v0 + 26);
      v5 = *(_QWORD *)(v0 + 120);
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      *(_DWORD *)v6 = 136315138;
      v39 = v7;
      *(_QWORD *)(v0 + 16) = v5;
      *(_BYTE *)(v0 + 24) = v4 & 1;
      v8 = sub_217847FE0();
      *(_QWORD *)(v0 + 64) = sub_2177D06AC(v8, v9, &v39);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      v10 = "Performing import with tombstoning with batch: %s";
LABEL_10:
      _os_log_impl(&dword_217765000, v2, v3, v10, v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v7, -1, -1);
      MEMORY[0x219A13268](v6, -1, -1);
    }
  }
  else
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    v11 = sub_217847ED8();
    sub_21776F584(v11, (uint64_t)qword_253F28FE8);
    v2 = sub_217847EC0();
    v3 = sub_217848280();
    if (os_log_type_enabled(v2, v3))
    {
      v12 = *(_BYTE *)(v0 + 26);
      v13 = *(_QWORD *)(v0 + 120);
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      *(_DWORD *)v6 = 136315138;
      v39 = v7;
      *(_QWORD *)(v0 + 32) = v13;
      *(_BYTE *)(v0 + 40) = v12 & 1;
      v14 = sub_217847FE0();
      *(_QWORD *)(v0 + 96) = sub_2177D06AC(v14, v15, &v39);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      v10 = "Performing import, given predicate with batch: %s";
      goto LABEL_10;
    }
  }

  if (qword_253F26CA0 != -1)
    swift_once();
  v16 = *(void **)(v0 + 112);
  v17 = sub_217847ED8();
  *(_QWORD *)(v0 + 200) = sub_21776F584(v17, (uint64_t)qword_253F28FE8);
  v18 = v16;
  v19 = sub_217847EC0();
  v20 = sub_21784828C();
  v21 = os_log_type_enabled(v19, v20);
  v22 = *(void **)(v0 + 112);
  if (v21)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412290;
    *(_QWORD *)(v0 + 80) = v22;
    v25 = v22;
    sub_2178484E4();
    *v24 = v22;

    _os_log_impl(&dword_217765000, v19, v20, "Doing remote record query with predicate %@", v23, 0xCu);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v24, -1, -1);
    MEMORY[0x219A13268](v23, -1, -1);
  }
  else
  {

    v19 = *(NSObject **)(v0 + 112);
  }
  v26 = *(_BYTE *)(v0 + 26);

  v27 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v28 = (void *)sub_217847F74();
  v29 = objc_msgSend(v27, sel_initWithEntityName_, v28);
  *(_QWORD *)(v0 + 208) = v29;

  if ((v26 & 1) == 0)
    objc_msgSend(v29, sel_setFetchLimit_, *(_QWORD *)(v0 + 120));
  v30 = *(_QWORD *)(v0 + 144);
  v31 = *(_QWORD *)(v0 + 112);
  v32 = (void *)sub_2178480C4();
  objc_msgSend(v29, sel_setRelationshipKeyPathsForPrefetching_, v32);

  objc_msgSend(v29, sel_setPredicate_, v31);
  *(_QWORD *)(v0 + 216) = *(_QWORD *)(v30 + 112);
  v33 = *(_QWORD *)(v30 + 120);
  *(_QWORD *)(v0 + 224) = v33;
  ObjectType = swift_getObjectType();
  *(_QWORD *)(v0 + 232) = ObjectType;
  v38 = (uint64_t (*)(id, uint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(**(int **)(v33 + 48)
                                                                                        + *(_QWORD *)(v33 + 48));
  v35 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v35;
  v36 = type metadata accessor for RemoteRecord();
  *(_QWORD *)(v0 + 248) = v36;
  *v35 = v0;
  v35[1] = sub_2178075DC;
  return v38(v29, v36, &off_253F262D8, &off_24D80EB68, ObjectType, v33);
}

uint64_t sub_2178075DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 256) = a1;
  *(_QWORD *)(v3 + 264) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217807648()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint8_t *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 272) = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 184);
    v4 = *(_QWORD *)(v0 + 160);
    v28 = *(_QWORD *)(v0 + 152);
    v30 = MEMORY[0x24BEE4AF8];
    sub_2177AD7E4(0, v2, 0);
    v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v27 = *(_QWORD *)(v4 + 72);
    v6 = v30;
    do
    {
      v7 = *(_QWORD *)(v0 + 192);
      v9 = *(_QWORD *)(v0 + 168);
      v8 = *(_QWORD *)(v0 + 176);
      sub_2177FD53C(v5, v8, &qword_253F26E30);
      v10 = *(int *)(v28 + 48);
      v11 = v9 + v10;
      sub_217811450(v8 + v10, v11, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      sub_2177969C4(v11, v7, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      sub_21776F518(v8, &qword_253F26E30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2177AD7E4(0, *(_QWORD *)(v6 + 16) + 1, 1);
        v6 = v30;
      }
      v13 = *(_QWORD *)(v6 + 16);
      v12 = *(_QWORD *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_2177AD7E4(v12 > 1, v13 + 1, 1);
        v6 = v30;
      }
      *(_QWORD *)(v0 + 352) = v6;
      v14 = *(_QWORD *)(v0 + 192);
      *(_QWORD *)(v6 + 16) = v13 + 1;
      sub_2177969C4(v14, v6+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v13, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v5 += v27;
      --v2;
    }
    while (v2);
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v15;
    *v15 = v0;
    v15[1] = sub_21780797C;
    return sub_21780B080(v6, *(_BYTE *)(v0 + 25), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  }
  else
  {
    v17 = *(void **)(v0 + 112);
    swift_bridgeObjectRelease();
    v18 = v17;
    v19 = sub_217847EC0();
    v20 = sub_2178482B0();
    v21 = os_log_type_enabled(v19, v20);
    v22 = *(void **)(v0 + 208);
    v23 = *(void **)(v0 + 112);
    if (v21)
    {
      v29 = *(void **)(v0 + 208);
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v24 = 138412290;
      *(_QWORD *)(v0 + 72) = v23;
      v26 = v23;
      sub_2178484E4();
      *v25 = v23;

      _os_log_impl(&dword_217765000, v19, v20, "Query to sync store returned empty for predicate: %@", v24, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v25, -1, -1);
      v23 = v29;
      MEMORY[0x219A13268](v24, -1, -1);
    }
    else
    {

    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_21780797C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v5;
  _QWORD *v7;

  v7 = (_QWORD *)*v3;
  v7[36] = a1;
  v7[37] = a2;
  v7[38] = a3;
  swift_task_dealloc();
  v5 = (_QWORD *)swift_task_alloc();
  v7[39] = v5;
  *v5 = v7;
  v5[1] = sub_2178079F0;
  return sub_21780DE24(a1);
}

uint64_t sub_2178079F0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217807A48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t KeyPath;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  __int128 v23;

  v2 = *(_QWORD *)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(unsigned __int8 *)(v0 + 27);
  v5 = sub_217806958(*(_QWORD *)(v0 + 352));
  swift_release();
  *(_QWORD *)(v0 + 320) = sub_217839AA0(v5);
  swift_bridgeObjectRelease();
  v6 = sub_217806958(v3);
  *(_QWORD *)(v0 + 328) = sub_217839AA0(v6);
  swift_bridgeObjectRelease();
  v7 = sub_217806958(v2);
  *(_QWORD *)(v0 + 336) = sub_217839AA0(v7);
  swift_bridgeObjectRelease();
  v8 = sub_217806958(v1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 344) = sub_217839AA0(v8);
  swift_bridgeObjectRelease();
  if (v4 == 1)
  {
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 360) = v9;
    *v9 = v0;
    v9[1] = sub_217807CC4;
    return sub_21780E634(*(_QWORD *)(v0 + 288));
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 320);
    v12 = *(_QWORD *)(v0 + 328);
    v13 = *(_QWORD *)(v0 + 224);
    v14 = *(_BYTE *)(v0 + 27);
    v23 = *(_OWORD *)(v0 + 336);
    KeyPath = swift_getKeyPath();
    v16 = sub_21780AECC(KeyPath, v11);
    swift_bridgeObjectRelease();
    swift_release();
    v17 = objc_allocWithZone(MEMORY[0x24BDBB678]);
    v18 = (void *)sub_217847F74();
    v19 = objc_msgSend(v17, sel_initWithEntityName_, v18);
    *(_QWORD *)(v0 + 376) = v19;

    objc_msgSend(v19, sel_setPredicate_, v16);
    v20 = swift_allocObject();
    swift_weakInit();
    v21 = swift_allocObject();
    *(_QWORD *)(v0 + 384) = v21;
    *(_QWORD *)(v21 + 16) = v20;
    *(_QWORD *)(v21 + 24) = v12;
    *(_BYTE *)(v21 + 32) = v14;
    *(_OWORD *)(v21 + 40) = v23;
    *(_QWORD *)&v23 = **(int **)(v13 + 72) + *(_QWORD *)(v13 + 72);
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v22;
    *v22 = v0;
    v22[1] = sub_217807EB8;
    return ((uint64_t (*)(id, id (*)(void *, void *), uint64_t, _QWORD, _UNKNOWN **, _QWORD, _QWORD))v23)(v19, sub_217811430, v21, *(_QWORD *)(v0 + 248), &off_24D80EB68, *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 224));
  }
}

uint64_t sub_217807CC4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217807D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t KeyPath;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(_BYTE *)(v0 + 27);
  v14 = *(_OWORD *)(v0 + 336);
  KeyPath = swift_getKeyPath();
  v6 = sub_21780AECC(KeyPath, v1);
  swift_bridgeObjectRelease();
  swift_release();
  v7 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v8 = (void *)sub_217847F74();
  v9 = objc_msgSend(v7, sel_initWithEntityName_, v8);
  *(_QWORD *)(v0 + 376) = v9;

  objc_msgSend(v9, sel_setPredicate_, v6);
  v10 = swift_allocObject();
  swift_weakInit();
  v11 = swift_allocObject();
  *(_QWORD *)(v0 + 384) = v11;
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v2;
  *(_BYTE *)(v11 + 32) = v4;
  *(_OWORD *)(v11 + 40) = v14;
  *(_QWORD *)&v14 = **(int **)(v3 + 72) + *(_QWORD *)(v3 + 72);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v12;
  *v12 = v0;
  v12[1] = sub_217807EB8;
  return ((uint64_t (*)(id, id (*)(void *, void *), uint64_t, _QWORD, _UNKNOWN **, _QWORD, _QWORD))v14)(v9, sub_217811430, v11, *(_QWORD *)(v0 + 248), &off_24D80EB68, *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 224));
}

uint64_t sub_217807EB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_217807F2C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v13;
  void *v14;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1 = sub_217847EC0();
  v2 = sub_217848280();
  if (os_log_type_enabled(v1, v2))
  {
    v14 = *(void **)(v0 + 376);
    v4 = *(_QWORD *)(v0 + 288);
    v3 = *(_QWORD *)(v0 + 296);
    v5 = *(void **)(v0 + 208);
    v13 = *(unsigned __int8 *)(v0 + 27);
    v6 = swift_slowAlloc();
    *(_DWORD *)v6 = 134218496;
    v7 = *(_QWORD *)(v4 + 16);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = v7;
    sub_2178484E4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2048;
    v8 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 56) = v8;
    sub_2178484E4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 1024;
    *(_DWORD *)(v0 + 28) = v13;
    sub_2178484E4();
    _os_log_impl(&dword_217765000, v1, v2, "Successfully imported %ld records, had %ld unsupported records, did tombstone? %{BOOL}d", (uint8_t *)v6, 0x1Cu);
    v9 = v6;
    v10 = v14;
    MEMORY[0x219A13268](v9, -1, -1);
  }
  else
  {
    v10 = *(void **)(v0 + 376);
    v5 = *(void **)(v0 + 208);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v0 + 272);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
}

uint64_t sub_217808104()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  os_log_type_t type;
  NSObject *log;

  v1 = *(void **)(v0 + 112);
  v2 = *(void **)(v0 + 264);
  sub_2177B9F34(0, v2, 0, 0);
  v3 = v1;
  v4 = v2;
  v5 = v3;
  v6 = v2;
  v7 = sub_217847EC0();
  v8 = sub_217848298();
  if (os_log_type_enabled(v7, v8))
  {
    type = v8;
    v9 = *(void **)(v0 + 112);
    log = v7;
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412546;
    v12 = v2;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 104) = v13;
    sub_2178484E4();
    *v11 = v13;

    *(_WORD *)(v10 + 12) = 2112;
    *(_QWORD *)(v0 + 88) = v9;
    v14 = v9;
    sub_2178484E4();
    v11[1] = v9;

    _os_log_impl(&dword_217765000, log, type, "Failed query: %@ for predicate: %@, batch size: none", (uint8_t *)v10, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v11, -1, -1);
    MEMORY[0x219A13268](v10, -1, -1);

  }
  else
  {
    v15 = *(void **)(v0 + 112);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_217808330()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  os_log_type_t type;
  NSObject *log;

  v1 = *(void **)(v0 + 208);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v2 = *(void **)(v0 + 112);
  v3 = *(void **)(v0 + 368);
  sub_2177B9F34(0, v3, 0, 0);
  v4 = v2;
  v5 = v3;
  v6 = v4;
  v7 = v3;
  v8 = sub_217847EC0();
  v9 = sub_217848298();
  if (os_log_type_enabled(v8, v9))
  {
    type = v9;
    v10 = *(void **)(v0 + 112);
    log = v8;
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412546;
    v13 = v3;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 104) = v14;
    sub_2178484E4();
    *v12 = v14;

    *(_WORD *)(v11 + 12) = 2112;
    *(_QWORD *)(v0 + 88) = v10;
    v15 = v10;
    sub_2178484E4();
    v12[1] = v10;

    _os_log_impl(&dword_217765000, log, type, "Failed query: %@ for predicate: %@, batch size: none", (uint8_t *)v11, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v12, -1, -1);
    MEMORY[0x219A13268](v11, -1, -1);

  }
  else
  {
    v16 = *(void **)(v0 + 112);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_2178085A0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  os_log_type_t type;
  NSObject *log;

  v1 = *(void **)(v0 + 376);
  v2 = *(void **)(v0 + 208);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(void **)(v0 + 112);
  v4 = *(void **)(v0 + 400);
  sub_2177B9F34(0, v4, 0, 0);
  v5 = v3;
  v6 = v4;
  v7 = v5;
  v8 = v4;
  v9 = sub_217847EC0();
  v10 = sub_217848298();
  if (os_log_type_enabled(v9, v10))
  {
    type = v10;
    v11 = *(void **)(v0 + 112);
    log = v9;
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412546;
    v14 = v4;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 104) = v15;
    sub_2178484E4();
    *v13 = v15;

    *(_WORD *)(v12 + 12) = 2112;
    *(_QWORD *)(v0 + 88) = v11;
    v16 = v11;
    sub_2178484E4();
    v13[1] = v11;

    _os_log_impl(&dword_217765000, log, type, "Failed query: %@ for predicate: %@, batch size: none", (uint8_t *)v12, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v13, -1, -1);
    MEMORY[0x219A13268](v12, -1, -1);

  }
  else
  {
    v17 = *(void **)(v0 + 112);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_2178087F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t);
  _BYTE v22[24];

  v1 = sub_21776B790((uint64_t *)&unk_253F259D0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v22[-v5];
  v7 = sub_217847E3C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v22[-v12];
  v14 = v0 + OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastImportProgressDate;
  swift_beginAccess();
  sub_2177FD53C(v14, (uint64_t)v6, (uint64_t *)&unk_253F259D0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21776F518((uint64_t)v6, (uint64_t *)&unk_253F259D0);
    sub_217847E24();
    v15 = 1;
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
    swift_beginAccess();
    sub_21777F244((uint64_t)v4, v14);
    swift_endAccess();
    return v15;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v13, v6, v7);
  sub_217847E24();
  result = sub_217847DC4();
  if ((~*(_QWORD *)&v17 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v17 < 9.22337204e18)
  {
    v18 = (uint64_t)v17;
    v19 = (void *)sub_217847F74();
    v20 = IMBagIntValueWithDefault();

    v21 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
    v21(v11, v7);
    v21(v13, v7);
    return v20 <= v18;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_217808A58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  sub_21776B790((uint64_t *)&unk_253F259D0);
  v3[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217808AB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t KeyPath;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void *v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  int *v26;
  _QWORD *v27;
  int *v29;

  v1 = v0[19];
  KeyPath = swift_getKeyPath();
  v3 = sub_2177E7D88(KeyPath, 1);
  swift_release();
  v4 = swift_getKeyPath();
  v5 = sub_2177E8190(v4, 0xD000000000000012, 0x8000000217851720);
  swift_release();
  sub_21776B790((uint64_t *)&unk_253F25E30);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21784E420;
  *(_QWORD *)(v6 + 32) = v3;
  *(_QWORD *)(v6 + 40) = v5;
  sub_2178480F4();
  v7 = objc_allocWithZone(MEMORY[0x24BDD14C0]);
  sub_2177E905C();
  v8 = v3;
  v9 = v5;
  v10 = (void *)sub_2178480C4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v7, sel_initWithType_subpredicates_, 1, v10);
  v0[21] = v11;

  v12 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v13 = (void *)sub_217847F74();
  v14 = objc_msgSend(v12, sel_initWithEntityName_, v13);
  v0[22] = v14;

  objc_msgSend(v14, sel_setFetchLimit_, 100);
  objc_msgSend(v14, sel_setPredicate_, v11);
  v0[23] = OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastImportProgressDate;
  v0[24] = *(_QWORD *)(v1 + 112);
  v15 = *(_QWORD *)(v1 + 120);
  v0[25] = v15;
  v0[26] = swift_getObjectType();
  v0[27] = *(_QWORD *)(v15 + 56);
  if (qword_253F26CA0 != -1)
    swift_once();
  v16 = (void *)v0[21];
  v17 = sub_217847ED8();
  v0[28] = sub_21776F584(v17, (uint64_t)qword_253F28FE8);
  v18 = v16;
  v19 = sub_217847EC0();
  v20 = sub_21784828C();
  v21 = os_log_type_enabled(v19, v20);
  v22 = (void *)v0[21];
  if (v21)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412290;
    v0[16] = v22;
    v25 = v22;
    sub_2178484E4();
    *v24 = v22;

    _os_log_impl(&dword_217765000, v19, v20, "Running RemoteRecord query for completed message GUIDs with predicate %@", v23, 0xCu);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v24, -1, -1);
    MEMORY[0x219A13268](v23, -1, -1);
  }
  else
  {

    v19 = v0[21];
  }
  v26 = (int *)v0[27];

  v29 = (int *)((char *)v26 + *v26);
  v27 = (_QWORD *)swift_task_alloc();
  v0[29] = v27;
  *v27 = v0;
  v27[1] = sub_217808E44;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v29)(v0[22], v0[26], v0[25]);
}

uint64_t sub_217808E44(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 240) = a1;
  *(_QWORD *)(v3 + 248) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217808EB0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v1 = *(_QWORD *)(v0 + 240);
  if (*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    v2 = sub_217847EC0();
    v3 = sub_2178482B0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v4 = 134217984;
      *(_QWORD *)(v0 + 112) = *(_QWORD *)(v1 + 16);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217765000, v2, v3, "Found %ld message GUIDs to look for stragglers for", v4, 0xCu);
      MEMORY[0x219A13268](v4, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v8;
    *(_QWORD *)v8 = v0;
    *(_QWORD *)(v8 + 8) = sub_21780908C;
    v9 = *(_QWORD *)(v0 + 240);
    v10 = *(_OWORD *)(v0 + 136);
    *(_QWORD *)(v8 + 88) = *(_QWORD *)(v0 + 152);
    *(_OWORD *)(v8 + 72) = v10;
    *(_BYTE *)(v8 + 136) = 2;
    *(_QWORD *)(v8 + 64) = v9;
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = sub_217847EC0();
    v6 = sub_2178482B0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_217765000, v5, v6, "No completed message GUIDs found to search for straggling sub records for", v7, 2u);
      MEMORY[0x219A13268](v7, -1, -1);
    }

  }
  return swift_task_switch();
}

uint64_t sub_21780908C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2178090E4()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t (*v18)(id, id (*)(uint64_t, void *), uint64_t, uint64_t, _UNKNOWN **, _QWORD, _QWORD);

  swift_bridgeObjectRetain();
  v1 = sub_217847EC0();
  v2 = sub_2178482B0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = v0[30];
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 134217984;
    v0[13] = *(_QWORD *)(v3 + 16);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217765000, v1, v2, "Marking %ld messages as being re-written", v4, 0xCu);
    MEMORY[0x219A13268](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v5 = v0[30];
  v6 = v0[25];
  v0[11] = 1684632935;
  v0[12] = 0xE400000000000000;
  sub_21784801C();
  sub_21776B790((uint64_t *)&unk_253F26FA0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21784AF40;
  *(_QWORD *)(v7 + 56) = sub_21776B790(&qword_253F26DB8);
  *(_QWORD *)(v7 + 32) = v5;
  swift_bridgeObjectRetain();
  v8 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_2178480C4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_predicateWithFormat_argumentArray_, v8, v9);

  swift_bridgeObjectRelease();
  v11 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v12 = (void *)sub_217847F74();
  v13 = objc_msgSend(v11, sel_initWithEntityName_, v12);
  v0[33] = v13;

  objc_msgSend(v13, sel_setPredicate_, v10);
  v14 = swift_allocObject();
  v0[34] = v14;
  swift_weakInit();
  v18 = (uint64_t (*)(id, id (*)(uint64_t, void *), uint64_t, uint64_t, _UNKNOWN **, _QWORD, _QWORD))(**(int **)(v6 + 72) + *(_QWORD *)(v6 + 72));
  v15 = (_QWORD *)swift_task_alloc();
  v0[35] = v15;
  v16 = type metadata accessor for RemoteRecord();
  *v15 = v0;
  v15[1] = sub_2178093C0;
  return v18(v13, sub_217811524, v14, v16, &off_24D80EB68, v0[26], v0[25]);
}

uint64_t sub_2178093C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_217809434()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void *v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int *v31;
  _QWORD *v32;
  _QWORD *v33;
  int *v34;

  if ((sub_2178087F8() & 1) != 0)
  {
    v1 = sub_217847EC0();
    v2 = sub_2178482B0();
    if (os_log_type_enabled(v1, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_217765000, v1, v2, "Broadcasting import progress", v3, 2u);
      MEMORY[0x219A13268](v3, -1, -1);
    }
    v4 = *(_QWORD *)(v0 + 184);
    v6 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 160);

    sub_217847E24();
    v7 = sub_217847E3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
    swift_beginAccess();
    sub_21777F244(v5, v6 + v4);
    swift_endAccess();
    return swift_task_switch();
  }
  else
  {
    v9 = *(void **)(v0 + 288);
    sub_2177C0FC4();
    if (v9)
    {
      v10 = v9;
      v11 = v9;
      v12 = v9;
      v13 = sub_217847EC0();
      v14 = sub_217848280();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        v33 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v15 = 138412290;
        v16 = v10;
        v17 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 120) = v17;
        sub_2178484E4();
        *v33 = v17;

        _os_log_impl(&dword_217765000, v13, v14, "Importer stopping work due to %@", v15, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v33, -1, -1);
        MEMORY[0x219A13268](v15, -1, -1);
      }
      else
      {

      }
      v28 = *(void **)(v0 + 264);
      v30 = *(void **)(v0 + 168);
      v29 = *(void **)(v0 + 176);

      swift_willThrow();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {

      if (qword_253F26CA0 != -1)
        swift_once();
      v18 = *(void **)(v0 + 168);
      v19 = sub_217847ED8();
      *(_QWORD *)(v0 + 224) = sub_21776F584(v19, (uint64_t)qword_253F28FE8);
      v20 = v18;
      v21 = sub_217847EC0();
      v22 = sub_21784828C();
      v23 = os_log_type_enabled(v21, v22);
      v24 = *(void **)(v0 + 168);
      if (v23)
      {
        v25 = (uint8_t *)swift_slowAlloc();
        v26 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v25 = 138412290;
        *(_QWORD *)(v0 + 128) = v24;
        v27 = v24;
        sub_2178484E4();
        *v26 = v24;

        _os_log_impl(&dword_217765000, v21, v22, "Running RemoteRecord query for completed message GUIDs with predicate %@", v25, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v26, -1, -1);
        MEMORY[0x219A13268](v25, -1, -1);
      }
      else
      {

        v21 = *(NSObject **)(v0 + 168);
      }
      v31 = *(int **)(v0 + 216);

      v34 = (int *)((char *)v31 + *v31);
      v32 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 232) = v32;
      *v32 = v0;
      v32[1] = sub_217808E44;
      return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v34)(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 200));
    }
  }
}

uint64_t sub_2178098BC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 296) = *(_QWORD *)(*(_QWORD *)(v0 + 136)
                                    + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_217809910()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 296);
  swift_beginAccess();
  *(_QWORD *)(v0 + 304) = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v0 + 312) = *(_QWORD *)(v1 + 128);
  *(_BYTE *)(v0 + 344) = *(_BYTE *)(v1 + 136);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21780997C()
{
  uint64_t v0;

  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore), *(_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore + 24));
  return swift_task_switch();
}

uint64_t sub_2178099CC()
{
  uint64_t v0;

  sub_21781F1D8(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 312), 0);
  return swift_task_switch();
}

uint64_t sub_217809A0C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 312);
  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
  sub_2178408CC(v3, v2, v1);
  return swift_task_switch();
}

uint64_t sub_217809A8C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  void *v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int *v24;
  _QWORD *v25;
  _QWORD *v26;
  int *v27;

  v1 = *(void **)(v0 + 288);
  sub_2177C0FC4();
  if (v1)
  {
    v2 = v1;
    v3 = v1;
    v4 = v1;
    v5 = sub_217847EC0();
    v6 = sub_217848280();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v8 = v2;
      v9 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 120) = v9;
      sub_2178484E4();
      *v26 = v9;

      _os_log_impl(&dword_217765000, v5, v6, "Importer stopping work due to %@", v7, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v26, -1, -1);
      MEMORY[0x219A13268](v7, -1, -1);
    }
    else
    {

    }
    v20 = *(void **)(v0 + 264);
    v22 = *(void **)(v0 + 168);
    v21 = *(void **)(v0 + 176);

    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {

    if (qword_253F26CA0 != -1)
      swift_once();
    v10 = *(void **)(v0 + 168);
    v11 = sub_217847ED8();
    *(_QWORD *)(v0 + 224) = sub_21776F584(v11, (uint64_t)qword_253F28FE8);
    v12 = v10;
    v13 = sub_217847EC0();
    v14 = sub_21784828C();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(void **)(v0 + 168);
    if (v15)
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      *(_QWORD *)(v0 + 128) = v16;
      v19 = v16;
      sub_2178484E4();
      *v18 = v16;

      _os_log_impl(&dword_217765000, v13, v14, "Running RemoteRecord query for completed message GUIDs with predicate %@", v17, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v18, -1, -1);
      MEMORY[0x219A13268](v17, -1, -1);
    }
    else
    {

      v13 = *(NSObject **)(v0 + 168);
    }
    v24 = *(int **)(v0 + 216);

    v27 = (int *)((char *)v24 + *v24);
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v25;
    *v25 = v0;
    v25[1] = sub_217808E44;
    return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v27)(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 200));
  }
}

uint64_t sub_217809E04()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 320) = *(_QWORD *)(*(_QWORD *)(v0 + 136)
                                    + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_217809E58()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 320);
  swift_beginAccess();
  *(_QWORD *)(v0 + 328) = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v0 + 336) = *(_QWORD *)(v1 + 128);
  *(_BYTE *)(v0 + 345) = *(_BYTE *)(v1 + 136);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_217809EC4()
{
  uint64_t v0;

  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore), *(_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore + 24));
  return swift_task_switch();
}

uint64_t sub_217809F14()
{
  uint64_t v0;

  sub_21781F1D8(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336), 0);
  return swift_task_switch();
}

uint64_t sub_217809F54()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(v0 + 345);
  v3 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 336);
  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
  sub_2178408CC(v3, v2, v1);
  return swift_task_switch();
}

uint64_t sub_217809FD4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 168);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21780A018()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 168);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21780A058()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 264);
  v3 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 176);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21780A0AC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 88) = v4;
  *(_BYTE *)(v5 + 136) = a2;
  *(_QWORD *)(v5 + 64) = a1;
  *(_QWORD *)(v5 + 72) = a3;
  return swift_task_switch();
}

uint64_t sub_21780A0CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _DWORD *v15;
  _QWORD *v17;

  if (!*(_QWORD *)(*(_QWORD *)(v0 + 64) + 16))
    return (*(uint64_t (**)(void))(v0 + 8))();
  sub_21780FCE4(*(_BYTE *)(v0 + 136));
  *(_QWORD *)(v0 + 96) = v1;
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 104) = v2;
  if (!v2)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = 0;
  while (1)
  {
    *(_QWORD *)(v0 + 112) = v3;
    v4 = *(_QWORD *)(v0 + 96) + v3;
    v5 = *(unsigned __int8 *)(v4 + 32);
    sub_21780FE20(*(_BYTE *)(v4 + 32));
    *(_QWORD *)(v0 + 120) = v6;
    if (v6)
      break;
    if (qword_253F25D98 != -1)
      swift_once();
    v7 = sub_217847ED8();
    sub_21776F584(v7, (uint64_t)qword_253F28DC8);
    v8 = sub_217847EC0();
    v9 = sub_217848298();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (_DWORD *)swift_slowAlloc();
      *(_QWORD *)(v0 + 16) = swift_slowAlloc();
      *v10 = 136315138;
      __asm { BR              X8 }
    }

    v3 = *(_QWORD *)(v0 + 112) + 1;
    if (v3 == *(_QWORD *)(v0 + 104))
      goto LABEL_16;
  }
  v11 = v6;
  if (qword_253F25D98 != -1)
    swift_once();
  v12 = sub_217847ED8();
  sub_21776F584(v12, (uint64_t)qword_253F28DC8);
  swift_bridgeObjectRetain_n();
  v13 = sub_217847EC0();
  v14 = sub_2178482B0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (_DWORD *)swift_slowAlloc();
    *(_QWORD *)(v0 + 24) = swift_slowAlloc();
    *v15 = 136315650;
    __asm { BR              X9 }
  }

  swift_bridgeObjectRelease_n();
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v17;
  *v17 = v0;
  v17[1] = sub_21780A7AC;
  return sub_217806FEC(v11, v5, 0, 1, 1, *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
}

uint64_t sub_21780A7AC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21780A804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _DWORD *v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(v0 + 112) + 1;
  if (v1 == *(_QWORD *)(v0 + 104))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    while (1)
    {
      *(_QWORD *)(v0 + 112) = v1;
      v3 = *(_QWORD *)(v0 + 96) + v1;
      v4 = *(unsigned __int8 *)(v3 + 32);
      sub_21780FE20(*(_BYTE *)(v3 + 32));
      *(_QWORD *)(v0 + 120) = v5;
      if (v5)
        break;
      if (qword_253F25D98 != -1)
        swift_once();
      v6 = sub_217847ED8();
      sub_21776F584(v6, (uint64_t)qword_253F28DC8);
      v7 = sub_217847EC0();
      v8 = sub_217848298();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (_DWORD *)swift_slowAlloc();
        *(_QWORD *)(v0 + 16) = swift_slowAlloc();
        *v9 = 136315138;
        __asm { BR              X8 }
      }

      v1 = *(_QWORD *)(v0 + 112) + 1;
      if (v1 == *(_QWORD *)(v0 + 104))
        goto LABEL_2;
    }
    v10 = v5;
    if (qword_253F25D98 != -1)
      swift_once();
    v11 = sub_217847ED8();
    sub_21776F584(v11, (uint64_t)qword_253F28DC8);
    swift_bridgeObjectRetain_n();
    v12 = sub_217847EC0();
    v13 = sub_2178482B0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (_DWORD *)swift_slowAlloc();
      *(_QWORD *)(v0 + 24) = swift_slowAlloc();
      *v14 = 136315650;
      __asm { BR              X9 }
    }

    swift_bridgeObjectRelease_n();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v15;
    *v15 = v0;
    v15[1] = sub_21780A7AC;
    return sub_217806FEC(v10, v4, 0, 1, 1, *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  }
}

id sub_21780AECC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_217848544();
  if (!v4)
    return objc_msgSend((id)objc_opt_self(), sel_predicateWithValue_, 1);
  v10 = v3;
  v11 = v4;
  sub_21784801C();
  sub_21776B790((uint64_t *)&unk_253F26FA0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21784AF40;
  *(_QWORD *)(v5 + 56) = sub_21776B790(&qword_253F26DB8);
  *(_QWORD *)(v5 + 32) = a2;
  swift_bridgeObjectRetain();
  v6 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2178480C4();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend((id)objc_opt_self(), sel_predicateWithFormat_argumentArray_, v6, v7, v10, v11);

  return v8;
}

id sub_21780B00C(uint64_t a1, void *a2)
{
  uint64_t Strong;
  id result;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  result = (id)swift_release();
  if (Strong)
    return objc_msgSend(a2, sel_setStatusValue_, 3);
  return result;
}

uint64_t sub_21780B080(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 + 432) = a4;
  *(_QWORD *)(v5 + 440) = v4;
  *(_BYTE *)(v5 + 868) = a2;
  *(_QWORD *)(v5 + 416) = a1;
  *(_QWORD *)(v5 + 424) = a3;
  v6 = type metadata accessor for DatabaseRecord();
  *(_QWORD *)(v5 + 448) = v6;
  *(_QWORD *)(v5 + 456) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 464) = swift_task_alloc();
  *(_QWORD *)(v5 + 472) = swift_task_alloc();
  *(_QWORD *)(v5 + 480) = swift_task_alloc();
  *(_QWORD *)(v5 + 488) = swift_task_alloc();
  *(_QWORD *)(v5 + 496) = swift_task_alloc();
  *(_QWORD *)(v5 + 504) = swift_task_alloc();
  *(_QWORD *)(v5 + 512) = swift_task_alloc();
  *(_QWORD *)(v5 + 520) = swift_task_alloc();
  *(_QWORD *)(v5 + 528) = swift_task_alloc();
  *(_QWORD *)(v5 + 536) = swift_task_alloc();
  *(_QWORD *)(v5 + 544) = swift_task_alloc();
  *(_QWORD *)(v5 + 552) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21780B170()
{
  uint64_t v0;

  if (qword_253F26B38 != -1)
    swift_once();
  *(_QWORD *)(v0 + 560) = qword_253F28FC0;
  return swift_task_switch();
}

uint64_t sub_21780B1D4()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_BYTE *)(v0 + 868) == 2)
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 568) = v1;
    *v1 = v0;
    v1[1] = sub_21780B260;
    return sub_2177A8990(*(_QWORD *)(v0 + 416));
  }
  else
  {
    *(_QWORD *)(v0 + 576) = sub_2177F3354(MEMORY[0x24BEE4AF8]);
    return swift_task_switch();
  }
}

uint64_t sub_21780B260(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_task_dealloc();
  *(_QWORD *)(v3 + 576) = a1;
  return swift_task_switch();
}

uint64_t sub_21780B2B8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 416) + 16);
  *(_QWORD *)(v0 + 584) = v1;
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 456);
    *(_DWORD *)(v0 + 864) = *(_DWORD *)(v3 + 80);
    *(_QWORD *)(v0 + 592) = *(_QWORD *)(v3 + 72);
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = v2;
    do
    {
      *(_QWORD *)(v0 + 688) = v2;
      *(_QWORD *)(v0 + 680) = v5;
      *(_QWORD *)(v0 + 672) = v2;
      *(_QWORD *)(v0 + 664) = v4;
      *(_OWORD *)(v0 + 600) = 0u;
      *(_OWORD *)(v0 + 616) = 0u;
      *(_OWORD *)(v0 + 632) = 0u;
      *(_OWORD *)(v0 + 648) = 0u;
      v6 = *(_QWORD *)(v0 + 552);
      v7 = *(_QWORD *)(v0 + 544);
      sub_217811450(*(_QWORD *)(v0 + 416)+ ((*(unsigned __int8 *)(v0 + 864) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 864))+ *(_QWORD *)(v0 + 592) * v4, v6, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      sub_217811450(v6, v7, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      LODWORD(v6) = swift_getEnumCaseMultiPayload();
      sub_2177A42C0(v7, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v8 = *(_QWORD *)(v0 + 552);
      if ((_DWORD)v6 != 6)
      {
        sub_217811450(v8, *(_QWORD *)(v0 + 528), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
        v15 = (char *)&loc_21780B530 + 4 * byte_21784F7FF[swift_getEnumCaseMultiPayload()];
        __asm { BR              X9 }
      }
      sub_217811450(v8, *(_QWORD *)(v0 + 536), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_2177C1D24(0, *(_QWORD *)(v5 + 16) + 1, 1, v5);
      v10 = *(_QWORD *)(v5 + 16);
      v9 = *(_QWORD *)(v5 + 24);
      if (v10 >= v9 >> 1)
        v5 = sub_2177C1D24(v9 > 1, v10 + 1, 1, v5);
      v11 = *(_QWORD *)(v0 + 592);
      v12 = *(unsigned __int8 *)(v0 + 864);
      v13 = *(_QWORD *)(v0 + 536);
      *(_QWORD *)(v5 + 16) = v10 + 1;
      sub_2177969C4(v13, v5 + ((v12 + 32) & ~v12) + v11 * v10, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if (qword_253F26AF0 != -1)
        swift_once();
      v14 = *(_QWORD *)(v0 + 552);
      swift_beginAccess();
      sub_217800A08(1, 0, 0x6E776F6E6B6E75, 0xE700000000000000, 0);
      swift_endAccess();
      sub_2177A42C0(v14, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v4 = *(_QWORD *)(v0 + 664) + 1;
    }
    while (v4 != *(_QWORD *)(v0 + 584));
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 832) = v2;
  *(_QWORD *)(v0 + 824) = v5;
  *(_QWORD *)(v0 + 816) = v2;
  *(_OWORD *)(v0 + 752) = 0u;
  *(_OWORD *)(v0 + 768) = 0u;
  *(_OWORD *)(v0 + 784) = 0u;
  *(_OWORD *)(v0 + 800) = 0u;
  v16 = *(_QWORD *)(v0 + 584);
  v17 = swift_bridgeObjectRetain();
  v18 = sub_217806644(v17);
  swift_bridgeObjectRelease();
  v19 = sub_217839AA0(v18);
  *(_QWORD *)(v0 + 840) = v19;
  swift_bridgeObjectRelease();
  v20 = v16 - *(_QWORD *)(v19 + 16);
  if (v20 >= 1)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v21 = sub_217847ED8();
    sub_21776F584(v21, (uint64_t)qword_253F28DC8);
    v22 = sub_217847EC0();
    v23 = sub_2178482A4();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v24 = 134217984;
      *(_QWORD *)(v0 + 376) = v20;
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v22, v23, "Found %ld records without GUIDs!", v24, 0xCu);
      MEMORY[0x219A13268](v24, -1, -1);
    }

  }
  v25 = swift_task_alloc();
  *(_QWORD *)(v0 + 848) = v25;
  *(_QWORD *)v25 = v0;
  *(_QWORD *)(v25 + 8) = sub_21780DAA0;
  v26 = *(_BYTE *)(v0 + 868);
  v27 = *(_OWORD *)(v0 + 424);
  *(_QWORD *)(v25 + 88) = *(_QWORD *)(v0 + 440);
  *(_OWORD *)(v25 + 72) = v27;
  *(_BYTE *)(v25 + 136) = v26;
  *(_QWORD *)(v25 + 64) = v19;
  return swift_task_switch();
}

uint64_t sub_21780BC28(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 720) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 869) = a1;
  return swift_task_switch();
}

uint64_t sub_21780BC9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  char v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 552);
  if ((*(_BYTE *)(v0 + 869) & 1) != 0)
  {
    v2 = (uint64_t *)(v0 + 488);
    sub_217811450(v1, *(_QWORD *)(v0 + 488), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v4 = *(_QWORD *)(v0 + 688);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v4 = sub_2177C1D24(0, *(_QWORD *)(v4 + 16) + 1, 1, v4);
    v6 = *(_QWORD *)(v4 + 16);
    v11 = *(_QWORD *)(v4 + 24);
    v7 = v6 + 1;
    if (v6 >= v11 >> 1)
      v4 = sub_2177C1D24(v11 > 1, v6 + 1, 1, v4);
    v9 = *(_QWORD *)(v0 + 680);
    v8 = v4;
  }
  else
  {
    v2 = (uint64_t *)(v0 + 480);
    sub_217811450(v1, *(_QWORD *)(v0 + 480), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    v3 = swift_isUniquelyReferenced_nonNull_native();
    v4 = *(_QWORD *)(v0 + 680);
    if ((v3 & 1) == 0)
      v4 = sub_2177C1D24(0, *(_QWORD *)(v4 + 16) + 1, 1, v4);
    v6 = *(_QWORD *)(v4 + 16);
    v5 = *(_QWORD *)(v4 + 24);
    v7 = v6 + 1;
    if (v6 >= v5 >> 1)
      v4 = sub_2177C1D24(v5 > 1, v6 + 1, 1, v4);
    v8 = *(_QWORD *)(v0 + 688);
    v9 = v4;
  }
  v12 = *v2;
  *(_QWORD *)(v0 + 736) = v8;
  *(_QWORD *)(v0 + 728) = v9;
  v13 = *(_QWORD *)(v0 + 704);
  v14 = *(_QWORD *)(v0 + 696);
  v15 = *(_QWORD *)(v0 + 592);
  v16 = *(unsigned __int8 *)(v0 + 864);
  v17 = *(_QWORD *)(v0 + 424);
  *(_QWORD *)(v4 + 16) = v7;
  sub_2177969C4(v12, v4 + ((v16 + 32) & ~v16) + v15 * v6, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  swift_beginAccess();
  sub_217800A08(1, 1u, v14, v13, 0);
  swift_endAccess();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 744) = *(_QWORD *)(v17 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_21780BE98()
{
  uint64_t v0;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  char v70;
  __int128 v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  sub_217811450(*(_QWORD *)(v0 + 552), *(_QWORD *)(v0 + 520), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2 = *(_QWORD *)(v0 + 672);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v2 = sub_2177C1D24(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2177C1D24(v3 > 1, v4 + 1, 1, v2);
  v5 = *(_QWORD *)(v0 + 592);
  v6 = *(unsigned __int8 *)(v0 + 864);
  v7 = *(_QWORD *)(v0 + 520);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  v87 = v2;
  sub_2177969C4(v7, v2 + ((v6 + 32) & ~v6) + v5 * v4, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  if (qword_253F26CA0 != -1)
    swift_once();
  v8 = *(void **)(v0 + 720);
  v9 = *(_QWORD *)(v0 + 552);
  v11 = *(_QWORD *)(v0 + 504);
  v10 = *(_QWORD *)(v0 + 512);
  v12 = *(_QWORD *)(v0 + 496);
  v89 = sub_217847ED8();
  sub_21776F584(v89, (uint64_t)qword_253F28FE8);
  sub_217811450(v9, v10, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  sub_217811450(v9, v11, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  sub_217811450(v9, v12, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  v13 = v8;
  v14 = v8;
  v15 = sub_217847EC0();
  v16 = sub_217848298();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(void **)(v0 + 720);
  v19 = *(_QWORD *)(v0 + 512);
  if (!v17)
  {
    v30 = *(_QWORD *)(v0 + 496);
    v29 = *(_QWORD *)(v0 + 504);

    sub_2177A42C0(v19, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    sub_2177A42C0(v29, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    sub_2177A42C0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    goto LABEL_23;
  }
  v93 = v16;
  v91 = (_QWORD *)(v0 + 56);
  v88 = (uint64_t *)(v0 + 408);
  v20 = swift_slowAlloc();
  v21 = (_QWORD *)swift_slowAlloc();
  v98 = swift_slowAlloc();
  *(_QWORD *)(v0 + 408) = v98;
  *(_DWORD *)v20 = 138413058;
  v22 = v18;
  v23 = _swift_stdlib_bridgeErrorToNSError();
  *(_QWORD *)(v0 + 392) = v23;
  sub_2178484E4();
  *v21 = v23;

  *(_WORD *)(v20 + 12) = 2080;
  sub_2177A2FD4();
  v24 = *(_QWORD *)(v0 + 120);
  if (v24)
  {
    v25 = *(_QWORD *)(v0 + 128);
    sub_21776E3A4((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
    v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 24))(v24, v25);
    v28 = v27;
    _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 96);
    if (v28)
      goto LABEL_14;
  }
  else
  {
    sub_21776F518(v0 + 96, &qword_254F01EA8);
  }
  swift_bridgeObjectRelease();
  v28 = 0xEA00000000003E64;
  v26 = 0x6975675F6C696E3CLL;
LABEL_14:
  v31 = *(_QWORD *)(v0 + 504);
  v32 = *(_QWORD *)(v0 + 512);
  *(_QWORD *)(v0 + 360) = sub_2177D06AC(v26, v28, v88);
  sub_2178484E4();
  swift_bridgeObjectRelease();
  sub_2177A42C0(v32, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  *(_WORD *)(v20 + 22) = 2080;
  sub_2177A35B4();
  if (v34)
  {
    v35 = v34;
  }
  else
  {
    v33 = 0xD000000000000010;
    v35 = 0x8000000217854350;
  }
  *(_QWORD *)(v0 + 368) = sub_2177D06AC(v33, v35, v88);
  sub_2178484E4();
  swift_bridgeObjectRelease();
  sub_2177A42C0(v31, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  *(_WORD *)(v20 + 32) = 2080;
  sub_2177A2FD4();
  v36 = *(_QWORD *)(v0 + 80);
  if (!v36)
  {
    sub_21776F518((uint64_t)v91, &qword_254F01EA8);
LABEL_21:
    swift_bridgeObjectRelease();
    v40 = 0x8000000217854370;
    v38 = 0xD000000000000010;
    goto LABEL_22;
  }
  v37 = *(_QWORD *)(v0 + 88);
  sub_21776E3A4(v91, *(_QWORD *)(v0 + 80));
  v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 48))(v36, v37);
  v40 = v39;
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v91);
  if (!v40)
    goto LABEL_21;
LABEL_22:
  v41 = *(_QWORD *)(v0 + 496);
  *(_QWORD *)(v0 + 384) = sub_2177D06AC(v38, v40, v88);
  sub_2178484E4();
  swift_bridgeObjectRelease();
  sub_2177A42C0(v41, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  _os_log_impl(&dword_217765000, v15, v93, "Error importing: %@ for record(guid = %s, recordType = %s, recordName = %s)", (uint8_t *)v20, 0x2Au);
  sub_21776B790((uint64_t *)&unk_253F25E10);
  swift_arrayDestroy();
  MEMORY[0x219A13268](v21, -1, -1);
  swift_arrayDestroy();
  MEMORY[0x219A13268](v98, -1, -1);
  MEMORY[0x219A13268](v20, -1, -1);
LABEL_23:

  sub_217806C6C();
  switch(v42)
  {
    case 1:
      v43 = *(_QWORD *)(v0 + 648);
      v99 = v43 + 1;
      if (!__OFADD__(v43, 1))
        goto LABEL_28;
      __break(1u);
LABEL_27:
      v99 = *(_QWORD *)(v0 + 648);
LABEL_28:
      v86 = *(_QWORD *)(v0 + 632);
      goto LABEL_31;
    case 2:
      v44 = *(_QWORD *)(v0 + 632);
      v45 = __OFADD__(v44, 1);
      v46 = v44 + 1;
      if (v45)
      {
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
        JUMPOUT(0x21780CF4CLL);
      }
      v86 = v46;
      v99 = *(_QWORD *)(v0 + 648);
LABEL_31:
      v85 = *(_QWORD *)(v0 + 616);
      goto LABEL_34;
    case 3:
      v47 = *(_QWORD *)(v0 + 616);
      v45 = __OFADD__(v47, 1);
      v48 = v47 + 1;
      if (v45)
        goto LABEL_58;
      v85 = v48;
      v99 = *(_QWORD *)(v0 + 648);
      v86 = *(_QWORD *)(v0 + 632);
LABEL_34:
      v90 = *(_QWORD *)(v0 + 600);
      break;
    case 4:
      v83 = *(_QWORD *)(v0 + 600);
      v45 = __OFADD__(v83, 1);
      v84 = v83 + 1;
      if (v45)
        goto LABEL_59;
      v90 = v84;
      v99 = *(_QWORD *)(v0 + 648);
      v85 = *(_QWORD *)(v0 + 616);
      v86 = *(_QWORD *)(v0 + 632);
      break;
    default:
      goto LABEL_27;
  }
  v49 = *(NSObject **)(v0 + 720);
  v50 = *(_QWORD *)(v0 + 704);
  v51 = *(_QWORD *)(v0 + 696);
  v52 = *(_QWORD *)(v0 + 552);
  *(_QWORD *)(v0 + 320) = 0;
  *(_QWORD *)(v0 + 328) = 0xE000000000000000;
  sub_21784861C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 336) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 344) = 0x8000000217854330;
  sub_21784801C();
  sub_21784801C();
  swift_getErrorValue();
  sub_21778E8D0(*(_QWORD *)(v0 + 208));
  sub_21784801C();
  swift_bridgeObjectRelease();
  sub_2177B9F34(9u, v49, *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 344));
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v53 = v49;
  sub_217800A08(1, 2u, v51, v50, v49);
  swift_endAccess();
  swift_bridgeObjectRelease();

  sub_2177A42C0(v52, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  v97 = *(_QWORD *)(v0 + 688);
  v54 = *(_QWORD *)(v0 + 680);
  v92 = *(_QWORD *)(v0 + 656);
  v94 = *(_QWORD *)(v0 + 640);
  v95 = *(_QWORD *)(v0 + 624);
  v96 = *(_QWORD *)(v0 + 608);
  v55 = *(_QWORD *)(v0 + 664) + 1;
  if (v55 == *(_QWORD *)(v0 + 584))
  {
    v57 = v86;
    v56 = v87;
    v58 = v85;
    v59 = v90;
  }
  else
  {
    v57 = v86;
    v56 = v87;
    v58 = v85;
    v59 = v90;
    do
    {
      *(_QWORD *)(v0 + 688) = v97;
      *(_QWORD *)(v0 + 680) = v54;
      *(_QWORD *)(v0 + 672) = v87;
      *(_QWORD *)(v0 + 664) = v55;
      *(_QWORD *)(v0 + 656) = v92;
      *(_QWORD *)(v0 + 648) = v99;
      *(_QWORD *)(v0 + 640) = v94;
      *(_QWORD *)(v0 + 632) = v86;
      *(_QWORD *)(v0 + 624) = v95;
      *(_QWORD *)(v0 + 616) = v85;
      *(_QWORD *)(v0 + 608) = v96;
      *(_QWORD *)(v0 + 600) = v90;
      v73 = *(_QWORD *)(v0 + 552);
      v74 = *(_QWORD *)(v0 + 544);
      sub_217811450(*(_QWORD *)(v0 + 416)+ ((*(unsigned __int8 *)(v0 + 864) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 864))+ *(_QWORD *)(v0 + 592) * v55, v73, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      sub_217811450(v73, v74, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      LODWORD(v73) = swift_getEnumCaseMultiPayload();
      sub_2177A42C0(v74, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v75 = *(_QWORD *)(v0 + 552);
      if ((_DWORD)v73 != 6)
      {
        sub_217811450(v75, *(_QWORD *)(v0 + 528), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
        v82 = (char *)&loc_21780C99C + dword_21780CF74[swift_getEnumCaseMultiPayload()];
        __asm { BR              X9 }
      }
      sub_217811450(v75, *(_QWORD *)(v0 + 536), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v54 = sub_2177C1D24(0, *(_QWORD *)(v54 + 16) + 1, 1, v54);
      v77 = *(_QWORD *)(v54 + 16);
      v76 = *(_QWORD *)(v54 + 24);
      if (v77 >= v76 >> 1)
        v54 = sub_2177C1D24(v76 > 1, v77 + 1, 1, v54);
      v78 = *(_QWORD *)(v0 + 592);
      v79 = *(unsigned __int8 *)(v0 + 864);
      v80 = *(_QWORD *)(v0 + 536);
      *(_QWORD *)(v54 + 16) = v77 + 1;
      sub_2177969C4(v80, v54 + ((v79 + 32) & ~v79) + v78 * v77, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if (qword_253F26AF0 != -1)
        swift_once();
      v81 = *(_QWORD *)(v0 + 552);
      swift_beginAccess();
      sub_217800A08(1, 0, 0x6E776F6E6B6E75, 0xE700000000000000, 0);
      swift_endAccess();
      sub_2177A42C0(v81, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v55 = *(_QWORD *)(v0 + 664) + 1;
    }
    while (v55 != *(_QWORD *)(v0 + 584));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 832) = v97;
  *(_QWORD *)(v0 + 824) = v54;
  *(_QWORD *)(v0 + 816) = v56;
  *(_QWORD *)(v0 + 808) = v92;
  *(_QWORD *)(v0 + 800) = v99;
  *(_QWORD *)(v0 + 792) = v94;
  *(_QWORD *)(v0 + 784) = v57;
  *(_QWORD *)(v0 + 776) = v95;
  *(_QWORD *)(v0 + 768) = v58;
  *(_QWORD *)(v0 + 760) = v96;
  *(_QWORD *)(v0 + 752) = v59;
  v60 = *(_QWORD *)(v0 + 584);
  v61 = swift_bridgeObjectRetain();
  v62 = sub_217806644(v61);
  swift_bridgeObjectRelease();
  v63 = sub_217839AA0(v62);
  *(_QWORD *)(v0 + 840) = v63;
  swift_bridgeObjectRelease();
  v64 = *(_QWORD *)(v63 + 16);
  v65 = v60 - v64;
  if (v60 > v64)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    sub_21776F584(v89, (uint64_t)qword_253F28DC8);
    v66 = sub_217847EC0();
    v67 = sub_2178482A4();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v68 = 134217984;
      *(_QWORD *)(v0 + 376) = v65;
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v66, v67, "Found %ld records without GUIDs!", v68, 0xCu);
      MEMORY[0x219A13268](v68, -1, -1);
    }

  }
  v69 = swift_task_alloc();
  *(_QWORD *)(v0 + 848) = v69;
  *(_QWORD *)v69 = v0;
  *(_QWORD *)(v69 + 8) = sub_21780DAA0;
  v70 = *(_BYTE *)(v0 + 868);
  v71 = *(_OWORD *)(v0 + 424);
  *(_QWORD *)(v69 + 88) = *(_QWORD *)(v0 + 440);
  *(_OWORD *)(v69 + 72) = v71;
  *(_BYTE *)(v69 + 136) = v70;
  *(_QWORD *)(v69 + 64) = v63;
  return swift_task_switch();
}

uint64_t sub_21780CF90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 744);
  result = swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 120);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 120) = v5;
    swift_release();
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_21780CFFC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(_QWORD *)(v0 + 552);
  sub_217806C6C();
  v3 = v2;
  sub_2177A42C0(v1, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  switch(v3)
  {
    case 1:
      v4 = *(_QWORD *)(v0 + 656);
      v43 = v4 + 1;
      if (!__OFADD__(v4, 1))
        goto LABEL_6;
      __break(1u);
LABEL_5:
      v43 = *(_QWORD *)(v0 + 656);
LABEL_6:
      v5 = *(_QWORD *)(v0 + 640);
      goto LABEL_9;
    case 2:
      v6 = *(_QWORD *)(v0 + 640);
      v5 = v6 + 1;
      if (__OFADD__(v6, 1))
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        JUMPOUT(0x21780DA5CLL);
      }
      v43 = *(_QWORD *)(v0 + 656);
LABEL_9:
      v7 = *(_QWORD *)(v0 + 624);
      v8 = *(_QWORD *)(v0 + 608);
      break;
    case 3:
      v9 = *(_QWORD *)(v0 + 624);
      v7 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_34;
      v43 = *(_QWORD *)(v0 + 656);
      v5 = *(_QWORD *)(v0 + 640);
      v8 = *(_QWORD *)(v0 + 608);
      break;
    case 4:
      v10 = *(_QWORD *)(v0 + 608);
      v8 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_35;
      v43 = *(_QWORD *)(v0 + 656);
      v5 = *(_QWORD *)(v0 + 640);
      v7 = *(_QWORD *)(v0 + 624);
      break;
    default:
      goto LABEL_5;
  }
  v11 = *(_QWORD *)(v0 + 736);
  v12 = *(_QWORD *)(v0 + 728);
  v38 = *(_QWORD *)(v0 + 672);
  v39 = *(_QWORD *)(v0 + 648);
  v40 = *(_QWORD *)(v0 + 632);
  v41 = *(_QWORD *)(v0 + 616);
  v42 = *(_QWORD *)(v0 + 600);
  for (i = *(_QWORD *)(v0 + 664) + 1; i != *(_QWORD *)(v0 + 584); i = *(_QWORD *)(v0 + 664) + 1)
  {
    *(_QWORD *)(v0 + 688) = v11;
    *(_QWORD *)(v0 + 680) = v12;
    *(_QWORD *)(v0 + 672) = v38;
    *(_QWORD *)(v0 + 664) = i;
    *(_QWORD *)(v0 + 656) = v43;
    *(_QWORD *)(v0 + 648) = v39;
    *(_QWORD *)(v0 + 640) = v5;
    *(_QWORD *)(v0 + 632) = v40;
    *(_QWORD *)(v0 + 624) = v7;
    *(_QWORD *)(v0 + 616) = v41;
    *(_QWORD *)(v0 + 608) = v8;
    *(_QWORD *)(v0 + 600) = v42;
    v28 = *(_QWORD *)(v0 + 552);
    v29 = *(_QWORD *)(v0 + 544);
    sub_217811450(*(_QWORD *)(v0 + 416)+ ((*(unsigned __int8 *)(v0 + 864) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 864))+ *(_QWORD *)(v0 + 592) * i, v28, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    sub_217811450(v28, v29, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    LODWORD(v28) = swift_getEnumCaseMultiPayload();
    sub_2177A42C0(v29, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    v30 = *(_QWORD *)(v0 + 552);
    if ((_DWORD)v28 != 6)
    {
      sub_217811450(v30, *(_QWORD *)(v0 + 528), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v37 = (char *)&loc_21780D518 + dword_21780DA84[swift_getEnumCaseMultiPayload()];
      __asm { BR              X9 }
    }
    sub_217811450(v30, *(_QWORD *)(v0 + 536), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_2177C1D24(0, *(_QWORD *)(v12 + 16) + 1, 1, v12);
    v32 = *(_QWORD *)(v12 + 16);
    v31 = *(_QWORD *)(v12 + 24);
    if (v32 >= v31 >> 1)
      v12 = sub_2177C1D24(v31 > 1, v32 + 1, 1, v12);
    v33 = *(_QWORD *)(v0 + 592);
    v34 = *(unsigned __int8 *)(v0 + 864);
    v35 = *(_QWORD *)(v0 + 536);
    *(_QWORD *)(v12 + 16) = v32 + 1;
    sub_2177969C4(v35, v12 + ((v34 + 32) & ~v34) + v33 * v32, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    if (qword_253F26AF0 != -1)
      swift_once();
    v36 = *(_QWORD *)(v0 + 552);
    swift_beginAccess();
    sub_217800A08(1, 0, 0x6E776F6E6B6E75, 0xE700000000000000, 0);
    swift_endAccess();
    sub_2177A42C0(v36, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 832) = v11;
  *(_QWORD *)(v0 + 824) = v12;
  *(_QWORD *)(v0 + 816) = v38;
  *(_QWORD *)(v0 + 808) = v43;
  *(_QWORD *)(v0 + 800) = v39;
  *(_QWORD *)(v0 + 792) = v5;
  *(_QWORD *)(v0 + 784) = v40;
  *(_QWORD *)(v0 + 776) = v7;
  *(_QWORD *)(v0 + 768) = v41;
  *(_QWORD *)(v0 + 760) = v8;
  *(_QWORD *)(v0 + 752) = v42;
  v14 = *(_QWORD *)(v0 + 584);
  v15 = swift_bridgeObjectRetain();
  v16 = sub_217806644(v15);
  swift_bridgeObjectRelease();
  v17 = sub_217839AA0(v16);
  *(_QWORD *)(v0 + 840) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v17 + 16);
  v19 = v14 - v18;
  if (v14 > v18)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v20 = sub_217847ED8();
    sub_21776F584(v20, (uint64_t)qword_253F28DC8);
    v21 = sub_217847EC0();
    v22 = sub_2178482A4();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v23 = 134217984;
      *(_QWORD *)(v0 + 376) = v19;
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v21, v22, "Found %ld records without GUIDs!", v23, 0xCu);
      MEMORY[0x219A13268](v23, -1, -1);
    }

  }
  v24 = swift_task_alloc();
  *(_QWORD *)(v0 + 848) = v24;
  *(_QWORD *)v24 = v0;
  *(_QWORD *)(v24 + 8) = sub_21780DAA0;
  v25 = *(_BYTE *)(v0 + 868);
  v26 = *(_OWORD *)(v0 + 424);
  *(_QWORD *)(v24 + 88) = *(_QWORD *)(v0 + 440);
  *(_OWORD *)(v24 + 72) = v26;
  *(_BYTE *)(v24 + 136) = v25;
  *(_QWORD *)(v24 + 64) = v17;
  return swift_task_switch();
}

uint64_t sub_21780DAA0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21780DB04()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 856) = *(_QWORD *)(*(_QWORD *)(v0 + 424)
                                    + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_21780DB58()
{
  uint64_t v0;

  sub_2177A6600(*(_QWORD *)(v0 + 808), *(_QWORD *)(v0 + 800), 3, 1);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21780DBB0()
{
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_21780DBF0()
{
  uint64_t v0;

  sub_2177A6600(*(_QWORD *)(v0 + 792), *(_QWORD *)(v0 + 784), 3, 2);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21780DC48()
{
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_21780DC88()
{
  uint64_t v0;

  sub_2177A6600(*(_QWORD *)(v0 + 776), *(_QWORD *)(v0 + 768), 3, 3);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21780DCE0()
{
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_21780DD20()
{
  uint64_t v0;

  sub_2177A6600(*(_QWORD *)(v0 + 760), *(_QWORD *)(v0 + 752), 3, 4);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 832), *(_QWORD *)(v0 + 824), *(_QWORD *)(v0 + 816));
}

uint64_t sub_21780DE24(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = type metadata accessor for ActionRecord();
  v2[5] = swift_task_alloc();
  v2[6] = type metadata accessor for MessageRecord();
  v2[7] = swift_task_alloc();
  v2[8] = type metadata accessor for ItemRecord();
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = type metadata accessor for ChatRecord(0);
  v2[12] = swift_task_alloc();
  v3 = sub_217847E3C();
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v4 = type metadata accessor for DatabaseRecord();
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  sub_21776B790((uint64_t *)&unk_253F259D0);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21780DFB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;

  v1 = v0[2];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[14] + 56))(v0[24], 1, 1, v0[13]);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = v0[2] + ((*(unsigned __int8 *)(v0[18] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[18] + 80));
    swift_bridgeObjectRetain();
    v4 = v0[19];
    v3 = v0[20];
    sub_217811450(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    sub_217811450(v3, v4, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    v5 = (char *)&loc_21780E104 + dword_21780E4D4[swift_getEnumCaseMultiPayload()];
    __asm { BR              X9 }
  }
  v6 = (_QWORD *)swift_task_alloc();
  v0[25] = v6;
  *v6 = v0;
  v6[1] = sub_21780E4F0;
  return sub_21780F054(v0[24]);
}

uint64_t sub_21780E4F0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21780E548()
{
  uint64_t v0;

  sub_21776F518(*(_QWORD *)(v0 + 192), (uint64_t *)&unk_253F259D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_21780E634(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = v1;
  v3 = type metadata accessor for DatabaseRecord();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21780E6B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 16);
  *(_QWORD *)(v0 + 112) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 80);
    v3 = *(_DWORD *)(v2 + 80);
    *(_DWORD *)(v0 + 152) = v3;
    v4 = *(_QWORD *)(v2 + 72);
    *(_QWORD *)(v0 + 120) = v4;
    v5 = swift_bridgeObjectRetain();
    v6 = 0;
    while (1)
    {
      *(_QWORD *)(v0 + 128) = v6;
      v8 = *(_QWORD *)(v0 + 96);
      v7 = *(_QWORD *)(v0 + 104);
      sub_217811450(v5 + ((v3 + 32) & ~(unint64_t)v3) + v4 * v6, v7, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      sub_217811450(v7, v8, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if (swift_getEnumCaseMultiPayload() != 6)
      {
        sub_2177A42C0(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
        return swift_task_switch();
      }
      sub_2177A42C0(*(_QWORD *)(v0 + 104), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v9 = *(_QWORD *)(v0 + 112);
      v10 = *(_QWORD *)(v0 + 128) + 1;
      sub_2177A42C0(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if (v10 == v9)
        break;
      v4 = *(_QWORD *)(v0 + 120);
      v6 = *(_QWORD *)(v0 + 128) + 1;
      LOBYTE(v3) = *(_BYTE *)(v0 + 152);
      v5 = *(_QWORD *)(v0 + 56);
    }
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21780E80C()
{
  uint64_t v0;
  char *v1;

  sub_217811450(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  v1 = (char *)sub_21780E870 + 4 * byte_21784F806[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_21780E870()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v2 = v1[11];
  v1[5] = type metadata accessor for ChatLockRecord();
  v1[6] = sub_21776DD28(&qword_254F01E98, (uint64_t (*)(uint64_t))type metadata accessor for ChatLockRecord, (uint64_t)&unk_21784B9D0);
  v3 = sub_21778E764(v0);
  sub_2177969C4(v2, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for ChatLockRecord);
  v4 = v1[8];
  v5 = v1[5];
  v6 = v1[6];
  sub_21776E3A4(v0, v5);
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v6 + 112) + *(_QWORD *)(v6 + 112));
  v7 = (_QWORD *)swift_task_alloc();
  v1[17] = v7;
  *v7 = v1;
  v7[1] = sub_21780EA30;
  return v9(v4 + 176, v5, v6);
}

uint64_t sub_21780EA30()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21780EA94()
{
  uint64_t v0;

  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_21780EAD4()
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

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 128) + 1;
  sub_2177A42C0(*(_QWORD *)(v0 + 104), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  if (v2 == v1)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    while (1)
    {
      v3 = *(_QWORD *)(v0 + 120);
      v4 = *(_QWORD *)(v0 + 128) + 1;
      *(_QWORD *)(v0 + 128) = v4;
      v6 = *(_QWORD *)(v0 + 96);
      v5 = *(_QWORD *)(v0 + 104);
      sub_217811450(*(_QWORD *)(v0 + 56)+ ((*(unsigned __int8 *)(v0 + 152) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 152))+ v3 * v4, v5, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      sub_217811450(v5, v6, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if (swift_getEnumCaseMultiPayload() != 6)
        break;
      sub_2177A42C0(*(_QWORD *)(v0 + 104), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      v7 = *(_QWORD *)(v0 + 112);
      v8 = *(_QWORD *)(v0 + 128) + 1;
      sub_2177A42C0(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
      if (v8 == v7)
        goto LABEL_4;
    }
    sub_2177A42C0(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
    return swift_task_switch();
  }
}

uint64_t sub_21780EC10()
{
  uint64_t v0;

  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21780EC58()
{
  uint64_t v0;

  sub_2177A42C0(*(_QWORD *)(v0 + 104), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_21780ECBC(void *a1, void *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t Strong;
  id result;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  char v22;
  uint64_t v23;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  result = (id)swift_release();
  if (Strong)
  {
    v15 = objc_msgSend(a2, sel_recordName);
    if (!v15)
      return objc_msgSend(a2, sel_setStatusValue_, 999);
    v16 = v15;
    v23 = a7;
    v17 = sub_217847F98();
    v19 = v18;

    if ((sub_21780EE3C(v17, v19, a4) & 1) != 0)
    {
      if ((a5 & 1) != 0)
      {
        v20 = objc_msgSend(a2, sel_data);
        if (v20)
        {
          v21 = v20;
          objc_msgSend(a1, sel_deleteObject_, v20);

        }
      }
      objc_msgSend(a2, sel_setStatusValue_, 1);
    }
    if ((sub_21780EE3C(v17, v19, a6) & 1) != 0)
      objc_msgSend(a2, sel_setStatusValue_, 2);
    v22 = sub_21780EE3C(v17, v19, v23);
    result = (id)swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
      return objc_msgSend(a2, sel_setStatusValue_, 999);
  }
  return result;
}

uint64_t sub_21780EE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_21784897C();
    sub_217848004();
    v6 = sub_2178489A0();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2178488E0() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2178488E0() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_21780EF70(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_217847F98();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_21780EFD0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v7 = sub_217847F74();
  else
    v7 = 0;
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

uint64_t sub_21780F02C(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 8);
  result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0)
    return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(_DWORD)result;
  return result;
}

uint64_t sub_21780F054(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = v1;
  sub_21776B790((uint64_t *)&unk_253F259D0);
  v2[11] = swift_task_alloc();
  v3 = sub_217847E3C();
  v2[12] = v3;
  v2[13] = *(_QWORD *)(v3 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21780F100()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  double v10;
  double v11;
  void (*v12)(uint64_t, uint64_t);
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 88);
  v7 = OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastReloadDate;
  *(_QWORD *)(v0 + 144) = OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastReloadDate;
  v8 = v5 + v7;
  swift_beginAccess();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v9(v2, v8, v3);
  sub_217847E00();
  v11 = v10;
  v12 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v12(v2, v3);
  v13 = fabs(v11);
  sub_2177FD53C(v1, v6, (uint64_t *)&unk_253F259D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3) == 1)
  {
    sub_21776F518(*(_QWORD *)(v0 + 88), (uint64_t *)&unk_253F259D0);
LABEL_3:
    v14 = 3600.0;
    goto LABEL_4;
  }
  v15 = *(_QWORD *)(v0 + 128);
  v16 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 104) + 32))(v15, *(_QWORD *)(v0 + 88), v16);
  sub_217847E00();
  v18 = fabs(v17);
  v12(v15, v16);
  if (v18 >= 172800.0)
  {
    if (v18 >= 604800.0)
    {
      if (v18 >= 1209600.0)
        goto LABEL_3;
      v14 = 600.0;
    }
    else
    {
      v14 = 300.0;
    }
LABEL_4:
    if (v13 <= v14)
      goto LABEL_20;
    goto LABEL_8;
  }
  if (v13 <= 30.0)
  {
LABEL_20:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_8:
  sub_217847E30();
  if (qword_253F26CA0 != -1)
    swift_once();
  v20 = *(_QWORD *)(v0 + 112);
  v19 = *(_QWORD *)(v0 + 120);
  v21 = *(_QWORD *)(v0 + 96);
  v22 = sub_217847ED8();
  sub_21776F584(v22, (uint64_t)qword_253F28FE8);
  v9(v20, v19, v21);
  v23 = sub_217847EC0();
  v24 = sub_2178482B0();
  v25 = os_log_type_enabled(v23, v24);
  v26 = *(_QWORD *)(v0 + 112);
  v27 = *(_QWORD *)(v0 + 96);
  if (v25)
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v39 = v38;
    *(_DWORD *)v28 = 136315138;
    sub_21776DD28((unint64_t *)&unk_254F01B80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v29 = sub_2178488A4();
    *(_QWORD *)(v0 + 64) = sub_2177D06AC(v29, v30, &v39);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    v12(v26, v27);
    _os_log_impl(&dword_217765000, v23, v24, "Reload chat registry at %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v38, -1, -1);
    MEMORY[0x219A13268](v28, -1, -1);
  }
  else
  {
    v12(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  }

  v31 = qword_253F28DB8;
  *(_QWORD *)(v0 + 152) = qword_253F28DB8;
  if (!v31)
  {
    v34 = *(_QWORD *)(v0 + 120);
    v35 = *(_QWORD *)(v0 + 96);
    v36 = *(_QWORD *)(v0 + 104);
    v37 = *(_QWORD *)(v0 + 80) + *(_QWORD *)(v0 + 144);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 40))(v37, v34, v35);
    swift_endAccess();
    goto LABEL_20;
  }
  v32 = qword_253F28DC0;
  *(_QWORD *)(v0 + 160) = qword_253F28DC0;
  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v32 + 128);
  if (qword_253F25B38 != -1)
    swift_once();
  sub_21784819C();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_21780F560()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 168))();
  return swift_task_switch();
}

uint64_t sub_21780F5A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80) + *(_QWORD *)(v0 + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v4, v1, v2);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21780F658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 128);
  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 176);
  v1 = v0 + OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastReloadDate;
  v2 = sub_217847E3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_21776F518(v0 + OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastImportProgressDate, (uint64_t *)&unk_253F259D0);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_21780F6E8()
{
  return type metadata accessor for DatabaseImporter();
}

uint64_t type metadata accessor for DatabaseImporter()
{
  uint64_t result;

  result = qword_253F25B58;
  if (!qword_253F25B58)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21780F72C()
{
  unint64_t v0;
  unint64_t v1;

  sub_217847E3C();
  if (v0 <= 0x3F)
  {
    sub_21776DC78();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_21780F7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _QWORD *v12;
  _BYTE v14[24];
  ValueMetadata *v15;
  _UNKNOWN **v16;
  _QWORD v17[5];

  v8 = sub_217847E3C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17[3] = &type metadata for FileManagerProvider;
  v17[4] = &off_24D809DF8;
  v15 = &type metadata for DatabaseRecordPersistence;
  v16 = &off_24D80C500;
  v17[0] = a3;
  swift_defaultActor_initialize();
  *(_BYTE *)(a4 + 168) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4 + OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastImportProgressDate, 1, 1, v8);
  v12 = (_QWORD *)(a4 + OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_importActivityName);
  *v12 = 0xD00000000000001ELL;
  v12[1] = 0x80000002178542E0;
  *(_QWORD *)(a4 + 112) = a1;
  *(_QWORD *)(a4 + 120) = a2;
  sub_21776E4FC((uint64_t)v17, a4 + 176);
  sub_21776E4FC((uint64_t)v14, a4 + 128);
  sub_217847E30();
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v14);
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v17);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 32))(a4 + OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastReloadDate, v11, v8);
  return a4;
}

uint64_t sub_21780F934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[24];
  ValueMetadata *v15;
  _UNKNOWN **v16;
  _QWORD v17[5];

  v17[3] = &type metadata for FileManagerProvider;
  v17[4] = &off_24D809DF8;
  v15 = &type metadata for DatabaseRecordPersistence;
  v16 = &off_24D80C500;
  v17[0] = a3;
  type metadata accessor for DatabaseImporter();
  v5 = swift_allocObject();
  v6 = sub_21777A080((uint64_t)v17, (uint64_t)&type metadata for FileManagerProvider);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)&v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v9 + 16))(v8);
  v10 = sub_21777A080((uint64_t)v14, (uint64_t)&type metadata for DatabaseRecordPersistence);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(void))(v11 + 16))();
  v12 = sub_21780F7E0(a1, a2, *v8, v5);
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v14);
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v17);
  return v12;
}

uint64_t sub_21780FA70(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[7] = a1;
  v2[8] = a2;
  v2[9] = type metadata accessor for DatabaseRecord();
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

void sub_21780FACC()
{
  uint64_t v0;
  char *v1;

  sub_217811450(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80), (uint64_t (*)(_QWORD))type metadata accessor for DatabaseRecord);
  v1 = (char *)sub_21780FB28 + 4 * byte_21784F80D[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_21780FB28()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t);

  v2 = v1[10];
  v1[5] = type metadata accessor for ChatLockRecord();
  v1[6] = sub_21776DD28(&qword_254F01E98, (uint64_t (*)(uint64_t))type metadata accessor for ChatLockRecord, (uint64_t)&unk_21784B9D0);
  v3 = sub_21778E764(v0);
  sub_2177969C4(v2, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for ChatLockRecord);
  v4 = v1[5];
  v5 = v1[6];
  sub_21776E3A4(v0, v4);
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v5 + 104) + *(_QWORD *)(v5 + 104));
  v6 = (_QWORD *)swift_task_alloc();
  v1[11] = v6;
  *v6 = v1;
  v6[1] = sub_2177A3A28;
  return v8(v1[8], v4, v5);
}

void sub_21780FCE4(char a1)
{
  __asm { BR              X12 }
}

void *sub_21780FD40()
{
  uint64_t v0;
  char v2;

  if (0x80000002178516F0 == (v0 | 0x8000000000000000))
  {
    swift_bridgeObjectRelease();
    return &unk_24D8066D0;
  }
  else
  {
    v2 = sub_2178488E0();
    swift_bridgeObjectRelease();
    if ((v2 & 1) != 0)
      return &unk_24D8066D0;
    else
      return 0;
  }
}

void sub_21780FE20(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21780FE90()
{
  uint64_t v0;
  char v2;
  uint64_t KeyPath;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
    __asm { BR              X12 }
  if (*(_QWORD *)(v0 + 16))
  {
    KeyPath = swift_getKeyPath();
    v4 = sub_21780AECC(KeyPath, v0);
    swift_release();
    v5 = swift_getKeyPath();
    v6 = sub_2177E7D88(v5, 0);
    swift_release();
    sub_21776B790((uint64_t *)&unk_253F25E30);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21784E420;
    *(_QWORD *)(v7 + 32) = v4;
    *(_QWORD *)(v7 + 40) = v6;
    sub_2178480F4();
    v8 = objc_allocWithZone(MEMORY[0x24BDD14C0]);
    sub_2177E905C();
    v9 = v4;
    v10 = v6;
    v11 = (void *)sub_2178480C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_initWithType_subpredicates_, 1, v11);

    swift_getKeyPath();
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t sub_2178102E4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 104) = a3;
  *(_QWORD *)(v4 + 112) = v3;
  *(_QWORD *)(v4 + 96) = a2;
  *(_BYTE *)(v4 + 216) = a1;
  sub_21776B790((uint64_t *)&unk_253F259D0);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  return swift_task_switch();
}

void sub_217810348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;

  v1 = *(unsigned __int8 *)(v0 + 216);
  *(_QWORD *)(v0 + 128) = OBJC_IVAR____TtC17MessagesCloudSync16DatabaseImporter_lastImportProgressDate;
  *(_QWORD *)(v0 + 136) = 0;
  KeyPath = swift_getKeyPath();
  sub_2177E7D88(KeyPath, 0);
  swift_release();
  swift_getKeyPath();
  __asm { BR              X9 }
}

uint64_t sub_2178103DC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;

  v3 = *(unsigned __int8 *)(v2 + 216);
  v4 = sub_2177E8190(v1, 0x72636E4574616863, 0xEF32766465747079);
  swift_release();
  swift_bridgeObjectRelease();
  sub_21776B790((uint64_t *)&unk_253F25E30);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21784E420;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v4;
  sub_2178480F4();
  v6 = objc_allocWithZone(MEMORY[0x24BDD14C0]);
  sub_2177E905C();
  v7 = v0;
  v8 = v4;
  v9 = (void *)sub_2178480C4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v6, sel_initWithType_subpredicates_, 1, v9);
  *(_QWORD *)(v2 + 144) = v10;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 152) = v11;
  *v11 = v2;
  v11[1] = sub_2178105A8;
  if (v3 == 2)
    v12 = 100;
  else
    v12 = 5;
  return sub_217806FEC((uint64_t)v10, *(_BYTE *)(v2 + 216), v12, 0, 1, *(_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 104));
}

uint64_t sub_2178105A8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 144);
  *(_QWORD *)(*(_QWORD *)v1 + 160) = a1;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_21781060C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t KeyPath;
  _QWORD *v22;

  if ((sub_2178087F8() & 1) != 0)
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    v1 = sub_217847ED8();
    sub_21776F584(v1, (uint64_t)qword_253F28FE8);
    v2 = sub_217847EC0();
    v3 = sub_2178482B0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_217765000, v2, v3, "Broadcasting import progress", v4, 2u);
      MEMORY[0x219A13268](v4, -1, -1);
    }
    v5 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 128);
    v7 = *(_QWORD *)(v0 + 112);

    sub_217847E24();
    v8 = sub_217847E3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
    swift_beginAccess();
    sub_21777F244(v5, v7 + v6);
    swift_endAccess();
  }
  else if (*(_QWORD *)(v0 + 160))
  {
    v9 = *(void **)(v0 + 136);
    sub_2177C0FC4();
    if (v9)
    {
      v10 = v9;
      if (qword_253F26CA0 != -1)
        swift_once();
      v11 = sub_217847ED8();
      sub_21776F584(v11, (uint64_t)qword_253F28FE8);
      v12 = v9;
      v13 = v9;
      v14 = sub_217847EC0();
      v15 = sub_217848280();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        v22 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v16 = 138412290;
        v17 = v10;
        v18 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 88) = v18;
        sub_2178484E4();
        *v22 = v18;

        _os_log_impl(&dword_217765000, v14, v15, "Importer stopping work due to %@", v16, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v22, -1, -1);
        MEMORY[0x219A13268](v16, -1, -1);
      }
      else
      {

      }
      swift_willThrow();
      swift_task_dealloc();
      __asm { BR              X0 }
    }
    *(_QWORD *)(v0 + 136) = 0;
    v20 = *(unsigned __int8 *)(v0 + 216);
    KeyPath = swift_getKeyPath();
    sub_2177E7D88(KeyPath, 0);
    swift_release();
    swift_getKeyPath();
    __asm { BR              X9 }
  }
  return swift_task_switch();
}

uint64_t sub_217810B88()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 168) = *(_QWORD *)(*(_QWORD *)(v0 + 96)
                                    + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_217810BDC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 168);
  swift_beginAccess();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v0 + 184) = *(_QWORD *)(v1 + 128);
  *(_BYTE *)(v0 + 217) = *(_BYTE *)(v1 + 136);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_217810C48()
{
  uint64_t v0;

  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore), *(_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore + 24));
  return swift_task_switch();
}

uint64_t sub_217810C98()
{
  uint64_t v0;

  sub_21781F1D8(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), 0);
  return swift_task_switch();
}

uint64_t sub_217810CD8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(v0 + 217);
  v3 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 184);
  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
  sub_2178408CC(v3, v2, v1);
  return swift_task_switch();
}

uint64_t sub_217810D58()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t KeyPath;
  _QWORD *v14;

  if (*(_QWORD *)(v0 + 160))
  {
    v1 = *(void **)(v0 + 136);
    sub_2177C0FC4();
    if (v1)
    {
      v2 = v1;
      if (qword_253F26CA0 != -1)
        swift_once();
      v3 = sub_217847ED8();
      sub_21776F584(v3, (uint64_t)qword_253F28FE8);
      v4 = v1;
      v5 = v1;
      v6 = sub_217847EC0();
      v7 = sub_217848280();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v14 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v8 = 138412290;
        v9 = v2;
        v10 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 88) = v10;
        sub_2178484E4();
        *v14 = v10;

        _os_log_impl(&dword_217765000, v6, v7, "Importer stopping work due to %@", v8, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v14, -1, -1);
        MEMORY[0x219A13268](v8, -1, -1);
      }
      else
      {

      }
      swift_willThrow();
      swift_task_dealloc();
      __asm { BR              X0 }
    }
    *(_QWORD *)(v0 + 136) = 0;
    v12 = *(unsigned __int8 *)(v0 + 216);
    KeyPath = swift_getKeyPath();
    sub_2177E7D88(KeyPath, 0);
    swift_release();
    swift_getKeyPath();
    __asm { BR              X9 }
  }
  return swift_task_switch();
}

uint64_t sub_2178111AC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 192) = *(_QWORD *)(*(_QWORD *)(v0 + 96)
                                    + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_217811200()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 192);
  swift_beginAccess();
  *(_QWORD *)(v0 + 200) = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v0 + 208) = *(_QWORD *)(v1 + 128);
  *(_BYTE *)(v0 + 218) = *(_BYTE *)(v1 + 136);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21781126C()
{
  uint64_t v0;

  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore), *(_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_countStore + 24));
  return swift_task_switch();
}

uint64_t sub_2178112BC()
{
  uint64_t v0;

  sub_21781F1D8(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208), 0);
  return swift_task_switch();
}

uint64_t sub_2178112FC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(v0 + 218);
  v3 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
  sub_2178408CC(v3, v2, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *sub_21781138C()
{
  return sel_recordName;
}

void sub_217811398(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_21780EF70(a1, (SEL *)&selRef_recordName, a2);
}

void sub_2178113B4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_21780EFD0(a1, a2, a3, a4, (SEL *)&selRef_setRecordName_);
}

uint64_t sub_2178113D0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2178113F4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_217811430(void *a1, void *a2)
{
  uint64_t v2;

  return sub_21780ECBC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_217811450(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_217811494()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F26DC0;
  if (!qword_253F26DC0)
  {
    v1 = sub_21777F200(&qword_253F26DB8);
    result = MEMORY[0x219A13184](MEMORY[0x24BEE1718], v1);
    atomic_store(result, (unint64_t *)&qword_253F26DC0);
  }
  return result;
}

char *sub_2178114E0()
{
  return sel_parentID;
}

void sub_2178114EC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_21780EF70(a1, (SEL *)&selRef_parentID, a2);
}

void sub_217811508(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_21780EFD0(a1, a2, a3, a4, (SEL *)&selRef_setParentID_);
}

id sub_217811524(uint64_t a1, void *a2)
{
  return sub_21780B00C(a1, a2);
}

uint64_t getEnumTagSinglePayload for DatabaseImporter.Batch(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DatabaseImporter.Batch(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_21781158C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2178115A8(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseImporter.Batch()
{
  return &type metadata for DatabaseImporter.Batch;
}

uint64_t sub_2178115D8()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for DuplicateCountReadHandler()
{
  return objc_opt_self();
}

uint64_t sub_21781161C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  char v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, char);

  v10 = a6 & 1;
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char))((char *)&dword_254F03020 + dword_254F03020);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v11;
  *v11 = v6;
  v11[1] = sub_21777CB6C;
  return v13(a3, a4, a5, v10);
}

uint64_t sub_2178116A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)&dword_254F03018 + dword_254F03018);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_21777AAD0;
  return v7(a3);
}

uint64_t sub_217811710(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  sub_21776B790(&qword_253F26F00);
  v37 = a2;
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_21784897C();
    sub_217848004();
    result = sub_2178489A0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_217811A18(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;

  v3 = v2;
  v5 = *v2;
  sub_21776B790(&qword_253F26ED8);
  v43 = a2;
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v42 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v40 = v2;
  v41 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v41)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v42 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v41)
        goto LABEL_33;
      v25 = *(_QWORD *)(v42 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v41)
        {
LABEL_33:
          swift_release();
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v42 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v41)
              goto LABEL_33;
            v25 = *(_QWORD *)(v42 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = *(_QWORD *)(v5 + 56) + v31;
    v37 = *(void **)v35;
    v36 = *(_QWORD *)(v35 + 8);
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v38 = v37;
    }
    sub_21784897C();
    sub_217848004();
    result = sub_2178489A0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v37;
    v20[1] = v36;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v40;
  v24 = (_QWORD *)(v5 + 64);
  if ((v43 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_217811D38(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  sub_21776B790((uint64_t *)&unk_253F26F10);
  v38 = a2;
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v21);
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v21);
    v32 = *v31;
    v33 = v31[1];
    if ((v38 & 1) == 0)
    {
      v34 = v30;
      swift_bridgeObjectRetain();
    }
    result = sub_2178484B4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v30;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v18);
    *v19 = v32;
    v19[1] = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21781201C(uint64_t a1, char a2)
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
  sub_21776B790(&qword_253F25C10);
  v6 = sub_217848760();
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
        sub_21776F574(v24, v35);
      }
      else
      {
        sub_21776F4DC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21784897C();
      sub_217848004();
      result = sub_2178489A0();
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
      result = (uint64_t)sub_21776F574(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_217812318(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  char v42;
  char v43;
  uint64_t v44;
  char v45;

  v3 = v2;
  v5 = *v2;
  sub_21776B790((uint64_t *)&unk_253F26EC8);
  v42 = a2;
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v40 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v38 = v2;
  v39 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_33;
      v24 = v40[v13];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_33:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v39)
              goto LABEL_33;
            v24 = v40[v13];
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 48 * v21;
    v34 = *(_QWORD *)v33;
    v35 = *(_BYTE *)(v33 + 8);
    v36 = *(_QWORD *)(v33 + 16);
    v45 = *(_BYTE *)(v33 + 24);
    v44 = *(_QWORD *)(v33 + 32);
    v43 = *(_BYTE *)(v33 + 40);
    if ((v42 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_21784897C();
    sub_217848004();
    result = sub_2178489A0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 48 * v17;
    *(_QWORD *)v19 = v34;
    *(_BYTE *)(v19 + 8) = v35;
    *(_QWORD *)(v19 + 16) = v36;
    *(_BYTE *)(v19 + 24) = v45;
    *(_QWORD *)(v19 + 32) = v44;
    *(_BYTE *)(v19 + 40) = v43;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21781267C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v3 = v2;
  v5 = *v2;
  sub_21776B790((uint64_t *)&unk_253F25C00);
  v6 = sub_217848760();
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_25:
    result = swift_release();
    goto LABEL_26;
  }
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v8 = (_QWORD *)(v5 + 64);
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v10)
  {
    v12 = __clz(__rbit64(v10));
    goto LABEL_18;
  }
  if (v11 > 1)
  {
    v13 = *(_QWORD *)(v5 + 72);
    v14 = 1;
    if (v13)
      goto LABEL_17;
    v14 = 2;
    if (v11 <= 2)
      goto LABEL_19;
    v13 = *(_QWORD *)(v5 + 80);
    if (v13)
    {
LABEL_17:
      v12 = __clz(__rbit64(v13)) + (v14 << 6);
LABEL_18:
      v16 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v12);
      sub_21784897C();
      __asm { BR              X8 }
    }
    v15 = 3;
    if (v11 > 3)
    {
      v13 = *(_QWORD *)(v5 + 88);
      if (v13)
      {
        v14 = 3;
        goto LABEL_17;
      }
      while (1)
      {
        v14 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
          JUMPOUT(0x2178129F0);
        }
        if (v14 >= v11)
          break;
        v13 = v8[v14];
        ++v15;
        if (v13)
          goto LABEL_17;
      }
    }
  }
LABEL_19:
  swift_release();
  if ((a2 & 1) != 0)
  {
    v17 = 1 << *(_BYTE *)(v5 + 32);
    if (v17 >= 64)
      bzero((void *)(v5 + 64), ((unint64_t)(v17 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v8 = -1 << v17;
    v3 = v2;
    *(_QWORD *)(v5 + 16) = 0;
    goto LABEL_25;
  }
  result = swift_release();
  v3 = v2;
LABEL_26:
  *v3 = v6;
  return result;
}

uint64_t sub_217812A00(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  sub_21776B790((uint64_t *)&unk_253F26F20);
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
      v33 = v31;
    result = sub_2178484B4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_217812CCC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  sub_21776B790(&qword_253F25C18);
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_21776F574((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_217788540(v25, (uint64_t)&v38);
      sub_21776F4DC(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_2178485A4();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_21776F574(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_217812FE0(uint64_t a1, char a2)
{
  return sub_2178135F4(a1, a2, (uint64_t *)&unk_253F26EF0);
}

uint64_t sub_217812FEC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v3 = v2;
  v5 = *v2;
  sub_21776B790(&qword_253F25E20);
  result = sub_217848760();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v32 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v32[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v32[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        swift_unknownObjectRetain();
      sub_21784897C();
      sub_217848988();
      result = sub_2178489A0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_2178132C4(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  sub_21776B790(&qword_253F26EC0);
  v42 = a2;
  v6 = sub_217848760();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21784897C();
    sub_217848004();
    result = sub_2178489A0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2178135E8(uint64_t a1, char a2)
{
  return sub_2178135F4(a1, a2, (uint64_t *)&unk_253F26EE0);
}

uint64_t sub_2178135F4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  sub_21776B790(a3);
  v37 = a2;
  v7 = sub_217848760();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21784897C();
    sub_217848004();
    result = sub_2178489A0();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

unint64_t sub_217813904(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_21781394C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a5[6] + 8 * result) = a2;
  v5 = (_QWORD *)(a5[7] + 16 * result);
  *v5 = a3;
  v5[1] = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

_OWORD *sub_217813994(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_21776F574(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_2178139FC(unint64_t result, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v5;
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  v6 = (_OWORD *)(a5[7] + 48 * result);
  v7 = a4[1];
  *v6 = *a4;
  v6[1] = v7;
  *(_OWORD *)((char *)v6 + 25) = *(_OWORD *)((char *)a4 + 25);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_217813A58(unint64_t result, char a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a5[6] + result) = a2;
  v5 = (_QWORD *)(a5[7] + 16 * result);
  *v5 = a3;
  v5[1] = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

_OWORD *sub_217813AA0(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_21776F574(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

unint64_t sub_217813B1C(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = 8 * result;
  *(_QWORD *)(a4[6] + v4) = a2;
  *(_QWORD *)(a4[7] + v4) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

unint64_t sub_217813B64(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

uint64_t sub_217813BB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = v0;
  return swift_task_switch();
}

uint64_t sub_217813BCC()
{
  char *v0;
  int64_t v1;
  unint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  char isUniquelyReferenced_nonNull_native;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  uint64_t *v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;

  v2 = sub_2177B6204();
  if (!v2)
    v2 = sub_2177F36A0(MEMORY[0x24BEE4AF8]);
  v3 = (_QWORD *)v2;
  v56 = v1;
  v54 = (uint64_t *)(v1 + 40);
  v55 = *(_QWORD *)(v1 + 48) + 112;
  swift_beginAccess();
  v57 = *(_QWORD *)v55 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(*(_QWORD *)v55 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(*(_QWORD *)v55 + 64);
  v58 = (unint64_t)(63 - v5) >> 6;
  v59 = *(_QWORD *)v55;
  swift_bridgeObjectRetain();
  v7 = 0;
  while (v6)
  {
    v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v9 = v8 | (v7 << 6);
LABEL_24:
    v13 = (uint64_t *)(*(_QWORD *)(v59 + 48) + 16 * v9);
    v15 = *v13;
    v14 = v13[1];
    v0 = *(char **)(*(_QWORD *)(v59 + 56) + 8 * v9);
    v16 = v3[2];
    swift_bridgeObjectRetain();
    if (v16 && (v17 = sub_2177D0D64(v15, v14), (v18 & 1) != 0))
    {
      v19 = *(_QWORD *)(v3[7] + 8 * v17);
      v20 = __OFADD__(v19, v0);
      v0 += v19;
      if (v20)
        goto LABEL_59;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v23 = sub_2177D0D64(v15, v14);
      v24 = v3[2];
      v25 = (v22 & 1) == 0;
      v26 = v24 + v25;
      if (__OFADD__(v24, v25))
        goto LABEL_60;
      v27 = v22;
      if (v3[3] >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v22 & 1) != 0)
            goto LABEL_6;
        }
        else
        {
          sub_217826CCC();
          if ((v27 & 1) != 0)
            goto LABEL_6;
        }
      }
      else
      {
        sub_217811710(v26, isUniquelyReferenced_nonNull_native);
        v28 = sub_2177D0D64(v15, v14);
        if ((v27 & 1) != (v29 & 1))
          return sub_21784891C();
        v23 = v28;
        if ((v27 & 1) != 0)
          goto LABEL_6;
      }
      v3[(v23 >> 6) + 8] |= 1 << v23;
      v41 = (uint64_t *)(v3[6] + 16 * v23);
      *v41 = v15;
      v41[1] = v14;
      *(_QWORD *)(v3[7] + 8 * v23) = v0;
      v42 = v3[2];
      v20 = __OFADD__(v42, 1);
      v40 = v42 + 1;
      if (v20)
        goto LABEL_61;
    }
    else
    {
      v30 = swift_isUniquelyReferenced_nonNull_native();
      v23 = sub_2177D0D64(v15, v14);
      v32 = v3[2];
      v33 = (v31 & 1) == 0;
      v34 = v32 + v33;
      if (__OFADD__(v32, v33))
      {
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
      v35 = v31;
      if (v3[3] >= v34)
      {
        if ((v30 & 1) != 0)
        {
          if ((v31 & 1) != 0)
            goto LABEL_6;
        }
        else
        {
          sub_217826CCC();
          if ((v35 & 1) != 0)
            goto LABEL_6;
        }
      }
      else
      {
        sub_217811710(v34, v30);
        v36 = sub_2177D0D64(v15, v14);
        if ((v35 & 1) != (v37 & 1))
          return sub_21784891C();
        v23 = v36;
        if ((v35 & 1) != 0)
        {
LABEL_6:
          *(_QWORD *)(v3[7] + 8 * v23) = v0;
          goto LABEL_7;
        }
      }
      v3[(v23 >> 6) + 8] |= 1 << v23;
      v38 = (uint64_t *)(v3[6] + 16 * v23);
      *v38 = v15;
      v38[1] = v14;
      *(_QWORD *)(v3[7] + 8 * v23) = v0;
      v39 = v3[2];
      v20 = __OFADD__(v39, 1);
      v40 = v39 + 1;
      if (v20)
        goto LABEL_58;
    }
    v3[2] = v40;
    swift_bridgeObjectRetain();
LABEL_7:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v10 = v7 + 1;
  if (__OFADD__(v7, 1))
    goto LABEL_57;
  if (v10 >= v58)
  {
LABEL_50:
    swift_release();
    v43 = swift_bridgeObjectRetain();
    sub_2177B6608(v43);
    swift_bridgeObjectRelease();
    v7 = v56;
    goto LABEL_55;
  }
  v11 = *(_QWORD *)(v57 + 8 * v10);
  ++v7;
  if (v11)
    goto LABEL_23;
  v7 = v10 + 1;
  if (v10 + 1 >= v58)
    goto LABEL_50;
  v11 = *(_QWORD *)(v57 + 8 * v7);
  if (v11)
    goto LABEL_23;
  v7 = v10 + 2;
  if (v10 + 2 >= v58)
    goto LABEL_50;
  v11 = *(_QWORD *)(v57 + 8 * v7);
  if (v11)
  {
LABEL_23:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v7 << 6);
    goto LABEL_24;
  }
  v12 = v10 + 3;
  if (v12 >= v58)
    goto LABEL_50;
  v11 = *(_QWORD *)(v57 + 8 * v12);
  if (v11)
  {
    v7 = v12;
    goto LABEL_23;
  }
  while (1)
  {
    v7 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v7 >= v58)
      goto LABEL_50;
    v11 = *(_QWORD *)(v57 + 8 * v7);
    ++v12;
    if (v11)
      goto LABEL_23;
  }
LABEL_62:
  __break(1u);
  swift_once();
  v44 = sub_217847ED8();
  sub_21776F584(v44, (uint64_t)qword_253F28DC8);
  v45 = v0;
  v46 = v0;
  v47 = sub_217847EC0();
  v48 = sub_217848298();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v50 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v49 = 138412290;
    v7 = v56;
    v51 = v0;
    v52 = _swift_stdlib_bridgeErrorToNSError();
    *v54 = v52;
    sub_2178484E4();
    *v50 = v52;

    _os_log_impl(&dword_217765000, v47, v48, "Failed to encode and write duplicates diagnostics file %@", v49, 0xCu);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v50, -1, -1);
    MEMORY[0x219A13268](v49, -1, -1);

  }
  else
  {

  }
LABEL_55:
  *(_QWORD *)v55 = sub_2177F36A0(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_2178141B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 112) = a4;
  *(_QWORD *)(v5 + 96) = a3;
  *(_QWORD *)(v5 + 104) = v4;
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a2;
  return swift_task_switch();
}

uint64_t sub_2178141D4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  os_log_type_t type;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 88);
  if ((*(_BYTE *)(v0 + 112) & 1) == 0)
  {
    v2 = *(void **)(v0 + 96);
    v3 = v1;
    v4 = v2;
    sub_21784846C();
    v5 = (char *)&loc_21781426C + dword_2178149F4[sub_217800010()];
    __asm { BR              X12 }
  }
  v6 = v1;
  if (qword_253F25D98 != -1)
    swift_once();
  v7 = *(_QWORD *)(v0 + 80);
  v8 = sub_217847ED8();
  sub_21776F584(v8, (uint64_t)qword_253F28DC8);
  sub_21776E4FC(v7, v0 + 16);
  v9 = v1;
  v10 = v1;
  v11 = sub_217847EC0();
  v12 = sub_217848298();
  v13 = os_log_type_enabled(v11, v12);
  v15 = *(void **)(v0 + 88);
  v14 = *(void **)(v0 + 96);
  if (v13)
  {
    v16 = swift_slowAlloc();
    v24 = (os_log_t)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v26 = v25;
    *(_DWORD *)v16 = 136315394;
    v17 = sub_21776E3A4((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    type = v12;
    v19 = *v17;
    v18 = v17[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = sub_2177D06AC(v19, v18, &v26);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
    *(_WORD *)(v16 + 12) = 2112;
    v20 = v1;
    v21 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 56) = v21;
    sub_2178484E4();
    v24->isa = (Class)v21;
    sub_2177DE2F8(v15, v14, 1);
    sub_2177DE2F8(v15, v14, 1);
    _os_log_impl(&dword_217765000, v11, type, "Read from %s encountered error: %@", (uint8_t *)v16, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v25, -1, -1);
    MEMORY[0x219A13268](v16, -1, -1);

    sub_2177DE2F8(v15, v14, 1);
  }
  else
  {
    sub_2177DE2F8(*(void **)(v0 + 88), *(void **)(v0 + 96), 1);
    _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
    sub_2177DE2F8(v15, v14, 1);
    sub_2177DE2F8(v15, v14, 1);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217814A18(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for SyncZoneOperationErrors(uint64_t a1)
{
  return sub_217814A40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_217814A40(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s17MessagesCloudSync23SyncZoneOperationErrorsOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_217814A18(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SyncZoneOperationErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_217814A18(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_217814A40(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SyncZoneOperationErrors(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_217814A40(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncZoneOperationErrors(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SyncZoneOperationErrors(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_217814BC4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_217814BCC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SyncZoneOperationErrors()
{
  return &type metadata for SyncZoneOperationErrors;
}

uint64_t destroy for SyncZoneInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SyncZoneInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SyncZoneInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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
  v4 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SyncZoneInfo(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SyncZoneInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  v5 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncZoneInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncZoneInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncZoneInfo()
{
  return &type metadata for SyncZoneInfo;
}

uint64_t sub_217814F44(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8 = sub_21776B790((uint64_t *)&unk_253F24E80);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2178481B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  *(_QWORD *)(v12 + 32) = a3;
  *(_QWORD *)(v12 + 40) = a4;
  *(_QWORD *)(v12 + 48) = a1;
  *(_BYTE *)(v12 + 56) = a2 & 1;
  swift_retain();
  sub_2177B7E8C(a1, a2 & 1);
  sub_217771C20((uint64_t)v10, (uint64_t)&unk_254F03030, v12);
  return swift_release();
}

uint64_t sub_217815034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;

  *(_BYTE *)(v7 + 48) = a7;
  *(_QWORD *)(v7 + 24) = a5;
  *(_QWORD *)(v7 + 32) = a6;
  *(_QWORD *)(v7 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_217815054()
{
  uint64_t v0;

  sub_21784819C();
  *(_QWORD *)(v0 + 40) = sub_217848190();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_2178150BC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);

  v1 = *(_BYTE *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(void (**)(uint64_t, _QWORD))(v0 + 16);
  swift_release();
  v3(v2, v1 & 1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_217815108(int a1, id a2, char a3, void *a4, uint64_t a5)
{
  char v6;
  id v9;
  void *v10;

  if ((a3 & 1) != 0)
  {
    v9 = a2;
    v10 = (void *)sub_217847CB0();
    LOBYTE(a4) = objc_msgSend(a4, sel_wasMissingKeys_, v10);
    sub_2177CB870(a2);

    if ((a4 & 1) == 0)
      return;
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  swift_beginAccess();
  *(_BYTE *)(a5 + 16) = v6;
}

uint64_t sub_2178151A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v8 = sub_21776B790(&qword_253F26D28);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(_QWORD *)(v12 + ((v10 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  swift_retain();
  sub_2178483E8();
  v13 = (_QWORD *)(a4 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase);
  v14 = *(_QWORD *)(a4 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 24);
  v15 = v13[4];
  sub_21776E3A4(v13, v14);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 8))(a2, v14, v15);
}

uint64_t sub_2178152DC()
{
  swift_beginAccess();
  sub_21776B790(&qword_253F26D28);
  return sub_217848178();
}

uint64_t sub_217815338()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21776B790(&qword_253F26D28);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2178153B0()
{
  sub_21776B790(&qword_253F26D28);
  return sub_2178152DC();
}

uint64_t sub_217815414()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_2177BB174(*(id *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

uint64_t sub_21781544C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_BYTE *)(v0 + 56);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_21777AAD0;
  *(_BYTE *)(v4 + 48) = v3;
  *(_QWORD *)(v4 + 32) = v2;
  *(_OWORD *)(v4 + 16) = v5;
  return swift_task_switch();
}

void sub_2178154C4(void *a1, char a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    if (qword_253F25D98 != -1)
      swift_once();
    v4 = sub_217847ED8();
    sub_21776F584(v4, (uint64_t)qword_253F28DC8);
    v5 = a1;
    v6 = a1;
    v7 = sub_217847EC0();
    v8 = sub_217848298();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      v11 = a1;
      v12 = _swift_stdlib_bridgeErrorToNSError();
      sub_2178484E4();
      *v10 = v12;
      sub_2177CB870(a1);
      sub_2177CB870(a1);
      _os_log_impl(&dword_217765000, v7, v8, "Query result for counts returned with error: %@", v9, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v10, -1, -1);
      MEMORY[0x219A13268](v9, -1, -1);
    }
    else
    {
      sub_2177CB870(a1);
      sub_2177CB870(a1);
    }

    sub_21776B790(&qword_253F26D30);
    sub_217848178();
    sub_2177CB870(a1);
  }
  else
  {
    sub_21776B790(&qword_253F26D30);
    sub_217848178();
  }
}

void sub_2178156C8()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6B8], 0);
  if (!*MEMORY[0x24BDAC6D0])
  {
    __break(1u);
    goto LABEL_9;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6E8], 0);
  if (!*MEMORY[0x24BDAC6F0])
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6F0], 0);
  if (!*MEMORY[0x24BDAC6F8])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6F8], 1);
  if (!*MEMORY[0x24BDAC6E0])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6E0], 1);
  if (!*MEMORY[0x24BDAC6D8])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6D8], 0);
  if (*MEMORY[0x24BDAC670])
  {
    xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x24BDAC670], 750000000);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_217815820()
{
  sub_217815B34(0, 1);
}

void sub_21781582C(int64_t a1, uint64_t a2)
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5F0], a1);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5B8], *MEMORY[0x24BDAC600]);
  if ((unsigned __int128)(a2 * (__int128)3600) >> 64 != (3600 * a2) >> 63)
  {
    __break(1u);
    goto LABEL_9;
  }
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5D8], 3600 * a2);
  if (!*MEMORY[0x24BDAC6D0])
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC598], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6E8], 0);
  if (!*MEMORY[0x24BDAC6F0])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6F0], 0);
  if (!*MEMORY[0x24BDAC6F8])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6F8], 1);
  if (!*MEMORY[0x24BDAC6E0])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6E0], 1);
  if (*MEMORY[0x24BDAC6D8])
  {
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6D8], 1);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_2178159D4()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6B8], 1);
  if (!*MEMORY[0x24BDAC700])
  {
    __break(1u);
    goto LABEL_9;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC700], 1);
  if (!*MEMORY[0x24BDAC6D0])
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6E8], 0);
  if (!*MEMORY[0x24BDAC6F0])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6F0], 0);
  if (!*MEMORY[0x24BDAC6F8])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6F8], 0);
  if (!*MEMORY[0x24BDAC6E0])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6E0], 1);
  if (*MEMORY[0x24BDAC6D8])
  {
    xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6D8], 0);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_217815B28()
{
  sub_217815B34(1, 0);
}

void sub_217815B34(char a1, char a2)
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6B8], 0);
  if (!*MEMORY[0x24BDAC6D0])
  {
    __break(1u);
    goto LABEL_8;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC598], a1 & 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6E8], 0);
  if (!*MEMORY[0x24BDAC6F0])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6F0], 0);
  if (!*MEMORY[0x24BDAC6F8])
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6F8], a1 & 1);
  if (!*MEMORY[0x24BDAC6E0])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6E0], 1);
  if (*MEMORY[0x24BDAC6D8])
  {
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6D8], a2 & 1);
    return;
  }
LABEL_11:
  __break(1u);
}

void sub_217815C78()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6B8], 0);
  if (!*MEMORY[0x24BDAC6D8])
  {
    __break(1u);
    goto LABEL_6;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6D8], 1);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x24BDAC5B8], *MEMORY[0x24BDAC600]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC598], 0);
  if (!*MEMORY[0x24BDAC6F0])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6F0], 0);
  if (*MEMORY[0x24BDAC6D0])
  {
    xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x24BDAC6D0], 1);
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t destroy for ImportStragglersStep(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ImportStragglersStep(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ImportStragglersStep(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ImportStragglersStep(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for ImportStragglersStep()
{
  return &type metadata for ImportStragglersStep;
}

uint64_t sub_217815F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_254F03058 + dword_254F03058);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21777AAD0;
  return v7(a1, a2);
}

uint64_t sub_217815FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(v2 + 24);
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_254F03050 + dword_254F03050);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21777DCC4;
  return v9(a1, a2, v6);
}

uint64_t sub_21781602C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v5;
  *v5 = v2;
  v5[1] = sub_21777E548;
  return sub_217823614(a1, a2, 0, 0, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/MessagesCloudSync/SyncSteps/ImportStragglersStep.swift", 112, 2);
}

uint64_t sub_2178160CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v5;
  *v5 = v2;
  v5[1] = sub_21777E698;
  return sub_217823614(a1, a2, 0, 0, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/MessagesCloudSync/SyncSteps/ImportStragglersStep.swift", 112, 2);
}

uint64_t sub_21781616C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  return swift_task_switch();
}

uint64_t sub_217816188()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17[2];

  v1 = v0[14];
  v2 = *(void **)(v1 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_delegate);
  if (v2)
  {
    v17[0] = 0x2E636E7973;
    v17[1] = 0xE500000000000000;
    sub_21776E3A4((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
    sub_2177F4440();
    swift_unknownObjectRetain();
    sub_21784801C();
    swift_bridgeObjectRelease();
    sub_21784801C();
    sub_217847E6C();
    sub_21777F28C();
    sub_2178488A4();
    sub_21784801C();
    swift_bridgeObjectRelease();
    v3 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
    v4 = (void *)sub_217847E54();
    objc_msgSend(v2, sel_syncCoordinatorWaitingForImportToFinishWithName_identifier_, v3, v4);
    swift_unknownObjectRelease();

  }
  if (qword_253F26CA0 != -1)
    swift_once();
  v5 = sub_217847ED8();
  v0[17] = sub_21776F584(v5, (uint64_t)qword_253F28FE8);
  swift_unknownObjectRetain_n();
  v6 = sub_217847EC0();
  v7 = sub_2178482B0();
  v8 = os_log_type_enabled(v6, v7);
  v9 = v0[14];
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v17[0] = swift_slowAlloc();
    v11 = v17[0];
    *(_DWORD *)v10 = 136315138;
    sub_21776E3A4((_QWORD *)(v9 + 16), *(_QWORD *)(v9 + 40));
    v12 = sub_2177F4440();
    v0[13] = sub_2177D06AC(v12, v13, v17);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_217765000, v6, v7, "Import Stragglers Step start for job: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v11, -1, -1);
    MEMORY[0x219A13268](v10, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  if (qword_253F26AF0 != -1)
    swift_once();
  v14 = qword_253F28FB8;
  swift_beginAccess();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
  v15 = (_QWORD *)swift_task_alloc();
  v0[18] = v15;
  *v15 = v0;
  v15[1] = sub_2178164D4;
  return sub_217808A58(v0[14], v0[15]);
}

uint64_t sub_2178164D4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_217816540()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  swift_unknownObjectRetain_n();
  v1 = sub_217847EC0();
  v2 = sub_2178482B0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 112);
    v4 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v15 = v14;
    *(_DWORD *)v4 = 136315394;
    sub_21776E3A4((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
    v5 = sub_2177F4440();
    *(_QWORD *)(v0 + 88) = sub_2177D06AC(v5, v6, &v15);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v4 + 12) = 2080;
    swift_beginAccess();
    v7 = swift_bridgeObjectRetain();
    v8 = sub_21780040C(v7);
    v10 = v9;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 96) = sub_2177D06AC(v8, v10, &v15);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217765000, v1, v2, "Import Stragglers Step summary for job: %s, %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v14, -1, -1);
    MEMORY[0x219A13268](v4, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  swift_beginAccess();
  v11 = swift_bridgeObjectRetain();
  v12 = sub_217800688(v11);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v12, 0);
}

uint64_t sub_217816774()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_217816780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_21776B790((uint64_t *)&unk_253F259D0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v9);
  }
}

uint64_t sub_21781680C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_217816818(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = sub_21776B790((uint64_t *)&unk_253F259D0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for UnknownRecord()
{
  uint64_t result;

  result = qword_253F26A68;
  if (!qword_253F26A68)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2178168CC()
{
  unint64_t v0;

  sub_21776DC78();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_21781694C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_217816984 + 4 * byte_21784FB80[a1]))(0x614E64726F636572, 0xEA0000000000656DLL);
}

uint64_t sub_217816984()
{
  return 0x795464726F636572;
}

uint64_t sub_21781699C()
{
  return 1684632935;
}

uint64_t sub_2178169AC()
{
  return 0x65636976726573;
}

uint64_t sub_2178169C4()
{
  return 0x615465676E616863;
}

uint64_t sub_2178169E0()
{
  return 0x656D614E656E6F7ALL;
}

uint64_t sub_2178169F8()
{
  return 0x6E6F697461657263;
}

unint64_t sub_217816A18()
{
  return 0xD000000000000010;
}

uint64_t sub_217816A40(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[32];

  v3 = sub_21776B790(&qword_254F030A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21776E3A4(a1, a1[3]);
  sub_217817D08();
  sub_2178489C4();
  v8[31] = 0;
  sub_21784882C();
  if (!v1)
  {
    v8[30] = 1;
    sub_21784882C();
    v8[29] = 2;
    sub_21784882C();
    v8[28] = 3;
    sub_21784882C();
    v8[27] = 4;
    sub_21784882C();
    v8[26] = 5;
    sub_21784882C();
    type metadata accessor for UnknownRecord();
    v8[25] = 6;
    sub_217847E3C();
    sub_21776DD28(&qword_254F01F00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_217848850();
    v8[24] = 7;
    sub_217848850();
    v8[15] = 8;
    sub_21784882C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_217816CD0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD v34[2];
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _QWORD *v40;
  char *v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;

  v37 = a2;
  v3 = sub_21776B790((uint64_t *)&unk_253F259D0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v34 - v7;
  v38 = sub_21776B790(&qword_254F03090);
  v9 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for UnknownRecord();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (_QWORD *)((char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = a1[3];
  v40 = a1;
  sub_21776E3A4(a1, v15);
  sub_217817D08();
  v39 = v11;
  v16 = v41;
  sub_2178489B8();
  if (v16)
    return _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v40);
  v17 = (uint64_t)v8;
  v41 = v6;
  v50 = 0;
  v18 = v38;
  *v14 = sub_2178487A8();
  v14[1] = v19;
  v49 = 1;
  v20 = sub_2178487A8();
  v36 = v9;
  v14[2] = v20;
  v14[3] = v21;
  v48 = 2;
  v14[4] = sub_2178487A8();
  v14[5] = v22;
  v47 = 3;
  v14[6] = sub_2178487A8();
  v35 = v14;
  v14[7] = v23;
  v46 = 4;
  v24 = sub_2178487A8();
  v25 = v35;
  v35[8] = v24;
  v25[9] = v26;
  v45 = 5;
  v25[10] = sub_2178487A8();
  v25[11] = v27;
  sub_217847E3C();
  v44 = 6;
  sub_21776DD28(&qword_253F26948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v34[1] = 0;
  sub_2178487CC();
  sub_21777B58C(v17, (uint64_t)v25 + v12[10]);
  v43 = 7;
  v28 = (uint64_t)v41;
  sub_2178487CC();
  sub_21777B58C(v28, (uint64_t)v25 + v12[11]);
  v42 = 8;
  v29 = sub_2178487A8();
  v31 = v30;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v18);
  v32 = (uint64_t *)((char *)v25 + v12[12]);
  *v32 = v29;
  v32[1] = v31;
  sub_217817D4C((uint64_t)v25, v37);
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v40);
  return sub_217817D90((uint64_t)v25);
}

uint64_t sub_217817260()
{
  unsigned __int8 *v0;

  return sub_21781694C(*v0);
}

uint64_t sub_217817268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_217817F70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21781728C()
{
  sub_217817D08();
  return sub_2178489D0();
}

uint64_t sub_2178172B4()
{
  sub_217817D08();
  return sub_2178489DC();
}

uint64_t sub_2178172DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_217817308()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_217817334()
{
  uint64_t v0;

  return sub_2177A5B08(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_21781734C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217816CD0(a1, a2);
}

uint64_t sub_217817360(_QWORD *a1)
{
  return sub_217816A40(a1);
}

uint64_t sub_217817374(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_21776DD28(&qword_254F03070, (uint64_t (*)(uint64_t))type metadata accessor for UnknownRecord, (uint64_t)&unk_21784FBF0);
  result = sub_21776DD28(&qword_254F03078, (uint64_t (*)(uint64_t))type metadata accessor for UnknownRecord, (uint64_t)&unk_21784FBC8);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2178173D0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  _BYTE *v32;
  _BYTE *v33;
  _BYTE *v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  _BYTE *v47;
  _BYTE *v48;
  _BYTE *v49;
  uint64_t v50;
  _BYTE *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  _BYTE *v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  _BYTE *v75;
  _BYTE *v76;
  _BYTE *v77;
  uint64_t v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  _BYTE *v89;
  _BYTE *v90;
  _BYTE *v91;
  uint64_t v92;
  _BYTE *v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  _QWORD *v102;
  _BYTE *v103;
  _BYTE *v104;
  _BYTE *v105;
  uint64_t v106;
  _BYTE *v107;
  _BYTE *v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  char v112;
  unsigned int (*v113)(uint64_t, uint64_t, uint64_t);
  uint64_t v114;
  int *v115;
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _BYTE *v121;
  char v122;
  void (*v123)(_BYTE *, uint64_t);
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  _QWORD *v127;
  uint64_t v128;
  _BYTE v129[4];
  int v130;
  uint64_t v131;
  unsigned int (*v132)(uint64_t, uint64_t, uint64_t);
  int *v133;
  _BYTE *v134;
  _BYTE *v135;
  _BYTE *v136;
  uint64_t v137;

  v4 = sub_217847E3C();
  v137 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v136 = &v129[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_21776B790(&qword_254F03080);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v135 = &v129[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v129[-v9];
  v11 = sub_21776B790((uint64_t *)&unk_253F259D0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = &v129[-v14];
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = &v129[-v17];
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = &v129[-v20];
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = &v129[-v23];
  MEMORY[0x24BDAC7A8](v22);
  v27 = &v129[-v25];
  v28 = a1[1];
  v29 = a2[1];
  if (!v28)
  {
    if (v29)
      return 0;
    goto LABEL_8;
  }
  if (!v29)
    return 0;
  if (*a1 == *a2 && v28 == v29)
    goto LABEL_8;
  v134 = v24;
  v30 = a1;
  v31 = a2;
  v32 = &v129[-v25];
  v33 = v21;
  v34 = v10;
  v35 = v6;
  v36 = v15;
  v37 = v18;
  v38 = v4;
  v39 = v26;
  v40 = sub_2178488E0();
  v26 = v39;
  v4 = v38;
  v18 = v37;
  v15 = v36;
  v6 = v35;
  v10 = v34;
  v21 = v33;
  v27 = v32;
  a2 = v31;
  a1 = v30;
  v24 = v134;
  v41 = v40;
  result = 0;
  if ((v41 & 1) != 0)
  {
LABEL_8:
    v43 = a1[3];
    v44 = a2[3];
    if (v43)
    {
      if (!v44)
        return 0;
      if (a1[2] != a2[2] || v43 != v44)
      {
        v134 = v24;
        v45 = a1;
        v46 = a2;
        v47 = v27;
        v48 = v21;
        v49 = v10;
        v50 = v6;
        v51 = v15;
        v52 = v18;
        v53 = v4;
        v54 = v26;
        v55 = sub_2178488E0();
        v26 = v54;
        v4 = v53;
        v18 = v52;
        v15 = v51;
        v6 = v50;
        v10 = v49;
        v21 = v48;
        v27 = v47;
        a2 = v46;
        a1 = v45;
        v24 = v134;
        v56 = v55;
        result = 0;
        if ((v56 & 1) == 0)
          return result;
      }
    }
    else if (v44)
    {
      return 0;
    }
    v57 = a1[5];
    v58 = a2[5];
    if (v57)
    {
      if (!v58)
        return 0;
      if (a1[4] != a2[4] || v57 != v58)
      {
        v134 = v24;
        v59 = a1;
        v60 = a2;
        v61 = v27;
        v62 = v21;
        v63 = v10;
        v64 = v6;
        v65 = v15;
        v66 = v18;
        v67 = v4;
        v68 = v26;
        v69 = sub_2178488E0();
        v26 = v68;
        v4 = v67;
        v18 = v66;
        v15 = v65;
        v6 = v64;
        v10 = v63;
        v21 = v62;
        v27 = v61;
        a2 = v60;
        a1 = v59;
        v24 = v134;
        v70 = v69;
        result = 0;
        if ((v70 & 1) == 0)
          return result;
      }
    }
    else if (v58)
    {
      return 0;
    }
    v71 = a1[7];
    v72 = a2[7];
    if (v71)
    {
      if (!v72)
        return 0;
      if (a1[6] != a2[6] || v71 != v72)
      {
        v134 = v24;
        v73 = a1;
        v74 = a2;
        v75 = v27;
        v76 = v21;
        v77 = v10;
        v78 = v6;
        v79 = v15;
        v80 = v18;
        v81 = v4;
        v82 = v26;
        v83 = sub_2178488E0();
        v26 = v82;
        v4 = v81;
        v18 = v80;
        v15 = v79;
        v6 = v78;
        v10 = v77;
        v21 = v76;
        v27 = v75;
        a2 = v74;
        a1 = v73;
        v24 = v134;
        v84 = v83;
        result = 0;
        if ((v84 & 1) == 0)
          return result;
      }
    }
    else if (v72)
    {
      return 0;
    }
    v85 = a1[9];
    v86 = a2[9];
    if (v85)
    {
      if (!v86)
        return 0;
      if (a1[8] != a2[8] || v85 != v86)
      {
        v134 = v24;
        v87 = a1;
        v88 = a2;
        v89 = v27;
        v90 = v21;
        v91 = v10;
        v92 = v6;
        v93 = v15;
        v94 = v18;
        v95 = v4;
        v96 = v26;
        v97 = sub_2178488E0();
        v26 = v96;
        v4 = v95;
        v18 = v94;
        v15 = v93;
        v6 = v92;
        v10 = v91;
        v21 = v90;
        v27 = v89;
        a2 = v88;
        a1 = v87;
        v24 = v134;
        v98 = v97;
        result = 0;
        if ((v98 & 1) == 0)
          return result;
      }
    }
    else if (v86)
    {
      return 0;
    }
    v99 = a1[11];
    v100 = a2[11];
    if (v99)
    {
      if (!v100)
        return 0;
      if (a1[10] != a2[10] || v99 != v100)
      {
        v134 = v24;
        v101 = a1;
        v102 = a2;
        v103 = v27;
        v104 = v21;
        v105 = v10;
        v106 = v6;
        v107 = v15;
        v108 = v18;
        v109 = v4;
        v110 = v26;
        v111 = sub_2178488E0();
        v26 = v110;
        v4 = v109;
        v18 = v108;
        v15 = v107;
        v6 = v106;
        v10 = v105;
        v21 = v104;
        v27 = v103;
        a2 = v102;
        a1 = v101;
        v24 = v134;
        v112 = v111;
        result = 0;
        if ((v112 & 1) == 0)
          return result;
      }
    }
    else if (v100)
    {
      return 0;
    }
    v131 = v26;
    v133 = (int *)type metadata accessor for UnknownRecord();
    sub_21777B5D4((uint64_t)a1 + v133[10], (uint64_t)v27);
    sub_21777B5D4((uint64_t)a2 + v133[10], (uint64_t)v24);
    v134 = &v10[*(int *)(v6 + 48)];
    sub_21777B5D4((uint64_t)v27, (uint64_t)v10);
    sub_21777B5D4((uint64_t)v24, (uint64_t)v134);
    v132 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v137 + 48);
    if (v132((uint64_t)v10, 1, v4) == 1)
    {
      sub_21776F518((uint64_t)v24, (uint64_t *)&unk_253F259D0);
      sub_21776F518((uint64_t)v27, (uint64_t *)&unk_253F259D0);
      v113 = v132;
      if (v132((uint64_t)v134, 1, v4) == 1)
      {
        sub_21776F518((uint64_t)v10, (uint64_t *)&unk_253F259D0);
LABEL_50:
        v115 = v133;
        sub_21777B5D4((uint64_t)a1 + v133[11], (uint64_t)v18);
        sub_21777B5D4((uint64_t)a2 + v115[11], (uint64_t)v15);
        v116 = *(int *)(v6 + 48);
        v117 = v135;
        v118 = (uint64_t)&v135[v116];
        sub_21777B5D4((uint64_t)v18, (uint64_t)v135);
        sub_21777B5D4((uint64_t)v15, v118);
        if (v113((uint64_t)v117, 1, v4) == 1)
        {
          sub_21776F518((uint64_t)v15, (uint64_t *)&unk_253F259D0);
          sub_21776F518((uint64_t)v18, (uint64_t *)&unk_253F259D0);
          if (v113(v118, 1, v4) == 1)
          {
            sub_21776F518((uint64_t)v117, (uint64_t *)&unk_253F259D0);
LABEL_60:
            v124 = v133[12];
            v125 = (_QWORD *)((char *)a1 + v124);
            v126 = *(_QWORD *)((char *)a1 + v124 + 8);
            v127 = (_QWORD *)((char *)a2 + v124);
            v128 = v127[1];
            if (v126)
            {
              if (v128 && (*v125 == *v127 && v126 == v128 || (sub_2178488E0() & 1) != 0))
                return 1;
            }
            else if (!v128)
            {
              return 1;
            }
            return 0;
          }
        }
        else
        {
          v119 = v131;
          sub_21777B5D4((uint64_t)v117, v131);
          if (v113(v118, 1, v4) != 1)
          {
            v121 = v136;
            v120 = v137;
            (*(void (**)(_BYTE *, uint64_t, uint64_t))(v137 + 32))(v136, v118, v4);
            sub_21776DD28(&qword_254F03088, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
            v122 = sub_217847F68();
            v123 = *(void (**)(_BYTE *, uint64_t))(v120 + 8);
            v123(v121, v4);
            sub_21776F518((uint64_t)v15, (uint64_t *)&unk_253F259D0);
            sub_21776F518((uint64_t)v18, (uint64_t *)&unk_253F259D0);
            v123((_BYTE *)v119, v4);
            sub_21776F518((uint64_t)v117, (uint64_t *)&unk_253F259D0);
            if ((v122 & 1) == 0)
              return 0;
            goto LABEL_60;
          }
          sub_21776F518((uint64_t)v15, (uint64_t *)&unk_253F259D0);
          sub_21776F518((uint64_t)v18, (uint64_t *)&unk_253F259D0);
          (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v119, v4);
        }
        v114 = (uint64_t)v117;
LABEL_56:
        sub_21776F518(v114, &qword_254F03080);
        return 0;
      }
    }
    else
    {
      sub_21777B5D4((uint64_t)v10, (uint64_t)v21);
      if (v132((uint64_t)v134, 1, v4) != 1)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v137 + 32))(v136, v134, v4);
        sub_21776DD28(&qword_254F03088, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
        v130 = sub_217847F68();
        v134 = *(_BYTE **)(v137 + 8);
        ((void (*)(_BYTE *, uint64_t))v134)(v136, v4);
        sub_21776F518((uint64_t)v24, (uint64_t *)&unk_253F259D0);
        sub_21776F518((uint64_t)v27, (uint64_t *)&unk_253F259D0);
        ((void (*)(_BYTE *, uint64_t))v134)(v21, v4);
        sub_21776F518((uint64_t)v10, (uint64_t *)&unk_253F259D0);
        v113 = v132;
        if ((v130 & 1) == 0)
          return 0;
        goto LABEL_50;
      }
      sub_21776F518((uint64_t)v24, (uint64_t *)&unk_253F259D0);
      sub_21776F518((uint64_t)v27, (uint64_t *)&unk_253F259D0);
      (*(void (**)(_BYTE *, uint64_t))(v137 + 8))(v21, v4);
    }
    v114 = (uint64_t)v10;
    goto LABEL_56;
  }
  return result;
}

unint64_t sub_217817D08()
{
  unint64_t result;

  result = qword_254F03098;
  if (!qword_254F03098)
  {
    result = MEMORY[0x219A13184](&unk_21784FD20, &type metadata for UnknownRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03098);
  }
  return result;
}

uint64_t sub_217817D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UnknownRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217817D90(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UnknownRecord();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t storeEnumTagSinglePayload for UnknownRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_217817E18 + 4 * byte_21784FB8E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_217817E4C + 4 * byte_21784FB89[v4]))();
}

uint64_t sub_217817E4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217817E54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217817E5CLL);
  return result;
}

uint64_t sub_217817E68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217817E70);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_217817E74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217817E7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnknownRecord.CodingKeys()
{
  return &type metadata for UnknownRecord.CodingKeys;
}

unint64_t sub_217817E9C()
{
  unint64_t result;

  result = qword_254F030A8;
  if (!qword_254F030A8)
  {
    result = MEMORY[0x219A13184](&unk_21784FCF8, &type metadata for UnknownRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F030A8);
  }
  return result;
}

unint64_t sub_217817EE4()
{
  unint64_t result;

  result = qword_254F030B0;
  if (!qword_254F030B0)
  {
    result = MEMORY[0x219A13184](&unk_21784FC68, &type metadata for UnknownRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F030B0);
  }
  return result;
}

unint64_t sub_217817F2C()
{
  unint64_t result;

  result = qword_254F030B8;
  if (!qword_254F030B8)
  {
    result = MEMORY[0x219A13184](&unk_21784FC90, &type metadata for UnknownRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F030B8);
  }
  return result;
}

uint64_t sub_217817F70(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x614E64726F636572 && a2 == 0xEA0000000000656DLL;
  if (v2 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x795464726F636572 && a2 == 0xEA00000000006570 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1684632935 && a2 == 0xE400000000000000 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65636976726573 && a2 == 0xE700000000000000 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x615465676E616863 && a2 == 0xE900000000000067 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656D614E656E6F7ALL && a2 == 0xE800000000000000 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000217851820 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000217851840)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_2178488E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_21781832C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x79646F4274726170;
  else
    v3 = 0x61446574656C6564;
  if (v2)
    v4 = 0xEA00000000006574;
  else
    v4 = 0xE800000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x79646F4274726170;
  else
    v5 = 0x61446574656C6564;
  if ((a2 & 1) != 0)
    v6 = 0xE800000000000000;
  else
    v6 = 0xEA00000000006574;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2178183D4(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000011;
  else
    v3 = 0xD000000000000010;
  if (v2)
    v4 = 0x8000000217851B00;
  else
    v4 = 0x8000000217851B20;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000011;
  else
    v5 = 0xD000000000000010;
  if ((a2 & 1) != 0)
    v6 = 0x8000000217851B20;
  else
    v6 = 0x8000000217851B00;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21781847C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 28789;
  else
    v2 = 29813;
  if ((a2 & 1) != 0)
    v3 = 28789;
  else
    v3 = 29813;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_2178488E0();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_2178184E0(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xED0000746E657365;
  v3 = 0x7250617461446F6ELL;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000018;
    else
      v5 = 0xD000000000000016;
    if (v4 == 1)
      v6 = 0x8000000217851790;
    else
      v6 = 0x80000002178517B0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x7250617461446F6ELL;
  v6 = 0xED0000746E657365;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0xD000000000000018;
    else
      v3 = 0xD000000000000016;
    if (v7 == 1)
      v2 = 0x8000000217851790;
    else
      v2 = 0x80000002178517B0;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2178185F8(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000017;
  else
    v3 = 0x617461646174656DLL;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0x80000002178517F0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000017;
  else
    v5 = 0x617461646174656DLL;
  if ((a2 & 1) != 0)
    v6 = 0x80000002178517F0;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_2178186A0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2178186F0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_217818748 + 4 * byte_21784FD74[a2]))(1702521203);
}

uint64_t sub_217818748(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1702521203 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2178187E4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_217818824(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_217818908 + 4 * byte_21784FD81[a2]))(6518387);
}

uint64_t sub_217818908(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 6518387 && v1 == 0xE300000000000000)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_217818A20(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_217818A58(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)())((char *)sub_217818A90 + 4 * byte_21784FD8E[a2]))();
}

uint64_t sub_217818A90()
{
  uint64_t v0;
  char v1;

  if (v0 == 0xE900000000000032)
    v1 = 1;
  else
    v1 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_217818B20(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEA00000000004449;
  v3 = 0x6E6F737265505A46;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000013;
    else
      v5 = 0xD000000000000017;
    if (v4 == 1)
      v6 = 0x8000000217851EA0;
    else
      v6 = 0x8000000217851EC0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x6E6F737265505A46;
  v6 = 0xEA00000000004449;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0xD000000000000013;
    else
      v3 = 0xD000000000000017;
    if (v7 == 1)
      v2 = 0x8000000217851EA0;
    else
      v2 = 0x8000000217851EC0;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_217818C28(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_217818C68(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_217818CCC + 4 * byte_21784FD97[a2]))(0x7265646E6573);
}

uint64_t sub_217818CCC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7265646E6573 && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_217818D78(char a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  char v6;

  if (a1)
  {
    if (a1 == 1)
      v2 = 0xE800000000000000;
    else
      v2 = 0xE900000000000032;
    v3 = 0x6F746F725067736DLL;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 0xE800000000000000;
      else
        v5 = 0xE900000000000032;
      if (v3 != 0x6F746F725067736DLL)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v2 = 0xE700000000000000;
    v3 = 0x6570795467736DLL;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v5 = 0xE700000000000000;
  if (v3 != 0x6570795467736DLL)
  {
LABEL_15:
    v6 = sub_2178488E0();
    goto LABEL_16;
  }
LABEL_13:
  if (v2 != v5)
    goto LABEL_15;
  v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

void sub_217818E70(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_217818EBC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_217818F74 + 4 * byte_21784FDA3[a2]))(0x72636E4574616863);
}

uint64_t sub_217818F74(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x72636E4574616863 && v1 == 0xEF32766465747079)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_21781907C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x6570795467736DLL;
  else
    v2 = 0x65707954627553;
  if ((a2 & 1) != 0)
    v3 = 0x6570795467736DLL;
  else
    v3 = 0x65707954627553;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_2178488E0();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

void sub_2178190F8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_217819164(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2178191D4 + 4 * byte_21784FDAE[a2]))(0x546E657474697277);
}

uint64_t sub_2178191D4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x546E657474697277 && v1 == 0xEF64756F6C43696FLL)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21781928C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2178192DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2178193E0 + 4 * byte_21784FDBC[a2]))(0x6C6C69666B636142);
}

uint64_t sub_2178193E0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6C6C69666B636142 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21781954C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2178195C0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21781964C + 4 * byte_21784FDCD[a2]))(0xD000000000000010);
}

uint64_t sub_21781964C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000010 && v1 == 0x8000000217851DE0)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_217819710(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_217819774(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21781987C + 4 * byte_21784FDDD[a2]))(0x6C6C69666B636162);
}

uint64_t sub_21781987C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6C6C69666B636162 && v1 == 0xEC000000636E7953)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2178199DC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_217819A2C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_217819AD0 + 4 * byte_21784FDEC[a2]))(0x7374616863);
}

uint64_t sub_217819AD0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7374616863 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_217819BC4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x7972746572;
  else
    v3 = 1701736292;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x7972746572;
  else
    v5 = 1701736292;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

id SyncResumer.__allocating_init(delegate:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___MCSSyncResumer_delegate] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id SyncResumer.init(delegate:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR___MCSSyncResumer_delegate] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SyncResumer();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SyncResumer()
{
  return objc_opt_self();
}

uint64_t sub_217819D94()
{
  uint64_t result;

  if (qword_253F25DC0 != -1)
    swift_once();
  result = sub_21784167C(1u, 0);
  if ((result & 1) != 0)
    return (uint64_t)sub_21781BC3C(MEMORY[0x24BE50C30], "Identity status update, and we stopped syncing due to bad identity status.");
  return result;
}

id sub_217819E90()
{
  return sub_21781BC3C(MEMORY[0x24BE50C20], "Account status update, and we stopped syncing due to bad account status.");
}

id sub_217819EE8()
{
  return sub_21781BC3C(MEMORY[0x24BE50C30], "Identity status update, and we stopped syncing due to bad identity status.");
}

uint64_t sub_217819F94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t inited;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _DWORD *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v0 = sub_217847ED8();
  MEMORY[0x24BDAC7A8](v0);
  if (qword_253F25DC0 != -1)
    swift_once();
  v1 = *MEMORY[0x24BE50C48];
  if (objc_msgSend((id)qword_253F28F00, sel_valueForKey_, *MEMORY[0x24BE50C48]))
  {
    sub_217848538();
    swift_unknownObjectRelease();
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  sub_217787700((uint64_t)&v37, (uint64_t)&v39);
  if (!v41)
    return sub_2177801A8((uint64_t)&v39);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v36 = v0;
    v3 = v43;
    v34 = v42;
    sub_2177F1EC0();
    v4 = (_QWORD *)MEMORY[0x24BE50C40];
    v35 = v39;
    if (v39 == 10)
    {
      v5 = (void *)qword_253F28F00;
      objc_msgSend((id)qword_253F28F00, sel_removeObjectForKey_, v1);
      objc_msgSend(v5, sel_removeObjectForKey_, *v4);
      if (qword_253F25D98 != -1)
        swift_once();
      sub_21776F584(v36, (uint64_t)qword_253F28DC8);
      swift_bridgeObjectRetain_n();
      v6 = sub_217847EC0();
      v7 = sub_217848298();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = swift_slowAlloc();
        v39 = v9;
        *(_DWORD *)v8 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v37 = sub_2177D06AC(v34, v3, &v39);
        sub_2178484E4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_217765000, v6, v7, "Last sync phase %s not recognized, not restarting", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v9, -1, -1);
        MEMORY[0x219A13268](v8, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v39 = 0;
      v40 = 0xE000000000000000;
      sub_21784861C();
      swift_bridgeObjectRelease();
      v39 = 0xD000000000000021;
      v40 = 0x8000000217854460;
      sub_21784801C();
      swift_bridgeObjectRelease();
      sub_21784801C();
      v12 = v39;
      v11 = v40;
      sub_217847F98();
      sub_21776B790(&qword_253F25C60);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21784AF40;
      *(_QWORD *)(inited + 32) = sub_217847F98();
      *(_QWORD *)(inited + 40) = v14;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = v12;
      *(_QWORD *)(inited + 56) = v11;
      swift_bridgeObjectRetain();
      sub_2177F3220(inited);
      v15 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v16 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      v17 = (void *)sub_217847F20();
      swift_bridgeObjectRelease();
      v31 = objc_msgSend(v15, sel_initWithDomain_code_userInfo_, v16, 9, v17);

      v32 = v31;
      sub_2177B9F34(0x12u, v32, v12, v11);

      return swift_bridgeObjectRelease();
    }
    v44 = 1;
    v10 = *MEMORY[0x24BE50C40];
    if (objc_msgSend((id)qword_253F28F00, sel_valueForKey_, *MEMORY[0x24BE50C40]))
    {
      sub_217848538();
      swift_unknownObjectRelease();
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
    }
    sub_217787700((uint64_t)&v37, (uint64_t)&v39);
    if (v41)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v18 = v42 + 1;
        if (__OFADD__(v42, 1))
        {
          __break(1u);
          goto LABEL_46;
        }
        v44 = v42 + 1;
LABEL_25:
        if (v18 < 4)
        {
          swift_bridgeObjectRelease();
          if (qword_253F25D98 != -1)
            swift_once();
          sub_21776F584(v36, (uint64_t)qword_253F28DC8);
          v28 = sub_217847EC0();
          v29 = sub_2178482B0();
          if (os_log_type_enabled(v28, v29))
          {
            v30 = (_DWORD *)swift_slowAlloc();
            v39 = swift_slowAlloc();
            *v30 = 136315394;
            __asm { BR              X9 }
          }

          v33 = (void *)qword_253F28F00;
          swift_beginAccess();
          objc_msgSend(v33, sel_setInteger_forKey_, v44, v10);
          __asm { BR              X10 }
        }
        v19 = (void *)qword_253F28F00;
        objc_msgSend((id)qword_253F28F00, sel_removeObjectForKey_, v1);
        objc_msgSend(v19, sel_removeObjectForKey_, v10);
        if (qword_253F25D98 != -1)
          swift_once();
        sub_21776F584(v36, (uint64_t)qword_253F28DC8);
        v20 = v44;
        swift_bridgeObjectRetain();
        v21 = sub_217847EC0();
        v22 = sub_217848298();
        if (!os_log_type_enabled(v21, v22))
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_42;
        }
        v23 = swift_slowAlloc();
        v24 = swift_slowAlloc();
        v39 = v24;
        *(_DWORD *)v23 = 134218754;
        if (!__OFSUB__(v20, 1))
        {
          v25 = v24;
          *(_QWORD *)&v37 = v20 - 1;
          sub_2178484E4();
          *(_WORD *)(v23 + 12) = 2080;
          if (v20 <= 2)
            v26 = 0;
          else
            v26 = 115;
          if (v20 <= 2)
            v27 = 0xE000000000000000;
          else
            v27 = 0xE100000000000000;
          *(_QWORD *)&v37 = sub_2177D06AC(v26, v27, &v39);
          sub_2178484E4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v23 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v37 = sub_2177D06AC(v34, v3, &v39);
          sub_2178484E4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v23 + 32) = 2048;
          *(_QWORD *)&v37 = 3;
          sub_2178484E4();
          _os_log_impl(&dword_217765000, v21, v22, "We've attempted %ld time%s to do %s sync, but didn't complete. Not retrying again, maxAttempts %ld", (uint8_t *)v23, 0x2Au);
          swift_arrayDestroy();
          MEMORY[0x219A13268](v25, -1, -1);
          MEMORY[0x219A13268](v23, -1, -1);

LABEL_42:
          v39 = 0;
          v40 = 0xE000000000000000;
          sub_21784861C();
          swift_bridgeObjectRelease();
          v39 = 0xD000000000000020;
          v40 = 0x80000002178544B0;
          __asm { BR              X9 }
        }
LABEL_46:
        __break(1u);
        JUMPOUT(0x21781B294);
      }
    }
    else
    {
      sub_2177801A8((uint64_t)&v39);
    }
    v18 = v44;
    goto LABEL_25;
  }
  return result;
}

uint64_t sub_21781B35C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  *(_BYTE *)(v6 + 57) = a6;
  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 40) = a5;
  *(_BYTE *)(v6 + 56) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  if (qword_253F25B38 != -1)
    swift_once();
  sub_21784819C();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_21781B3EC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *v6;

  v1 = *(char *)(v0 + 57);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR___MCSSyncResumer_delegate);
  if (v1 > 8)
    v3 = 81;
  else
    v3 = aFghiqqjqk_0[v1];
  v6 = (char *)&dword_254F02DE8 + dword_254F02DE8;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_21781B490;
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v6)(v2, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(unsigned __int8 *)(v0 + 56), *(_QWORD *)(v0 + 32), v3, 1);
}

uint64_t sub_21781B490()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id SyncResumer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SyncResumer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SyncResumer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SyncResumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21781B5C4(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18[2];
  uint64_t v19;
  unint64_t v20;

  if (qword_253F25DC0 != -1)
    swift_once();
  v4 = (void *)qword_253F28F00;
  v5 = (void *)sub_217847F74();
  v6 = objc_msgSend(v4, sel_stringForKey_, v5);

  if (v6)
  {
    v7 = sub_217847F98();
    v9 = v8;

    v19 = v7;
    v20 = v9;
    if ((v9 & 0x2000000000000000) == 0)
    {
      if ((v7 & 0xFFFFFFFFFFFFLL) == 0)
        goto LABEL_12;
      goto LABEL_9;
    }
  }
  else
  {
    v7 = 0;
    v9 = 0xE000000000000000;
    v19 = 0;
    v20 = 0xE000000000000000;
  }
  if ((v9 & 0xF00000000000000) == 0)
  {
LABEL_12:
    v7 = 0x6C6C69466B636142;
    swift_bridgeObjectRelease();
    v9 = 0xE800000000000000;
    v19 = 0x6C6C69466B636142;
    v20 = 0xE800000000000000;
    goto LABEL_13;
  }
LABEL_9:
  if (v7 == 0x6369646F69726550 && v9 == 0xE800000000000000 || (sub_2178488E0() & 1) != 0)
    goto LABEL_12;
LABEL_13:
  type metadata accessor for SyncCoordinator();
  swift_bridgeObjectRetain();
  static SyncCoordinator.initiateSync(for:delegate:forceRunNow:)(v7, v9, 0);
  swift_bridgeObjectRelease();
  if (qword_253F25D98 != -1)
    swift_once();
  v10 = sub_217847ED8();
  sub_21776F584(v10, (uint64_t)qword_253F28DC8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v11 = sub_217847EC0();
  v12 = sub_2178482B0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18[0] = v17;
    *(_DWORD *)v13 = 136315650;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2177D06AC(v19, v20, v18);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_2177D06AC(a1, a2, v18);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain();
    v14 = sub_217847F38();
    v16 = v15;
    swift_bridgeObjectRelease();
    sub_2177D06AC(v14, v16, v18);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217765000, v11, v12, "Resuming %s from key %s %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v17, -1, -1);
    MEMORY[0x219A13268](v13, -1, -1);
    swift_bridgeObjectRelease();

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
}

id sub_21781BC3C(uint64_t *a1, const char *a2)
{
  void *v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;

  if (qword_253F25DC0 != -1)
    swift_once();
  v4 = (void *)qword_253F28F00;
  v5 = *a1;
  result = objc_msgSend((id)qword_253F28F00, sel_BOOLForKey_, v5);
  if ((_DWORD)result)
  {
    objc_msgSend(v4, sel_removeObjectForKey_, v5);
    if (qword_253F25D98 != -1)
      swift_once();
    v7 = sub_217847ED8();
    sub_21776F584(v7, (uint64_t)qword_253F28DC8);
    v8 = sub_217847EC0();
    v9 = sub_2178482B0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217765000, v8, v9, a2, v10, 2u);
      MEMORY[0x219A13268](v10, -1, -1);
    }

    v11 = sub_217847F98();
    sub_21781B5C4(v11, v12);
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21781BDA0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21781BDC4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  char v11;
  _QWORD *v12;

  v10 = *(_QWORD *)(v4 + 16);
  v11 = *(_BYTE *)(v4 + 24);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v12;
  *v12 = v5;
  v12[1] = sub_21777AAD0;
  return sub_21781B35C(a1, a2, a3, a4, v10, v11);
}

uint64_t method lookup function for SyncResumer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SyncResumer.__allocating_init(delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SyncResumer.systemDidLeaveFirstDataProtectionLock()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of SyncResumer.systemDidUnlock()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SyncResumer.attemptToResumeSyncOnAccountUpdateIfAppropriate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SyncResumer.attemptToResumeSyncOnIdentityUpdateIfAppropriate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SyncResumer.resumeSyncUsing(key:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SyncResumer.attemptToResumeSyncIfAppropriate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t sub_21781BF04(__int16 a1)
{
  char v1;
  __int128 v3;

  v1 = HIBYTE(a1);
  BYTE8(v3) = 0;
  sub_21784861C();
  sub_21784801C();
  sub_217848718();
  sub_21784801C();
  *(_QWORD *)&v3 = v1 & 1;
  sub_217848718();
  return *(_QWORD *)((char *)&v3 + 1);
}

uint64_t sub_21781BFF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return (*a1 == *a2) & (a2[1] ^ a1[1] ^ 1u);
}

uint64_t sub_21781C01C()
{
  unsigned __int8 *v0;
  __int16 v1;

  if (v0[1])
    v1 = 256;
  else
    v1 = 0;
  return sub_21781BF04(v1 | *v0);
}

uint64_t sub_21781C038()
{
  id v0;
  unsigned int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  int v5;
  int v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_isDeviceOnWifi);
  v2 = objc_msgSend(v0, sel_isDeviceOnData);

  if (v2)
    v3 = 2;
  else
    v3 = 0;
  v4 = objc_msgSend(v0, sel_isDeviceCharging);

  if (v4)
    v5 = 0;
  else
    v5 = 256;
  if (v1)
    v6 = 1;
  else
    v6 = v3;
  return v5 | v6;
}

uint64_t storeEnumTagSinglePayload for DeviceState.PowerState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21781C130 + 4 * byte_21784FE45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21781C164 + 4 * byte_21784FE40[v4]))();
}

uint64_t sub_21781C164(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21781C16C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21781C174);
  return result;
}

uint64_t sub_21781C180(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21781C188);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21781C18C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21781C194(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceState.PowerState()
{
  return &type metadata for DeviceState.PowerState;
}

uint64_t storeEnumTagSinglePayload for DeviceState.NetworkState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21781C1FC + 4 * byte_21784FE4F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21781C230 + 4 * byte_21784FE4A[v4]))();
}

uint64_t sub_21781C230(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21781C238(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21781C240);
  return result;
}

uint64_t sub_21781C24C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21781C254);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21781C258(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21781C260(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceState.NetworkState()
{
  return &type metadata for DeviceState.NetworkState;
}

_WORD *initializeBufferWithCopyOfBuffer for DeviceState(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceState(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *((unsigned __int8 *)a1 + 1);
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceState(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21781C368 + 4 * byte_21784FE59[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_21781C39C + 4 * byte_21784FE54[v4]))();
}

uint64_t sub_21781C39C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_21781C3A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x21781C3ACLL);
  return result;
}

uint64_t sub_21781C3B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x21781C3C0);
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_21781C3C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_21781C3CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceState()
{
  return &type metadata for DeviceState;
}

unint64_t sub_21781C3EC()
{
  unint64_t result;

  result = qword_254F03140;
  if (!qword_254F03140)
  {
    result = MEMORY[0x219A13184](&unk_21784FEE0, &type metadata for DeviceState.NetworkState);
    atomic_store(result, (unint64_t *)&qword_254F03140);
  }
  return result;
}

unint64_t sub_21781C434()
{
  unint64_t result;

  result = qword_254F03148;
  if (!qword_254F03148)
  {
    result = MEMORY[0x219A13184](&unk_21784FF48, &type metadata for DeviceState.PowerState);
    atomic_store(result, (unint64_t *)&qword_254F03148);
  }
  return result;
}

uint64_t sub_21781C478(uint64_t a1)
{
  return sub_21781C514(a1, qword_253F28DC8);
}

uint64_t sub_21781C498(uint64_t a1)
{
  return sub_21781C514(a1, qword_253F28FE8);
}

uint64_t sub_21781C4C0(uint64_t a1)
{
  return sub_21781C514(a1, qword_253F28E80);
}

uint64_t sub_21781C4E8(uint64_t a1)
{
  return sub_21781C514(a1, qword_253F28FD0);
}

uint64_t sub_21781C514(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_217847ED8();
  sub_217801850(v3, a2);
  sub_21776F584(v3, (uint64_t)a2);
  sub_217847EB4();
  return sub_217847ECC();
}

unint64_t sub_21781C578(int a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t inited;
  unint64_t result;
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
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v33[2];
  __int128 v34;
  uint64_t v35;

  sub_21776B790(&qword_253F25C60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21784C5A0;
  result = *MEMORY[0x24BE7CAC8];
  if (!*MEMORY[0x24BE7CAC8])
  {
    __break(1u);
    goto LABEL_11;
  }
  v18 = sub_217847F98();
  v19 = MEMORY[0x24BEE3F88];
  *(_QWORD *)(inited + 32) = v18;
  *(_QWORD *)(inited + 40) = v20;
  *(_QWORD *)(inited + 72) = v19;
  *(_DWORD *)(inited + 48) = a1;
  result = *MEMORY[0x24BE7CAD8];
  if (!*MEMORY[0x24BE7CAD8])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v21 = sub_217847F98();
  v22 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 80) = v21;
  *(_QWORD *)(inited + 88) = v23;
  *(_QWORD *)(inited + 120) = v22;
  *(_QWORD *)(inited + 96) = a2;
  result = *MEMORY[0x24BE7CB18];
  if (!*MEMORY[0x24BE7CB18])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)(inited + 128) = sub_217847F98();
  *(_QWORD *)(inited + 136) = v24;
  *(_QWORD *)(inited + 168) = v22;
  *(_QWORD *)(inited + 144) = a3;
  result = *MEMORY[0x24BE7CAA8];
  if (!*MEMORY[0x24BE7CAA8])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  *(_QWORD *)(inited + 176) = sub_217847F98();
  *(_QWORD *)(inited + 184) = v25;
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 192) = a4 & 1;
  result = *MEMORY[0x24BE7CAB8];
  if (!*MEMORY[0x24BE7CAB8])
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)(inited + 224) = sub_217847F98();
  *(_QWORD *)(inited + 232) = v26;
  v27 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 264) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 240) = a5;
  *(_QWORD *)(inited + 248) = a6;
  swift_bridgeObjectRetain();
  v28 = sub_2177F3220(inited);
  if (!a8)
    return v28;
  result = *MEMORY[0x24BE7CB08];
  if (*MEMORY[0x24BE7CB08])
  {
    v29 = sub_217847F98();
    v31 = v30;
    v35 = v27;
    *(_QWORD *)&v34 = a7;
    *((_QWORD *)&v34 + 1) = a8;
    sub_21776F574(&v34, v33);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4(v33, v29, v31, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v28;
  }
LABEL_15:
  __break(1u);
  return result;
}

unint64_t sub_21781C764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t inited;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_21776B790(&qword_253F25C60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21784AA30;
  result = *MEMORY[0x24BE7CB20];
  if (*MEMORY[0x24BE7CB20])
  {
    *(_QWORD *)(inited + 32) = sub_217847F98();
    *(_QWORD *)(inited + 40) = v10;
    v11 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = a1;
    *(_QWORD *)(inited + 56) = a2;
    result = *MEMORY[0x24BE7CB30];
    if (*MEMORY[0x24BE7CB30])
    {
      *(_QWORD *)(inited + 80) = sub_217847F98();
      *(_QWORD *)(inited + 88) = v12;
      *(_QWORD *)(inited + 120) = v11;
      *(_QWORD *)(inited + 96) = a3;
      *(_QWORD *)(inited + 104) = a4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return sub_2177F3220(inited);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_21781C830(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  id v6;
  id v7;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  if (a1)
  {
    v6 = a1;
    v7 = objc_msgSend(v6, sel_associatedMessageGuid);
    if (v7)
    {
      sub_217847F98();

      v7 = (id)sub_217847F74();
      swift_bridgeObjectRelease();
    }
    else
    {

    }
    objc_msgSend(v4, sel_setAssociatedMessageGUID_, v7);

    objc_msgSend(v4, sel_setAssociatedMessageType_, objc_msgSend(v6, sel_associatedMessageType));
    v15 = v6;
    v16 = objc_msgSend(v15, sel_associatedMessageRangeLocation);
    v17 = objc_msgSend(v15, sel_associatedMessageRangeLength);

    objc_msgSend(v4, sel_setAssociatedMessageRange_, v16, v17);
    if (a2)
    {
      v18 = a2;
      if (objc_msgSend(v18, sel_hasAssociatedMessageEmoji))
      {
        v19 = objc_msgSend(v18, sel_associatedMessageEmoji);
        if (v19)
        {
          v20 = v19;
          sub_217847F98();

          v22 = (id)sub_217847F74();
          swift_bridgeObjectRelease();
          v21 = v22;
LABEL_15:
          v23 = v21;
          objc_msgSend(v4, sel_setAssociatedMessageEmoji_);

          return;
        }
      }

    }
    v21 = 0;
    goto LABEL_15;
  }
  if (qword_253F26CA0 != -1)
    swift_once();
  v10 = sub_217847ED8();
  sub_21776F584(v10, (uint64_t)qword_253F28FE8);
  swift_bridgeObjectRetain_n();
  v11 = sub_217847EC0();
  v12 = sub_217848298();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v24 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_2177D06AC(a3, a4, &v24);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_217765000, v11, v12, "No Proto for IMAssociatedMessageItem %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v14, -1, -1);
    MEMORY[0x219A13268](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id sub_21781CB60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id result;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v2 = type metadata accessor for MessageRecord();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21781CCEC();
  sub_21776F3B4(a1, (uint64_t)v4);
  v5 = (void *)sub_2177ABA7C((uint64_t)v4);
  v6 = a1 + *(int *)(v2 + 136);
  v7 = *(void **)v6;
  if (*(_QWORD *)v6 == 1)
    return v5;
  v8 = *(void **)(v6 + 8);
  v9 = *(void **)(v6 + 16);
  v10 = *(void **)(v6 + 24);
  v11 = v10;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  result = objc_msgSend(v5, sel_guid);
  if (result)
  {
    v16 = result;
    v17 = sub_217847F98();
    v19 = v18;

    sub_2177AC208(v7, (unsigned int (*)(_QWORD, _QWORD, _QWORD))v8, v9, v10, v17, v19);
    swift_bridgeObjectRelease();
    result = objc_msgSend(v5, sel_guid);
    if (result)
    {
      v20 = result;
      v21 = sub_217847F98();
      v23 = v22;

      sub_21781C830(v7, v10, v21, v23);
      swift_bridgeObjectRelease();
      sub_21776E40C(v7, v8, v9, v10);
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_21781CCEC()
{
  unint64_t result;

  result = qword_254F03150;
  if (!qword_254F03150)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254F03150);
  }
  return result;
}

uint64_t type metadata accessor for Predicate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2177EFA44(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Predicate);
}

uint64_t sub_21781CD34()
{
  sub_21781CD80();
  return sub_2178484C0() & 1;
}

uint64_t sub_21781CD74()
{
  return sub_21781CD34();
}

unint64_t sub_21781CD80()
{
  unint64_t result;

  result = qword_253F26EA8;
  if (!qword_253F26EA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F26EA8);
  }
  return result;
}

_UNKNOWN **sub_21781CDBC()
{
  return &off_253F268F8;
}

void sub_21781CDC8(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v23;
  id v24;

  v2 = v1;
  v4 = objc_msgSend(v1, sel_data);
  if (v4)
  {
    v24 = v4;
    sub_2177DC5AC(a1);

  }
  else
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    v5 = sub_217847ED8();
    sub_21776F584(v5, (uint64_t)qword_253F28FE8);
    v6 = sub_217847EC0();
    v7 = sub_217848298();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_217765000, v6, v7, "Unable to get domain model, returning .unknown", v8, 2u);
      MEMORY[0x219A13268](v8, -1, -1);
    }

    v9 = objc_msgSend(v2, sel_recordName);
    if (v9)
    {
      v10 = v9;
      v11 = sub_217847F98();
      v13 = v12;

    }
    else
    {
      v11 = 0;
      v13 = 0;
    }
    v14 = objc_msgSend(v2, sel_recordType);
    if (v14)
    {
      v15 = v14;
      v16 = sub_217847F98();
      v18 = v17;

    }
    else
    {
      v16 = 0;
      v18 = 0;
    }
    *(_QWORD *)a1 = v11;
    *(_QWORD *)(a1 + 8) = v13;
    *(_QWORD *)(a1 + 16) = v16;
    *(_QWORD *)(a1 + 24) = v18;
    v19 = (int *)type metadata accessor for UnknownRecord();
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    v20 = a1 + v19[10];
    v21 = sub_217847E3C();
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
    v22(v20, 1, 1, v21);
    v22(a1 + v19[11], 1, 1, v21);
    v23 = (_QWORD *)(a1 + v19[12]);
    type metadata accessor for DatabaseRecord();
    *v23 = 0;
    v23[1] = 0;
    swift_storeEnumTagMultiPayload();
  }
}

void sub_21781CFF4(uint64_t a1@<X8>)
{
  sub_21781CDC8(a1);
}

uint64_t dispatch thunk of IMDaemonCoreBridgeProviding.bridgeClass()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.updateChat(usingSyncData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.supportsService(withName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.shouldStoreMessage(item:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.isCompatibleWithMiC(item:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.isBackwardCompatibility(item:parentChatID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.chatIdentities(forMessageGUIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.isExpectedChatID(item:chatID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.setSortID(item:parentChatID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.add(item:toParentChat:updatedLastMessageCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.decompress(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.removeTransferFromBackup(guid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.updateTemporaryTransferGUIDS(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.fileTransfer(guid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.storeAttachment(transfer:withMessageGUID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.storeAttachment(transfer:withChatGUID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 120))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.reloadDatabase()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.storeAttachments(forMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.createMessageItem(recordRef:handle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 144))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.updateStamp()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.transfer(forGUID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 160))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.add(transfer:forGuid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 168))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.updateTransfer(guid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 176))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.register(guid:localURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 184))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.syncDatesDictionary()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.setSyncDate(_:forKey:shouldOverride:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 200))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.hasFinishedAssetDownloadSync()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.primaryAccountCountryCode()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 216))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.moveMessages(forGUIDs:deleteDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 224))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.moveMessagePart(forGUID:deleteDate:partBody:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 232))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.ckRecord(withT1Info:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.ckRecord(withT2Info:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 248))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.ckRecord(withT3Info:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 256))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.handleMessageUpdate(withRecord:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 264))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.deviceActiveString()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 272))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.shouldReportToRTC()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.syncReportDictionary()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 288))();
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.syncReportDictionary(attemptCount:wasSuccessful:duration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, double);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double))(**(int **)(a4 + 296) + *(_QWORD *)(a4 + 296));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_2177EF600;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of static IMDaemonCoreBridge.postSyncState(withStep:category:reportDictionary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 304))();
}

uint64_t storeEnumTagSinglePayload for DaemonCoreBridgeError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21781D218 + 4 * byte_217850080[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21781D238 + 4 * byte_217850085[v4]))();
}

_BYTE *sub_21781D218(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21781D238(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21781D240(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21781D248(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21781D250(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21781D258(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DaemonCoreBridgeError()
{
  return &type metadata for DaemonCoreBridgeError;
}

unint64_t sub_21781D278()
{
  unint64_t result;

  result = qword_254F03178;
  if (!qword_254F03178)
  {
    result = MEMORY[0x219A13184](&unk_217850128, &type metadata for DaemonCoreBridgeError);
    atomic_store(result, (unint64_t *)&qword_254F03178);
  }
  return result;
}

uint64_t sub_21781D2BC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21781D2F4 + 4 * aA[a1]))(0x61746F5474616863, 0xEA0000000000736CLL);
}

uint64_t sub_21781D2F4()
{
  return 0x6576694C74616863;
}

uint64_t sub_21781D310()
{
  return 0x546567617373656DLL;
}

uint64_t sub_21781D334()
{
  return 0x4C6567617373656DLL;
}

unint64_t sub_21781D354()
{
  return 0xD000000000000010;
}

uint64_t sub_21781D370()
{
  return 0x656D686361747461;
}

unint64_t sub_21781D394()
{
  return 0xD000000000000013;
}

uint64_t sub_21781D3FC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = sub_21776B790(&qword_254F03190);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21776E3A4(a1, a1[3]);
  sub_21781E488();
  sub_2178489C4();
  v8[15] = 0;
  sub_21784888C();
  if (!v1)
  {
    v8[14] = 1;
    sub_21784888C();
    v8[13] = 2;
    sub_21784888C();
    v8[12] = 3;
    sub_21784888C();
    v8[11] = 4;
    sub_21784888C();
    v8[10] = 5;
    sub_21784888C();
    v8[9] = 6;
    sub_21784888C();
    v8[8] = 7;
    sub_21784888C();
    v8[7] = 8;
    sub_21784888C();
    v8[6] = 9;
    sub_21784888C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_21781D650()
{
  unsigned __int8 *v0;

  return sub_21781D2BC(*v0);
}

uint64_t sub_21781D658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21781DD70(a1, a2);
  *a3 = result;
  return result;
}

void sub_21781D67C(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_21781D688()
{
  sub_21781E488();
  return sub_2178489D0();
}

uint64_t sub_21781D6B0()
{
  sub_21781E488();
  return sub_2178489DC();
}

__n128 sub_21781D6D8@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_21781E1C8(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_21781D720(_QWORD *a1)
{
  return sub_21781D3FC(a1);
}

uint64_t sub_21781D734@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
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
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v2 = result;
  if (result)
  {
    if (!*(_QWORD *)(result + 16))
    {
      v15 = 0;
      v9 = 0;
      v6 = 0;
      goto LABEL_18;
    }
    v4 = sub_2177D0D64(0x616E614D74616863, 0xEF656E6F5A656574);
    if ((v5 & 1) != 0)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v4);
      swift_bridgeObjectRetain();
      if (*(_QWORD *)(v2 + 16))
      {
LABEL_5:
        v7 = sub_2177D0D64(0xD000000000000012, 0x8000000217851E00);
        if ((v8 & 1) != 0)
        {
          v9 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v7);
          swift_bridgeObjectRetain();
          if (*(_QWORD *)(v2 + 16))
            goto LABEL_7;
        }
        else
        {
          v9 = 0;
          if (*(_QWORD *)(v2 + 16))
          {
LABEL_7:
            v10 = sub_2177D0D64(0xD000000000000015, 0x8000000217851E20);
            if ((v11 & 1) != 0)
            {
              v12 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v10);
              swift_bridgeObjectRetain();
              if (*(_QWORD *)(v2 + 16))
              {
LABEL_9:
                v13 = sub_2177D0D64(0xD000000000000011, 0x8000000217851E40);
                if ((v14 & 1) != 0)
                {
                  v15 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v13);
                  swift_bridgeObjectRetain();
                  if (!*(_QWORD *)(v2 + 16))
                    goto LABEL_19;
                }
                else
                {
                  v15 = 0;
                  if (!*(_QWORD *)(v2 + 16))
                    goto LABEL_19;
                }
                v47 = sub_2177D0D64(0xD00000000000001CLL, 0x8000000217851E60);
                if ((v48 & 1) != 0)
                {
                  v26 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v47);
                  swift_bridgeObjectRetain();
LABEL_20:
                  result = swift_bridgeObjectRelease();
                  if (!v6)
                  {
                    v50 = 0;
                    v51 = 0;
                    if (v9)
                      goto LABEL_36;
                    goto LABEL_26;
                  }
                  if (!*(_QWORD *)(v6 + 16))
                  {
                    v50 = 0;
                    v51 = 0;
                    goto LABEL_35;
                  }
                  v27 = sub_2177D0D64(0x65725F6C61746F74, 0xED00007364726F63);
                  if ((v28 & 1) != 0)
                  {
                    v51 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v27);
                    if (!*(_QWORD *)(v6 + 16))
                      goto LABEL_34;
                  }
                  else
                  {
                    v51 = 0;
                    if (!*(_QWORD *)(v6 + 16))
                      goto LABEL_34;
                  }
                  v29 = sub_2177D0D64(0x6365725F6576696CLL, 0xEC0000007364726FLL);
                  if ((v30 & 1) != 0)
                  {
                    v50 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v29);
                    goto LABEL_35;
                  }
LABEL_34:
                  v50 = 0;
LABEL_35:
                  result = swift_bridgeObjectRelease();
                  if (v9)
                  {
LABEL_36:
                    if (!*(_QWORD *)(v9 + 16))
                    {
                      v19 = 0;
                      v49 = 0;
                      goto LABEL_45;
                    }
                    v31 = sub_2177D0D64(0x65725F6C61746F74, 0xED00007364726F63);
                    if ((v32 & 1) != 0)
                    {
                      v49 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v31);
                      if (!*(_QWORD *)(v9 + 16))
                        goto LABEL_44;
                    }
                    else
                    {
                      v49 = 0;
                      if (!*(_QWORD *)(v9 + 16))
                        goto LABEL_44;
                    }
                    v33 = sub_2177D0D64(0x6365725F6576696CLL, 0xEC0000007364726FLL);
                    if ((v34 & 1) != 0)
                    {
                      v19 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v33);
                      goto LABEL_45;
                    }
LABEL_44:
                    v19 = 0;
LABEL_45:
                    result = swift_bridgeObjectRelease();
                    if (v12)
                    {
LABEL_46:
                      if (!*(_QWORD *)(v12 + 16))
                      {
                        v21 = 0;
                        v20 = 0;
                        goto LABEL_55;
                      }
                      v35 = sub_2177D0D64(0x65725F6C61746F74, 0xED00007364726F63);
                      if ((v36 & 1) != 0)
                      {
                        v20 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v35);
                        if (!*(_QWORD *)(v12 + 16))
                          goto LABEL_54;
                      }
                      else
                      {
                        v20 = 0;
                        if (!*(_QWORD *)(v12 + 16))
                          goto LABEL_54;
                      }
                      v37 = sub_2177D0D64(0x6365725F6576696CLL, 0xEC0000007364726FLL);
                      if ((v38 & 1) != 0)
                      {
                        v21 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v37);
                        goto LABEL_55;
                      }
LABEL_54:
                      v21 = 0;
LABEL_55:
                      result = swift_bridgeObjectRelease();
                      if (v15)
                      {
LABEL_56:
                        if (!*(_QWORD *)(v15 + 16))
                        {
                          v23 = 0;
                          v22 = 0;
                          goto LABEL_65;
                        }
                        v39 = sub_2177D0D64(0x65725F6C61746F74, 0xED00007364726F63);
                        if ((v40 & 1) != 0)
                        {
                          v22 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v39);
                          if (!*(_QWORD *)(v15 + 16))
                            goto LABEL_64;
                        }
                        else
                        {
                          v22 = 0;
                          if (!*(_QWORD *)(v15 + 16))
                            goto LABEL_64;
                        }
                        v41 = sub_2177D0D64(0x6365725F6576696CLL, 0xEC0000007364726FLL);
                        if ((v42 & 1) != 0)
                        {
                          v23 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v41);
                          goto LABEL_65;
                        }
LABEL_64:
                        v23 = 0;
LABEL_65:
                        result = swift_bridgeObjectRelease();
                        if (v26)
                        {
LABEL_66:
                          if (*(_QWORD *)(v26 + 16))
                          {
                            v43 = sub_2177D0D64(0x65725F6C61746F74, 0xED00007364726F63);
                            if ((v44 & 1) != 0)
                            {
                              v24 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v43);
                              if (!*(_QWORD *)(v26 + 16))
                                goto LABEL_74;
                            }
                            else
                            {
                              v24 = 0;
                              if (!*(_QWORD *)(v26 + 16))
                                goto LABEL_74;
                            }
                            v45 = sub_2177D0D64(0x6365725F6576696CLL, 0xEC0000007364726FLL);
                            if ((v46 & 1) != 0)
                            {
                              v25 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v45);
LABEL_75:
                              result = swift_bridgeObjectRelease();
                              goto LABEL_76;
                            }
                          }
                          else
                          {
                            v24 = 0;
                          }
LABEL_74:
                          v25 = 0;
                          goto LABEL_75;
                        }
LABEL_29:
                        v24 = 0;
                        v25 = 0;
LABEL_76:
                        v17 = v50;
                        v16 = v51;
                        v18 = v49;
                        goto LABEL_77;
                      }
LABEL_28:
                      v23 = 0;
                      v22 = 0;
                      if (v26)
                        goto LABEL_66;
                      goto LABEL_29;
                    }
LABEL_27:
                    v21 = 0;
                    v20 = 0;
                    if (v15)
                      goto LABEL_56;
                    goto LABEL_28;
                  }
LABEL_26:
                  v19 = 0;
                  v49 = 0;
                  if (v12)
                    goto LABEL_46;
                  goto LABEL_27;
                }
LABEL_19:
                v26 = 0;
                goto LABEL_20;
              }
            }
            else
            {
              v12 = 0;
              if (*(_QWORD *)(v2 + 16))
                goto LABEL_9;
            }
            v15 = 0;
            goto LABEL_19;
          }
        }
        v15 = 0;
LABEL_18:
        v12 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v6 = 0;
      if (*(_QWORD *)(v2 + 16))
        goto LABEL_5;
    }
    v15 = 0;
    v9 = 0;
    goto LABEL_18;
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
LABEL_77:
  *(_QWORD *)a2 = v16;
  *(_QWORD *)(a2 + 8) = v17;
  *(_QWORD *)(a2 + 16) = v18;
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)(a2 + 32) = v20;
  *(_QWORD *)(a2 + 40) = v21;
  *(_QWORD *)(a2 + 48) = v22;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v24;
  *(_QWORD *)(a2 + 72) = v25;
  *(_BYTE *)(a2 + 80) = v2 == 0;
  return result;
}

__n128 initializeWithCopy for ServerCounts(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ServerCounts(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ServerCounts(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ServerCounts()
{
  return &type metadata for ServerCounts;
}

uint64_t sub_21781DD70(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x61746F5474616863 && a2 == 0xEA0000000000736CLL;
  if (v2 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6576694C74616863 && a2 == 0xE900000000000073 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x546567617373656DLL && a2 == 0xED0000736C61746FLL || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4C6567617373656DLL && a2 == 0xEC00000073657669 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000217854520 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656D686361747461 && a2 == 0xEF736576694C746ELL || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000217854540 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000217854560 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000217854580 || (sub_2178488E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000002178545A0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_2178488E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_21781E1C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
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
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v5 = sub_21776B790(&qword_254F03180);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21776E3A4(a1, a1[3]);
  sub_21781E488();
  sub_2178489B8();
  if (v2)
    return _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)a1);
  v32 = 0;
  v9 = sub_217848808();
  v31 = 1;
  v10 = sub_217848808();
  v30 = 2;
  v22 = sub_217848808();
  v29 = 3;
  v21 = sub_217848808();
  v28 = 4;
  v20 = sub_217848808();
  v27 = 5;
  v19 = sub_217848808();
  v26 = 6;
  v18 = sub_217848808();
  v25 = 7;
  v17 = sub_217848808();
  v24 = 8;
  v16 = sub_217848808();
  v23 = 9;
  v11 = sub_217848808();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)a1);
  *a2 = v9;
  a2[1] = v10;
  v13 = v21;
  a2[2] = v22;
  a2[3] = v13;
  v14 = v19;
  a2[4] = v20;
  a2[5] = v14;
  v15 = v17;
  a2[6] = v18;
  a2[7] = v15;
  a2[8] = v16;
  a2[9] = v11;
  return result;
}

unint64_t sub_21781E488()
{
  unint64_t result;

  result = qword_254F03188;
  if (!qword_254F03188)
  {
    result = MEMORY[0x219A13184](&unk_2178502F4, &type metadata for ServerCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03188);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ServerCounts.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21781E518 + 4 * byte_2178501BF[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_21781E54C + 4 * byte_2178501BA[v4]))();
}

uint64_t sub_21781E54C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21781E554(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21781E55CLL);
  return result;
}

uint64_t sub_21781E568(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21781E570);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_21781E574(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21781E57C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServerCounts.CodingKeys()
{
  return &type metadata for ServerCounts.CodingKeys;
}

unint64_t sub_21781E59C()
{
  unint64_t result;

  result = qword_254F03198;
  if (!qword_254F03198)
  {
    result = MEMORY[0x219A13184](&unk_2178502CC, &type metadata for ServerCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03198);
  }
  return result;
}

unint64_t sub_21781E5E4()
{
  unint64_t result;

  result = qword_254F031A0;
  if (!qword_254F031A0)
  {
    result = MEMORY[0x219A13184](&unk_21785023C, &type metadata for ServerCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F031A0);
  }
  return result;
}

unint64_t sub_21781E62C()
{
  unint64_t result;

  result = qword_254F031A8;
  if (!qword_254F031A8)
  {
    result = MEMORY[0x219A13184](&unk_217850264, &type metadata for ServerCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F031A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReportRecordFailuresTelemetryStep()
{
  return &type metadata for ReportRecordFailuresTelemetryStep;
}

uint64_t sub_21781E680()
{
  uint64_t result;

  sub_217847B78();
  swift_allocObject();
  result = sub_217847B6C();
  qword_254F0E0B8 = result;
  return result;
}

uint64_t sub_21781E6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_254F031C8 + dword_254F031C8);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21777DCC4;
  return v7(a1, a2);
}

uint64_t sub_21781E728(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[18] = a1;
  v2[19] = a2;
  sub_217847FC8();
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21781E780()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 168) = *(_QWORD *)(*(_QWORD *)(v0 + 144)
                                    + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_21781E7D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t inited;
  unint64_t v9;
  unint64_t v10;

  v1 = *(_QWORD *)(v0 + 168);
  swift_beginAccess();
  v2 = sub_21780260C(*(_QWORD *)(v1 + 192));
  if (v2 < 1)
  {
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
  else
  {
    v5 = v2;
    v6 = v3;
    v7 = v4;
    sub_21776B790(&qword_254F031D0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21784AF40;
    v9 = 0xD000000000000010;
    if ((v7 & 1) != 0)
      v9 = 0xD000000000000011;
    v10 = 0x8000000217851B20;
    if ((v7 & 1) == 0)
      v10 = 0x8000000217851B00;
    *(_QWORD *)(inited + 32) = v9;
    *(_QWORD *)(inited + 40) = v10;
    *(_QWORD *)(inited + 48) = v5;
    *(_QWORD *)(inited + 56) = v6;
    *(_BYTE *)(inited + 64) = v7 & 1;
    *(_QWORD *)(v0 + 176) = sub_2177F3900(inited);
    swift_release();
    return swift_task_switch();
  }
}

uint64_t sub_21781E900()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22[14];
  char v23;
  uint64_t v24;
  char v25;

  if (qword_254F014F8 != -1)
    swift_once();
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 176);
  sub_21781EE44();
  v1 = sub_217847B60();
  *(_QWORD *)(v0 + 184) = v1;
  *(_QWORD *)(v0 + 192) = v2;
  v3 = v1;
  v4 = v2;
  sub_217847FBC();
  v5 = sub_217847FA4();
  *(_QWORD *)(v0 + 200) = v6;
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    swift_bridgeObjectRelease();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v9;
    *v9 = v0;
    v9[1] = sub_21781EDA4;
    v11 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 152);
    v25 = 80;
    v24 = 39;
    v23 = 2;
    v22[13] = 21;
    v22[12] = (uint64_t)"performStep(context:)";
    return sub_217823614(v11, v10, v7, v8, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/MessagesCloudSync/SyncSteps/ReportRecordFailuresTelemetryStep.swift", 125, 2);
  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v13 = sub_217847ED8();
    sub_21776F584(v13, (uint64_t)qword_253F28DC8);
    swift_bridgeObjectRetain();
    v14 = sub_217847EC0();
    v15 = sub_217848298();
    v16 = os_log_type_enabled(v14, v15);
    v17 = *(_QWORD *)(v0 + 176);
    if (v16)
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v22[0] = v19;
      *(_DWORD *)v18 = 136315138;
      *(_QWORD *)(v0 + 128) = v17;
      swift_bridgeObjectRetain();
      v20 = sub_217847FE0();
      *(_QWORD *)(v0 + 136) = sub_2177D06AC(v20, v21, v22);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v14, v15, "Failed to get json string for record failure report: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v19, -1, -1);
      MEMORY[0x219A13268](v18, -1, -1);
      sub_21776BAD0(v3, v4);
    }
    else
    {
      sub_21776BAD0(v3, v4);
      swift_bridgeObjectRelease_n();
    }

    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
}

uint64_t sub_21781EDA4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21781EE00()
{
  uint64_t v0;

  sub_21776BAD0(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

unint64_t sub_21781EE44()
{
  unint64_t result;

  result = qword_254F031D8;
  if (!qword_254F031D8)
  {
    result = MEMORY[0x219A13184](&unk_21784F118, &type metadata for RecordFailuresReport);
    atomic_store(result, (unint64_t *)&qword_254F031D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DevicePolicy(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DevicePolicy(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[5])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DevicePolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DevicePolicy()
{
  return &type metadata for DevicePolicy;
}

unint64_t sub_21781EF44(char a1, char a2, char a3)
{
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_21781C038();
  v7 = v6 & 0x1FF;
  v8 = sub_21781BF04(v6 & 0x1FF);
  v10 = v9;
  if (qword_253F25D98 != -1)
    swift_once();
  v11 = sub_217847ED8();
  sub_21776F584(v11, (uint64_t)qword_253F28DC8);
  swift_bridgeObjectRetain();
  v12 = sub_217847EC0();
  v13 = sub_2178482B0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v14 = 67109890;
    sub_2178484E4();
    *(_WORD *)(v14 + 8) = 1024;
    sub_2178484E4();
    *(_WORD *)(v14 + 14) = 1024;
    sub_2178484E4();
    *(_WORD *)(v14 + 20) = 2080;
    swift_bridgeObjectRetain();
    sub_2177D06AC(v8, v10, &v20);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_217765000, v12, v13, "[DevicePolicy]:\n    evaluateUserSyncOnly = %{BOOL}d\n    maintainWifi = %{BOOL}d\n    maintainCharging = %{BOOL}d\n    initialDeviceState = %s", (uint8_t *)v14, 0x1Eu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v19, -1, -1);
    MEMORY[0x219A13268](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v15 = 0x10000;
  if ((a3 & 1) == 0)
    v15 = 0;
  v16 = v15 | (v7 << 24);
  v17 = 256;
  if ((a2 & 1) == 0)
    v17 = 0;
  return (v16 | v17) & 0xFFFFFFFFFFFFFFFELL | a1 & 1;
}

uint64_t sub_21781F194()
{
  uint64_t v0;

  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 112);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for CountStore()
{
  return objc_opt_self();
}

void sub_21781F1D8(unint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *oslog;
  uint64_t v14;

  sub_2177E253C(a1, a2, a3 & 1);
  if ((a3 & 1) != 0)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v10 = sub_217847ED8();
    sub_21776F584(v10, (uint64_t)qword_253F28DC8);
    oslog = sub_217847EC0();
    v11 = sub_2178482B0();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_217765000, oslog, v11, "Successfully nil'd out local store count from database", v12, 2u);
      MEMORY[0x219A13268](v12, -1, -1);
    }
  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v4 = sub_217847ED8();
    sub_21776F584(v4, (uint64_t)qword_253F28DC8);
    oslog = sub_217847EC0();
    v5 = sub_2178482B0();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v14 = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = sub_217847FE0();
      sub_2177D06AC(v8, v9, &v14);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217765000, oslog, v5, "Successfully wrote to database our new local store count: %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v7, -1, -1);
      MEMORY[0x219A13268](v6, -1, -1);

      return;
    }
  }

}

ValueMetadata *type metadata accessor for LocalCounts()
{
  return &type metadata for LocalCounts;
}

uint64_t sub_21781F438(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_21781F454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v1 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v1;
  v5 = *(_OWORD *)(v0 + 24);
  swift_unknownObjectWeakInit();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  sub_21776B790(&qword_254F031F8);
  *v3 = v0;
  v3[1] = sub_21781F53C;
  return sub_2178488F8();
}

uint64_t sub_21781F53C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_21781F5B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21781F5BC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21781F5F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _QWORD aBlock[6];

  v6 = sub_21776B790(&qword_254F03200);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  swift_beginAccess();
  v9 = MEMORY[0x219A13328](a2 + 16);
  if (v9)
  {
    v10 = (void *)v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
    v11 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v12 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    aBlock[4] = sub_217820164;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21781F864;
    aBlock[3] = &unk_24D80F138;
    v13 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v10, sel_setFetchRecordsCompletionBlock_, v13);
    _Block_release(v13);
    v14 = (_QWORD *)(a3 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase);
    v15 = *(_QWORD *)(a3 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 24);
    v16 = v14[4];
    sub_21776E3A4(v14, v15);
    (*(void (**)(void *, uint64_t, uint64_t))(v16 + 8))(v10, v15, v16);

  }
  else
  {
    sub_2178200BC();
    swift_allocError();
    *v17 = 0;
    sub_21784816C();
  }
}

uint64_t sub_21781F7C4(uint64_t a1, id a2)
{
  id v2;
  _BYTE *v4;

  if (a2)
  {
    v2 = a2;
LABEL_3:
    sub_21776B790(&qword_254F03200);
    return sub_21784816C();
  }
  if (!a1)
  {
    sub_2178200BC();
    swift_allocError();
    *v4 = 1;
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  sub_21776B790(&qword_254F03200);
  return sub_217848178();
}

uint64_t sub_21781F864(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_217787748(0, (unint64_t *)&qword_253F26DC8);
    sub_217787748(0, (unint64_t *)&qword_253F26EA0);
    sub_2177BB180();
    v4 = sub_217847F2C();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_21781F91C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  unint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, char *, uint64_t);
  void *v16;
  void *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _BYTE *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD v41[5];

  v34 = a4;
  v35 = a6;
  v36 = a2;
  v8 = sub_21776B790(&qword_254F031E0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = (_BYTE *)(a3 + 16);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  v15 = *(void (**)(unint64_t, char *, uint64_t))(v9 + 32);
  v15(v14 + v13, v11, v8);
  swift_retain();
  v16 = v36;
  sub_2178483A0();
  v12(v11, a1, v8);
  v17 = v16;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  v15(v18 + v13, v11, v8);
  swift_retain();
  sub_217848388();
  v19 = v37;
  swift_beginAccess();
  if ((*(_BYTE *)(a3 + 16) & 1) == 0)
  {
    swift_beginAccess();
    *v19 = 1;
    v20 = v34;
    v21 = *(_QWORD *)(v34 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 24);
    v22 = *(_QWORD *)(v34 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 32);
    sub_21776E3A4((_QWORD *)(v34 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase), v21);
    (*(void (**)(void *, uint64_t, uint64_t))(v22 + 8))(v17, v21, v22);
    if (qword_253F25D98 != -1)
      swift_once();
    v23 = sub_217847ED8();
    sub_21776F584(v23, (uint64_t)qword_253F28DC8);
    sub_21776E4FC(v35, (uint64_t)v41);
    swift_unknownObjectRetain_n();
    v24 = v17;
    v25 = sub_217847EC0();
    v26 = sub_2178482B0();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v40 = v29;
      *(_DWORD *)v27 = 136315650;
      v30 = sub_21776E3A4(v41, v41[3]);
      v31 = *v30;
      v32 = v30[1];
      swift_bridgeObjectRetain();
      v38 = sub_2177D06AC(v31, v32, &v40);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v41);
      *(_WORD *)(v27 + 12) = 2080;
      v38 = 0x2E636E7973;
      v39 = 0xE500000000000000;
      sub_21776E3A4((_QWORD *)(v20 + 16), *(_QWORD *)(v20 + 40));
      sub_2177F4440();
      sub_21784801C();
      swift_bridgeObjectRelease();
      sub_21784801C();
      sub_217847E6C();
      sub_21777F28C();
      sub_2178488A4();
      sub_21784801C();
      swift_bridgeObjectRelease();
      v38 = sub_2177D06AC(v38, v39, &v40);
      sub_2178484E4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 22) = 2112;
      v38 = (uint64_t)v24;
      v33 = v24;
      sub_2178484E4();
      *v28 = v24;

      _os_log_impl(&dword_217765000, v25, v26, "Added fetch operation for %s (sync: %s): %@", (uint8_t *)v27, 0x20u);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v28, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v29, -1, -1);
      MEMORY[0x219A13268](v27, -1, -1);

    }
    else
    {
      _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v41);

      swift_unknownObjectRelease_n();
    }
  }
}

uint64_t sub_21781FDD4(void *a1, void *a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  id v13;
  _QWORD v14[2];
  BOOL v15;

  v8 = sub_21776B790(&qword_254F031E8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_beginAccess();
  if (*(_BYTE *)(a4 + 16) == 1)
  {
    v14[0] = a1;
    v14[1] = a2;
    v15 = (a3 & 1) != 0;
    sub_2177B7E98(a2);
    v13 = a1;
    sub_21776B790(&qword_254F031E0);
    sub_2178481D8();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_21781FEE0(void *a1, void *a2, char a3)
{
  uint64_t v3;
  char v6;

  v6 = a3 & 1;
  sub_21776B790(&qword_254F031E0);
  return sub_21781FDD4(a1, a2, v6, *(_QWORD *)(v3 + 16));
}

uint64_t sub_21781FF3C(void *a1, char a2, uint64_t a3)
{
  id v6;

  swift_beginAccess();
  *(_BYTE *)(a3 + 16) = 0;
  if ((a2 & 1) != 0)
    v6 = a1;
  sub_21776B790(&qword_254F031E0);
  return sub_2178481E4();
}

uint64_t sub_21781FFC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21776B790(&qword_254F031E0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_217820038(void *a1, char a2)
{
  uint64_t v2;
  char v4;

  v4 = a2 & 1;
  sub_21776B790(&qword_254F031E0);
  return sub_21781FF3C(a1, v4, *(_QWORD *)(v2 + 16));
}

uint64_t sub_21782008C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2178200B0(uint64_t a1)
{
  uint64_t v1;

  sub_21781F5F8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_2178200BC()
{
  unint64_t result;

  result = qword_254F03208;
  if (!qword_254F03208)
  {
    result = MEMORY[0x219A13184](&unk_2178504E4, &_s6ErrorsON_0);
    atomic_store(result, (unint64_t *)&qword_254F03208);
  }
  return result;
}

uint64_t sub_217820100()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21776B790(&qword_254F03200);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_217820164(uint64_t a1, void *a2)
{
  sub_21776B790(&qword_254F03200);
  return sub_21781F7C4(a1, a2);
}

uint64_t sub_2178201B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2178201C4()
{
  return swift_release();
}

uint64_t _s6ErrorsOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_217820218 + 4 * byte_217850455[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21782024C + 4 * byte_217850450[v4]))();
}

uint64_t sub_21782024C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217820254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21782025CLL);
  return result;
}

uint64_t sub_217820268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217820270);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_217820274(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21782027C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6ErrorsOMa_0()
{
  return &_s6ErrorsON_0;
}

void _s15ZoneFetchResultOwxx(void **a1)
{
  sub_2177DC4A8(*a1, a1[1]);
}

uint64_t _s15ZoneFetchResultOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2177DC428(*(void **)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s15ZoneFetchResultOwca(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2177DC428(*(void **)a2, v4);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_2177DC4A8(v6, v7);
  return a1;
}

uint64_t _s15ZoneFetchResultOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_2177DC4A8(v4, v5);
  return a1;
}

uint64_t _s15ZoneFetchResultOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s15ZoneFetchResultOwst(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_217820418(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *_s15ZoneFetchResultOMa()
{
  return &_s15ZoneFetchResultON;
}

unint64_t sub_217820438()
{
  unint64_t result;

  result = qword_254F03210;
  if (!qword_254F03210)
  {
    result = MEMORY[0x219A13184](&unk_2178504BC, &_s6ErrorsON_0);
    atomic_store(result, (unint64_t *)&qword_254F03210);
  }
  return result;
}

uint64_t sub_21782047C(uint64_t a1)
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_21776B790(&qword_253F25C18);
    v2 = sub_21784876C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
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
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_21776F574(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_21776F574(v35, v36);
    sub_21776F574(v36, &v32);
    result = sub_2178485A4();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_21776F574(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_21778857C();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
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
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_217820838(uint64_t a1)
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
    sub_21776B790(&qword_253F25C18);
    v2 = sub_21784876C();
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
    sub_21776F4DC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21776F574(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_21776F574(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_21776F574(v36, v37);
    sub_21776F574(v37, &v33);
    result = sub_2178485A4();
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
    result = (uint64_t)sub_21776F574(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_21778857C();
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

unint64_t sub_217820BFC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_21776B790(&qword_253F25C10);
    v2 = (_QWORD *)sub_21784876C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x24BEE4AD8] + 8;
  v11 = MEMORY[0x24BEE0D00];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_21778857C();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21776F574(v6, v7);
    sub_21776F574(v7, v40);
    sub_21776F574(v40, &v38);
    result = sub_2177D0D64(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v18);
      result = (unint64_t)sub_21776F574(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_21776F574(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id SyncTelemetryReporter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_217820F84()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    v2 = sub_217847F98();
    v4 = v3;

  }
  else
  {
    v4 = 0x8000000217854800;
    v2 = 0xD000000000000011;
  }
  qword_253F28E18 = v2;
  unk_253F28E20 = v4;
}

id SyncTelemetryReporter.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t ObjectType;
  uint64_t v52;
  uint64_t v53;
  objc_super v54;

  ObjectType = swift_getObjectType();
  v49 = sub_21784831C();
  v1 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v3 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_217847F14();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_217847EFC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_217848310();
  MEMORY[0x24BDAC7A8](v9);
  v48 = OBJC_IVAR___IMDSyncTelemetryReporterInternal_reportingQueue;
  sub_21782172C();
  v50 = v0;
  sub_217848304();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5470], v5);
  sub_217848358();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_217847F08();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v49);
  *(_QWORD *)&v0[v48] = sub_21784834C();
  if (qword_253F25DC0 != -1)
    swift_once();
  v10 = (void *)qword_253F28F00;
  v11 = (void *)sub_217847F74();
  v12 = objc_msgSend(v10, sel_stringForKey_, v11);

  if (v12)
  {
    v13 = sub_217847F98();
    v15 = v14;

    v16 = (objc_class *)ObjectType;
    v17 = sub_217822984();
    v19 = sub_21781C578(38, 0, 0, 0, v17, v18, v13, v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = (objc_class *)ObjectType;
    v20 = sub_217822984();
    v19 = sub_21781C578(38, 0, 0, 0, v20, v21, 0, 0);
  }
  swift_bridgeObjectRelease();
  v22 = sub_217822984();
  v24 = sub_21781C764(v22, v23, 0x746C7561666544, 0xE700000000000000);
  swift_bridgeObjectRelease();
  if (qword_253F25B98 != -1)
    swift_once();
  v25 = sub_217847ED8();
  v26 = sub_21776F584(v25, (uint64_t)qword_253F28E80);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v27 = sub_217847EC0();
  v28 = sub_2178482B0();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v53 = v48;
    *(_DWORD *)v29 = 136315394;
    swift_bridgeObjectRetain();
    v49 = v26;
    v30 = sub_217847F38();
    v32 = v31;
    swift_bridgeObjectRelease();
    v52 = sub_2177D06AC(v30, v32, &v53);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain();
    v33 = sub_217847F38();
    v35 = v34;
    swift_bridgeObjectRelease();
    v36 = v33;
    v16 = (objc_class *)ObjectType;
    v52 = sub_2177D06AC(v36, v35, &v53);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217765000, v27, v28, "init RTCReporter with sessionInfo: %s, userInfo: %s", (uint8_t *)v29, 0x16u);
    v37 = v48;
    swift_arrayDestroy();
    MEMORY[0x219A13268](v37, -1, -1);
    MEMORY[0x219A13268](v29, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_217820838(v19);
  swift_bridgeObjectRelease();
  sub_217820838(v24);
  swift_bridgeObjectRelease();
  v38 = objc_allocWithZone(MEMORY[0x24BE7CA78]);
  v39 = (void *)sub_217847F20();
  swift_bridgeObjectRelease();
  v40 = (void *)sub_217847F20();
  swift_bridgeObjectRelease();
  v41 = (void *)sub_2178480C4();
  v42 = objc_msgSend(v38, sel_initWithSessionInfo_userInfo_frameworksToCheck_, v39, v40, v41);

  v43 = v50;
  *(_QWORD *)&v50[OBJC_IVAR___IMDSyncTelemetryReporterInternal_reporter] = v42;

  if (!v42)
  {
    v44 = sub_217847EC0();
    v45 = sub_217848298();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_217765000, v44, v45, "RTCReporter fail to init and return nil", v46, 2u);
      MEMORY[0x219A13268](v46, -1, -1);
    }

  }
  v54.receiver = v43;
  v54.super_class = v16;
  return objc_msgSendSuper2(&v54, sel_init);
}

unint64_t sub_21782172C()
{
  unint64_t result;

  result = qword_253F25BD0;
  if (!qword_253F25BD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F25BD0);
  }
  return result;
}

uint64_t sub_217821788(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  _BYTE *v36;
  _BYTE v38[12];
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD aBlock[6];

  v52 = a7;
  v53 = a8;
  v51 = a6;
  v49 = a4;
  v50 = a5;
  v48 = a3;
  v55 = a1;
  v14 = sub_217847F14();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = &v38[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = sub_21776B790(&qword_253F25BC0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8](v18);
  v21 = &v38[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = sub_217847EF0();
  v54 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v24 = &v38[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v25 = MEMORY[0x219A13328](a2 + 16);
  if (!v25)
    return sub_217848178();
  v26 = (void *)v25;
  v43 = a13;
  v42 = a12;
  v41 = a11;
  v40 = a10;
  v39 = a9;
  v47 = *(_QWORD *)(v25 + OBJC_IVAR___IMDSyncTelemetryReporterInternal_reportingQueue);
  v45 = v24;
  sub_217847EE4();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v19 + 16))(&v38[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)], v55, v18);
  v27 = *(unsigned __int8 *)(v19 + 80);
  v55 = v14;
  v28 = (v27 + 88) & ~v27;
  v29 = (v20 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v46 = v22;
  v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF8;
  v44 = v15;
  v31 = swift_allocObject();
  *(_BYTE *)(v31 + 16) = v48 & 1;
  v32 = v49;
  *(_QWORD *)(v31 + 24) = v26;
  *(_QWORD *)(v31 + 32) = v32;
  *(_QWORD *)(v31 + 40) = v50;
  *(_BYTE *)(v31 + 48) = v51;
  v33 = v53;
  *(_QWORD *)(v31 + 56) = v52;
  *(_QWORD *)(v31 + 64) = v33;
  *(_BYTE *)(v31 + 72) = v39;
  *(_QWORD *)(v31 + 80) = v40;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v19 + 32))(v31 + v28, v21, v18);
  *(_QWORD *)(v31 + v29) = v41;
  *(_QWORD *)(v31 + v30) = v42;
  *(_QWORD *)(v31 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = v43;
  aBlock[4] = sub_217822B18;
  aBlock[5] = v31;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217822460;
  aBlock[3] = &unk_24D80F3C0;
  v34 = _Block_copy(aBlock);
  v35 = v26;
  swift_bridgeObjectRetain();
  sub_217847F08();
  v36 = v45;
  MEMORY[0x219A124B8](0, v17, v45, v34);
  _Block_release(v34);
  (*(void (**)(_BYTE *, uint64_t))(v44 + 8))(v17, v55);
  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v36, v46);

  return swift_release();
}

void sub_217821AB8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, uint64_t a13)
{
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  if ((a1 & 1) == 0 && !*(_QWORD *)(a2 + OBJC_IVAR___IMDSyncTelemetryReporterInternal_reporter))
  {
    if (qword_253F25B98 != -1)
      swift_once();
    v51 = sub_217847ED8();
    sub_21776F584(v51, (uint64_t)qword_253F28E80);
    v52 = sub_217847EC0();
    v53 = sub_217848298();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = swift_slowAlloc();
      v63 = swift_slowAlloc();
      v65[0] = v63;
      *(_DWORD *)v54 = 136315650;
      v55 = sub_217848640();
      sub_2177D06AC(v55, v56, v65);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 12) = 2080;
      v57 = sub_217848640();
      sub_2177D06AC(v57, v58, v65);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 22) = 2048;
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v52, v53, "Reporter is not initialized during non-isolated dispatch. %s:%s:%lu", (uint8_t *)v54, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v63, -1, -1);
      MEMORY[0x219A13268](v54, -1, -1);
    }

    sub_21776B790(&qword_253F25BC0);
    goto LABEL_28;
  }
  if (qword_253F25B98 != -1)
    swift_once();
  v13 = sub_217847ED8();
  sub_21776F584(v13, (uint64_t)qword_253F28E80);
  swift_bridgeObjectRetain_n();
  v14 = sub_217847EC0();
  v15 = sub_2178482B0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    v65[0] = v60;
    *(_DWORD *)v16 = 136315906;
    sub_2177D06AC(0xD000000000000041, 0x80000002178547B0, v65);
    sub_2178484E4();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    v17 = sub_217847F38();
    v19 = v18;
    swift_bridgeObjectRelease();
    sub_2177D06AC(v17, v19, v65);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 22) = 2048;
    sub_2178484E4();
    *(_WORD *)(v16 + 32) = 2048;
    sub_2178484E4();
    _os_log_impl(&dword_217765000, v14, v15, "[SyncTelemetryReporting:%s]: Sending payload to RTC: %s, category: %ld, event: %ld", (uint8_t *)v16, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v60, -1, -1);
    MEMORY[0x219A13268](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (qword_253F28F10)
  {
    v20 = sub_21776E3A4((_QWORD *)(qword_253F28F10 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(qword_253F28F10 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
    v21 = *(_QWORD *)(*v20 + 32);
    v22 = *(_QWORD *)(*v20 + 40);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v23 = sub_217822984();
    v59 = a13;
    v25 = sub_21781C578(38, 0, 0, 0, v23, v24, v21, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v26 = sub_217822984();
    v59 = a13;
    v25 = sub_21781C578(38, 0, 0, 0, v26, v27, 0, 0);
    swift_bridgeObjectRelease();
  }
  v28 = sub_217822984();
  v30 = sub_21781C764(v28, v29, 0x746C7561666544, 0xE700000000000000);
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    sub_217820838(v25);
    swift_bridgeObjectRelease();
    v31 = (void *)sub_217847F20();
    swift_bridgeObjectRelease();
    sub_217820838(v30);
    swift_bridgeObjectRelease();
    v32 = (void *)sub_217847F20();
    swift_bridgeObjectRelease();
    if ((a12 & 0x8000000000000000) == 0 && a12 < 0x10000)
    {
      v33 = (void *)objc_opt_self();
      sub_217820838(a11);
      v34 = (void *)sub_217847F20();
      swift_bridgeObjectRelease();
      v65[0] = 0;
      v35 = objc_msgSend(v33, sel_sendOneMessageWithSessionInfo_userInfo_category_type_payload_error_, v31, v32, (unsigned __int16)a12, 0, v34, v65, v59, &off_24D80F358);

      v36 = (void *)v65[0];
      if ((v35 & 1) != 0)
      {
LABEL_15:
        v37 = v36;
LABEL_22:
        sub_21776B790(&qword_253F25BC0);
LABEL_28:
        sub_217848178();
        return;
      }
      goto LABEL_20;
    }
LABEL_31:
    sub_21784873C();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v38 = *(void **)(a2 + OBJC_IVAR___IMDSyncTelemetryReporterInternal_reporter);
  if (!v38)
    goto LABEL_22;
  if ((a12 & 0x8000000000000000) != 0 || a12 >= 0x10000)
    goto LABEL_31;
  sub_217820838(a11);
  v39 = (void *)sub_217847F20();
  swift_bridgeObjectRelease();
  v65[0] = 0;
  v40 = objc_msgSend(v38, sel_sendMessageWithCategory_type_payload_error_, (unsigned __int16)a12, 0, v39, v65, v59, &off_24D80F358);

  v36 = (void *)v65[0];
  if (v40)
    goto LABEL_15;
LABEL_20:
  v41 = v36;
  v42 = (void *)sub_217847CBC();

  swift_willThrow();
  v43 = v42;
  v44 = v42;
  v45 = sub_217847EC0();
  v46 = sub_217848298();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v65[0] = v48;
    *(_DWORD *)v47 = 136315138;
    swift_getErrorValue();
    v49 = sub_21778EEE8(v64);
    sub_2177D06AC(v49, v50, v65);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_217765000, v45, v46, "Encountered error while trying to send payload to RTC: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v48, -1, -1);
    MEMORY[0x219A13268](v47, -1, -1);
  }
  else
  {

  }
  sub_21776B790(&qword_253F25BC0);
  sub_217848178();

}

uint64_t sub_217822460(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t SyncTelemetryReporter.postMessage(payload:category:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v17 = sub_217847F14();
  v5 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_217847EF0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v2 + OBJC_IVAR___IMDSyncTelemetryReporterInternal_reportingQueue);
  sub_217847EE4();
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a2;
  v13[4] = a1;
  aBlock[4] = sub_217822A30;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217822460;
  aBlock[3] = &unk_24D80F330;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_217847F08();
  MEMORY[0x219A124B8](0, v7, v11, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

void sub_217822654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x219A13328](v5);

  if (v6)
  {
    swift_beginAccess();
    v7 = MEMORY[0x219A13328](v5);
    if (v7)
    {
      v8 = (void *)v7;
      sub_217822BA8(a2, a3);

    }
  }
}

id SyncTelemetryReporter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_217822984()
{
  uint64_t v0;

  if (qword_253F25AD0 != -1)
    swift_once();
  v0 = qword_253F28E18;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_2178229E0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_217822A04()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_217822A30()
{
  uint64_t *v0;

  sub_217822654(v0[2], v0[3], v0[4]);
}

uint64_t sub_217822A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_217822A4C()
{
  return swift_release();
}

uint64_t type metadata accessor for SyncTelemetryReporter()
{
  return objc_opt_self();
}

uint64_t sub_217822A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21776B790(&qword_253F25BC0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_217822B18()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_21776B790(&qword_253F25BC0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_217821AB8(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(unsigned __int8 *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(unsigned __int8 *)(v0 + 72), *(_QWORD *)(v0 + 80), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

void sub_217822BA8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37[2];

  v37[1] = *(id *)MEMORY[0x24BDAC8D0];
  ObjectType = swift_getObjectType();
  if (a1 < 1)
  {
    if (qword_253F25B98 != -1)
      swift_once();
    v13 = sub_217847ED8();
    sub_21776F584(v13, (uint64_t)qword_253F28E80);
    v14 = sub_217847EC0();
    v15 = sub_217848298();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_217765000, v14, v15, "RTCReporting reserves category==0, a value greater than 0 must be supplied.", v16, 2u);
      MEMORY[0x219A13268](v16, -1, -1);
    }

  }
  else
  {
    v5 = ObjectType;
    if (qword_253F25B98 != -1)
      swift_once();
    v6 = sub_217847ED8();
    sub_21776F584(v6, (uint64_t)qword_253F28E80);
    swift_bridgeObjectRetain_n();
    v7 = sub_217847EC0();
    v8 = sub_2178482B0();
    v36 = a2;
    if (os_log_type_enabled(v7, v8))
    {
      v9 = swift_slowAlloc();
      v35 = (void *)swift_slowAlloc();
      v37[0] = v35;
      *(_DWORD *)v9 = 136315906;
      sub_2177D06AC(0xD00000000000002BLL, 0x8000000217854820, (uint64_t *)v37);
      sub_2178484E4();
      *(_WORD *)(v9 + 12) = 2080;
      swift_bridgeObjectRetain();
      v10 = sub_217847F38();
      v12 = v11;
      swift_bridgeObjectRelease();
      sub_2177D06AC(v10, v12, (uint64_t *)v37);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 22) = 2048;
      sub_2178484E4();
      *(_WORD *)(v9 + 32) = 2048;
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v7, v8, "[SyncTelemetryReporting:%s]: Sending payload to RTC: %s, category: %ld, event: %ld", (uint8_t *)v9, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v35, -1, -1);
      MEMORY[0x219A13268](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_253F28F10)
    {
      v17 = sub_21776E3A4((_QWORD *)(qword_253F28F10 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(qword_253F28F10 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
      v18 = *(_QWORD *)(*v17 + 32);
      v19 = *(_QWORD *)(*v17 + 40);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      v20 = sub_217822984();
      v34 = v5;
      v22 = sub_21781C578(38, 0, 0, 0, v20, v21, v18, v19);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      v23 = sub_217822984();
      v34 = v5;
      v22 = sub_21781C578(38, 0, 0, 0, v23, v24, 0, 0);
      swift_bridgeObjectRelease();
    }
    v25 = sub_217822984();
    v27 = sub_21781C764(v25, v26, 0x746C7561666544, 0xE700000000000000);
    swift_bridgeObjectRelease();
    sub_217820838(v22);
    swift_bridgeObjectRelease();
    v28 = (void *)sub_217847F20();
    swift_bridgeObjectRelease();
    sub_217820838(v27);
    swift_bridgeObjectRelease();
    v29 = (void *)sub_217847F20();
    swift_bridgeObjectRelease();
    if ((unint64_t)a1 >= 0x10000)
    {
      sub_21784873C();
      __break(1u);
    }
    else
    {
      v30 = (void *)objc_opt_self();
      sub_217820838(v36);
      v31 = (void *)sub_217847F20();
      swift_bridgeObjectRelease();
      v37[0] = 0;
      LODWORD(v30) = objc_msgSend(v30, sel_sendOneMessageWithSessionInfo_userInfo_category_type_payload_error_, v28, v29, (unsigned __int16)a1, 0, v31, v37, v34, &off_24D80F358);

      if ((_DWORD)v30)
      {
        v32 = v37[0];
      }
      else
      {
        v33 = v37[0];
        sub_217847CBC();

        swift_willThrow();
      }
    }
  }
}

void sub_2178231E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v2 = sub_21776B790((uint64_t *)&unk_253F259D0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ActionRecord();
  if (*(_QWORD *)(a1 + *(int *)(v5 + 68) + 8))
  {
    swift_bridgeObjectRetain();
    v6 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  sub_21777B5D4(a1 + *(int *)(v5 + 64), (uint64_t)v4);
  v7 = sub_217847E3C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) != 1)
  {
    v9 = (void *)sub_217847DD0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
  }
  if (*(_QWORD *)(a1 + 8))
  {
    swift_bridgeObjectRetain();
    v10 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSender_time_guid_type_, v6, v9, v10, 5);

  if (v11)
    sub_2177B94AC(a1);
  else
    __break(1u);
}

void sub_217823378(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v3, sel_setActionType_, objc_msgSend(*(id *)(a1 + 40), sel_messageActionType));
    v5 = v4;
    v6 = objc_msgSend(v5, sel_originalMessageGuid);
    if (v6)
    {
      v7 = v6;
      sub_217847F98();

      v8 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
    }
    else
    {

      v8 = 0;
    }
    objc_msgSend(v3, sel_setOriginalMessageGUID_, v8);

    sub_2177BB810();
    if (v16)
    {
      v17 = (id)sub_217847F74();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v3, sel_setOtherHandle_, v17);

  }
  else
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    v11 = sub_217847ED8();
    sub_21776F584(v11, (uint64_t)qword_253F28FE8);
    swift_bridgeObjectRetain_n();
    v12 = sub_217847EC0();
    v13 = sub_217848298();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v18 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      sub_2177D06AC(a2, a3, &v18);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v12, v13, "No Proto for IMMessageActionItem %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v15, -1, -1);
      MEMORY[0x219A13268](v14, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_217823614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  __int128 v10;
  char v11;
  uint64_t v12;
  char v13;

  *(_BYTE *)(v8 + 1315) = v13;
  *(_QWORD *)(v8 + 1176) = v12;
  *(_BYTE *)(v8 + 1314) = v11;
  *(_OWORD *)(v8 + 1160) = v10;
  *(_BYTE *)(v8 + 1313) = a8;
  *(_QWORD *)(v8 + 1152) = a7;
  *(_QWORD *)(v8 + 1144) = a6;
  *(_BYTE *)(v8 + 1312) = a5;
  *(_QWORD *)(v8 + 1136) = a4;
  *(_QWORD *)(v8 + 1128) = a3;
  *(_QWORD *)(v8 + 1120) = a1;
  return swift_task_switch();
}

uint64_t sub_21782366C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 1120);
  v2 = OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState;
  *(_QWORD *)(v0 + 1184) = OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState;
  sub_21776E3A4((_QWORD *)(v1 + v2), *(_QWORD *)(v1 + v2 + 24));
  if ((sub_21784167C(2u, 0) & 1) != 0)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v3 = sub_217847ED8();
    sub_21776F584(v3, (uint64_t)qword_253F28DC8);
    v4 = sub_217847EC0();
    v5 = sub_217848298();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_217765000, v4, v5, "Messages in iCloud Exit Record present in cache", v6, 2u);
      MEMORY[0x219A13268](v6, -1, -1);
    }

  }
  else if ((sub_21784167C(1u, 0) & 1) == 0)
  {
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v7 = qword_253F28DB8;
  *(_QWORD *)(v0 + 1192) = qword_253F28DB8;
  if (!v7)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v8 = qword_253F28DC0;
  *(_QWORD *)(v0 + 1200) = qword_253F28DC0;
  *(_QWORD *)(v0 + 1208) = *(_QWORD *)(v8 + 280);
  if (qword_253F25B38 != -1)
    swift_once();
  *(_QWORD *)(v0 + 1216) = sub_21784819C();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_217823830()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 1316) = (*(uint64_t (**)(void))(v0 + 1208))() & 1;
  return swift_task_switch();
}

uint64_t sub_217823880()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  unint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;

  if (*(_BYTE *)(v0 + 1316) != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (qword_253F28DB8)
  {
    v1 = (*(uint64_t (**)(void))(qword_253F28DC0 + 288))();
    if (v1)
      goto LABEL_12;
  }
  else
  {
    if (qword_253F25B98 != -1)
      swift_once();
    v3 = sub_217847ED8();
    sub_21776F584(v3, (uint64_t)qword_253F28E80);
    v4 = sub_217847EC0();
    v5 = sub_217848298();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_217765000, v4, v5, "Encountered error accessing DaemonCoreBridge when grabbing initial sync state.", v6, 2u);
      MEMORY[0x219A13268](v6, -1, -1);
    }

  }
  v1 = sub_2177F3220(MEMORY[0x24BEE4AF8]);
LABEL_12:
  v7 = v1;
  v8 = (unint64_t *)(v0 + 1112);
  *(_QWORD *)(v0 + 1112) = v1;
  v9 = sub_217826430(*(_BYTE *)(v0 + 1315));
  *(_QWORD *)(v0 + 128) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 104) = v9;
  *(_QWORD *)(v0 + 112) = v10;
  sub_217826954(v0 + 104, v0 + 136);
  if (*(_QWORD *)(v0 + 160))
  {
    sub_21776F574((_OWORD *)(v0 + 136), (_OWORD *)(v0 + 584));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 584), 0x6D614E70756F7267, 0xE900000000000065, isUniquelyReferenced_nonNull_native);
    *v8 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 136);
    sub_21782699C(0x6D614E70756F7267, 0xE900000000000065, (_OWORD *)(v0 + 168));
    sub_2177801A8(v0 + 168);
  }
  sub_2177801A8(v0 + 104);
  v12 = sub_217847E48();
  *(_QWORD *)(v0 + 224) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 200) = v12;
  *(_QWORD *)(v0 + 208) = v13;
  sub_217826954(v0 + 200, v0 + 232);
  if (*(_QWORD *)(v0 + 256))
  {
    sub_21776F574((_OWORD *)(v0 + 232), (_OWORD *)(v0 + 1064));
    v14 = *v8;
    v15 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1064), 0x73736553636E7973, 0xED000044496E6F69, v15);
    *v8 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 232);
    sub_21782699C(0x73736553636E7973, 0xED000044496E6F69, (_OWORD *)(v0 + 264));
    sub_2177801A8(v0 + 264);
  }
  v16 = (_QWORD *)(*(_QWORD *)(v0 + 1120) + *(_QWORD *)(v0 + 1184));
  sub_2177801A8(v0 + 200);
  v17 = sub_21776E3A4(v16, v16[3]);
  v18 = *(_QWORD *)(*v17 + 32);
  v19 = *(_QWORD *)(*v17 + 40);
  *(_QWORD *)(v0 + 320) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 296) = v18;
  *(_QWORD *)(v0 + 304) = v19;
  sub_217826954(v0 + 296, v0 + 328);
  if (*(_QWORD *)(v0 + 352))
  {
    sub_21776F574((_OWORD *)(v0 + 328), (_OWORD *)(v0 + 1032));
    swift_bridgeObjectRetain();
    v20 = *v8;
    v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1032), 0x4449656369766564, 0xE800000000000000, v21);
    *v8 = v20;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2177801A8(v0 + 328);
    sub_21782699C(0x4449656369766564, 0xE800000000000000, (_OWORD *)(v0 + 360));
    sub_2177801A8(v0 + 360);
  }
  v22 = *(_QWORD *)(v0 + 1120);
  sub_2177801A8(v0 + 296);
  sub_21776E3A4((_QWORD *)(v22 + 16), *(_QWORD *)(v22 + 40));
  v23 = sub_217848220();
  v24 = sub_2177708D8();
  *(_QWORD *)(v0 + 416) = v24;
  *(_QWORD *)(v0 + 392) = v23;
  sub_217826954(v0 + 392, v0 + 424);
  if (*(_QWORD *)(v0 + 448))
  {
    sub_21776F574((_OWORD *)(v0 + 424), (_OWORD *)(v0 + 1000));
    v25 = *v8;
    v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1000), 0x65707954636E7973, 0xE800000000000000, v26);
    *v8 = v25;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 424);
    sub_21782699C(0x65707954636E7973, 0xE800000000000000, (_OWORD *)(v0 + 456));
    sub_2177801A8(v0 + 456);
  }
  sub_2177801A8(v0 + 392);
  v27 = sub_217848220();
  *(_QWORD *)(v0 + 512) = v24;
  *(_QWORD *)(v0 + 488) = v27;
  sub_217826954(v0 + 488, v0 + 520);
  if (*(_QWORD *)(v0 + 544))
  {
    sub_21776F574((_OWORD *)(v0 + 520), (_OWORD *)(v0 + 968));
    v28 = *v8;
    v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 968), 0x65747441636E7973, 0xEC0000007374706DLL, v29);
    *v8 = v28;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 520);
    sub_21782699C(0x65747441636E7973, 0xEC0000007374706DLL, (_OWORD *)(v0 + 552));
    sub_2177801A8(v0 + 552);
  }
  sub_2177801A8(v0 + 488);
  v30 = qword_253F28DB8;
  *(_QWORD *)(v0 + 1224) = qword_253F28DB8;
  if (v30)
  {
    v31 = qword_253F28DC0;
    *(_QWORD *)(v0 + 1232) = qword_253F28DC0;
    *(_QWORD *)(v0 + 1240) = *(_QWORD *)(v31 + 272);
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    v32 = *(_QWORD *)(v0 + 1136);
    if (v32)
    {
      v33 = *(_QWORD *)(v0 + 1128);
      *(_QWORD *)(v0 + 96) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v0 + 72) = v33;
      *(_QWORD *)(v0 + 80) = v32;
      sub_217826954(v0 + 72, v0 + 616);
      if (*(_QWORD *)(v0 + 640))
      {
        sub_21776F574((_OWORD *)(v0 + 616), (_OWORD *)(v0 + 680));
        swift_bridgeObjectRetain();
        v34 = *v8;
        v35 = swift_isUniquelyReferenced_nonNull_native();
        sub_2177F82D4((_OWORD *)(v0 + 680), 0x64616F6C796170, 0xE700000000000000, v35);
        *v8 = v34;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_2177801A8(v0 + 616);
        sub_21782699C(0x64616F6C796170, 0xE700000000000000, (_OWORD *)(v0 + 648));
        sub_2177801A8(v0 + 648);
      }
      sub_2177801A8(v0 + 72);
    }
    v36 = *(_QWORD *)(v0 + 1176);
    v37 = *(_BYTE *)(v0 + 1314);
    v38 = *(_QWORD *)(v0 + 1168);
    v39 = *(_QWORD *)(v0 + 1160);
    v40 = *(_BYTE *)(v0 + 1313);
    v41 = *(_QWORD *)(v0 + 1152);
    v42 = *(_QWORD *)(v0 + 1144);
    sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 1120) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService), *(_QWORD *)(*(_QWORD *)(v0 + 1120) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService + 24));
    v43 = *(_QWORD *)(v0 + 1112);
    *(_QWORD *)(v0 + 1296) = v43;
    *(_QWORD *)(v0 + 16) = v42;
    *(_QWORD *)(v0 + 24) = v41;
    *(_BYTE *)(v0 + 32) = v40;
    *(_QWORD *)(v0 + 40) = v39;
    *(_QWORD *)(v0 + 48) = v38;
    *(_BYTE *)(v0 + 56) = v37;
    *(_QWORD *)(v0 + 64) = v36;
    v45 = (char *)&dword_254F03230 + dword_254F03230;
    v44 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1304) = v44;
    *v44 = v0;
    v44[1] = sub_2178246B4;
    return ((uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))v45)(*(unsigned __int8 *)(v0 + 1315), v43, *(unsigned __int8 *)(v0 + 1312), v0 + 16);
  }
}

uint64_t sub_217824058()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 1248) = (*(uint64_t (**)(void))(v0 + 1240))();
  *(_QWORD *)(v0 + 1256) = v1;
  return swift_task_switch();
}

uint64_t sub_2178240A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(char, uint64_t, char, uint64_t);

  v1 = (uint64_t *)(v0 + 1112);
  v2 = *(_QWORD *)(v0 + 1256);
  v3 = *(_QWORD *)(v0 + 1248);
  v4 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 864) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 840) = v3;
  *(_QWORD *)(v0 + 848) = v2;
  sub_217826954(v0 + 840, v0 + 872);
  if (*(_QWORD *)(v0 + 896))
  {
    sub_21776F574((_OWORD *)(v0 + 872), (_OWORD *)(v0 + 936));
    v5 = *(_QWORD *)(v0 + 1112);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 936), 0x7453656369766564, 0xEB00000000657461, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v0 + 1112) = v5;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 872);
    sub_21782699C(0x7453656369766564, 0xEB00000000657461, (_OWORD *)(v0 + 904));
    sub_2177801A8(v0 + 904);
  }
  sub_2177801A8(v0 + 840);
  v7 = qword_253F28DB8;
  *(_QWORD *)(v0 + 1264) = qword_253F28DB8;
  if (v7)
  {
    v8 = qword_253F28DC0;
    *(_QWORD *)(v0 + 1272) = qword_253F28DC0;
    *(_QWORD *)(v0 + 1280) = *(_QWORD *)(v8 + 216);
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 1136);
    if (v10)
    {
      v11 = *(_QWORD *)(v0 + 1128);
      *(_QWORD *)(v0 + 96) = v4;
      *(_QWORD *)(v0 + 72) = v11;
      *(_QWORD *)(v0 + 80) = v10;
      sub_217826954(v0 + 72, v0 + 616);
      if (*(_QWORD *)(v0 + 640))
      {
        sub_21776F574((_OWORD *)(v0 + 616), (_OWORD *)(v0 + 680));
        swift_bridgeObjectRetain();
        v12 = *v1;
        v13 = swift_isUniquelyReferenced_nonNull_native();
        sub_2177F82D4((_OWORD *)(v0 + 680), 0x64616F6C796170, 0xE700000000000000, v13);
        *v1 = v12;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_2177801A8(v0 + 616);
        sub_21782699C(0x64616F6C796170, 0xE700000000000000, (_OWORD *)(v0 + 648));
        sub_2177801A8(v0 + 648);
      }
      sub_2177801A8(v0 + 72);
    }
    v14 = *(_QWORD *)(v0 + 1176);
    v15 = *(_BYTE *)(v0 + 1314);
    v16 = *(_QWORD *)(v0 + 1168);
    v17 = *(_QWORD *)(v0 + 1160);
    v18 = *(_BYTE *)(v0 + 1313);
    v19 = *(_QWORD *)(v0 + 1152);
    v20 = *(_QWORD *)(v0 + 1144);
    sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 1120) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService), *(_QWORD *)(*(_QWORD *)(v0 + 1120) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService + 24));
    v21 = *(_QWORD *)(v0 + 1112);
    *(_QWORD *)(v0 + 1296) = v21;
    *(_QWORD *)(v0 + 16) = v20;
    *(_QWORD *)(v0 + 24) = v19;
    *(_BYTE *)(v0 + 32) = v18;
    *(_QWORD *)(v0 + 40) = v17;
    *(_QWORD *)(v0 + 48) = v16;
    *(_BYTE *)(v0 + 56) = v15;
    *(_QWORD *)(v0 + 64) = v14;
    v23 = (uint64_t (*)(char, uint64_t, char, uint64_t))((char *)&dword_254F03230 + dword_254F03230);
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1304) = v22;
    *v22 = v0;
    v22[1] = sub_2178246B4;
    return v23(*(_BYTE *)(v0 + 1315), v21, *(_BYTE *)(v0 + 1312), v0 + 16);
  }
}

uint64_t sub_2178243BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 1096) = (*(uint64_t (**)(void))(v0 + 1280))();
  *(_QWORD *)(v0 + 1104) = v1;
  *(_QWORD *)(v0 + 1288) = v1;
  return swift_task_switch();
}

uint64_t sub_217824410()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t (*v21)(char, uint64_t, char, uint64_t);

  v1 = (uint64_t *)(v0 + 1112);
  v2 = *(_QWORD *)(v0 + 1288);
  v3 = MEMORY[0x24BEE0D00];
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 1096);
    *(_QWORD *)(v0 + 736) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 712) = v4;
    *(_QWORD *)(v0 + 720) = v2;
    sub_217826954(v0 + 712, v0 + 744);
    if (*(_QWORD *)(v0 + 768))
    {
      sub_21776F574((_OWORD *)(v0 + 744), (_OWORD *)(v0 + 808));
      v5 = *v1;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_2177F82D4((_OWORD *)(v0 + 808), 0x437972746E756F63, 0xEB0000000065646FLL, isUniquelyReferenced_nonNull_native);
      *v1 = v5;
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2177801A8(v0 + 744);
      sub_21782699C(0x437972746E756F63, 0xEB0000000065646FLL, (_OWORD *)(v0 + 776));
      sub_2177801A8(v0 + 776);
    }
    sub_2177801A8(v0 + 712);
  }
  v7 = *(_QWORD *)(v0 + 1136);
  if (v7)
  {
    v8 = *(_QWORD *)(v0 + 1128);
    *(_QWORD *)(v0 + 96) = v3;
    *(_QWORD *)(v0 + 72) = v8;
    *(_QWORD *)(v0 + 80) = v7;
    sub_217826954(v0 + 72, v0 + 616);
    if (*(_QWORD *)(v0 + 640))
    {
      sub_21776F574((_OWORD *)(v0 + 616), (_OWORD *)(v0 + 680));
      swift_bridgeObjectRetain();
      v9 = *v1;
      v10 = swift_isUniquelyReferenced_nonNull_native();
      sub_2177F82D4((_OWORD *)(v0 + 680), 0x64616F6C796170, 0xE700000000000000, v10);
      *v1 = v9;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_2177801A8(v0 + 616);
      sub_21782699C(0x64616F6C796170, 0xE700000000000000, (_OWORD *)(v0 + 648));
      sub_2177801A8(v0 + 648);
    }
    sub_2177801A8(v0 + 72);
  }
  v11 = *(_QWORD *)(v0 + 1176);
  v12 = *(_BYTE *)(v0 + 1314);
  v13 = *(_QWORD *)(v0 + 1168);
  v14 = *(_QWORD *)(v0 + 1160);
  v15 = *(_BYTE *)(v0 + 1313);
  v16 = *(_QWORD *)(v0 + 1152);
  v17 = *(_QWORD *)(v0 + 1144);
  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 1120) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService), *(_QWORD *)(*(_QWORD *)(v0 + 1120) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService + 24));
  v18 = *(_QWORD *)(v0 + 1112);
  *(_QWORD *)(v0 + 1296) = v18;
  *(_QWORD *)(v0 + 16) = v17;
  *(_QWORD *)(v0 + 24) = v16;
  *(_BYTE *)(v0 + 32) = v15;
  *(_QWORD *)(v0 + 40) = v14;
  *(_QWORD *)(v0 + 48) = v13;
  *(_BYTE *)(v0 + 56) = v12;
  *(_QWORD *)(v0 + 64) = v11;
  v21 = (uint64_t (*)(char, uint64_t, char, uint64_t))((char *)&dword_254F03230 + dword_254F03230);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1304) = v19;
  *v19 = v0;
  v19[1] = sub_2178246B4;
  return v21(*(_BYTE *)(v0 + 1315), v18, *(_BYTE *)(v0 + 1312), v0 + 16);
}

uint64_t sub_2178246B4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_217824714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  char v12;
  __int128 v13;
  char v14;
  uint64_t v15;
  char v16;

  *(_BYTE *)(v8 + 1996) = v16;
  *(_QWORD *)(v8 + 1800) = v15;
  *(_BYTE *)(v8 + 1995) = v14;
  *(_OWORD *)(v8 + 1784) = v13;
  *(_BYTE *)(v8 + 1994) = v12;
  *(_OWORD *)(v8 + 1768) = v11;
  *(_BYTE *)(v8 + 1993) = a8;
  *(_QWORD *)(v8 + 1760) = a7;
  *(_BYTE *)(v8 + 1992) = a6;
  *(_QWORD *)(v8 + 1752) = a3;
  *(_QWORD *)(v8 + 1744) = a1;
  sub_217847FC8();
  *(_QWORD *)(v8 + 1808) = swift_task_alloc();
  v9 = sub_217847E3C();
  *(_QWORD *)(v8 + 1816) = v9;
  *(_QWORD *)(v8 + 1824) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 1832) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2178247DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 1744);
  v2 = OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState;
  *(_QWORD *)(v0 + 1840) = OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState;
  sub_21776E3A4((_QWORD *)(v1 + v2), *(_QWORD *)(v1 + v2 + 24));
  if ((sub_21784167C(2u, 0) & 1) != 0)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v3 = sub_217847ED8();
    sub_21776F584(v3, (uint64_t)qword_253F28DC8);
    v4 = sub_217847EC0();
    v5 = sub_217848298();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_217765000, v4, v5, "Messages in iCloud Exit Record present in cache", v6, 2u);
      MEMORY[0x219A13268](v6, -1, -1);
    }

  }
  else if ((sub_21784167C(1u, 0) & 1) == 0)
  {
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v7 = qword_253F28DB8;
  *(_QWORD *)(v0 + 1848) = qword_253F28DB8;
  if (!v7)
    goto LABEL_12;
  v8 = qword_253F28DC0;
  *(_QWORD *)(v0 + 1856) = qword_253F28DC0;
  *(_QWORD *)(v0 + 1864) = *(_QWORD *)(v8 + 280);
  if (qword_253F25B38 != -1)
    swift_once();
  *(_QWORD *)(v0 + 1872) = sub_21784819C();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_2178249B4()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 1997) = (*(uint64_t (**)(void))(v0 + 1864))() & 1;
  return swift_task_switch();
}

uint64_t sub_217824A04()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  unint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  _OWORD *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  if (*(_BYTE *)(v0 + 1997) != 1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_253F28DB8)
  {
    v1 = (*(uint64_t (**)(void))(qword_253F28DC0 + 288))();
    if (v1)
      goto LABEL_12;
  }
  else
  {
    if (qword_253F25B98 != -1)
      swift_once();
    v3 = sub_217847ED8();
    sub_21776F584(v3, (uint64_t)qword_253F28E80);
    v4 = sub_217847EC0();
    v5 = sub_217848298();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_217765000, v4, v5, "Encountered error accessing DaemonCoreBridge when grabbing initial sync state.", v6, 2u);
      MEMORY[0x219A13268](v6, -1, -1);
    }

  }
  v1 = sub_2177F3220(MEMORY[0x24BEE4AF8]);
LABEL_12:
  v7 = v1;
  v8 = (unint64_t *)(v0 + 1736);
  *(_QWORD *)(v0 + 1736) = v1;
  v9 = sub_217826430(*(_BYTE *)(v0 + 1996));
  *(_QWORD *)(v0 + 184) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 160) = v9;
  *(_QWORD *)(v0 + 168) = v10;
  sub_217826954(v0 + 160, v0 + 192);
  if (*(_QWORD *)(v0 + 216))
  {
    sub_21776F574((_OWORD *)(v0 + 192), (_OWORD *)(v0 + 960));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 960), 0x6D614E70756F7267, 0xE900000000000065, isUniquelyReferenced_nonNull_native);
    *v8 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 192);
    sub_21782699C(0x6D614E70756F7267, 0xE900000000000065, (_OWORD *)(v0 + 224));
    sub_2177801A8(v0 + 224);
  }
  sub_2177801A8(v0 + 160);
  v12 = sub_217848220();
  v48 = sub_2177708D8();
  *(_QWORD *)(v0 + 280) = v48;
  *(_QWORD *)(v0 + 256) = v12;
  sub_217826954(v0 + 256, v0 + 288);
  if (*(_QWORD *)(v0 + 312))
  {
    sub_21776F574((_OWORD *)(v0 + 288), (_OWORD *)(v0 + 992));
    v13 = *v8;
    v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 992), 0x65747441636E7973, 0xEC0000007374706DLL, v14);
    *v8 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 288);
    sub_21782699C(0x65747441636E7973, 0xEC0000007374706DLL, (_OWORD *)(v0 + 320));
    sub_2177801A8(v0 + 320);
  }
  v47 = v0 + 448;
  v15 = *(unsigned __int8 *)(v0 + 1992);
  sub_2177801A8(v0 + 256);
  v16 = v15 >> 6;
  if (v15 <= 0x3F)
  {
    v17 = v0 + 1568;
    v18 = (_OWORD *)(v0 + 1600);
    if ((*(_BYTE *)(v0 + 1992) & 1) != 0)
      sub_2178488E0();
    swift_bridgeObjectRelease();
    v21 = sub_2178484A8();
    *(_QWORD *)(v0 + 1592) = v48;
    *(_QWORD *)(v0 + 1568) = v21;
    sub_217826954(v0 + 1568, v0 + 1600);
    if (*(_QWORD *)(v0 + 1624))
    {
      v20 = (_OWORD *)(v0 + 1664);
      goto LABEL_26;
    }
    v24 = (_OWORD *)(v0 + 1632);
LABEL_29:
    sub_2177801A8((uint64_t)v18);
    sub_21782699C(0x63637553636E7973, 0xEB00000000737365, v24);
    sub_2177801A8((uint64_t)v24);
    goto LABEL_30;
  }
  v17 = v0 + 352;
  v18 = (_OWORD *)(v0 + 384);
  v19 = sub_2178484A8();
  *(_QWORD *)(v0 + 376) = v48;
  *(_QWORD *)(v0 + 352) = v19;
  sub_217826954(v0 + 352, v0 + 384);
  if (!*(_QWORD *)(v0 + 408))
  {
    v24 = (_OWORD *)(v0 + 416);
    goto LABEL_29;
  }
  v20 = (_OWORD *)(v0 + 1536);
LABEL_26:
  sub_21776F574(v18, v20);
  v22 = *v8;
  v23 = swift_isUniquelyReferenced_nonNull_native();
  sub_2177F82D4(v20, 0x63637553636E7973, 0xEB00000000737365, v23);
  *v8 = v22;
  swift_bridgeObjectRelease();
LABEL_30:
  sub_2177801A8(v17);
  if (v16)
  {
    if (v16 == 1)
    {
      v25 = 0xE800000000000000;
      v26 = 0x6465727265666564;
    }
    else
    {
      v25 = 0xEB0000000064656CLL;
      v26 = 0x7564656863736572;
    }
  }
  else
  {
    v25 = 0xE800000000000000;
    v26 = 0x64656873696E6966;
  }
  *(_QWORD *)(v0 + 472) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 448) = v26;
  *(_QWORD *)(v0 + 456) = v25;
  sub_217826954(v47, v0 + 480);
  if (*(_QWORD *)(v0 + 504))
  {
    sub_21776F574((_OWORD *)(v0 + 480), (_OWORD *)(v0 + 1504));
    v27 = *v8;
    v28 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1504), 0x74617453636E7973, 0xEA00000000007375, v28);
    *v8 = v27;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 480);
    sub_21782699C(0x74617453636E7973, 0xEA00000000007375, (_OWORD *)(v0 + 512));
    sub_2177801A8(v0 + 512);
  }
  sub_2177801A8(v47);
  sub_217847E24();
  sub_217847DC4();
  v29 = sub_2178481FC();
  *(_QWORD *)(v0 + 568) = v48;
  *(_QWORD *)(v0 + 544) = v29;
  sub_217826954(v0 + 544, v0 + 576);
  if (*(_QWORD *)(v0 + 600))
  {
    sub_21776F574((_OWORD *)(v0 + 576), (_OWORD *)(v0 + 1472));
    v30 = *v8;
    v31 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1472), 0x61727544636E7973, 0xEC0000006E6F6974, v31);
    *v8 = v30;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 576);
    sub_21782699C(0x61727544636E7973, 0xEC0000006E6F6974, (_OWORD *)(v0 + 608));
    sub_2177801A8(v0 + 608);
  }
  sub_2177801A8(v0 + 544);
  v32 = sub_217847E48();
  *(_QWORD *)(v0 + 664) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 640) = v32;
  *(_QWORD *)(v0 + 648) = v33;
  sub_217826954(v0 + 640, v0 + 672);
  if (*(_QWORD *)(v0 + 696))
  {
    sub_21776F574((_OWORD *)(v0 + 672), (_OWORD *)(v0 + 1440));
    v34 = *v8;
    v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1440), 0x73736553636E7973, 0xED000044496E6F69, v35);
    *v8 = v34;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 672);
    sub_21782699C(0x73736553636E7973, 0xED000044496E6F69, (_OWORD *)(v0 + 704));
    sub_2177801A8(v0 + 704);
  }
  v36 = (_QWORD *)(*(_QWORD *)(v0 + 1744) + *(_QWORD *)(v0 + 1840));
  sub_2177801A8(v0 + 640);
  v37 = sub_21776E3A4(v36, v36[3]);
  v38 = *(_QWORD *)(*v37 + 32);
  v39 = *(_QWORD *)(*v37 + 40);
  *(_QWORD *)(v0 + 760) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 736) = v38;
  *(_QWORD *)(v0 + 744) = v39;
  sub_217826954(v0 + 736, v0 + 768);
  if (*(_QWORD *)(v0 + 792))
  {
    sub_21776F574((_OWORD *)(v0 + 768), (_OWORD *)(v0 + 1408));
    swift_bridgeObjectRetain();
    v40 = *v8;
    v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1408), 0x4449656369766564, 0xE800000000000000, v41);
    *v8 = v40;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2177801A8(v0 + 768);
    sub_21782699C(0x4449656369766564, 0xE800000000000000, (_OWORD *)(v0 + 800));
    sub_2177801A8(v0 + 800);
  }
  v42 = *(_QWORD *)(v0 + 1744);
  sub_2177801A8(v0 + 736);
  sub_21776E3A4((_QWORD *)(v42 + 16), *(_QWORD *)(v42 + 40));
  v43 = sub_217848220();
  *(_QWORD *)(v0 + 856) = v48;
  *(_QWORD *)(v0 + 832) = v43;
  sub_217826954(v0 + 832, v0 + 864);
  if (*(_QWORD *)(v0 + 888))
  {
    sub_21776F574((_OWORD *)(v0 + 864), (_OWORD *)(v0 + 1376));
    v44 = *v8;
    v45 = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1376), 0x65707954636E7973, 0xE800000000000000, v45);
    *v8 = v44;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 864);
    sub_21782699C(0x65707954636E7973, 0xE800000000000000, (_OWORD *)(v0 + 896));
    sub_2177801A8(v0 + 896);
  }
  v46 = *(_QWORD *)(v0 + 1744);
  sub_2177801A8(v0 + 832);
  *(_QWORD *)(v0 + 1880) = *(_QWORD *)(v46 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_statsCollector);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2178253BC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  if (qword_253F25A90 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 1880);
  swift_beginAccess();
  v2 = *(_BYTE *)(v1 + 136);
  v4 = *(_QWORD *)(v1 + 144);
  v3 = *(_QWORD *)(v1 + 152);
  v6 = *(_QWORD *)(v1 + 160);
  v5 = *(_QWORD *)(v1 + 168);
  v8 = *(_QWORD *)(v1 + 176);
  v7 = *(_QWORD *)(v1 + 184);
  v9 = *(_QWORD *)(v1 + 192);
  v10 = *(_OWORD *)(v1 + 120);
  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v1 + 112);
  *(_OWORD *)(v0 + 24) = v10;
  *(_BYTE *)(v0 + 40) = v2;
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v0 + 56) = v3;
  *(_QWORD *)(v0 + 64) = v6;
  *(_QWORD *)(v0 + 72) = v5;
  *(_QWORD *)(v0 + 80) = v8;
  *(_QWORD *)(v0 + 88) = v7;
  *(_QWORD *)(v0 + 96) = v9;
  sub_2177FC38C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_217847B60();
  v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_217847FBC();
  v14 = sub_217847FA4();
  v16 = v15;
  sub_21776BAD0(v11, v13);
  swift_release();
  if (!v16)
  {
    v16 = 0x8000000217853DE0;
    v14 = 0xD00000000000001ALL;
  }
  *(_QWORD *)(v0 + 1896) = v16;
  *(_QWORD *)(v0 + 1888) = v14;
  return swift_task_switch();
}

uint64_t sub_2178255E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v17)(char, uint64_t, char, uint64_t);

  v1 = *(_QWORD *)(v0 + 1896);
  v2 = *(_QWORD *)(v0 + 1888);
  *(_QWORD *)(v0 + 952) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 928) = v2;
  *(_QWORD *)(v0 + 936) = v1;
  sub_217826954(v0 + 928, v0 + 1024);
  if (*(_QWORD *)(v0 + 1048))
  {
    sub_21776F574((_OWORD *)(v0 + 1024), (_OWORD *)(v0 + 1344));
    v3 = *(_QWORD *)(v0 + 1736);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1344), 0x6E756F43636E7973, 0xEA00000000007374, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v0 + 1736) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 1024);
    sub_21782699C(0x6E756F43636E7973, 0xEA00000000007374, (_OWORD *)(v0 + 1056));
    sub_2177801A8(v0 + 1056);
  }
  sub_2177801A8(v0 + 928);
  v5 = qword_253F28DB8;
  *(_QWORD *)(v0 + 1904) = qword_253F28DB8;
  if (v5)
  {
    v6 = qword_253F28DC0;
    *(_QWORD *)(v0 + 1912) = qword_253F28DC0;
    *(_QWORD *)(v0 + 1920) = *(_QWORD *)(v6 + 272);
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 1800);
    v9 = *(_BYTE *)(v0 + 1995);
    v10 = *(_QWORD *)(v0 + 1792);
    v11 = *(_QWORD *)(v0 + 1784);
    v12 = *(_BYTE *)(v0 + 1994);
    v13 = *(_QWORD *)(v0 + 1776);
    v14 = *(_QWORD *)(v0 + 1768);
    sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 1744) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService), *(_QWORD *)(*(_QWORD *)(v0 + 1744) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService + 24));
    v15 = *(_QWORD *)(v0 + 1736);
    *(_QWORD *)(v0 + 1976) = v15;
    *(_QWORD *)(v0 + 104) = v14;
    *(_QWORD *)(v0 + 112) = v13;
    *(_BYTE *)(v0 + 120) = v12;
    *(_QWORD *)(v0 + 128) = v11;
    *(_QWORD *)(v0 + 136) = v10;
    *(_BYTE *)(v0 + 144) = v9;
    *(_QWORD *)(v0 + 152) = v8;
    v17 = (uint64_t (*)(char, uint64_t, char, uint64_t))((char *)&dword_254F03230 + dword_254F03230);
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1984) = v16;
    *v16 = v0;
    v16[1] = sub_217825CC4;
    return v17(*(_BYTE *)(v0 + 1996), v15, *(_BYTE *)(v0 + 1993), v0 + 104);
  }
}

uint64_t sub_217825814()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 1928) = (*(uint64_t (**)(void))(v0 + 1920))();
  *(_QWORD *)(v0 + 1936) = v1;
  return swift_task_switch();
}

uint64_t sub_217825864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v17)(char, uint64_t, char, uint64_t);

  v1 = *(_QWORD *)(v0 + 1936);
  v2 = *(_QWORD *)(v0 + 1928);
  *(_QWORD *)(v0 + 1240) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 1216) = v2;
  *(_QWORD *)(v0 + 1224) = v1;
  sub_217826954(v0 + 1216, v0 + 1248);
  if (*(_QWORD *)(v0 + 1272))
  {
    sub_21776F574((_OWORD *)(v0 + 1248), (_OWORD *)(v0 + 1312));
    v3 = *(_QWORD *)(v0 + 1736);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2177F82D4((_OWORD *)(v0 + 1312), 0x7453656369766564, 0xEB00000000657461, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v0 + 1736) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2177801A8(v0 + 1248);
    sub_21782699C(0x7453656369766564, 0xEB00000000657461, (_OWORD *)(v0 + 1280));
    sub_2177801A8(v0 + 1280);
  }
  sub_2177801A8(v0 + 1216);
  v5 = qword_253F28DB8;
  *(_QWORD *)(v0 + 1944) = qword_253F28DB8;
  if (v5)
  {
    v6 = qword_253F28DC0;
    *(_QWORD *)(v0 + 1952) = qword_253F28DC0;
    *(_QWORD *)(v0 + 1960) = *(_QWORD *)(v6 + 216);
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 1800);
    v9 = *(_BYTE *)(v0 + 1995);
    v10 = *(_QWORD *)(v0 + 1792);
    v11 = *(_QWORD *)(v0 + 1784);
    v12 = *(_BYTE *)(v0 + 1994);
    v13 = *(_QWORD *)(v0 + 1776);
    v14 = *(_QWORD *)(v0 + 1768);
    sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 1744) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService), *(_QWORD *)(*(_QWORD *)(v0 + 1744) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService + 24));
    v15 = *(_QWORD *)(v0 + 1736);
    *(_QWORD *)(v0 + 1976) = v15;
    *(_QWORD *)(v0 + 104) = v14;
    *(_QWORD *)(v0 + 112) = v13;
    *(_BYTE *)(v0 + 120) = v12;
    *(_QWORD *)(v0 + 128) = v11;
    *(_QWORD *)(v0 + 136) = v10;
    *(_BYTE *)(v0 + 144) = v9;
    *(_QWORD *)(v0 + 152) = v8;
    v17 = (uint64_t (*)(char, uint64_t, char, uint64_t))((char *)&dword_254F03230 + dword_254F03230);
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1984) = v16;
    *v16 = v0;
    v16[1] = sub_217825CC4;
    return v17(*(_BYTE *)(v0 + 1996), v15, *(_BYTE *)(v0 + 1993), v0 + 104);
  }
}

uint64_t sub_217825AA0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 1720) = (*(uint64_t (**)(void))(v0 + 1960))();
  *(_QWORD *)(v0 + 1728) = v1;
  *(_QWORD *)(v0 + 1968) = v1;
  return swift_task_switch();
}

uint64_t sub_217825AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(char, uint64_t, char, uint64_t);

  v1 = *(_QWORD *)(v0 + 1968);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 1720);
    v3 = (uint64_t *)(v0 + 1736);
    *(_QWORD *)(v0 + 1112) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 1088) = v2;
    *(_QWORD *)(v0 + 1096) = v1;
    sub_217826954(v0 + 1088, v0 + 1120);
    if (*(_QWORD *)(v0 + 1144))
    {
      sub_21776F574((_OWORD *)(v0 + 1120), (_OWORD *)(v0 + 1184));
      v4 = *v3;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_2177F82D4((_OWORD *)(v0 + 1184), 0x437972746E756F63, 0xEB0000000065646FLL, isUniquelyReferenced_nonNull_native);
      *v3 = v4;
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2177801A8(v0 + 1120);
      sub_21782699C(0x437972746E756F63, 0xEB0000000065646FLL, (_OWORD *)(v0 + 1152));
      sub_2177801A8(v0 + 1152);
    }
    sub_2177801A8(v0 + 1088);
  }
  v6 = *(_QWORD *)(v0 + 1800);
  v7 = *(_BYTE *)(v0 + 1995);
  v8 = *(_QWORD *)(v0 + 1792);
  v9 = *(_QWORD *)(v0 + 1784);
  v10 = *(_BYTE *)(v0 + 1994);
  v11 = *(_QWORD *)(v0 + 1776);
  v12 = *(_QWORD *)(v0 + 1768);
  sub_21776E3A4((_QWORD *)(*(_QWORD *)(v0 + 1744) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService), *(_QWORD *)(*(_QWORD *)(v0 + 1744) + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_telemetryService + 24));
  v13 = *(_QWORD *)(v0 + 1736);
  *(_QWORD *)(v0 + 1976) = v13;
  *(_QWORD *)(v0 + 104) = v12;
  *(_QWORD *)(v0 + 112) = v11;
  *(_BYTE *)(v0 + 120) = v10;
  *(_QWORD *)(v0 + 128) = v9;
  *(_QWORD *)(v0 + 136) = v8;
  *(_BYTE *)(v0 + 144) = v7;
  *(_QWORD *)(v0 + 152) = v6;
  v16 = (uint64_t (*)(char, uint64_t, char, uint64_t))((char *)&dword_254F03230 + dword_254F03230);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1984) = v14;
  *v14 = v0;
  v14[1] = sub_217825CC4;
  return v16(*(_BYTE *)(v0 + 1996), v13, *(_BYTE *)(v0 + 1993), v0 + 104);
}

uint64_t sub_217825CC4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_217825D24()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 1824) + 8))(*(_QWORD *)(v0 + 1832), *(_QWORD *)(v0 + 1816));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217825D74(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 48) = a4;
  *(_QWORD *)(v5 + 56) = v4;
  *(_BYTE *)(v5 + 121) = a3;
  *(_QWORD *)(v5 + 40) = a2;
  *(_BYTE *)(v5 + 120) = a1;
  *(_QWORD *)(v5 + 64) = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_217825DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = qword_253F28DB8;
  *(_QWORD *)(v0 + 72) = qword_253F28DB8;
  if (v1)
  {
    v2 = qword_253F28DC0;
    *(_QWORD *)(v0 + 80) = qword_253F28DC0;
    *(_QWORD *)(v0 + 88) = *(_QWORD *)(v2 + 280);
    if (qword_253F25B38 != -1)
      swift_once();
    sub_21784819C();
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    if (qword_253F25B98 != -1)
      swift_once();
    v4 = sub_217847ED8();
    sub_21776F584(v4, (uint64_t)qword_253F28E80);
    v5 = sub_217847EC0();
    v6 = sub_217848298();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = *(_QWORD *)(v0 + 48);
      v8 = swift_slowAlloc();
      v9 = swift_slowAlloc();
      v14 = v9;
      *(_DWORD *)v8 = 136315650;
      v10 = sub_217848640();
      *(_QWORD *)(v0 + 16) = sub_2177D06AC(v10, v11, &v14);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      v12 = sub_217848640();
      *(_QWORD *)(v0 + 24) = sub_2177D06AC(v12, v13, &v14);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 22) = 2048;
      *(_QWORD *)(v0 + 32) = *(_QWORD *)(v7 + 48);
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v5, v6, "Tried reporting to RTC but RTC is disabled [%s:%s:%lu]", (uint8_t *)v8, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v9, -1, -1);
      MEMORY[0x219A13268](v8, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_217826058()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 122) = (*(uint64_t (**)(void))(v0 + 88))() & 1;
  return swift_task_switch();
}

uint64_t sub_2178260A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (*(_BYTE *)(v0 + 122) == 1)
  {
    v24 = *(_BYTE *)(v0 + 121);
    v1 = *(uint64_t **)(v0 + 48);
    v26 = *(_QWORD *)(v0 + 40);
    v27 = *(_QWORD *)(v0 + 64);
    v2 = 2;
    if (*(unsigned __int8 *)(v0 + 120) - 70 < 9)
      v2 = 3;
    v25 = v2;
    v3 = *v1;
    v4 = v1[1];
    v5 = *((_BYTE *)v1 + 16);
    v6 = v1[3];
    v7 = v1[4];
    v8 = *((_BYTE *)v1 + 40);
    v9 = v1[6];
    v10 = swift_allocObject();
    *(_QWORD *)(v0 + 96) = v10;
    swift_unknownObjectWeakInit();
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    *(_BYTE *)(v11 + 24) = v24;
    *(_QWORD *)(v11 + 32) = v3;
    *(_QWORD *)(v11 + 40) = v4;
    *(_BYTE *)(v11 + 48) = v5;
    *(_QWORD *)(v11 + 56) = v6;
    *(_QWORD *)(v11 + 64) = v7;
    *(_BYTE *)(v11 + 72) = v8;
    *(_QWORD *)(v11 + 80) = v9;
    *(_QWORD *)(v11 + 88) = v26;
    *(_QWORD *)(v11 + 96) = v25;
    *(_QWORD *)(v11 + 104) = v27;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v12;
    *v12 = v0;
    v12[1] = sub_2178263C8;
    return sub_2178488B0();
  }
  else
  {
    if (qword_253F25B98 != -1)
      swift_once();
    v14 = sub_217847ED8();
    sub_21776F584(v14, (uint64_t)qword_253F28E80);
    v15 = sub_217847EC0();
    v16 = sub_217848298();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = *(_QWORD *)(v0 + 48);
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v28 = v19;
      *(_DWORD *)v18 = 136315650;
      v20 = sub_217848640();
      *(_QWORD *)(v0 + 16) = sub_2177D06AC(v20, v21, &v28);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      v22 = sub_217848640();
      *(_QWORD *)(v0 + 24) = sub_2177D06AC(v22, v23, &v28);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 22) = 2048;
      *(_QWORD *)(v0 + 32) = *(_QWORD *)(v17 + 48);
      sub_2178484E4();
      _os_log_impl(&dword_217765000, v15, v16, "Tried reporting to RTC but RTC is disabled [%s:%s:%lu]", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v19, -1, -1);
      MEMORY[0x219A13268](v18, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2178263C8()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217826430(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21782646C + 4 * word_217850568[a1]))(0xD000000000000010, 0x8000000217855320);
}

uint64_t sub_21782646C()
{
  uint64_t v0;

  return v0 + 2;
}

uint64_t sub_217826954(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21776B790(qword_253F25E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_21782699C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_2177D0D64(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2178271E0();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_21776F574((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_217826A8C(v8, v11);
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

unint64_t sub_217826A8C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_217848550();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_21784897C();
        swift_bridgeObjectRetain();
        sub_217848004();
        v10 = sub_2178489A0();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_217826C60()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_217826C84(uint64_t a1)
{
  uint64_t v1;

  return sub_217821788(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(unsigned __int8 *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_BYTE *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

void *sub_217826CCC()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_21776B790(&qword_253F26F00);
  v2 = *v0;
  v3 = sub_217848754();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_217826E78()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_21776B790(&qword_253F26ED8);
  v2 = *v0;
  v3 = sub_217848754();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_QWORD *)(v2 + 56) + v16;
    v22 = *(void **)v20;
    v21 = *(_QWORD *)(v20 + 8);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v22;
    v24[1] = v21;
    swift_bridgeObjectRetain();
    result = v22;
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21782702C()
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
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  sub_21776B790((uint64_t *)&unk_253F26F10);
  v2 = *v0;
  v3 = sub_217848754();
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v20 = *v19;
    v21 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v20;
    v22[1] = v21;
    v23 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2178271E0()
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
  sub_21776B790(&qword_253F25C10);
  v2 = *v0;
  v3 = sub_217848754();
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
    sub_21776F4DC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21776F574(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_2178273C4()
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
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;

  v1 = v0;
  sub_21776B790((uint64_t *)&unk_253F26EC8);
  v2 = *v0;
  v3 = sub_217848754();
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
    v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      v9 = v29 + 1;
      if (v29 + 1 >= v13)
        goto LABEL_26;
      v30 = *(_QWORD *)(v6 + 8 * v9);
      if (!v30)
        break;
    }
LABEL_25:
    v12 = (v30 - 1) & v30;
    v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 48 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_BYTE *)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = *(_BYTE *)(v21 + 24);
    v26 = *(_QWORD *)(v21 + 32);
    LOBYTE(v21) = *(_BYTE *)(v21 + 40);
    v27 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v27 = v19;
    v27[1] = v18;
    v28 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v28 = v22;
    *(_BYTE *)(v28 + 8) = v23;
    *(_QWORD *)(v28 + 16) = v24;
    *(_BYTE *)(v28 + 24) = v25;
    *(_QWORD *)(v28 + 32) = v26;
    *(_BYTE *)(v28 + 40) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v31 = v29 + 2;
  if (v31 >= v13)
    goto LABEL_26;
  v30 = *(_QWORD *)(v6 + 8 * v31);
  if (v30)
  {
    v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v9);
    ++v31;
    if (v30)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2178275A4()
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
  __int128 v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  sub_21776B790((uint64_t *)&unk_253F25C00);
  v2 = *v0;
  v3 = sub_217848754();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_217827730()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v1 = v0;
  sub_21776B790((uint64_t *)&unk_253F26F20);
  v2 = *v0;
  v3 = sub_217848754();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2178278D0()
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  sub_21776B790(&qword_253F25C18);
  v2 = *v0;
  v3 = sub_217848754();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_217788540(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_21776F4DC(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_21776F574(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_217827AB4()
{
  return sub_217827E24((uint64_t *)&unk_253F26EF0);
}

void *sub_217827AC0()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_21776B790(&qword_253F25E20);
  v2 = *v0;
  v3 = sub_217848754();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_unknownObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_217827C60()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_21776B790(&qword_253F26EC0);
  v2 = *v0;
  v3 = sub_217848754();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_217827E18()
{
  return sub_217827E24((uint64_t *)&unk_253F26EE0);
}

void *sub_217827E24(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  sub_21776B790(a1);
  v3 = *v1;
  v4 = sub_217848754();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_217827FD0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return (id)v2;
  v3 = a1;
  v32 = MEMORY[0x24BEE4AF8];
  sub_2177AD800(0, v1, 0);
  v2 = v32;
  result = (id)sub_21782A4BC(v3);
  v6 = (uint64_t)result;
  v7 = 0;
  v8 = v3 + 64;
  v25 = v3 + 80;
  v26 = v1;
  v27 = v5;
  v28 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v29 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v6);
    v13 = v12[1];
    v14 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v6);
    v15 = v3;
    v16 = *(_QWORD *)(v32 + 16);
    v17 = *(_QWORD *)(v32 + 24);
    v30 = *v12;
    v31 = v16 + 1;
    swift_bridgeObjectRetain();
    result = v14;
    v18 = result;
    if (v16 >= v17 >> 1)
      result = (id)sub_2177AD800(v17 > 1, v31, 1);
    *(_QWORD *)(v32 + 16) = v31;
    v19 = v32 + 32 * v16;
    *(_QWORD *)(v19 + 32) = v18;
    *(_QWORD *)(v19 + 40) = v30;
    *(_QWORD *)(v19 + 48) = v13;
    *(_BYTE *)(v19 + 56) = 0;
    v9 = 1 << *(_BYTE *)(v15 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v28;
    v20 = *(_QWORD *)(v28 + 8 * v11);
    if ((v20 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v15;
    v5 = v27;
    if (*(_DWORD *)(v15 + 36) != v27)
      goto LABEL_27;
    v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v26;
    }
    else
    {
      v22 = v11 + 1;
      v23 = (unint64_t)(v9 + 63) >> 6;
      v10 = v26;
      if (v11 + 1 < v23)
      {
        v24 = *(_QWORD *)(v28 + 8 * v22);
        if (v24)
        {
LABEL_20:
          v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v11)
          {
            v24 = *(_QWORD *)(v25 + 8 * v11++);
            if (v24)
            {
              v22 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v29 + 1;
    v6 = v9;
    if (v29 + 1 == v10)
      return (id)v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2178281FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = sub_21784819C();
  v3[8] = sub_217848190();
  return swift_task_switch();
}

uint64_t sub_217828288()
{
  _QWORD *v0;
  uint64_t v1;

  v0[9] = *(_QWORD *)(v0[6] + 112);
  v0[10] = sub_217848160();
  v0[11] = v1;
  return swift_task_switch();
}

uint64_t sub_21782830C()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v0 + 16) = 0;
  v1 = objc_msgSend(*(id *)(v0 + 72), sel_batchOfRecordsToWriteWithFilter_limit_error_, *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + 16);
  v2 = *(void **)(v0 + 16);
  if (v1)
  {
    v3 = v1;
    sub_217787748(0, (unint64_t *)&qword_253F26EA0);
    *(_QWORD *)(v0 + 96) = sub_217847F2C();
    v4 = v2;

    return swift_task_switch();
  }
  else
  {
    v6 = v2;
    swift_release();
    v7 = (void *)sub_217847CBC();

    swift_willThrow();
    v8 = (void *)sub_217847CB0();
    sub_217787748(0, (unint64_t *)&qword_253F26EA8);
    if (qword_253F26E78 != -1)
      swift_once();
    if ((sub_2178484C0() & 1) != 0)
    {
      v9 = sub_21776FF90(MEMORY[0x24BEE4AF8]);
      v11 = v10;

      return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v9, v11);
    }
    else
    {
      swift_willThrow();

      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
}

uint64_t sub_217828528()
{
  uint64_t v0;

  sub_217829EF8(*(_QWORD *)(v0 + 96));
  return swift_task_switch();
}

uint64_t sub_217828590()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release();
  v2 = sub_217827FD0(v1);
  swift_bridgeObjectRelease();
  v3 = sub_21776FF90((uint64_t)v2);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_217828624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 64) = a4;
  *(_QWORD *)(v6 + 72) = v5;
  *(_BYTE *)(v6 + 104) = a5;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 56) = a3;
  *(_QWORD *)(v6 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_217828648()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 64);
  if ((*(_BYTE *)(v0 + 104) & 1) != 0)
  {
    v3 = v1;
    if (qword_253F25D98 != -1)
      swift_once();
    v4 = *(void **)(v0 + 56);
    v5 = *(void **)(v0 + 64);
    v6 = sub_217847ED8();
    sub_21776F584(v6, (uint64_t)qword_253F28DC8);
    sub_2177B7E98(v5);
    v7 = v4;
    swift_unknownObjectRetain();
    sub_2177B7E98(v5);
    v8 = v7;
    swift_unknownObjectRetain();
    v9 = sub_217847EC0();
    v10 = sub_217848298();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(void **)(v0 + 56);
    v13 = *(void **)(v0 + 64);
    if (v11)
    {
      v14 = swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v26 = v25;
      *(_DWORD *)v14 = 138412802;
      *(_QWORD *)(v0 + 16) = v12;
      v15 = v12;
      sub_2178484E4();
      *v24 = v12;

      *(_WORD *)(v14 + 12) = 2112;
      v16 = v1;
      v17 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 24) = v17;
      sub_2178484E4();
      v24[1] = v17;
      sub_2177CB870(v13);
      sub_2177CB870(v13);
      *(_WORD *)(v14 + 22) = 2080;
      sub_217847E6C();
      sub_21777F28C();
      v18 = sub_2178488A4();
      *(_QWORD *)(v0 + 32) = sub_2177D06AC(v18, v19, &v26);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      _os_log_impl(&dword_217765000, v9, v10, "Write Sync failed to save record to CK %@ %@ %s", (uint8_t *)v14, 0x20u);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v24, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v25, -1, -1);
      MEMORY[0x219A13268](v14, -1, -1);

    }
    else
    {

      sub_2177CB870(v13);
      sub_2177CB870(v13);
      swift_unknownObjectRelease_n();

    }
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v20;
    *v20 = v0;
    v20[1] = sub_217828AB4;
    v21 = *(_QWORD *)(v0 + 72);
    v22 = *(_QWORD *)(v0 + 56);
    v20[9] = *(_QWORD *)(v0 + 40);
    v20[10] = v21;
    v20[7] = v22;
    v20[8] = v1;
  }
  else
  {
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(*(_QWORD *)(v0 + 72) + 112);
    sub_21784819C();
    v2 = v1;
    *(_QWORD *)(v0 + 88) = sub_217848190();
    sub_217848160();
  }
  return swift_task_switch();
}

uint64_t sub_217828A20()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  swift_release();
  objc_msgSend(v1, sel_recordUpdateSucceededWithRecord_, v2);
  return swift_task_switch();
}

uint64_t sub_217828A7C()
{
  uint64_t v0;

  sub_2177CB870(*(id *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217828AB4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217828B0C()
{
  uint64_t v0;

  sub_2177CB870(*(id *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217828B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  return swift_task_switch();
}

uint64_t sub_217828B60()
{
  os_log_t v0;
  NSObject *v1;
  objc_class *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  objc_class *v6;
  unint64_t v7;
  Class isa;
  char v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  Class v14;
  uint64_t v15;
  objc_class *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  Class v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  objc_class *v31;
  unint64_t v32;
  Class v33;
  char v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  Class v39;
  uint64_t v40;
  objc_class *v41;
  objc_class *v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  Class v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  objc_class *v56;
  unint64_t v57;
  Class v58;
  char v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  Class v64;
  uint64_t v65;
  objc_class *v66;
  objc_class *v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  Class v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  Class v78;
  uint64_t v79;
  objc_class *v80;
  os_log_type_t v81;
  _BOOL4 v82;
  Class v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t *v88;
  unint64_t v89;
  unint64_t v90;
  _QWORD *p_isa;
  void *v92;
  unsigned int v93;
  __objc2_class *v94;
  Class v95;
  uint64_t v96;
  objc_class *v97;
  objc_class *v98;
  NSObject *v99;
  os_log_type_t v100;
  _BOOL4 v101;
  Class v102;
  uint8_t *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  Class v108;
  uint64_t v109;
  objc_class *v110;
  os_log_type_t v111;
  _BOOL4 v112;
  id v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  const char *v117;
  Class v118;
  uint64_t v119;
  objc_class *v120;
  _BOOL4 v121;
  id v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  objc_class *v126;
  char v127;
  Class v128;
  Class v129;
  Class v130;
  Class v131;
  Class v132;
  uint64_t v133;
  objc_class *v134;
  objc_class *v135;
  objc_class *v136;
  objc_class *v137;
  os_log_type_t v138;
  _BOOL4 v139;
  Class v140;
  Class v141;
  _QWORD *v142;
  uint64_t *v143;
  objc_class *v144;
  objc_class *v145;
  uint64_t v146;
  os_log_t loga;
  os_log_t logb;
  os_log_t log;
  os_log_t logc;
  os_log_type_t type;
  os_log_type_t typea;
  uint64_t v154;
  uint64_t v155;
  NSObject *v156;

  v1 = v0 + 5;
  v2 = *(objc_class **)(*sub_21776E3A4((_QWORD *)v0[9].isa + 2, *((_QWORD *)v0[9].isa + 5)) + 24);
  v0[11].isa = v2;
  swift_unknownObjectRetain();
  v3 = (void *)sub_217847CB0();
  v4 = -[objc_class wasBatchFailure:](v2, sel_wasBatchFailure_, v3);

  if (v4)
  {
    v5 = *((_QWORD *)v0[10].isa + 16);
    if (*(_QWORD *)(v5 + 16))
    {
      v6 = v0[7].isa;
      swift_bridgeObjectRetain();
      v7 = sub_2177D27F0((uint64_t)v6);
      isa = v0[7].isa;
      if ((v9 & 1) != 0)
      {
        v10 = (uint64_t *)&v0[5];
        v11 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v7);
        v12 = *v11;
        v13 = v11[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();

        if (qword_253F25D98 != -1)
          swift_once();
        v14 = v0[7].isa;
        v15 = sub_217847ED8();
        sub_21776F584(v15, (uint64_t)qword_253F28DC8);
        v16 = v14;
        swift_bridgeObjectRetain();
        v17 = sub_217847EC0();
        v18 = sub_2178482B0();
        v19 = os_log_type_enabled(v17, v18);
        v20 = v0[7].isa;
        if (v19)
        {
          v21 = swift_slowAlloc();
          v156 = swift_slowAlloc();
          loga = v156;
          *(_DWORD *)v21 = 136315394;
          swift_bridgeObjectRetain();
          *v10 = sub_2177D06AC(v12, v13, (uint64_t *)&v156);
          sub_2178484E4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v21 + 12) = 2080;
          v22 = -[objc_class zoneID](v20, sel_zoneID);
          v23 = objc_msgSend(v22, sel_zoneName);

          v24 = sub_217847F98();
          v26 = v25;

          *v10 = sub_2177D06AC(v24, v26, (uint64_t *)&v156);
          sub_2178484E4();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_217765000, v17, v18, "Record %s was in a batch that failed, and so wasn't written to %s. Ignoring to retry on next batch.", (uint8_t *)v21, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x219A13268](loga, -1, -1);
          v27 = v21;
LABEL_60:
          MEMORY[0x219A13268](v27, -1, -1);

          swift_unknownObjectRelease();
          return ((uint64_t (*)(void))v0[1].isa)();
        }
        swift_bridgeObjectRelease_n();

        goto LABEL_47;
      }
      swift_bridgeObjectRelease();

    }
    if (qword_253F25D98 != -1)
      swift_once();
    v78 = v0[7].isa;
    v79 = sub_217847ED8();
    sub_21776F584(v79, (uint64_t)qword_253F28DC8);
    v80 = v78;
    v17 = sub_217847EC0();
    v81 = sub_217848298();
    v82 = os_log_type_enabled(v17, v81);
    v83 = v0[7].isa;
    if (v82)
    {
      v84 = swift_slowAlloc();
      logb = v0;
      v85 = swift_slowAlloc();
      v156 = v85;
      *(_DWORD *)v84 = 136315138;
      v86 = -[objc_class recordName](v83, sel_recordName);
      v87 = sub_217847F98();
      v88 = (uint64_t *)v1;
      v90 = v89;

      *v88 = sub_2177D06AC(v87, v90, (uint64_t *)&v156);
      sub_2178484E4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_217765000, v17, v81, "Failed to find %s in batch map for a guid, but we're ignoring the error since it doesn't look like this record is the cause (BatchRequestFailure)", (uint8_t *)v84, 0xCu);
      swift_arrayDestroy();
      p_isa = (_QWORD *)v85;
      v0 = logb;
      goto LABEL_59;
    }
LABEL_46:

LABEL_47:
    swift_unknownObjectRelease();
LABEL_48:

    return ((uint64_t (*)(void))v0[1].isa)();
  }
  v28 = (void *)sub_217847CB0();
  v29 = -[objc_class wasRecordArchived:](v2, sel_wasRecordArchived_, v28);

  if (v29)
  {
    v30 = *((_QWORD *)v0[10].isa + 16);
    if (*(_QWORD *)(v30 + 16))
    {
      v31 = v0[7].isa;
      swift_bridgeObjectRetain();
      v32 = sub_2177D27F0((uint64_t)v31);
      v33 = v0[7].isa;
      if ((v34 & 1) != 0)
      {
        v35 = (uint64_t *)&v0[5];
        v36 = (uint64_t *)(*(_QWORD *)(v30 + 56) + 16 * v32);
        v37 = *v36;
        v38 = v36[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();

        if (qword_253F25D98 != -1)
          swift_once();
        v39 = v0[7].isa;
        v40 = sub_217847ED8();
        sub_21776F584(v40, (uint64_t)qword_253F28DC8);
        v41 = v39;
        swift_bridgeObjectRetain_n();
        v42 = v41;
        v43 = sub_217847EC0();
        v44 = sub_2178482B0();
        v45 = os_log_type_enabled(v43, v44);
        v46 = v0[7].isa;
        if (v45)
        {
          v47 = swift_slowAlloc();
          v154 = swift_slowAlloc();
          v156 = v154;
          *(_DWORD *)v47 = 136315394;
          type = v44;
          swift_bridgeObjectRetain();
          *v35 = sub_2177D06AC(v37, v38, (uint64_t *)&v156);
          sub_2178484E4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v47 + 12) = 2080;
          v48 = -[objc_class zoneID](v46, sel_zoneID);
          v49 = objc_msgSend(v48, sel_zoneName);

          v50 = sub_217847F98();
          v52 = v51;

          *v35 = sub_2177D06AC(v50, v52, (uint64_t *)&v156);
          sub_2178484E4();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_217765000, v43, type, "Record %s was archived already to %s, marking synced", (uint8_t *)v47, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x219A13268](v154, -1, -1);
          MEMORY[0x219A13268](v47, -1, -1);

        }
        else
        {
          swift_bridgeObjectRelease_n();

        }
        v0[12].isa = *(Class *)((char *)v0[10].isa + 112);
        v0[13].isa = (Class)sub_217847F74();
        swift_bridgeObjectRelease();
        v0[14].isa = (Class)sub_217847CB0();
        sub_21784819C();
        v0[15].isa = (Class)sub_217848190();
        sub_217848160();
        return swift_task_switch();
      }
      swift_bridgeObjectRelease();

    }
    if (qword_253F25D98 != -1)
      swift_once();
    v108 = v0[7].isa;
    v109 = sub_217847ED8();
    sub_21776F584(v109, (uint64_t)qword_253F28DC8);
    v110 = v108;
    v17 = sub_217847EC0();
    v111 = sub_217848298();
    v112 = os_log_type_enabled(v17, v111);
    v83 = v0[7].isa;
    if (!v112)
      goto LABEL_46;
    v84 = swift_slowAlloc();
    log = (os_log_t)swift_slowAlloc();
    v156 = log;
    *(_DWORD *)v84 = 136315138;
    v113 = -[objc_class recordName](v83, sel_recordName);
    v114 = sub_217847F98();
    v116 = v115;

    v0[5].isa = (Class)sub_2177D06AC(v114, v116, (uint64_t *)&v156);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    v117 = "Failed to find %s in batch map for guid update, when we detected it was archived!!";
LABEL_45:
    _os_log_impl(&dword_217765000, v17, v111, v117, (uint8_t *)v84, 0xCu);
    swift_arrayDestroy();
    p_isa = &log->isa;
    goto LABEL_59;
  }
  v53 = (void *)sub_217847CB0();
  v54 = -[objc_class wasDuplicateRecordFound:](v2, sel_wasDuplicateRecordFound_, v53);

  if (v54)
  {
    v55 = *((_QWORD *)v0[10].isa + 16);
    if (*(_QWORD *)(v55 + 16))
    {
      v56 = v0[7].isa;
      swift_bridgeObjectRetain();
      v57 = sub_2177D27F0((uint64_t)v56);
      v58 = v0[7].isa;
      if ((v59 & 1) != 0)
      {
        v60 = (uint64_t *)&v0[5];
        v61 = (uint64_t *)(*(_QWORD *)(v55 + 56) + 16 * v57);
        v62 = *v61;
        v63 = v61[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();

        if (qword_253F25D98 != -1)
          swift_once();
        v64 = v0[7].isa;
        v65 = sub_217847ED8();
        sub_21776F584(v65, (uint64_t)qword_253F28DC8);
        v66 = v64;
        swift_bridgeObjectRetain_n();
        v67 = v66;
        v68 = sub_217847EC0();
        v69 = sub_2178482B0();
        v70 = os_log_type_enabled(v68, v69);
        v71 = v0[7].isa;
        if (v70)
        {
          v72 = swift_slowAlloc();
          v155 = swift_slowAlloc();
          v156 = v155;
          *(_DWORD *)v72 = 136315394;
          typea = v69;
          swift_bridgeObjectRetain();
          *v60 = sub_2177D06AC(v62, v63, (uint64_t *)&v156);
          sub_2178484E4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v72 + 12) = 2080;
          v73 = -[objc_class zoneID](v71, sel_zoneID);
          v74 = objc_msgSend(v73, sel_zoneName);

          v75 = sub_217847F98();
          v77 = v76;

          *v60 = sub_2177D06AC(v75, v77, (uint64_t *)&v156);
          sub_2178484E4();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_217765000, v68, typea, "Record %s was duplicated in the batch to %s", (uint8_t *)v72, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x219A13268](v155, -1, -1);
          MEMORY[0x219A13268](v72, -1, -1);

        }
        else
        {
          swift_bridgeObjectRelease_n();

        }
        v0[16].isa = *(Class *)((char *)v0[10].isa + 112);
        v0[17].isa = (Class)sub_217847F74();
        swift_bridgeObjectRelease();
        v0[18].isa = (Class)sub_217847CB0();
        sub_21784819C();
        v0[19].isa = (Class)sub_217848190();
        sub_217848160();
        return swift_task_switch();
      }
      swift_bridgeObjectRelease();

    }
    if (qword_253F25D98 != -1)
      swift_once();
    v118 = v0[7].isa;
    v119 = sub_217847ED8();
    sub_21776F584(v119, (uint64_t)qword_253F28DC8);
    v120 = v118;
    v17 = sub_217847EC0();
    v111 = sub_217848298();
    v121 = os_log_type_enabled(v17, v111);
    v83 = v0[7].isa;
    if (!v121)
      goto LABEL_46;
    v84 = swift_slowAlloc();
    log = (os_log_t)swift_slowAlloc();
    v156 = log;
    *(_DWORD *)v84 = 136315138;
    v122 = -[objc_class recordName](v83, sel_recordName);
    v123 = sub_217847F98();
    v125 = v124;

    v0[5].isa = (Class)sub_2177D06AC(v123, v125, (uint64_t *)&v156);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    v117 = "Failed to find %s in batch map for guid update, when we detected it was in the batch more than once!";
    goto LABEL_45;
  }
  v92 = (void *)sub_217847CB0();
  v93 = -[objc_class wasRecordSizeFailure:](v2, sel_wasRecordSizeFailure_, v92);

  v94 = &OBJC_METACLASS____TtC17MessagesCloudSync7SyncJob;
  if (v93)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v95 = v0[8].isa;
    v96 = sub_217847ED8();
    sub_21776F584(v96, (uint64_t)qword_253F28DC8);
    v97 = v95;
    v98 = v95;
    v99 = sub_217847EC0();
    v100 = sub_217848298();
    v101 = os_log_type_enabled(v99, v100);
    v102 = v0[8].isa;
    if (v101)
    {
      v103 = (uint8_t *)swift_slowAlloc();
      v104 = swift_slowAlloc();
      v156 = v104;
      *(_DWORD *)v103 = 136315138;
      swift_getErrorValue();
      v105 = sub_21778E8D0((uint64_t)v0[3].isa);
      v0[5].isa = (Class)sub_2177D06AC(v105, v106, (uint64_t *)&v156);
      v94 = &OBJC_METACLASS____TtC17MessagesCloudSync7SyncJob;
      sub_2178484E4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_217765000, v99, v100, "Record exceeded maximum byte size: %s", v103, 0xCu);
      swift_arrayDestroy();
      v107 = v104;
      v1 = v0 + 5;
      MEMORY[0x219A13268](v107, -1, -1);
      MEMORY[0x219A13268](v103, -1, -1);
    }
    else
    {

    }
  }
  if (!*(_QWORD *)(*((_QWORD *)v0[10].isa + 16) + 16))
  {
LABEL_55:
    if (v94[87].isa != (__objc2_class *)-1)
      swift_once();
    v132 = v0[7].isa;
    v131 = v0[8].isa;
    v133 = sub_217847ED8();
    sub_21776F584(v133, (uint64_t)qword_253F28DC8);
    v134 = v132;
    v135 = v131;
    v136 = v134;
    v137 = v131;
    v17 = sub_217847EC0();
    v138 = sub_217848298();
    v139 = os_log_type_enabled(v17, v138);
    v141 = v0[7].isa;
    v140 = v0[8].isa;
    if (!v139)
    {
      swift_unknownObjectRelease();

      goto LABEL_48;
    }
    v84 = swift_slowAlloc();
    v142 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v84 = 138412546;
    v1->isa = v141;
    logc = v0;
    v143 = (uint64_t *)v1;
    v144 = v141;
    sub_2178484E4();
    *v142 = v141;

    *(_WORD *)(v84 + 12) = 2112;
    v145 = v140;
    v146 = _swift_stdlib_bridgeErrorToNSError();
    *v143 = v146;
    v0 = logc;
    sub_2178484E4();
    v142[1] = v146;

    _os_log_impl(&dword_217765000, v17, v138, "Could not find local guid in batchRecordIDsToGUIDs map for recordID: %@ and error: %@", (uint8_t *)v84, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    p_isa = v142;
LABEL_59:
    MEMORY[0x219A13268](p_isa, -1, -1);
    v27 = v84;
    goto LABEL_60;
  }
  v126 = v0[7].isa;
  swift_bridgeObjectRetain();
  sub_2177D27F0((uint64_t)v126);
  if ((v127 & 1) == 0)
  {
    v130 = v0[7].isa;
    swift_bridgeObjectRelease();

    goto LABEL_55;
  }
  v128 = v0[10].isa;
  v129 = v0[7].isa;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

  v0[20].isa = *(Class *)((char *)v128 + 112);
  v0[21].isa = (Class)sub_217847F74();
  swift_bridgeObjectRelease();
  v0[22].isa = (Class)sub_217847CB0();
  sub_21784819C();
  v0[23].isa = (Class)sub_217848190();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_217829D54()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)v0[14];
  v3 = (void *)v0[12];
  v2 = (void *)v0[13];
  v4 = v0[7];
  swift_release();
  objc_msgSend(v3, sel_recordUpdateFailedWithID_localGUID_error_, v4, v2, v1);

  return swift_task_switch();
}

uint64_t sub_217829DD0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217829E00()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)v0[18];
  v3 = (void *)v0[16];
  v2 = (void *)v0[17];
  v4 = v0[7];
  swift_release();
  objc_msgSend(v3, sel_recordUpdateFailedWithID_localGUID_error_, v4, v2, v1);

  return swift_task_switch();
}

uint64_t sub_217829E7C()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)v0[22];
  v3 = (void *)v0[20];
  v2 = (void *)v0[21];
  v4 = v0[7];
  swift_release();
  objc_msgSend(v3, sel_recordUpdateFailedWithID_localGUID_error_, v4, v2, v1);

  return swift_task_switch();
}

uint64_t sub_217829EF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  char isUniquelyReferenced_nonNull_native;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;

  v1 = 1 << *(_BYTE *)(a1 + 32);
  v2 = -1;
  if (v1 < 64)
    v2 = ~(-1 << v1);
  v3 = v2 & *(_QWORD *)(a1 + 64);
  v35 = (unint64_t)(v1 + 63) >> 6;
  swift_bridgeObjectRetain();
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v3)
    {
      v7 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      v8 = v7 | (v4 << 6);
    }
    else
    {
      v9 = v4 + 1;
      if (__OFADD__(v4, 1))
        goto LABEL_40;
      if (v9 >= v35)
      {
LABEL_37:
        swift_release();
        *(_QWORD *)(v33 + 128) = v5;
        return swift_bridgeObjectRelease();
      }
      v10 = *(_QWORD *)(v34 + 8 * v9);
      ++v4;
      if (!v10)
      {
        v4 = v9 + 1;
        if (v9 + 1 >= v35)
          goto LABEL_37;
        v10 = *(_QWORD *)(v34 + 8 * v4);
        if (!v10)
        {
          v4 = v9 + 2;
          if (v9 + 2 >= v35)
            goto LABEL_37;
          v10 = *(_QWORD *)(v34 + 8 * v4);
          if (!v10)
          {
            v4 = v9 + 3;
            if (v9 + 3 >= v35)
              goto LABEL_37;
            v10 = *(_QWORD *)(v34 + 8 * v4);
            if (!v10)
            {
              v4 = v9 + 4;
              if (v9 + 4 >= v35)
                goto LABEL_37;
              v10 = *(_QWORD *)(v34 + 8 * v4);
              if (!v10)
              {
                v11 = v9 + 5;
                if (v11 >= v35)
                  goto LABEL_37;
                v10 = *(_QWORD *)(v34 + 8 * v11);
                if (!v10)
                {
                  while (1)
                  {
                    v4 = v11 + 1;
                    if (__OFADD__(v11, 1))
                      goto LABEL_41;
                    if (v4 >= v35)
                      goto LABEL_37;
                    v10 = *(_QWORD *)(v34 + 8 * v4);
                    ++v11;
                    if (v10)
                      goto LABEL_25;
                  }
                }
                v4 = v11;
              }
            }
          }
        }
      }
LABEL_25:
      v3 = (v10 - 1) & v10;
      v8 = __clz(__rbit64(v10)) + (v4 << 6);
    }
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v8);
    swift_bridgeObjectRetain();
    v16 = v15;
    v17 = objc_msgSend(v16, sel_recordID);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = sub_2177D27F0((uint64_t)v17);
    v21 = v5[2];
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      break;
    v24 = v19;
    if (v5[3] >= v23)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v19 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_21782702C();
        if ((v24 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_217811D38(v23, isUniquelyReferenced_nonNull_native);
      v25 = sub_2177D27F0((uint64_t)v17);
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_42;
      v20 = v25;
      if ((v24 & 1) != 0)
      {
LABEL_4:
        v6 = (_QWORD *)(v5[7] + 16 * v20);
        swift_bridgeObjectRelease();
        *v6 = v13;
        v6[1] = v14;
        goto LABEL_5;
      }
    }
    v5[(v20 >> 6) + 8] |= 1 << v20;
    *(_QWORD *)(v5[6] + 8 * v20) = v17;
    v27 = (_QWORD *)(v5[7] + 16 * v20);
    *v27 = v13;
    v27[1] = v14;
    v28 = v5[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_39;
    v5[2] = v30;
    v31 = v17;
LABEL_5:

    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  sub_217787748(0, (unint64_t *)&qword_253F26DC8);
  result = sub_21784891C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LiveDataWriteHandler()
{
  return objc_opt_self();
}

uint64_t sub_21782A234()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

uint64_t sub_21782A24C()
{
  _QWORD *v0;

  v0[3] = *(_QWORD *)(v0[2] + 112);
  sub_21784819C();
  v0[4] = sub_217848190();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_21782A2C0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_resetFetchState);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21782A300(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21782A360;
  return sub_2178281FC(a1, a2);
}

uint64_t sub_21782A360(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_21782A3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v11 = *v5;
  v12 = a5 & 1;
  v13 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *(_QWORD *)v13 = v6;
  *(_QWORD *)(v13 + 8) = sub_21777AAD0;
  *(_QWORD *)(v13 + 64) = a4;
  *(_QWORD *)(v13 + 72) = v11;
  *(_BYTE *)(v13 + 104) = v12;
  *(_QWORD *)(v13 + 48) = a2;
  *(_QWORD *)(v13 + 56) = a3;
  *(_QWORD *)(v13 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_21782A454()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

uint64_t sub_21782A46C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 128) = sub_2177F36AC(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21782A4BC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_21782A548(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2177A3F0C;
  return sub_21782A594(a1);
}

uint64_t sub_21782A594(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[21] = a1;
  v2[22] = v1;
  v3 = sub_217847ED8();
  v2[23] = v3;
  v2[24] = *(_QWORD *)(v3 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = type metadata accessor for MessageRecord();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21782A628()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  char **p_name;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;

  v1 = v0[26];
  v2 = v0[22];
  v3 = (uint64_t *)(v2 + *(int *)(v1 + 136));
  v4 = *v3;
  v5 = (void *)v3[3];
  if (v4 == 1 || v5 == 0)
  {
    v7 = (uint64_t *)(v2 + *(int *)(v1 + 140));
LABEL_14:
    v27 = *v7;
    v26 = v7[1];
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  v8 = v5;
  if (!objc_msgSend(v8, sel_hasActualParentChatId))
  {
    v24 = v0[26];
    v25 = v0[22];

    v7 = (uint64_t *)(v25 + *(int *)(v24 + 140));
    goto LABEL_14;
  }
  if (qword_253F25D98 != -1)
    swift_once();
  v11 = v0[27];
  v10 = v0[28];
  v12 = v0[22];
  sub_21776F584(v0[23], (uint64_t)qword_253F28DC8);
  sub_21776F3B4(v12, v10);
  sub_21776F3B4(v12, v11);
  v13 = v8;
  v14 = sub_217847EC0();
  v15 = sub_2178482B0();
  v16 = os_log_type_enabled(v14, v15);
  v17 = v0[28];
  p_name = (char **)(&stru_24D812FF8 + 8);
  if (v16)
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v48 = v20;
    *(_DWORD *)v19 = 136315650;
    v21 = (uint64_t *)v0[28];
    v46 = v20;
    if (*(_QWORD *)(v17 + 8))
    {
      v22 = *v21;
      v23 = *(_QWORD *)(v17 + 8);
    }
    else
    {
      v23 = 0xE700000000000000;
      v22 = 0x646975672D6F6ELL;
    }
    swift_bridgeObjectRetain();
    v0[18] = sub_2177D06AC(v22, v23, &v48);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    sub_21776F3F8((uint64_t)v21);
    *(_WORD *)(v19 + 12) = 2080;
    v32 = objc_msgSend(v13, sel_actualParentChatId);
    if (v32)
    {
      v33 = v32;
      v34 = sub_217847F98();
      v36 = v35;

    }
    else
    {
      v36 = 0xE500000000000000;
      v34 = 0x7974706D65;
    }
    v37 = v0[26];
    v38 = v0[27];
    v0[19] = sub_2177D06AC(v34, v36, &v48);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    *(_WORD *)(v19 + 22) = 2080;
    v39 = (uint64_t *)(v38 + *(int *)(v37 + 140));
    if (v39[1])
    {
      v40 = *v39;
      v41 = v39[1];
    }
    else
    {
      v41 = 0xE300000000000000;
      v40 = 7104878;
    }
    v42 = v0[27];
    swift_bridgeObjectRetain();
    v0[20] = sub_2177D06AC(v40, v41, &v48);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    sub_21776F3F8(v42);
    _os_log_impl(&dword_217765000, v14, v15, "For message %s import, using override in proto4 %s over %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v46, -1, -1);
    MEMORY[0x219A13268](v19, -1, -1);

    p_name = &stru_24D812FF8.name;
  }
  else
  {
    v31 = v0[27];
    sub_21776F3F8(v0[28]);

    sub_21776F3F8(v31);
  }
  v43 = objc_msgSend(v13, p_name[442]);
  if (v43)
  {
    v44 = v43;
    v27 = sub_217847F98();
    v26 = v45;

  }
  else
  {

    v27 = 0;
    v26 = 0;
  }
LABEL_15:
  v0[29] = v27;
  v0[30] = v26;
  sub_217796A08(v27, v26);
  v28 = sub_21776A1EC();
  v0[31] = v28;
  v47 = (uint64_t (*)(uint64_t))((char *)&dword_254F01DB8 + dword_254F01DB8);
  v29 = (_QWORD *)swift_task_alloc();
  v0[32] = v29;
  *v29 = v0;
  v29[1] = sub_21782AA44;
  return v47((uint64_t)v28);
}

uint64_t sub_21782AA44(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 264) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_BYTE *)(v4 + 456) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_21782AAC4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _BYTE *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _BYTE *v22;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;

  v1 = *(void **)(v0 + 248);
  if (*(_BYTE *)(v0 + 456) != 1)
  {
    swift_bridgeObjectRelease();
    sub_21782DE54();
    swift_allocError();
    *v18 = 0;
LABEL_17:
    swift_willThrow();

    goto LABEL_18;
  }
  v2 = objc_msgSend(*(id *)(v0 + 248), sel_guid);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    if (qword_253F26CA0 != -1)
      swift_once();
    sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
    v19 = sub_217847EC0();
    v20 = sub_217848298();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_217765000, v19, v20, "Existing item with no guid, do not store", v21, 2u);
      MEMORY[0x219A13268](v21, -1, -1);
    }
    v1 = *(void **)(v0 + 248);

    sub_21782DE54();
    swift_allocError();
    *v22 = 1;
    goto LABEL_17;
  }
  v3 = v2;
  v4 = *(void **)(v0 + 248);
  v5 = sub_217847F98();
  v7 = v6;

  *(_QWORD *)(v0 + 272) = v5;
  *(_QWORD *)(v0 + 280) = v7;
  v8 = objc_msgSend(v4, sel_associatedMessageType);
  if (v8 != (id)3006 && v8 != (id)2006
    || (v9 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureFlags),
        v10 = objc_msgSend(v9, sel_isEmojiTapbacksEnabled),
        v9,
        (v10 & 1) != 0))
  {
    if (qword_253F25B88 != -1)
      swift_once();
    sub_2177DF6D4(v5, v7);
    *(_QWORD *)(v0 + 288) = v11;
    if (v11)
    {
      v12 = v11;
      objc_opt_self();
      v13 = swift_dynamicCastObjCClass();
      *(_QWORD *)(v0 + 296) = v13;
      if (v13)
      {
        v14 = (void *)v13;
        v15 = *(void **)(v0 + 248);
        v16 = v12;
        *(_BYTE *)(v0 + 457) = sub_21782CAE4(v14, v15) & 1;
        v17 = swift_task_alloc();
        *(_QWORD *)(v0 + 304) = v17;
        *(_QWORD *)v17 = v0;
        *(_QWORD *)(v17 + 8) = sub_21782B0DC;
        *(_OWORD *)(v17 + 24) = *(_OWORD *)(v0 + 168);
        *(_QWORD *)(v17 + 16) = v14;
        return swift_task_switch();
      }

    }
    if ((sub_21782D49C(*(void **)(v0 + 248)) & 1) != 0)
    {
      swift_bridgeObjectRelease();
      if (qword_253F26CA0 != -1)
        swift_once();
      sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
      swift_bridgeObjectRetain();
      v26 = sub_217847EC0();
      v27 = sub_217848280();
      v28 = os_log_type_enabled(v26, v27);
      v29 = *(void **)(v0 + 248);
      if (v28)
      {
        v30 = (uint8_t *)swift_slowAlloc();
        v31 = swift_slowAlloc();
        v35 = v31;
        *(_DWORD *)v30 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 120) = sub_2177D06AC(v5, v7, &v35);
        sub_2178484E4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_217765000, v26, v27, "Business chat is not supported, do not import message %s", v30, 0xCu);
        v25 = 1;
        swift_arrayDestroy();
        MEMORY[0x219A13268](v31, -1, -1);
        MEMORY[0x219A13268](v30, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        v25 = 1;
      }
      goto LABEL_32;
    }
    v32 = qword_253F28DB8;
    *(_QWORD *)(v0 + 328) = qword_253F28DB8;
    if (v32)
    {
      v33 = qword_253F28DC0;
      *(_QWORD *)(v0 + 336) = qword_253F28DC0;
      *(_QWORD *)(v0 + 344) = *(_QWORD *)(v33 + 24);
      if (qword_253F25B38 != -1)
        swift_once();
      *(_QWORD *)(v0 + 352) = sub_21784819C();
      sub_217848160();
      return swift_task_switch();
    }
    v34 = *(void **)(v0 + 248);
    sub_217788584();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
LABEL_18:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v24 = *(void **)(v0 + 248);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v25 = 0;
LABEL_32:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v25);
}

uint64_t sub_21782B084()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21782B0DC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 312) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_BYTE *)(v4 + 458) = a1 & 1;
  }
  return swift_task_switch();
}

uint64_t sub_21782B168()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  uint64_t v23;

  if (*(_BYTE *)(v0 + 458) == 1)
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
    swift_bridgeObjectRetain();
    v1 = sub_217847EC0();
    v2 = sub_217848280();
    v3 = os_log_type_enabled(v1, v2);
    v4 = *(_QWORD *)(v0 + 280);
    if (v3)
    {
      v5 = *(_QWORD *)(v0 + 272);
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v23 = v7;
      *(_DWORD *)v6 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 136) = sub_2177D06AC(v5, v4, &v23);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v1, v2, "Bad chatID found in message %s, marking for resync", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v7, -1, -1);
      MEMORY[0x219A13268](v6, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v8 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = ~*(unsigned __int8 *)(v0 + 457) & 1;
  }
  v9 = *(void **)(v0 + 296);
  v10 = *(_QWORD *)(v0 + 176);
  sub_21782D20C(v9, *(void **)(v0 + 248));
  objc_msgSend(v9, sel_setCloudKitSyncState_, v8);
  v11 = *(void **)(v0 + 288);
  if (*(_QWORD *)(v10 + 56))
  {
    v12 = v11;
    v13 = (void *)sub_217847F74();
    v14 = *(id *)(v0 + 288);
  }
  else
  {
    v14 = v11;
    v13 = 0;
  }
  v15 = *(_QWORD *)(v0 + 176);
  objc_msgSend(*(id *)(v0 + 296), sel_setCloudKitRecordID_, v13, v23);

  v16 = *(void **)(v0 + 288);
  if (*(_QWORD *)(v15 + 40))
  {
    v17 = v16;
    v18 = (void *)sub_217847F74();
    v19 = *(id *)(v0 + 288);
  }
  else
  {
    v19 = v16;
    v18 = 0;
  }
  v20 = *(void **)(v0 + 296);
  objc_msgSend(v20, sel_setCloudKitRecordChangeTag_, v18);

  objc_msgSend(v20, sel_setCloudKitServerChangeTokenBlob_, 0);
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v21;
  *v21 = v0;
  v21[1] = sub_21782B458;
  return sub_2177DF7EC(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
}

uint64_t sub_21782B458()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_21782B4B8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint8_t *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_253F26CA0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = sub_21776F584(v4, (uint64_t)qword_253F28FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = sub_217847EC0();
  v8 = sub_217848280();
  if (!os_log_type_enabled(v7, v8))
  {
    v17 = *(void **)(v0 + 288);
    v19 = *(_QWORD *)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 200);
    v20 = *(_QWORD *)(v0 + 184);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    goto LABEL_7;
  }
  v9 = *(void **)(v0 + 296);
  v10 = (uint8_t *)swift_slowAlloc();
  v25 = swift_slowAlloc();
  v26 = v25;
  *(_DWORD *)v10 = 136315138;
  v11 = objc_msgSend(v9, sel_guid);
  v12 = *(void **)(v0 + 288);
  if (v11)
  {
    v13 = v11;
    v21 = *(_QWORD *)(v0 + 192);
    v22 = *(void **)(v0 + 248);
    v23 = *(_QWORD *)(v0 + 184);
    v24 = *(_QWORD *)(v0 + 200);
    v14 = sub_217847F98();
    v16 = v15;

    *(_QWORD *)(v0 + 128) = sub_2177D06AC(v14, v16, &v26);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_217765000, v7, v8, "Updated existing message item for %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v25, -1, -1);
    MEMORY[0x219A13268](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v23);
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(uint64_t))(v0 + 8))(1);
    return;
  }

  __break(1u);
}

uint64_t sub_21782B724()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 459) = (*(uint64_t (**)(_QWORD))(v0 + 344))(*(_QWORD *)(v0 + 248)) & 1;
  return swift_task_switch();
}

uint64_t sub_21782B774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  void *v18;
  uint8_t *v19;
  _QWORD *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  unint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37[2];

  if (*(_BYTE *)(v0 + 459) != 1)
  {
    swift_bridgeObjectRelease();
    if (qword_253F26CA0 != -1)
      swift_once();
    sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
    swift_bridgeObjectRetain();
    v4 = sub_217847EC0();
    v5 = sub_217848298();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(_QWORD *)(v0 + 280);
    if (v6)
    {
      v8 = *(_QWORD *)(v0 + 272);
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v37[0] = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 96) = sub_2177D06AC(v8, v7, v37);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v4, v5, "Should not store message record for %s, account or alias mismatch", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v10, -1, -1);
      MEMORY[0x219A13268](v9, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v11 = *(void **)(v0 + 248);
    sub_21782DE98();
    swift_allocError();
    *v12 = 0;
    goto LABEL_11;
  }
  if (*(_QWORD *)(v0 + 240))
  {
    v1 = qword_253F28DB8;
    *(_QWORD *)(v0 + 360) = qword_253F28DB8;
    if (v1)
    {
      v2 = qword_253F28DC0;
      *(_QWORD *)(v0 + 368) = qword_253F28DC0;
      *(_QWORD *)(v0 + 376) = *(_QWORD *)(v2 + 40);
      sub_217848160();
      return swift_task_switch();
    }
    v11 = *(void **)(v0 + 248);
    sub_217788584();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!sub_21782DCA8())
  {
    objc_opt_self();
    v23 = swift_dynamicCastObjCClass();
    *(_QWORD *)(v0 + 384) = v23;
    if (v23)
    {
      v24 = (void *)v23;
      v25 = *(id *)(v0 + 248);
      objc_msgSend(v24, sel_setFlags_, (unint64_t)objc_msgSend(v24, sel_flags) | 0x2000);
      v26 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 392) = v26;
      *v26 = v0;
      v26[1] = sub_21782C3B0;
      return sub_2177E0998((uint64_t)v24);
    }
    swift_bridgeObjectRelease();
    if (qword_253F26CA0 != -1)
      swift_once();
    sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
    swift_bridgeObjectRetain();
    v29 = sub_217847EC0();
    v30 = sub_217848298();
    v31 = os_log_type_enabled(v29, v30);
    v32 = *(_QWORD *)(v0 + 280);
    if (v31)
    {
      v33 = *(_QWORD *)(v0 + 272);
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v37[0] = v35;
      *(_DWORD *)v34 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 88) = sub_2177D06AC(v33, v32, v37);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v29, v30, "Failed to generate IMMessageItem %s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v35, -1, -1);
      MEMORY[0x219A13268](v34, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v11 = *(void **)(v0 + 248);
    sub_21782DE98();
    swift_allocError();
    *v36 = 1;
LABEL_11:
    swift_willThrow();
LABEL_12:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_253F26CA0 != -1)
    swift_once();
  v13 = *(void **)(v0 + 248);
  sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
  v14 = v13;
  v15 = sub_217847EC0();
  v16 = sub_2178482B0();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(void **)(v0 + 248);
  if (v17)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v19 = 138412290;
    *(_QWORD *)(v0 + 112) = v18;
    v21 = v18;
    sub_2178484E4();
    *v20 = v18;

    _os_log_impl(&dword_217765000, v15, v16, "Message item is a candidate for deletion since it has no parent chat and has an error: %@", v19, 0xCu);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v20, -1, -1);
    MEMORY[0x219A13268](v19, -1, -1);
    v22 = *(NSObject **)(v0 + 248);
  }
  else
  {

    v22 = *(NSObject **)(v0 + 248);
    v15 = v22;
  }

  v27 = -[NSObject guid](v22, sel_guid);
  v28 = -[NSObject cloudKitRecordID](v22, sel_cloudKitRecordID);
  IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_21782BE88()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 460) = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 376))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240)) & 1;
  return swift_task_switch();
}

uint64_t sub_21782BEDC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD *v15;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  unint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  _BYTE *v27;
  uint64_t v28;

  if ((*(_BYTE *)(v0 + 460) & 1) != 0)
  {
    v1 = *(void **)(v0 + 248);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
  if (sub_21782DCA8())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_253F26CA0 != -1)
      swift_once();
    v2 = *(void **)(v0 + 248);
    sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
    v3 = v2;
    v4 = sub_217847EC0();
    v5 = sub_2178482B0();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(void **)(v0 + 248);
    if (v6)
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v8 = 138412290;
      *(_QWORD *)(v0 + 112) = v7;
      v10 = v7;
      sub_2178484E4();
      *v9 = v7;

      _os_log_impl(&dword_217765000, v4, v5, "Message item is a candidate for deletion since it has no parent chat and has an error: %@", v8, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v9, -1, -1);
      MEMORY[0x219A13268](v8, -1, -1);
      v11 = *(NSObject **)(v0 + 248);
    }
    else
    {

      v11 = *(NSObject **)(v0 + 248);
      v4 = v11;
    }

    v17 = -[NSObject guid](v11, sel_guid);
    v18 = -[NSObject cloudKitRecordID](v11, sel_cloudKitRecordID);
    IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit();

    goto LABEL_12;
  }
  objc_opt_self();
  v12 = swift_dynamicCastObjCClass();
  *(_QWORD *)(v0 + 384) = v12;
  if (v12)
  {
    v13 = (void *)v12;
    v14 = *(id *)(v0 + 248);
    objc_msgSend(v13, sel_setFlags_, (unint64_t)objc_msgSend(v13, sel_flags) | 0x2000);
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v15;
    *v15 = v0;
    v15[1] = sub_21782C3B0;
    return sub_2177E0998((uint64_t)v13);
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_253F26CA0 != -1)
      swift_once();
    sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
    swift_bridgeObjectRetain();
    v19 = sub_217847EC0();
    v20 = sub_217848298();
    v21 = os_log_type_enabled(v19, v20);
    v22 = *(_QWORD *)(v0 + 280);
    if (v21)
    {
      v23 = *(_QWORD *)(v0 + 272);
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v28 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 88) = sub_2177D06AC(v23, v22, &v28);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v19, v20, "Failed to generate IMMessageItem %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v25, -1, -1);
      MEMORY[0x219A13268](v24, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v26 = *(void **)(v0 + 248);
    sub_21782DE98();
    swift_allocError();
    *v27 = 1;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21782C3B0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21782C404()
{
  uint64_t v0;
  const void *v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  NSObject *v22;
  uint8_t *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;

  v1 = (const void *)(v0 + 16);
  if (qword_253F26CA0 != -1)
    swift_once();
  sub_21776F584(*(_QWORD *)(v0 + 184), (uint64_t)qword_253F28FE8);
  swift_bridgeObjectRetain_n();
  v2 = sub_217847EC0();
  v3 = sub_217848280();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 280);
  if (v4)
  {
    v6 = *(_QWORD *)(v0 + 272);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v26 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 104) = sub_2177D06AC(v6, v5, &v26);
    v1 = (const void *)(v0 + 16);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_217765000, v2, v3, "Created message item for %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v8, -1, -1);
    MEMORY[0x219A13268](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v9 = *(void **)(v0 + 384);
  v11 = *(_QWORD *)(v0 + 272);
  v10 = *(_QWORD *)(v0 + 280);
  v13 = *(_QWORD *)(v0 + 240);
  v12 = *(void **)(v0 + 248);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  *(_QWORD *)(v14 + 24) = v10;
  *(_QWORD *)(v0 + 48) = sub_21782DF00;
  *(_QWORD *)(v0 + 56) = v14;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_21782DDD8;
  *(_QWORD *)(v0 + 40) = &unk_24D80F490;
  v15 = _Block_copy(v1);
  swift_release();
  objc_msgSend(v9, sel_enumerateAttachmentGUIDsWithBlock_, v15);
  _Block_release(v15);

  if (v13)
  {
    v16 = qword_253F28DB8;
    *(_QWORD *)(v0 + 400) = qword_253F28DB8;
    if (v16)
    {
      v17 = qword_253F28DC0;
      *(_QWORD *)(v0 + 408) = qword_253F28DC0;
      *(_QWORD *)(v0 + 416) = *(_QWORD *)(v17 + 64);
      sub_217848160();
      return swift_task_switch();
    }
    else
    {
      v25 = *(void **)(v0 + 248);
      sub_217788584();
      swift_allocError();
      swift_willThrow();
      swift_bridgeObjectRelease();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    v19 = sub_217847EC0();
    v20 = sub_217848298();
    v21 = os_log_type_enabled(v19, v20);
    v22 = *(NSObject **)(v0 + 248);
    if (v21)
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_217765000, v19, v20, "No parentChatID to add this message to", v23, 2u);
      MEMORY[0x219A13268](v23, -1, -1);
      v24 = v19;
    }
    else
    {
      v24 = *(NSObject **)(v0 + 248);
      v22 = v19;
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
}

uint64_t sub_21782C7EC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 416))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  return swift_task_switch();
}

uint64_t sub_21782C838()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;

  v1 = qword_253F28DB8;
  *(_QWORD *)(v0 + 424) = qword_253F28DB8;
  if (v1)
  {
    v2 = qword_253F28DC0;
    *(_QWORD *)(v0 + 432) = qword_253F28DC0;
    if (qword_253F269A0 != -1)
      swift_once();
    swift_beginAccess();
    v3 = qword_253F28F98;
    if (*(_QWORD *)(qword_253F28F98 + 16))
    {
      v5 = *(_QWORD *)(v0 + 232);
      v4 = *(_QWORD *)(v0 + 240);
      swift_bridgeObjectRetain();
      v6 = sub_2177D0D64(v5, v4);
      if ((v7 & 1) != 0)
        v8 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
      else
        v8 = -1;
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -1;
    }
    *(_QWORD *)(v0 + 440) = v8;
    swift_endAccess();
    *(_QWORD *)(v0 + 448) = *(_QWORD *)(v2 + 72);
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    v9 = *(void **)(v0 + 248);
    sub_217788584();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21782C9D4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 440));
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21782CA2C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_21782CA80()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 288);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21782CAE4(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char **v10;
  id v11;
  unsigned int v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  char v29;
  id v30;
  unsigned __int8 v31;
  id v32;
  unsigned int v33;
  id v34;
  id v35;
  id v36;
  unsigned __int8 v37;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
    return 0;
  v5 = (void *)v4;
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)objc_opt_self();
    v8 = a1;
    v9 = a2;
    v10 = &selRef_setData_;
    v11 = objc_msgSend(v7, sel_sharedFeatureFlags);
    v12 = objc_msgSend(v11, sel_isEmojiTapbacksEnabled);

    v13 = objc_msgSend(v5, sel_threadIdentifier);
    if (!v12)
    {
      if (v13)
      {

        v16 = objc_msgSend((id)v6, sel_threadIdentifier);
        if (!v16)
          goto LABEL_39;

      }
LABEL_18:
      v19 = objc_msgSend(v7, sel_sharedFeatureFlags);
      v20 = objc_msgSend(v19, sel_isScheduledMessagesCoreEnabled);

      if (v20 && objc_msgSend((id)v6, sel_scheduleType) == (id)2)
        goto LABEL_39;
      v21 = objc_msgSend(v8, sel_service);
      if (v21)
      {
        v22 = v21;
        v23 = sub_217847F98();
        v25 = v24;
        v26 = objc_msgSend(v9, sel_service);
        if (v26)
        {
          v27 = v26;
          if (v23 == sub_217847F98() && v25 == v28)
          {

            swift_bridgeObjectRelease_n();
          }
          else
          {
            v29 = sub_2178488E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v29 & 1) != 0)
            {

            }
            else
            {
              v30 = (id)*MEMORY[0x24BE50FF0];
              v31 = objc_msgSend(v30, sel_containsObject_, v22);

              if ((v31 & 1) == 0)
              {
                v36 = (id)*MEMORY[0x24BE50FF0];
                v37 = objc_msgSend(v36, sel_containsObject_, v27);

                v10 = &selRef_setData_;
                if ((v37 & 1) != 0)
                  goto LABEL_39;
                goto LABEL_31;
              }
            }

          }
          v10 = &selRef_setData_;
        }
        else
        {
          swift_bridgeObjectRelease();

        }
      }
LABEL_31:
      v32 = objc_msgSend(v7, v10[150]);
      v33 = objc_msgSend(v32, sel_isCarrierPigeonEnabled);

      if (!v33
        || (objc_msgSend((id)v6, sel_sentOrReceivedOffGrid) & 1) != 0
        || (objc_msgSend(v5, sel_sentOrReceivedOffGrid) & 1) == 0)
      {
        v34 = objc_msgSend(v5, sel_originalUnformattedID);
        if (!v34)
        {
LABEL_37:
          v6 = 0;
LABEL_40:

          return v6;
        }

        v35 = objc_msgSend((id)v6, sel_originalUnformattedID);
        if (v35)
        {

          goto LABEL_37;
        }
      }
LABEL_39:
      v6 = 1;
      goto LABEL_40;
    }
    if (v13)
    {

      v14 = objc_msgSend((id)v6, sel_threadIdentifier);
      if (!v14)
      {
        v15 = 1;
LABEL_13:
        v17 = objc_msgSend(v5, sel_associatedMessageEmoji);
        if (v17)
        {

          v18 = objc_msgSend((id)v6, sel_associatedMessageEmoji);
          if (!v18)
            goto LABEL_39;

          if ((v15 & 1) != 0)
            goto LABEL_39;
        }
        else if ((v15 & 1) != 0)
        {
          goto LABEL_39;
        }
        goto LABEL_18;
      }

    }
    v15 = 0;
    goto LABEL_13;
  }
  return v6;
}

uint64_t sub_21782CE94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_21782CEB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  char v27;
  char v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = type metadata accessor for MessageRecord();
  v3 = (uint64_t *)(v1 + *(int *)(v2 + 140));
  v4 = v3[1];
  if (!v4)
    goto LABEL_16;
  v5 = v2;
  v6 = *v3;
  v7 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  v8 = objc_msgSend(v7, sel_guid);
  if (!v8)
    goto LABEL_15;
  v9 = v8;
  v10 = *(_QWORD *)(v0 + 24);
  v11 = sub_217847F98();
  v13 = v12;

  if (!*(_QWORD *)(v10 + 16)
    || (v14 = sub_2177D0D64(v11, v13), (v15 & 1) == 0)
    || (v16 = *(void **)(v0 + 16),
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) + 56) + 8 * v14),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v18 = objc_msgSend(v16, sel_service)) == 0))
  {
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    v28 = 0;
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(v28 & 1);
  }
  v19 = v18;
  v20 = (id)*MEMORY[0x24BE50FF0];
  v21 = objc_msgSend(v20, sel_containsObject_, v19);

  if ((v21 & 1) != 0)
  {
    if (*(_QWORD *)(v17 + 16))
    {
      v22 = *(_QWORD *)(v17 + 40);
      v38 = *(_QWORD *)(v17 + 32);
      v23 = *(_QWORD *)(v17 + 64);
      v24 = *(_QWORD *)(v17 + 72);
      v25 = *(unsigned __int8 *)(v17 + 80);
      v26 = *(_BYTE *)(v17 + 81);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0 || v25 != 45)
      {
        if (v24)
        {
          if (v23 == v6 && v24 == v4)
          {
            v27 = 1;
            goto LABEL_32;
          }
LABEL_31:
          v27 = sub_2178488E0();
          goto LABEL_32;
        }
      }
      else if (v22)
      {
        if (v38 == v6 && v22 == v4)
        {
          v27 = 1;
LABEL_32:
          swift_bridgeObjectRelease();
          goto LABEL_33;
        }
        goto LABEL_31;
      }
      swift_bridgeObjectRelease();
      v27 = 0;
LABEL_33:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v28 = v27 ^ 1;
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(v28 & 1);
    }
    goto LABEL_14;
  }
  v30 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = v30 + *(int *)(v5 + 136);
  v32 = *(id *)v31;
  v28 = 1;
  if (*(_QWORD *)v31 != 1)
  {
    v33 = *(void **)(v31 + 24);
    if (v33)
    {
      v35 = *(void **)(v31 + 8);
      v34 = *(void **)(v31 + 16);
      sub_21782DF20(*(id *)v31, v35, v34, *(void **)(v31 + 24));
      v36 = v33;
      if (objc_msgSend(v36, sel_hasActualParentChatId))
      {
        v37 = objc_msgSend(v36, sel_actualParentChatId);

        if (v37)
        {

          goto LABEL_16;
        }
      }
      else
      {

      }
      v28 = 1;
    }
  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v28 & 1);
}

void sub_21782D20C(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  unsigned int v18;
  void *v19;
  id v20;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (v6)
    {
      v7 = (void *)v6;
      v20 = a1;
      v8 = a2;
      v9 = objc_msgSend(v5, sel_threadIdentifier);
      if (!v9)
      {
        v9 = objc_msgSend(v7, sel_threadIdentifier);
        objc_msgSend(v5, sel_setThreadIdentifier_, v9);
      }

      v10 = (void *)objc_opt_self();
      v11 = objc_msgSend(v10, sel_sharedFeatureFlags);
      v12 = objc_msgSend(v11, sel_isEmojiTapbacksEnabled);

      if (v12)
      {
        objc_opt_self();
        v13 = swift_dynamicCastObjCClass();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = v20;
          if (objc_msgSend(v14, sel_associatedMessageType) == (id)2006)
          {
            v16 = objc_msgSend(v14, sel_associatedMessageEmoji);
            if (!v16)
            {
              v16 = objc_msgSend(v7, sel_associatedMessageEmoji);
              objc_msgSend(v14, sel_setAssociatedMessageEmoji_, v16);
            }

            v15 = v16;
          }

        }
      }
      v17 = objc_msgSend(v10, sel_sharedFeatureFlags);
      v18 = objc_msgSend(v17, sel_isScheduledMessagesCoreEnabled);

      if (v18)
      {
        if (objc_msgSend(v7, sel_scheduleType) || !objc_msgSend(v5, sel_scheduleType))
        {
          v19 = v20;
          v20 = v8;
LABEL_19:

          return;
        }
        objc_msgSend(v5, sel_setScheduleType_, objc_msgSend(v7, sel_scheduleType));
        objc_msgSend(v5, sel_setScheduleState_, objc_msgSend(v7, sel_scheduleState));
      }
      v19 = v8;
      goto LABEL_19;
    }
  }
}

uint64_t sub_21782D49C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void (**v4)(char *, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (**v12)(char *, uint64_t, uint64_t);
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(char *, uint64_t, uint64_t);
  void (*v19)(char *, uint64_t, uint64_t);
  id v20;
  void (**v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void (*v30)(_QWORD, _QWORD);
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t result;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (**v51)(char *, uint64_t, uint64_t);
  NSObject *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (**v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  char *v73;
  uint64_t v74;
  void (*v75)(_QWORD, _QWORD);
  void (**v76)(char *, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78[2];
  uint64_t v79;

  v3 = sub_217847ED8();
  v4 = *(void (***)(char *, uint64_t, uint64_t))(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v71 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (void (**)(char *, uint64_t, uint64_t))((char *)&v71 - v11);
  v13 = (unint64_t *)(v1 + *(int *)(type metadata accessor for MessageRecord() + 140));
  v14 = v13[1];
  if (!v14)
    goto LABEL_10;
  v15 = *v13;
  v16 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0)
    v16 = v15 & 0xFFFFFFFFFFFFLL;
  if (!v16)
  {
LABEL_10:
    if (qword_253F26CA0 != -1)
      swift_once();
    v33 = sub_21776F584(v3, (uint64_t)qword_253F28FE8);
    v4[2](v7, v33, v3);
    v34 = a1;
    v35 = sub_217847EC0();
    v36 = sub_217848280();
    if (!os_log_type_enabled(v35, v36))
    {

      ((void (*)(char *, uint64_t))v4[1])(v7, v3);
      return 0;
    }
    v76 = v4;
    v77 = v3;
    v37 = (uint8_t *)swift_slowAlloc();
    v12 = (void (**)(char *, uint64_t, uint64_t))swift_slowAlloc();
    v78[0] = (uint64_t)v12;
    *(_DWORD *)v37 = 136315138;
    v38 = objc_msgSend(v34, sel_guid);
    if (v38)
    {
      v39 = v38;
      v40 = sub_217847F98();
      v42 = v41;

      v79 = sub_2177D06AC(v40, v42, v78);
      sub_2178484E4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217765000, v35, v36, "No parent chat ID for item: %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v12, -1, -1);
      MEMORY[0x219A13268](v37, -1, -1);

      ((void (*)(char *, uint64_t))v76[1])(v7, v77);
      return 0;
    }

    __break(1u);
    goto LABEL_28;
  }
  v75 = (void (*)(_QWORD, _QWORD))v15;
  if (qword_253F26CA0 != -1)
    swift_once();
  v17 = sub_21776F584(v3, (uint64_t)qword_253F28FE8);
  v18 = v4;
  v19 = v4[2];
  v74 = v17;
  ((void (*)(void (**)(char *, uint64_t, uint64_t)))v19)(v12);
  v20 = a1;
  swift_bridgeObjectRetain_n();
  v21 = (void (**)(char *, uint64_t, uint64_t))v20;
  v22 = sub_217847EC0();
  v23 = sub_217848280();
  if (!os_log_type_enabled(v22, v23))
  {

    swift_bridgeObjectRelease_n();
    v32 = v18[1];
    ((void (*)(void (**)(char *, uint64_t, uint64_t), uint64_t))v32)(v12, v3);
    v30 = v75;
    goto LABEL_18;
  }
  v72 = v19;
  v73 = v10;
  v76 = v18;
  v77 = v3;
  v24 = swift_slowAlloc();
  v71 = swift_slowAlloc();
  v78[0] = v71;
  *(_DWORD *)v24 = 136315394;
  v25 = objc_msgSend(v21, sel_guid);
  v4 = v21;
  if (!v25)
  {
LABEL_28:

    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_29;
  }
  v26 = v25;
  v27 = sub_217847F98();
  v29 = v28;

  v79 = sub_2177D06AC(v27, v29, v78);
  sub_2178484E4();

  swift_bridgeObjectRelease();
  *(_WORD *)(v24 + 12) = 2080;
  swift_bridgeObjectRetain();
  v30 = v75;
  v79 = sub_2177D06AC((uint64_t)v75, v14, v78);
  sub_2178484E4();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_217765000, v22, v23, "Item %s has parent chat ID %s", (uint8_t *)v24, 0x16u);
  v31 = v71;
  swift_arrayDestroy();
  MEMORY[0x219A13268](v31, -1, -1);
  MEMORY[0x219A13268](v24, -1, -1);

  v3 = v77;
  v32 = v76[1];
  ((void (*)(void (**)(char *, uint64_t, uint64_t), uint64_t))v32)(v12, v77);
  v21 = v4;
  v19 = v72;
  v10 = v73;
LABEL_18:
  v78[0] = (uint64_t)v30;
  v78[1] = v14;
  v44 = sub_21776F498();
  v45 = MEMORY[0x219A126A4](59, 0xE100000000000000, 2, 1, MEMORY[0x24BEE0D00], v44);
  v46 = *(_QWORD *)(v45 + 16);
  if (!v46)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v47 = (uint64_t *)(v45 + 32 * v46);
  v49 = *v47;
  v48 = v47[1];
  v50 = v47[3];
  v76 = (void (**)(char *, uint64_t, uint64_t))v47[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19(v10, v74, v3);
  v51 = v21;
  swift_bridgeObjectRetain_n();
  v12 = v51;
  v52 = sub_217847EC0();
  v53 = sub_217848280();
  if (!os_log_type_enabled(v52, (os_log_type_t)v53))
  {

    swift_bridgeObjectRelease_n();
    ((void (*)(char *, uint64_t))v32)(v10, v3);
    v63 = v76;
    goto LABEL_24;
  }
  LODWORD(v72) = v53;
  v74 = v48;
  v75 = (void (*)(_QWORD, _QWORD))v32;
  v54 = v49;
  v73 = v10;
  v77 = v3;
  v55 = swift_slowAlloc();
  v71 = swift_slowAlloc();
  v78[0] = v71;
  *(_DWORD *)v55 = 136315394;
  v56 = objc_msgSend(v12, sel_guid);
  if (v56)
  {
    v57 = v56;
    v58 = sub_217847F98();
    v60 = v59;

    v79 = sub_2177D06AC(v58, v60, v78);
    sub_2178484E4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v55 + 12) = 2080;
    swift_bridgeObjectRetain();
    v49 = v54;
    v61 = v54;
    v62 = v74;
    v63 = v76;
    v64 = MEMORY[0x219A12170](v61, v74, v76, v50);
    v66 = v65;
    swift_bridgeObjectRelease();
    v79 = sub_2177D06AC(v64, v66, v78);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217765000, v52, (os_log_type_t)v72, "Item %s has chat address %s", (uint8_t *)v55, 0x16u);
    v67 = v71;
    swift_arrayDestroy();
    MEMORY[0x219A13268](v67, -1, -1);
    v68 = v55;
    v48 = v62;
    MEMORY[0x219A13268](v68, -1, -1);

    v75(v73, v77);
LABEL_24:
    MEMORY[0x219A12170](v49, v48, v63, v50);
    swift_bridgeObjectRelease();
    v69 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
    v70 = MEMORY[0x219A12C44](v69);

    return (objc_msgSend((id)objc_opt_self(), sel_supportsBusinessChat) & 1) == 0 && v70;
  }
LABEL_29:

  result = swift_bridgeObjectRelease_n();
  __break(1u);
  return result;
}

BOOL sub_21782DCA8()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  BOOL v5;
  void *v6;
  _BOOL8 result;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for MessageRecord() + 140));
  v2 = v1[1];
  v5 = 1;
  if (v2)
  {
    v3 = *v1 & 0xFFFFFFFFFFFFLL;
    if ((v2 & 0x2000000000000000) != 0 ? HIBYTE(v2) & 0xF : v3)
      v5 = 0;
  }
  objc_opt_self();
  v6 = (void *)swift_dynamicCastObjCClass();
  if (!v6)
    return 0;
  result = objc_msgSend(v6, sel_errorCode) != 0;
  if (!v5)
    return 0;
  return result;
}

void sub_21782DD38(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  if (qword_253F25B88 != -1)
    swift_once();
  v3 = (void *)sub_217847F74();
  if (a2)
    v4 = sub_217847F74();
  else
    v4 = 0;
  v5 = (id)v4;
  IMDMessageRecordAssociateMessageWithGUIDToAttachmentWithGUID();

}

uint64_t sub_21782DDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    v7 = sub_217847F98();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  swift_retain();
  v6(v7, v9, a3, a4);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_21782DE54()
{
  unint64_t result;

  result = qword_254F03290;
  if (!qword_254F03290)
  {
    result = MEMORY[0x219A13184](&unk_21784B3A8, &type metadata for ItemRecordError);
    atomic_store(result, (unint64_t *)&qword_254F03290);
  }
  return result;
}

unint64_t sub_21782DE98()
{
  unint64_t result;

  result = qword_254F03298;
  if (!qword_254F03298)
  {
    result = MEMORY[0x219A13184](&unk_217850784, &_s12ImportErrorsON);
    atomic_store(result, &qword_254F03298);
  }
  return result;
}

uint64_t sub_21782DEDC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21782DF00(uint64_t a1, uint64_t a2)
{
  sub_21782DD38(a1, a2);
}

uint64_t sub_21782DF08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21782DF18()
{
  return swift_release();
}

id sub_21782DF20(id result, void *a2, void *a3, void *a4)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  if (result != (id)1)
  {
    v5 = result;
    v6 = a4;
    v7 = v5;
    v8 = a2;
    return a3;
  }
  return result;
}

uint64_t _s12ImportErrorsOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21782DFB4 + 4 * byte_217850709[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21782DFE8 + 4 * asc_217850704[v4]))();
}

uint64_t sub_21782DFE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21782DFF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21782DFF8);
  return result;
}

uint64_t sub_21782E004(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21782E00CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21782E010(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21782E018(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s12ImportErrorsOMa()
{
  return &_s12ImportErrorsON;
}

unint64_t sub_21782E038()
{
  unint64_t result;

  result = qword_254F032A8;
  if (!qword_254F032A8)
  {
    result = MEMORY[0x219A13184](&unk_21785075C, &_s12ImportErrorsON);
    atomic_store(result, (unint64_t *)&qword_254F032A8);
  }
  return result;
}

void sub_21782E07C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, char *, uint64_t);
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  void (*v29)(uint64_t, char *, uint64_t);
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, char *, uint64_t);
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD aBlock[3];
  void *v68;
  uint64_t (*v69)(uint64_t, void *);
  uint64_t v70;

  v51 = a6;
  v62 = a5;
  v63 = a2;
  v59 = a3;
  v8 = sub_21776B790(&qword_253F26D60);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = v10;
  v61 = v10;
  v12 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v58 = a1;
  v13(v12, a1, v8);
  v57 = v13;
  v60 = *(unsigned __int8 *)(v9 + 80);
  v14 = ((v60 + 16) & ~v60) + v11;
  v15 = (v60 + 16) & ~v60;
  v16 = v60 | 7;
  v17 = swift_allocObject();
  v55 = v15;
  v18 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v18(v17 + v15, v12, v8);
  v53 = v18;
  sub_21784843C();
  sub_217848448();
  v13(v12, a1, v8);
  v54 = ((v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v19 = (v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v56 = v19;
  v52 = v16;
  v20 = swift_allocObject();
  v18(v20 + v15, v12, v8);
  v21 = (_QWORD *)(v20 + v19);
  v22 = v59;
  *v21 = v59;
  v21[1] = a4;
  v23 = a4;
  v69 = sub_21782EB48;
  v70 = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21782EBC8;
  v68 = &unk_24D80F600;
  v24 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  v25 = v63;
  objc_msgSend(v63, sel_setRecordZoneChangeTokensUpdatedBlock_, v24);
  _Block_release(v24);
  v27 = v57;
  v26 = v58;
  v57(v12, v58, v8);
  v28 = swift_allocObject();
  v29 = v53;
  v53(v28 + v55, v12, v8);
  v30 = (_QWORD *)(v28 + v56);
  *v30 = v22;
  v30[1] = v23;
  v31 = v23;
  swift_unknownObjectRetain();
  v32 = v25;
  sub_217848424();
  v27(v12, v26, v8);
  v33 = (v60 + 32) & ~v60;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v22;
  *(_QWORD *)(v34 + 24) = v31;
  v29(v34 + v33, v12, v8);
  v35 = v22;
  swift_unknownObjectRetain();
  sub_217848418();
  if ((*v62 & 1) == 0)
  {
    *v62 = 1;
    v36 = (_QWORD *)(v22 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase);
    v37 = *(_QWORD *)(v22 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 24);
    v38 = *(_QWORD *)(v22 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 32);
    sub_21776E3A4(v36, *(_QWORD *)(v35 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudDatabase + 24));
    (*(void (**)(void *, uint64_t, uint64_t))(v38 + 8))(v32, v37, v38);
    if (qword_253F25D98 != -1)
      swift_once();
    v39 = sub_217847ED8();
    sub_21776F584(v39, (uint64_t)qword_253F28DC8);
    sub_21776E4FC(v51, (uint64_t)aBlock);
    swift_unknownObjectRetain_n();
    v40 = v32;
    v41 = sub_217847EC0();
    v42 = sub_2178482B0();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = (_QWORD *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      v66 = v45;
      *(_DWORD *)v43 = 136315650;
      v46 = sub_21776E3A4(aBlock, (uint64_t)v68);
      v47 = *v46;
      v48 = v46[1];
      swift_bridgeObjectRetain();
      v64 = sub_2177D06AC(v47, v48, &v66);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)aBlock);
      *(_WORD *)(v43 + 12) = 2080;
      v64 = 0x2E636E7973;
      v65 = 0xE500000000000000;
      sub_21776E3A4((_QWORD *)(v35 + 16), *(_QWORD *)(v35 + 40));
      sub_2177F4440();
      sub_21784801C();
      swift_bridgeObjectRelease();
      sub_21784801C();
      sub_217847E6C();
      sub_21777F28C();
      sub_2178488A4();
      sub_21784801C();
      swift_bridgeObjectRelease();
      v64 = sub_2177D06AC(v64, v65, &v66);
      sub_2178484E4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2112;
      v64 = (uint64_t)v40;
      v49 = v40;
      sub_2178484E4();
      *v44 = v40;

      _os_log_impl(&dword_217765000, v41, v42, "Added fetch operation for %s (sync: %s): %@", (uint8_t *)v43, 0x20u);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v44, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v45, -1, -1);
      MEMORY[0x219A13268](v43, -1, -1);

    }
    else
    {
      _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)aBlock);

      swift_unknownObjectRelease_n();
    }
  }
}

uint64_t sub_21782E68C(void *a1, void *a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _QWORD v12[3];
  char v13;

  v6 = sub_21776B790(&qword_253F26D40);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[1] = a1;
  v12[2] = a2;
  if ((a3 & 1) != 0)
    v13 = -127;
  else
    v13 = 0x80;
  sub_2177B7E98(a2);
  v10 = a1;
  sub_21776B790(&qword_253F26D60);
  sub_2178481D8();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_21782E774()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21776B790(&qword_253F26D60);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_21782E7D8(void *a1, void *a2, char a3)
{
  char v5;

  v5 = a3 & 1;
  sub_21776B790(&qword_253F26D60);
  return sub_21782E68C(a1, a2, v5);
}

void sub_21782E830(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  if (qword_253F25D98 != -1)
    swift_once();
  v6 = sub_217847ED8();
  sub_21776F584(v6, (uint64_t)qword_253F28DC8);
  swift_bridgeObjectRetain_n();
  v7 = a1;
  v8 = sub_217847EC0();
  v9 = sub_2178482B0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v14 = v12;
    *(_DWORD *)v10 = 136315394;
    swift_bridgeObjectRetain();
    sub_2177D06AC(a2, a3, &v14);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2112;
    v13 = v7;
    sub_2178484E4();
    *v11 = v7;

    _os_log_impl(&dword_217765000, v8, v9, "Deleted %s record reported, id %@", (uint8_t *)v10, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v12, -1, -1);
    MEMORY[0x219A13268](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_21782EA60(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  _QWORD v9[3];
  char v10;

  v3 = sub_21776B790(&qword_253F26D40);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[1] = a2;
  v9[2] = 0;
  v10 = 0;
  v7 = a2;
  sub_21776B790(&qword_253F26D60);
  sub_2178481D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_2177C0FC4();
}

uint64_t sub_21782EB48(uint64_t a1, void *a2)
{
  sub_21776B790(&qword_253F26D60);
  return sub_21782EA60(a1, a2);
}

uint64_t sub_21782EBC8(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  void (*v7)(void *, void *, void *, unint64_t);
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;

  v4 = a4;
  v7 = *(void (**)(void *, void *, void *, unint64_t))(a1 + 32);
  if (a4)
  {
    swift_retain();
    v8 = a2;
    v9 = a3;
    v10 = v4;
    v4 = (void *)sub_217847DAC();
    v12 = v11;

  }
  else
  {
    swift_retain();
    v13 = a2;
    v14 = a3;
    v12 = 0xF000000000000000;
  }
  v7(a2, a3, v4, v12);

  sub_21776E454((uint64_t)v4, v12);
  return swift_release();
}

uint64_t sub_21782EC78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21782EC88()
{
  return swift_release();
}

uint64_t sub_21782EC90(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  void (*v19)(char *, uint64_t);
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v12 = sub_21776B790(&qword_253F26D40);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a5 & 0x100) != 0)
  {
    v26 = (uint64_t)a2;
    v21 = a2;
    sub_21776B790(&qword_253F26D60);
    return sub_2178481E4();
  }
  else
  {
    v24 = a5 & 1;
    v16 = a2;
    v22 = a7;
    v17 = v16;
    sub_21776ED9C(a3, a4);
    v18 = v17;
    sub_21776ED9C(a3, a4);
    v25 = a4;
    sub_21776E454(a3, a4);
    v26 = (uint64_t)a2;
    v27 = 0;
    v28 = 0;
    v23 = v18;
    sub_21776B790(&qword_253F26D60);
    sub_2178481D8();
    v19 = *(void (**)(char *, uint64_t))(v13 + 8);
    v19(v15, v12);
    sub_2177C0FC4();
    v26 = v24;
    v27 = 0;
    v28 = 64;
    sub_2178481D8();

    sub_21782F200(a2, a3, v25, a5, 0);
    return ((uint64_t (*)(char *, uint64_t))v19)(v15, v12);
  }
}

uint64_t sub_21782EE58()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21776B790(&qword_253F26D60);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21782EED0(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, __int16 a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v10 = a5 & 0x1FF;
  v11 = *(_QWORD *)(sub_21776B790(&qword_253F26D60) - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return sub_21782EC90(a1, a2, a3, a4, v10, v5 + v12, *(_QWORD *)(v5 + ((*(_QWORD *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_21782EF60(void *a1, char a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  id v8;
  void *v9;

  if ((a2 & 1) != 0)
  {
    v7 = a1;
  }
  else
  {
    sub_21776E3A4((_QWORD *)(a3 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(a3 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
    if ((sub_21784167C(2u, 0) & 1) != 0)
    {
      if (qword_253F25D98 != -1)
        swift_once();
      v3 = sub_217847ED8();
      sub_21776F584(v3, (uint64_t)qword_253F28DC8);
      v4 = sub_217847EC0();
      v5 = sub_217848298();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_217765000, v4, v5, "Messages in iCloud Exit Record present in cache", v6, 2u);
        MEMORY[0x219A13268](v6, -1, -1);
      }

      goto LABEL_10;
    }
    if ((sub_21784167C(1u, 0) & 1) == 0)
    {
LABEL_10:
      sub_217847F98();
      v8 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v9 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 1, 0);

      sub_21776B790(&qword_253F26D60);
      sub_2178481E4();
    }
  }
  sub_21776B790(&qword_253F26D60);
  return sub_2178481E4();
}

uint64_t sub_21782F134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21776B790(&qword_253F26D60);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21782F1AC(void *a1, char a2)
{
  uint64_t v2;
  char v4;

  v4 = a2 & 1;
  sub_21776B790(&qword_253F26D60);
  return sub_21782EF60(a1, v4, *(_QWORD *)(v2 + 16));
}

void sub_21782F200(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
  {

  }
  else
  {

    sub_21776E454(a2, a3);
  }
}

void _s17ZoneChangesResultOwxx(uint64_t a1)
{
  sub_2177DC484(*(id *)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s17ZoneChangesResultOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2177DC404(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s17ZoneChangesResultOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2177DC404(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2177DC484(v6, v7, v8);
  return a1;
}

uint64_t _s17ZoneChangesResultOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2177DC484(v4, v5, v6);
  return a1;
}

ValueMetadata *_s17ZoneChangesResultOMa()
{
  return &_s17ZoneChangesResultON;
}

_QWORD *_s17ZoneChangesResultO12RecordResultVwCP(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void _s17ZoneChangesResultO12RecordResultVwxx(id *a1)
{

}

uint64_t _s17ZoneChangesResultO12RecordResultVwca(uint64_t a1, uint64_t a2)
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

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t _s17ZoneChangesResultO12RecordResultVwta(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *_s17ZoneChangesResultO12RecordResultVMa()
{
  return &_s17ZoneChangesResultO12RecordResultVN;
}

uint64_t sub_21782F434(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  void (*v22)(char *, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;

  v27 = a5;
  v28 = a8;
  v33 = a1;
  v34 = a2;
  v26 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v31 = (char *)&v24 - v13;
  v36 = a4;
  MEMORY[0x24BDAC7A8](v12);
  v30 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - v16;
  v18 = sub_217848238();
  if (!v18)
    return sub_217848118();
  v19 = v18;
  v25 = v15;
  v39 = sub_217848700();
  v32 = sub_21784870C();
  sub_2178486C4();
  v36 = v17;
  result = sub_21784822C();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = v31;
    while (1)
    {
      v22 = (void (*)(char *, _QWORD))sub_217848268();
      (*(void (**)(char *))(v11 + 16))(v21);
      v22(v38, 0);
      v23 = v37;
      v33(v21, v35);
      if (v23)
        break;
      v37 = 0;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
      sub_2178486F4();
      sub_217848244();
      if (!--v19)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
        return v39;
      }
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v35, v27);
  }
  return result;
}

uint64_t sub_21782F710()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[4];

  v0 = sub_21776B790((uint64_t *)&unk_253F24E80);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2178481B4();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_21776F518((uint64_t)v2, (uint64_t *)&unk_253F24E80);
    v6 = 0;
    v7 = 0;
  }
  else
  {
    sub_2178481A8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(_QWORD *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v6 = sub_217848160();
      v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
  }
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = &unk_254F03390;
  *(_QWORD *)(v9 + 24) = v5;
  type metadata accessor for SyncStore();
  if (v7 | v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v11[2] = v6;
    v11[3] = v7;
  }
  result = swift_task_create();
  qword_253F25AD8 = result;
  return result;
}

uint64_t sub_21782F8D4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_21782F8EC()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(void *, uint64_t, _QWORD *);

  if (qword_253F25DE8 != -1)
    swift_once();
  v1 = (void *)qword_253F28F08;
  v2 = (void *)objc_opt_self();
  v3 = v1;
  v4 = objc_msgSend(v2, sel_defaultManager);
  v0[8] = v4;
  v0[5] = &type metadata for FileManagerProvider;
  v0[6] = &off_24D809DF8;
  v0[2] = v4;
  type metadata accessor for SyncStore();
  v5 = (_QWORD *)swift_allocObject();
  sub_21777A080((uint64_t)(v0 + 2), (uint64_t)&type metadata for FileManagerProvider);
  v6 = (uint64_t *)swift_task_alloc();
  v0[9] = v6;
  MEMORY[0x1E0EAFBD0]();
  v7 = *v6;
  v11 = (uint64_t (*)(void *, uint64_t, _QWORD *))((char *)&dword_254F033A8 + dword_254F033A8);
  v8 = v4;
  v9 = (_QWORD *)swift_task_alloc();
  v0[10] = v9;
  *v9 = v0;
  v9[1] = sub_21782FA4C;
  return v11(v3, v7, v5);
}

uint64_t sub_21782FA4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)v1 + 16;
  v3 = *(void **)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc();
  _s17MessagesCloudSync9SyncFilesVwxx_0(v2);

  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21782FACC()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 56) = *(_QWORD *)(v0 + 88);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21782FAE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (qword_253F25AE8 != -1)
    swift_once();
  v0 = qword_253F25AD8;
  sub_21776B790(&qword_253F25A70);
  v1 = swift_allocObject();
  swift_retain();
  result = swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 112) = v0;
  qword_253F28E28 = v1;
  unk_253F28E30 = &off_24D80CB70;
  return result;
}

uint64_t sub_21782FB6C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, uint64_t);
  void (*v22)(char *, uint64_t);
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v4 = sub_217847CD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21776B790((uint64_t *)&unk_253F25C80);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_217847D64();
  v24 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v23 - v15;
  sub_217787748(0, (unint64_t *)&unk_253F25DB0);
  if ((sub_2177A607C() & 1) != 0)
    return sub_217847CEC();
  v23[1] = a2;
  v18 = (void **)sub_21776E3A4(a1, a1[3]);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v10, 1, 1, v11);
  sub_2177A96A4(5, 1, (uint64_t)v10, 0, *v18, (uint64_t)v16);
  sub_21776F518((uint64_t)v10, (uint64_t *)&unk_253F25C80);
  v25 = 5459283;
  v26 = 0xE300000000000000;
  v19 = *MEMORY[0x24BDCD790];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v20(v7, v19, v4);
  sub_21776F498();
  sub_217847D58();
  v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v7, v4);
  swift_bridgeObjectRelease();
  v25 = 1668184403;
  v26 = 0xE400000000000000;
  v20(v7, v19, v4);
  sub_217847D58();
  v21(v7, v4);
  swift_bridgeObjectRelease();
  v22 = *(void (**)(char *, uint64_t))(v24 + 8);
  v22(v14, v11);
  return ((uint64_t (*)(char *, uint64_t))v22)(v16, v11);
}

uint64_t sub_21782FE44@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v15)(char *, uint64_t);
  _QWORD v16[4];

  v16[1] = a2;
  v3 = sub_217847CD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_217847D64();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v16 - v12;
  sub_217787748(0, (unint64_t *)&unk_253F25DB0);
  if ((sub_2177A607C() & 1) != 0)
    return sub_217847CEC();
  sub_21782FB6C(a1, (uint64_t)v13);
  v16[2] = 1668184435;
  v16[3] = 0xE400000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD798], v3);
  sub_21776F498();
  sub_217847D58();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  sub_217847D1C();
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, v7);
}

uint64_t sub_217830024(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t result;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(_BYTE *, uint64_t);
  id v25;
  uint64_t v26;
  _QWORD *v27;
  os_log_t v28;
  uint64_t v29;
  _BYTE v30[12];
  int v31;
  os_log_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v3 = sub_217847D64();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v30[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v30[-v8];
  sub_217787748(0, (unint64_t *)&unk_253F25DB0);
  result = sub_2177A607C();
  if ((result & 1) == 0)
  {
    sub_21782FB6C(a1, (uint64_t)v9);
    v11 = (void *)*sub_21776E3A4(a1, a1[3]);
    LOBYTE(v36[0]) = 0;
    sub_217847CC8();
    v12 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v11, sel_fileExistsAtPath_isDirectory_, v12, v36);

    if (v13)
      v14 = LOBYTE(v36[0]) == 0;
    else
      v14 = 1;
    if (v14 && (sub_2177A99CC((uint64_t)v9, 1, v11), v1))
    {
      if (qword_253F25D98 != -1)
        swift_once();
      v15 = sub_217847ED8();
      sub_21776F584(v15, (uint64_t)qword_253F28DC8);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v7, v9, v3);
      v16 = v1;
      v17 = v1;
      v18 = sub_217847EC0();
      v19 = sub_2178482B0();
      v20 = v19;
      if (os_log_type_enabled(v18, v19))
      {
        v21 = swift_slowAlloc();
        v33 = (_QWORD *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v36[0] = v34;
        *(_DWORD *)v21 = 136315394;
        sub_21776DD28(&qword_253F25C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v32 = v18;
        v22 = sub_2178488A4();
        v35 = sub_2177D06AC(v22, v23, v36);
        v31 = v20;
        sub_2178484E4();
        swift_bridgeObjectRelease();
        v24 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
        v24(v7, v3);
        *(_WORD *)(v21 + 12) = 2112;
        v25 = v1;
        v26 = _swift_stdlib_bridgeErrorToNSError();
        v35 = v26;
        sub_2178484E4();
        v27 = v33;
        *v33 = v26;

        v28 = v32;
        _os_log_impl(&dword_217765000, v32, (os_log_type_t)v31, "Failed to create directory at %s %@", (uint8_t *)v21, 0x16u);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v27, -1, -1);
        v29 = v34;
        swift_arrayDestroy();
        MEMORY[0x219A13268](v29, -1, -1);
        MEMORY[0x219A13268](v21, -1, -1);

      }
      else
      {
        v24 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
        v24(v7, v3);

      }
      swift_willThrow();
      return ((uint64_t (*)(_BYTE *, uint64_t))v24)(v9, v3);
    }
    else
    {
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v9, v3);
    }
  }
  return result;
}

uint64_t sub_217830418(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  _QWORD aBlock[6];
  __int128 v17[2];

  v4 = *a2;
  v5 = sub_21776B790(&qword_253F25BC0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v10 = (void *)a2[17];
  sub_21776E4FC((uint64_t)(a2 + 18), (uint64_t)v17);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = sub_217839ED0;
  v11[3] = v9;
  sub_21777B794(v17, (uint64_t)(v11 + 4));
  v11[9] = v10;
  v11[10] = v4;
  aBlock[4] = sub_217839F44;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217831228;
  aBlock[3] = &unk_24D80FB10;
  v12 = _Block_copy(aBlock);
  v13 = v10;
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_loadPersistentStoresWithCompletionHandler_, v12);
  _Block_release(v12);
  return swift_release();
}

uint64_t sub_2178305AC(void *a1, void *a2, uint64_t (*a3)(void), uint64_t a4, _QWORD *a5, NSObject *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t (*v46)(void);
  _QWORD *v47;
  id v48;
  uint64_t v49;
  _QWORD *v50;
  id v51;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  id v61;
  _QWORD *v62;
  _QWORD *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t (*v66)(void);
  _QWORD aBlock[7];
  id v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v12 = sub_217847D64();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v64 = a6;
    v69 = a2;
    v16 = a2;
    sub_21776B790(&qword_253F25C70);
    sub_217787748(0, (unint64_t *)&qword_253F26E80);
    if (!swift_dynamicCast())
    {
LABEL_23:

      v39 = a2;
      if (qword_253F25D98 != -1)
        swift_once();
      v40 = sub_217847ED8();
      sub_21776F584(v40, (uint64_t)qword_253F28DC8);
      v41 = a2;
      v42 = a2;
      v43 = sub_217847EC0();
      v44 = sub_217848298();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = a3;
        v47 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v45 = 138412290;
        v48 = a2;
        v49 = _swift_stdlib_bridgeErrorToNSError();
        aBlock[0] = v49;
        sub_2178484E4();
        *v47 = v49;

        _os_log_impl(&dword_217765000, v43, v44, "Error: Failed to load CoreData persistent store, %@", v45, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        v50 = v47;
        a3 = v46;
        MEMORY[0x219A13268](v50, -1, -1);
        MEMORY[0x219A13268](v45, -1, -1);
      }
      else
      {

      }
      sub_2177B9F34(0x15u, a2, 0xD00000000000001ALL, 0x80000002178556D0);
      v51 = a2;
LABEL_29:

      return a3();
    }
    v65 = a4;
    v66 = a3;
    v17 = v68;
    v18 = objc_msgSend(v68, sel_domain);
    v19 = sub_217847F98();
    v21 = v20;

    if (v19 == sub_217847F98() && v21 == v22)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v24 = sub_2178488E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
LABEL_22:

        a3 = v66;
        goto LABEL_23;
      }
    }
    if (objc_msgSend(v17, sel_code) == (id)134110)
    {
      if (qword_253F25D98 != -1)
        swift_once();
      v32 = sub_217847ED8();
      v63 = (_QWORD *)sub_21776F584(v32, (uint64_t)qword_253F28DC8);
      v33 = sub_217847EC0();
      v34 = sub_217848298();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_217765000, v33, v34, "Warning: Failed to migrate CoreData store; attempting to delete and re-create Sync store",
          v35,
          2u);
        MEMORY[0x219A13268](v35, -1, -1);
      }

      sub_21782FB6C(a5, (uint64_t)v15);
      v36 = (void *)*sub_21776E3A4(a5, a5[3]);
      LOBYTE(aBlock[0]) = 0;
      sub_217847CC8();
      v37 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      v38 = objc_msgSend(v36, sel_fileExistsAtPath_isDirectory_, v37, aBlock);

      if (v38)
      {
        sub_2177A982C((uint64_t)v15, v36);
      }
      else
      {
        sub_217847F98();
        v53 = objc_allocWithZone(MEMORY[0x24BDD1540]);
        v54 = (void *)sub_217847F74();
        swift_bridgeObjectRelease();
        v55 = objc_msgSend(v53, sel_initWithDomain_code_userInfo_, v54, 7, 0);

        sub_2177B9F34(0x11u, v55, 0xD00000000000005ALL, 0x80000002178556F0);
      }
      sub_217830024(a5);
      aBlock[4] = sub_217830ED0;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_217831228;
      aBlock[3] = &unk_24D80FB38;
      v56 = _Block_copy(aBlock);
      -[NSObject loadPersistentStoresWithCompletionHandler:](v64, sel_loadPersistentStoresWithCompletionHandler_, v56);
      _Block_release(v56);
      v57 = v17;
      v58 = sub_217847EC0();
      v59 = sub_2178482B0();
      if (os_log_type_enabled(v58, v59))
      {
        v64 = v58;
        v60 = (uint8_t *)swift_slowAlloc();
        v63 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v60 = 138412290;
        aBlock[0] = v57;
        v61 = v57;
        sub_2178484E4();
        v62 = v63;
        *v63 = v57;

        v58 = v64;
        _os_log_impl(&dword_217765000, v64, v59, "Cleared sync store due to failed migration%@", v60, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v62, -1, -1);
        MEMORY[0x219A13268](v60, -1, -1);
      }
      else
      {

      }
      a3 = v66;

      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      v51 = v69;
      goto LABEL_29;
    }
    goto LABEL_22;
  }
  if (qword_253F25D98 != -1)
    swift_once();
  v25 = sub_217847ED8();
  sub_21776F584(v25, (uint64_t)qword_253F28DC8);
  v26 = a1;
  v27 = sub_217847EC0();
  v28 = sub_2178482B0();
  if (os_log_type_enabled(v27, v28))
  {
    v66 = a3;
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v29 = 138412290;
    aBlock[0] = v26;
    v31 = v26;
    a3 = v66;
    sub_2178484E4();
    *v30 = v26;

    _os_log_impl(&dword_217765000, v27, v28, "Loaded CoreData persistent store with description: %@", v29, 0xCu);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v30, -1, -1);
    MEMORY[0x219A13268](v29, -1, -1);

  }
  else
  {

  }
  return a3();
}

void sub_217830ED0(void *a1, id a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  id v19;
  uint64_t v20;

  if (a2)
  {
    v3 = a2;
    if (qword_253F25D98 != -1)
      swift_once();
    v4 = sub_217847ED8();
    sub_21776F584(v4, (uint64_t)qword_253F28DC8);
    v5 = a2;
    v6 = a2;
    v7 = sub_217847EC0();
    v8 = sub_217848298();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      v11 = a2;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      sub_2178484E4();
      *v10 = v20;

      _os_log_impl(&dword_217765000, v7, v8, "Error: Failed to load CoreData persistent store, %@", v9, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v10, -1, -1);
      MEMORY[0x219A13268](v9, -1, -1);
    }
    else
    {

    }
    sub_2177B9F34(0x13u, a2, 0xD000000000000035, 0x8000000217855790);

  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v13 = sub_217847ED8();
    sub_21776F584(v13, (uint64_t)qword_253F28DC8);
    v19 = a1;
    v14 = sub_217847EC0();
    v15 = sub_2178482B0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      v18 = v19;
      sub_2178484E4();
      *v17 = v19;

      _os_log_impl(&dword_217765000, v14, v15, "Re-created CoreData persistent store with description: %@", v16, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v17, -1, -1);
      MEMORY[0x219A13268](v16, -1, -1);

    }
    else
    {

    }
  }
}

void sub_217831228(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

uint64_t sub_21783129C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_2178312FC;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_2178312FC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217831350()
{
  uint64_t v0;
  _QWORD *v1;

  sub_21776DD28(&qword_254F03370, (uint64_t (*)(uint64_t))type metadata accessor for SyncStore, (uint64_t)&unk_2178508B8);
  *(_QWORD *)(v0 + 32) = swift_allocObject();
  swift_weakInit();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_217831424;
  return sub_2178488F8();
}

uint64_t sub_217831424()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_217831498()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2178314A4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2178314D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_2178314F0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t ObjectType;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  if (qword_253F25DC0 != -1)
    swift_once();
  v1 = (void *)qword_253F28F00;
  *(_QWORD *)(v0 + 24) = *MEMORY[0x24BE50BD8];
  if (!objc_msgSend(v1, sel_BOOLForKey_))
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (qword_253F25CA0 != -1)
    swift_once();
  v2 = unk_253F28E30;
  ObjectType = swift_getObjectType();
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 24) + *(_QWORD *)(v2 + 24));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = sub_2178315FC;
  return v6(ObjectType, v2);
}

uint64_t sub_2178315FC(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 44) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21783165C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  uint8_t *v5;

  if (*(_BYTE *)(v0 + 44) == 1)
    objc_msgSend((id)qword_253F28F00, sel_removeObjectForKey_, *(_QWORD *)(v0 + 24));
  if (qword_253F25D98 != -1)
    swift_once();
  v1 = sub_217847ED8();
  sub_21776F584(v1, (uint64_t)qword_253F28DC8);
  v2 = sub_217847EC0();
  v3 = sub_2178482B0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(unsigned __int8 *)(v0 + 44);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    *(_DWORD *)(v0 + 40) = v4;
    sub_2178484E4();
    _os_log_impl(&dword_217765000, v2, v3, "Attempted to clear sync store success %{BOOL}d", v5, 8u);
    MEMORY[0x219A13268](v5, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21783179C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD aBlock[6];

  v2 = sub_21776B790(&qword_253F26D30);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_217839954();
    v15 = swift_allocError();
    *v16 = 0;
    aBlock[0] = v15;
    sub_21784816C();
    return;
  }
  v6 = Strong;
  v7 = objc_msgSend(*(id *)(Strong + 136), sel_persistentStoreCoordinator);
  v8 = objc_msgSend(v7, sel_persistentStores);

  sub_217787748(0, (unint64_t *)&unk_253F26E38);
  v9 = sub_2178480DC();

  if (!(v9 >> 62))
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
LABEL_12:
    swift_bridgeObjectRelease();
    v18 = *(void **)(v6 + 136);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    v19 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v20 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v20 + v19, (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    aBlock[4] = sub_217839CF8;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_217831228;
    aBlock[3] = &unk_24D80FA48;
    v21 = _Block_copy(aBlock);
    v22 = v18;
    swift_release();
    objc_msgSend(v22, sel_loadPersistentStoresWithCompletionHandler_, v21);
    _Block_release(v21);
    swift_release();

    return;
  }
  swift_bridgeObjectRetain();
  v17 = sub_217848748();
  swift_bridgeObjectRelease();
  if (!v17)
    goto LABEL_12;
LABEL_4:
  if ((v9 & 0xC000000000000001) != 0)
  {
    MEMORY[0x219A127D0](0, v9);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    if (!v10)
    {
      __break(1u);
      goto LABEL_15;
    }
  }
  if (qword_253F25D98 != -1)
LABEL_15:
    swift_once();
  v11 = sub_217847ED8();
  sub_21776F584(v11, (uint64_t)qword_253F28DC8);
  v12 = sub_217847EC0();
  v13 = sub_2178482B0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_217765000, v12, v13, "We have an existing store continuing sync.", v14, 2u);
    MEMORY[0x219A13268](v14, -1, -1);
  }

  sub_217848178();
  swift_release();
}

uint64_t sub_217831AF4(void *a1, id a2)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  uint64_t v24;

  if (a2)
  {
    v4 = a2;
    if (qword_253F25D98 != -1)
      swift_once();
    v5 = sub_217847ED8();
    sub_21776F584(v5, (uint64_t)qword_253F28DC8);
    v6 = a1;
    v7 = a2;
    v8 = v6;
    v9 = a2;
    v10 = sub_217847EC0();
    v11 = sub_217848298();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412546;
      v14 = v8;
      sub_2178484E4();
      *v13 = v8;

      *(_WORD *)(v12 + 12) = 2112;
      v15 = a2;
      v24 = _swift_stdlib_bridgeErrorToNSError();
      sub_2178484E4();
      v13[1] = v24;

      _os_log_impl(&dword_217765000, v10, v11, "Failed to load store %@ with error: %@", (uint8_t *)v12, 0x16u);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v13, -1, -1);
      MEMORY[0x219A13268](v12, -1, -1);
    }
    else
    {

    }
    sub_21776B790(&qword_253F26D30);
    return sub_21784816C();
  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v16 = sub_217847ED8();
    sub_21776F584(v16, (uint64_t)qword_253F28DC8);
    v17 = a1;
    v18 = sub_217847EC0();
    v19 = sub_2178482B0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      v22 = v17;
      sub_2178484E4();
      *v21 = v17;

      _os_log_impl(&dword_217765000, v18, v19, "Reloaded persistent store with description: %@", v20, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v21, -1, -1);
      MEMORY[0x219A13268](v20, -1, -1);

    }
    else
    {

    }
    sub_21776B790(&qword_253F26D30);
    return sub_217848178();
  }
}

uint64_t sub_217831E94(char *a1, uint64_t a2, _QWORD *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  id v25;
  id v26;
  unint64_t v27;
  id v28;
  void *v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void (*v48)(char *, uint64_t, uint64_t);
  void (**v49)(char *, uint64_t, uint64_t);
  char *v50;
  id v51;
  id v52;
  void *v53;
  _QWORD *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  void *v63;
  void (*v64)(char *, uint64_t, uint64_t);
  uint64_t v65;
  void *v66;
  void *v67;
  unsigned int v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  unsigned int v96;
  uint64_t v97;
  id v98;
  id v99;
  NSObject *v100;
  os_log_type_t v101;
  uint64_t v102;
  _QWORD *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void (**v107)(char *, char *, uint64_t);
  char *v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  void *v112;
  _QWORD v114[2];
  uint64_t v115;
  id v116;
  void (**v117)(char *, char *, uint64_t);
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  _QWORD *v125;
  uint64_t v126;
  void (**v127)(char *, uint64_t, uint64_t);
  uint64_t v128;
  uint64_t v129;
  char *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  id aBlock[8];

  v125 = a3;
  v130 = a1;
  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v128 = sub_21776B790(&qword_254F03378);
  v4 = *(_QWORD *)(v128 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v128);
  v123 = (char *)v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_2178482F8();
  v119 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v7 = (char *)v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21776B790((uint64_t *)&unk_253F25C80);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_217847D64();
  v127 = *(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v122 = (char *)v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v124 = (char *)v114 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v126 = (uint64_t)v114 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v114 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (void (**)(char *, uint64_t, uint64_t))((char *)v114 - v22);
  MEMORY[0x24BDAC7A8](v21);
  v121 = (char *)v114 - v24;
  v129 = swift_allocObject();
  *(_BYTE *)(v129 + 16) = 0;
  v131 = *(id *)(a2 + 136);
  v132 = a2;
  v25 = objc_msgSend(v131, sel_persistentStoreCoordinator);
  v26 = objc_msgSend(v25, sel_persistentStores);

  sub_217787748(0, (unint64_t *)&unk_253F26E38);
  v27 = sub_2178480DC();

  if (!(v27 >> 62))
  {
    if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_23:
    v117 = (void (**)(char *, char *, uint64_t))v4;
    swift_bridgeObjectRelease();
    v46 = v132;
    v54 = (_QWORD *)(v132 + 144);
    v4 = v126;
    sub_21782FB6C((_QWORD *)(v132 + 144), v126);
    v23 = v127;
LABEL_24:
    v66 = (void *)*sub_21776E3A4(v54, *(_QWORD *)(v46 + 168));
    LOBYTE(aBlock[0]) = 0;
    sub_217847CC8();
    v67 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
    v68 = objc_msgSend(v66, sel_fileExistsAtPath_isDirectory_, v67, aBlock);

    if (v68)
    {
      sub_2177A982C(v4, v66);
      if (qword_253F25D98 != -1)
        swift_once();
      v84 = sub_217847ED8();
      sub_21776F584(v84, (uint64_t)qword_253F28DC8);
      v85 = v122;
      v23[2](v122, v4, v11);
      v86 = sub_217847EC0();
      v87 = sub_2178482B0();
      if (os_log_type_enabled(v86, v87))
      {
        v88 = (uint8_t *)swift_slowAlloc();
        v89 = (void *)swift_slowAlloc();
        v115 = v5;
        v90 = v89;
        aBlock[0] = v89;
        *(_DWORD *)v88 = 136315138;
        sub_21776DD28(&qword_253F25C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v91 = sub_2178488A4();
        v133 = sub_2177D06AC(v91, v92, (uint64_t *)aBlock);
        v4 = v126;
        sub_2178484E4();
        swift_bridgeObjectRelease();
        v78 = v127[1];
        ((void (*)(char *, uint64_t))v78)(v122, v11);
        _os_log_impl(&dword_217765000, v86, v87, "Deleted sync directory at %s", v88, 0xCu);
        swift_arrayDestroy();
        v93 = v90;
        v5 = v115;
        MEMORY[0x219A13268](v93, -1, -1);
        MEMORY[0x219A13268](v88, -1, -1);
      }
      else
      {
        v78 = v23[1];
        ((void (*)(char *, uint64_t))v78)(v85, v11);
      }

      v80 = v132;
      goto LABEL_37;
    }
    v125 = v54;
    if (qword_253F25D98 == -1)
    {
LABEL_27:
      v69 = sub_217847ED8();
      sub_21776F584(v69, (uint64_t)qword_253F28DC8);
      v70 = v124;
      v23[2](v124, v4, v11);
      v71 = sub_217847EC0();
      v72 = sub_2178482B0();
      if (os_log_type_enabled(v71, v72))
      {
        v73 = (uint8_t *)swift_slowAlloc();
        v74 = (void *)swift_slowAlloc();
        v115 = v5;
        v75 = v74;
        aBlock[0] = v74;
        *(_DWORD *)v73 = 136315138;
        sub_21776DD28(&qword_253F25C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v76 = sub_2178488A4();
        v133 = sub_2177D06AC(v76, v77, (uint64_t *)aBlock);
        v4 = v126;
        sub_2178484E4();
        swift_bridgeObjectRelease();
        v78 = v127[1];
        ((void (*)(char *, uint64_t))v78)(v70, v11);
        _os_log_impl(&dword_217765000, v71, v72, "Failed to delete sync directory at %s", v73, 0xCu);
        swift_arrayDestroy();
        v79 = v75;
        v5 = v115;
        MEMORY[0x219A13268](v79, -1, -1);
        MEMORY[0x219A13268](v73, -1, -1);
      }
      else
      {
        v78 = v23[1];
        ((void (*)(char *, uint64_t))v78)(v70, v11);
      }

      v80 = v132;
      sub_217847F98();
      v81 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v82 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      v83 = objc_msgSend(v81, sel_initWithDomain_code_userInfo_, v82, 7, 0);

      sub_2177B9F34(0x11u, v83, 0xD000000000000052, 0x8000000217855520);
      v54 = v125;
LABEL_37:
      v94 = (void *)*sub_21776E3A4(v54, *(_QWORD *)(v80 + 168));
      LOBYTE(aBlock[0]) = 0;
      sub_217847CC8();
      v95 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      v96 = objc_msgSend(v94, sel_fileExistsAtPath_isDirectory_, v95, aBlock);

      if (!v96 || !LOBYTE(aBlock[0]))
        sub_2177A99CC(v4, 1, v94);
      v107 = v117;
      v108 = v123;
      v109 = v128;
      v117[2](v123, v130, v128);
      v110 = (*((unsigned __int8 *)v107 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v107 + 80);
      v111 = (char *)swift_allocObject();
      v107[4](&v111[v110], v108, v109);
      *(_QWORD *)&v111[(v5 + v110 + 7) & 0xFFFFFFFFFFFFFFF8] = v129;
      aBlock[4] = sub_217839C68;
      aBlock[5] = v111;
      aBlock[0] = (id)MEMORY[0x24BDAC760];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_217831228;
      aBlock[3] = &unk_24D80F9F8;
      v112 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v131, sel_loadPersistentStoresWithCompletionHandler_, v112);
      _Block_release(v112);
      ((void (*)(uint64_t, uint64_t))v78)(v4, v11);
      return swift_release();
    }
LABEL_50:
    swift_once();
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  v65 = sub_217848748();
  swift_bridgeObjectRelease();
  if (!v65)
    goto LABEL_23;
LABEL_3:
  v118 = v11;
  if ((v27 & 0xC000000000000001) != 0)
  {
    v28 = (id)MEMORY[0x219A127D0](0, v27);
  }
  else
  {
    if (!*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_50;
    }
    v28 = *(id *)(v27 + 32);
  }
  v29 = v28;
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v131, sel_persistentStoreCoordinator);
  aBlock[0] = 0;
  v31 = objc_msgSend(v30, sel_removePersistentStore_error_, v29, aBlock);

  if (v31)
  {
    v32 = qword_253F25D98;
    v33 = aBlock[0];
    if (v32 != -1)
      swift_once();
    v34 = sub_217847ED8();
    v114[1] = sub_21776F584(v34, (uint64_t)qword_253F28DC8);
    v35 = sub_217847EC0();
    v36 = sub_2178482B0();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v117 = (void (**)(char *, char *, uint64_t))v10;
      v38 = v7;
      v39 = v29;
      v40 = v5;
      v41 = v20;
      v42 = v4;
      v43 = v37;
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_217765000, v35, v36, "Removed store from store coordinator", v37, 2u);
      v44 = v43;
      v4 = v42;
      v20 = v41;
      v5 = v40;
      v29 = v39;
      v7 = v38;
      v10 = (char *)v117;
      MEMORY[0x219A13268](v44, -1, -1);
    }

    v116 = v29;
    v45 = objc_msgSend(v29, sel_URL);
    v46 = v132;
    if (v45)
    {
      v47 = v45;
      sub_217847D34();

      v48 = v127[4];
      v49 = v23;
      v23 = v127;
      v11 = v118;
      v48(v10, (uint64_t)v49, v118);
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v23[7])(v10, 0, 1, v11);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v23[6])(v10, 1, v11) != 1)
      {
        v114[0] = v20;
        v50 = v121;
        v48(v121, (uint64_t)v10, v11);
        v51 = objc_msgSend(v131, sel_persistentStoreCoordinator);
        sub_2178482EC();
        sub_21784840C();
        v115 = v5;
        v117 = (void (**)(char *, char *, uint64_t))v4;
        (*(void (**)(char *, uint64_t))(v119 + 8))(v7, v120);

        v55 = v114[0];
        v23[2]((char *)v114[0], (uint64_t)v50, v11);
        v56 = sub_217847EC0();
        v57 = sub_2178482B0();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc();
          v59 = (void *)swift_slowAlloc();
          aBlock[0] = v59;
          *(_DWORD *)v58 = 136315138;
          v120 = (uint64_t)(v58 + 4);
          sub_21776DD28(&qword_253F25C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v60 = sub_2178488A4();
          v133 = sub_2177D06AC(v60, v61, (uint64_t *)aBlock);
          sub_2178484E4();
          swift_bridgeObjectRelease();
          v62 = v127[1];
          ((void (*)(uint64_t, uint64_t))v62)(v55, v11);
          _os_log_impl(&dword_217765000, v56, v57, "Deleted store at: %s", v58, 0xCu);
          swift_arrayDestroy();
          v63 = v59;
          v23 = v127;
          MEMORY[0x219A13268](v63, -1, -1);
          MEMORY[0x219A13268](v58, -1, -1);

          ((void (*)(char *, uint64_t))v62)(v121, v11);
        }
        else
        {

          v64 = v23[1];
          ((void (*)(uint64_t, uint64_t))v64)(v55, v11);
          ((void (*)(char *, uint64_t))v64)(v50, v11);
        }
        v5 = v115;
        goto LABEL_17;
      }
    }
    else
    {
      v23 = v127;
      v11 = v118;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v127[7])(v10, 1, 1, v118);
    }
    v117 = (void (**)(char *, char *, uint64_t))v4;

    sub_21776F518((uint64_t)v10, (uint64_t *)&unk_253F25C80);
LABEL_17:
    v4 = v126;
    v54 = (_QWORD *)(v46 + 144);
    sub_21782FB6C((_QWORD *)(v46 + 144), v126);
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v52 = aBlock[0];
  v53 = (void *)sub_217847CBC();

  swift_willThrow();
  if (qword_253F25D98 != -1)
    swift_once();
  v97 = sub_217847ED8();
  sub_21776F584(v97, (uint64_t)qword_253F28DC8);
  v98 = v53;
  v99 = v53;
  swift_bridgeObjectRetain();
  v100 = sub_217847EC0();
  v101 = sub_217848298();
  if (os_log_type_enabled(v100, v101))
  {
    v102 = swift_slowAlloc();
    v103 = (_QWORD *)swift_slowAlloc();
    v104 = (void *)swift_slowAlloc();
    aBlock[0] = v104;
    *(_DWORD *)v102 = 136315394;
    swift_bridgeObjectRetain();
    v133 = sub_2177D06AC(0xD000000000000028, 0x80000002178554B0, (uint64_t *)aBlock);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v102 + 12) = 2112;
    v105 = v53;
    v106 = _swift_stdlib_bridgeErrorToNSError();
    v133 = v106;
    sub_2178484E4();
    *v103 = v106;

    _os_log_impl(&dword_217765000, v100, v101, "Failed to clear sync store while %s: %@, Sync store db will not be available", (uint8_t *)v102, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v103, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v104, -1, -1);
    MEMORY[0x219A13268](v102, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  sub_2177B9F34(0x14u, v53, 0xD00000000000001BLL, 0x80000002178554E0);
  LOBYTE(aBlock[0]) = *(_BYTE *)(v129 + 16);
  sub_217848178();

  return swift_release();
}

void sub_217832F78(void *a1, id a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  NSObject *v22;
  uint64_t v23;

  v4 = (_BYTE *)(a4 + 16);
  if (a2)
  {
    v6 = a2;
    if (qword_253F25D98 != -1)
      swift_once();
    v7 = sub_217847ED8();
    sub_21776F584(v7, (uint64_t)qword_253F28DC8);
    v8 = a2;
    v9 = a2;
    v10 = sub_217847EC0();
    v11 = sub_217848298();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412290;
      v14 = a2;
      v23 = _swift_stdlib_bridgeErrorToNSError();
      sub_2178484E4();
      *v13 = v23;

      _os_log_impl(&dword_217765000, v10, v11, "Error: Failed to re-create CoreData persistent store after clearing, %@", v12, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v13, -1, -1);
      MEMORY[0x219A13268](v12, -1, -1);
    }
    else
    {

    }
    sub_2177B9F34(0x13u, a2, 0xD00000000000002DLL, 0x8000000217855610);
    swift_beginAccess();
    sub_21776B790(&qword_254F03378);
    sub_217848178();

  }
  else
  {
    swift_beginAccess();
    *v4 = 1;
    if (qword_253F25D98 != -1)
      swift_once();
    v16 = sub_217847ED8();
    sub_21776F584(v16, (uint64_t)qword_253F28DC8);
    v17 = a1;
    v18 = sub_217847EC0();
    v19 = sub_2178482B0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      v22 = v17;
      sub_2178484E4();
      *v21 = v17;

      _os_log_impl(&dword_217765000, v18, v19, "Loaded CoreData persistent store with description: %@", v20, 0xCu);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v21, -1, -1);
      MEMORY[0x219A13268](v20, -1, -1);
    }
    else
    {

      v18 = v17;
    }

    swift_beginAccess();
    sub_21776B790(&qword_254F03378);
    sub_217848178();
  }
}

uint64_t sub_217833354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  v5 = sub_217848364();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2178333B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  __int128 v10;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(void **)(v0 + 32);
  v3 = swift_allocObject();
  v10 = *(_OWORD *)(v0 + 40);
  swift_weakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 88) = v4;
  *(_OWORD *)(v4 + 16) = v10;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  sub_217848154();
  sub_21777F200(&qword_253F25C70);
  sub_2178489AC();
  v5 = *MEMORY[0x24BDBB370];
  v6 = sub_217848364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v1, v5, v6);
  v7 = v2;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v8;
  *v8 = v0;
  v8[1] = sub_217833508;
  return sub_21784837C();
}

uint64_t sub_217833508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21783359C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(v0 + 24);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_2178335E0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_217833614(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t Strong;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v4 = *(id *)(Strong + 128);
    v5 = sub_217848370();
    if (v1)
    {

      if (qword_253F25D98 != -1)
        swift_once();
      v6 = sub_217847ED8();
      sub_21776F584(v6, (uint64_t)qword_253F28DC8);
      v7 = v1;
      v8 = v1;
      v9 = sub_217847EC0();
      v10 = sub_217848298();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        v12 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v11 = 138412290;
        v13 = v1;
        v16 = _swift_stdlib_bridgeErrorToNSError();
        sub_2178484E4();
        *v12 = v16;

        _os_log_impl(&dword_217765000, v9, v10, "Error fetching objects from sync database: %@", v11, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v12, -1, -1);
        MEMORY[0x219A13268](v11, -1, -1);
        swift_release();
      }
      else
      {
        swift_release();

      }
      *(_QWORD *)a1 = v1;
      *(_BYTE *)(a1 + 8) = 1;
    }
    else
    {
      v15 = v5;

      swift_release();
      *(_QWORD *)a1 = v15;
      *(_BYTE *)(a1 + 8) = 0;
    }
  }
  else
  {
    sub_217839954();
    swift_allocError();
    *v14 = 0;
    swift_willThrow();
  }
}

uint64_t sub_217833894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  v6 = sub_217848364();
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2178338FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  __int128 v11;

  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_allocObject();
  v11 = *(_OWORD *)(v0 + 40);
  swift_weakInit();
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 88) = v5;
  *(_QWORD *)(v5 + 16) = v2;
  *(_OWORD *)(v5 + 24) = v11;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 48) = v3;
  sub_217787748(255, &qword_253F26E28);
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  sub_217848154();
  v6 = *MEMORY[0x24BDBB370];
  v7 = sub_217848364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v1, v6, v7);
  v8 = v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v9;
  *v9 = v0;
  v9[1] = sub_217833A80;
  return sub_21784837C();
}

uint64_t sub_217833A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_217833B14()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

void sub_217833B50(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t Strong;
  id v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *TupleTypeMetadata2;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[6];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v10 = *(id *)(Strong + 128);
    v11 = sub_217848370();
    if (v4)
    {
      swift_release();

    }
    else
    {
      v13 = v11;

      v21[0] = v21;
      v21[5] = v13;
      MEMORY[0x24BDAC7A8](v14);
      v20[2] = a1;
      v20[3] = a2;
      v20[4] = a3;
      v15 = sub_217848154();
      sub_217787748(255, &qword_253F26E28);
      swift_getAssociatedTypeWitness();
      TupleTypeMetadata2 = (char *)swift_getTupleTypeMetadata2();
      v17 = MEMORY[0x219A13184](MEMORY[0x24BEE12E0], v15);
      v19 = sub_21782F434((void (*)(char *, char *))sub_217839B80, (uint64_t)v20, v15, TupleTypeMetadata2, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
      swift_bridgeObjectRelease();
      swift_release();
      *a4 = v19;
    }
  }
  else
  {
    sub_217839954();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
  }
}

uint64_t sub_217833D44@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;

  v7 = *a1;
  sub_217787748(255, &qword_253F26E28);
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  *a4 = objc_msgSend(v7, sel_objectID);
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
}

uint64_t sub_217833E20(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_217848364();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217833E80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;

  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[5];
  v4 = (void *)v0[3];
  sub_21776B790((uint64_t *)&unk_253F26FA0);
  v5 = swift_allocObject();
  v6 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v5 + 16) = xmmword_21784AF40;
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 32) = 1684632935;
  *(_QWORD *)(v5 + 40) = 0xE400000000000000;
  v7 = (void *)sub_2178480C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setPropertiesToFetch_, v7);

  objc_msgSend(v4, sel_setReturnsObjectsAsFaults_, 1);
  v8 = swift_allocObject();
  swift_weakInit();
  v9 = swift_allocObject();
  v0[8] = v9;
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDBB370], v3);
  v10 = v4;
  v11 = (_QWORD *)swift_task_alloc();
  v0[9] = v11;
  sub_21776B790(&qword_253F26DB8);
  *v11 = v0;
  v11[1] = sub_217834010;
  return sub_21784837C();
}

uint64_t sub_217834010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2178340A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2178340E0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_217834114(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t Strong;
  void *v4;
  id v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_217839954();
    swift_allocError();
    *v7 = 0;
    swift_willThrow();
    return;
  }
  v4 = *(void **)(Strong + 128);
  type metadata accessor for RemoteRecord();
  v5 = v4;
  v6 = sub_217848370();
  if (v1)
  {
    swift_release();

    return;
  }
  v8 = v6;

  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_7;
LABEL_21:
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_22:
    swift_bridgeObjectRelease_n();
    v22 = sub_217839AA0((uint64_t)v11);
    swift_release();
    swift_bridgeObjectRelease();
    *a1 = v22;
    return;
  }
  swift_bridgeObjectRetain();
  v9 = sub_217848748();
  if (!v9)
    goto LABEL_21;
LABEL_7:
  if (v9 >= 1)
  {
    v10 = 0;
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x219A127D0](v10, v8);
      else
        v12 = *(id *)(v8 + 8 * v10 + 32);
      v13 = v12;
      v14 = objc_msgSend(v12, sel_guid);
      if (v14)
      {
        v15 = v14;
        v16 = sub_217847F98();
        v18 = v17;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v11 = sub_2177C1C18(0, v11[2] + 1, 1, v11);
        v20 = v11[2];
        v19 = v11[3];
        if (v20 >= v19 >> 1)
          v11 = sub_2177C1C18((_QWORD *)(v19 > 1), v20 + 1, 1, v11);
        v11[2] = v20 + 1;
        v21 = &v11[2 * v20];
        v21[4] = v16;
        v21[5] = v18;
      }
      else
      {

      }
      ++v10;
    }
    while (v9 != v10);
    goto LABEL_22;
  }
  __break(1u);
}

uint64_t sub_217834384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = sub_217848364();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2178343EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  __int128 v10;
  __int128 v11;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = swift_allocObject();
  v10 = *(_OWORD *)(v0 + 40);
  v11 = *(_OWORD *)(v0 + 16);
  swift_weakInit();
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 88) = v6;
  *(_OWORD *)(v6 + 16) = v10;
  *(_QWORD *)(v6 + 32) = v5;
  *(_OWORD *)(v6 + 40) = v11;
  *(_QWORD *)(v6 + 56) = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDBB370], v3);
  v7 = (id)v11;
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v8;
  *v8 = v0;
  v8[1] = sub_217834510;
  return sub_21784837C();
}

uint64_t sub_217834510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2178345A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_2178345EC;
  return sub_21783483C();
}

uint64_t sub_2178345EC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_217834638()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21783466C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = Strong;
    v9 = *(id *)(Strong + 128);
    v10 = sub_217848370();
    if (v5)
    {
      swift_release();

    }
    else
    {
      v12 = v10;

      if (MEMORY[0x219A122C0](v12, a5))
      {
        v13 = 4;
        while (1)
        {
          v14 = sub_217848130();
          sub_217848100();
          v15 = (v14 & 1) != 0 ? *(id *)(v12 + 8 * v13) : (id)sub_21784864C();
          v16 = v15;
          v17 = v13 - 3;
          if (__OFADD__(v13 - 4, 1))
            break;
          v18 = *(id *)(v8 + 128);
          a3();

          ++v13;
          if (v17 == MEMORY[0x219A122C0](v12, a5))
            goto LABEL_13;
        }
        __break(1u);
      }
      else
      {
LABEL_13:
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    sub_217839954();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
  }
}

uint64_t sub_21783483C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_217848364();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21783489C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = *(void **)(v0[2] + 128);
  v0[6] = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDBB368], v3);
  v5 = swift_allocObject();
  v0[7] = v5;
  *(_QWORD *)(v5 + 16) = v4;
  v4;
  v6 = (_QWORD *)swift_task_alloc();
  v0[8] = v6;
  *v6 = v0;
  v6[1] = sub_217834960;
  return sub_21784837C();
}

uint64_t sub_217834960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2178349F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = sub_217848364();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217834A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v9;
  __int128 v10;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = swift_allocObject();
  v9 = *(_OWORD *)(v0 + 40);
  v10 = *(_OWORD *)(v0 + 16);
  swift_weakInit();
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 88) = v6;
  *(_OWORD *)(v6 + 16) = v9;
  *(_QWORD *)(v6 + 32) = v5;
  *(_OWORD *)(v6 + 40) = v10;
  *(_QWORD *)(v6 + 56) = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDBB370], v3);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v7;
  *v7 = v0;
  v7[1] = sub_217834B80;
  return sub_21784837C();
}

uint64_t sub_217834B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_217834C14()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_21783A0A8;
  return sub_21783483C();
}

void sub_217834C5C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  _BYTE *v17;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v9 = Strong;
    v10 = swift_bridgeObjectRetain();
    if (MEMORY[0x219A122C0](v10, a5))
    {
      v11 = 4;
      while (1)
      {
        v12 = sub_217848130();
        sub_217848100();
        v13 = (v12 & 1) != 0 ? *(id *)(a2 + 8 * v11) : (id)sub_21784864C();
        v14 = v13;
        v15 = v11 - 3;
        if (__OFADD__(v11 - 4, 1))
          break;
        v16 = *(id *)(v9 + 128);
        a3();
        if (v5)
        {
          swift_bridgeObjectRelease();
          swift_release();

          return;
        }

        ++v11;
        if (v15 == MEMORY[0x219A122C0](a2, a5))
          goto LABEL_11;
      }
      __break(1u);
    }
    else
    {
LABEL_11:
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_217839954();
    swift_allocError();
    *v17 = 0;
    swift_willThrow();
  }
}

uint64_t sub_217834DEC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v5 + 96) = a4;
  *(_QWORD *)(v5 + 104) = v4;
  *(_BYTE *)(v5 + 232) = a2;
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a3;
  v7 = sub_217848364();
  *(_QWORD *)(v5 + 112) = v7;
  *(_QWORD *)(v5 + 120) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 128) = swift_task_alloc();
  v8 = *(_QWORD *)(a3 - 8);
  *(_QWORD *)(v5 + 136) = v8;
  *(_QWORD *)(v5 + 144) = *(_QWORD *)(v8 + 64);
  *(_QWORD *)(v5 + 152) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217834E78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 120);
  v13 = *(_QWORD *)(v0 + 112);
  v14 = *(_QWORD *)(v0 + 128);
  v4 = *(_BYTE *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 160) = v6;
  *(_BYTE *)(v6 + 16) = 1;
  v7 = swift_allocObject();
  v15 = *(_OWORD *)(v0 + 88);
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v2, v5, v15);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v0 + 168) = v9;
  *(_OWORD *)(v9 + 16) = v15;
  *(_QWORD *)(v9 + 32) = v7;
  *(_BYTE *)(v9 + 40) = v4;
  (*(void (**)(unint64_t, uint64_t, _QWORD))(v3 + 32))(v9 + v8, v2, v15);
  *(_QWORD *)(v9 + ((v1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v6;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDBB370], v13);
  swift_retain();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v10;
  sub_217787748(0, &qword_253F26E28);
  *v10 = v0;
  v10[1] = sub_217835034;
  return sub_21784837C();
}

uint64_t sub_217835034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

void sub_2178350C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v1 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 192) = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v1 + 184);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 184) = v4;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v4 + 0x1999999999999998, 1) <= 0x1999999999999998uLL)
    {
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v6;
      *v6 = v0;
      v6[1] = sub_217835204;
      sub_2178362B4();
    }
    else if (__ROR8__(0x8F5C28F5C28F5C29 * v4 + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v7;
      *v7 = v0;
      v7[1] = sub_217835338;
      sub_2178364E4();
    }
    else
    {
      swift_release();
      v5 = *(_QWORD *)(v0 + 192);
      swift_task_dealloc();
      swift_task_dealloc();
      (*(void (**)(uint64_t, _QWORD))(v0 + 8))(v5, 0);
    }
  }
}

uint64_t sub_217835204()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217835268()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  if (__ROR8__(0x8F5C28F5C28F5C29 * *(_QWORD *)(*(_QWORD *)(v0 + 104) + 184) + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v3;
    *v3 = v0;
    v3[1] = sub_217835338;
    return sub_2178364E4();
  }
  else
  {
    swift_release();
    v1 = *(_QWORD *)(v0 + 192);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, 0);
  }
}

uint64_t sub_217835338()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21783539C()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 192);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, 0);
}

uint64_t sub_2178353F0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _DWORD *v9;

  v1 = *(void **)(v0 + 184);
  if (qword_253F25D98 != -1)
    swift_once();
  v2 = sub_217847ED8();
  sub_21776F584(v2, (uint64_t)qword_253F28DC8);
  swift_retain();
  v3 = v1;
  swift_retain();
  v4 = v1;
  v5 = sub_217847EC0();
  v6 = sub_217848298();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 160);
  if (v7)
  {
    v9 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    swift_slowAlloc();
    *v9 = 136315394;
    swift_beginAccess();
    __asm { BR              X11 }
  }
  swift_release_n();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, 1);
}

uint64_t sub_21783574C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _DWORD *v9;

  v1 = *(void **)(v0 + 208);
  if (qword_253F25D98 != -1)
    swift_once();
  v2 = sub_217847ED8();
  sub_21776F584(v2, (uint64_t)qword_253F28DC8);
  swift_retain();
  v3 = v1;
  swift_retain();
  v4 = v1;
  v5 = sub_217847EC0();
  v6 = sub_217848298();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 160);
  if (v7)
  {
    v9 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    swift_slowAlloc();
    *v9 = 136315394;
    swift_beginAccess();
    __asm { BR              X11 }
  }
  swift_release_n();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, 1);
}

uint64_t sub_217835AB0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _DWORD *v9;

  v1 = *(void **)(v0 + 224);
  if (qword_253F25D98 != -1)
    swift_once();
  v2 = sub_217847ED8();
  sub_21776F584(v2, (uint64_t)qword_253F28DC8);
  swift_retain();
  v3 = v1;
  swift_retain();
  v4 = v1;
  v5 = sub_217847EC0();
  v6 = sub_217848298();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 160);
  if (v7)
  {
    v9 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    swift_slowAlloc();
    *v9 = 136315394;
    swift_beginAccess();
    __asm { BR              X11 }
  }
  swift_release_n();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, 1);
}

void sub_217835E14(char a1@<W1>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v12;
  _BYTE *v13;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _BYTE *v20;
  void *v21;
  uint64_t (*v22)(void *, uint64_t, uint64_t);
  id v23;
  void *v24;
  void (*v25)(void *, id, uint64_t, uint64_t, uint64_t);
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void (*v30)(void *, id, uint64_t, uint64_t, uint64_t);
  id v31;
  id v32;
  void *v33;
  uint64_t (*v34)(void *, uint64_t, uint64_t);
  id v35;
  void *v36;
  void (*v37)(void *, id, uint64_t, uint64_t, uint64_t);
  id v38;
  id v39;
  id v40;
  _BYTE *v41;
  _QWORD *v42;
  void *v43;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_217839954();
    swift_allocError();
    *v20 = 0;
    swift_willThrow();
    return;
  }
  v12 = Strong;
  v13 = (_BYTE *)(a2 + 16);
  if ((a1 & 1) == 0)
  {
    swift_beginAccess();
    *v13 = 3;
    v21 = *(void **)(v12 + 120);
    v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(a4 + 32);
    v23 = v21;
    v24 = (void *)v22(v21, a3, a4);

    v42 = a5;
    v25 = *(void (**)(void *, id, uint64_t, uint64_t, uint64_t))(a4 + 40);
    v26 = *(id *)(v12 + 120);
    v25(v24, v26, v12 + 144, a3, a4);

    v27 = objc_msgSend(v24, sel_objectID);
    swift_release();

    *v42 = v27;
    return;
  }
  v41 = v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  objc_msgSend(v16, sel_setFetchLimit_, 1);
  objc_msgSend(v16, sel_setResultType_, 0);
  v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 48))(a3, a4);
  objc_msgSend(v16, sel_setPredicate_, v17);

  v18 = *(id *)(v12 + 120);
  v19 = sub_217848370();
  if (v5)
  {
    swift_release();

    return;
  }
  v28 = (void *)v19;

  v43 = v28;
  v29 = sub_217848154();
  MEMORY[0x219A13184](MEMORY[0x24BEE12E0], v29);
  if ((sub_21784825C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_13:
    swift_beginAccess();
    *v41 = 3;
    v33 = *(void **)(v12 + 120);
    v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(a4 + 32);
    v35 = v33;
    v36 = (void *)v34(v33, a3, a4);

    v37 = *(void (**)(void *, id, uint64_t, uint64_t, uint64_t))(a4 + 40);
    v38 = *(id *)(v12 + 120);
    v37(v36, v38, v12 + 144, a3, a4);

    v39 = v36;
    v40 = objc_msgSend(v39, sel_objectID);
    swift_release();

    *a5 = v40;
    return;
  }
  sub_217848250();
  swift_bridgeObjectRelease();
  if (!v28)
    goto LABEL_13;
  if (((*(uint64_t (**)(void *, uint64_t, uint64_t))(a4 + 56))(v28, a3, a4) & 1) != 0)
  {
    swift_beginAccess();
    *v41 = 2;
    v30 = *(void (**)(void *, id, uint64_t, uint64_t, uint64_t))(a4 + 40);
    v31 = *(id *)(v12 + 120);
    v30(v43, v31, v12 + 144, a3, a4);

    v32 = objc_msgSend(v43, sel_objectID);
    swift_release();

  }
  else
  {
    swift_beginAccess();
    *v41 = 0;
    v32 = objc_msgSend(v28, sel_objectID);
    swift_release();

  }
  *a5 = v32;
}

uint64_t sub_2178362B4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_217848364();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217836314()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = *(void **)(v0[2] + 120);
  v0[6] = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDBB368], v3);
  v5 = swift_allocObject();
  v0[7] = v5;
  *(_QWORD *)(v5 + 16) = v4;
  v4;
  v6 = (_QWORD *)swift_task_alloc();
  v0[8] = v6;
  *v6 = v0;
  v6[1] = sub_2178363D8;
  return sub_21784837C();
}

uint64_t sub_2178363D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21783646C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2178364A8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2178364E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_217848364();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217836544()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = *(void **)(v0[2] + 112);
  v0[6] = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDBB368], v3);
  v5 = swift_allocObject();
  v0[7] = v5;
  *(_QWORD *)(v5 + 16) = v4;
  v4;
  v6 = (_QWORD *)swift_task_alloc();
  v0[8] = v6;
  *v6 = v0;
  v6[1] = sub_217834960;
  return sub_21784837C();
}

id sub_217836608(void *a1)
{
  id result;
  id v3;
  id v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  result = objc_msgSend(a1, sel_hasChanges);
  if ((_DWORD)result)
  {
    v5[0] = 0;
    if (objc_msgSend(a1, sel_save_, v5))
    {
      v3 = v5[0];
      return objc_msgSend(a1, sel_reset);
    }
    else
    {
      v4 = v5[0];
      sub_217847CBC();

      return (id)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_2178366D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1[8] = v0;
  v2 = sub_217847D64();
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v3 = dword_254F02A30;
  v4 = (_QWORD *)swift_task_alloc();
  v1[12] = v4;
  *v4 = v1;
  v4[1] = sub_21783678C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_254F02A30 + v3))(v0, (uint64_t)&off_24D80F788);
}

uint64_t sub_21783678C(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    *(_BYTE *)(v4 + 113) = a1 & 1;
    return swift_task_switch();
  }
}

uint64_t sub_21783685C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;

  if ((*(_BYTE *)(v0 + 113) & 1) == 0)
  {
    v1 = *(void **)(v0 + 104);
    v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    *(_QWORD *)(v0 + 40) = &type metadata for FileManagerProvider;
    *(_QWORD *)(v0 + 48) = &off_24D809DF8;
    *(_QWORD *)(v0 + 16) = v2;
    sub_2177B58A0();
    if (v1)
    {
      _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
      if (qword_253F25D98 != -1)
        swift_once();
      v3 = sub_217847ED8();
      sub_21776F584(v3, (uint64_t)qword_253F28DC8);
      v4 = v1;
      v5 = v1;
      v6 = sub_217847EC0();
      v7 = sub_2178482B0();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v8 = 138412290;
        v10 = v1;
        v11 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 56) = v11;
        sub_2178484E4();
        *v9 = v11;

        _os_log_impl(&dword_217765000, v6, v7, "Failed to clear sync asset store directory, %@", v8, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v9, -1, -1);
        MEMORY[0x219A13268](v8, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 64);
      _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
      v13 = (void *)*sub_21776E3A4((_QWORD *)(v12 + 144), *(_QWORD *)(v12 + 168));
      *(_BYTE *)(v0 + 112) = 0;
      sub_217847CC8();
      v14 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      v15 = objc_msgSend(v13, sel_fileExistsAtPath_isDirectory_, v14, v0 + 112);

      if (v15)
      {
        sub_2177A982C(*(_QWORD *)(v0 + 88), v13);
        if (qword_253F25D98 != -1)
          swift_once();
        v16 = sub_217847ED8();
        sub_21776F584(v16, (uint64_t)qword_253F28DC8);
        v17 = sub_217847EC0();
        v18 = sub_2178482B0();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_217765000, v17, v18, "SyncStore has no more importable records with assets, cleared sync asset store", v19, 2u);
          MEMORY[0x219A13268](v19, -1, -1);
        }

      }
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
    }
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217836C04()
{
  id *v0;
  char *v1;
  uint64_t v2;

  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)(v0 + 18));
  v1 = (char *)v0 + OBJC_IVAR____TtC17MessagesCloudSync9SyncStore_databaseURL;
  v2 = sub_217847D64();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_217836C88()
{
  return type metadata accessor for SyncStore();
}

uint64_t type metadata accessor for SyncStore()
{
  uint64_t result;

  result = qword_253F25CA8;
  if (!qword_253F25CA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_217836CCC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_217847D64();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_217836D78()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21777CB6C;
  return sub_21783129C();
}

uint64_t sub_217836DBC()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  *(_QWORD *)(v1 + 24) = *v0;
  return swift_task_switch();
}

uint64_t sub_217836DDC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_21776DD28(&qword_254F03370, (uint64_t (*)(uint64_t))type metadata accessor for SyncStore, (uint64_t)&unk_2178508B8);
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 16);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *v2 = v0;
  v2[1] = sub_217836EAC;
  return sub_2178488B0();
}

uint64_t sub_217836EAC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217836F0C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 48));
}

uint64_t sub_217836F18()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_21777CB6C;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_217836F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21777DCC4;
  return sub_217833354(a1, a2, a3);
}

uint64_t sub_217836FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2177EFA7C;
  return sub_217833894(a1, a2, a3, a4);
}

uint64_t sub_21783704C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2177EF7B8;
  return sub_217833E20(a1);
}

uint64_t sub_217837098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_21777CB6C;
  return sub_2178349F4(a1, a2, a3, a4, a5);
}

uint64_t sub_217837114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_21777CB6C;
  return sub_217834384(a1, a2, a3, a4, a5);
}

uint64_t sub_217837190(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2177C3230;
  return sub_217834DEC(a1, a2, a3, a4);
}

uint64_t sub_217837204()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21777CB6C;
  return sub_2178362B4();
}

uint64_t sub_217837248()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21777CB6C;
  return sub_2178364E4();
}

uint64_t sub_21783728C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21777AAD0;
  return sub_2178366D0();
}

uint64_t sub_2178372D0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_21784897C();
  swift_bridgeObjectRetain();
  sub_217848004();
  v8 = sub_2178489A0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2178488E0() & 1) != 0)
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
      if (v19 || (sub_2178488E0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_217837F04(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21783747C(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_217848580();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_217787748(0, (unint64_t *)&qword_253F26DC8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_217848574();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_217837718(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_217837BE8();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_217837E84((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_2178484B4();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_217787748(0, (unint64_t *)&qword_253F26DC8);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_2178484C0();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_2178484C0();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_21783809C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_217837718(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    sub_21776B790((uint64_t *)&unk_253F26EB0);
    v2 = sub_2178485EC();
    v14 = v2;
    sub_217848568();
    if (sub_21784858C())
    {
      sub_217787748(0, (unint64_t *)&qword_253F26DC8);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_217837BE8();
          v2 = v14;
        }
        result = sub_2178484B4();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_21784858C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_21783790C()
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
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_21776B790(&qword_254F01D60);
  v3 = sub_2178485E0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
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
      }
      else
      {
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
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_21784897C();
      sub_217848004();
      result = sub_2178489A0();
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
            goto LABEL_38;
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
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_217837BE8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  sub_21776B790((uint64_t *)&unk_253F26EB0);
  v3 = sub_2178485E0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_2178484B4();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_217837E84(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_2178484B4();
  result = sub_21784855C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_217837F04(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21783790C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_217838220();
      goto LABEL_22;
    }
    sub_217838578();
  }
  v11 = *v4;
  sub_21784897C();
  sub_217848004();
  result = sub_2178489A0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2178488E0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_217848910();
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
          result = sub_2178488E0();
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

void sub_21783809C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_217837BE8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2178383D0();
      goto LABEL_14;
    }
    sub_217838824();
  }
  v8 = *v3;
  v9 = sub_2178484B4();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_217787748(0, (unint64_t *)&qword_253F26DC8);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_2178484C0();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_217848910();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_2178484C0();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_217838220()
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
  sub_21776B790(&qword_254F01D60);
  v2 = *v0;
  v3 = sub_2178485D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
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
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
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
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_2178383D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_21776B790((uint64_t *)&unk_253F26EB0);
  v2 = *v0;
  v3 = sub_2178485D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_217838578()
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
  sub_21776B790(&qword_254F01D60);
  v3 = sub_2178485E0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_21784897C();
    swift_bridgeObjectRetain();
    sub_217848004();
    result = sub_2178489A0();
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
          goto LABEL_36;
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
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_217838824()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  sub_21776B790((uint64_t *)&unk_253F26EB0);
  v3 = sub_2178485E0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_2178484B4();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_217838A9C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_217838B04;
  return v5(v2 + 16);
}

uint64_t sub_217838B04()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_217838B54(void *a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3[11] = a3;
  v3[10] = a1;
  v3[12] = *a3;
  v7 = sub_217847D64();
  v3[13] = v7;
  v27 = *(_QWORD *)(v7 - 8);
  v3[14] = swift_task_alloc();
  v26 = swift_task_alloc();
  v3[15] = v26;
  v8 = swift_task_alloc();
  v3[2] = a2;
  v3[16] = v8;
  v3[5] = &type metadata for FileManagerProvider;
  v3[6] = &off_24D809DF8;
  swift_defaultActor_initialize();
  a3[23] = 0;
  *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC17MessagesCloudSync9SyncStore_contextDidSaveToken) = 0;
  a3[17] = a1;
  sub_21776E4FC((uint64_t)(v3 + 2), (uint64_t)(a3 + 18));
  v9 = a1;
  v10 = objc_msgSend(v9, sel_newBackgroundContext);
  a3[14] = v10;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB6A0]), sel_initWithConcurrencyType_, 1);
  v3[17] = v11;
  objc_msgSend(v11, sel_setParentContext_, v10);
  objc_msgSend(v11, sel_setAutomaticallyMergesChangesFromParent_, 1);
  v12 = objc_msgSend((id)objc_opt_self(), sel_errorMergePolicy);
  objc_msgSend(v11, sel_setMergePolicy_, v12);

  objc_msgSend(v11, sel_setUndoManager_, 0);
  a3[15] = v11;
  v13 = v11;
  v14 = objc_msgSend(v9, sel_newBackgroundContext);
  v3[18] = v14;
  objc_msgSend(v14, sel_setAutomaticallyMergesChangesFromParent_, 1);
  objc_msgSend(v14, sel_setUndoManager_, 0);
  a3[16] = v14;
  v15 = v14;
  sub_21782FE44(v3 + 2, v8);
  if (qword_253F25D98 != -1)
    swift_once();
  v16 = sub_217847ED8();
  v3[19] = sub_21776F584(v16, (uint64_t)qword_253F28DC8);
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v25(v26, v8, v7);
  v17 = sub_217847EC0();
  v18 = sub_2178482B0();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v28[0] = v20;
    *(_DWORD *)v19 = 136315138;
    sub_21776DD28(&qword_253F25C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v21 = sub_2178488A4();
    v3[9] = sub_2177D06AC(v21, v22, v28);
    sub_2178484E4();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v23(v26, v7);
    _os_log_impl(&dword_217765000, v17, v18, "Sync Database URL: %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v20, -1, -1);
    MEMORY[0x219A13268](v19, -1, -1);
  }
  else
  {
    v23 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v23(v26, v7);
  }

  v3[20] = v23;
  v25((uint64_t)a3 + OBJC_IVAR____TtC17MessagesCloudSync9SyncStore_databaseURL, v8, v7);
  return swift_task_switch();
}

uint64_t sub_217838F5C()
{
  uint64_t v0;
  id v1;
  unsigned int v2;
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t *v12;
  NSObject *v13;
  os_log_type_t v14;
  BOOL v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureFlags);
  v2 = objc_msgSend(v1, sel_isMessagesIniCloudVersion2);

  if (v2)
  {
    if (qword_253F25DC0 != -1)
      swift_once();
    if ((sub_21784167C(5u, 0) & 1) != 0)
    {
      sub_21782FB6C((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 112));
      v3 = (void *)*sub_21776E3A4((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      *(_BYTE *)(v0 + 184) = 0;
      sub_217847CC8();
      v4 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      v5 = objc_msgSend(v3, sel_fileExistsAtPath_isDirectory_, v4, v0 + 184);

      if (v5)
        sub_2177A982C(*(_QWORD *)(v0 + 112), v3);
      objc_msgSend((id)qword_253F28F00, sel_removeObjectForKey_, *MEMORY[0x24BE50BD8]);
      v13 = sub_217847EC0();
      v14 = sub_2178482B0();
      v15 = os_log_type_enabled(v13, v14);
      v16 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
      v17 = *(_QWORD *)(v0 + 104);
      v18 = *(_QWORD *)(v0 + 112);
      if (v15)
      {
        v30 = *(_QWORD *)(v0 + 112);
        v19 = swift_slowAlloc();
        v20 = swift_slowAlloc();
        v31[0] = v20;
        *(_DWORD *)v19 = 136315394;
        *(_QWORD *)(v0 + 56) = sub_2177D06AC(0, 0xE000000000000000, v31);
        sub_2178484E4();
        *(_WORD *)(v19 + 12) = 2080;
        *(_QWORD *)(v0 + 64) = sub_2177D06AC(0xD000000000000010, 0x80000002178556B0, v31);
        sub_2178484E4();
        _os_log_impl(&dword_217765000, v13, v14, "Cleared sync store (%s%s)", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v20, -1, -1);
        MEMORY[0x219A13268](v19, -1, -1);

        v16(v30, v17);
      }
      else
      {

        v16(v18, v17);
      }
    }
    sub_217830024((_QWORD *)(v0 + 16));
    v22 = *(void **)(v0 + 80);
    v23 = objc_allocWithZone(MEMORY[0x24BDBB740]);
    v24 = (void *)sub_217847CF8();
    v25 = objc_msgSend(v23, sel_initWithURL_, v24);
    *(_QWORD *)(v0 + 168) = v25;

    objc_msgSend(v25, sel_setType_, *MEMORY[0x24BDBB580]);
    objc_msgSend(v25, sel_setShouldMigrateStoreAutomatically_, 1);
    objc_msgSend(v25, sel_setShouldInferMappingModelAutomatically_, 1);
    sub_217847F98();
    v26 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_setOption_forKey_, v26, *MEMORY[0x24BDBB4F8]);

    objc_msgSend(v25, sel_setShouldAddStoreAsynchronously_, 1);
    sub_21776B790((uint64_t *)&unk_253F25E30);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_21784DDD0;
    *(_QWORD *)(v27 + 32) = v25;
    v31[0] = v27;
    sub_2178480F4();
    sub_217787748(0, (unint64_t *)&unk_253F25DF0);
    v28 = v25;
    v29 = (void *)sub_2178480C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_setPersistentStoreDescriptions_, v29);

    return swift_task_switch();
  }
  else
  {
    v6 = sub_217847EC0();
    v7 = sub_2178482B0();
    v8 = os_log_type_enabled(v6, (os_log_type_t)v7);
    v9 = *(void **)(v0 + 136);
    v10 = *(void **)(v0 + 144);
    v11 = *(void **)(v0 + 80);
    if (v8)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_217765000, v6, (os_log_type_t)v7, "MiC2 not enabled, not performing sync store init", v12, 2u);
      MEMORY[0x219A13268](v12, -1, -1);
    }

    (*(void (**)(_QWORD, _QWORD))(v0 + 160))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
    _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
  }
}

uint64_t sub_2178395FC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_21776DD28(&qword_254F03370, (uint64_t (*)(uint64_t))type metadata accessor for SyncStore, (uint64_t)&unk_2178508B8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_2178396D4;
  return sub_2178488B0();
}

uint64_t sub_2178396D4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_217839758()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 168);
  v3 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 144);

  (*(void (**)(_QWORD, _QWORD))(v0 + 160))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

uint64_t sub_217839814()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_217839838()
{
  uint64_t v0;

  return sub_217836608(*(void **)(v0 + 16));
}

uint64_t sub_217839850()
{
  return swift_deallocObject();
}

uint64_t sub_217839860()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_217839884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

void sub_21783990C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  sub_217835E14(*(_BYTE *)(v1 + 40), *(_QWORD *)(v1+ ((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64)+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80))+ 7) & 0xFFFFFFFFFFFFF8)), v2, *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_217839954()
{
  unint64_t result;

  result = qword_254F03330;
  if (!qword_254F03330)
  {
    result = MEMORY[0x219A13184](&unk_217850960, &type metadata for SyncStore.ExecutionErrors);
    atomic_store(result, &qword_254F03330);
  }
  return result;
}

uint64_t sub_217839998()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2178399CC()
{
  return sub_217839A38((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21783466C);
}

uint64_t sub_2178399E8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_217839A1C()
{
  return sub_217839A38((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_217834C5C);
}

uint64_t sub_217839A38(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[4], v1[5], v1[6], v1[7], v1[2], v1[3]);
}

uint64_t sub_217839A5C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_217839A88(uint64_t *a1@<X8>)
{
  sub_217834114(a1);
}

uint64_t sub_217839AA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_217848214();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2178372D0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_217839B34()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_217839B60(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  sub_217833B50(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_217839B80@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_217833D44(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_217839BA0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_217839BCC(uint64_t a1@<X8>)
{
  sub_217833614(a1);
}

uint64_t sub_217839BE8(char *a1)
{
  uint64_t v1;

  return sub_217831E94(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24));
}

uint64_t sub_217839BF0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21776B790(&qword_254F03378);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_217839C68(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_21776B790(&qword_254F03378) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_217832F78(a1, a2, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_217839CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_217839CDC()
{
  return swift_release();
}

void sub_217839CE4(uint64_t a1)
{
  sub_21783179C(a1);
}

uint64_t sub_217839CEC()
{
  return sub_217839E74(&qword_253F26D30);
}

uint64_t sub_217839CF8(void *a1, void *a2)
{
  sub_21776B790(&qword_253F26D30);
  return sub_217831AF4(a1, a2);
}

uint64_t sub_217839D48()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_217839D6C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21777AAD0;
  v3[7] = a1;
  return swift_task_switch();
}

uint64_t sub_217839DCC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_217839DF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21777AAD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254F03398 + dword_254F03398))(a1, v4);
}

uint64_t sub_217839E60(uint64_t a1)
{
  uint64_t *v1;

  return sub_217830418(a1, v1);
}

uint64_t sub_217839E68()
{
  return sub_217839E74(&qword_253F25BC0);
}

uint64_t sub_217839E74(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = sub_21776B790(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_217839ED0()
{
  sub_21776B790(&qword_253F25BC0);
  return sub_217848178();
}

uint64_t sub_217839F10()
{
  uint64_t v0;

  swift_release();
  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 32);

  return swift_deallocObject();
}

uint64_t sub_217839F44(void *a1, void *a2)
{
  uint64_t v2;

  return sub_2178305AC(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(_QWORD *)(v2 + 24), (_QWORD *)(v2 + 32), *(NSObject **)(v2 + 72));
}

uint64_t storeEnumTagSinglePayload for SyncStore.ExecutionErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_217839FA0 + 4 * byte_217850814[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_217839FD4 + 4 * byte_21785080F[v4]))();
}

uint64_t sub_217839FD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217839FDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217839FE4);
  return result;
}

uint64_t sub_217839FF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217839FF8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_217839FFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783A004(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncStore.ExecutionErrors()
{
  return &type metadata for SyncStore.ExecutionErrors;
}

unint64_t sub_21783A024()
{
  unint64_t result;

  result = qword_254F033B0;
  if (!qword_254F033B0)
  {
    result = MEMORY[0x219A13184](&unk_217850938, &type metadata for SyncStore.ExecutionErrors);
    atomic_store(result, (unint64_t *)&qword_254F033B0);
  }
  return result;
}

id sub_21783A068()
{
  return sub_217839838();
}

uint64_t storeEnumTagSinglePayload for SyncNotification(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 21 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 21) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEA)
    return ((uint64_t (*)(void))((char *)&loc_21783A0F8 + 4 * byte_2178509A5[v4]))();
  *a1 = a2 + 21;
  return ((uint64_t (*)(void))((char *)sub_21783A12C + 4 * byte_2178509A0[v4]))();
}

uint64_t sub_21783A12C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783A134(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21783A13CLL);
  return result;
}

uint64_t sub_21783A148(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21783A150);
  *(_BYTE *)result = a2 + 21;
  return result;
}

uint64_t sub_21783A154(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783A15C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncNotification()
{
  return &type metadata for SyncNotification;
}

void sub_21783A178(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t inited;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v8 = sub_217847BB4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (((1 << a4) & 0x105577) == 0)
  {
    if (((1 << a4) & 0xFAA88) != 0)
    {
      sub_21776B790(&qword_253F25C60);
      inited = swift_initStackObject();
      v31 = xmmword_21784AF40;
      *(_OWORD *)(inited + 16) = xmmword_21784AF40;
      *(_QWORD *)(inited + 32) = a1;
      *(_QWORD *)(inited + 40) = a2;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1768];
      *(_QWORD *)(inited + 48) = a3;
      swift_bridgeObjectRetain();
      v21 = sub_2177F3220(inited);
      if (IMIsRunningInAutomation())
      {
        v22 = swift_initStackObject();
        *(_OWORD *)(v22 + 16) = v31;
        *(_QWORD *)(v22 + 32) = 17481;
        *(_QWORD *)(v22 + 40) = 0xE200000000000000;
        v23 = sub_21783A668(a4);
        *(_QWORD *)(v22 + 72) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v22 + 48) = v23;
        *(_QWORD *)(v22 + 56) = v24;
        swift_bridgeObjectRetain();
        v25 = sub_2177F3220(v22);
        v17 = sub_21783A814(v25, v21);
        v18 = (void *)sub_217847F74();
        v19 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
        goto LABEL_7;
      }
      v26 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      sub_21783A668(a4);
    }
    else
    {
      v28 = sub_2177F3220(MEMORY[0x24BEE4AF8]);
      if (IMIsRunningInAutomation())
      {
        sub_21776B790(&qword_253F25C60);
        v29 = swift_initStackObject();
        *(_OWORD *)(v29 + 16) = xmmword_21784AF40;
        *(_QWORD *)(v29 + 32) = 17481;
        *(_QWORD *)(v29 + 40) = 0xE200000000000000;
        *(_QWORD *)(v29 + 72) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v29 + 48) = 0xD000000000000010;
        *(_QWORD *)(v29 + 56) = 0x8000000217851DB0;
        swift_bridgeObjectRetain();
        v30 = sub_2177F3220(v29);
        v17 = sub_21783A814(v30, v28);
        v18 = (void *)sub_217847F74();
        v19 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
        goto LABEL_7;
      }
      v26 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    }
    sub_217847F74();
    swift_bridgeObjectRelease();
    v32 = 0u;
    v33 = 0u;
LABEL_11:
    sub_217847BA8();
    v27 = (void *)sub_217847B9C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    objc_msgSend(v26, sel_postNotification_, v27);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v12 = sub_2177F3220(MEMORY[0x24BEE4AF8]);
  if (!IMIsRunningInAutomation())
  {
    v26 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    sub_21783A668(a4);
    sub_217847F74();
    swift_bridgeObjectRelease();
    v32 = 0u;
    v33 = 0u;
    goto LABEL_11;
  }
  sub_21776B790(&qword_253F25C60);
  v13 = swift_initStackObject();
  *(_OWORD *)(v13 + 16) = xmmword_21784AF40;
  *(_QWORD *)(v13 + 32) = 17481;
  *(_QWORD *)(v13 + 40) = 0xE200000000000000;
  v14 = sub_21783A668(a4);
  *(_QWORD *)(v13 + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v13 + 48) = v14;
  *(_QWORD *)(v13 + 56) = v15;
  swift_bridgeObjectRetain();
  v16 = sub_2177F3220(v13);
  v17 = sub_21783A814(v16, v12);
  v18 = (void *)sub_217847F74();
  v19 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
LABEL_7:
  v26 = v19;
  sub_217820838(v17);
  swift_bridgeObjectRelease();
  v27 = (void *)sub_217847F20();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_postNotificationName_object_userInfo_options_, v18, 0, v27, 0);
  swift_bridgeObjectRelease();

LABEL_12:
}

uint64_t sub_21783A668(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21783A6A4 + 4 * byte_2178509AA[a1]))(0xD000000000000010, 0x8000000217851B40);
}

uint64_t sub_21783A6A4()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_21783A814(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_21783AAF0(a1, (uint64_t)sub_21783AAB0, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21783A890(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_21783A668(*a1);
  v5 = v4;
  if (v3 == sub_21783A668(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_2178488E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21783A918()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21784897C();
  sub_21783A668(v1);
  sub_217848004();
  swift_bridgeObjectRelease();
  return sub_2178489A0();
}

uint64_t sub_21783A978()
{
  unsigned __int8 *v0;

  sub_21783A668(*v0);
  sub_217848004();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21783A9B8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21784897C();
  sub_21783A668(v1);
  sub_217848004();
  swift_bridgeObjectRelease();
  return sub_2178489A0();
}

uint64_t sub_21783AA14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21783AF24();
  *a1 = result;
  return result;
}

uint64_t sub_21783AA40@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21783A668(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_21783AA6C()
{
  unint64_t result;

  result = qword_254F033B8;
  if (!qword_254F033B8)
  {
    result = MEMORY[0x219A13184](&unk_217850A4C, &type metadata for SyncNotification);
    atomic_store(result, (unint64_t *)&qword_254F033B8);
  }
  return result;
}

uint64_t sub_21783AAB0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_21776F4DC((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21783AAF0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
  _BYTE v31[32];
  _OWORD v32[2];
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v36 = a1;
  v37 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v38 = v8;
  v39 = 0;
  v40 = v11 & v9;
  v41 = a2;
  v42 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21783AD50(&v34);
  v12 = *((_QWORD *)&v34 + 1);
  if (!*((_QWORD *)&v34 + 1))
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    sub_21778857C();
    return swift_release();
  }
  while (1)
  {
    v15 = v34;
    sub_21776F574(&v35, v33);
    v16 = *a5;
    v18 = sub_2177D0D64(v15, v12);
    v19 = *(_QWORD *)(v16 + 16);
    v20 = (v17 & 1) == 0;
    v21 = v19 + v20;
    if (__OFADD__(v19, v20))
      break;
    v22 = v17;
    if (*(_QWORD *)(v16 + 24) >= v21)
    {
      if ((a4 & 1) != 0)
      {
        if ((v17 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        sub_2178271E0();
        if ((v22 & 1) != 0)
          goto LABEL_6;
      }
    }
    else
    {
      sub_21781201C(v21, a4 & 1);
      v23 = sub_2177D0D64(v15, v12);
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_22;
      v18 = v23;
      if ((v22 & 1) != 0)
      {
LABEL_6:
        v13 = 32 * v18;
        sub_21776F4DC(*(_QWORD *)(*a5 + 56) + v13, (uint64_t)v31);
        sub_21776F4DC((uint64_t)v31, (uint64_t)v32);
        _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v31);
        _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v33);
        swift_bridgeObjectRelease();
        v14 = (_OWORD *)(*(_QWORD *)(*a5 + 56) + v13);
        _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)v14);
        sub_21776F574(v32, v14);
        goto LABEL_7;
      }
    }
    v25 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v18 >> 6) + 64) |= 1 << v18;
    v26 = (uint64_t *)(v25[6] + 16 * v18);
    *v26 = v15;
    v26[1] = v12;
    sub_21776F574(v33, (_OWORD *)(v25[7] + 32 * v18));
    v27 = v25[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_21;
    v25[2] = v29;
LABEL_7:
    sub_21783AD50(&v34);
    v12 = *((_QWORD *)&v34 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v34 + 1))
      goto LABEL_19;
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  result = sub_21784891C();
  __break(1u);
  return result;
}

uint64_t sub_21783AD50@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_21776F4DC(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v15 != v18)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_21783AF74((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_21783AFBC((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_21783AF24()
{
  unint64_t v0;

  v0 = sub_2178488EC();
  swift_bridgeObjectRelease();
  if (v0 >= 0x16)
    return 22;
  else
    return v0;
}

uint64_t sub_21783AF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21776B790(&qword_254F033C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21783AFBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21776B790(qword_254F033C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21783AFFC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_254F033E0 + dword_254F033E0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2177A3F0C;
  return v3();
}

uint64_t sub_21783B054()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[19] = v0;
  sub_21776B790(&qword_254F033E8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v2 = type metadata accessor for RecoverableMessageRecord();
  v1[22] = v2;
  v1[23] = *(_QWORD *)(v2 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  sub_21776B790((uint64_t *)&unk_253F259D0);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v3 = sub_217847E3C();
  v1[31] = v3;
  v1[32] = *(_QWORD *)(v3 - 8);
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21783B194()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  void *v90;
  uint64_t v91;
  id v92;
  id v93;
  NSObject *v94;
  os_log_type_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  os_log_t log;
  os_log_type_t v100;
  _QWORD *v101;
  os_log_type_t type[8];
  uint64_t typea;
  os_log_type_t typeb;
  os_log_type_t v105;
  uint64_t v106;
  _QWORD *v107;
  void *v108;
  id v109;
  uint64_t v110[2];

  v1 = *(uint64_t **)(v0 + 152);
  v2 = *v1;
  *(_QWORD *)(v0 + 288) = *v1;
  v3 = v1[1];
  *(_QWORD *)(v0 + 296) = v3;
  if (!v3)
    goto LABEL_4;
  v4 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 256);
  v6 = *(_QWORD *)(v0 + 240);
  sub_2177FD53C((uint64_t)v1 + *(int *)(*(_QWORD *)(v0 + 176) + 52), v6, (uint64_t *)&unk_253F259D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
  {
    sub_21776F518(*(_QWORD *)(v0 + 240), (uint64_t *)&unk_253F259D0);
LABEL_4:
    if (qword_253F26CA0 != -1)
      swift_once();
    v7 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 200);
    v9 = *(_QWORD *)(v0 + 152);
    v10 = sub_217847ED8();
    sub_21776F584(v10, (uint64_t)qword_253F28FE8);
    sub_2177AB858(v9, v8);
    sub_2177AB858(v9, v7);
    v11 = sub_217847EC0();
    v12 = sub_217848298();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 200);
    if (v13)
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v110[0] = v16;
      *(_DWORD *)v15 = 136315394;
      v17 = *(_QWORD *)(v14 + 8);
      *(_QWORD *)type = v11;
      v100 = v12;
      log = (os_log_t)v16;
      if (v17)
      {
        *(_QWORD *)(v0 + 80) = **(_QWORD **)(v0 + 200);
        *(_QWORD *)(v0 + 88) = v17;
        swift_bridgeObjectRetain();
        v18 = sub_217847FE0();
        v20 = v19;
      }
      else
      {
        v20 = 0xE300000000000000;
        v18 = 7104878;
      }
      v34 = *(_QWORD *)(v0 + 248);
      v33 = *(_QWORD *)(v0 + 256);
      v35 = *(_QWORD *)(v0 + 232);
      v36 = *(_QWORD *)(v0 + 192);
      v37 = *(_QWORD *)(v0 + 200);
      v38 = *(_QWORD *)(v0 + 176);
      *(_QWORD *)(v0 + 112) = sub_2177D06AC(v18, v20, v110);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      sub_2177AB89C(v37);
      *(_WORD *)(v15 + 12) = 2080;
      sub_2177FD53C(v36 + *(int *)(v38 + 52), v35, (uint64_t *)&unk_253F259D0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v35, 1, v34) == 1)
      {
        sub_21776F518(*(_QWORD *)(v0 + 232), (uint64_t *)&unk_253F259D0);
        v39 = 0xE300000000000000;
        v40 = *(NSObject **)type;
        v41 = v100;
        v42 = log;
        v43 = 7104878;
      }
      else
      {
        v44 = *(_QWORD *)(v0 + 264);
        v45 = *(_QWORD *)(v0 + 272);
        v47 = *(_QWORD *)(v0 + 248);
        v46 = *(_QWORD *)(v0 + 256);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v46 + 32))(v45, *(_QWORD *)(v0 + 232), v47);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v44, v45, v47);
        v43 = sub_217847FE0();
        v39 = v48;
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
        v40 = *(NSObject **)type;
        v41 = v100;
        v42 = log;
      }
      v49 = *(_QWORD *)(v0 + 192);
      *(_QWORD *)(v0 + 104) = sub_2177D06AC(v43, v39, v110);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      sub_2177AB89C(v49);
      _os_log_impl(&dword_217765000, v40, v41, "Failed reading recoverable message record, guid: %s, deleteDate: %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v42, -1, -1);
      MEMORY[0x219A13268](v15, -1, -1);

    }
    else
    {
      v21 = *(_QWORD *)(v0 + 192);
      sub_2177AB89C(*(_QWORD *)(v0 + 200));
      sub_2177AB89C(v21);

    }
    sub_21783C178();
    swift_allocError();
    *v50 = 0;
    swift_willThrow();
    goto LABEL_46;
  }
  v22 = *(_QWORD *)(v0 + 176);
  v23 = *(_QWORD *)(v0 + 152);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 32))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 248));
  v24 = (uint64_t *)(v23 + *(int *)(v22 + 56));
  v25 = *v24;
  *(_QWORD *)(v0 + 304) = *v24;
  v26 = v24[1];
  *(_QWORD *)(v0 + 312) = v26;
  if (v26 >> 60 == 15)
  {
    v27 = qword_253F28DB8;
    *(_QWORD *)(v0 + 352) = qword_253F28DB8;
    if (!v27)
    {
      sub_217788584();
      v51 = (void *)swift_allocError();
      swift_willThrow();
      if (qword_253F26CA0 != -1)
        swift_once();
      v52 = sub_217847ED8();
      sub_21776F584(v52, (uint64_t)qword_253F28FE8);
      v53 = v51;
      v54 = v51;
      v55 = sub_217847EC0();
      v56 = sub_217848298();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc();
        v107 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v57 = 138412290;
        v58 = v51;
        v59 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 96) = v59;
        sub_2178484E4();
        *v107 = v59;

        _os_log_impl(&dword_217765000, v55, v56, "Error encountered moving recoverable message %@", v57, 0xCu);
        sub_21776B790((uint64_t *)&unk_253F25E10);
        swift_arrayDestroy();
        MEMORY[0x219A13268](v107, -1, -1);
        MEMORY[0x219A13268](v57, -1, -1);
      }
      else
      {

      }
      v79 = *(_QWORD *)(v0 + 280);
      v80 = *(_QWORD *)(v0 + 248);
      v81 = *(_QWORD *)(v0 + 256);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v79, v80);
      goto LABEL_46;
    }
    v28 = qword_253F28DC0;
    *(_QWORD *)(v0 + 360) = qword_253F28DC0;
    sub_21776B790((uint64_t *)&unk_253F25C50);
    v29 = swift_allocObject();
    *(_QWORD *)(v0 + 368) = v29;
    *(_OWORD *)(v29 + 16) = xmmword_21784AF40;
    *(_QWORD *)(v29 + 32) = v2;
    *(_QWORD *)(v29 + 40) = v3;
    *(_QWORD *)(v0 + 376) = *(_QWORD *)(v28 + 224);
    v30 = qword_253F25B38;
    swift_bridgeObjectRetain();
    if (v30 == -1)
    {
LABEL_31:
      sub_21784819C();
      sub_217848160();
      return swift_task_switch();
    }
LABEL_53:
    swift_once();
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  sub_21776ED9C(v25, v26);
  v31 = (void *)sub_217847D94();
  v32 = (id)JWDecodeCodableObjectWithStandardAllowlist();

  if (v32)
  {
    sub_217848538();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  v60 = v0;
  sub_217787700(v0 + 16, v0 + 48);
  if (!*(_QWORD *)(v0 + 72))
  {
    swift_bridgeObjectRelease();
    sub_21776F518(v0 + 48, qword_253F25E40);
LABEL_34:
    if (qword_253F26CA0 != -1)
      swift_once();
    v65 = *(_QWORD *)(v60 + 224);
    v66 = *(_QWORD *)(v60 + 152);
    v67 = sub_217847ED8();
    sub_21776F584(v67, (uint64_t)qword_253F28FE8);
    v0 = v60;
    sub_2177AB858(v66, v65);
    v68 = sub_217847EC0();
    v69 = sub_217848298();
    v70 = os_log_type_enabled(v68, v69);
    v71 = *(_QWORD *)(v60 + 224);
    if (v70)
    {
      v105 = v69;
      v72 = *(_QWORD *)(v0 + 176);
      v73 = *(_QWORD *)(v0 + 184);
      v74 = *(_QWORD *)(v0 + 160);
      v75 = *(_QWORD *)(v0 + 168);
      v76 = (uint8_t *)swift_slowAlloc();
      typea = swift_slowAlloc();
      v110[0] = typea;
      *(_DWORD *)v76 = 136315138;
      sub_2177AB858(v71, v75);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v73 + 56))(v75, 0, 1, v72);
      sub_2177FD53C(v75, v74, &qword_254F033E8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v74, 1, v72) == 1)
      {
        v77 = 7104878;
        sub_21776F518(*(_QWORD *)(v0 + 160), &qword_254F033E8);
        v78 = 0xE300000000000000;
      }
      else
      {
        v83 = *(_QWORD *)(v0 + 208);
        v82 = *(_QWORD *)(v0 + 216);
        sub_21783C1BC(*(_QWORD *)(v0 + 160), v82);
        sub_2177AB858(v82, v83);
        v77 = sub_217847FE0();
        v78 = v84;
        sub_2177AB89C(v82);
      }
      v85 = *(_QWORD *)(v0 + 224);
      sub_21776F518(*(_QWORD *)(v0 + 168), &qword_254F033E8);
      *(_QWORD *)(v0 + 120) = sub_2177D06AC(v77, v78, v110);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      sub_2177AB89C(v85);
      _os_log_impl(&dword_217765000, v68, v105, "Error decoding recoverable message part body into an attributed string: %s", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](typea, -1, -1);
      MEMORY[0x219A13268](v76, -1, -1);
    }
    else
    {
      sub_2177AB89C(*(_QWORD *)(v0 + 224));
    }

    v86 = *(_QWORD *)(v0 + 280);
    v88 = *(_QWORD *)(v0 + 248);
    v87 = *(_QWORD *)(v0 + 256);
    sub_21783C178();
    swift_allocError();
    *v89 = 1;
    swift_willThrow();
    sub_21776E454(v25, v26);
    goto LABEL_45;
  }
  sub_2177DF328();
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v60 = v0;
    goto LABEL_34;
  }
  v61 = *(void **)(v0 + 128);
  v62 = qword_253F28DB8;
  *(_QWORD *)(v0 + 320) = v61;
  *(_QWORD *)(v0 + 328) = v62;
  if (v62)
  {
    v63 = qword_253F28DC0;
    *(_QWORD *)(v0 + 336) = qword_253F28DC0;
    *(_QWORD *)(v0 + 344) = *(_QWORD *)(v63 + 232);
    if (qword_253F25B38 == -1)
      goto LABEL_31;
    goto LABEL_53;
  }
  v108 = v61;
  sub_217788584();
  v90 = (void *)swift_allocError();
  swift_willThrow();
  if (qword_253F26CA0 != -1)
    swift_once();
  v91 = sub_217847ED8();
  sub_21776F584(v91, (uint64_t)qword_253F28FE8);
  v92 = v90;
  swift_bridgeObjectRetain();
  v93 = v90;
  v94 = sub_217847EC0();
  v95 = sub_217848298();
  v109 = v90;
  if (os_log_type_enabled(v94, v95))
  {
    typeb = v95;
    v96 = swift_slowAlloc();
    v101 = (_QWORD *)swift_slowAlloc();
    v106 = swift_slowAlloc();
    v110[0] = v106;
    *(_DWORD *)v96 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 136) = sub_2177D06AC(v2, v3, v110);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v96 + 12) = 2112;
    v97 = v90;
    v98 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v98;
    sub_2178484E4();
    *v101 = v98;

    _os_log_impl(&dword_217765000, v94, typeb, "Encountered error moving recoverable message part for guid %s %@", (uint8_t *)v96, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v101, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v106, -1, -1);
    MEMORY[0x219A13268](v96, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v86 = *(_QWORD *)(v0 + 280);
  v88 = *(_QWORD *)(v0 + 248);
  v87 = *(_QWORD *)(v0 + 256);
  swift_willThrow();
  sub_21776E454(v25, v26);

LABEL_45:
  (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
LABEL_46:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_21783BEF4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 320));
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21783BF4C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 320);
  sub_21776E454(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 312));

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_21783C040()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 376))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 280));
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21783C094()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

unint64_t sub_21783C178()
{
  unint64_t result;

  result = qword_254F033F0;
  if (!qword_254F033F0)
  {
    result = MEMORY[0x219A13184](&unk_217850B0C, &_s6ErrorsON_1);
    atomic_store(result, (unint64_t *)&qword_254F033F0);
  }
  return result;
}

uint64_t sub_21783C1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecoverableMessageRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s6ErrorsOwst_1(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21783C24C + 4 * byte_217850A95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21783C280 + 4 * asc_217850A90[v4]))();
}

uint64_t sub_21783C280(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783C288(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21783C290);
  return result;
}

uint64_t sub_21783C29C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21783C2A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21783C2A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783C2B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6ErrorsOMa_1()
{
  return &_s6ErrorsON_1;
}

unint64_t sub_21783C2D0()
{
  unint64_t result;

  result = qword_254F033F8;
  if (!qword_254F033F8)
  {
    result = MEMORY[0x219A13184](&unk_217850AE4, &_s6ErrorsON_1);
    atomic_store(result, (unint64_t *)&qword_254F033F8);
  }
  return result;
}

uint64_t sub_21783C444(int a1, void *aBlock)
{
  uint64_t v2;
  void (**v3)(void *, _QWORD);

  v3 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v3[2](v3, 0);
  _Block_release(v3);
  return sub_21777DD4C(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t type metadata accessor for NoOpPreReqVerifier()
{
  return objc_opt_self();
}

uint64_t sub_21783C4B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21783C4DC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_21777AAD0;
  return ((uint64_t (*)(int, void *))((char *)&dword_254F034A0 + dword_254F034A0))(v2, v3);
}

uint64_t sub_21783C548(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  sub_21776B790(&qword_253F25C70);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_21783C5BC(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    sub_21776B790(&qword_253F25C70);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_21783C63C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_21783C654()
{
  uint64_t v0;
  uint64_t v1;
  char v3;

  v1 = *(_QWORD *)(v0 + 16);
  sub_21776E3A4((_QWORD *)(v1 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(v1 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24));
  v3 = *(_BYTE *)(*sub_21776E3A4((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40)) + 17);
  sub_217840190(&v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21783C6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);

  v7 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(v2 + 32);
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_254F034E8 + dword_254F034E8);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_21777DCC4;
  return v10(a1, a2, v7, v6);
}

uint64_t sub_21783C748(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21777CB6C;
  return v6();
}

uint64_t sub_21783C7A0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21777CB6C;
  return v7();
}

uint64_t sub_21783C7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2178481B4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2178481A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21783C93C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_217848160();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21783C93C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21776B790((uint64_t *)&unk_253F24E80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21783C97C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21783C9A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21777AAD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254F034C0 + dword_254F034C0))(a1, v4);
}

uint64_t destroy for SyncPreReqsVerifierStep(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for SyncPreReqsVerifierStep(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SyncPreReqsVerifierStep(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for SyncPreReqsVerifierStep(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_unknownObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SyncPreReqsVerifierStep()
{
  return &type metadata for SyncPreReqsVerifierStep;
}

uint64_t sub_21783CC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[31] = a3;
  v4[32] = a4;
  v4[29] = a1;
  v4[30] = a2;
  return swift_task_switch();
}

uint64_t sub_21783CC30()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[31];
  v2 = *(unsigned __int8 *)(*sub_21776E3A4((_QWORD *)(v0[29] + 16), *(_QWORD *)(v0[29] + 40)) + 100);
  v0[2] = v0;
  v0[3] = sub_21783CCE0;
  v3 = swift_continuation_init();
  v0[18] = MEMORY[0x24BDAC760];
  v4 = v0 + 18;
  v4[1] = 0x40000000;
  v4[2] = sub_21783C548;
  v4[3] = &unk_24D80FFB8;
  v4[4] = v3;
  objc_msgSend(v1, sel_verifyAllPreReqsWithRequireEnablement_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_21783CCE0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 264) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21783CD40()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  if (*(_QWORD *)(v0 + 256))
  {
    *(_QWORD *)(v0 + 120) = v0 + 296;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_21783CEB4;
    v1 = swift_continuation_init();
    *(_QWORD *)(v0 + 184) = MEMORY[0x24BDAC760];
    v2 = (_QWORD *)(v0 + 184);
    v2[1] = 0x40000000;
    v2[2] = sub_21783C5BC;
    v2[3] = &unk_24D80FFD0;
    v2[4] = v1;
    objc_msgSend((id)swift_unknownObjectRetain(), sel_sendDeviceIDToCloudKitWithCompletion_, v2);
    return swift_continuation_await();
  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v4 = sub_217847ED8();
    sub_21776F584(v4, (uint64_t)qword_253F28DC8);
    v5 = sub_217847EC0();
    v6 = sub_217848298();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_217765000, v5, v6, "Missing backup controller did not send ping for iCloud quota grace", v7, 2u);
      MEMORY[0x219A13268](v7, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
}

uint64_t sub_21783CEB4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 272) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_21783CF14()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  uint64_t v6;

  if ((*(_BYTE *)(v0 + 296) & 1) != 0)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v1 = sub_217847ED8();
    sub_21776F584(v1, (uint64_t)qword_253F28DC8);
    v2 = sub_217847EC0();
    v3 = sub_2178482B0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "Sent ping for quota grace to iCloud";
LABEL_10:
      _os_log_impl(&dword_217765000, v2, v3, v5, v4, 2u);
      MEMORY[0x219A13268](v4, -1, -1);
    }
  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v6 = sub_217847ED8();
    sub_21776F584(v6, (uint64_t)qword_253F28DC8);
    v2 = sub_217847EC0();
    v3 = sub_217848298();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "Did not successfully ping iCloud for quota grace";
      goto LABEL_10;
    }
  }

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t sub_21783D090()
{
  uint64_t *v0;
  _QWORD *v1;

  swift_willThrow();
  v1 = (_QWORD *)swift_task_alloc();
  v0[35] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_21783D134;
  return sub_217823614(v0[29], v0[30], 0, 0, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/MessagesCloudSync/SyncSteps/SyncPreReqsVerifierStep.swift", 115, 2);
}

uint64_t sub_21783D134()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21783D188()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21783D1C4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t);

  swift_willThrow();
  swift_unknownObjectRelease();
  v3 = (uint64_t (*)(uint64_t))((char *)&dword_254F024D0 + dword_254F024D0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v1;
  *v1 = v0;
  v1[1] = sub_21783D244;
  return v3(*(_QWORD *)(v0 + 272));
}

uint64_t sub_21783D244()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21783D298()
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

  if (qword_253F25D98 != -1)
    swift_once();
  v1 = *(void **)(v0 + 272);
  v2 = sub_217847ED8();
  sub_21776F584(v2, (uint64_t)qword_253F28DC8);
  v3 = v1;
  v4 = v1;
  v5 = sub_217847EC0();
  v6 = sub_217848298();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 272);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 224) = v12;
    sub_2178484E4();
    *v10 = v12;

    _os_log_impl(&dword_217765000, v5, v6, "Error pinging iCloud for quota grace: %@", v9, 0xCu);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v10, -1, -1);
    MEMORY[0x219A13268](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t destroy for AttachmentAssetDownloadStep(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  _s17MessagesCloudSync9SyncFilesVwxx_0(a1 + 24);
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for AttachmentAssetDownloadStep(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 24, a2 + 24);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AttachmentAssetDownloadStep(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  sub_2177806F8((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for AttachmentAssetDownloadStep(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  _s17MessagesCloudSync9SyncFilesVwxx_0(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AttachmentAssetDownloadStep(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AttachmentAssetDownloadStep(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttachmentAssetDownloadStep()
{
  return &type metadata for AttachmentAssetDownloadStep;
}

id sub_21783D728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = objc_allocWithZone(MEMORY[0x24BDB90E8]);
  sub_21783F438();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_2178480C4();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithRecordIDs_, v8);

  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_217848394();
  }
  v10 = v9;
  v11 = sub_2177DBA9C(a3, a4, 0x6863746566, 0xE500000000000000);
  objc_msgSend(v10, sel_setGroup_, v11);

  v12 = (_QWORD *)(a3 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_activity);
  v13 = objc_allocWithZone(MEMORY[0x24BDB9188]);
  v14 = v10;
  v15 = objc_msgSend(v13, sel_init);
  objc_msgSend(v15, sel_setQualityOfService_, 17);
  objc_msgSend(v15, sel_setAllowsCellularAccess_, 1);
  v16 = v12[3];
  v17 = v12[4];
  sub_21776E3A4(v12, v16);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
  if (v18)
  {
    v19 = v18;
    objc_msgSend(v15, sel_setAllowsCellularAccess_, 0);
    objc_msgSend(v15, sel_setXPCActivity_, v19);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v14, sel_setConfiguration_, v15);

  return v14;
}

uint64_t sub_21783D8F4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_21783D90C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  id v6;
  void *v7;

  if (qword_253F25D98 != -1)
    swift_once();
  v1 = sub_217847ED8();
  sub_21776F584(v1, (uint64_t)qword_253F28DC8);
  v2 = sub_217847EC0();
  v3 = sub_2178482B0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_217765000, v2, v3, "Removing afterRow marker for AttachmentAssetDownload", v4, 2u);
    MEMORY[0x219A13268](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 16);

  v6 = *(id *)(*sub_21776E3A4((_QWORD *)(v5 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState), *(_QWORD *)(v5 + OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState + 24))+ 24);
  v7 = (void *)sub_217847F74();
  objc_msgSend(v6, sel_removeObjectForKey_, v7);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21783DA50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  return swift_task_switch();
}

uint64_t sub_21783DAB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[6];
  v2 = OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState;
  v0[9] = OBJC_IVAR____TtC17MessagesCloudSync11SyncContext_cloudState;
  v3 = *(id *)(*sub_21776E3A4((_QWORD *)(v1 + v2), *(_QWORD *)(v1 + v2 + 24)) + 24);
  v4 = sub_21776FEB4(0xAu, 0);
  v0[10] = v4;

  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, sel_stringValue);
    v7 = sub_217847F98();
    v9 = v8;

  }
  else
  {
    v9 = 0xE800000000000000;
    v7 = 0x29747365776F6C28;
  }
  if (qword_253F25D98 != -1)
    swift_once();
  v10 = sub_217847ED8();
  v0[11] = sub_21776F584(v10, (uint64_t)qword_253F28DC8);
  swift_bridgeObjectRetain();
  v11 = sub_217847EC0();
  v12 = sub_2178482B0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v16[0] = v14;
    *(_DWORD *)v13 = 134218242;
    v0[4] = 200;
    sub_2178484E4();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[5] = sub_2177D06AC(v7, v9, v16);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_217765000, v11, v12, "Downloading limit %lld assets from %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v14, -1, -1);
    MEMORY[0x219A13268](v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v0[12] = *(_QWORD *)(v0[8] + 64);
  v0[2] = v4;
  sub_21784819C();
  v0[13] = sub_217848190();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_21783DD94()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = (void *)v0[12];
  v2 = (void *)v0[10];
  swift_release();
  v3 = objc_msgSend(v1, sel_batchOfRecordsMissingAssetsAfterRow_withLimit_, v0 + 2, 200);
  v4 = (void *)v0[2];
  v0[14] = v3;
  v0[15] = v4;
  v5 = v4;

  return swift_task_switch();
}

uint64_t sub_21783DE3C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)v0[14];
  if (!v1)
    goto LABEL_6;
  sub_21783F438();
  sub_2177BB180();
  v2 = sub_217847F2C();
  v0[16] = v2;

  if (!*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_6:
    v9 = (_QWORD *)swift_task_alloc();
    v0[20] = v9;
    *v9 = v0;
    v9[1] = sub_21783E2C4;
    v9[2] = v0[6];
    return swift_task_switch();
  }
  v3 = (void *)v0[15];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v4, sel_stringValue);
    v6 = sub_217847F98();
    v8 = v7;

  }
  else
  {
    v8 = 0xE500000000000000;
    v6 = 0x296C696E28;
  }
  swift_bridgeObjectRetain();
  v11 = sub_217847EC0();
  v12 = sub_2178482B0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v0[3] = sub_2177D06AC(v6, v8, v21);
    sub_2178484E4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_217765000, v11, v12, "Updating afterRow to %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v14, -1, -1);
    MEMORY[0x219A13268](v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v15 = (void *)v0[15];
  v16 = (_QWORD *)(v0[6] + v0[9]);
  v17 = *(id *)(*sub_21776E3A4(v16, v16[3]) + 24);
  v18 = v15;
  v19 = (void *)sub_217847F74();
  objc_msgSend(v17, sel_setObject_forKey_, v18, v19);

  v20 = (_QWORD *)swift_task_alloc();
  v0[17] = v20;
  *v20 = v0;
  v20[1] = sub_21783E17C;
  return sub_21783E40C(v0[6], v0[7], v2);
}

uint64_t sub_21783E17C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 144) = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    *(_BYTE *)(v6 + 168) = a2;
    *(_QWORD *)(v6 + 152) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_21783E24C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_BYTE *)(v0 + 168);

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, v2 & 1);
}

uint64_t sub_21783E2C4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21783E344()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t sub_21783E3AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21783E40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[29] = a3;
  v4[30] = v3;
  v4[27] = a1;
  v4[28] = a2;
  v5 = sub_21776B790(&qword_254F03520);
  v4[31] = v5;
  v4[32] = *(_QWORD *)(v5 - 8);
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  v6 = sub_21776B790(&qword_254F03528);
  v4[35] = v6;
  v4[36] = *(_QWORD *)(v6 - 8);
  v4[37] = swift_task_alloc();
  v7 = sub_21776B790(&qword_254F03530);
  v4[38] = v7;
  v4[39] = *(_QWORD *)(v7 - 8);
  v4[40] = swift_task_alloc();
  v4[41] = swift_task_alloc();
  v4[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21783E4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  id v30;
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

  v36 = *(_QWORD *)(v0 + 336);
  v39 = *(_QWORD *)(v0 + 328);
  v40 = *(_QWORD *)(v0 + 320);
  v37 = *(_QWORD *)(v0 + 312);
  v38 = *(_QWORD *)(v0 + 304);
  v33 = *(_QWORD *)(v0 + 288);
  v34 = *(_QWORD *)(v0 + 296);
  v35 = *(_QWORD *)(v0 + 280);
  v41 = *(_QWORD *)(v0 + 272);
  v42 = *(_QWORD *)(v0 + 256);
  v1 = *(_QWORD *)(v0 + 240);
  v43 = *(_QWORD *)(v0 + 248);
  v44 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 216);
  v31 = v3;
  v32 = v2;
  v4 = sub_21776E3A4((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
  v5 = swift_bridgeObjectRetain();
  v6 = sub_217789BCC(v5);
  swift_bridgeObjectRelease();
  v7 = sub_21776E3A4((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48))[5];
  v8 = v4[12];
  v10 = *((_OWORD *)v4 + 4);
  v9 = *((_OWORD *)v4 + 5);
  *(_OWORD *)(v0 + 64) = *((_OWORD *)v4 + 3);
  *(_OWORD *)(v0 + 80) = v10;
  *(_OWORD *)(v0 + 96) = v9;
  *(_QWORD *)(v0 + 112) = v8;
  v12 = *((_OWORD *)v4 + 1);
  v11 = *((_OWORD *)v4 + 2);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v4;
  *(_OWORD *)(v0 + 32) = v12;
  *(_OWORD *)(v0 + 48) = v11;
  swift_bridgeObjectRetain();
  v30 = sub_21783D728((uint64_t)v6, v7, v3, v2);
  *(_QWORD *)(v0 + 344) = v30;
  swift_bridgeObjectRelease();
  swift_release();
  v13 = sub_21776E3A4((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
  v14 = v13[1];
  v29 = *v13;
  v28 = *((_BYTE *)v13 + 16);
  v15 = v13[4];
  v27 = v13[3];
  v16 = v13[5];
  v17 = v13[6];
  LOBYTE(v3) = *((_BYTE *)v13 + 56);
  v18 = v13[8];
  v26 = *((_BYTE *)v13 + 72);
  v19 = v13[10];
  v25 = v13[11];
  v20 = v13[12];
  *(_QWORD *)(v0 + 144) = &type metadata for SyncZoneInfo;
  *(_QWORD *)(v0 + 152) = &off_24D80E560;
  v21 = swift_allocObject();
  *(_QWORD *)(v0 + 120) = v21;
  *(_QWORD *)(v21 + 16) = v29;
  *(_QWORD *)(v21 + 24) = v14;
  *(_BYTE *)(v21 + 32) = v28;
  *(_QWORD *)(v21 + 40) = v27;
  *(_QWORD *)(v21 + 48) = v15;
  *(_QWORD *)(v21 + 56) = v16;
  *(_QWORD *)(v21 + 64) = v17;
  *(_BYTE *)(v21 + 72) = v3;
  *(_QWORD *)(v21 + 80) = v18;
  *(_BYTE *)(v21 + 88) = v26;
  *(_QWORD *)(v21 + 96) = v19;
  *(_QWORD *)(v21 + 104) = v25;
  *(_QWORD *)(v21 + 112) = v20;
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = 0;
  v23 = (_QWORD *)swift_task_alloc();
  v23[2] = v30;
  v23[3] = v22;
  v23[4] = v31;
  v23[5] = v32;
  v23[6] = v0 + 120;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 104))(v34, *MEMORY[0x24BEE6CA0], v35);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2178481F0();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v39, v36, v38);
  swift_release();
  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v40, v39, v38);
  sub_217787664(&qword_254F03538, &qword_254F03530, MEMORY[0x24BEE6D38]);
  sub_2178481CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v44, v41, v43);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
  *(_QWORD *)(v0 + 352) = 0;
  return swift_task_switch();
}

uint64_t sub_21783E84C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  sub_217787664(&qword_254F03540, &qword_254F03520, MEMORY[0x24BEE6D18]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v1;
  *v1 = v0;
  v1[1] = sub_21783E8E8;
  return sub_217848184();
}

uint64_t sub_21783E8E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_endAccess();
    *(_OWORD *)(v2 + 376) = *(_OWORD *)(v2 + 184);
    *(_BYTE *)(v2 + 201) = *(_BYTE *)(v2 + 200);
  }
  return swift_task_switch();
}

uint64_t sub_21783E968()
{
  uint64_t v0;
  int v1;
  void *v2;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;

  v1 = *(unsigned __int8 *)(v0 + 201);
  if (v1 == 255)
  {
    v2 = *(void **)(v0 + 344);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v0 + 352), 1);
  }
  v4 = *(void **)(v0 + 384);
  if ((v1 & 1) != 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + 16);
    v7 = *(id *)(v0 + 376);
    v8 = v7;
    if (v6)
    {
      v9 = v7;
      v10 = v4;
      v11 = sub_2177D27F0((uint64_t)v9);
      if ((v12 & 1) != 0)
      {
        v13 = *(_QWORD *)(v0 + 240);
        v14 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 232) + 56) + 16 * v11);
        *(_QWORD *)(v0 + 408) = *v14;
        *(_QWORD *)(v0 + 416) = v14[1];
        swift_bridgeObjectRetain();

        *(_QWORD *)(v0 + 424) = *(_QWORD *)(v13 + 64);
        *(_QWORD *)(v0 + 432) = sub_217847F74();
        sub_21784819C();
        *(_QWORD *)(v0 + 440) = sub_217848190();
        sub_217848160();
        return swift_task_switch();
      }

    }
    else
    {
      v15 = v4;
    }
    if (qword_253F25D98 != -1)
      swift_once();
    v16 = sub_217847ED8();
    sub_21776F584(v16, (uint64_t)qword_253F28DC8);
    v17 = v8;
    v18 = v4;
    v19 = v17;
    v20 = v4;
    v21 = sub_217847EC0();
    v22 = sub_217848298();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(_BYTE *)(v0 + 201);
    v26 = *(void **)(v0 + 376);
    v25 = *(void **)(v0 + 384);
    if (v23)
    {
      v27 = swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412546;
      v29 = v4;
      v30 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v27 + 4) = v30;
      *v28 = v30;

      *(_WORD *)(v27 + 12) = 2112;
      *(_QWORD *)(v27 + 14) = v19;
      v28[1] = v26;

      _os_log_impl(&dword_217765000, v21, v22, "While fetching assets, got an error %@ for a recordID %@ we didn't expect to fetch", (uint8_t *)v27, 0x16u);
      sub_21776B790((uint64_t *)&unk_253F25E10);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v28, -1, -1);
      MEMORY[0x219A13268](v27, -1, -1);

      sub_21783F4E0(v26, v25, v24);
    }
    else
    {

      sub_21783F4E0(v26, v25, v24);
    }
    return swift_task_switch();
  }
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(*(_QWORD *)(v0 + 240) + 64);
  sub_21784819C();
  v5 = v4;
  *(_QWORD *)(v0 + 400) = sub_217848190();
  sub_217848160();
  return swift_task_switch();
}

uint64_t sub_21783ED20()
{
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_21783ED5C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 208) = *(_QWORD *)(v0 + 368);
  sub_21776B790(&qword_253F25C70);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_21783EDBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 256);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21783EE58()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 392);
  v2 = *(void **)(v0 + 384);
  swift_release();
  objc_msgSend(v1, sel_updateAssetUsingRecord_, v2);

  return swift_task_switch();
}

void sub_21783EEB0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v1 = *(void **)(v0 + 376);
  v2 = *(void **)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 352);
  v4 = *(_BYTE *)(v0 + 201);

  sub_21783F4E0(v1, v2, v4);
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 352) = v3 + 1;
    swift_task_switch();
  }
}

uint64_t sub_21783EF1C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 432);
  v2 = *(void **)(v0 + 424);
  swift_release();
  objc_msgSend(v2, sel_markTransferAsNotSuccessfullyDownloadedWithGUID_, v1);

  return swift_task_switch();
}

uint64_t sub_21783EF74()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  unsigned __int8 v21;
  uint64_t v22;

  if (qword_253F25D98 != -1)
    swift_once();
  v1 = *(void **)(v0 + 384);
  v2 = sub_217847ED8();
  sub_21776F584(v2, (uint64_t)qword_253F28DC8);
  v3 = v1;
  v4 = v1;
  swift_bridgeObjectRetain();
  v5 = sub_217847EC0();
  v6 = sub_2178482B0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 416);
  if (v7)
  {
    v9 = *(_QWORD *)(v0 + 408);
    v10 = *(void **)(v0 + 376);
    v11 = *(void **)(v0 + 384);
    v21 = *(_BYTE *)(v0 + 201);
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v22 = v14;
    *(_DWORD *)v12 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v12 + 4) = sub_2177D06AC(v9, v8, &v22);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2112;
    v15 = v11;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v12 + 14) = v16;
    *v13 = v16;

    _os_log_impl(&dword_217765000, v5, v6, "Failed to fetch asset for attachment %s %@", (uint8_t *)v12, 0x16u);
    sub_21776B790((uint64_t *)&unk_253F25E10);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v14, -1, -1);
    MEMORY[0x219A13268](v12, -1, -1);

    sub_21783F4E0(v10, v11, v21);
  }
  else
  {
    v18 = *(void **)(v0 + 376);
    v17 = *(void **)(v0 + 384);
    v19 = *(_BYTE *)(v0 + 201);

    swift_bridgeObjectRelease_n();
    sub_21783F4E0(v18, v17, v19);
  }
  return swift_task_switch();
}

uint64_t sub_21783F1E8()
{
  return swift_task_switch();
}

uint64_t sub_21783F1FC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_253F25D98 != -1)
    swift_once();
  v1 = sub_217847ED8();
  sub_21776F584(v1, (uint64_t)qword_253F28DC8);
  v2 = sub_217847EC0();
  v3 = sub_2178482B0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_217765000, v2, v3, "Starting Attachment asset download", v4, 2u);
    MEMORY[0x219A13268](v4, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21783F2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_21777DCC4;
  v6[7] = a2;
  v6[8] = v2;
  v6[6] = a1;
  return swift_task_switch();
}

uint64_t sub_21783F348()
{
  return swift_task_switch();
}

uint64_t sub_21783F35C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_253F25D98 != -1)
    swift_once();
  v1 = sub_217847ED8();
  sub_21776F584(v1, (uint64_t)qword_253F28DC8);
  v2 = sub_217847EC0();
  v3 = sub_2178482B0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_217765000, v2, v3, "Finished Attachment asset download", v4, 2u);
    MEMORY[0x219A13268](v4, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_21783F438()
{
  unint64_t result;

  result = qword_253F26DC8;
  if (!qword_253F26DC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F26DC8);
  }
  return result;
}

uint64_t sub_21783F474()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21783F4C0()
{
  return swift_deallocObject();
}

void sub_21783F4D0(uint64_t a1)
{
  uint64_t v1;

  sub_21781F91C(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

void sub_21783F4E0(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    sub_2177DC4A8(a1, a2);
}

uint64_t sub_21783F4F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21783F538 + 4 * byte_217850C20[a1]))(0x616E614D74616863, 0xEF656E6F5A656574);
}

unint64_t sub_21783F538()
{
  return 0xD000000000000010;
}

unint64_t sub_21783F554()
{
  return 0xD000000000000012;
}

uint64_t storeEnumTagSinglePayload for SyncZone(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_21783F624 + 4 * byte_217850C2C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21783F658 + 4 * byte_217850C27[v4]))();
}

uint64_t sub_21783F658(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783F660(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21783F668);
  return result;
}

uint64_t sub_21783F674(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21783F67CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21783F680(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21783F688(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncZone()
{
  return &type metadata for SyncZone;
}

unint64_t sub_21783F6A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254F03548;
  if (!qword_254F03548)
  {
    v1 = sub_21777F200(&qword_254F03550);
    result = MEMORY[0x219A13184](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254F03548);
  }
  return result;
}

void sub_21783F6F4(char *a1)
{
  sub_21781954C(*a1);
}

void sub_21783F700()
{
  char *v0;

  sub_2177CBCE8(0, *v0);
}

void sub_21783F70C(uint64_t a1)
{
  char *v1;

  sub_2177F1A80(a1, *v1);
}

void sub_21783F714(uint64_t a1)
{
  char *v1;

  sub_2177CBCE8(a1, *v1);
}

uint64_t sub_21783F71C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21783F7C8();
  *a1 = result;
  return result;
}

uint64_t sub_21783F748@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21783F4F8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_21783F770(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D806728;
}

unint64_t sub_21783F784()
{
  unint64_t result;

  result = qword_254F03558;
  if (!qword_254F03558)
  {
    result = MEMORY[0x219A13184](&unk_217850CFC, &type metadata for SyncZone);
    atomic_store(result, (unint64_t *)&qword_254F03558);
  }
  return result;
}

uint64_t sub_21783F7C8()
{
  unint64_t v0;

  v0 = sub_217848790();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

BOOL sub_21783F810()
{
  uint64_t v0;
  char v1;

  if (qword_253F25DC0 != -1)
    swift_once();
  v0 = sub_217841850(6u, 0);
  return (v1 & 1) == 0 && v0 >= sub_2177683C4();
}

id sub_21783F8A0()
{
  void *v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v0 = (void *)sub_217840C7C();
  if (v0)
    return objc_msgSend(v0, sel_syncCancelled);
  if (qword_253F25D98 != -1)
    swift_once();
  v2 = sub_217847ED8();
  sub_21776F584(v2, (uint64_t)qword_253F28DC8);
  v3 = sub_217847EC0();
  v4 = sub_217848298();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_217765000, v3, v4, "StateManager was nil in CloudState, returning false for isSyncCancelled.", v5, 2u);
    MEMORY[0x219A13268](v5, -1, -1);
  }

  return 0;
}

_QWORD *sub_21783F988(void *a1, void *a2, uint64_t a3, void *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24[2];

  v5 = v4;
  v10 = sub_217847E6C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = a3;
  v5[7] = a4;
  v24[1] = a4;
  swift_unknownObjectRetain();
  v24[0] = a1;
  v14 = a2;
  swift_unknownObjectRetain();
  v15 = (void *)sub_217847F74();
  v16 = objc_msgSend(v14, sel_stringForKey_, v15);

  if (v16)
  {
    v17 = sub_217847F98();
    v19 = v18;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    sub_217847E60();
    v17 = sub_217847E48();
    v19 = v20;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_bridgeObjectRetain();
    v21 = (void *)sub_217847F74();
    v22 = (void *)sub_217847F74();
    objc_msgSend(v14, sel_setObject_forKey_, v21, v22);
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

  }
  v5[4] = v17;
  v5[5] = v19;
  return v5;
}

id sub_21783FB60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(void **)(v2 + 48);
  if (v5)
  {
    swift_unknownObjectRetain();
    v6 = (void *)sub_217847F74();
    v7 = objc_msgSend(v5, sel_tokenForKey_, v6);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v8 = sub_217847ED8();
    sub_21776F584(v8, (uint64_t)qword_253F28DC8);
    swift_bridgeObjectRetain_n();
    v9 = sub_217847EC0();
    v10 = sub_217848298();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v14 = v12;
      *(_DWORD *)v11 = 136315394;
      sub_2177D06AC(0xD000000000000023, 0x8000000217855990, &v14);
      sub_2178484E4();
      *(_WORD *)(v11 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2177D06AC(a1, a2, &v14);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v9, v10, "%s: Missing sync token store, did not update change token %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v12, -1, -1);
      MEMORY[0x219A13268](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v7;
}

void sub_21783FD94(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v6 = *(void **)(v3 + 48);
  if (v6)
  {
    swift_unknownObjectRetain();
    v13 = (id)sub_217847F74();
    objc_msgSend(v6, sel_persistToken_forKey_, a1, v13);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v8 = sub_217847ED8();
    sub_21776F584(v8, (uint64_t)qword_253F28DC8);
    swift_bridgeObjectRetain_n();
    v9 = sub_217847EC0();
    v10 = sub_217848298();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v14 = v12;
      *(_DWORD *)v11 = 136315394;
      sub_2177D06AC(0xD00000000000001ELL, 0x8000000217853970, &v14);
      sub_2178484E4();
      *(_WORD *)(v11 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2177D06AC(a2, a3, &v14);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v9, v10, "%s: Missing sync token store, did not update server change token for key (%s)", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v12, -1, -1);
      MEMORY[0x219A13268](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_21783FFD4(char a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  v3 = *(void **)(v1 + 56);
  if (v3)
  {
    if ((a1 & 1) != 0)
      objc_msgSend(v3, sel_setSyncStopped);
    else
      objc_msgSend(v3, sel_setSyncStarted);
  }
  else
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v4 = sub_217847ED8();
    sub_21776F584(v4, (uint64_t)qword_253F28DC8);
    oslog = sub_217847EC0();
    v5 = sub_217848298();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v11 = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = sub_2177BFFA8();
      sub_2177D06AC(v8, v9, &v11);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217765000, oslog, v5, "Encountered error sync status: %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v7, -1, -1);
      MEMORY[0x219A13268](v6, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_217840190(_BYTE *a1)
{
  uint64_t v2;
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
  uint64_t result;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;

  v2 = sub_217847E3C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v40 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v40 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v40 - v14;
  result = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v40 - v17;
  switch(*a1)
  {
    case 0:
      sub_217847E30();
      v23 = sub_217840C7C();
      if (v23)
      {
        v24 = (void *)v23;
        swift_unknownObjectRetain();
        v25 = (void *)sub_217847DD0();
        v26 = (void *)sub_217847F74();
        objc_msgSend(v24, sel_setSyncDate_forKey_shouldOverride_, v25, v26, 0);

        swift_unknownObjectRelease();
      }
      result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v18, v2);
      break;
    case 1:
      sub_217847E30();
      v27 = sub_217840C7C();
      if (v27)
      {
        v28 = (void *)v27;
        swift_unknownObjectRetain();
        v29 = (void *)sub_217847DD0();
        v30 = (void *)sub_217847F74();
        objc_msgSend(v28, sel_setSyncDate_forKey_shouldOverride_, v29, v30, 0);

        swift_unknownObjectRelease();
      }
      v31 = *(void (**)(char *, uint64_t))(v3 + 8);
      v31(v15, v2);
      sub_217847E30();
      v32 = sub_217840C7C();
      if (v32)
      {
        v33 = (void *)v32;
        swift_unknownObjectRetain();
        v34 = (void *)sub_217847DD0();
        v35 = (void *)sub_217847F74();
        objc_msgSend(v33, sel_setSyncDate_forKey_shouldOverride_, v34, v35, 1);

        swift_unknownObjectRelease();
      }
      result = ((uint64_t (*)(char *, uint64_t))v31)(v12, v2);
      break;
    case 2:
    case 3:
    case 6:
      sub_217847E30();
      v19 = sub_217840C7C();
      if (v19)
      {
        v20 = (void *)v19;
        swift_unknownObjectRetain();
        v21 = (void *)sub_217847DD0();
        v22 = (void *)sub_217847F74();
        objc_msgSend(v20, sel_setSyncDate_forKey_shouldOverride_, v21, v22, 1);

        swift_unknownObjectRelease();
      }
      result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      break;
    case 4:
      sub_217847E30();
      v36 = sub_217840C7C();
      if (v36)
      {
        v37 = (void *)v36;
        swift_unknownObjectRetain();
        v38 = (void *)sub_217847DD0();
        v39 = (void *)sub_217847F74();
        objc_msgSend(v37, sel_setSyncDate_forKey_shouldOverride_, v38, v39, 1);

        swift_unknownObjectRelease();
      }
      result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_217840538(unsigned __int8 *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;

  v3 = v2;
  v6 = sub_217847E3C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(a1) = *a1;
  sub_217847E30();
  switch((int)a1)
  {
    case 0:
      if ((a2 & 1) != 0)
      {
        v15 = sub_217840C7C();
        if (v15)
        {
          v16 = (void *)v15;
          swift_unknownObjectRetain();
          v17 = (void *)sub_217847DD0();
          v18 = (void *)sub_217847F74();
          objc_msgSend(v16, sel_setSyncDate_forKey_shouldOverride_, v17, v18, 0);

          swift_unknownObjectRelease();
        }
        v14 = sub_217840C7C();
        if (!v14)
          goto LABEL_18;
        goto LABEL_11;
      }
      break;
    case 1:
    case 2:
    case 3:
    case 6:
      if ((a2 & 1) != 0)
      {
        v10 = sub_217840C7C();
        if (v10)
        {
          v11 = (void *)v10;
          swift_unknownObjectRetain();
          v12 = (void *)sub_217847DD0();
          v13 = (void *)sub_217847F74();
          objc_msgSend(v11, sel_setSyncDate_forKey_shouldOverride_, v12, v13, 0);

          swift_unknownObjectRelease();
        }
        v14 = sub_217840C7C();
        if (!v14)
          goto LABEL_18;
        goto LABEL_11;
      }
      break;
    case 4:
      if ((a2 & 1) != 0)
      {
        v22 = sub_217840C7C();
        if (v22)
        {
          v23 = (void *)v22;
          swift_unknownObjectRetain();
          v24 = (void *)sub_217847DD0();
          v25 = (void *)sub_217847F74();
          objc_msgSend(v23, sel_setSyncDate_forKey_shouldOverride_, v24, v25, 0);

          swift_unknownObjectRelease();
        }
        v14 = sub_217840C7C();
        if (v14)
        {
LABEL_11:
          v19 = (void *)v14;
          swift_unknownObjectRetain();
          v20 = (void *)sub_217847DD0();
          v21 = (void *)sub_217847F74();
          objc_msgSend(v19, sel_setSyncDate_forKey_shouldOverride_, v20, v21, 1);

          swift_unknownObjectRelease();
        }
        goto LABEL_18;
      }
      break;
    default:
      if ((a2 & 1) != 0)
      {
LABEL_18:
        v26 = sub_217840C7C();
        if (v26)
        {
          v27 = (void *)v26;
          swift_unknownObjectRetain();
          v28 = (void *)sub_217847DD0();
          v29 = (void *)sub_217847F74();
          objc_msgSend(v27, sel_setSyncDate_forKey_shouldOverride_, v28, v29, 1);

          swift_unknownObjectRelease();
        }
        v30 = *(void **)(v3 + 56);
        if (v30)
        {
          v31 = (void *)sub_217847DD0();
          objc_msgSend(v30, sel_setLastSyncDate_, v31);

        }
      }
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_2178408CC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  uint64_t v13;
  id result;

  v4 = v3;
  if (qword_253F26C90 != -1)
    swift_once();
  v8 = sub_217847ED8();
  sub_21776F584(v8, (uint64_t)qword_253F28FD0);
  v9 = sub_217847EC0();
  v10 = sub_2178482B0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 134217984;
    sub_2178484E4();
    _os_log_impl(&dword_217765000, v9, v10, "Download Progress: %f", v11, 0xCu);
    MEMORY[0x219A13268](v11, -1, -1);
  }

  v12 = *(void **)(v4 + 56);
  if (v12)
  {
    objc_msgSend(*(id *)(v4 + 56), sel_setCloudKitHasAvailableRecordsToDownload_, a3 & 1);
    if (a2 <= 1)
      v13 = 1;
    else
      v13 = a2;
    objc_msgSend(v12, sel_setLastSyncDownloadProgress_, fmin((double)a1 / (double)v13, 1.0));
  }
  result = (id)sub_217840C7C();
  if (result)
    return objc_msgSend(result, sel_sendBroadcastToClient);
  return result;
}

void sub_217840A64(unsigned __int8 *a1)
{
  sub_217840A8C(a1, MEMORY[0x24BE50C20]);
}

void sub_217840A78(unsigned __int8 *a1)
{
  sub_217840A8C(a1, MEMORY[0x24BE50C30]);
}

void sub_217840A8C(unsigned __int8 *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  objc_msgSend(*(id *)(v2 + 24), sel_setBool_forKey_, 1, *a2);
  __asm { BR              X9 }
}

void sub_217840AF0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _QWORD *v16;
  void *v17;
  void *v18;

  v18 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setObject_forKey_, v18, *v16);

}

uint64_t sub_217840C18()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CloudState()
{
  return objc_opt_self();
}

uint64_t sub_217840C7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 56);
  if (!v1)
  {
    if (qword_253F25D98 != -1)
      swift_once();
    v2 = sub_217847ED8();
    sub_21776F584(v2, (uint64_t)qword_253F28DC8);
    v3 = sub_217847EC0();
    v4 = sub_217848298();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v10 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = sub_2177BFFA8();
      sub_2177D06AC(v7, v8, &v10);
      sub_2178484E4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217765000, v3, v4, "Encountered error setting sync date: %s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v6, -1, -1);
      MEMORY[0x219A13268](v5, -1, -1);
    }

  }
  return v1;
}

void sub_217840DF0(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *a2;
  if (qword_253F25DC0 != -1)
    swift_once();
  v3 = (id)qword_253F28F00;
  sub_217841A44(v2);

  v4 = (id)qword_253F28F00;
  sub_217841A64(v2);

  __asm { BR              X9 }
}

uint64_t storeEnumTagSinglePayload for CloudStateError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_217841094 + 4 * byte_217850D4F[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2178410B4 + 4 * byte_217850D54[v4]))();
}

_BYTE *sub_217841094(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2178410B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2178410BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2178410C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2178410CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2178410D4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CloudStateError()
{
  return &type metadata for CloudStateError;
}

unint64_t sub_2178410F4()
{
  unint64_t result;

  result = qword_254F03568;
  if (!qword_254F03568)
  {
    result = MEMORY[0x219A13184](&unk_217850E10, &type metadata for CloudStateError);
    atomic_store(result, (unint64_t *)&qword_254F03568);
  }
  return result;
}

void sub_217841138(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;

  v2 = sub_217847E3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21776B790((uint64_t *)&unk_253F259D0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ActionRecord();
  if (*(_QWORD *)(a1 + *(int *)(v9 + 68) + 8))
  {
    swift_bridgeObjectRetain();
    v10 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  sub_21777B5D4(a1 + *(int *)(v9 + 64), (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    v11 = 0;
    if (*(_QWORD *)(a1 + 8))
    {
LABEL_6:
      swift_bridgeObjectRetain();
      v12 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
  }
  else
  {
    v11 = (void *)sub_217847DD0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    if (*(_QWORD *)(a1 + 8))
      goto LABEL_6;
  }
  v12 = 0;
LABEL_9:
  v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSender_time_guid_type_, v10, v11, v12, 1);

  if (v13)
  {
    v14 = v13;
    sub_217847E24();
    v15 = (void *)sub_217847DD0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v14, sel_setTimeRead_, v15);

    sub_2177B94AC(a1);
  }
  else
  {
    __break(1u);
  }
}

void sub_217841350(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;

  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    objc_msgSend(v3, sel_setChangeType_, objc_msgSend(v4, sel_participantChangeType));
    sub_2177BB810();
    if (v5)
    {
      v6 = (void *)sub_217847F74();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v3, sel_setOtherHandle_, v6);

    v14 = sub_2177BBCA4();
    if (v14)
    {
      sub_217820838(v14);
      swift_bridgeObjectRelease();
      v15 = (id)sub_217847F20();
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v3, sel_setMessageSummaryInfo_, v15);

  }
  else
  {
    if (qword_253F26CA0 != -1)
      swift_once();
    v9 = sub_217847ED8();
    sub_21776F584(v9, (uint64_t)qword_253F28FE8);
    swift_bridgeObjectRetain_n();
    v10 = sub_217847EC0();
    v11 = sub_217848298();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_2177D06AC(a2, a3, &v16);
      sub_2178484E4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217765000, v10, v11, "No Proto for IMParticipantChangeItem %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A13268](v13, -1, -1);
      MEMORY[0x219A13268](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_2178415E0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  sub_21776E3A4((_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 48));
  objc_msgSend(v1, sel_removeObserver_, sub_2178488D4());
  swift_unknownObjectRelease();

  _s17MessagesCloudSync9SyncFilesVwxx_0(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotificationToken()
{
  return objc_opt_self();
}

uint64_t sub_21784167C(unsigned __int8 a1, char a2)
{
  void *v2;
  void *v4;
  id v5;
  char v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  sub_217841758(a1);
  v4 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_objectForKey_, v4);

  if (v5)
  {
    sub_217848538();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_217787700((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if (swift_dynamicCast())
      a2 = v7;
  }
  else
  {
    sub_2177801A8((uint64_t)v9);
  }
  return a2 & 1;
}

uint64_t sub_217841758(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_217841794
                                                                     + 4 * asc_217850EA2[a1]))(0xD000000000000013, 0x8000000217854720);
}

uint64_t sub_217841794()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_217841850(unsigned __int8 a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  uint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  sub_217841758(a1);
  v4 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_objectForKey_, v4);

  if (v5)
  {
    sub_217848538();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_217787700((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if (swift_dynamicCast())
      return v7;
  }
  else
  {
    sub_2177801A8((uint64_t)v9);
  }
  return a2;
}

void sub_217841944()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_217847F74();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
    qword_253F28DE0 = (uint64_t)v2;
  else
    __break(1u);
}

void sub_2178419B8()
{
  id v0;
  void *v1;
  id v2;

  sub_217847F98();
  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
    qword_253F28F00 = (uint64_t)v2;
  else
    __break(1u);
}

void sub_217841A44(char a1)
{
  sub_217841A84(a1);
}

void sub_217841A64(char a1)
{
  sub_217841A84(a1);
}

void sub_217841A84(char a1)
{
  sub_21784861C();
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_217841B08()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v4;
  _BYTE v5[32];
  _QWORD v6[12];

  sub_21784801C();
  swift_bridgeObjectRelease();
  v1 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_217848538();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_217787700((uint64_t)v5, (uint64_t)v6);
  if (v6[3])
  {
    if (swift_dynamicCast())
      return v4;
    else
      return 0;
  }
  else
  {
    sub_2177801A8((uint64_t)v6);
    return 0;
  }
}

void sub_217841CAC(uint64_t a1, char a2)
{
  sub_217841CEC(a1, a2);
}

void sub_217841CCC(uint64_t a1, char a2)
{
  sub_217841CEC(a1, a2);
}

void sub_217841CEC(uint64_t a1, char a2)
{
  sub_217848970();
  sub_21784861C();
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

void sub_217841D80(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  void *v23;
  void *v24;

  sub_21784801C();
  swift_bridgeObjectRelease();
  v24 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setObject_forKey_, v22, v24);

}

uint64_t sub_217841E84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_217818B20(*a1, *a2);
}

uint64_t sub_217841E90()
{
  return sub_21777F510();
}

uint64_t sub_217841E98()
{
  sub_217848004();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217841F1C()
{
  return sub_2177CC000();
}

uint64_t sub_217841F24@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_217842588();
  *a1 = result;
  return result;
}

void sub_217841F50(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEA00000000004449;
  v4 = 0x8000000217851EA0;
  v5 = 0xD000000000000013;
  if (v2 != 1)
  {
    v5 = 0xD000000000000017;
    v4 = 0x8000000217851EC0;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E6F737265505A46;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_217841FB8()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000013;
  if (*v0 != 1)
    v1 = 0xD000000000000017;
  if (*v0)
    return v1;
  else
    return 0x6E6F737265505A46;
}

uint64_t sub_21784201C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_217842588();
  *a1 = result;
  return result;
}

uint64_t sub_217842040()
{
  sub_217842804();
  return sub_2178489D0();
}

uint64_t sub_217842068()
{
  sub_217842804();
  return sub_2178489DC();
}

uint64_t sub_217842090(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  _BYTE v12[16];
  _BYTE v13[16];
  _BYTE v14[16];

  v3 = v1;
  v5 = sub_21776B790(&qword_254F03580);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21776E3A4(a1, a1[3]);
  sub_217842804();
  sub_2178489C4();
  v12[0] = 0;
  sub_217848868();
  if (!v2)
  {
    sub_217842848(v3 + 16, (uint64_t)v14);
    sub_217842848((uint64_t)v14, (uint64_t)v12);
    v11 = 1;
    sub_21776B790(&qword_253F26D08);
    sub_2177D3AD8();
    sub_217848880();
    sub_217842848(v3 + 32, (uint64_t)v13);
    sub_217842848((uint64_t)v13, (uint64_t)v12);
    v11 = 2;
    sub_217848880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_217842224@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_2178425D0(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_217842264(_QWORD *a1)
{
  return sub_217842090(a1);
}

uint64_t sub_21784229C(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_2178422E0(v7, v8) & 1;
}

uint64_t sub_2178422E0(_QWORD *a1, _QWORD *a2)
{
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  if (*a1 != *a2 || a1[1] != a2[1])
  {
    v5 = sub_2178488E0();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = a1[3];
  v8 = a2[3];
  if (!v7)
  {
    if (v8)
      return 0;
    goto LABEL_15;
  }
  if (!v8)
    return 0;
  v9 = a1[2] == a2[2] && v7 == v8;
  if (v9 || (v10 = sub_2178488E0(), result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    v11 = a1[5];
    v12 = a2[5];
    if (v11)
    {
      if (v12 && (a1[4] == a2[4] && v11 == v12 || (sub_2178488E0() & 1) != 0))
        return 1;
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

_QWORD *initializeWithCopy for HandleRecord(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HandleRecord(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithTake for HandleRecord(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for HandleRecord(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HandleRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HandleRecord()
{
  return &type metadata for HandleRecord;
}

uint64_t sub_217842588()
{
  unint64_t v0;

  v0 = sub_217848790();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_2178425D0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v5 = sub_21776B790(&qword_254F03570);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21776E3A4(a1, a1[3]);
  sub_217842804();
  sub_2178489B8();
  if (v2)
    return _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)a1);
  v27 = 0;
  v9 = sub_2178487E4();
  v11 = v10;
  v24 = v9;
  v26 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_2178487A8();
  v14 = v13;
  v22 = v12;
  v25 = 2;
  swift_bridgeObjectRetain();
  v23 = v14;
  v15 = sub_2178487A8();
  v17 = v16;
  v18 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  v19 = v23;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v24;
  a2[1] = v11;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v18;
  a2[5] = v17;
  return result;
}

unint64_t sub_217842804()
{
  unint64_t result;

  result = qword_254F03578;
  if (!qword_254F03578)
  {
    result = MEMORY[0x219A13184](&unk_217851054, &type metadata for HandleRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03578);
  }
  return result;
}

uint64_t sub_217842848(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21776B790(&qword_253F26D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for HandleRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2178428DC + 4 * byte_217850EC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_217842910 + 4 * byte_217850EC0[v4]))();
}

uint64_t sub_217842910(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217842918(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217842920);
  return result;
}

uint64_t sub_21784292C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217842934);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_217842938(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217842940(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HandleRecord.CodingKeys()
{
  return &type metadata for HandleRecord.CodingKeys;
}

unint64_t sub_217842960()
{
  unint64_t result;

  result = qword_254F03588;
  if (!qword_254F03588)
  {
    result = MEMORY[0x219A13184](&unk_21785102C, &type metadata for HandleRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03588);
  }
  return result;
}

unint64_t sub_2178429A8()
{
  unint64_t result;

  result = qword_254F03590;
  if (!qword_254F03590)
  {
    result = MEMORY[0x219A13184](&unk_217850F64, &type metadata for HandleRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03590);
  }
  return result;
}

unint64_t sub_2178429F0()
{
  unint64_t result;

  result = qword_254F03598[0];
  if (!qword_254F03598[0])
  {
    result = MEMORY[0x219A13184](&unk_217850F8C, &type metadata for HandleRecord.CodingKeys);
    atomic_store(result, qword_254F03598);
  }
  return result;
}

uint64_t sub_217842A34(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2177A3F0C;
  return sub_217842A80(a1);
}

uint64_t sub_217842A80(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[8] = a1;
  v2[9] = v1;
  v3 = sub_217847ED8();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_217842AFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  v1 = v0[9];
  v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActionRecord() + 88));
  v3 = *v2;
  v0[15] = *v2;
  v4 = v2[1];
  v0[16] = v4;
  sub_217796A08(v3, v4);
  sub_217805890();
  v6 = v5;
  v0[17] = v5;
  v9 = (uint64_t (*)(uint64_t))((char *)&dword_254F01DB8 + dword_254F01DB8);
  v7 = (_QWORD *)swift_task_alloc();
  v0[18] = v7;
  *v7 = v0;
  v7[1] = sub_217842B8C;
  return v9(v6);
}

uint64_t sub_217842B8C(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 152) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 288) = a1 & 1;
  return swift_task_switch();
}

id sub_217842C04()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_BYTE *)(v0 + 288) != 1)
  {
    v10 = *(void **)(v0 + 136);
    sub_21782DE54();
    swift_allocError();
    *v11 = 0;
LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_253F25B88 != -1)
    swift_once();
  result = objc_msgSend(*(id *)(v0 + 136), sel_guid);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v2 = result;
  v3 = sub_217847F98();
  v5 = v4;

  sub_2177DF6D4(v3, v5);
  v7 = v6;
  *(_QWORD *)(v0 + 160) = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v9;
    *v9 = v0;
    v9[1] = sub_217842E70;
    return (id)sub_217843CB4((uint64_t)v8, *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 64));
  }
  v12 = qword_253F28DB8;
  *(_QWORD *)(v0 + 192) = qword_253F28DB8;
  if (!v12)
  {
    v10 = *(void **)(v0 + 136);
    sub_217788584();
    swift_allocError();
    goto LABEL_8;
  }
  v13 = qword_253F28DC0;
  *(_QWORD *)(v0 + 200) = qword_253F28DC0;
  *(_QWORD *)(v0 + 208) = *(_QWORD *)(v13 + 24);
  if (qword_253F25B38 != -1)
    swift_once();
  *(_QWORD *)(v0 + 216) = sub_21784819C();
  sub_217848160();
  return (id)swift_task_switch();
}

uint64_t sub_217842E18()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217842E70(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 176) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 289) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_217842EE8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 72);
  objc_msgSend(*(id *)(v0 + 160), sel_setCloudKitSyncState_, (*(_BYTE *)(v0 + 289) & 1) == 0);
  if (*(_QWORD *)(v1 + 56))
    v2 = (void *)sub_217847F74();
  else
    v2 = 0;
  v3 = *(_QWORD *)(v0 + 72);
  objc_msgSend(*(id *)(v0 + 160), sel_setCloudKitRecordID_, v2);

  if (*(_QWORD *)(v3 + 40))
    v4 = (void *)sub_217847F74();
  else
    v4 = 0;
  v5 = *(void **)(v0 + 160);
  objc_msgSend(v5, sel_setCloudKitRecordChangeTag_, v4);

  objc_msgSend(v5, sel_setCloudKitServerChangeTokenBlob_, 0);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v6;
  *v6 = v0;
  v6[1] = sub_217842FE4;
  return sub_2177E14AC((uint64_t)v5, *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
}

uint64_t sub_217842FE4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_217843038()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint8_t *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_253F26CA0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = sub_21776F584(v3, (uint64_t)qword_253F28FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  v6 = v1;
  v7 = sub_217847EC0();
  v8 = sub_217848280();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 160);
  if (!v9)
  {
    v18 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 80);
    v20 = *(_QWORD *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    goto LABEL_7;
  }
  v11 = (uint8_t *)swift_slowAlloc();
  v25 = swift_slowAlloc();
  v26 = v25;
  *(_DWORD *)v11 = 136315138;
  v12 = objc_msgSend(v10, sel_guid);
  v13 = *(void **)(v0 + 160);
  if (v12)
  {
    v14 = v12;
    v21 = *(_QWORD *)(v0 + 88);
    v22 = *(void **)(v0 + 136);
    v23 = *(_QWORD *)(v0 + 80);
    v24 = *(_QWORD *)(v0 + 112);
    v15 = sub_217847F98();
    v17 = v16;

    *(_QWORD *)(v0 + 56) = sub_2177D06AC(v15, v17, &v26);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_217765000, v7, v8, "Updated existing action item for %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v25, -1, -1);
    MEMORY[0x219A13268](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v23);
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(uint64_t))(v0 + 8))(1);
    return;
  }

  __break(1u);
}

uint64_t sub_2178432A0()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 290) = (*(uint64_t (**)(_QWORD))(v0 + 208))(*(_QWORD *)(v0 + 136)) & 1;
  return swift_task_switch();
}

void sub_2178432F0()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint8_t *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (*(_BYTE *)(v0 + 290) == 1)
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v1;
    *v1 = v0;
    v1[1] = sub_2178435B0;
    sub_2177E1F88(*(_QWORD *)(v0 + 136));
    return;
  }
  if (qword_253F26CA0 != -1)
    swift_once();
  v2 = *(void **)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = sub_21776F584(v5, (uint64_t)qword_253F28FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v7 = v2;
  v8 = sub_217847EC0();
  v9 = sub_217848298();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 136);
  if (!v10)
  {
    v20 = *(_QWORD *)(v0 + 88);
    v19 = *(_QWORD *)(v0 + 96);
    v21 = *(_QWORD *)(v0 + 80);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    goto LABEL_9;
  }
  v12 = (uint8_t *)swift_slowAlloc();
  v26 = swift_slowAlloc();
  v27 = v26;
  *(_DWORD *)v12 = 136315138;
  v13 = objc_msgSend(v11, sel_guid);
  v14 = *(void **)(v0 + 136);
  if (v13)
  {
    v15 = v13;
    v23 = *(_QWORD *)(v0 + 88);
    v24 = *(_QWORD *)(v0 + 80);
    v25 = *(_QWORD *)(v0 + 96);
    v16 = sub_217847F98();
    v18 = v17;

    *(_QWORD *)(v0 + 40) = sub_2177D06AC(v16, v18, &v27);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_217765000, v8, v9, "Should not store action record for %s, account or alias mismatch", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v26, -1, -1);
    MEMORY[0x219A13268](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
LABEL_9:
    v22 = *(void **)(v0 + 136);
    sub_21784444C();
    swift_allocError();
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }

  __break(1u);
}

uint64_t sub_2178435B0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_217843604()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint8_t *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  NSObject *v21;
  uint8_t *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (qword_253F26CA0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = sub_21776F584(v3, (uint64_t)qword_253F28FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  v6 = v1;
  v7 = sub_217847EC0();
  v8 = sub_217848280();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 136);
  if (v9)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v34 = v33;
    *(_DWORD *)v11 = 136315138;
    v12 = objc_msgSend(v10, sel_guid);
    v13 = *(void **)(v0 + 136);
    if (!v12)
    {

      __break(1u);
      return;
    }
    v14 = v12;
    v30 = *(_QWORD *)(v0 + 88);
    v31 = *(_QWORD *)(v0 + 80);
    v32 = *(_QWORD *)(v0 + 104);
    v15 = sub_217847F98();
    v17 = v16;

    *(_QWORD *)(v0 + 48) = sub_2177D06AC(v15, v17, &v34);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_217765000, v7, v8, "Created action item for %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A13268](v33, -1, -1);
    MEMORY[0x219A13268](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
    if (!*(_QWORD *)(v0 + 128))
      goto LABEL_6;
LABEL_9:
    v27 = qword_253F28DB8;
    *(_QWORD *)(v0 + 232) = qword_253F28DB8;
    if (v27)
    {
      v28 = qword_253F28DC0;
      *(_QWORD *)(v0 + 240) = qword_253F28DC0;
      *(_QWORD *)(v0 + 248) = *(_QWORD *)(v28 + 64);
      sub_217848160();
      swift_task_switch();
    }
    else
    {
      v29 = *(void **)(v0 + 136);
      sub_217788584();
      swift_allocError();
      swift_willThrow();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
    }
    return;
  }
  v24 = *(_QWORD *)(v0 + 104);
  v25 = *(_QWORD *)(v0 + 80);
  v26 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  if (*(_QWORD *)(v0 + 128))
    goto LABEL_9;
LABEL_6:
  v18 = sub_217847EC0();
  v19 = sub_217848298();
  v20 = os_log_type_enabled(v18, v19);
  v21 = *(NSObject **)(v0 + 136);
  if (v20)
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_217765000, v18, v19, "No parentChatID to add this message to", v22, 2u);
    MEMORY[0x219A13268](v22, -1, -1);
    v23 = v18;
  }
  else
  {
    v23 = *(NSObject **)(v0 + 136);
    v21 = v18;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_2178439D4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 248))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
  return swift_task_switch();
}

uint64_t sub_217843A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;

  v1 = qword_253F28DB8;
  *(_QWORD *)(v0 + 256) = qword_253F28DB8;
  if (v1)
  {
    v2 = qword_253F28DC0;
    *(_QWORD *)(v0 + 264) = qword_253F28DC0;
    if (qword_253F269A0 != -1)
      swift_once();
    swift_beginAccess();
    v3 = qword_253F28F98;
    if (*(_QWORD *)(qword_253F28F98 + 16))
    {
      v5 = *(_QWORD *)(v0 + 120);
      v4 = *(_QWORD *)(v0 + 128);
      swift_bridgeObjectRetain();
      v6 = sub_2177D0D64(v5, v4);
      if ((v7 & 1) != 0)
        v8 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
      else
        v8 = -1;
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -1;
    }
    *(_QWORD *)(v0 + 272) = v8;
    swift_endAccess();
    *(_QWORD *)(v0 + 280) = *(_QWORD *)(v2 + 72);
    sub_217848160();
    return swift_task_switch();
  }
  else
  {
    v9 = *(void **)(v0 + 136);
    sub_217788584();
    swift_allocError();
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_217843BB0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 280))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 272));
  return swift_task_switch();
}

uint64_t sub_217843BFC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_217843C50()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 160);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_217843CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;
  _QWORD *v8;

  v4[3] = a1;
  v4[4] = a2;
  v7 = sub_217847ED8();
  v4[5] = v7;
  v4[6] = *(_QWORD *)(v7 - 8);
  v4[7] = swift_task_alloc();
  v8 = (_QWORD *)swift_task_alloc();
  v4[8] = v8;
  *v8 = v4;
  v8[1] = sub_217843D50;
  v8[3] = a3;
  v8[4] = v3;
  v8[2] = a1;
  return swift_task_switch();
}

uint64_t sub_217843D50(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v5 + 8))(0);
  }
  else
  {
    *(_BYTE *)(v4 + 72) = a1 & 1;
    return swift_task_switch();
  }
}

void sub_217843DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint8_t *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (*(_BYTE *)(v0 + 72) != 1)
  {
    objc_opt_self();
    v18 = swift_dynamicCastObjCClass();
    if (v18)
    {
      v19 = (void *)v18;
      objc_opt_self();
      v20 = swift_dynamicCastObjCClass();
      if (v20)
      {
        v21 = (void *)v20;
        v22 = *(void **)(v0 + 24);
        v23 = *(id *)(v0 + 32);
        v24 = v22;
        v25 = objc_msgSend(v19, sel_messageSummaryInfo);
        if (v25)
        {

          v26 = objc_msgSend(v21, sel_messageSummaryInfo);
          v27 = *(void **)(v0 + 32);

          if (!v26)
          {
            v17 = 1;
            goto LABEL_16;
          }
        }
        else
        {
          v26 = *(id *)(v0 + 32);

        }
      }
    }
    v17 = 0;
    goto LABEL_16;
  }
  if (qword_253F26CA0 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v4 = *(void **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = sub_21776F584(v3, (uint64_t)qword_253F28FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  v6 = v4;
  v7 = sub_217847EC0();
  v8 = sub_21784828C();
  if (!os_log_type_enabled(v7, v8))
  {
    v29 = *(_QWORD *)(v0 + 48);
    v28 = *(_QWORD *)(v0 + 56);
    v31 = *(void **)(v0 + 32);
    v30 = *(_QWORD *)(v0 + 40);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    v17 = 1;
    goto LABEL_16;
  }
  v9 = *(void **)(v0 + 32);
  v10 = (uint8_t *)swift_slowAlloc();
  v35 = swift_slowAlloc();
  v36 = v35;
  *(_DWORD *)v10 = 136315138;
  v11 = objc_msgSend(v9, sel_guid);
  if (v11)
  {
    v12 = v11;
    v33 = *(_QWORD *)(v0 + 48);
    v34 = *(_QWORD *)(v0 + 56);
    v13 = *(void **)(v0 + 32);
    v32 = *(_QWORD *)(v0 + 40);
    v14 = sub_217847F98();
    v16 = v15;

    *(_QWORD *)(v0 + 16) = sub_2177D06AC(v14, v16, &v36);
    sub_2178484E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_217765000, v7, v8, "Bad chatID found in message %s, marking for resync", v10, 0xCu);
    v17 = 1;
    swift_arrayDestroy();
    MEMORY[0x219A13268](v35, -1, -1);
    MEMORY[0x219A13268](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v32);
LABEL_16:
    swift_task_dealloc();
    (*(void (**)(uint64_t))(v0 + 8))(v17);
    return;
  }

  __break(1u);
}

uint64_t sub_2178440D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2178440F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  char v27;
  char v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = type metadata accessor for ActionRecord();
  v3 = (uint64_t *)(v1 + *(int *)(v2 + 88));
  v4 = v3[1];
  if (!v4)
    goto LABEL_16;
  v5 = v2;
  v6 = *v3;
  v7 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  v8 = objc_msgSend(v7, sel_guid);
  if (!v8)
    goto LABEL_15;
  v9 = v8;
  v10 = *(_QWORD *)(v0 + 24);
  v11 = sub_217847F98();
  v13 = v12;

  if (!*(_QWORD *)(v10 + 16)
    || (v14 = sub_2177D0D64(v11, v13), (v15 & 1) == 0)
    || (v16 = *(void **)(v0 + 16),
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) + 56) + 8 * v14),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v18 = objc_msgSend(v16, sel_service)) == 0))
  {
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    v28 = 0;
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(v28 & 1);
  }
  v19 = v18;
  v20 = (id)*MEMORY[0x24BE50FF0];
  v21 = objc_msgSend(v20, sel_containsObject_, v19);

  if ((v21 & 1) != 0)
  {
    if (*(_QWORD *)(v17 + 16))
    {
      v22 = *(_QWORD *)(v17 + 40);
      v38 = *(_QWORD *)(v17 + 32);
      v23 = *(_QWORD *)(v17 + 64);
      v24 = *(_QWORD *)(v17 + 72);
      v25 = *(unsigned __int8 *)(v17 + 80);
      v26 = *(_BYTE *)(v17 + 81);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0 || v25 != 45)
      {
        if (v24)
        {
          if (v23 == v6 && v24 == v4)
          {
            v27 = 1;
            goto LABEL_32;
          }
LABEL_31:
          v27 = sub_2178488E0();
          goto LABEL_32;
        }
      }
      else if (v22)
      {
        if (v38 == v6 && v22 == v4)
        {
          v27 = 1;
LABEL_32:
          swift_bridgeObjectRelease();
          goto LABEL_33;
        }
        goto LABEL_31;
      }
      swift_bridgeObjectRelease();
      v27 = 0;
LABEL_33:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v28 = v27 ^ 1;
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(v28 & 1);
    }
    goto LABEL_14;
  }
  v30 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = v30 + *(int *)(v5 + 84);
  v32 = *(id *)v31;
  v28 = 1;
  if (*(_QWORD *)v31 != 1)
  {
    v33 = *(void **)(v31 + 24);
    if (v33)
    {
      v35 = *(void **)(v31 + 8);
      v34 = *(void **)(v31 + 16);
      sub_21782DF20(*(id *)v31, v35, v34, *(void **)(v31 + 24));
      v36 = v33;
      if (objc_msgSend(v36, sel_hasActualParentChatId))
      {
        v37 = objc_msgSend(v36, sel_actualParentChatId);

        if (v37)
        {

          goto LABEL_16;
        }
      }
      else
      {

      }
      v28 = 1;
    }
  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v28 & 1);
}

unint64_t sub_21784444C()
{
  unint64_t result;

  result = qword_254F035B8;
  if (!qword_254F035B8)
  {
    result = MEMORY[0x219A13184](&unk_217851124, &_s12ImportErrorsON_0);
    atomic_store(result, &qword_254F035B8);
  }
  return result;
}

uint64_t _s12ImportErrorsOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2178444D0 + 4 * byte_2178510A4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2178444F0 + 4 * byte_2178510A9[v4]))();
}

_BYTE *sub_2178444D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2178444F0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2178444F8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_217844500(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_217844508(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_217844510(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s12ImportErrorsOMa_0()
{
  return &_s12ImportErrorsON_0;
}

unint64_t sub_217844530()
{
  unint64_t result;

  result = qword_254F035D0[0];
  if (!qword_254F035D0[0])
  {
    result = MEMORY[0x219A13184](&unk_2178510FC, &_s12ImportErrorsON_0);
    atomic_store(result, qword_254F035D0);
  }
  return result;
}

uint64_t sub_217844574()
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

uint64_t *sub_2178445E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_217844650(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_217844660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_217844690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_2178446C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_2178446F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_217844720(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2178447D0 + 4 * byte_217851170[(v7 - 1)]))();
}

void sub_217844820(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for EquatableNoop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2177EFA44(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EquatableNoop);
}

uint64_t *sub_2178449DC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  int *v16;
  uint64_t v17;
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
  char *v28;
  _QWORD *v29;
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
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  char *__dst;
  char *v57;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    v9 = a2[7];
    a1[6] = a2[6];
    a1[7] = v9;
    v10 = a2[9];
    a1[8] = a2[8];
    a1[9] = v10;
    v11 = a2[11];
    v12 = a3[10];
    __dst = (char *)a1 + v12;
    v57 = (char *)a2 + v12;
    a1[10] = a2[10];
    a1[11] = v11;
    v13 = sub_217847E3C();
    v54 = *(_QWORD *)(v13 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v57, 1, v13))
    {
      v15 = sub_21776B790((uint64_t *)&unk_253F259D0);
      memcpy(__dst, v57, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      v16 = a3;
      v17 = v54;
    }
    else
    {
      v17 = v54;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(__dst, v57, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(__dst, 0, 1, v13);
      v16 = a3;
    }
    v19 = v16[11];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    if (v14((char *)a2 + v19, 1, v13))
    {
      v22 = sub_21776B790((uint64_t *)&unk_253F259D0);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v21, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v13);
    }
    v23 = v16[12];
    v24 = v16[13];
    v25 = (uint64_t *)((char *)v4 + v23);
    v26 = (uint64_t *)((char *)a2 + v23);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (char *)v4 + v24;
    v29 = (uint64_t *)((char *)a2 + v24);
    v30 = *(uint64_t *)((char *)a2 + v24 + 192);
    swift_bridgeObjectRetain();
    if (v30)
    {
      *v28 = *(_BYTE *)v29;
      *((_QWORD *)v28 + 1) = v29[1];
      v28[16] = *((_BYTE *)v29 + 16);
      v31 = v29[4];
      *((_QWORD *)v28 + 3) = v29[3];
      *((_QWORD *)v28 + 4) = v31;
      v32 = v29[6];
      *((_QWORD *)v28 + 5) = v29[5];
      *((_QWORD *)v28 + 6) = v32;
      v28[64] = *((_BYTE *)v29 + 64);
      *((_QWORD *)v28 + 7) = v29[7];
      v33 = v29[10];
      *((_QWORD *)v28 + 9) = v29[9];
      *((_QWORD *)v28 + 10) = v33;
      v28[88] = *((_BYTE *)v29 + 88);
      v34 = v29[13];
      *((_QWORD *)v28 + 12) = v29[12];
      *((_QWORD *)v28 + 13) = v34;
      v35 = v29[15];
      *((_QWORD *)v28 + 14) = v29[14];
      *((_QWORD *)v28 + 15) = v35;
      v28[128] = *((_BYTE *)v29 + 128);
      v36 = v29[18];
      *((_QWORD *)v28 + 17) = v29[17];
      *((_QWORD *)v28 + 18) = v36;
      v28[160] = *((_BYTE *)v29 + 160);
      *((_QWORD *)v28 + 19) = v29[19];
      v28[176] = *((_BYTE *)v29 + 176);
      *((_QWORD *)v28 + 21) = v29[21];
      *((_QWORD *)v28 + 23) = v29[23];
      *((_QWORD *)v28 + 24) = v30;
      v37 = v29[26];
      *((_QWORD *)v28 + 25) = v29[25];
      *((_QWORD *)v28 + 26) = v37;
      v38 = v29[28];
      *((_QWORD *)v28 + 27) = v29[27];
      *((_QWORD *)v28 + 28) = v38;
      v53 = v29[30];
      v55 = v29 + 29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v53 >> 60 == 15)
      {
        *(_OWORD *)(v28 + 232) = *(_OWORD *)v55;
      }
      else
      {
        v39 = *v55;
        sub_21776B7D0(*v55, v53);
        *((_QWORD *)v28 + 29) = v39;
        *((_QWORD *)v28 + 30) = v53;
      }
      v40 = v29 + 31;
      v41 = v29[32];
      if (v41 >> 60 == 15)
      {
        *(_OWORD *)(v28 + 248) = *(_OWORD *)v40;
      }
      else
      {
        v42 = *v40;
        sub_21776B7D0(*v40, v29[32]);
        *((_QWORD *)v28 + 31) = v42;
        *((_QWORD *)v28 + 32) = v41;
      }
      v43 = v29 + 33;
      v44 = v29[34];
      if (v44 >> 60 == 15)
      {
        *(_OWORD *)(v28 + 264) = *(_OWORD *)v43;
      }
      else
      {
        v45 = *v43;
        sub_21776B7D0(*v43, v29[34]);
        *((_QWORD *)v28 + 33) = v45;
        *((_QWORD *)v28 + 34) = v44;
      }
      *((_QWORD *)v28 + 35) = v29[35];
      v28[288] = *((_BYTE *)v29 + 288);
      v46 = v29[38];
      *((_QWORD *)v28 + 37) = v29[37];
      *((_QWORD *)v28 + 38) = v46;
      *((_QWORD *)v28 + 39) = v29[39];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = a3;
    }
    else
    {
      memcpy(v28, v29, 0x140uLL);
    }
    v47 = v16[14];
    v48 = (char *)v4 + v47;
    v49 = (char *)a2 + v47;
    v50 = *((_QWORD *)v49 + 1);
    if (v50 >> 60 == 15)
    {
      *(_OWORD *)v48 = *(_OWORD *)v49;
    }
    else
    {
      v51 = *(_QWORD *)v49;
      sub_21776B7D0(*(_QWORD *)v49, *((_QWORD *)v49 + 1));
      *(_QWORD *)v48 = v51;
      *((_QWORD *)v48 + 1) = v50;
    }
  }
  return v4;
}

uint64_t sub_217844E10(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[10];
  v5 = sub_217847E3C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + a2[11];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  result = swift_bridgeObjectRelease();
  v10 = (_QWORD *)(a1 + a2[13]);
  if (v10[24])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = v10[30];
    if (v11 >> 60 != 15)
      sub_21776BAD0(v10[29], v11);
    v12 = v10[32];
    if (v12 >> 60 != 15)
      sub_21776BAD0(v10[31], v12);
    v13 = v10[34];
    if (v13 >> 60 != 15)
      sub_21776BAD0(v10[33], v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v14 = (uint64_t *)(a1 + a2[14]);
  v15 = v14[1];
  if (v15 >> 60 != 15)
    return sub_21776BAD0(*v14, v15);
  return result;
}

_QWORD *sub_217844FCC(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
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
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  char *__dst;

  v5 = *((_QWORD *)a2 + 1);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *((_QWORD *)a2 + 3);
  a1[2] = *((_QWORD *)a2 + 2);
  a1[3] = v6;
  v7 = *((_QWORD *)a2 + 5);
  a1[4] = *((_QWORD *)a2 + 4);
  a1[5] = v7;
  v8 = *((_QWORD *)a2 + 7);
  a1[6] = *((_QWORD *)a2 + 6);
  a1[7] = v8;
  v9 = *((_QWORD *)a2 + 9);
  a1[8] = *((_QWORD *)a2 + 8);
  a1[9] = v9;
  v10 = *((_QWORD *)a2 + 11);
  v11 = a3[10];
  __dst = (char *)a1 + v11;
  v52 = &a2[v11];
  a1[10] = *((_QWORD *)a2 + 10);
  a1[11] = v10;
  v12 = sub_217847E3C();
  v54 = *(_QWORD *)(v12 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v52, 1, v12))
  {
    v14 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(__dst, v52, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    v15 = v54;
  }
  else
  {
    v15 = v54;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(__dst, v52, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(__dst, 0, 1, v12);
  }
  v16 = a3;
  v17 = a3[11];
  v18 = (char *)a1 + v17;
  v19 = &a2[v17];
  if (v13(&a2[v17], 1, v12))
  {
    v20 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v19, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v12);
  }
  v21 = a3[12];
  v22 = a3[13];
  v23 = (_QWORD *)((char *)a1 + v21);
  v24 = &a2[v21];
  v25 = *((_QWORD *)v24 + 1);
  *v23 = *(_QWORD *)v24;
  v23[1] = v25;
  v26 = (char *)a1 + v22;
  v27 = &a2[v22];
  v28 = *(_QWORD *)&a2[v22 + 192];
  swift_bridgeObjectRetain();
  if (v28)
  {
    *v26 = *v27;
    *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
    v26[16] = v27[16];
    v29 = *((_QWORD *)v27 + 4);
    *((_QWORD *)v26 + 3) = *((_QWORD *)v27 + 3);
    *((_QWORD *)v26 + 4) = v29;
    v30 = *((_QWORD *)v27 + 6);
    *((_QWORD *)v26 + 5) = *((_QWORD *)v27 + 5);
    *((_QWORD *)v26 + 6) = v30;
    v26[64] = v27[64];
    *((_QWORD *)v26 + 7) = *((_QWORD *)v27 + 7);
    v31 = *((_QWORD *)v27 + 10);
    *((_QWORD *)v26 + 9) = *((_QWORD *)v27 + 9);
    *((_QWORD *)v26 + 10) = v31;
    v26[88] = v27[88];
    v32 = *((_QWORD *)v27 + 13);
    *((_QWORD *)v26 + 12) = *((_QWORD *)v27 + 12);
    *((_QWORD *)v26 + 13) = v32;
    v33 = *((_QWORD *)v27 + 15);
    *((_QWORD *)v26 + 14) = *((_QWORD *)v27 + 14);
    *((_QWORD *)v26 + 15) = v33;
    v26[128] = v27[128];
    v34 = *((_QWORD *)v27 + 18);
    *((_QWORD *)v26 + 17) = *((_QWORD *)v27 + 17);
    *((_QWORD *)v26 + 18) = v34;
    v26[160] = v27[160];
    *((_QWORD *)v26 + 19) = *((_QWORD *)v27 + 19);
    v26[176] = v27[176];
    *((_QWORD *)v26 + 21) = *((_QWORD *)v27 + 21);
    *((_QWORD *)v26 + 23) = *((_QWORD *)v27 + 23);
    *((_QWORD *)v26 + 24) = v28;
    v35 = *((_QWORD *)v27 + 26);
    *((_QWORD *)v26 + 25) = *((_QWORD *)v27 + 25);
    *((_QWORD *)v26 + 26) = v35;
    v36 = *((_QWORD *)v27 + 28);
    *((_QWORD *)v26 + 27) = *((_QWORD *)v27 + 27);
    *((_QWORD *)v26 + 28) = v36;
    v51 = *((_QWORD *)v27 + 30);
    v53 = (uint64_t *)(v27 + 232);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v51 >> 60 == 15)
    {
      *(_OWORD *)(v26 + 232) = *(_OWORD *)v53;
    }
    else
    {
      v37 = *v53;
      sub_21776B7D0(*v53, v51);
      *((_QWORD *)v26 + 29) = v37;
      *((_QWORD *)v26 + 30) = v51;
    }
    v38 = (uint64_t *)(v27 + 248);
    v39 = *((_QWORD *)v27 + 32);
    if (v39 >> 60 == 15)
    {
      *(_OWORD *)(v26 + 248) = *(_OWORD *)v38;
    }
    else
    {
      v40 = *v38;
      sub_21776B7D0(*v38, *((_QWORD *)v27 + 32));
      *((_QWORD *)v26 + 31) = v40;
      *((_QWORD *)v26 + 32) = v39;
    }
    v41 = (uint64_t *)(v27 + 264);
    v42 = *((_QWORD *)v27 + 34);
    if (v42 >> 60 == 15)
    {
      *(_OWORD *)(v26 + 264) = *(_OWORD *)v41;
    }
    else
    {
      v43 = *v41;
      sub_21776B7D0(*v41, *((_QWORD *)v27 + 34));
      *((_QWORD *)v26 + 33) = v43;
      *((_QWORD *)v26 + 34) = v42;
    }
    *((_QWORD *)v26 + 35) = *((_QWORD *)v27 + 35);
    v26[288] = v27[288];
    v44 = *((_QWORD *)v27 + 38);
    *((_QWORD *)v26 + 37) = *((_QWORD *)v27 + 37);
    *((_QWORD *)v26 + 38) = v44;
    *((_QWORD *)v26 + 39) = *((_QWORD *)v27 + 39);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = a3;
  }
  else
  {
    memcpy(v26, v27, 0x140uLL);
  }
  v45 = v16[14];
  v46 = (char *)a1 + v45;
  v47 = &a2[v45];
  v48 = *((_QWORD *)v47 + 1);
  if (v48 >> 60 == 15)
  {
    *(_OWORD *)v46 = *(_OWORD *)v47;
  }
  else
  {
    v49 = *(_QWORD *)v47;
    sub_21776B7D0(*(_QWORD *)v47, *((_QWORD *)v47 + 1));
    *(_QWORD *)v46 = v49;
    *((_QWORD *)v46 + 1) = v48;
  }
  return a1;
}

char *sub_2178453D4(char *a1, _QWORD *a2, int *a3)
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
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v73;
  unint64_t v74;

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = a2[2];
  *((_QWORD *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = a2[4];
  *((_QWORD *)a1 + 5) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 6) = a2[6];
  *((_QWORD *)a1 + 7) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 8) = a2[8];
  *((_QWORD *)a1 + 9) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 10) = a2[10];
  *((_QWORD *)a1 + 11) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[10];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_217847E3C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[11];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    v20 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  v21 = a3[12];
  v22 = &a1[v21];
  v23 = (_QWORD *)((char *)a2 + v21);
  *(_QWORD *)v22 = *v23;
  *((_QWORD *)v22 + 1) = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[13];
  v25 = &a1[v24];
  v26 = (char *)a2 + v24;
  v27 = *(_QWORD *)&a1[v24 + 192];
  v28 = *(_QWORD *)((char *)a2 + v24 + 192);
  if (v27)
  {
    if (v28)
    {
      *v25 = *v26;
      v29 = *((_QWORD *)v26 + 1);
      v25[16] = v26[16];
      *((_QWORD *)v25 + 1) = v29;
      *((_QWORD *)v25 + 3) = *((_QWORD *)v26 + 3);
      *((_QWORD *)v25 + 4) = *((_QWORD *)v26 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v25 + 5) = *((_QWORD *)v26 + 5);
      *((_QWORD *)v25 + 6) = *((_QWORD *)v26 + 6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v30 = *((_QWORD *)v26 + 7);
      v25[64] = v26[64];
      *((_QWORD *)v25 + 7) = v30;
      *((_QWORD *)v25 + 9) = *((_QWORD *)v26 + 9);
      *((_QWORD *)v25 + 10) = *((_QWORD *)v26 + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v25[88] = v26[88];
      *((_QWORD *)v25 + 12) = *((_QWORD *)v26 + 12);
      *((_QWORD *)v25 + 13) = *((_QWORD *)v26 + 13);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v25 + 14) = *((_QWORD *)v26 + 14);
      *((_QWORD *)v25 + 15) = *((_QWORD *)v26 + 15);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v25[128] = v26[128];
      *((_QWORD *)v25 + 17) = *((_QWORD *)v26 + 17);
      *((_QWORD *)v25 + 18) = *((_QWORD *)v26 + 18);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v31 = *((_QWORD *)v26 + 19);
      v25[160] = v26[160];
      *((_QWORD *)v25 + 19) = v31;
      v32 = *((_QWORD *)v26 + 21);
      v25[176] = v26[176];
      *((_QWORD *)v25 + 21) = v32;
      *((_QWORD *)v25 + 23) = *((_QWORD *)v26 + 23);
      *((_QWORD *)v25 + 24) = *((_QWORD *)v26 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v25 + 25) = *((_QWORD *)v26 + 25);
      *((_QWORD *)v25 + 26) = *((_QWORD *)v26 + 26);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v25 + 27) = *((_QWORD *)v26 + 27);
      *((_QWORD *)v25 + 28) = *((_QWORD *)v26 + 28);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v33 = (uint64_t *)(v26 + 232);
      v34 = *((_QWORD *)v26 + 30);
      if (*((_QWORD *)v25 + 30) >> 60 == 15)
      {
        if (v34 >> 60 != 15)
        {
          v35 = *v33;
          sub_21776B7D0(*v33, *((_QWORD *)v26 + 30));
          *((_QWORD *)v25 + 29) = v35;
          *((_QWORD *)v25 + 30) = v34;
          goto LABEL_37;
        }
      }
      else
      {
        if (v34 >> 60 != 15)
        {
          v48 = *v33;
          sub_21776B7D0(*v33, *((_QWORD *)v26 + 30));
          v49 = *((_QWORD *)v25 + 29);
          v50 = *((_QWORD *)v25 + 30);
          *((_QWORD *)v25 + 29) = v48;
          *((_QWORD *)v25 + 30) = v34;
          sub_21776BAD0(v49, v50);
LABEL_37:
          v51 = (uint64_t *)(v26 + 248);
          v52 = *((_QWORD *)v26 + 32);
          if (*((_QWORD *)v25 + 32) >> 60 == 15)
          {
            if (v52 >> 60 != 15)
            {
              v53 = *v51;
              sub_21776B7D0(*v51, *((_QWORD *)v26 + 32));
              *((_QWORD *)v25 + 31) = v53;
              *((_QWORD *)v25 + 32) = v52;
              goto LABEL_44;
            }
          }
          else
          {
            if (v52 >> 60 != 15)
            {
              v54 = *v51;
              sub_21776B7D0(*v51, *((_QWORD *)v26 + 32));
              v55 = *((_QWORD *)v25 + 31);
              v56 = *((_QWORD *)v25 + 32);
              *((_QWORD *)v25 + 31) = v54;
              *((_QWORD *)v25 + 32) = v52;
              sub_21776BAD0(v55, v56);
LABEL_44:
              v57 = (uint64_t *)(v26 + 264);
              v58 = *((_QWORD *)v26 + 34);
              if (*((_QWORD *)v25 + 34) >> 60 == 15)
              {
                if (v58 >> 60 != 15)
                {
                  v59 = *v57;
                  sub_21776B7D0(*v57, *((_QWORD *)v26 + 34));
                  *((_QWORD *)v25 + 33) = v59;
                  *((_QWORD *)v25 + 34) = v58;
LABEL_51:
                  v63 = *((_QWORD *)v26 + 35);
                  v25[288] = v26[288];
                  *((_QWORD *)v25 + 35) = v63;
                  *((_QWORD *)v25 + 37) = *((_QWORD *)v26 + 37);
                  *((_QWORD *)v25 + 38) = *((_QWORD *)v26 + 38);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRelease();
                  *((_QWORD *)v25 + 39) = *((_QWORD *)v26 + 39);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRelease();
                  goto LABEL_52;
                }
              }
              else
              {
                if (v58 >> 60 != 15)
                {
                  v60 = *v57;
                  sub_21776B7D0(*v57, *((_QWORD *)v26 + 34));
                  v61 = *((_QWORD *)v25 + 33);
                  v62 = *((_QWORD *)v25 + 34);
                  *((_QWORD *)v25 + 33) = v60;
                  *((_QWORD *)v25 + 34) = v58;
                  sub_21776BAD0(v61, v62);
                  goto LABEL_51;
                }
                sub_21776CC68((uint64_t)(v25 + 264));
              }
              *(_OWORD *)(v25 + 264) = *(_OWORD *)v57;
              goto LABEL_51;
            }
            sub_21776CC68((uint64_t)(v25 + 248));
          }
          *(_OWORD *)(v25 + 248) = *(_OWORD *)v51;
          goto LABEL_44;
        }
        sub_21776CC68((uint64_t)(v25 + 232));
      }
      *(_OWORD *)(v25 + 232) = *(_OWORD *)v33;
      goto LABEL_37;
    }
    sub_217845CAC((uint64_t *)v25);
LABEL_22:
    memcpy(v25, v26, 0x140uLL);
    goto LABEL_52;
  }
  if (!v28)
    goto LABEL_22;
  *v25 = *v26;
  v36 = *((_QWORD *)v26 + 1);
  v25[16] = v26[16];
  *((_QWORD *)v25 + 1) = v36;
  *((_QWORD *)v25 + 3) = *((_QWORD *)v26 + 3);
  *((_QWORD *)v25 + 4) = *((_QWORD *)v26 + 4);
  *((_QWORD *)v25 + 5) = *((_QWORD *)v26 + 5);
  *((_QWORD *)v25 + 6) = *((_QWORD *)v26 + 6);
  v37 = *((_QWORD *)v26 + 7);
  v25[64] = v26[64];
  *((_QWORD *)v25 + 7) = v37;
  *((_QWORD *)v25 + 9) = *((_QWORD *)v26 + 9);
  *((_QWORD *)v25 + 10) = *((_QWORD *)v26 + 10);
  v25[88] = v26[88];
  *((_QWORD *)v25 + 12) = *((_QWORD *)v26 + 12);
  *((_QWORD *)v25 + 13) = *((_QWORD *)v26 + 13);
  *((_QWORD *)v25 + 14) = *((_QWORD *)v26 + 14);
  *((_QWORD *)v25 + 15) = *((_QWORD *)v26 + 15);
  v25[128] = v26[128];
  *((_QWORD *)v25 + 17) = *((_QWORD *)v26 + 17);
  *((_QWORD *)v25 + 18) = *((_QWORD *)v26 + 18);
  v38 = *((_QWORD *)v26 + 19);
  v25[160] = v26[160];
  *((_QWORD *)v25 + 19) = v38;
  v39 = *((_QWORD *)v26 + 21);
  v25[176] = v26[176];
  *((_QWORD *)v25 + 21) = v39;
  *((_QWORD *)v25 + 23) = *((_QWORD *)v26 + 23);
  *((_QWORD *)v25 + 24) = *((_QWORD *)v26 + 24);
  *((_QWORD *)v25 + 25) = *((_QWORD *)v26 + 25);
  *((_QWORD *)v25 + 26) = *((_QWORD *)v26 + 26);
  *((_QWORD *)v25 + 27) = *((_QWORD *)v26 + 27);
  *((_QWORD *)v25 + 28) = *((_QWORD *)v26 + 28);
  v73 = (uint64_t *)(v26 + 232);
  v74 = *((_QWORD *)v26 + 30);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v74 >> 60 == 15)
  {
    *(_OWORD *)(v25 + 232) = *(_OWORD *)v73;
  }
  else
  {
    v40 = *v73;
    sub_21776B7D0(*v73, v74);
    *((_QWORD *)v25 + 29) = v40;
    *((_QWORD *)v25 + 30) = v74;
  }
  v41 = (uint64_t *)(v26 + 248);
  v42 = *((_QWORD *)v26 + 32);
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)(v25 + 248) = *(_OWORD *)v41;
  }
  else
  {
    v43 = *v41;
    sub_21776B7D0(*v41, *((_QWORD *)v26 + 32));
    *((_QWORD *)v25 + 31) = v43;
    *((_QWORD *)v25 + 32) = v42;
  }
  v44 = (uint64_t *)(v26 + 264);
  v45 = *((_QWORD *)v26 + 34);
  if (v45 >> 60 == 15)
  {
    *(_OWORD *)(v25 + 264) = *(_OWORD *)v44;
  }
  else
  {
    v46 = *v44;
    sub_21776B7D0(*v44, *((_QWORD *)v26 + 34));
    *((_QWORD *)v25 + 33) = v46;
    *((_QWORD *)v25 + 34) = v45;
  }
  v47 = *((_QWORD *)v26 + 35);
  v25[288] = v26[288];
  *((_QWORD *)v25 + 35) = v47;
  *((_QWORD *)v25 + 37) = *((_QWORD *)v26 + 37);
  *((_QWORD *)v25 + 38) = *((_QWORD *)v26 + 38);
  *((_QWORD *)v25 + 39) = *((_QWORD *)v26 + 39);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_52:
  v64 = a3[14];
  v65 = (uint64_t *)&a1[v64];
  v66 = (_QWORD *)((char *)a2 + v64);
  v67 = *(_QWORD *)((char *)a2 + v64 + 8);
  if (*(_QWORD *)&a1[v64 + 8] >> 60 != 15)
  {
    if (v67 >> 60 != 15)
    {
      v69 = *v66;
      sub_21776B7D0(v69, v67);
      v70 = *v65;
      v71 = v65[1];
      *v65 = v69;
      v65[1] = v67;
      sub_21776BAD0(v70, v71);
      return a1;
    }
    sub_21776CC68((uint64_t)v65);
    goto LABEL_57;
  }
  if (v67 >> 60 == 15)
  {
LABEL_57:
    *(_OWORD *)v65 = *(_OWORD *)v66;
    return a1;
  }
  v68 = *v66;
  sub_21776B7D0(v68, v67);
  *v65 = v68;
  v65[1] = v67;
  return a1;
}

uint64_t *sub_217845CAC(uint64_t *a1)
{
  destroy for AttachmentMetadata(a1);
  return a1;
}

_OWORD *sub_217845CE0(_OWORD *a1, char *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *((_OWORD *)a2 + 1);
  *a1 = *(_OWORD *)a2;
  a1[1] = v6;
  v7 = *((_OWORD *)a2 + 3);
  a1[2] = *((_OWORD *)a2 + 2);
  a1[3] = v7;
  v8 = *((_OWORD *)a2 + 5);
  v9 = a3[10];
  v10 = (char *)a1 + v9;
  v11 = &a2[v9];
  a1[4] = *((_OWORD *)a2 + 4);
  a1[5] = v8;
  v12 = sub_217847E3C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    v15 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v16 = a3[11];
  v17 = (char *)a1 + v16;
  v18 = &a2[v16];
  if (v14(&a2[v16], 1, v12))
  {
    v19 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v18, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
  }
  v20 = a3[13];
  *(_OWORD *)((char *)a1 + a3[12]) = *(_OWORD *)&a2[a3[12]];
  memcpy((char *)a1 + v20, &a2[v20], 0x140uLL);
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)&a2[a3[14]];
  return a1;
}

char *sub_217845E54(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v6 = a2[1];
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  *((_QWORD *)a1 + 2) = a2[2];
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  *((_QWORD *)a1 + 4) = a2[4];
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  *((_QWORD *)a1 + 6) = a2[6];
  *((_QWORD *)a1 + 7) = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  *((_QWORD *)a1 + 8) = a2[8];
  *((_QWORD *)a1 + 9) = v10;
  swift_bridgeObjectRelease();
  v11 = a2[11];
  *((_QWORD *)a1 + 10) = a2[10];
  *((_QWORD *)a1 + 11) = v11;
  swift_bridgeObjectRelease();
  v12 = a3[10];
  v13 = &a1[v12];
  v14 = (char *)a2 + v12;
  v15 = sub_217847E3C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  v21 = a3[11];
  v22 = &a1[v21];
  v23 = (char *)a2 + v21;
  v24 = v17(&a1[v21], 1, v15);
  v25 = v17(v23, 1, v15);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v23, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    v26 = sub_21776B790((uint64_t *)&unk_253F259D0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v22, v23, v15);
LABEL_13:
  v27 = a3[12];
  v28 = &a1[v27];
  v29 = (_QWORD *)((char *)a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *(_QWORD *)v28 = v31;
  *((_QWORD *)v28 + 1) = v30;
  swift_bridgeObjectRelease();
  v32 = a3[13];
  v33 = &a1[v32];
  v34 = (char *)a2 + v32;
  if (!*(_QWORD *)&a1[v32 + 192])
  {
LABEL_20:
    memcpy(v33, v34, 0x140uLL);
    goto LABEL_35;
  }
  if (!*((_QWORD *)v34 + 24))
  {
    sub_217845CAC((uint64_t *)v33);
    goto LABEL_20;
  }
  *v33 = *v34;
  *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
  v33[16] = v34[16];
  v35 = *((_QWORD *)v34 + 4);
  *((_QWORD *)v33 + 3) = *((_QWORD *)v34 + 3);
  *((_QWORD *)v33 + 4) = v35;
  swift_bridgeObjectRelease();
  v36 = *((_QWORD *)v34 + 6);
  *((_QWORD *)v33 + 5) = *((_QWORD *)v34 + 5);
  *((_QWORD *)v33 + 6) = v36;
  swift_bridgeObjectRelease();
  *((_QWORD *)v33 + 7) = *((_QWORD *)v34 + 7);
  v33[64] = v34[64];
  v37 = *((_QWORD *)v34 + 10);
  *((_QWORD *)v33 + 9) = *((_QWORD *)v34 + 9);
  *((_QWORD *)v33 + 10) = v37;
  swift_bridgeObjectRelease();
  v33[88] = v34[88];
  v38 = *((_QWORD *)v34 + 13);
  *((_QWORD *)v33 + 12) = *((_QWORD *)v34 + 12);
  *((_QWORD *)v33 + 13) = v38;
  swift_bridgeObjectRelease();
  v39 = *((_QWORD *)v34 + 15);
  *((_QWORD *)v33 + 14) = *((_QWORD *)v34 + 14);
  *((_QWORD *)v33 + 15) = v39;
  swift_bridgeObjectRelease();
  v33[128] = v34[128];
  v40 = *((_QWORD *)v34 + 18);
  *((_QWORD *)v33 + 17) = *((_QWORD *)v34 + 17);
  *((_QWORD *)v33 + 18) = v40;
  swift_bridgeObjectRelease();
  *((_QWORD *)v33 + 19) = *((_QWORD *)v34 + 19);
  v33[160] = v34[160];
  *((_QWORD *)v33 + 21) = *((_QWORD *)v34 + 21);
  v33[176] = v34[176];
  v41 = *((_QWORD *)v34 + 24);
  *((_QWORD *)v33 + 23) = *((_QWORD *)v34 + 23);
  *((_QWORD *)v33 + 24) = v41;
  swift_bridgeObjectRelease();
  v42 = *((_QWORD *)v34 + 26);
  *((_QWORD *)v33 + 25) = *((_QWORD *)v34 + 25);
  *((_QWORD *)v33 + 26) = v42;
  swift_bridgeObjectRelease();
  v43 = *((_QWORD *)v34 + 28);
  *((_QWORD *)v33 + 27) = *((_QWORD *)v34 + 27);
  *((_QWORD *)v33 + 28) = v43;
  swift_bridgeObjectRelease();
  v44 = v34 + 232;
  v45 = *((_QWORD *)v33 + 30);
  if (v45 >> 60 == 15)
  {
LABEL_18:
    *(_OWORD *)(v33 + 232) = *v44;
    goto LABEL_24;
  }
  v46 = *((_QWORD *)v34 + 30);
  if (v46 >> 60 == 15)
  {
    sub_21776CC68((uint64_t)(v33 + 232));
    goto LABEL_18;
  }
  v47 = *((_QWORD *)v33 + 29);
  *((_QWORD *)v33 + 29) = *(_QWORD *)v44;
  *((_QWORD *)v33 + 30) = v46;
  sub_21776BAD0(v47, v45);
LABEL_24:
  v48 = v34 + 248;
  v49 = *((_QWORD *)v33 + 32);
  if (v49 >> 60 == 15)
  {
LABEL_27:
    *(_OWORD *)(v33 + 248) = *v48;
    goto LABEL_29;
  }
  v50 = *((_QWORD *)v34 + 32);
  if (v50 >> 60 == 15)
  {
    sub_21776CC68((uint64_t)(v33 + 248));
    goto LABEL_27;
  }
  v51 = *((_QWORD *)v33 + 31);
  *((_QWORD *)v33 + 31) = *(_QWORD *)v48;
  *((_QWORD *)v33 + 32) = v50;
  sub_21776BAD0(v51, v49);
LABEL_29:
  v52 = v34 + 264;
  v53 = *((_QWORD *)v33 + 34);
  if (v53 >> 60 != 15)
  {
    v54 = *((_QWORD *)v34 + 34);
    if (v54 >> 60 != 15)
    {
      v55 = *((_QWORD *)v33 + 33);
      *((_QWORD *)v33 + 33) = *v52;
      *((_QWORD *)v33 + 34) = v54;
      sub_21776BAD0(v55, v53);
      goto LABEL_34;
    }
    sub_21776CC68((uint64_t)(v33 + 264));
  }
  *(_OWORD *)(v33 + 264) = *(_OWORD *)v52;
LABEL_34:
  *((_QWORD *)v33 + 35) = *((_QWORD *)v34 + 35);
  v33[288] = v34[288];
  v56 = *((_QWORD *)v34 + 38);
  *((_QWORD *)v33 + 37) = *((_QWORD *)v34 + 37);
  *((_QWORD *)v33 + 38) = v56;
  swift_bridgeObjectRelease();
  *((_QWORD *)v33 + 39) = *((_QWORD *)v34 + 39);
  swift_bridgeObjectRelease();
LABEL_35:
  v57 = a3[14];
  v58 = (uint64_t *)&a1[v57];
  v59 = (_QWORD *)((char *)a2 + v57);
  v60 = *(_QWORD *)&a1[v57 + 8];
  if (v60 >> 60 != 15)
  {
    v61 = v59[1];
    if (v61 >> 60 != 15)
    {
      v62 = *v58;
      *v58 = *v59;
      v58[1] = v61;
      sub_21776BAD0(v62, v60);
      return a1;
    }
    sub_21776CC68((uint64_t)v58);
  }
  *(_OWORD *)v58 = *(_OWORD *)v59;
  return a1;
}

uint64_t sub_217846318()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_217846324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_21776B790((uint64_t *)&unk_253F259D0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v9);
  }
}

uint64_t sub_2178463B0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2178463BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = sub_21776B790((uint64_t *)&unk_253F259D0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AttachmentRecord()
{
  uint64_t result;

  result = qword_253F26AD0;
  if (!qword_253F26AD0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_217846470()
{
  unint64_t v0;

  sub_21776DC78();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_217846504@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[3];
  int *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t *v43;
  __int128 v44;
  _BYTE v45[320];
  _BYTE v46[344];

  v36 = a2;
  v3 = sub_21776B790((uint64_t *)&unk_253F259D0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (uint64_t)v32 - v6;
  v7 = sub_21776B790(&qword_253F26F58);
  v39 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21776B790(&qword_254F03668);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AttachmentRecord();
  MEMORY[0x24BDAC7A8](v13);
  v43 = (_QWORD *)((char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21776E3A4(a1, a1[3]);
  sub_2178471F8();
  v15 = v42;
  sub_2178489B8();
  if (v15)
    return _s17MessagesCloudSync9SyncFilesVwxx_0((uint64_t)a1);
  v34 = v12;
  v35 = v10;
  v42 = v9;
  v33 = (int *)v13;
  sub_21776E3A4(a1, a1[3]);
  sub_21776E3C8();
  v16 = v41;
  sub_2178489B8();
  v46[0] = 0;
  v17 = sub_2178487A8();
  v18 = v43;
  *v43 = v17;
  v18[1] = v19;
  v46[0] = 1;
  v18[2] = sub_2178487A8();
  v18[3] = v20;
  v46[0] = 2;
  v18[4] = sub_2178487A8();
  v18[5] = v21;
  v46[0] = 3;
  v18[6] = sub_2178487A8();
  v18[7] = v22;
  v46[0] = 4;
  v18[8] = sub_2178487A8();
  v18[9] = v23;
  v46[0] = 5;
  v18[10] = sub_2178487A8();
  v18[11] = v24;
  v32[2] = sub_217847E3C();
  v46[0] = 6;
  v32[1] = sub_21776DD28(&qword_253F26948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_2178487CC();
  v25 = v33;
  sub_21776EDF8(v38, (uint64_t)v18 + v33[10], (uint64_t *)&unk_253F259D0);
  v46[0] = 7;
  v26 = (uint64_t)v37;
  sub_2178487CC();
  sub_21776EDF8(v26, (uint64_t)v18 + v25[11], (uint64_t *)&unk_253F259D0);
  v46[0] = 8;
  v27 = sub_2178487A8();
  v28 = (uint64_t *)((char *)v43 + v33[12]);
  *v28 = v27;
  v28[1] = v29;
  v46[343] = 0;
  sub_2178472C4();
  sub_2178487CC();
  sub_21776EDF8((uint64_t)v46, (uint64_t)v45, &qword_254F02340);
  sub_21776EDF8((uint64_t)v45, (uint64_t)v43 + v33[13], &qword_254F02340);
  v46[342] = 1;
  sub_21776EE3C();
  sub_2178487CC();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v40);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v42);
  v30 = (uint64_t)v43;
  *(_OWORD *)((char *)v43 + v33[14]) = v44;
  sub_2177BF2C0(v30, v36);
  _s17MessagesCloudSync9SyncFilesVwxx_0(0);
  return sub_2177EBDCC(v30);
}

uint64_t sub_217846D48@<X0>(uint64_t a1@<X8>)
{
  return sub_217846D68(6386028, 0xE300000000000000, a1);
}

uint64_t sub_217846D58@<X0>(uint64_t a1@<X8>)
{
  return sub_217846D68(1684633185, 0xE400000000000000, a1);
}

uint64_t sub_217846D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v10;
  _BYTE v11[320];
  _BYTE v12[312];
  uint64_t v13;

  v7 = type metadata accessor for AttachmentRecord();
  sub_21776EDF8(v3 + *(int *)(v7 + 52), (uint64_t)v11, &qword_254F02340);
  sub_21776EDF8((uint64_t)v11, (uint64_t)v12, &qword_254F02340);
  if (sub_2177BF26C((uint64_t)v12) != 1 && v13 && *(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    sub_2177D0D64(a1, a2);
    if ((v8 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_217847D40();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v10 = sub_217847D64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a3, 1, 1, v10);
}

uint64_t sub_217846E88(char *a1, char *a2)
{
  return sub_2178185F8(*a1, *a2);
}

uint64_t sub_217846E94()
{
  sub_21784897C();
  sub_217848004();
  swift_bridgeObjectRelease();
  return sub_2178489A0();
}

uint64_t sub_217846F18()
{
  sub_217848004();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217846F78()
{
  sub_21784897C();
  sub_217848004();
  swift_bridgeObjectRelease();
  return sub_2178489A0();
}

uint64_t sub_217846FF8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_217848790();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_217847054(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x617461646174656DLL;
  if (*v1)
    v2 = 0xD000000000000017;
  v3 = 0x80000002178517F0;
  if (!*v1)
    v3 = 0xE800000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_217847098()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000017;
  else
    return 0x617461646174656DLL;
}

uint64_t sub_2178470D8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_217848790();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_217847138()
{
  sub_2178471F8();
  return sub_2178489D0();
}

uint64_t sub_217847160()
{
  sub_2178471F8();
  return sub_2178489DC();
}

uint64_t sub_217847188@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217846504(a1, a2);
}

uint64_t sub_21784719C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_21776DD28(&qword_254F03658, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentRecord, (uint64_t)&unk_217851288);
  result = sub_21776DD28(&qword_254F03660, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentRecord, (uint64_t)&unk_217851260);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2178471F8()
{
  unint64_t result;

  result = qword_254F03670;
  if (!qword_254F03670)
  {
    result = MEMORY[0x219A13184](&unk_2178513C8, &type metadata for AttachmentRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03670);
  }
  return result;
}

uint64_t sub_21784723C(uint64_t a1)
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(a1 + 240);
  v4 = *(_OWORD *)(a1 + 256);
  sub_2177EBFBC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    *(_QWORD *)(a1 + 272));
  return a1;
}

unint64_t sub_2178472C4()
{
  unint64_t result;

  result = qword_254F03678;
  if (!qword_254F03678)
  {
    result = MEMORY[0x219A13184](&unk_21784ECBC, &type metadata for AttachmentMetadata);
    atomic_store(result, (unint64_t *)&qword_254F03678);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AttachmentRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_217847354 + 4 * byte_2178511F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_217847388 + 4 * asc_2178511F0[v4]))();
}

uint64_t sub_217847388(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217847390(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217847398);
  return result;
}

uint64_t sub_2178473A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2178473ACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2178473B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2178473B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttachmentRecord.CodingKeys()
{
  return &type metadata for AttachmentRecord.CodingKeys;
}

unint64_t sub_2178473D8()
{
  unint64_t result;

  result = qword_254F03680;
  if (!qword_254F03680)
  {
    result = MEMORY[0x219A13184](&unk_2178513A0, &type metadata for AttachmentRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03680);
  }
  return result;
}

unint64_t sub_217847420()
{
  unint64_t result;

  result = qword_254F03688;
  if (!qword_254F03688)
  {
    result = MEMORY[0x219A13184](&unk_2178512D8, &type metadata for AttachmentRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03688);
  }
  return result;
}

unint64_t sub_217847468()
{
  unint64_t result;

  result = qword_254F03690;
  if (!qword_254F03690)
  {
    result = MEMORY[0x219A13184](&unk_217851300, &type metadata for AttachmentRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254F03690);
  }
  return result;
}

uint64_t sub_2178474AC()
{
  uint64_t result;

  sub_21784819C();
  result = sub_217848190();
  qword_253F25B30 = result;
  return result;
}

uint64_t static CloudSyncWorkActor.shared.getter()
{
  if (qword_253F25B38 != -1)
    swift_once();
  return swift_retain();
}

uint64_t CloudSyncWorkActor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CloudSyncWorkActor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_217847534()
{
  return MEMORY[0x24BEE6930];
}

uint64_t sub_217847540()
{
  if (qword_253F25B38 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_217847580()
{
  return sub_2178485C8();
}

uint64_t type metadata accessor for CloudSyncWorkActor()
{
  return objc_opt_self();
}

uint64_t method lookup function for CloudSyncWorkActor()
{
  return swift_lookUpClassMethod();
}

void sub_2178475B4(char *a1)
{
  sub_2178190F8(*a1);
}

void sub_2178475C0()
{
  char *v0;

  sub_21777F5B8(*v0);
}

void sub_2178475C8()
{
  __asm { BR              X10 }
}

uint64_t sub_217847610()
{
  sub_217848004();
  return swift_bridgeObjectRelease();
}

void sub_21784767C(uint64_t a1)
{
  char *v1;

  sub_2177CBE08(a1, *v1);
}

uint64_t sub_217847684@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2178479F8();
  *a1 = result;
  return result;
}

uint64_t sub_2178476B0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2178476EC + 4 * byte_217851494[*v0]))();
}

void sub_2178476EC(_QWORD *a1@<X8>)
{
  *a1 = 0x546E657474697277;
  a1[1] = 0xEF64756F6C43696FLL;
}

void sub_217847714(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000217851F00;
}

void sub_217847734(_QWORD *a1@<X8>)
{
  *a1 = 0x646574726F706D69;
  a1[1] = 0xE800000000000000;
}

uint64_t storeEnumTagSinglePayload for SyncAction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21784779C + 4 * byte_21785149D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2178477D0 + 4 * byte_217851498[v4]))();
}

uint64_t sub_2178477D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2178477D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2178477E0);
  return result;
}

uint64_t sub_2178477EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2178477F4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2178477F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217847800(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncAction()
{
  return &type metadata for SyncAction;
}

uint64_t sub_21784781C()
{
  sub_2178479B4();
  return sub_21784807C();
}

uint64_t sub_217847878()
{
  sub_2178479B4();
  return sub_217848070();
}

uint64_t sub_2178478C4()
{
  sub_2178479B4();
  return sub_2178480A0();
}

uint64_t sub_217847904()
{
  sub_2178479B4();
  return sub_2178480AC();
}

unint64_t sub_217847970()
{
  unint64_t result;

  result = qword_253F25AF8;
  if (!qword_253F25AF8)
  {
    result = MEMORY[0x219A13184](&unk_217851568, &type metadata for SyncAction);
    atomic_store(result, (unint64_t *)&qword_253F25AF8);
  }
  return result;
}

unint64_t sub_2178479B4()
{
  unint64_t result;

  result = qword_253F25B00;
  if (!qword_253F25B00)
  {
    result = MEMORY[0x219A13184](&unk_2178514F0, &type metadata for SyncAction);
    atomic_store(result, (unint64_t *)&qword_253F25B00);
  }
  return result;
}

uint64_t sub_2178479F8()
{
  unint64_t v0;

  v0 = sub_217848790();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_217847A40()
{
  return MEMORY[0x24BEE0948];
}

id sub_217847A4C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_217847F74();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_217847AB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_217848634();
  *a1 = result;
  return result;
}

id sub_217847AE0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_217847F74();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_217847B48()
{
  return MEMORY[0x24BDCADE8]();
}

uint64_t sub_217847B54()
{
  return MEMORY[0x24BDCAEB0]();
}

uint64_t sub_217847B60()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_217847B6C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_217847B78()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_217847B84()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_217847B90()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_217847B9C()
{
  return MEMORY[0x24BDCB8D8]();
}

uint64_t sub_217847BA8()
{
  return MEMORY[0x24BDCB8F0]();
}

uint64_t sub_217847BB4()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_217847BC0()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_217847BCC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_217847BD8()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_217847BE4()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_217847BF0()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_217847BFC()
{
  return MEMORY[0x24BDCC930]();
}

uint64_t sub_217847C08()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_217847C14()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_217847C20()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_217847C2C()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_217847C38()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_217847C44()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_217847C50()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_217847C5C()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_217847C68()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_217847C74()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_217847C80()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_217847C8C()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_217847C98()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_217847CA4()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_217847CB0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_217847CBC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_217847CC8()
{
  return MEMORY[0x24BDCD770]();
}

uint64_t sub_217847CD4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_217847CE0()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_217847CEC()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_217847CF8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_217847D04()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_217847D10()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_217847D1C()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_217847D28()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_217847D34()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_217847D40()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_217847D4C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_217847D58()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_217847D64()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_217847D70()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_217847D7C()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_217847D88()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_217847D94()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_217847DA0()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_217847DAC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_217847DB8()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_217847DC4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_217847DD0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_217847DDC()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_217847DE8()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_217847DF4()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_217847E00()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_217847E0C()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_217847E18()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_217847E24()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_217847E30()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_217847E3C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_217847E48()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_217847E54()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_217847E60()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_217847E6C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_217847E78()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_217847E84()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_217847E90()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_217847E9C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_217847EA8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_217847EB4()
{
  return MEMORY[0x24BE50B00]();
}

uint64_t sub_217847EC0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_217847ECC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_217847ED8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_217847EE4()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_217847EF0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_217847EFC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_217847F08()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_217847F14()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_217847F20()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_217847F2C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_217847F38()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_217847F44()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_217847F50()
{
  return MEMORY[0x24BEE06C8]();
}

uint64_t sub_217847F5C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_217847F68()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_217847F74()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_217847F80()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_217847F8C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_217847F98()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_217847FA4()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_217847FB0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_217847FBC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_217847FC8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_217847FD4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_217847FE0()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_217847FEC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_217847FF8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_217848004()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_217848010()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21784801C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_217848028()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_217848034()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_217848040()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21784804C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_217848058()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_217848064()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_217848070()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_21784807C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_217848088()
{
  return MEMORY[0x24BEE10A0]();
}

uint64_t sub_217848094()
{
  return MEMORY[0x24BEE10C8]();
}

uint64_t sub_2178480A0()
{
  return MEMORY[0x24BEE10E8]();
}

uint64_t sub_2178480AC()
{
  return MEMORY[0x24BEE10F0]();
}

uint64_t sub_2178480B8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2178480C4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2178480D0()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2178480DC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2178480E8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2178480F4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_217848100()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_21784810C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_217848118()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_217848124()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_217848130()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_21784813C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_217848148()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_217848154()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_217848160()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21784816C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_217848178()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_217848184()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_217848190()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21784819C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2178481A8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2178481B4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2178481C0()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_2178481CC()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_2178481D8()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_2178481E4()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_2178481F0()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_2178481FC()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_217848208()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_217848214()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_217848220()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_21784822C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_217848238()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_217848244()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_217848250()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_21784825C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_217848268()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_217848274()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_217848280()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21784828C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_217848298()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2178482A4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2178482B0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2178482BC()
{
  return MEMORY[0x24BDB8D38]();
}

uint64_t sub_2178482C8()
{
  return MEMORY[0x24BDB8D50]();
}

uint64_t sub_2178482D4()
{
  return MEMORY[0x24BDB8D58]();
}

uint64_t sub_2178482E0()
{
  return MEMORY[0x24BDB8D60]();
}

uint64_t sub_2178482EC()
{
  return MEMORY[0x24BDBB328]();
}

uint64_t sub_2178482F8()
{
  return MEMORY[0x24BDBB330]();
}

uint64_t sub_217848304()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_217848310()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21784831C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_217848328()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_217848334()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_217848340()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21784834C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_217848358()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_217848364()
{
  return MEMORY[0x24BDBB378]();
}

uint64_t sub_217848370()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_21784837C()
{
  return MEMORY[0x24BDBB398]();
}

uint64_t sub_217848388()
{
  return MEMORY[0x24BDB8D78]();
}

uint64_t sub_217848394()
{
  return MEMORY[0x24BDB8D80]();
}

uint64_t sub_2178483A0()
{
  return MEMORY[0x24BDB8D88]();
}

uint64_t sub_2178483AC()
{
  return MEMORY[0x24BDB8DA0]();
}

uint64_t sub_2178483B8()
{
  return MEMORY[0x24BDB8DA8]();
}

uint64_t sub_2178483C4()
{
  return MEMORY[0x24BDB8DB0]();
}

uint64_t sub_2178483D0()
{
  return MEMORY[0x24BDB8DB8]();
}

uint64_t sub_2178483DC()
{
  return MEMORY[0x24BDB8DC0]();
}

uint64_t sub_2178483E8()
{
  return MEMORY[0x24BDB8DC8]();
}

uint64_t sub_2178483F4()
{
  return MEMORY[0x24BDB8DD0]();
}

uint64_t sub_217848400()
{
  return MEMORY[0x24BDB8DD8]();
}

uint64_t sub_21784840C()
{
  return MEMORY[0x24BDBB3C0]();
}

uint64_t sub_217848418()
{
  return MEMORY[0x24BDB8DE8]();
}

uint64_t sub_217848424()
{
  return MEMORY[0x24BDB8DF0]();
}

uint64_t sub_217848430()
{
  return MEMORY[0x24BDB8DF8]();
}

uint64_t sub_21784843C()
{
  return MEMORY[0x24BDB8E00]();
}

uint64_t sub_217848448()
{
  return MEMORY[0x24BDB8E08]();
}

uint64_t sub_217848454()
{
  return MEMORY[0x24BDB8E10]();
}

uint64_t sub_217848460()
{
  return MEMORY[0x24BDB8E18]();
}

uint64_t sub_21784846C()
{
  return MEMORY[0x24BDB8E30]();
}

uint64_t sub_217848478()
{
  return MEMORY[0x24BDB8E38]();
}

uint64_t sub_217848484()
{
  return MEMORY[0x24BDB8E40]();
}

uint64_t sub_217848490()
{
  return MEMORY[0x24BDB8E48]();
}

uint64_t sub_21784849C()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_2178484A8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2178484B4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2178484C0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2178484CC()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_2178484D8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2178484E4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2178484F0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2178484FC()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_217848508()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_217848514()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_217848520()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_21784852C()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_217848538()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_217848544()
{
  return MEMORY[0x24BEE20B8]();
}

uint64_t sub_217848550()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21784855C()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_217848568()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_217848574()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_217848580()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_21784858C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_217848598()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_2178485A4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2178485B0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2178485BC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2178485C8()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_2178485D4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2178485E0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2178485EC()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2178485F8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_217848604()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_217848610()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_21784861C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_217848628()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_217848634()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_217848640()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_21784864C()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_217848658()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_217848664()
{
  return MEMORY[0x24BEE26F0]();
}

uint64_t sub_217848670()
{
  return MEMORY[0x24BEE26F8]();
}

uint64_t sub_21784867C()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_217848688()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_217848694()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2178486A0()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_2178486AC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2178486B8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2178486C4()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2178486D0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2178486DC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2178486E8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2178486F4()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_217848700()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21784870C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_217848718()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_217848724()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_217848730()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_21784873C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_217848748()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_217848754()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_217848760()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21784876C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_217848778()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_217848784()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_217848790()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21784879C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2178487A8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2178487B4()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_2178487C0()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_2178487CC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2178487D8()
{
  return MEMORY[0x24BEE3328]();
}

uint64_t sub_2178487E4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2178487F0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2178487FC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_217848808()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_217848814()
{
  return MEMORY[0x24BEE33D0]();
}

uint64_t sub_217848820()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_21784882C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_217848838()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_217848844()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_217848850()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21784885C()
{
  return MEMORY[0x24BEE3470]();
}

uint64_t sub_217848868()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_217848874()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_217848880()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21784888C()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_217848898()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2178488A4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2178488B0()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2178488BC()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2178488C8()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_2178488D4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2178488E0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2178488EC()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2178488F8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_217848904()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_217848910()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21784891C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_217848928()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_217848934()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_217848940()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21784894C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_217848958()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_217848964()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_217848970()
{
  return MEMORY[0x24BDD0758]();
}

uint64_t sub_21784897C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_217848988()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_217848994()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2178489A0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2178489AC()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2178489B8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2178489C4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2178489D0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2178489DC()
{
  return MEMORY[0x24BEE4A10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t CKCanRetryForError()
{
  return MEMORY[0x24BDB8E68]();
}

uint64_t CKEarliestStartDateAfterError()
{
  return MEMORY[0x24BDB8E98]();
}

uint64_t IMBagIntValueWithDefault()
{
  return MEMORY[0x24BE50B18]();
}

uint64_t IMDCopyAttachmentPersistentPath()
{
  return MEMORY[0x24BE50500]();
}

uint64_t IMDCreateIMDMessageRecordRefFromIMMessageItem()
{
  return MEMORY[0x24BE50508]();
}

uint64_t IMDCreateIMItemFromIMDMessageRecord()
{
  return MEMORY[0x24BE50510]();
}

uint64_t IMDKVPersistValueForKey()
{
  return MEMORY[0x24BE50518]();
}

uint64_t IMDKVValueForKey()
{
  return MEMORY[0x24BE50520]();
}

uint64_t IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit()
{
  return MEMORY[0x24BE50528]();
}

uint64_t IMDMessageRecordAssociateMessageWithGUIDToAttachmentWithGUID()
{
  return MEMORY[0x24BE50530]();
}

uint64_t IMDMessageRecordCalculateLocalCloudKitStatistics()
{
  return MEMORY[0x24BE50538]();
}

uint64_t IMDMessageRecordCopyMessagesForGUIDs()
{
  return MEMORY[0x24BE50540]();
}

uint64_t IMDUpdateIMItemWithIMItemForceReplace()
{
  return MEMORY[0x24BE50568]();
}

uint64_t IMDUpdateIMMessageItemWithIMMessageItemForceReplaceReplaceError()
{
  return MEMORY[0x24BE50570]();
}

uint64_t IMIsRunningInAutomation()
{
  return MEMORY[0x24BE50E40]();
}

uint64_t IMMessageGuidFromIMFileTransferGuid()
{
  return MEMORY[0x24BE50E60]();
}

uint64_t IMSMSDirectoryURL()
{
  return MEMORY[0x24BE50FE0]();
}

uint64_t IMSharedHelperEnsureDirectoryExistsAtPath()
{
  return MEMORY[0x24BE51040]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x24BE507F8]();
}

uint64_t JWDecodeCodableObjectWithStandardAllowlist()
{
  return MEMORY[0x24BE50868]();
}

uint64_t JWDecodeDictionary()
{
  return MEMORY[0x24BE50870]();
}

uint64_t JWEncodeDictionary()
{
  return MEMORY[0x24BE50878]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t stringForCKErrorCode()
{
  return MEMORY[0x24BDB9288]();
}

uint64_t stringForCKUnderlyingErrorCode()
{
  return MEMORY[0x24BDB9290]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t xpc_activity_copy_identifier()
{
  return MEMORY[0x24BDB05D8]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

