uint64_t sub_23840945C()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_256906928);
  sub_238409554(v0, (uint64_t)qword_256906928);
  return sub_23842C480();
}

uint64_t static CreateLocationExitedScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906920 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906928);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_238409554(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static CreateLocationExitedScheduledQueryIntent.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_256906920 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906928);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateLocationExitedScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906920 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256906928);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateLocationExitedScheduledQueryIntent.query.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t sub_2384096C8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_238409768()
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CreateLocationExitedScheduledQueryIntent.query.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.query.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$query.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationExitedScheduledQueryIntent.location.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t sub_2384098D4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_238409974(id *a1)
{
  id v1;

  v1 = *a1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void CreateLocationExitedScheduledQueryIntent.location.setter(void *a1)
{
  id v1;

  v1 = a1;
  sub_23842C2AC();

}

uint64_t (*CreateLocationExitedScheduledQueryIntent.location.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$location.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationExitedScheduledQueryIntent.locationName.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

double sub_238409AE8@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_238409B88()
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CreateLocationExitedScheduledQueryIntent.locationName.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.locationName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$locationName.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationExitedScheduledQueryIntent.radius.getter()
{
  return sub_23842C2A0();
}

uint64_t sub_238409CE0()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_238409D6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_238409F1C(&qword_2569069A0);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - v5;
  sub_238409F5C(a1, (uint64_t)&v8 - v5);
  sub_238409F5C((uint64_t)v6, (uint64_t)v4);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  sub_23840E670((uint64_t)v6, &qword_2569069A0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CreateLocationExitedScheduledQueryIntent.radius.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = sub_238409F1C(&qword_2569069A0);
  MEMORY[0x24BDAC7A8](v2);
  sub_238409F5C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23842C2AC();
  return sub_23840E670(a1, &qword_2569069A0);
}

uint64_t sub_238409F1C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B83434C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_238409F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_238409F1C(&qword_2569069A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.radius.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$radius.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationExitedScheduledQueryIntent.runsOnce.getter()
{
  unsigned __int8 v1;

  sub_23842C2A0();
  return v1;
}

uint64_t sub_23840A03C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23840A0DC()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CreateLocationExitedScheduledQueryIntent.runsOnce.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.runsOnce.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

void sub_23840A1F0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t CreateLocationExitedScheduledQueryIntent.$runsOnce.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationExitedScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t result;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void (*v56)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t *v64;
  char *v65;
  uint64_t v66;
  unsigned int v67;
  void (*v68)(char *, uint64_t, uint64_t, uint64_t);
  void (*v69)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v64 = a1;
  v1 = sub_238409F1C(&qword_2569069A8);
  MEMORY[0x24BDAC7A8](v1);
  v63 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_238409F1C(&qword_2569069B0);
  MEMORY[0x24BDAC7A8](v3);
  v62 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_238409F1C(&qword_2569069B8);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v59 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_23842C3C0();
  v66 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23842C4A4();
  v18 = *(_QWORD *)(v17 - 8);
  v71 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v61 = sub_238409F1C(&qword_2569069D8);
  sub_23842C480();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v19(v16, 1, 1, v17);
  v68 = v19;
  v20 = sub_23842C9C0();
  v72 = 0;
  v73 = 0;
  v56 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v57 = v20;
  v55 = v13;
  v56(v13, 1, 1, v20);
  v21 = sub_23842C24C();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v54 = v21;
  v22(v10, 1, 1, v21);
  v69 = v22;
  v67 = *MEMORY[0x24BDB6090];
  v66 = *(_QWORD *)(v66 + 104);
  v23 = v70;
  ((void (*)(char *))v66)(v7);
  v24 = v7;
  v61 = sub_23842C300();
  v53 = sub_238409F1C(&qword_2569069E0);
  sub_23842C480();
  v25 = v71;
  v19(v16, 1, 1, v71);
  v22(v10, 1, 1, v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v59, *MEMORY[0x24BDB54C8], v60);
  v65 = v24;
  v26 = v24;
  v27 = v67;
  v28 = v23;
  v29 = (void (*)(char *, uint64_t, uint64_t))v66;
  ((void (*)(char *, _QWORD, uint64_t))v66)(v26, v67, v23);
  v52 = v16;
  v60 = sub_23842C318();
  v59 = (char *)sub_238409F1C(&qword_2569069E8);
  sub_23842C480();
  v30 = v68;
  v68(v16, 1, 1, v25);
  v72 = 0;
  v73 = 0;
  v56(v55, 1, 1, v57);
  v31 = v54;
  v69(v10, 1, 1, v54);
  v32 = v27;
  v33 = v28;
  v29(v65, v32, v28);
  v34 = v52;
  v59 = (char *)sub_23842C300();
  v58 = sub_238409F1C(&qword_2569069F0);
  sub_23842C480();
  v35 = v34;
  v30(v34, 1, 1, v71);
  v36 = *MEMORY[0x24BDB5550];
  v37 = sub_238409F1C(&qword_2569069F8);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 104))(v62, v36, v37);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v37);
  v40 = v31;
  v41 = v69;
  v69(v10, 1, 1, v31);
  v42 = v65;
  v43 = v67;
  v44 = v33;
  v45 = (void (*)(char *, uint64_t, uint64_t))v66;
  ((void (*)(char *, _QWORD, uint64_t))v66)(v65, v67, v44);
  v62 = (char *)sub_23842C2DC();
  sub_238409F1C(&qword_256906A00);
  sub_23842C480();
  v68(v35, 1, 1, v71);
  LOBYTE(v72) = 2;
  v46 = sub_23842CA50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v63, 1, 1, v46);
  v41(v10, 1, 1, v40);
  v45(v42, v43, v70);
  result = sub_23842C30C();
  v48 = v64;
  v49 = v60;
  *v64 = v61;
  v48[1] = v49;
  v50 = v62;
  v48[2] = (uint64_t)v59;
  v48[3] = (uint64_t)v50;
  v48[4] = result;
  return result;
}

uint64_t CreateLocationExitedScheduledQueryIntent.init(query:latitude:longitude:locationName:radius:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, double a7@<D0>, double a8@<D1>)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  char *v51;
  void (*v52)(char *, uint64_t, uint64_t, uint64_t);
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t result;
  uint64_t *v85;
  uint64_t v86;
  char *v87;
  void (*v88)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  char *v104;
  void (*v105)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  void (*v109)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  char *v112;
  id v113;
  uint64_t v114;

  v102 = a5;
  v103 = a6;
  v98 = a3;
  v99 = a4;
  v96 = a1;
  v97 = a2;
  v10 = sub_238409F1C(&qword_2569069A0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v101 = (uint64_t)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v100 = (char *)&v86 - v13;
  v14 = sub_238409F1C(&qword_2569069A8);
  MEMORY[0x24BDAC7A8](v14);
  v95 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_238409F1C(&qword_2569069B0);
  MEMORY[0x24BDAC7A8](v16);
  v94 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_238409F1C(&qword_2569069B8);
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v90 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_23842C3C0();
  v106 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  v112 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v86 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_23842C4A4();
  v30 = *(_QWORD *)(v29 - 8);
  v108 = v29;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v86 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = sub_238409F1C(&qword_2569069D8);
  v33 = v32;
  sub_23842C480();
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  v34(v28, 1, 1, v29);
  v35 = v34;
  v109 = v34;
  v89 = sub_23842C9C0();
  v113 = 0;
  v114 = 0;
  v88 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56);
  v87 = v25;
  v88(v25, 1, 1, v89);
  v36 = sub_23842C24C();
  v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
  v110 = v36;
  v37(v22, 1, 1, v36);
  v105 = v37;
  v107 = *MEMORY[0x24BDB6090];
  v106 = *(_QWORD *)(v106 + 104);
  v39 = v111;
  v38 = v112;
  ((void (*)(char *))v106)(v112);
  v40 = v38;
  v93 = sub_23842C300();
  v86 = sub_238409F1C(&qword_2569069E0);
  swift_retain();
  v41 = v33;
  sub_23842C480();
  v42 = v108;
  v35(v28, 1, 1, v108);
  v37(v22, 1, 1, v36);
  (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v90, *MEMORY[0x24BDB54C8], v92);
  v43 = v40;
  v44 = v107;
  v45 = v39;
  v46 = (void (*)(char *, uint64_t, uint64_t))v106;
  ((void (*)(char *, _QWORD, uint64_t))v106)(v43, v107, v39);
  v104 = v41;
  v92 = sub_23842C318();
  v91 = sub_238409F1C(&qword_2569069E8);
  swift_retain();
  sub_23842C480();
  v47 = v28;
  v48 = v28;
  v49 = v42;
  v50 = v109;
  v109(v48, 1, 1, v42);
  v113 = 0;
  v114 = 0;
  v88(v87, 1, 1, v89);
  v51 = v22;
  v52 = v105;
  v105(v22, 1, 1, v110);
  v53 = v112;
  v46(v112, v44, v45);
  v54 = v47;
  v91 = sub_23842C300();
  v90 = (char *)sub_238409F1C(&qword_2569069F0);
  swift_retain();
  sub_23842C480();
  v50(v47, 1, 1, v49);
  v55 = *MEMORY[0x24BDB5550];
  v56 = sub_238409F1C(&qword_2569069F8);
  v57 = *(_QWORD *)(v56 - 8);
  v58 = v94;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 104))(v94, v55, v56);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v58, 0, 1, v56);
  v59 = v51;
  v60 = v110;
  v52(v51, 1, 1, v110);
  v61 = v53;
  v62 = v107;
  v63 = v111;
  v64 = (void (*)(char *, uint64_t, uint64_t))v106;
  ((void (*)(char *, _QWORD, uint64_t))v106)(v61, v107, v111);
  v65 = v54;
  v66 = sub_23842C2DC();
  sub_238409F1C(&qword_256906A00);
  v67 = v66;
  swift_retain();
  sub_23842C480();
  v109(v65, 1, 1, v108);
  LOBYTE(v113) = 2;
  v68 = sub_23842CA50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 56))(v95, 1, 1, v68);
  v105(v59, 1, 1, v60);
  v64(v112, v62, v63);
  v69 = sub_23842C30C();
  v113 = v96;
  v114 = v97;
  swift_retain_n();
  v70 = v93;
  swift_retain();
  v71 = v92;
  swift_retain();
  v72 = v91;
  swift_retain();
  v73 = v67;
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  v74 = v71;
  swift_release();
  swift_release();
  v75 = objc_allocWithZone(MEMORY[0x24BDBFA80]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v76 = objc_msgSend(v75, sel_initWithLatitude_longitude_, a7, a8);
  v77 = (void *)sub_23842C9FC();
  swift_bridgeObjectRelease();
  v78 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v76, v77, 0);

  v113 = v78;
  v79 = v78;
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  v80 = sub_238409F1C(&qword_256906A08);
  v81 = *(_QWORD *)(v80 - 8);
  v82 = (uint64_t)v100;
  v83 = v102;
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v100, v102, v80);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v81 + 56))(v82, 0, 1, v80);
  sub_238409F5C(v82, v101);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  sub_23840E670(v82, &qword_2569069A0);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v83, v80);
  swift_release_n();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  result = swift_release_n();
  v85 = v103;
  *v103 = v70;
  v85[1] = v74;
  v85[2] = v72;
  v85[3] = v73;
  v85[4] = v69;
  return result;
}

uint64_t CreateLocationExitedScheduledQueryIntent.perform()(uint64_t a1)
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
  __int128 v15;

  *(_QWORD *)(v2 + 232) = a1;
  *(_QWORD *)(v2 + 240) = type metadata accessor for ScheduledQuerySnippetView();
  *(_QWORD *)(v2 + 248) = swift_task_alloc();
  sub_23842C4A4();
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  v3 = sub_23842C24C();
  *(_QWORD *)(v2 + 264) = v3;
  *(_QWORD *)(v2 + 272) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 280) = swift_task_alloc();
  v4 = sub_23842C5B8();
  *(_QWORD *)(v2 + 288) = v4;
  *(_QWORD *)(v2 + 296) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 304) = swift_task_alloc();
  *(_QWORD *)(v2 + 312) = type metadata accessor for ScheduledQueryEntity();
  *(_QWORD *)(v2 + 320) = swift_task_alloc();
  *(_QWORD *)(v2 + 328) = swift_task_alloc();
  v5 = sub_23842C72C();
  *(_QWORD *)(v2 + 336) = v5;
  *(_QWORD *)(v2 + 344) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 352) = swift_task_alloc();
  *(_QWORD *)(v2 + 360) = swift_task_alloc();
  v6 = sub_23842C558();
  *(_QWORD *)(v2 + 368) = v6;
  *(_QWORD *)(v2 + 376) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 384) = swift_task_alloc();
  *(_QWORD *)(v2 + 392) = swift_task_alloc();
  v7 = sub_23842C6FC();
  *(_QWORD *)(v2 + 400) = v7;
  *(_QWORD *)(v2 + 408) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 416) = swift_task_alloc();
  *(_QWORD *)(v2 + 424) = swift_task_alloc();
  *(_QWORD *)(v2 + 432) = swift_task_alloc();
  *(_QWORD *)(v2 + 440) = swift_task_alloc();
  v8 = sub_23842C720();
  *(_QWORD *)(v2 + 448) = v8;
  *(_QWORD *)(v2 + 456) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v2 + 464) = swift_task_alloc();
  v9 = sub_23842C39C();
  *(_QWORD *)(v2 + 472) = v9;
  *(_QWORD *)(v2 + 480) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v2 + 488) = swift_task_alloc();
  v10 = sub_238409F1C(&qword_256906A18);
  *(_QWORD *)(v2 + 496) = v10;
  *(_QWORD *)(v2 + 504) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v2 + 512) = swift_task_alloc();
  v11 = sub_23842C798();
  *(_QWORD *)(v2 + 520) = v11;
  *(_QWORD *)(v2 + 528) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v2 + 536) = swift_task_alloc();
  *(_QWORD *)(v2 + 544) = swift_task_alloc();
  *(_QWORD *)(v2 + 552) = swift_task_alloc();
  *(_QWORD *)(v2 + 560) = swift_task_alloc();
  *(_QWORD *)(v2 + 568) = swift_task_alloc();
  sub_238409F1C(&qword_2569069A0);
  *(_QWORD *)(v2 + 576) = swift_task_alloc();
  v12 = sub_238409F1C(&qword_256906A08);
  *(_QWORD *)(v2 + 584) = v12;
  *(_QWORD *)(v2 + 592) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v2 + 600) = swift_task_alloc();
  *(_QWORD *)(v2 + 608) = swift_task_alloc();
  sub_238409F1C(&qword_2569069C0);
  *(_QWORD *)(v2 + 616) = swift_task_alloc();
  v13 = sub_23842C420();
  *(_QWORD *)(v2 + 624) = v13;
  *(_QWORD *)(v2 + 632) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v2 + 640) = swift_task_alloc();
  v14 = sub_23842C51C();
  *(_QWORD *)(v2 + 648) = v14;
  *(_QWORD *)(v2 + 656) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v2 + 664) = swift_task_alloc();
  v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 672) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 688) = v15;
  *(_QWORD *)(v2 + 704) = *(_QWORD *)(v1 + 32);
  return swift_task_switch();
}

uint64_t sub_23840B648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 664);
  v2 = *(_QWORD *)(v0 + 656);
  v3 = *(_QWORD *)(v0 + 648);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE18E60], v3);
  v4 = sub_23842C510();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 640);
    v6 = *(_QWORD *)(v0 + 632);
    v7 = *(_QWORD *)(v0 + 624);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(_QWORD *)(v0 + 160) = *(_QWORD *)(v0 + 176);
    *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 184);
    sub_23842C414();
    sub_23840DFEC();
    v8 = sub_23842CB04();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0)
      v11 = v8 & 0xFFFFFFFFFFFFLL;
    if (v11)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23842C2A0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v13 = *(_QWORD *)(v0 + 96);
      v12 = *(_QWORD *)(v0 + 104);
      *(_QWORD *)(v0 + 712) = v12;
      v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256907230 + dword_256907230);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 720) = v14;
      *v14 = v0;
      v14[1] = sub_23840BBD8;
      return v26(v13, v12);
    }
    v23 = *(_QWORD *)(v0 + 616);
    v24 = *(_QWORD *)(v0 + 264);
    v25 = *(_QWORD *)(v0 + 272);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2B8();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, v24);
    sub_23842C1C8();
    sub_23840E940(&qword_256906A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4BD0], MEMORY[0x24BDB4BD8]);
    swift_allocError();
    sub_23842C2C4();
    swift_release();
    sub_23840E670(v23, &qword_2569069C0);
  }
  else
  {
    sub_23842C774();
    v16 = sub_23842C78C();
    v17 = sub_23842CA8C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_238407000, v16, v17, "Feature flag is disabled", v18, 2u);
      MEMORY[0x23B8343E8](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 544);
    v20 = *(_QWORD *)(v0 + 528);
    v21 = *(_QWORD *)(v0 + 520);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_23840DE38();
    swift_allocError();
    *(_QWORD *)v22 = 0;
    *(_QWORD *)(v22 + 8) = 0;
    *(_BYTE *)(v22 + 16) = 4;
  }
  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23840BBD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 728) = a1;
  *(_QWORD *)(v3 + 736) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23840BC50()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  void (*v31)(uint64_t, uint64_t);
  NSObject *v32;
  os_signpost_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, _QWORD, uint64_t);
  uint8_t *v38;
  os_signpost_id_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  os_log_type_t v50;
  uint64_t v51[3];

  v1 = *(void **)(v0 + 728);
  v2 = v1;
  if (!v1)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v2 = *(void **)(v0 + 192);
    if (!v2)
    {
      v43 = *(_QWORD *)(v0 + 616);
      v44 = *(_QWORD *)(v0 + 264);
      v45 = *(_QWORD *)(v0 + 272);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23842C2B8();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v43, 1, 1, v44);
      sub_23842C1C8();
      sub_23840E940(&qword_256906A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4BD0], MEMORY[0x24BDB4BD8]);
      swift_allocError();
      sub_23842C2C4();
      swift_release();
      sub_23840E670(v43, &qword_2569069C0);
      swift_willThrow();
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
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v1 = *(void **)(v0 + 728);
  }
  *(_QWORD *)(v0 + 744) = v2;
  v3 = *(_QWORD *)(v0 + 592);
  v4 = *(_QWORD *)(v0 + 584);
  v5 = *(_QWORD *)(v0 + 576);
  v6 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4))
  {
    sub_23840E670(*(_QWORD *)(v0 + 576), &qword_2569069A0);
    v7 = 0x4072C00000000000;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 608);
    v9 = *(_QWORD *)(v0 + 600);
    v10 = *(_QWORD *)(v0 + 592);
    v11 = *(_QWORD *)(v0 + 584);
    v12 = *(_QWORD *)(v0 + 576);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    sub_23840E670(v12, &qword_2569069A0);
    v13 = objc_msgSend((id)objc_opt_self(), sel_meters);
    sub_23842C408();

    v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v14(v9, v11);
    sub_23842C3FC();
    v7 = v15;
    v14(v8, v11);
  }
  *(_QWORD *)(v0 + 752) = v7;
  sub_23840E6AC();
  if ((sub_23842CAB0() & 1) != 0)
  {
    sub_23842C774();
    v16 = sub_23842C78C();
    v17 = sub_23842CAA4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_238407000, v16, v17, "We will request confirmation for creating a task", v18, 2u);
      MEMORY[0x23B8343E8](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 704);
    v20 = *(_QWORD *)(v0 + 568);
    v21 = *(_QWORD *)(v0 + 528);
    v22 = *(_QWORD *)(v0 + 520);
    v49 = *(_OWORD *)(v0 + 672);
    v48 = *(_OWORD *)(v0 + 688);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    *(_OWORD *)(v0 + 16) = v49;
    *(_OWORD *)(v0 + 32) = v48;
    *(_QWORD *)(v0 + 48) = v19;
    sub_23842C288();
    sub_23842C390();
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 760) = v23;
    sub_23840E844();
    sub_23840ED94(&qword_256906A70, &qword_256906A18, MEMORY[0x24BDB5E58]);
    *v23 = v0;
    v23[1] = sub_23840C938;
    return sub_23842C210();
  }
  else
  {
    sub_23842C774();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    v25 = sub_23842C78C();
    v50 = sub_23842CAA4();
    v26 = os_log_type_enabled(v25, v50);
    v27 = *(_QWORD *)(v0 + 560);
    v28 = *(_QWORD *)(v0 + 528);
    v29 = *(_QWORD *)(v0 + 520);
    if (v26)
    {
      v47 = *(_QWORD *)(v0 + 560);
      v30 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v51[0] = v46;
      *(_DWORD *)v30 = 136315138;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23842C2A0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      *(_QWORD *)(v0 + 216) = sub_23840E030(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152), v51);
      sub_23842CAEC();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_238407000, v25, v50, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v46, -1, -1);
      MEMORY[0x23B8343E8](v30, -1, -1);

      v31 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v31(v47, v29);
    }
    else
    {

      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      v31 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v31(v27, v29);
    }
    *(_QWORD *)(v0 + 776) = v31;
    sub_23842C780();
    sub_23842C708();
    sub_23842C714();
    sub_23842C6E4();
    v32 = sub_23842C714();
    v33 = sub_23842CAC8();
    if ((sub_23842CAD4() & 1) != 0)
    {
      v34 = *(_QWORD *)(v0 + 432);
      v35 = *(_QWORD *)(v0 + 400);
      v36 = *(_QWORD *)(v0 + 408);
      v37 = *(void (**)(uint64_t, _QWORD, uint64_t))(v36 + 16);
      v37(v34, *(_QWORD *)(v0 + 440), v35);
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      v39 = sub_23842C6F0();
      _os_signpost_emit_with_name_impl(&dword_238407000, v32, v33, v39, "CE.Intent.Create.Exit", "", v38, 2u);
      MEMORY[0x23B8343E8](v38, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    }
    else
    {
      v40 = *(_QWORD *)(v0 + 408);

      v37 = *(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 16);
    }
    *(_QWORD *)(v0 + 784) = v37;
    v37(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 400));
    sub_23842C75C();
    swift_allocObject();
    *(_QWORD *)(v0 + 792) = sub_23842C750();
    static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v51);
    v41 = v51[0];
    *(_QWORD *)(v0 + 800) = v51[0];
    sub_23842C684();
    *(_QWORD *)(v0 + 808) = sub_23842C678();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    *(_QWORD *)(v0 + 816) = *(_QWORD *)(v0 + 136);
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(_QWORD *)(v0 + 80) = &type metadata for ShortcutsRunScheduledQueryIntent;
    *(_QWORD *)(v0 + 88) = sub_23840E6E8();
    *(_QWORD *)(v0 + 56) = v41;
    swift_retain();
    v42 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 824) = v42;
    *v42 = v0;
    v42[1] = sub_23840CF20;
    return sub_23842C630();
  }
}

uint64_t sub_23840C768()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23840C938()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 768) = v0;
  swift_task_dealloc();
  v4 = v2[63];
  v3 = v2[64];
  v5 = v2[62];
  (*(void (**)(_QWORD, _QWORD))(v2[60] + 8))(v2[61], v2[59]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch();
}

uint64_t sub_23840C9EC()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, uint64_t);
  uint8_t *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_23842C774();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v21 = v0[66];
    v22 = v0[65];
    v23 = v0[70];
    v3 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v3 = 136315138;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v0[27] = sub_23840E030(v0[18], v0[19], &v24);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_238407000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v20, -1, -1);
    MEMORY[0x23B8343E8](v3, -1, -1);

    v4 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v4(v23, v22);
  }
  else
  {
    v5 = v0[70];
    v6 = v0[66];
    v7 = v0[65];
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();

    v4 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v4(v5, v7);
  }
  v0[97] = v4;
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v8 = sub_23842C714();
  v9 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v10 = v0[54];
    v11 = v0[50];
    v12 = v0[51];
    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 16);
    v13(v10, v0[55], v11);
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v8, v9, v15, "CE.Intent.Create.Exit", "", v14, 2u);
    MEMORY[0x23B8343E8](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    v16 = v0[51];

    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16);
  }
  v0[98] = v13;
  v13(v0[54], v0[55], v0[50]);
  sub_23842C75C();
  swift_allocObject();
  v0[99] = sub_23842C750();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v24);
  v17 = v24;
  v0[100] = v24;
  sub_23842C684();
  v0[101] = sub_23842C678();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  v0[102] = v0[17];
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v0[10] = &type metadata for ShortcutsRunScheduledQueryIntent;
  v0[11] = sub_23840E6E8();
  v0[7] = v17;
  swift_retain();
  v18 = (_QWORD *)swift_task_alloc();
  v0[103] = v18;
  *v18 = v0;
  v18[1] = sub_23840CF20;
  return sub_23842C630();
}

uint64_t sub_23840CF20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 832) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  if (!v0)
    sub_23840EDD4(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_23840CFB8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
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
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v1);
  v2 = sub_23842C714();
  sub_23842C744();
  v3 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 360);
    v6 = *(_QWORD *)(v0 + 336);
    v5 = *(_QWORD *)(v0 + 344);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x24BEE7810])
    {
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 336));
      v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v7 = 1;
    }
    v9 = (uint64_t *)(v0 + 432);
    v12 = *(_QWORD *)(v0 + 424);
    v13 = *(_QWORD *)(v0 + 400);
    v32 = *(_QWORD *)(v0 + 408);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 784))(*(_QWORD *)(v0 + 432), v12, v13);
    v14 = swift_slowAlloc();
    *(_BYTE *)v14 = 0;
    *(_BYTE *)(v14 + 1) = v7;
    *(_WORD *)(v14 + 2) = 2050;
    *(_QWORD *)(v0 + 208) = 0;
    sub_23842CAEC();
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v2, v3, v15, "CE.Intent.Create.Exit", v8, (uint8_t *)v14, 0xCu);
    MEMORY[0x23B8343E8](v14, -1, -1);

    v11 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v11(v12, v13);
  }
  else
  {
    v9 = (uint64_t *)(v0 + 424);
    v10 = *(_QWORD *)(v0 + 408);

    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  }
  v16 = *v9;
  *(_QWORD *)(v0 + 840) = v11;
  v17 = *(_QWORD *)(v0 + 392);
  v19 = *(_QWORD *)(v0 + 376);
  v18 = *(_QWORD *)(v0 + 384);
  v20 = *(_QWORD *)(v0 + 368);
  v22 = *(uint64_t **)(v0 + 320);
  v21 = *(_QWORD *)(v0 + 328);
  v24 = *(_QWORD *)(v0 + 304);
  v23 = *(_QWORD *)(v0 + 312);
  v30 = *(_QWORD *)(v0 + 296);
  v31 = *(_QWORD *)(v0 + 288);
  v11(v16, *(_QWORD *)(v0 + 400));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v17, v20);
  *v22 = sub_23842C540();
  v22[1] = v25;
  v22[2] = sub_23842C54C();
  v22[3] = v26;
  v22[4] = sub_23842C534();
  v22[5] = v27;
  sub_23842C528();
  v28 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v0 + 848) = v28;
  v28(v18, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))((char *)v22 + *(int *)(v23 + 28), v24, v31);
  sub_23840E780((uint64_t)v22, v21);
  sub_23842C588();
  sub_23842C258();
  sub_23840E7C4(v21, (uint64_t)v22);
  sub_23842CA74();
  *(_QWORD *)(v0 + 856) = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_23840D2AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 248);
  swift_release();
  sub_23840E780(v1, v2);
  return swift_task_switch();
}

uint64_t sub_23840D2FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t, uint64_t);

  v16 = *(void (**)(uint64_t, uint64_t))(v0 + 848);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 840);
  v7 = *(void **)(v0 + 744);
  v10 = *(void **)(v0 + 728);
  v14 = *(_QWORD *)(v0 + 448);
  v15 = *(_QWORD *)(v0 + 464);
  v12 = *(_QWORD *)(v0 + 440);
  v13 = *(_QWORD *)(v0 + 456);
  v11 = *(_QWORD *)(v0 + 400);
  v9 = *(_QWORD *)(v0 + 392);
  v8 = *(_QWORD *)(v0 + 368);
  v1 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 264);
  v4 = *(_QWORD *)(v0 + 248);
  sub_23840E940(&qword_256906A58, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  sub_23840E940(&qword_256906A60, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView, (uint64_t)&protocol conformance descriptor for ScheduledQuerySnippetView);
  sub_23842C264();

  swift_release();
  swift_release();

  sub_23840E808(v4, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v6);
  sub_23840E808(v1, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  v16(v9, v8);
  v17(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23840D5FC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 744);

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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23840D7D4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(void **)(v0 + 832);
  sub_23840EDD4(v0 + 56);
  sub_23842C774();
  v2 = v1;
  v3 = v1;
  v4 = sub_23842C78C();
  v5 = sub_23842CA8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 832);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 200) = v10;
    sub_23842CAEC();
    *v8 = v10;

    _os_log_impl(&dword_238407000, v4, v5, "Failed creating location query: %@", v7, 0xCu);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v8, -1, -1);
    MEMORY[0x23B8343E8](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 832);

  }
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 776);
  v13 = *(_QWORD *)(v0 + 536);
  v14 = *(_QWORD *)(v0 + 520);

  v12(v13, v14);
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v15);
  v16 = sub_23842C714();
  sub_23842C744();
  v17 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v18 = *(_QWORD *)(v0 + 344);
    v19 = *(_QWORD *)(v0 + 352);
    v20 = *(_QWORD *)(v0 + 336);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x24BEE7810])
    {
      v21 = 0;
      v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 336));
      v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v21 = 1;
    }
    v23 = (uint64_t *)(v0 + 432);
    v26 = *(_QWORD *)(v0 + 416);
    v42 = *(_QWORD *)(v0 + 408);
    v27 = *(_QWORD *)(v0 + 400);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 784))(*(_QWORD *)(v0 + 432), v26, v27);
    v28 = swift_slowAlloc();
    *(_BYTE *)v28 = 0;
    *(_BYTE *)(v28 + 1) = v21;
    *(_WORD *)(v28 + 2) = 2050;
    *(_QWORD *)(v0 + 224) = 1;
    sub_23842CAEC();
    v29 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v16, v17, v29, "CE.Intent.Create.Exit", v22, (uint8_t *)v28, 0xCu);
    MEMORY[0x23B8343E8](v28, -1, -1);

    v25 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v25(v26, v27);
  }
  else
  {
    v23 = (uint64_t *)(v0 + 416);
    v24 = *(_QWORD *)(v0 + 408);

    v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  v30 = *v23;
  v38 = *(id *)(v0 + 832);
  v31 = *(void **)(v0 + 744);
  v40 = *(void **)(v0 + 728);
  v43 = *(_QWORD *)(v0 + 464);
  v39 = *(_QWORD *)(v0 + 456);
  v41 = *(_QWORD *)(v0 + 448);
  v37 = *(_QWORD *)(v0 + 440);
  v32 = *(_QWORD *)(v0 + 400);
  v25(v30, v32);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v34 = *(_QWORD *)(v0 + 112);
  v33 = *(_QWORD *)(v0 + 120);
  sub_23840DE38();
  swift_allocError();
  *(_QWORD *)v35 = v34;
  *(_QWORD *)(v35 + 8) = v33;
  *(_BYTE *)(v35 + 16) = 2;
  swift_willThrow();

  swift_release();
  swift_release();

  v25(v37, v32);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v41);
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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23840DDCC()
{
  return sub_23842C738();
}

unint64_t sub_23840DE38()
{
  unint64_t result;

  result = qword_256906A20;
  if (!qword_256906A20)
  {
    result = MEMORY[0x23B834364](&unk_23842E43C, &type metadata for AppIntentError);
    atomic_store(result, (unint64_t *)&qword_256906A20);
  }
  return result;
}

uint64_t sub_23840DE7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906920 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906928);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23840DF28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return CreateLocationExitedScheduledQueryIntent.perform()(a1);
}

uint64_t sub_23840DF78()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23840DFC4()
{
  sub_23840E844();
  return sub_23842C228();
}

unint64_t sub_23840DFEC()
{
  unint64_t result;

  result = qword_256906A28;
  if (!qword_256906A28)
  {
    result = MEMORY[0x23B834364](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256906A28);
  }
  return result;
}

uint64_t sub_23840E030(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23840E100(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23840EDF4((uint64_t)v12, *a3);
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
      sub_23840EDF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23840EDD4((uint64_t)v12);
  return v7;
}

uint64_t sub_23840E100(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23842CAF8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23840E2B8(a5, a6);
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
  v8 = sub_23842CB34();
  if (!v8)
  {
    sub_23842CB40();
    __break(1u);
LABEL_17:
    result = sub_23842CB4C();
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

uint64_t sub_23840E2B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23840E34C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23840E524(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23840E524(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23840E34C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23840E4C0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23842CB28();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23842CB40();
      __break(1u);
LABEL_10:
      v2 = sub_23842CA38();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23842CB4C();
    __break(1u);
LABEL_14:
    result = sub_23842CB40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23840E4C0(uint64_t a1, uint64_t a2)
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
  sub_238409F1C(&qword_256906AC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23840E524(char a1, int64_t a2, char a3, char *a4)
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
    sub_238409F1C(&qword_256906AC0);
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
  result = sub_23842CB4C();
  __break(1u);
  return result;
}

uint64_t sub_23840E670(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_238409F1C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23840E6AC()
{
  unint64_t result;

  result = qword_256906A38;
  if (!qword_256906A38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256906A38);
  }
  return result;
}

unint64_t sub_23840E6E8()
{
  unint64_t result;

  result = qword_256906A40;
  if (!qword_256906A40)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ShortcutsRunScheduledQueryIntent, &type metadata for ShortcutsRunScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906A40);
  }
  return result;
}

unint64_t sub_23840E72C()
{
  unint64_t result;

  result = qword_256906A48;
  if (!qword_256906A48)
  {
    result = MEMORY[0x23B834364](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256906A48);
  }
  return result;
}

uint64_t sub_23840E770(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23840E780(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 32))(a2, a1, Entity);
  return a2;
}

uint64_t sub_23840E7C4(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 16))(a2, a1, Entity);
  return a2;
}

uint64_t sub_23840E808(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23840E844()
{
  unint64_t result;

  result = qword_256906A68;
  if (!qword_256906A68)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationExitedScheduledQueryIntent, &type metadata for CreateLocationExitedScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906A68);
  }
  return result;
}

uint64_t sub_23840E888(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B834358](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23840E8D0()
{
  unint64_t result;

  result = qword_256906A78;
  if (!qword_256906A78)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationExitedScheduledQueryIntent, &type metadata for CreateLocationExitedScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906A78);
  }
  return result;
}

uint64_t sub_23840E914()
{
  return sub_23840E940((unint64_t *)&qword_256906A80, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_23840E940(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B834364](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23840E988()
{
  unint64_t result;

  result = qword_256906A88;
  if (!qword_256906A88)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationExitedScheduledQueryIntent, &type metadata for CreateLocationExitedScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906A88);
  }
  return result;
}

unint64_t sub_23840E9D0()
{
  unint64_t result;

  result = qword_256906A90;
  if (!qword_256906A90)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationExitedScheduledQueryIntent, &type metadata for CreateLocationExitedScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906A90);
  }
  return result;
}

uint64_t sub_23840EA14()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_23840EA38()
{
  sub_23840E844();
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for CreateLocationExitedScheduledQueryIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CreateLocationExitedScheduledQueryIntent()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for CreateLocationExitedScheduledQueryIntent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CreateLocationExitedScheduledQueryIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CreateLocationExitedScheduledQueryIntent(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CreateLocationExitedScheduledQueryIntent(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateLocationExitedScheduledQueryIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateLocationExitedScheduledQueryIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateLocationExitedScheduledQueryIntent()
{
  return &type metadata for CreateLocationExitedScheduledQueryIntent;
}

uint64_t sub_23840ED10()
{
  return sub_23840ED94(&qword_256906AA0, &qword_256906AA8, MEMORY[0x24BDB5E68]);
}

uint64_t sub_23840ED3C()
{
  return sub_23840ED94(&qword_256906AB0, &qword_256906AA8, MEMORY[0x24BDB5E60]);
}

uint64_t sub_23840ED68()
{
  return sub_23840ED94(&qword_256906AB8, &qword_256906AA8, MEMORY[0x24BDB5E70]);
}

uint64_t sub_23840ED94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_23840E888(a2);
    result = MEMORY[0x23B834364](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23840EDD4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23840EDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_23840EE34(uint64_t a1, uint64_t *a2)
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

uint64_t ScheduledQueryErrorView.init(scheduledQuery:error:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  sub_23840E780(a1, a3);
  result = type metadata accessor for ScheduledQueryErrorView(0);
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for ScheduledQueryErrorView(uint64_t a1)
{
  return sub_23840F450(a1, qword_256906B40);
}

uint64_t ScheduledQueryErrorView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t Representation;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  unsigned __int8 v50;
  char v51;
  _QWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  unsigned __int8 v63;
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
  uint64_t v74;
  char v75;
  uint64_t v76;

  v2 = v1;
  v41 = a1;
  Representation = type metadata accessor for QueryRepresentation(0);
  v4 = MEMORY[0x24BDAC7A8](Representation);
  v45 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - v6;
  v8 = sub_238409F1C(&qword_256906AC8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v10 = sub_23842C858();
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v40 = v10;
  v11 = (uint64_t)&v10[*(int *)(sub_238409F1C(&qword_256906AD0) + 44)];
  v39 = v7;
  sub_23840F73C(v2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  v42 = sub_23842C7D4();
  sub_23840F484((uint64_t)&v60);
  LOBYTE(v10) = v62;
  v12 = v63;
  v32 = v62;
  v33 = v63;
  v37 = v60;
  v38 = v64;
  LOBYTE(v2) = v65;
  v13 = v69;
  v35 = v68;
  v36 = v66;
  v34 = v70;
  v43 = v61;
  v44 = v71;
  v14 = v72;
  v46 = v73;
  v51 = 1;
  v50 = v62;
  v49 = v65;
  v48 = v67;
  v47 = v72;
  v15 = v67;
  v16 = (uint64_t)v7;
  v17 = v45;
  sub_23840F73C(v16, v45, type metadata accessor for QueryRepresentation);
  sub_23840F73C(v17, v11, type metadata accessor for QueryRepresentation);
  v18 = (_OWORD *)(v11 + *(int *)(sub_238409F1C(&qword_256906AD8) + 48));
  v52[0] = v42;
  v52[1] = 0;
  LOBYTE(v53) = 1;
  v19 = v36;
  v20 = v37;
  *((_QWORD *)&v53 + 1) = v37;
  *(_QWORD *)&v54 = v43;
  BYTE8(v54) = (_BYTE)v10;
  BYTE9(v54) = v12;
  v21 = v38;
  *(_QWORD *)&v55 = v38;
  BYTE8(v55) = v2;
  *(_QWORD *)&v56 = v36;
  BYTE8(v56) = v15;
  v22 = v34;
  v23 = v35;
  *(_QWORD *)&v57 = v35;
  *((_QWORD *)&v57 + 1) = v13;
  *(_QWORD *)&v58 = v34;
  *((_QWORD *)&v58 + 1) = v44;
  LOBYTE(v59) = v14;
  *((_QWORD *)&v59 + 1) = v46;
  v24 = v53;
  *v18 = (unint64_t)v42;
  v18[1] = v24;
  v25 = v55;
  v18[2] = v54;
  v18[3] = v25;
  v26 = v59;
  v18[6] = v58;
  v18[7] = v26;
  v27 = v57;
  v18[4] = v56;
  v18[5] = v27;
  sub_23840F780((uint64_t)v52);
  sub_23840F7EC((uint64_t)v39);
  v60 = v42;
  v61 = 0;
  v62 = 1;
  v64 = v20;
  v65 = v43;
  LOBYTE(v66) = v32;
  BYTE1(v66) = v33;
  v67 = v21;
  LOBYTE(v68) = v2;
  v69 = v19;
  LOBYTE(v70) = v15;
  v71 = v23;
  v72 = v13;
  v73 = v22;
  v74 = v44;
  v75 = v14;
  v76 = v46;
  sub_23840F828((uint64_t)&v60);
  sub_23840F7EC(v45);
  LOBYTE(v23) = sub_23842C870();
  v29 = (uint64_t)v40;
  v28 = v41;
  sub_23840F894((uint64_t)v40, v41);
  v30 = v28 + *(int *)(sub_238409F1C(&qword_256906AE0) + 36);
  *(_BYTE *)v30 = v23;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  *(_BYTE *)(v30 + 40) = 1;
  return sub_23840F8DC(v29);
}

uint64_t sub_23840F1D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t Representation;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
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
  char v47;
  char v48;
  char v49;
  unsigned __int8 v50;
  char v51;
  _QWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  char v63;
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
  uint64_t v74;
  char v75;
  uint64_t v76;

  v44 = a2;
  Representation = type metadata accessor for QueryRepresentation(0);
  v4 = MEMORY[0x24BDAC7A8](Representation);
  v46 = (uint64_t)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - v6;
  v43 = (uint64_t)&v31 - v6;
  sub_23840F73C(a1, (uint64_t)&v31 - v6, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  v45 = sub_23842C7D4();
  sub_23840F484((uint64_t)&v60);
  v9 = v60;
  v8 = v61;
  v31 = v61;
  v10 = v62;
  LOBYTE(a1) = v63;
  v11 = v65;
  v41 = v66;
  v42 = v64;
  v39 = v69;
  v40 = v68;
  v37 = v71;
  v38 = v70;
  v12 = v72;
  v36 = v73;
  v51 = 1;
  v50 = v62;
  v49 = v65;
  v34 = v65;
  v35 = v72;
  v48 = v67;
  v47 = v72;
  v13 = v67;
  v32 = v62;
  v33 = v67;
  v14 = (uint64_t)v7;
  v15 = v46;
  sub_23840F73C(v14, v46, type metadata accessor for QueryRepresentation);
  v16 = v15;
  v17 = v44;
  sub_23840F73C(v16, v44, type metadata accessor for QueryRepresentation);
  v18 = (_OWORD *)(v17 + *(int *)(sub_238409F1C(&qword_256906AD8) + 48));
  v52[0] = v45;
  v52[1] = 0;
  LOBYTE(v53) = 1;
  *((_QWORD *)&v53 + 1) = v9;
  *(_QWORD *)&v54 = v8;
  BYTE8(v54) = v10;
  BYTE9(v54) = a1;
  v20 = v41;
  v19 = v42;
  *(_QWORD *)&v55 = v42;
  BYTE8(v55) = v11;
  *(_QWORD *)&v56 = v41;
  BYTE8(v56) = v13;
  v22 = v39;
  v21 = v40;
  *(_QWORD *)&v57 = v40;
  *((_QWORD *)&v57 + 1) = v39;
  v24 = v37;
  v23 = v38;
  *(_QWORD *)&v58 = v38;
  *((_QWORD *)&v58 + 1) = v37;
  LOBYTE(v59) = v12;
  v25 = v36;
  *((_QWORD *)&v59 + 1) = v36;
  v26 = v53;
  *v18 = (unint64_t)v45;
  v18[1] = v26;
  v27 = v55;
  v18[2] = v54;
  v18[3] = v27;
  v28 = v59;
  v18[6] = v58;
  v18[7] = v28;
  v29 = v57;
  v18[4] = v56;
  v18[5] = v29;
  sub_23840F780((uint64_t)v52);
  sub_23840F7EC(v43);
  v60 = v45;
  v61 = 0;
  v62 = 1;
  v64 = v9;
  v65 = v31;
  LOBYTE(v66) = v32;
  BYTE1(v66) = a1;
  v67 = v19;
  LOBYTE(v68) = v34;
  v69 = v20;
  LOBYTE(v70) = v33;
  v71 = v21;
  v72 = v22;
  v73 = v23;
  v74 = v24;
  v75 = v35;
  v76 = v25;
  sub_23840F828((uint64_t)&v60);
  return sub_23840F7EC(v46);
}

uint64_t type metadata accessor for QueryRepresentation(uint64_t a1)
{
  return sub_23840F450(a1, qword_256906BE0);
}

uint64_t sub_23840F450(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23840F484@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;

  v2 = sub_23842C984();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23842C978();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v32 = sub_23842C990();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23842C9A8();
  sub_23842C7B0();
  v31 = v35;
  v30 = v36;
  v29 = v37;
  v28 = v38;
  v26 = v40;
  v27 = v39;
  type metadata accessor for ScheduledQueryErrorView(0);
  swift_getErrorValue();
  v33 = sub_23842CB94();
  v34 = v6;
  sub_23840DFEC();
  v7 = sub_23842C918();
  v9 = v8;
  v11 = v10 & 1;
  sub_23842C954();
  v12 = sub_23842C8AC();
  v14 = v13;
  v16 = v15;
  swift_release();
  sub_23840F884(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_23842C87C();
  v17 = sub_23842C8A0();
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  sub_23840F884(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v32;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v31;
  *(_BYTE *)(a1 + 32) = v30;
  *(_QWORD *)(a1 + 40) = v29;
  *(_BYTE *)(a1 + 48) = v28;
  v24 = v26;
  *(_QWORD *)(a1 + 56) = v27;
  *(_QWORD *)(a1 + 64) = v24;
  *(_QWORD *)(a1 + 72) = v17;
  *(_QWORD *)(a1 + 80) = v19;
  *(_BYTE *)(a1 + 88) = v23;
  *(_QWORD *)(a1 + 96) = v21;
  swift_retain();
  sub_23840F7DC(v17, v19, v23);
  swift_bridgeObjectRetain();
  sub_23840F884(v17, v19, v23);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23840F73C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23840F780(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_BYTE *)(a1 + 112);
  swift_retain();
  sub_23840F7DC(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23840F7DC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23840F7EC(uint64_t a1)
{
  uint64_t Representation;

  Representation = type metadata accessor for QueryRepresentation(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(Representation - 8) + 8))(a1, Representation);
  return a1;
}

uint64_t sub_23840F828(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_BYTE *)(a1 + 112);
  swift_release();
  sub_23840F884(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23840F884(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23840F894(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_238409F1C(&qword_256906AC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23840F8DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238409F1C(&qword_256906AC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23840F91C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23840F934@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = sub_238409F1C(&qword_256906AC8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_23842C858();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = sub_238409F1C(&qword_256906AD0);
  sub_23840F1D4(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  v7 = sub_23842C870();
  sub_23840F894((uint64_t)v5, a1);
  v8 = a1 + *(int *)(sub_238409F1C(&qword_256906AE0) + 36);
  *(_BYTE *)v8 = v7;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_BYTE *)(v8 + 40) = 1;
  return sub_23840F8DC((uint64_t)v5);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScheduledQueryErrorView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_23842C5B8();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v15 = *(int *)(a3 + 20);
    v16 = *(void **)((char *)a2 + v15);
    v17 = v16;
    *(uint64_t *)((char *)v4 + v15) = (uint64_t)v16;
  }
  return v4;
}

void destroy for ScheduledQueryErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v5 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

_QWORD *initializeWithCopy for ScheduledQueryErrorView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  void *v15;
  id v16;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23842C5B8();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = *(int *)(a3 + 20);
  v15 = *(void **)((char *)a2 + v14);
  v16 = v15;
  *(_QWORD *)((char *)a1 + v14) = v15;
  return a1;
}

_QWORD *assignWithCopy for ScheduledQueryErrorView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

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
  v6 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 20);
  v11 = *(void **)((char *)a2 + v10);
  v12 = v11;
  v13 = *(void **)((char *)a1 + v10);
  *(_QWORD *)((char *)a1 + v10) = v11;

  return a1;
}

_OWORD *initializeWithTake for ScheduledQueryErrorView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *assignWithTake for ScheduledQueryErrorView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = *(int *)(a3 + 20);
  v14 = *(void **)((char *)a1 + v13);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);

  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduledQueryErrorView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23840FE58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Entity;
  uint64_t v7;
  unint64_t v9;

  Entity = type metadata accessor for ScheduledQueryEntity();
  v7 = *(_QWORD *)(Entity - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, Entity);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ScheduledQueryErrorView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23840FEE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for ScheduledQueryEntity();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23840FF58()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ScheduledQueryEntity();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23840FFCC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256906B78;
  if (!qword_256906B78)
  {
    v1 = sub_23840E888(&qword_256906AE0);
    v2[0] = sub_238410038();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B834364](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256906B78);
  }
  return result;
}

unint64_t sub_238410038()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256906B80;
  if (!qword_256906B80)
  {
    v1 = sub_23840E888(&qword_256906AC8);
    result = MEMORY[0x23B834364](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256906B80);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ScheduledQuerySnippetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t Entity;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  Entity = type metadata accessor for ScheduledQueryEntity();
  v5 = *(_DWORD *)(*(_QWORD *)(Entity - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = *(int *)(Entity + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23842C5B8();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for ScheduledQuerySnippetView(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v3 = sub_23842C5B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *initializeWithCopy for ScheduledQuerySnippetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23842C5B8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

_QWORD *assignWithCopy for ScheduledQuerySnippetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

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
  v4 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *initializeWithTake for ScheduledQuerySnippetView(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for ScheduledQuerySnippetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
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
  v7 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_238410414()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238410420(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 48))(a1, a2, Entity);
}

uint64_t sub_23841045C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238410468(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 56))(a1, a2, a2, Entity);
}

uint64_t sub_2384104A8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ScheduledQueryEntity();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_238410510()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238410520()
{
  return sub_23842C948();
}

uint64_t sub_238410538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t View;
  uint64_t result;

  v3 = v1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v4 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  View = type metadata accessor for ScheduledQueryView(0);
  result = ScheduledQueryEntity.displayRepresentation.getter(a1 + *(int *)(View + 20));
  *(_BYTE *)(a1 + *(int *)(View + 24)) = 0;
  return result;
}

unint64_t sub_2384105B0()
{
  unint64_t result;
  uint64_t View;

  result = qword_256906C18;
  if (!qword_256906C18)
  {
    View = type metadata accessor for ScheduledQueryView(255);
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ScheduledQueryView, View);
    atomic_store(result, (unint64_t *)&qword_256906C18);
  }
  return result;
}

uint64_t DailySnippetView.time.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23842C450();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t DailySnippetView.init(time:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23842C450();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t DailySnippetView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v1 = sub_23842C7D4();
  sub_238410778(v0, (uint64_t)&v14);
  v2 = v14;
  v3 = v15;
  v4 = v16;
  v6 = v17;
  v5 = v18;
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v13 = v23;
  v12 = v24;
  v14 = v1;
  v15 = 0;
  v16 = 1;
  v17 = v2;
  v18 = v3;
  v19 = v4;
  v20 = v6;
  v21 = v5;
  LOBYTE(v22) = v7;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v26 = v13;
  v27 = v12;
  sub_23842C870();
  sub_238409F1C(&qword_256906C20);
  sub_238410BC8();
  sub_23842C93C();
  sub_23840F884(v2, v3, v4);
  swift_bridgeObjectRelease();
  return sub_238410C14(v8, v9, v10);
}

uint64_t sub_238410778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;

  v48 = a1;
  v3 = sub_23842C8E8();
  MEMORY[0x24BDAC7A8](v3);
  v45[1] = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23842C81C();
  MEMORY[0x24BDAC7A8](v5);
  v45[2] = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23842C4F8();
  v46 = *(_QWORD *)(v7 - 8);
  v47 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_238409F1C(&qword_256906CC0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23842C4B0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v45[0] = (char *)v45 - v18;
  sub_23842C828();
  v19 = sub_23842C900();
  v21 = v20;
  v23 = v22 & 1;
  v24 = sub_23842C8B8();
  v50 = v25;
  v51 = v24;
  v49 = v26;
  v52 = v27;
  sub_23840F884(v19, v21, v23);
  v28 = v13;
  swift_bridgeObjectRelease();
  sub_23842C4EC();
  sub_23842C4E0();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v47);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_238411058((uint64_t)v12);
    sub_23842C810();
    sub_23842C804();
    sub_23842C444();
    sub_23842C7F8();
    swift_bridgeObjectRelease();
    sub_23842C804();
    sub_23842C834();
    v53 = sub_23842C900();
    v54 = v29;
    v55 = v30 & 1;
    v56 = v31;
    v57 = 1;
    sub_23842C864();
    v32 = v58;
    v33 = v59;
    v34 = v60;
    v35 = v61;
    v36 = v62;
  }
  else
  {
    v37 = v45[0];
    (*(void (**)(_QWORD, char *, uint64_t))(v14 + 32))(v45[0], v12, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v37, v13);
    sub_23842C8DC();
    v53 = sub_23842C8F4();
    v54 = v38;
    v55 = v39 & 1;
    v56 = v40;
    v57 = 0;
    sub_23842C864();
    v32 = v58;
    v33 = v59;
    v34 = v60;
    v35 = v61;
    v36 = v62;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v37, v28);
  }
  v41 = v49 & 1;
  v43 = v50;
  v42 = v51;
  *(_QWORD *)a2 = v51;
  *(_QWORD *)(a2 + 8) = v43;
  *(_BYTE *)(a2 + 16) = v41;
  *(_QWORD *)(a2 + 24) = v52;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v32;
  *(_QWORD *)(a2 + 56) = v33;
  *(_QWORD *)(a2 + 64) = v34;
  *(_QWORD *)(a2 + 72) = v35;
  *(_BYTE *)(a2 + 80) = v36;
  sub_23840F7DC(v42, v43, v41);
  swift_bridgeObjectRetain();
  sub_238411098(v32, v33, v34);
  sub_238410C14(v32, v33, v34);
  sub_23840F884(v42, v43, v41);
  return swift_bridgeObjectRelease();
}

unint64_t sub_238410BC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256906C28;
  if (!qword_256906C28)
  {
    v1 = sub_23840E888(&qword_256906C20);
    result = MEMORY[0x23B834364](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_256906C28);
  }
  return result;
}

uint64_t sub_238410C14(uint64_t a1, uint64_t a2, char a3)
{
  sub_23840F884(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_238410C3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238410C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v1 = sub_23842C7D4();
  sub_238410778(v0, (uint64_t)&v14);
  v2 = v14;
  v3 = v15;
  v4 = v16;
  v6 = v17;
  v5 = v18;
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v13 = v23;
  v12 = v24;
  v14 = v1;
  v15 = 0;
  v16 = 1;
  v17 = v2;
  v18 = v3;
  v19 = v4;
  v20 = v6;
  v21 = v5;
  LOBYTE(v22) = v7;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v26 = v13;
  v27 = v12;
  sub_23842C870();
  sub_238409F1C(&qword_256906C20);
  sub_238410BC8();
  sub_23842C93C();
  sub_23840F884(v2, v3, v4);
  swift_bridgeObjectRelease();
  return sub_238410C14(v8, v9, v10);
}

uint64_t initializeBufferWithCopyOfBuffer for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DailySnippetView(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23842C450();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DailySnippetView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238410EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DailySnippetView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238410F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C450();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DailySnippetView()
{
  uint64_t result;

  result = qword_256906C88;
  if (!qword_256906C88)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_238410FA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23842C450();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23841100C()
{
  sub_23840E888(&qword_256906C20);
  sub_238410BC8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238411058(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238409F1C(&qword_256906CC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238411098(uint64_t a1, uint64_t a2, char a3)
{
  sub_23840F7DC(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2384110C0()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_256906CC8);
  sub_238409554(v0, (uint64_t)qword_256906CC8);
  return sub_23842C480();
}

uint64_t static DeleteScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384113C0(&qword_256906940, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_256906CC8, a1);
}

uint64_t static DeleteScheduledQueryIntent.title.setter(uint64_t a1)
{
  return sub_238411470(a1, &qword_256906940, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_256906CC8);
}

uint64_t (*static DeleteScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906940 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256906CC8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2384111E4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23842C4A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_23842C324();
  sub_23840EE34(v5, qword_256906CE0);
  sub_238409554(v5, (uint64_t)qword_256906CE0);
  sub_23842C480();
  sub_23842C480();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  sub_238409F1C(&qword_256906D48);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23842D2A0;
  sub_23842C480();
  sub_23842C480();
  return sub_23842C33C();
}

uint64_t static DeleteScheduledQueryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384113C0(&qword_256906948, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_256906CE0, a1);
}

uint64_t sub_2384113C0@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = sub_238409554(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static DeleteScheduledQueryIntent.description.setter(uint64_t a1)
{
  return sub_238411470(a1, &qword_256906948, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_256906CE0);
}

uint64_t sub_238411470(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*a2 != -1)
    swift_once();
  v7 = a3(0);
  v8 = sub_238409554(v7, a4);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*static DeleteScheduledQueryIntent.description.modify())()
{
  uint64_t v0;

  if (qword_256906948 != -1)
    swift_once();
  v0 = sub_23842C324();
  sub_238409554(v0, (uint64_t)qword_256906CE0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t DeleteScheduledQueryIntent.entities.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t sub_2384115C0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_retain();
  sub_23842C2A0();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_238411608()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23842C2AC();
  return swift_release();
}

uint64_t DeleteScheduledQueryIntent.entities.setter()
{
  return sub_23842C2AC();
}

void (*DeleteScheduledQueryIntent.entities.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_23840A1F0;
}

uint64_t DeleteScheduledQueryIntent.$entities.getter()
{
  return sub_23842C2B8();
}

uint64_t DeleteScheduledQueryIntent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  _QWORD v19[2];

  v19[0] = a1;
  v1 = sub_23842C3C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_238409F1C(&qword_2569069C0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v19 - v9;
  v11 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23842C4A4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  sub_238409F1C(&qword_256906CF8);
  sub_23842C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  v19[1] = 0;
  v16 = sub_23842C24C();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDB6090], v1);
  sub_2384118F4();
  result = sub_23842C2D0();
  *(_QWORD *)v19[0] = result;
  return result;
}

unint64_t sub_2384118F4()
{
  unint64_t result;
  uint64_t Entity;

  result = qword_256906A80;
  if (!qword_256906A80)
  {
    Entity = type metadata accessor for ScheduledQueryEntity();
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ScheduledQueryEntity, Entity);
    atomic_store(result, (unint64_t *)&qword_256906A80);
  }
  return result;
}

uint64_t DeleteScheduledQueryIntent.init(entities:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;

  v22 = a1;
  v23 = a2;
  v2 = sub_23842C3C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_238409F1C(&qword_2569069C0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - v10;
  v12 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23842C4A4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  sub_238409F1C(&qword_256906CF8);
  sub_23842C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  v24 = 0;
  v17 = sub_23842C24C();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v11, 1, 1, v17);
  v18(v9, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDB6090], v2);
  sub_2384118F4();
  v19 = sub_23842C2D0();
  v24 = v22;
  swift_retain();
  sub_23842C2AC();
  result = swift_release();
  *v23 = v19;
  return result;
}

uint64_t DeleteScheduledQueryIntent.perform()(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[13] = a1;
  sub_23842C4A4();
  v2[14] = swift_task_alloc();
  v3 = sub_23842C24C();
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v4 = sub_23842C72C();
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = *(_QWORD *)(type metadata accessor for ScheduledQueryEntity() - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v5 = sub_23842C6FC();
  v2[25] = v5;
  v2[26] = *(_QWORD *)(v5 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v6 = sub_23842C720();
  v2[31] = v6;
  v2[32] = *(_QWORD *)(v6 - 8);
  v2[33] = swift_task_alloc();
  v7 = sub_23842C798();
  v2[34] = v7;
  v2[35] = *(_QWORD *)(v7 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v8 = swift_task_alloc();
  v9 = *v1;
  v2[38] = v8;
  v2[39] = v9;
  return swift_task_switch();
}

uint64_t sub_238411D14()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, uint64_t);
  uint8_t *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  uint64_t v26;
  NSObject *v27;
  os_signpost_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_signpost_id_t v39;
  uint64_t v40;
  uint64_t v41;

  sub_23842C774();
  swift_retain_n();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 134217984;
    swift_retain();
    sub_23842C2A0();
    swift_release();
    v4 = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 16);
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)(v0 + 96) = v4;
    sub_23842CAEC();
    swift_release();
    _os_log_impl(&dword_238407000, v1, v2, "Performing delete scheduled %ld queries", v3, 0xCu);
    MEMORY[0x23B8343E8](v3, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v5 = *(_QWORD *)(v0 + 304);
  v6 = *(_QWORD *)(v0 + 272);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 280) + 8);
  *(_QWORD *)(v0 + 320) = v7;
  v7(v5, v6);
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v8 = sub_23842C714();
  v9 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v10 = *(_QWORD *)(v0 + 232);
    v11 = *(_QWORD *)(v0 + 200);
    v12 = *(_QWORD *)(v0 + 208);
    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 16);
    v13(v10, *(_QWORD *)(v0 + 240), v11);
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v8, v9, v15, "CE.Intent.Delete", "", v14, 2u);
    MEMORY[0x23B8343E8](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 208);

    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16);
  }
  v18 = (uint64_t *)(v0 + 232);
  v17 = *(_QWORD *)(v0 + 232);
  *(_QWORD *)(v0 + 328) = v13;
  v13(v17, *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 200));
  sub_23842C75C();
  swift_allocObject();
  *(_QWORD *)(v0 + 336) = sub_23842C750();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  v19 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 344) = v19;
  v20 = *(_QWORD *)(v19 + 16);
  *(_QWORD *)(v0 + 352) = v20;
  if (v20)
  {
    v21 = *(_QWORD **)(v0 + 192);
    v22 = *(_QWORD *)(v0 + 176);
    *(_QWORD *)(v0 + 360) = sub_23842C684();
    v23 = *(_DWORD *)(v22 + 80);
    *(_DWORD *)(v0 + 448) = v23;
    *(_QWORD *)(v0 + 368) = *(_QWORD *)(v22 + 72);
    *(_QWORD *)(v0 + 376) = 0;
    sub_23840E7C4(v19 + ((v23 + 32) & ~(unint64_t)v23), (uint64_t)v21);
    *(_QWORD *)(v0 + 384) = *v21;
    *(_QWORD *)(v0 + 392) = v21[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 400) = sub_23842C678();
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v24;
    *v24 = v0;
    v24[1] = sub_238412318;
    return sub_23842C66C();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23840E72C();
    sub_23840DDCC();
    sub_23840E770(v26);
    v27 = sub_23842C714();
    sub_23842C744();
    v28 = sub_23842CABC();
    if ((sub_23842CAD4() & 1) != 0)
    {
      v29 = *(_QWORD *)(v0 + 168);
      v31 = *(_QWORD *)(v0 + 144);
      v30 = *(_QWORD *)(v0 + 152);
      swift_retain();
      sub_23842C768();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v30 + 88))(v29, v31) == *MEMORY[0x24BEE7810])
      {
        v32 = 0;
        v33 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144));
        v33 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
        v32 = 1;
      }
      v36 = *(_QWORD *)(v0 + 224);
      v37 = *(_QWORD *)(v0 + 200);
      v41 = *(_QWORD *)(v0 + 208);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 328))(*(_QWORD *)(v0 + 232), v36, v37);
      v38 = swift_slowAlloc();
      *(_BYTE *)v38 = 0;
      *(_BYTE *)(v38 + 1) = v32;
      *(_WORD *)(v38 + 2) = 2050;
      *(_QWORD *)(v0 + 80) = 0;
      sub_23842CAEC();
      v39 = sub_23842C6F0();
      _os_signpost_emit_with_name_impl(&dword_238407000, v27, v28, v39, "CE.Intent.Delete", v33, (uint8_t *)v38, 0xCu);
      MEMORY[0x23B8343E8](v38, -1, -1);

      v35 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      v35(v36, v37);
    }
    else
    {
      v34 = *(_QWORD *)(v0 + 208);

      v35 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v18 = (uint64_t *)(v0 + 224);
    }
    v40 = *v18;
    *(_QWORD *)(v0 + 424) = v35;
    v35(v40, *(_QWORD *)(v0 + 200));
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_bridgeObjectRelease();
    sub_23842C480();
    sub_23842C258();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    *(_QWORD *)(v0 + 432) = *(_QWORD *)(v0 + 64);
    sub_23842CA74();
    *(_QWORD *)(v0 + 440) = sub_23842CA68();
    sub_23842CA5C();
    return swift_task_switch();
  }
}

uint64_t sub_238412318()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 416) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2384123A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 352);
  v2 = *(_QWORD *)(v0 + 376) + 1;
  sub_238413004(*(_QWORD *)(v0 + 192));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    v3 = (uint64_t *)(v0 + 224);
    sub_23840E72C();
    sub_23840DDCC();
    sub_23840E770(v4);
    v5 = sub_23842C714();
    sub_23842C744();
    v6 = sub_23842CABC();
    if ((sub_23842CAD4() & 1) != 0)
    {
      v7 = *(_QWORD *)(v0 + 168);
      v9 = *(_QWORD *)(v0 + 144);
      v8 = *(_QWORD *)(v0 + 152);
      swift_retain();
      sub_23842C768();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x24BEE7810])
      {
        v10 = 0;
        v11 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144));
        v11 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
        v10 = 1;
      }
      v3 = (uint64_t *)(v0 + 232);
      v19 = *(_QWORD *)(v0 + 224);
      v20 = *(_QWORD *)(v0 + 200);
      v24 = *(_QWORD *)(v0 + 208);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 328))(*(_QWORD *)(v0 + 232), v19, v20);
      v21 = swift_slowAlloc();
      *(_BYTE *)v21 = 0;
      *(_BYTE *)(v21 + 1) = v10;
      *(_WORD *)(v21 + 2) = 2050;
      *(_QWORD *)(v0 + 80) = 0;
      sub_23842CAEC();
      v22 = sub_23842C6F0();
      _os_signpost_emit_with_name_impl(&dword_238407000, v5, v6, v22, "CE.Intent.Delete", v11, (uint8_t *)v21, 0xCu);
      MEMORY[0x23B8343E8](v21, -1, -1);

      v18 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v18(v19, v20);
    }
    else
    {
      v17 = *(_QWORD *)(v0 + 208);

      v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    }
    v23 = *v3;
    *(_QWORD *)(v0 + 424) = v18;
    v18(v23, *(_QWORD *)(v0 + 200));
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_bridgeObjectRelease();
    sub_23842C480();
    sub_23842C258();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    *(_QWORD *)(v0 + 432) = *(_QWORD *)(v0 + 64);
    sub_23842CA74();
    *(_QWORD *)(v0 + 440) = sub_23842CA68();
    sub_23842CA5C();
    return swift_task_switch();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 368);
    v13 = *(_QWORD *)(v0 + 376) + 1;
    *(_QWORD *)(v0 + 376) = v13;
    v14 = *(_QWORD **)(v0 + 192);
    sub_23840E7C4(*(_QWORD *)(v0 + 344)+ ((*(unsigned __int8 *)(v0 + 448) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 448))+ v12 * v13, (uint64_t)v14);
    *(_QWORD *)(v0 + 384) = *v14;
    *(_QWORD *)(v0 + 392) = v14[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 400) = sub_23842C678();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v15;
    *v15 = v0;
    v15[1] = sub_238412318;
    return sub_23842C66C();
  }
}

uint64_t sub_23841274C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_238412788()
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
  void (*v10)(uint64_t, uint64_t);

  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 240);
  v8 = *(_QWORD *)(v0 + 256);
  v9 = *(_QWORD *)(v0 + 248);
  v7 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 72) = *(_QWORD *)(v0 + 432);
  sub_238413040();
  sub_23842C270();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v10(v2, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v9);
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
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_238412914()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  const char *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  os_signpost_id_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53[2];

  v1 = *(void **)(v0 + 416);
  v3 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  sub_23842C774();
  sub_23840E7C4(v2, v3);
  v4 = v1;
  swift_bridgeObjectRetain();
  v5 = v1;
  v6 = sub_23842C78C();
  v7 = sub_23842CA8C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 416);
    v9 = *(_QWORD *)(v0 + 392);
    v46 = *(_QWORD *)(v0 + 384);
    v52 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    v49 = *(_QWORD *)(v0 + 272);
    v50 = *(_QWORD *)(v0 + 288);
    v10 = *(_QWORD *)(v0 + 184);
    v11 = swift_slowAlloc();
    v47 = (_QWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v53[0] = v48;
    *(_DWORD *)v11 = 136315650;
    v12 = *(_QWORD *)(v10 + 16);
    v13 = *(_QWORD *)(v10 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_23840E030(v12, v13, v53);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    sub_238413004(v10);
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_23840E030(v46, v9, v53);
    sub_23842CAEC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2112;
    v14 = v8;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v15;
    sub_23842CAEC();
    *v47 = v15;

    _os_log_impl(&dword_238407000, v6, v7, "Failed to delete scheduled query %s (%s): %@", (uint8_t *)v11, 0x20u);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v47, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v48, -1, -1);
    MEMORY[0x23B8343E8](v11, -1, -1);

    v52(v50, v49);
  }
  else
  {
    v16 = *(void **)(v0 + 416);
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    v18 = *(_QWORD *)(v0 + 288);
    v19 = *(_QWORD *)(v0 + 272);
    sub_238413004(*(_QWORD *)(v0 + 184));
    swift_bridgeObjectRelease_n();

    v17(v18, v19);
  }
  v20 = (uint64_t *)(v0 + 216);
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v21);
  v22 = sub_23842C714();
  sub_23842C744();
  v23 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v24 = *(_QWORD *)(v0 + 152);
    v25 = *(_QWORD *)(v0 + 160);
    v26 = *(_QWORD *)(v0 + 144);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v24 + 88))(v25, v26) == *MEMORY[0x24BEE7810])
    {
      v27 = 0;
      v28 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
      v28 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v27 = 1;
    }
    v20 = (uint64_t *)(v0 + 232);
    v31 = *(_QWORD *)(v0 + 216);
    v51 = *(_QWORD *)(v0 + 208);
    v32 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 328))(*(_QWORD *)(v0 + 232), v31, v32);
    v33 = swift_slowAlloc();
    *(_BYTE *)v33 = 0;
    *(_BYTE *)(v33 + 1) = v27;
    *(_WORD *)(v33 + 2) = 2050;
    *(_QWORD *)(v0 + 24) = 1;
    sub_23842CAEC();
    v34 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v22, v23, v34, "CE.Intent.Delete", v28, (uint8_t *)v33, 0xCu);
    MEMORY[0x23B8343E8](v33, -1, -1);

    v30 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
    v30(v31, v32);
  }
  else
  {
    v29 = *(_QWORD *)(v0 + 208);

    v30 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  }
  v35 = *(_QWORD *)(v0 + 264);
  v43 = *(id *)(v0 + 416);
  v44 = *(_QWORD *)(v0 + 256);
  v36 = *(_QWORD *)(v0 + 240);
  v45 = *(_QWORD *)(v0 + 248);
  v38 = *(_QWORD *)(v0 + 192);
  v37 = *(_QWORD *)(v0 + 200);
  v30(*v20, v37);
  v40 = *(_QWORD *)(v38 + 16);
  v39 = *(_QWORD *)(v38 + 24);
  sub_23840DE38();
  swift_allocError();
  *(_QWORD *)v41 = v40;
  *(_QWORD *)(v41 + 8) = v39;
  *(_BYTE *)(v41 + 16) = 3;
  swift_bridgeObjectRetain();
  swift_willThrow();
  swift_release();

  sub_238413004(v38);
  v30(v36, v37);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v35, v45);
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
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_238412EF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906940 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906CC8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_238412F88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return DeleteScheduledQueryIntent.perform()(a1);
}

uint64_t sub_238412FDC()
{
  sub_238413178();
  return sub_23842C228();
}

uint64_t sub_238413004(uint64_t a1)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 8))(a1, Entity);
  return a1;
}

unint64_t sub_238413040()
{
  unint64_t result;

  result = qword_256906D08;
  if (!qword_256906D08)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ListScheduledQueriesSnippetView, &type metadata for ListScheduledQueriesSnippetView);
    atomic_store(result, (unint64_t *)&qword_256906D08);
  }
  return result;
}

unint64_t sub_238413088()
{
  unint64_t result;

  result = qword_256906D10;
  if (!qword_256906D10)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for DeleteScheduledQueryIntent, &type metadata for DeleteScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906D10);
  }
  return result;
}

unint64_t sub_2384130D0()
{
  unint64_t result;

  result = qword_256906D18;
  if (!qword_256906D18)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for DeleteScheduledQueryIntent, &type metadata for DeleteScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906D18);
  }
  return result;
}

uint64_t sub_238413114()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_238413138()
{
  sub_238413178();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_238413178()
{
  unint64_t result;

  result = qword_256906D20;
  if (!qword_256906D20)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for DeleteScheduledQueryIntent, &type metadata for DeleteScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256906D20);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeleteScheduledQueryIntent()
{
  return &type metadata for DeleteScheduledQueryIntent;
}

uint64_t sub_2384131D4()
{
  return sub_23841321C(&qword_256906D30, MEMORY[0x24BDB5E68]);
}

uint64_t sub_2384131F8()
{
  return sub_23841321C(&qword_256906D40, MEMORY[0x24BDB5E70]);
}

uint64_t sub_23841321C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23840E888(&qword_256906D38);
    result = MEMORY[0x23B834364](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ScheduledQuerySnippetView.init(query:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23840E780(a1, a2);
}

uint64_t ScheduledQuerySnippetView.query.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23840E7C4(v1, a1);
}

uint64_t ScheduledQuerySnippetView.query.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_238413280(a1, v1);
}

uint64_t sub_238413280(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 40))(a2, a1, Entity);
  return a2;
}

uint64_t (*ScheduledQuerySnippetView.query.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQuerySnippetView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = sub_238409F1C(&qword_256906D50);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v3 = sub_23842C84C();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v4 = sub_238409F1C(&qword_256906D58);
  sub_23840E7C4(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_23842C870();
  sub_238413394();
  sub_23842C93C();
  return sub_2384133E0((uint64_t)v3);
}

unint64_t sub_238413394()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256906D60;
  if (!qword_256906D60)
  {
    v1 = sub_23840E888(&qword_256906D50);
    result = MEMORY[0x23B834364](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256906D60);
  }
  return result;
}

uint64_t sub_2384133E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238409F1C(&qword_256906D50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238413420()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238413430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = sub_238409F1C(&qword_256906D50);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v3 = sub_23842C84C();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v4 = sub_238409F1C(&qword_256906D58);
  sub_23840E7C4(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_23842C870();
  sub_238413394();
  sub_23842C93C();
  return sub_2384133E0((uint64_t)v3);
}

uint64_t getEnumTagSinglePayload for ScheduledQuerySnippetView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2384134F8(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 48))(a1, a2, Entity);
}

uint64_t storeEnumTagSinglePayload for ScheduledQuerySnippetView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238413540(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 56))(a1, a2, a2, Entity);
}

uint64_t type metadata accessor for ScheduledQuerySnippetView()
{
  uint64_t result;

  result = qword_256906DC0;
  if (!qword_256906DC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2384135BC()
{
  sub_23840E888(&qword_256906D50);
  sub_238413394();
  return swift_getOpaqueTypeConformance2();
}

uint64_t ScheduledQueryEntity.init(scheduledQuery:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Entity;
  uint64_t v14;

  v4 = sub_23842C5B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = sub_23842C540();
  a2[1] = v8;
  a2[2] = sub_23842C54C();
  a2[3] = v9;
  a2[4] = sub_23842C534();
  a2[5] = v10;
  sub_23842C528();
  v11 = sub_23842C558();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))((char *)a2 + *(int *)(Entity + 28), v7, v4);
}

uint64_t type metadata accessor for ScheduledQueryEntity()
{
  uint64_t result;

  result = qword_256906F18;
  if (!qword_256906F18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ScheduledQueryEntity.displayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  _QWORD v21[2];

  v21[1] = a1;
  v1 = sub_238409F1C(&qword_256906E10);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23842C4A4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v21 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v21 - v15;
  swift_bridgeObjectRetain();
  sub_23842C480();
  type metadata accessor for ScheduledQueryEntity();
  sub_23842C5AC();
  sub_23842C594();
  v17 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v17(v11, v16, v7);
  v17(v6, v14, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_23842C348();
  v18 = sub_23842C354();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v3, 0, 1, v18);
  sub_23842C36C();
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v14, v7);
  return ((uint64_t (*)(char *, uint64_t))v19)(v16, v7);
}

uint64_t (*static ScheduledQueryEntity.defaultQuery.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduledQueryEntity.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ScheduledQueryEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.query.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduledQueryEntity.query.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ScheduledQueryEntity.query.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.shortcutsTriggerIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduledQueryEntity.shortcutsTriggerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ScheduledQueryEntity.shortcutsTriggerIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.triggerParameters.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v4 = sub_23842C5B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ScheduledQueryEntity.triggerParameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  v4 = sub_23842C5B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ScheduledQueryEntity.triggerParameters.modify())()
{
  type metadata accessor for ScheduledQueryEntity();
  return nullsub_1;
}

uint64_t sub_238413B34()
{
  uint64_t v0;

  v0 = sub_23842C3E4();
  sub_23840EE34(v0, qword_256906DF8);
  sub_238409554(v0, (uint64_t)qword_256906DF8);
  return sub_23842C3D8();
}

uint64_t static ScheduledQueryEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906950 != -1)
    swift_once();
  v2 = sub_23842C3E4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906DF8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ScheduledQueryEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_256906950 != -1)
    swift_once();
  v2 = sub_23842C3E4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906DF8);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ScheduledQueryEntity.typeDisplayRepresentation.modify())()
{
  uint64_t v0;

  if (qword_256906950 != -1)
    swift_once();
  v0 = sub_23842C3E4();
  sub_238409554(v0, (uint64_t)qword_256906DF8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_238413D48@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_238413D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906950 != -1)
    swift_once();
  v2 = sub_23842C3E4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906DF8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_238413DF0()
{
  sub_238415834((unint64_t *)&qword_256906A80, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  return sub_23842C1D4();
}

uint64_t sub_238413E3C()
{
  sub_238415834(&qword_256906E58, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  return sub_23842C3F0();
}

uint64_t ScheduledQueryQuery.entities(for:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_238413E9C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 24) = sub_238415280(v1);
  swift_bridgeObjectRelease();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = sub_238413EFC;
  return ScheduledQueryQuery.suggestedEntities()();
}

uint64_t sub_238413EFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_238413F78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_238415314(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_238413FD8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ScheduledQueryQuery.suggestedEntities()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Entity;
  uint64_t v5;

  v1 = sub_23842C798();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  v2 = sub_23842C5B8();
  v0[5] = v2;
  v0[6] = *(_QWORD *)(v2 - 8);
  v0[7] = swift_task_alloc();
  v3 = sub_23842C558();
  v0[8] = v3;
  v0[9] = *(_QWORD *)(v3 - 8);
  v0[10] = swift_task_alloc();
  v0[11] = swift_task_alloc();
  Entity = type metadata accessor for ScheduledQueryEntity();
  v0[12] = Entity;
  v0[13] = *(_QWORD *)(Entity - 8);
  v0[14] = swift_task_alloc();
  v0[15] = swift_task_alloc();
  v5 = sub_23842C51C();
  v0[16] = v5;
  v0[17] = *(_QWORD *)(v5 - 8);
  v0[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_238414100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE18E60], v3);
  v4 = sub_23842C510();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) != 0)
  {
    sub_23842C684();
    *(_QWORD *)(v0 + 152) = sub_23842C678();
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v5;
    *v5 = v0;
    v5[1] = sub_2384142E4;
    return sub_23842C654();
  }
  else
  {
    sub_23842C774();
    v7 = sub_23842C78C();
    v8 = sub_23842CA8C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_238407000, v7, v8, "Feature flag is disabled", v9, 2u);
      MEMORY[0x23B8343E8](v9, -1, -1);
    }
    v11 = *(_QWORD *)(v0 + 24);
    v10 = *(_QWORD *)(v0 + 32);
    v12 = *(_QWORD *)(v0 + 16);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    sub_23840DE38();
    swift_allocError();
    *(_QWORD *)v13 = 0;
    *(_QWORD *)(v13 + 8) = 0;
    *(_BYTE *)(v13 + 16) = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2384142E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_238414358()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v24 = *(_QWORD *)(v0 + 104);
    v25 = *(_QWORD **)(v0 + 112);
    v23 = *(_QWORD *)(v0 + 96);
    v3 = *(_QWORD *)(v0 + 72);
    v21 = *(_QWORD *)(v0 + 48);
    v28 = MEMORY[0x24BEE4AF8];
    sub_238414994(0, v2, 0);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v22 = v3;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v20 = *(_QWORD *)(v3 + 72);
    v5 = v28;
    do
    {
      v6 = *(uint64_t **)(v0 + 112);
      v7 = *(_QWORD *)(v0 + 80);
      v8 = *(_QWORD *)(v0 + 88);
      v10 = *(_QWORD *)(v0 + 56);
      v9 = *(_QWORD *)(v0 + 64);
      v26 = *(_QWORD *)(v0 + 40);
      v27 = *(_QWORD *)(v0 + 120);
      v19(v8, v4, v9);
      v19(v7, v8, v9);
      *v6 = sub_23842C540();
      v25[1] = v11;
      v25[2] = sub_23842C54C();
      v25[3] = v12;
      v25[4] = sub_23842C534();
      v25[5] = v13;
      sub_23842C528();
      v14 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v14(v7, v9);
      (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))((char *)v6 + *(int *)(v23 + 28), v10, v26);
      sub_23840E780((uint64_t)v6, v27);
      v14(v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_238414994(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v28;
      }
      v16 = *(_QWORD *)(v5 + 16);
      v15 = *(_QWORD *)(v5 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_238414994(v15 > 1, v16 + 1, 1);
        v5 = v28;
      }
      v17 = *(_QWORD *)(v0 + 120);
      *(_QWORD *)(v5 + 16) = v16 + 1;
      sub_23840E780(v17, v5+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(_QWORD *)(v24 + 72) * v16);
      v4 += v20;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

uint64_t sub_2384145BC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_238414650(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_238414668(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_2384146B0;
  return ScheduledQueryQuery.suggestedEntities()();
}

uint64_t sub_2384146B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_23841470C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_238415620();
  *v1 = v0;
  v1[1] = sub_23840DF78;
  return sub_23842C234();
}

uint64_t sub_238414778()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23840DF78;
  return sub_23842C3A8();
}

uint64_t sub_2384147E8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23842CBB8();
  swift_bridgeObjectRetain();
  sub_23842CA20();
  v8 = sub_23842CBC4();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23842CB64() & 1) != 0)
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
      if (v19 || (sub_23842CB64() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_238414C8C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_238414994(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_238417504(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2384149B0()
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
  sub_238409F1C(&qword_256906F58);
  v3 = sub_23842CB1C();
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
      sub_23842CBB8();
      sub_23842CA20();
      result = sub_23842CBC4();
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

uint64_t sub_238414C8C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2384149B0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_238414E24();
      goto LABEL_22;
    }
    sub_238414FD4();
  }
  v11 = *v4;
  sub_23842CBB8();
  sub_23842CA20();
  result = sub_23842CBC4();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23842CB64(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23842CB70();
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
          result = sub_23842CB64();
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

void *sub_238414E24()
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
  sub_238409F1C(&qword_256906F58);
  v2 = *v0;
  v3 = sub_23842CB10();
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

uint64_t sub_238414FD4()
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
  sub_238409F1C(&qword_256906F58);
  v3 = sub_23842CB1C();
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
    sub_23842CBB8();
    swift_bridgeObjectRetain();
    sub_23842CA20();
    result = sub_23842CBC4();
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

uint64_t sub_238415280(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23842CA80();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2384147E8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_238415314(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Entity;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  Entity = type metadata accessor for ScheduledQueryEntity();
  v6 = MEMORY[0x24BDAC7A8](Entity);
  v32 = (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t *)((char *)&v29 - v9);
  result = MEMORY[0x24BEE4AF8];
  v36 = MEMORY[0x24BEE4AF8];
  v34 = *(_QWORD *)(a1 + 16);
  if (v34)
  {
    v29 = v2;
    v12 = 0;
    v13 = *(_QWORD *)(v8 + 72);
    v30 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v33 = a1 + v30;
    v35 = a2 + 56;
    v14 = MEMORY[0x24BEE4AF8];
    v31 = v13;
    while (1)
    {
      sub_23840E7C4(v33 + v13 * v12, (uint64_t)v10);
      if (*(_QWORD *)(a2 + 16))
      {
        v16 = *v10;
        v15 = v10[1];
        sub_23842CBB8();
        swift_bridgeObjectRetain();
        sub_23842CA20();
        v17 = sub_23842CBC4();
        v18 = -1 << *(_BYTE *)(a2 + 32);
        v19 = v17 & ~v18;
        if (((*(_QWORD *)(v35 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
        {
          v20 = *(_QWORD *)(a2 + 48);
          v21 = (_QWORD *)(v20 + 16 * v19);
          v22 = *v21 == v16 && v21[1] == v15;
          if (v22 || (sub_23842CB64() & 1) != 0)
          {
LABEL_13:
            swift_bridgeObjectRelease();
            sub_23840E780((uint64_t)v10, v32);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              sub_238414994(0, *(_QWORD *)(v14 + 16) + 1, 1);
            v14 = v36;
            v24 = *(_QWORD *)(v36 + 16);
            v23 = *(_QWORD *)(v36 + 24);
            if (v24 >= v23 >> 1)
            {
              sub_238414994(v23 > 1, v24 + 1, 1);
              v14 = v36;
            }
            *(_QWORD *)(v14 + 16) = v24 + 1;
            v25 = v14 + v30 + v24 * v31;
            v13 = v31;
            sub_23840E780(v32, v25);
            goto LABEL_5;
          }
          v26 = ~v18;
          while (1)
          {
            v19 = (v19 + 1) & v26;
            if (((*(_QWORD *)(v35 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
              break;
            v27 = (_QWORD *)(v20 + 16 * v19);
            v28 = *v27 == v16 && v27[1] == v15;
            if (v28 || (sub_23842CB64() & 1) != 0)
              goto LABEL_13;
          }
        }
        swift_bridgeObjectRelease();
        v13 = v31;
      }
      sub_238413004((uint64_t)v10);
LABEL_5:
      if (++v12 == v34)
        return v36;
    }
  }
  return result;
}

uint64_t sub_2384155B0()
{
  return sub_238415834(&qword_256906E28, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_2384155D4()
{
  return sub_238415834(&qword_256906E30, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_2384155F8()
{
  return sub_238415834(&qword_256906E38, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

unint64_t sub_238415620()
{
  unint64_t result;

  result = qword_256906E40;
  if (!qword_256906E40)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ScheduledQueryQuery, &type metadata for ScheduledQueryQuery);
    atomic_store(result, (unint64_t *)&qword_256906E40);
  }
  return result;
}

uint64_t sub_238415664()
{
  return MEMORY[0x24BDB6618];
}

uint64_t sub_238415670()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_23841567C()
{
  return sub_238415834(&qword_256906E48, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_2384156A0()
{
  return sub_238415834(&qword_256906E50, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_2384156C4()
{
  return sub_238415834(&qword_256906A58, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_2384156E8()
{
  return sub_238415834(&qword_256906E58, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

unint64_t sub_238415710()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256906E60;
  if (!qword_256906E60)
  {
    v1 = sub_23840E888(&qword_256906E68);
    result = MEMORY[0x23B834364](MEMORY[0x24BDB6250], v1);
    atomic_store(result, (unint64_t *)&qword_256906E60);
  }
  return result;
}

uint64_t sub_23841575C()
{
  return sub_238415834(&qword_256906E70, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

unint64_t sub_238415784()
{
  unint64_t result;

  result = qword_256906E78;
  if (!qword_256906E78)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ScheduledQueryQuery, &type metadata for ScheduledQueryQuery);
    atomic_store(result, (unint64_t *)&qword_256906E78);
  }
  return result;
}

unint64_t sub_2384157CC()
{
  unint64_t result;

  result = qword_256906E80[0];
  if (!qword_256906E80[0])
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ScheduledQueryQuery, &type metadata for ScheduledQueryQuery);
    atomic_store(result, qword_256906E80);
  }
  return result;
}

uint64_t sub_238415810()
{
  return sub_238415834((unint64_t *)&qword_256906A80, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
}

uint64_t sub_238415834(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t Entity;

  result = *a1;
  if (!result)
  {
    Entity = type metadata accessor for ScheduledQueryEntity();
    result = MEMORY[0x23B834364](a2, Entity);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_238415878()
{
  unint64_t result;

  result = qword_256906E98;
  if (!qword_256906E98)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ScheduledQueryQuery, &type metadata for ScheduledQueryQuery);
    atomic_store(result, (unint64_t *)&qword_256906E98);
  }
  return result;
}

unint64_t sub_2384158C0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256906EA0;
  if (!qword_256906EA0)
  {
    v1 = sub_23840E888(qword_256906EA8);
    v2 = sub_238415834(&qword_256906A58, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
    result = MEMORY[0x23B834364](MEMORY[0x24BDB6638], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256906EA0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ScheduledQueryEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
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
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = sub_23842C5B8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for ScheduledQueryEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_23842C5B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for ScheduledQueryEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = sub_23842C5B8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

_QWORD *assignWithCopy for ScheduledQueryEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

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
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ScheduledQueryEntity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for ScheduledQueryEntity(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduledQueryEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238415CA0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23842C5B8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ScheduledQueryEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238415D28(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23842C5B8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_238415D9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23842C5B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduledQueryQuery()
{
  return &type metadata for ScheduledQueryQuery;
}

uint64_t sub_238415E24()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_256906F60);
  sub_238409554(v0, (uint64_t)qword_256906F60);
  return sub_23842C480();
}

uint64_t static GetScheduledQueriesIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384113C0(&qword_256906958, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_256906F60, a1);
}

uint64_t static GetScheduledQueriesIntent.title.setter(uint64_t a1)
{
  return sub_238411470(a1, &qword_256906958, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_256906F60);
}

uint64_t (*static GetScheduledQueriesIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906958 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256906F60);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_238415F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v11;

  v0 = sub_238409F1C(&qword_2569069D0);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v11 - v4;
  v6 = sub_23842C4A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_23842C324();
  sub_23840EE34(v8, qword_256906F78);
  sub_238409554(v8, (uint64_t)qword_256906F78);
  sub_23842C480();
  sub_23842C480();
  v9 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  v9(v5, 0, 1, v6);
  sub_238409F1C(&qword_256906D48);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23842D2A0;
  sub_23842C480();
  sub_23842C480();
  sub_23842C480();
  v9(v3, 0, 1, v6);
  return sub_23842C330();
}

uint64_t static GetScheduledQueriesIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384113C0(&qword_256906960, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_256906F78, a1);
}

uint64_t static GetScheduledQueriesIntent.description.setter(uint64_t a1)
{
  return sub_238411470(a1, &qword_256906960, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_256906F78);
}

uint64_t (*static GetScheduledQueriesIntent.description.modify())()
{
  uint64_t v0;

  if (qword_256906960 != -1)
    swift_once();
  v0 = sub_23842C324();
  sub_238409554(v0, (uint64_t)qword_256906F78);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t GetScheduledQueriesIntent.perform()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[7] = a1;
  v2 = sub_23842C24C();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v3 = sub_23842C72C();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v4 = sub_23842C6FC();
  v1[15] = v4;
  v1[16] = *(_QWORD *)(v4 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v5 = sub_23842C720();
  v1[21] = v5;
  v1[22] = *(_QWORD *)(v5 - 8);
  v1[23] = swift_task_alloc();
  v6 = sub_23842C798();
  v1[24] = v6;
  v1[25] = *(_QWORD *)(v6 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_238416364()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, uint64_t);
  uint8_t *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  _QWORD *v17;

  sub_23842C774();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_238407000, v1, v2, "GetScheduledQueriesIntent perform", v3, 2u);
    MEMORY[0x23B8343E8](v3, -1, -1);
  }
  v4 = v0[28];
  v5 = v0[24];
  v6 = v0[25];

  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[29] = v7;
  v7(v4, v5);
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v8 = sub_23842C714();
  v9 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v10 = v0[19];
    v11 = v0[15];
    v12 = v0[16];
    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 16);
    v13(v10, v0[20], v11);
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v8, v9, v15, "CE.Intent.Get", "", v14, 2u);
    MEMORY[0x23B8343E8](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    v16 = v0[16];

    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16);
  }
  v0[30] = v13;
  v13(v0[19], v0[20], v0[15]);
  sub_23842C75C();
  swift_allocObject();
  v0[31] = sub_23842C750();
  sub_23842C684();
  v0[32] = sub_23842C678();
  v17 = (_QWORD *)swift_task_alloc();
  v0[33] = v17;
  *v17 = v0;
  v17[1] = sub_238416588;
  return sub_23842C648();
}

uint64_t sub_238416588(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 272) = a1;
  *(_QWORD *)(v3 + 280) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2384165F4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = *(_QWORD *)(v0 + 280);
  v22 = *(_QWORD **)(v0 + 272);
  swift_bridgeObjectRetain();
  sub_2384176F8(&v22);
  if (v1)
    return swift_release();
  swift_bridgeObjectRelease();
  v3 = sub_238416F40((uint64_t)v22);
  *(_QWORD *)(v0 + 288) = v3;
  swift_release();
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v4);
  v5 = sub_23842C714();
  sub_23842C744();
  v6 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 112);
    v9 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 96);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x24BEE7810])
    {
      v10 = 0;
      v11 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
      v11 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v10 = 1;
    }
    v17 = *(_QWORD *)(v0 + 144);
    v16 = *(_QWORD *)(v0 + 152);
    v18 = *(_QWORD *)(v0 + 120);
    v21 = *(_QWORD *)(v0 + 128);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 240))(v16, v17, v18);
    v19 = swift_slowAlloc();
    *(_BYTE *)v19 = 0;
    *(_BYTE *)(v19 + 1) = v10;
    *(_WORD *)(v19 + 2) = 2050;
    *(_QWORD *)(v0 + 48) = 0;
    sub_23842CAEC();
    v20 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v5, v6, v20, "CE.Intent.Get", v11, (uint8_t *)v19, 0xCu);
    MEMORY[0x23B8343E8](v19, -1, -1);

    v15 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v15(v17, v18);
    v15(v16, v18);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 120);
    v14 = *(_QWORD *)(v0 + 128);

    v15 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v15(v12, v13);
  }
  *(_QWORD *)(v0 + 296) = v15;
  sub_23842C240();
  *(_QWORD *)(v0 + 32) = v3;
  sub_23842CA74();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 304) = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_2384168F8()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_238416934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
  v8 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 288);
  sub_238409F1C(qword_256906EA8);
  sub_238417778();
  sub_238413040();
  sub_23842C264();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v10(v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  swift_bridgeObjectRelease();
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

uint64_t sub_238416AE8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_signpost_id_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = *(void **)(v0 + 280);
  sub_23842C774();
  v2 = v1;
  v3 = v1;
  v4 = sub_23842C78C();
  v5 = sub_23842CA8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 280);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v10;
    sub_23842CAEC();
    *v8 = v10;

    _os_log_impl(&dword_238407000, v4, v5, "Failed list queries: %@", v7, 0xCu);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v8, -1, -1);
    MEMORY[0x23B8343E8](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 280);

  }
  v12 = (uint64_t *)(v0 + 136);
  (*(void (**)(_QWORD, _QWORD))(v0 + 232))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v13);
  v14 = sub_23842C714();
  sub_23842C744();
  v15 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v16 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 104);
    v18 = *(_QWORD *)(v0 + 88);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v17, v18) == *MEMORY[0x24BEE7810])
    {
      v19 = 0;
      v20 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
      v20 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v19 = 1;
    }
    v12 = (uint64_t *)(v0 + 152);
    v23 = *(_QWORD *)(v0 + 136);
    v36 = *(_QWORD *)(v0 + 128);
    v24 = *(_QWORD *)(v0 + 120);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 240))(*(_QWORD *)(v0 + 152), v23, v24);
    v25 = swift_slowAlloc();
    *(_BYTE *)v25 = 0;
    *(_BYTE *)(v25 + 1) = v19;
    *(_WORD *)(v25 + 2) = 2050;
    *(_QWORD *)(v0 + 16) = 1;
    sub_23842CAEC();
    v26 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v14, v15, v26, "CE.Intent.Get", v20, (uint8_t *)v25, 0xCu);
    MEMORY[0x23B8343E8](v25, -1, -1);

    v22 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v22(v23, v24);
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 128);

    v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  }
  v27 = *v12;
  v28 = *(void **)(v0 + 280);
  v29 = *(_QWORD *)(v0 + 184);
  v30 = *(_QWORD *)(v0 + 160);
  v34 = *(_QWORD *)(v0 + 176);
  v35 = *(_QWORD *)(v0 + 168);
  v31 = *(_QWORD *)(v0 + 120);
  v22(v27, v31);
  sub_23840DE38();
  swift_allocError();
  *(_OWORD *)v32 = xmmword_23842D7A0;
  *(_BYTE *)(v32 + 16) = 4;
  swift_willThrow();
  swift_release();
  swift_release();

  v22(v30, v31);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v29, v35);
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

unint64_t sub_238416F40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t Entity;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD v27[2];
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v36 = sub_23842C5B8();
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v34 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_23842C558();
  v4 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Entity = type metadata accessor for ScheduledQueryEntity();
  v31 = *(_QWORD *)(Entity - 8);
  v32 = Entity;
  v8 = MEMORY[0x24BDAC7A8](Entity);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (_QWORD *)((char *)v27 - v12);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v27 - v14;
  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
    return MEMORY[0x24BEE4AF8];
  v27[0] = a1;
  v27[1] = v1;
  v17 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v29 = *(_QWORD *)(v4 + 72);
  v30 = v4;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  swift_bridgeObjectRetain();
  v18 = MEMORY[0x24BEE4AF8];
  do
  {
    v19 = v33;
    v28(v6, v17, v33);
    *v13 = sub_23842C540();
    v13[1] = v20;
    v13[2] = sub_23842C54C();
    v13[3] = v21;
    v13[4] = sub_23842C534();
    v13[5] = v22;
    v23 = v34;
    sub_23842C528();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v19);
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))((char *)v13 + *(int *)(v32 + 28), v23, v36);
    sub_23840E780((uint64_t)v13, (uint64_t)v15);
    sub_23840E780((uint64_t)v15, (uint64_t)v10);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = sub_2384172FC(0, *(_QWORD *)(v18 + 16) + 1, 1, v18);
    v25 = *(_QWORD *)(v18 + 16);
    v24 = *(_QWORD *)(v18 + 24);
    if (v25 >= v24 >> 1)
      v18 = sub_2384172FC(v24 > 1, v25 + 1, 1, v18);
    *(_QWORD *)(v18 + 16) = v25 + 1;
    sub_23840E780((uint64_t)v10, v18+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v25);
    v17 += v29;
    --v16;
  }
  while (v16);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_2384171EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906958 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256906F60);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_238417284(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return GetScheduledQueriesIntent.perform()(a1);
}

uint64_t sub_2384172D4()
{
  sub_2384178E8();
  return sub_23842C228();
}

uint64_t sub_2384172FC(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_238409F1C(&qword_256906FE0);
  v10 = *(_QWORD *)(type metadata accessor for ScheduledQueryEntity() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23842CB40();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for ScheduledQueryEntity() - 8);
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
    sub_238418E7C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_238417504(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_238417518(a1, a2, a3, a4, &qword_256906FE0, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
}

uint64_t sub_238417518(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_238409F1C(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23842CB4C();
  __break(1u);
  return result;
}

uint64_t sub_2384176F8(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  uint64_t result;
  char *v6[2];

  v2 = *(_QWORD *)(sub_23842C558() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_238418E48(v3);
  v4 = (char *)v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_2384179EC(v6);
  *a1 = v3;
  return result;
}

unint64_t sub_238417778()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256906F98;
  if (!qword_256906F98)
  {
    v1 = sub_23840E888(qword_256906EA8);
    v2 = sub_23840E940(&qword_256906A58, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
    result = MEMORY[0x23B834364](MEMORY[0x24BDB6630], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256906F98);
  }
  return result;
}

unint64_t sub_2384177F8()
{
  unint64_t result;

  result = qword_256906FA0;
  if (!qword_256906FA0)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for GetScheduledQueriesIntent, &type metadata for GetScheduledQueriesIntent);
    atomic_store(result, (unint64_t *)&qword_256906FA0);
  }
  return result;
}

unint64_t sub_238417840()
{
  unint64_t result;

  result = qword_256906FA8;
  if (!qword_256906FA8)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for GetScheduledQueriesIntent, &type metadata for GetScheduledQueriesIntent);
    atomic_store(result, (unint64_t *)&qword_256906FA8);
  }
  return result;
}

uint64_t sub_238417884()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2384178A8()
{
  sub_2384178E8();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2384178E8()
{
  unint64_t result;

  result = qword_256906FB0;
  if (!qword_256906FB0)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for GetScheduledQueriesIntent, &type metadata for GetScheduledQueriesIntent);
    atomic_store(result, (unint64_t *)&qword_256906FB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for GetScheduledQueriesIntent()
{
  return &type metadata for GetScheduledQueriesIntent;
}

uint64_t sub_23841793C()
{
  return sub_2384179A8(&qword_256906FC0, MEMORY[0x24BDB5E68]);
}

uint64_t sub_238417960()
{
  return sub_2384179A8(&qword_256906FD0, MEMORY[0x24BDB5E60]);
}

uint64_t sub_238417984()
{
  return sub_2384179A8(&qword_256906FD8, MEMORY[0x24BDB5E70]);
}

uint64_t sub_2384179A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23840E888(&qword_256906FC8);
    result = MEMORY[0x23B834364](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2384179EC(char **a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char **v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char **v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  char *v65;
  void (*v66)(char *, char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  void (*v137)(char *, char *, uint64_t);
  char *v138;
  char *v139;
  uint64_t v140;
  char **v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v3 = sub_23842C558();
  v145 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v131 = (char *)&v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v142 = (char *)&v127 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v139 = (char *)&v127 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v138 = (char *)&v127 - v10;
  v11 = (uint64_t)a1[1];
  result = sub_23842CB58();
  if (result >= v11)
  {
    if (v11 < 0)
      goto LABEL_141;
    if (v11)
      return sub_238418464(0, v11, 1, a1);
    return result;
  }
  if (v11 >= 0)
    v13 = v11;
  else
    v13 = v11 + 1;
  if (v11 < -1)
    goto LABEL_149;
  v141 = a1;
  v128 = result;
  v134 = v1;
  if (v11 < 2)
  {
    v17 = (char *)MEMORY[0x24BEE4AF8];
    v133 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80));
    v127 = MEMORY[0x24BEE4AF8];
    if (v11 != 1)
    {
      v19 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_107:
      if (v19 >= 2)
      {
        v120 = *v141;
        do
        {
          v121 = v19 - 2;
          if (v19 < 2)
            goto LABEL_136;
          if (!v120)
            goto LABEL_148;
          v122 = *(_QWORD *)&v17[16 * v121 + 32];
          v123 = *(_QWORD *)&v17[16 * v19 + 24];
          v124 = v134;
          sub_2384186DC((unint64_t)&v120[*(_QWORD *)(v145 + 72) * v122], (unint64_t)&v120[*(_QWORD *)(v145 + 72) * *(_QWORD *)&v17[16 * v19 + 16]], (unint64_t)&v120[*(_QWORD *)(v145 + 72) * v123], v133);
          v134 = v124;
          if (v124)
            break;
          if (v123 < v122)
            goto LABEL_137;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v17 = sub_238418E34((uint64_t)v17);
          if (v121 >= *((_QWORD *)v17 + 2))
            goto LABEL_138;
          v125 = &v17[16 * v121 + 32];
          *(_QWORD *)v125 = v122;
          *((_QWORD *)v125 + 1) = v123;
          v126 = *((_QWORD *)v17 + 2);
          if (v19 > v126)
            goto LABEL_139;
          memmove(&v17[16 * v19 + 16], &v17[16 * v19 + 32], 16 * (v126 - v19));
          *((_QWORD *)v17 + 2) = v126 - 1;
          v19 = v126 - 1;
        }
        while (v126 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v127 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v14 = v13 >> 1;
    v15 = sub_23842CA44();
    *(_QWORD *)(v15 + 16) = v14;
    v16 = *(unsigned __int8 *)(v145 + 80);
    v127 = v15;
    v133 = v15 + ((v16 + 32) & ~v16);
  }
  v18 = 0;
  v17 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v20 = v18;
    v21 = v18 + 1;
    v132 = v18;
    if (v18 + 1 >= v11)
    {
      v32 = v18 + 1;
      v41 = v134;
      goto LABEL_58;
    }
    v22 = *v141;
    v143 = v11;
    v23 = v145;
    v24 = *(_QWORD *)(v145 + 72);
    v25 = *(void (**)(_QWORD, _QWORD, _QWORD))(v145 + 16);
    v26 = v138;
    v25(v138, &v22[v24 * v21], v3);
    v27 = &v22[v24 * v20];
    v28 = v139;
    v25(v139, v27, v3);
    v140 = sub_23840E940(&qword_256906FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE18E98], MEMORY[0x24BE18EA8]);
    LODWORD(v137) = sub_23842C9B4();
    v29 = *(void (**)(_QWORD, _QWORD))(v23 + 8);
    v30 = v28;
    v20 = v132;
    v29(v30, v3);
    v29(v26, v3);
    v31 = v22;
    v32 = v20 + 2;
    v135 = v31;
    v144 = v24;
    if (v20 + 2 >= v143)
    {
      v41 = v134;
      v40 = v143;
      v39 = v24;
      if ((v137 & 1) == 0)
        break;
    }
    else
    {
      v129 = v17;
      v136 = v24 * v21;
      v33 = v31;
      v34 = v24 * v32;
      do
      {
        v35 = v32;
        v36 = v138;
        v25(v138, &v33[v34], v3);
        v37 = v139;
        v25(v139, &v33[v136], v3);
        v38 = sub_23842C9B4();
        v29(v37, v3);
        v29(v36, v3);
        if (((v137 ^ v38) & 1) != 0)
        {
          v41 = v134;
          v17 = v129;
          v32 = v35;
          v20 = v132;
          v40 = v143;
          v39 = v144;
          if ((v137 & 1) == 0)
            goto LABEL_38;
          goto LABEL_26;
        }
        v32 = v35 + 1;
        v39 = v144;
        v33 += v144;
      }
      while (v143 != v35 + 1);
      v40 = v143;
      v32 = v143;
      v41 = v134;
      v17 = v129;
      v20 = v132;
      if ((v137 & 1) == 0)
        break;
    }
LABEL_26:
    if (v32 < v20)
      goto LABEL_142;
    if (v20 >= v32)
      break;
    v129 = v17;
    v42 = 0;
    v43 = v39 * (v32 - 1);
    v44 = v32 * v39;
    v45 = v20;
    v46 = v20 * v39;
    v47 = v141;
    v140 = v32;
    do
    {
      if (v45 != v32 + v42 - 1)
      {
        if (!v135)
          goto LABEL_147;
        v48 = v41;
        v49 = &v135[v46];
        v50 = &v135[v43];
        v137 = *(char **)(v145 + 32);
        ((void (*)(char *, char *, uint64_t))v137)(v131, &v135[v46], v3);
        if (v46 < v43 || v49 >= &v135[v44])
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v46 != v43)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        ((void (*)(char *, char *, uint64_t))v137)(v50, v131, v3);
        v41 = v48;
        v32 = v140;
        v47 = v141;
        v39 = v144;
      }
      ++v45;
      --v42;
      v43 -= v39;
      v44 -= v39;
      v46 += v39;
    }
    while (v45 < v32 + v42);
    v17 = v129;
    v20 = v132;
    v40 = v143;
    if (v32 < v143)
      goto LABEL_41;
LABEL_58:
    if (v32 < v20)
      goto LABEL_135;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v134 = v41;
    v140 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_238418C30(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v69 = *((_QWORD *)v17 + 2);
    v68 = *((_QWORD *)v17 + 3);
    v19 = v69 + 1;
    if (v69 >= v68 >> 1)
      v17 = sub_238418C30((char *)(v68 > 1), v69 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v19;
    v70 = v17 + 32;
    v71 = &v17[16 * v69 + 32];
    v72 = v140;
    *(_QWORD *)v71 = v20;
    *((_QWORD *)v71 + 1) = v72;
    if (v69)
    {
      while (1)
      {
        v73 = v19 - 1;
        if (v19 >= 4)
        {
          v78 = &v70[16 * v19];
          v79 = *((_QWORD *)v78 - 8);
          v80 = *((_QWORD *)v78 - 7);
          v84 = __OFSUB__(v80, v79);
          v81 = v80 - v79;
          if (v84)
            goto LABEL_124;
          v83 = *((_QWORD *)v78 - 6);
          v82 = *((_QWORD *)v78 - 5);
          v84 = __OFSUB__(v82, v83);
          v76 = v82 - v83;
          v77 = v84;
          if (v84)
            goto LABEL_125;
          v85 = v19 - 2;
          v86 = &v70[16 * v19 - 32];
          v88 = *(_QWORD *)v86;
          v87 = *((_QWORD *)v86 + 1);
          v84 = __OFSUB__(v87, v88);
          v89 = v87 - v88;
          if (v84)
            goto LABEL_127;
          v84 = __OFADD__(v76, v89);
          v90 = v76 + v89;
          if (v84)
            goto LABEL_130;
          if (v90 >= v81)
          {
            v108 = &v70[16 * v73];
            v110 = *(_QWORD *)v108;
            v109 = *((_QWORD *)v108 + 1);
            v84 = __OFSUB__(v109, v110);
            v111 = v109 - v110;
            if (v84)
              goto LABEL_134;
            v101 = v76 < v111;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            v102 = *((_QWORD *)v17 + 4);
            v103 = *((_QWORD *)v17 + 5);
            v84 = __OFSUB__(v103, v102);
            v95 = v103 - v102;
            v96 = v84;
            goto LABEL_89;
          }
          v75 = *((_QWORD *)v17 + 4);
          v74 = *((_QWORD *)v17 + 5);
          v84 = __OFSUB__(v74, v75);
          v76 = v74 - v75;
          v77 = v84;
        }
        if ((v77 & 1) != 0)
          goto LABEL_126;
        v85 = v19 - 2;
        v91 = &v70[16 * v19 - 32];
        v93 = *(_QWORD *)v91;
        v92 = *((_QWORD *)v91 + 1);
        v94 = __OFSUB__(v92, v93);
        v95 = v92 - v93;
        v96 = v94;
        if (v94)
          goto LABEL_129;
        v97 = &v70[16 * v73];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v84 = __OFSUB__(v98, v99);
        v100 = v98 - v99;
        if (v84)
          goto LABEL_132;
        if (__OFADD__(v95, v100))
          goto LABEL_133;
        if (v95 + v100 >= v76)
        {
          v101 = v76 < v100;
LABEL_95:
          if (v101)
            v73 = v85;
          goto LABEL_97;
        }
LABEL_89:
        if ((v96 & 1) != 0)
          goto LABEL_128;
        v104 = &v70[16 * v73];
        v106 = *(_QWORD *)v104;
        v105 = *((_QWORD *)v104 + 1);
        v84 = __OFSUB__(v105, v106);
        v107 = v105 - v106;
        if (v84)
          goto LABEL_131;
        if (v107 < v95)
          goto LABEL_14;
LABEL_97:
        v112 = v73 - 1;
        if (v73 - 1 >= v19)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        if (!*v141)
          goto LABEL_146;
        v113 = v17;
        v114 = &v70[16 * v112];
        v115 = *(_QWORD *)v114;
        v116 = &v70[16 * v73];
        v117 = *((_QWORD *)v116 + 1);
        v118 = v134;
        sub_2384186DC((unint64_t)&(*v141)[*(_QWORD *)(v145 + 72) * *(_QWORD *)v114], (unint64_t)&(*v141)[*(_QWORD *)(v145 + 72) * *(_QWORD *)v116], (unint64_t)&(*v141)[*(_QWORD *)(v145 + 72) * v117], v133);
        v134 = v118;
        if (v118)
          goto LABEL_118;
        if (v117 < v115)
          goto LABEL_121;
        if (v73 > *((_QWORD *)v113 + 2))
          goto LABEL_122;
        *(_QWORD *)v114 = v115;
        *(_QWORD *)&v70[16 * v112 + 8] = v117;
        v119 = *((_QWORD *)v113 + 2);
        if (v73 >= v119)
          goto LABEL_123;
        v17 = v113;
        v19 = v119 - 1;
        memmove(&v70[16 * v73], v116 + 16, 16 * (v119 - 1 - v73));
        *((_QWORD *)v113 + 2) = v119 - 1;
        if (v119 <= 2)
          goto LABEL_14;
      }
    }
    v19 = 1;
LABEL_14:
    v11 = (uint64_t)v141[1];
    v18 = v140;
    if (v140 >= v11)
      goto LABEL_107;
  }
LABEL_38:
  v47 = v141;
  if (v32 >= v40)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v32, v20))
    goto LABEL_140;
  if (v32 - v20 >= v128)
    goto LABEL_58;
  if (__OFADD__(v20, v128))
    goto LABEL_143;
  if (v20 + v128 >= v40)
    v51 = v40;
  else
    v51 = v20 + v128;
  if (v51 >= v20)
  {
    if (v32 != v51)
    {
      v129 = v17;
      v130 = v51;
      v52 = *(_QWORD *)(v145 + 72);
      v53 = *(char **)(v145 + 16);
      v134 = v41;
      v135 = v53;
      v54 = v52 * (v32 - 1);
      v136 = v52;
      v144 = v32 * v52;
      do
      {
        v56 = 0;
        v140 = v32;
        v137 = (char *)v54;
        while (1)
        {
          v143 = v20;
          v57 = *v47;
          v58 = v138;
          v59 = v47;
          v60 = (void (*)(_QWORD, _QWORD, _QWORD))v135;
          ((void (*)(char *, char *, uint64_t))v135)(v138, &(*v47)[v144 + v56], v3);
          v61 = &v57[v54 + v56];
          v62 = v139;
          v60(v139, v61, v3);
          sub_23840E940(&qword_256906FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE18E98], MEMORY[0x24BE18EA8]);
          LOBYTE(v57) = sub_23842C9B4();
          v63 = *(void (**)(_QWORD, _QWORD))(v145 + 8);
          v63(v62, v3);
          v63(v58, v3);
          if ((v57 & 1) == 0)
            break;
          v64 = *v59;
          if (!*v59)
            goto LABEL_145;
          v54 = (uint64_t)v137;
          v65 = &v137[(_QWORD)v64 + v56];
          v66 = *(void (**)(_QWORD, _QWORD, _QWORD))(v145 + 32);
          v66(v142, &v64[v144 + v56], v3);
          swift_arrayInitWithTakeFrontToBack();
          v66(v65, v142, v3);
          v56 -= v136;
          v20 = v143 + 1;
          v55 = v140;
          v47 = v141;
          if (v140 == v143 + 1)
            goto LABEL_51;
        }
        v55 = v140;
        v47 = v59;
        v54 = (uint64_t)v137;
LABEL_51:
        v32 = v55 + 1;
        v54 += v136;
        v144 += v136;
        v20 = v132;
      }
      while (v32 != v130);
      v32 = v130;
      v41 = v134;
      v17 = v129;
    }
    goto LABEL_58;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  result = sub_23842CB40();
  __break(1u);
  return result;
}

uint64_t sub_238418464(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  _QWORD *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;

  v28 = a1;
  v7 = sub_23842C558();
  v36 = *(_QWORD **)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v32 = (char *)&v26 - v11;
  result = MEMORY[0x24BDAC7A8](v10);
  v31 = (char *)&v26 - v13;
  v34 = a3;
  v27 = a2;
  if (a3 != a2)
  {
    v14 = v36[9];
    v29 = (void (*)(char *, uint64_t, uint64_t))v36[2];
    v30 = a4;
    v38 = v14 * (v34 - 1);
    v33 = v14;
    v37 = v14 * v34;
LABEL_5:
    v15 = 0;
    v16 = v28;
    while (1)
    {
      v17 = *a4;
      v18 = v31;
      v19 = v29;
      v29(v31, v37 + v15 + *a4, v7);
      v20 = v32;
      v19(v32, v38 + v15 + v17, v7);
      sub_23840E940(&qword_256906FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE18E98], MEMORY[0x24BE18EA8]);
      LOBYTE(v17) = sub_23842C9B4();
      v21 = (void (*)(char *, uint64_t))v36[1];
      v22 = v20;
      a4 = v30;
      v21(v22, v7);
      result = ((uint64_t (*)(char *, uint64_t))v21)(v18, v7);
      if ((v17 & 1) == 0)
      {
LABEL_4:
        v38 += v33;
        v37 += v33;
        if (++v34 == v27)
          return result;
        goto LABEL_5;
      }
      v23 = *a4;
      if (!*a4)
        break;
      v24 = v23 + v38 + v15;
      v25 = (void (*)(char *, uint64_t, uint64_t))v36[4];
      v25(v35, v23 + v37 + v15, v7);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v25)(v24, v35, v7);
      v15 -= v33;
      if (v34 == ++v16)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2384186DC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19)(char *, unint64_t, uint64_t);
  unint64_t v20;
  char *v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t result;
  uint64_t v42;
  void (*v43)(char *, unint64_t, uint64_t);
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;

  v8 = sub_23842C558();
  v9 = *(_QWORD **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v47 = (char *)&v42 - v12;
  v49 = v9[9];
  if (!v49)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v49 == -1)
    goto LABEL_62;
  v13 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v49 == -1)
    goto LABEL_63;
  v14 = (uint64_t)(a2 - a1) / v49;
  v52 = a1;
  v51 = a4;
  v15 = v13 / v49;
  if (v14 >= v13 / v49)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      v17 = v15 * v49;
      if (a4 < a2 || a2 + v17 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v28 = a4 + v17;
      v50 = a4 + v17;
      v52 = a2;
      if (v17 >= 1 && a1 < a2)
      {
        v30 = -v49;
        v43 = (void (*)(char *, unint64_t, uint64_t))v9[2];
        v44 = v9;
        v45 = a4;
        v46 = a1;
        do
        {
          v49 = a3 + v30;
          v31 = v47;
          v32 = v43;
          v43(v47, v28 + v30, v8);
          v33 = a2 + v30;
          v34 = v30;
          v35 = v48;
          v32(v48, v33, v8);
          sub_23840E940(&qword_256906FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE18E98], MEMORY[0x24BE18EA8]);
          LOBYTE(v32) = sub_23842C9B4();
          v36 = (void (*)(char *, uint64_t))v9[1];
          v36(v35, v8);
          v36(v31, v8);
          if ((v32 & 1) != 0)
          {
            v30 = v34;
            v37 = v49;
            if (a3 < a2 || v49 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v9 = v44;
              v38 = v45;
              v39 = v46;
            }
            else
            {
              v9 = v44;
              v38 = v45;
              v39 = v46;
              if (a3 != a2)
                swift_arrayInitWithTakeBackToFront();
            }
            v52 += v30;
          }
          else
          {
            v40 = v50;
            v50 += v34;
            v30 = v34;
            v37 = v49;
            if (a3 < v40 || v49 >= v40)
            {
              swift_arrayInitWithTakeFrontToBack();
              v33 = a2;
              v9 = v44;
              v38 = v45;
              v39 = v46;
            }
            else
            {
              v9 = v44;
              v38 = v45;
              v39 = v46;
              if (a3 != v40)
                swift_arrayInitWithTakeBackToFront();
              v33 = a2;
            }
          }
          v28 = v50;
          if (v50 <= v38)
            break;
          a2 = v33;
          a3 = v37;
        }
        while (v33 > v39);
      }
      goto LABEL_60;
    }
  }
  else if ((v14 & 0x8000000000000000) == 0)
  {
    v16 = v14 * v49;
    if (a4 < a1 || a1 + v16 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v46 = a4 + v16;
    v50 = a4 + v16;
    if (v16 >= 1 && a2 < a3)
    {
      v19 = (void (*)(char *, unint64_t, uint64_t))v9[2];
      do
      {
        v20 = a3;
        v21 = v47;
        v19(v47, a2, v8);
        v22 = v48;
        v19(v48, a4, v8);
        sub_23840E940(&qword_256906FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE18E98], MEMORY[0x24BE18EA8]);
        v23 = sub_23842C9B4();
        v24 = (void (*)(char *, uint64_t))v9[1];
        v24(v22, v8);
        v24(v21, v8);
        v25 = v52;
        if ((v23 & 1) != 0)
        {
          v26 = a2 + v49;
          if (v52 < a2 || v52 >= v26)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v20;
          }
          else
          {
            a3 = v20;
            if (v52 == a2)
              v25 = a2;
            else
              swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v27 = v51 + v49;
          if (v52 < v51 || v52 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v20;
          }
          else
          {
            a3 = v20;
            if (v52 != v51)
              swift_arrayInitWithTakeBackToFront();
          }
          v51 = v27;
          v26 = a2;
        }
        v52 = v25 + v49;
        a4 = v51;
        if (v51 >= v46)
          break;
        a2 = v26;
      }
      while (v26 < a3);
    }
LABEL_60:
    sub_238418D28(&v52, &v51, (uint64_t *)&v50);
    return 1;
  }
LABEL_64:
  result = sub_23842CB4C();
  __break(1u);
  return result;
}

char *sub_238418C30(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    sub_238409F1C(&qword_256906FF0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_238418D28(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_23842C558();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_23842CB4C();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_238418E34(uint64_t a1)
{
  return sub_238418C30(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_238418E48(_QWORD *a1)
{
  return sub_238417518(0, a1[2], 0, a1, &qword_256906FF8, (uint64_t (*)(_QWORD))MEMORY[0x24BE18E98]);
}

uint64_t sub_238418E7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for ScheduledQueryEntity() - 8);
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
  result = sub_23842CB4C();
  __break(1u);
  return result;
}

uint64_t DateSnippetView.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23842C4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t DateSnippetView.date.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23842C4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*DateSnippetView.date.modify())()
{
  return nullsub_1;
}

uint64_t DateSnippetView.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t DateSnippetView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v1 = sub_23842C7D4();
  sub_2384191A0(v0, (uint64_t)&v19);
  v2 = v19;
  v3 = v20;
  v4 = v21;
  v6 = v22;
  v5 = v23;
  v7 = v25;
  v8 = v26;
  v9 = v27;
  v11 = v28;
  v10 = v29;
  v16 = v25;
  v12 = v30;
  v17 = v30;
  v18 = v29;
  v13 = v31;
  v14 = v32;
  v40 = 1;
  v39 = v21;
  v38 = v24;
  v37 = v27;
  v36 = v31;
  v19 = v1;
  v20 = 0;
  v21 = 1;
  v22 = v2;
  v23 = v3;
  v24 = v39;
  v25 = v6;
  v26 = v5;
  v27 = v38;
  v28 = v7;
  v29 = v8;
  LOBYTE(v30) = v37;
  v31 = v11;
  v32 = v10;
  v33 = v12;
  v34 = v36;
  v35 = v14;
  sub_23842C870();
  sub_238409F1C(&qword_256907000);
  sub_238419404();
  sub_23842C93C();
  sub_23840F884(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23840F884(v16, v8, v9);
  swift_bridgeObjectRelease();
  sub_23840F884(v18, v17, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2384191A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;

  v37 = a1;
  v3 = sub_23842C8E8();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_23842C4B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23842C828();
  v8 = sub_23842C900();
  v10 = v9;
  v12 = v11 & 1;
  v13 = sub_23842C8B8();
  v38 = v14;
  v39 = v13;
  v36 = v15;
  HIDWORD(v35) = v16 & 1;
  sub_23840F884(v8, v10, v12);
  swift_bridgeObjectRelease();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v18 = v37;
  v17(v7, v37, v4);
  sub_23842C8D0();
  v19 = sub_23842C8F4();
  v21 = v20;
  v23 = v22;
  v25 = v24 & 1;
  v17(v7, v18, v4);
  sub_23842C8DC();
  v26 = sub_23842C8F4();
  v28 = v27;
  v29 = BYTE4(v35);
  v41 = BYTE4(v35);
  v40 = v25;
  LOBYTE(v17) = v30 & 1;
  v32 = v38;
  v31 = v39;
  *(_QWORD *)a2 = v39;
  *(_QWORD *)(a2 + 8) = v32;
  *(_BYTE *)(a2 + 16) = v29;
  *(_QWORD *)(a2 + 24) = v36;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v21;
  *(_BYTE *)(a2 + 64) = v25;
  *(_QWORD *)(a2 + 72) = v23;
  *(_QWORD *)(a2 + 80) = v26;
  *(_QWORD *)(a2 + 88) = v28;
  *(_BYTE *)(a2 + 96) = v30 & 1;
  *(_QWORD *)(a2 + 104) = v33;
  sub_23840F7DC(v31, v32, v29);
  swift_bridgeObjectRetain();
  sub_23840F7DC(v19, v21, v25);
  swift_bridgeObjectRetain();
  sub_23840F7DC(v26, v28, (char)v17);
  swift_bridgeObjectRetain();
  sub_23840F884(v26, v28, (char)v17);
  swift_bridgeObjectRelease();
  sub_23840F884(v19, v21, v40);
  swift_bridgeObjectRelease();
  sub_23840F884(v39, v38, v41);
  return swift_bridgeObjectRelease();
}

unint64_t sub_238419404()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256907008;
  if (!qword_256907008)
  {
    v1 = sub_23840E888(&qword_256907000);
    result = MEMORY[0x23B834364](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_256907008);
  }
  return result;
}

uint64_t sub_238419450()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238419460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v1 = sub_23842C7D4();
  sub_2384191A0(v0, (uint64_t)&v19);
  v2 = v19;
  v3 = v20;
  v4 = v21;
  v6 = v22;
  v5 = v23;
  v7 = v25;
  v8 = v26;
  v9 = v27;
  v11 = v28;
  v10 = v29;
  v16 = v25;
  v12 = v30;
  v17 = v30;
  v18 = v29;
  v13 = v31;
  v14 = v32;
  v40 = 1;
  v39 = v21;
  v38 = v24;
  v37 = v27;
  v36 = v31;
  v19 = v1;
  v20 = 0;
  v21 = 1;
  v22 = v2;
  v23 = v3;
  v24 = v39;
  v25 = v6;
  v26 = v5;
  v27 = v38;
  v28 = v7;
  v29 = v8;
  LOBYTE(v30) = v37;
  v31 = v11;
  v32 = v10;
  v33 = v12;
  v34 = v36;
  v35 = v14;
  sub_23842C870();
  sub_238409F1C(&qword_256907000);
  sub_238419404();
  sub_23842C93C();
  sub_23840F884(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23840F884(v16, v8, v9);
  swift_bridgeObjectRelease();
  sub_23840F884(v18, v17, v13);
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DateSnippetView(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23842C4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DateSnippetView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23841973C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DateSnippetView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238419784(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23842C4B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DateSnippetView()
{
  uint64_t result;

  result = qword_256907068;
  if (!qword_256907068)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_238419800()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23842C4B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_238419868()
{
  sub_23840E888(&qword_256907000);
  sub_238419404();
  return swift_getOpaqueTypeConformance2();
}

id ExitLocationSnippetView.placemark.getter()
{
  id *v0;

  return *v0;
}

void ExitLocationSnippetView.placemark.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*ExitLocationSnippetView.placemark.modify())()
{
  return nullsub_1;
}

double ExitLocationSnippetView.radius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void ExitLocationSnippetView.radius.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*ExitLocationSnippetView.radius.modify())()
{
  return nullsub_1;
}

uint64_t ExitLocationSnippetView.init(placemark:radius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_QWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t ExitLocationSnippetView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(void **)v1;
  type metadata accessor for LocationSnippetView();
  v5 = v4;
  result = sub_23842C480();
  *a1 = v5;
  a1[1] = v3;
  return result;
}

uint64_t sub_238419990()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for ExitLocationSnippetView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for ExitLocationSnippetView(id *a1)
{

}

uint64_t assignWithCopy for ExitLocationSnippetView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

__n128 initializeWithTake for ExitLocationSnippetView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ExitLocationSnippetView(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ExitLocationSnippetView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExitLocationSnippetView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExitLocationSnippetView()
{
  return &type metadata for ExitLocationSnippetView;
}

unint64_t sub_238419B00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569070A0;
  if (!qword_2569070A0)
  {
    v1 = type metadata accessor for LocationSnippetView();
    result = MEMORY[0x23B834364](&unk_23842E014, v1);
    atomic_store(result, (unint64_t *)&qword_2569070A0);
  }
  return result;
}

uint64_t sub_238419B4C()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_2569070A8);
  sub_238409554(v0, (uint64_t)qword_2569070A8);
  return sub_23842C480();
}

uint64_t static RunScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384113C0(&qword_256906968, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_2569070A8, a1);
}

uint64_t static RunScheduledQueryIntent.title.setter(uint64_t a1)
{
  return sub_238411470(a1, &qword_256906968, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_2569070A8);
}

uint64_t (*static RunScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906968 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_2569070A8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_238419C70()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23842C4A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_23842C324();
  sub_23840EE34(v5, qword_2569070C0);
  sub_238409554(v5, (uint64_t)qword_2569070C0);
  sub_23842C480();
  sub_23842C480();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  sub_238409F1C(&qword_256906D48);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23842D2A0;
  sub_23842C480();
  sub_23842C480();
  return sub_23842C33C();
}

uint64_t static RunScheduledQueryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384113C0(&qword_256906970, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_2569070C0, a1);
}

uint64_t static RunScheduledQueryIntent.description.setter(uint64_t a1)
{
  return sub_238411470(a1, &qword_256906970, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_2569070C0);
}

uint64_t (*static RunScheduledQueryIntent.description.modify())()
{
  uint64_t v0;

  if (qword_256906970 != -1)
    swift_once();
  v0 = sub_23842C324();
  sub_238409554(v0, (uint64_t)qword_2569070C0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t RunScheduledQueryIntent.scheduledQuery.getter()
{
  return sub_23842C2A0();
}

uint64_t sub_238419F04(uint64_t a1)
{
  uint64_t Entity;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  Entity = type metadata accessor for ScheduledQueryEntity();
  v3 = MEMORY[0x24BDAC7A8](Entity);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_23840E7C4(a1, (uint64_t)&v9 - v6);
  sub_23840E7C4((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_23842C2AC();
  sub_23840E808((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  return swift_release();
}

uint64_t RunScheduledQueryIntent.scheduledQuery.setter(uint64_t a1)
{
  uint64_t Entity;
  uint64_t v3;
  uint64_t v5;

  Entity = type metadata accessor for ScheduledQueryEntity();
  MEMORY[0x24BDAC7A8](Entity);
  sub_23840E7C4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23842C2AC();
  return sub_23840E808(a1, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
}

void (*RunScheduledQueryIntent.scheduledQuery.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_23840A1F0;
}

uint64_t RunScheduledQueryIntent.$scheduledQuery.getter()
{
  return sub_23842C2B8();
}

uint64_t RunScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t Entity;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v22;
  uint64_t *v23;

  v23 = a1;
  v22 = sub_23842C3C0();
  v1 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_238409F1C(&qword_2569069C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - v8;
  v10 = sub_238409F1C(&qword_2569070D8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23842C4A4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  sub_238409F1C(&qword_2569070E0);
  sub_23842C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 56))(v12, 1, 1, Entity);
  v19 = sub_23842C24C();
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v9, 1, 1, v19);
  v20(v7, 1, 1, v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDB6090], v22);
  sub_23840E940((unint64_t *)&qword_256906A80, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  result = sub_23842C2D0();
  *v23 = result;
  return result;
}

uint64_t RunScheduledQueryIntent.init(scheduledQuery:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t Entity;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;

  v35 = a1;
  v36 = a2;
  Entity = type metadata accessor for ScheduledQueryEntity();
  v30 = *(_QWORD *)(Entity - 8);
  v31 = Entity;
  v3 = MEMORY[0x24BDAC7A8](Entity);
  v34 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - v5;
  v7 = sub_23842C3C0();
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_238409F1C(&qword_2569069C0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - v14;
  v16 = sub_238409F1C(&qword_2569070D8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23842C4A4();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  sub_238409F1C(&qword_2569070E0);
  sub_23842C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v21, 1, 1, v22);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v18, 1, 1, v31);
  v24 = sub_23842C24C();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v15, 1, 1, v24);
  v25(v13, 1, 1, v24);
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v9, *MEMORY[0x24BDB6090], v33);
  sub_23840E940((unint64_t *)&qword_256906A80, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  v26 = sub_23842C2D0();
  v27 = v35;
  sub_23840E7C4(v35, (uint64_t)v6);
  sub_23840E7C4((uint64_t)v6, v34);
  swift_retain();
  sub_23842C2AC();
  sub_23840E808((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  swift_release();
  result = sub_23840E808(v27, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  *v36 = v26;
  return result;
}

uint64_t RunScheduledQueryIntent.perform()(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2[12] = a1;
  v2[13] = type metadata accessor for ScheduledQuerySnippetView();
  v2[14] = swift_task_alloc();
  v3 = sub_23842C24C();
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v4 = sub_23842C4A4();
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = swift_task_alloc();
  v5 = sub_23842C5B8();
  v2[21] = v5;
  v2[22] = *(_QWORD *)(v5 - 8);
  v2[23] = swift_task_alloc();
  v6 = sub_23842C72C();
  v2[24] = v6;
  v2[25] = *(_QWORD *)(v6 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v7 = sub_23842C6FC();
  v2[28] = v7;
  v2[29] = *(_QWORD *)(v7 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v8 = sub_23842C798();
  v2[34] = v8;
  v2[35] = *(_QWORD *)(v8 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v9 = sub_23842C720();
  v2[38] = v9;
  v2[39] = *(_QWORD *)(v9 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = type metadata accessor for ScheduledQueryEntity();
  v10 = swift_task_alloc();
  v11 = *v1;
  v2[42] = v10;
  v2[43] = v11;
  return swift_task_switch();
}

uint64_t sub_23841A838()
{
  _QWORD *v0;
  _QWORD *v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, uint64_t);
  uint8_t *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = (_QWORD *)v0[42];
  swift_retain();
  sub_23842C2A0();
  swift_release();
  v0[44] = *v1;
  v0[45] = v1[1];
  swift_bridgeObjectRetain();
  sub_23840E808((uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v2 = sub_23842C714();
  v3 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v4 = v0[32];
    v5 = v0[28];
    v6 = v0[29];
    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16);
    v7(v4, v0[33], v5);
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    v9 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v2, v3, v9, "CE.Intent.Run", "", v8, 2u);
    MEMORY[0x23B8343E8](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v10 = v0[29];

    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16);
  }
  v0[46] = v7;
  v7(v0[32], v0[33], v0[28]);
  sub_23842C75C();
  swift_allocObject();
  v0[47] = sub_23842C750();
  sub_23842C684();
  v0[48] = sub_23842C678();
  v11 = (_QWORD *)swift_task_alloc();
  v0[49] = v11;
  *v11 = v0;
  v11[1] = sub_23841AA24;
  return sub_23842C660();
}

uint64_t sub_23841AA24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[50] = v2;
  swift_task_dealloc();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_23841AAA4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v1);
  v2 = sub_23842C714();
  sub_23842C744();
  v3 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 216);
    v6 = *(_QWORD *)(v0 + 192);
    v5 = *(_QWORD *)(v0 + 200);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x24BEE7810])
    {
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
      v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v7 = 1;
    }
    v14 = *(_QWORD *)(v0 + 248);
    v13 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 224);
    v16 = *(_QWORD *)(v0 + 232);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 368))(v13, v14, v15);
    v17 = swift_slowAlloc();
    *(_BYTE *)v17 = 0;
    *(_BYTE *)(v17 + 1) = v7;
    *(_WORD *)(v17 + 2) = 2050;
    *(_QWORD *)(v0 + 88) = 0;
    sub_23842CAEC();
    v18 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v2, v3, v18, "CE.Intent.Run", v8, (uint8_t *)v17, 0xCu);
    MEMORY[0x23B8343E8](v17, -1, -1);

    v12 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v12(v14, v15);
    v12(v13, v15);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 224);
    v11 = *(_QWORD *)(v0 + 232);

    v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v12(v9, v10);
  }
  *(_QWORD *)(v0 + 408) = v12;
  v19 = *(_QWORD *)(v0 + 32);
  v20 = *(_QWORD *)(v0 + 336);
  v21 = *(_QWORD *)(v0 + 328);
  v23 = *(_QWORD *)(v0 + 176);
  v22 = *(_QWORD *)(v0 + 184);
  v25 = *(_QWORD *)(v0 + 160);
  v24 = *(_QWORD *)(v0 + 168);
  v29 = *(_QWORD *)(v0 + 152);
  v30 = *(_QWORD *)(v0 + 144);
  v31 = *(_QWORD *)(v0 + 24);
  swift_retain();
  sub_23842C2A0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v20 + *(int *)(v21 + 28), v24);
  sub_23840E808(v20, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  sub_23842C5A0();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  sub_23842C498();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v25, v30);
  swift_bridgeObjectRelease();
  sub_23842CA2C();
  if (v19)
    v26 = v31;
  else
    v26 = 0;
  if (v19)
    v27 = v19;
  else
    v27 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_23842CA2C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 48) = v26;
  *(_QWORD *)(v0 + 56) = v27;
  sub_23842C240();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  sub_23842CA74();
  *(_QWORD *)(v0 + 416) = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_23841ADFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 112);
  swift_release();
  sub_23840E780(v1, v2);
  return swift_task_switch();
}

uint64_t sub_23841AE4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;

  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
  v11 = *(_QWORD *)(v0 + 320);
  v8 = *(_QWORD *)(v0 + 312);
  v9 = *(_QWORD *)(v0 + 304);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  sub_23841B690();
  sub_23840E940(&qword_256906A60, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView, (uint64_t)&protocol conformance descriptor for ScheduledQuerySnippetView);
  sub_23842C264();
  swift_release();
  sub_23840E808(v3, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_bridgeObjectRelease();
  v10(v7, v6);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v9);
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
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23841B024()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  const char *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_signpost_id_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v1 = *(void **)(v0 + 400);
  swift_release();
  sub_23842C774();
  swift_bridgeObjectRetain();
  v2 = v1;
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = sub_23842C78C();
  v5 = sub_23842CA8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 400);
    v7 = *(_QWORD *)(v0 + 352);
    v8 = *(_QWORD *)(v0 + 360);
    v47 = *(_QWORD *)(v0 + 288);
    v44 = *(_QWORD *)(v0 + 280);
    v45 = *(_QWORD *)(v0 + 272);
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    v48 = v43;
    *(_DWORD *)v9 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 72) = sub_23840E030(v7, v8, &v48);
    sub_23842CAEC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2112;
    v11 = v6;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v12;
    sub_23842CAEC();
    *v10 = v12;

    _os_log_impl(&dword_238407000, v4, v5, "Failed to run task %s: %@", (uint8_t *)v9, 0x16u);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v43, -1, -1);
    MEMORY[0x23B8343E8](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v47, v45);
  }
  else
  {
    v13 = *(void **)(v0 + 400);
    v15 = *(_QWORD *)(v0 + 280);
    v14 = *(_QWORD *)(v0 + 288);
    v16 = *(_QWORD *)(v0 + 272);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  v17 = (uint64_t *)(v0 + 240);
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v18);
  v19 = sub_23842C714();
  sub_23842C744();
  v20 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 208);
    v23 = *(_QWORD *)(v0 + 192);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 88))(v22, v23) == *MEMORY[0x24BEE7810])
    {
      v24 = 0;
      v25 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
      v25 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v24 = 1;
    }
    v17 = (uint64_t *)(v0 + 256);
    v28 = *(_QWORD *)(v0 + 240);
    v46 = *(_QWORD *)(v0 + 232);
    v29 = *(_QWORD *)(v0 + 224);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 368))(*(_QWORD *)(v0 + 256), v28, v29);
    v30 = swift_slowAlloc();
    *(_BYTE *)v30 = 0;
    *(_BYTE *)(v30 + 1) = v24;
    *(_WORD *)(v30 + 2) = 2050;
    *(_QWORD *)(v0 + 64) = 1;
    sub_23842CAEC();
    v31 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v19, v20, v31, "CE.Intent.Run", v25, (uint8_t *)v30, 0xCu);
    MEMORY[0x23B8343E8](v30, -1, -1);

    v27 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
    v27(v28, v29);
  }
  else
  {
    v26 = *(_QWORD *)(v0 + 232);

    v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  }
  v32 = *v17;
  v33 = *(void **)(v0 + 400);
  v35 = *(_QWORD *)(v0 + 352);
  v34 = *(_QWORD *)(v0 + 360);
  v36 = *(_QWORD *)(v0 + 320);
  v41 = *(_QWORD *)(v0 + 312);
  v42 = *(_QWORD *)(v0 + 304);
  v37 = *(_QWORD *)(v0 + 264);
  v38 = *(_QWORD *)(v0 + 224);
  v27(v32, v38);
  sub_23840DE38();
  swift_allocError();
  *(_QWORD *)v39 = v35;
  *(_QWORD *)(v39 + 8) = v34;
  *(_BYTE *)(v39 + 16) = 1;
  swift_willThrow();
  swift_release();

  v27(v37, v38);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v36, v42);
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
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23841B57C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906968 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_2569070A8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23841B614(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return RunScheduledQueryIntent.perform()(a1);
}

uint64_t sub_23841B668()
{
  sub_23841B7C8();
  return sub_23842C228();
}

unint64_t sub_23841B690()
{
  unint64_t result;

  result = qword_2569070F0;
  if (!qword_2569070F0)
  {
    result = MEMORY[0x23B834364](MEMORY[0x24BDB6610], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569070F0);
  }
  return result;
}

unint64_t sub_23841B6D8()
{
  unint64_t result;

  result = qword_2569070F8;
  if (!qword_2569070F8)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for RunScheduledQueryIntent, &type metadata for RunScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_2569070F8);
  }
  return result;
}

unint64_t sub_23841B720()
{
  unint64_t result;

  result = qword_256907100;
  if (!qword_256907100)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for RunScheduledQueryIntent, &type metadata for RunScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907100);
  }
  return result;
}

uint64_t sub_23841B764()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_23841B788()
{
  sub_23841B7C8();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23841B7C8()
{
  unint64_t result;

  result = qword_256907108;
  if (!qword_256907108)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for RunScheduledQueryIntent, &type metadata for RunScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907108);
  }
  return result;
}

uint64_t sub_23841B80C()
{
  swift_retain();
  sub_23842C2A0();
  return swift_release();
}

ValueMetadata *type metadata accessor for RunScheduledQueryIntent()
{
  return &type metadata for RunScheduledQueryIntent;
}

uint64_t sub_23841B854()
{
  return sub_23841B8C0(&qword_256907118, MEMORY[0x24BDB5E68]);
}

uint64_t sub_23841B878()
{
  return sub_23841B8C0(&qword_256907128, MEMORY[0x24BDB5E60]);
}

uint64_t sub_23841B89C()
{
  return sub_23841B8C0(&qword_256907130, MEMORY[0x24BDB5E70]);
}

uint64_t sub_23841B8C0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23840E888(&qword_256907120);
    result = MEMORY[0x23B834364](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

ConditionalEngineAppIntents::ListScheduledQueriesSnippetView __swiftcall ListScheduledQueriesSnippetView.init(queries:)(ConditionalEngineAppIntents::ListScheduledQueriesSnippetView queries)
{
  ConditionalEngineAppIntents::ListScheduledQueriesSnippetView *v1;

  v1->queries._rawValue = queries.queries._rawValue;
  return queries;
}

uint64_t ListScheduledQueriesSnippetView.queries.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ListScheduledQueriesSnippetView.queries.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ListScheduledQueriesSnippetView.queries.modify())()
{
  return nullsub_1;
}

uint64_t ListScheduledQueriesSnippetView.body.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];

  v1 = sub_238409F1C(&qword_256907138);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  *(_QWORD *)v3 = sub_23842C84C();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  sub_238409F1C(&qword_256907140);
  v6[1] = v4;
  swift_bridgeObjectRetain();
  sub_238409F1C(qword_256906EA8);
  type metadata accessor for ScheduledQueryEntityView();
  sub_23840ED94(&qword_256907148, qword_256906EA8, MEMORY[0x24BEE12D8]);
  sub_23840E940(&qword_256907150, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntityView, (uint64_t)&unk_23842E2DC);
  sub_23840E940(&qword_256906E38, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  sub_23842C99C();
  sub_23842C870();
  sub_23840ED94(&qword_256907158, &qword_256907138, MEMORY[0x24BDF4700]);
  sub_23842C93C();
  return sub_23841BB00((uint64_t)v3);
}

uint64_t sub_23841BAF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23840E7C4(a1, a2);
}

uint64_t sub_23841BB00(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238409F1C(&qword_256907138);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23841BB40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23841BB50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];

  v1 = sub_238409F1C(&qword_256907138);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  *(_QWORD *)v3 = sub_23842C84C();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  sub_238409F1C(&qword_256907140);
  v6[1] = v4;
  swift_bridgeObjectRetain();
  sub_238409F1C(qword_256906EA8);
  type metadata accessor for ScheduledQueryEntityView();
  sub_23840ED94(&qword_256907148, qword_256906EA8, MEMORY[0x24BEE12D8]);
  sub_23840E940(&qword_256907150, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntityView, (uint64_t)&unk_23842E2DC);
  sub_23840E940(&qword_256906E38, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  sub_23842C99C();
  sub_23842C870();
  sub_23840ED94(&qword_256907158, &qword_256907138, MEMORY[0x24BDF4700]);
  sub_23842C93C();
  return sub_23841BB00((uint64_t)v3);
}

ValueMetadata *type metadata accessor for ListScheduledQueriesSnippetView()
{
  return &type metadata for ListScheduledQueriesSnippetView;
}

uint64_t sub_23841BD0C()
{
  sub_23840E888(&qword_256907138);
  sub_23840ED94(&qword_256907158, &qword_256907138, MEMORY[0x24BDF4700]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23841BD70()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_256907160);
  sub_238409554(v0, (uint64_t)qword_256907160);
  return sub_23842C480();
}

uint64_t static CreateDateScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906978 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907160);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateDateScheduledQueryIntent.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_256906978 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907160);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateDateScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906978 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256907160);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateDateScheduledQueryIntent.query.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t sub_23841BFC0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23841C020()
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  return swift_release();
}

uint64_t CreateDateScheduledQueryIntent.query.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateDateScheduledQueryIntent.query.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateDateScheduledQueryIntent.$query.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateDateScheduledQueryIntent.date.getter()
{
  return sub_23842C2A0();
}

uint64_t sub_23841C130()
{
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  return swift_release();
}

uint64_t sub_23841C17C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = sub_23842C4B0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
  return swift_release();
}

uint64_t CreateDateScheduledQueryIntent.date.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23842C4B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_23842C2AC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*CreateDateScheduledQueryIntent.date.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateDateScheduledQueryIntent.$date.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateDateScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a1;
  v1 = sub_238409F1C(&qword_256907178);
  v29 = *(_QWORD *)(v1 - 8);
  v30 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v28 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23842C3C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23842C4A4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v26 = sub_238409F1C(&qword_2569069D8);
  sub_23842C480();
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v27(v15, 1, 1, v16);
  v18 = sub_23842C9C0();
  v32 = 0;
  v33 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
  v19 = sub_23842C24C();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v25(v9, 1, 1, v19);
  v20 = *MEMORY[0x24BDB6090];
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v21(v6, v20, v3);
  v26 = sub_23842C300();
  sub_238409F1C(&qword_256907180);
  sub_23842C480();
  v27(v15, 1, 1, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v28, *MEMORY[0x24BDB54F0], v30);
  v25(v9, 1, 1, v19);
  v21(v6, v20, v3);
  result = sub_23842C2F4();
  v23 = v31;
  *v31 = v26;
  v23[1] = result;
  return result;
}

uint64_t CreateDateScheduledQueryIntent.init(query:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t *a4@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t result;
  uint64_t *v37;
  void (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v52 = a3;
  v53 = a4;
  v46 = a1;
  v47 = a2;
  v4 = sub_23842C4B0();
  v50 = *(_QWORD *)(v4 - 8);
  v51 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)&v38 - v7;
  v8 = sub_238409F1C(&qword_256907178);
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_23842C3C0();
  v10 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23842C4A4();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v40 = sub_238409F1C(&qword_2569069D8);
  sub_23842C480();
  v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  v41(v21, 1, 1, v22);
  v24 = sub_23842C9C0();
  v54 = 0;
  v55 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 1, 1, v24);
  v25 = sub_23842C24C();
  v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v39(v15, 1, 1, v25);
  v26 = *MEMORY[0x24BDB6090];
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v27 = v42;
  v38(v12, v26, v42);
  v28 = sub_23842C300();
  sub_238409F1C(&qword_256907180);
  swift_retain();
  sub_23842C480();
  v41(v21, 1, 1, v22);
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDB54F0], v45);
  v39(v15, 1, 1, v25);
  v38(v12, v26, v27);
  v29 = sub_23842C2F4();
  v54 = v46;
  v55 = v47;
  swift_retain_n();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  v31 = v50;
  v30 = v51;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  v33 = v48;
  v34 = v52;
  v32(v48, (uint64_t)v52, v51);
  v32(v49, (uint64_t)v33, v30);
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  v35 = *(void (**)(char *, uint64_t))(v31 + 8);
  v35(v33, v30);
  v35(v34, v30);
  swift_release_n();
  result = swift_release_n();
  v37 = v53;
  *v53 = v28;
  v37[1] = v29;
  return result;
}

uint64_t CreateDateScheduledQueryIntent.perform()(uint64_t a1)
{
  _OWORD *v1;
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

  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = type metadata accessor for ScheduledQuerySnippetView();
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  sub_23842C4A4();
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  v3 = sub_23842C24C();
  *(_QWORD *)(v2 + 216) = v3;
  *(_QWORD *)(v2 + 224) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 232) = swift_task_alloc();
  v4 = sub_23842C5B8();
  *(_QWORD *)(v2 + 240) = v4;
  *(_QWORD *)(v2 + 248) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = type metadata accessor for ScheduledQueryEntity();
  *(_QWORD *)(v2 + 272) = swift_task_alloc();
  *(_QWORD *)(v2 + 280) = swift_task_alloc();
  v5 = sub_23842C72C();
  *(_QWORD *)(v2 + 288) = v5;
  *(_QWORD *)(v2 + 296) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 304) = swift_task_alloc();
  *(_QWORD *)(v2 + 312) = swift_task_alloc();
  v6 = sub_23842C4B0();
  *(_QWORD *)(v2 + 320) = v6;
  *(_QWORD *)(v2 + 328) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 336) = swift_task_alloc();
  v7 = sub_23842C558();
  *(_QWORD *)(v2 + 344) = v7;
  *(_QWORD *)(v2 + 352) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 360) = swift_task_alloc();
  *(_QWORD *)(v2 + 368) = swift_task_alloc();
  v8 = sub_23842C6FC();
  *(_QWORD *)(v2 + 376) = v8;
  *(_QWORD *)(v2 + 384) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v2 + 392) = swift_task_alloc();
  *(_QWORD *)(v2 + 400) = swift_task_alloc();
  *(_QWORD *)(v2 + 408) = swift_task_alloc();
  *(_QWORD *)(v2 + 416) = swift_task_alloc();
  v9 = sub_23842C720();
  *(_QWORD *)(v2 + 424) = v9;
  *(_QWORD *)(v2 + 432) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v2 + 440) = swift_task_alloc();
  v10 = sub_23842C39C();
  *(_QWORD *)(v2 + 448) = v10;
  *(_QWORD *)(v2 + 456) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v2 + 464) = swift_task_alloc();
  v11 = sub_238409F1C(&qword_256906A18);
  *(_QWORD *)(v2 + 472) = v11;
  *(_QWORD *)(v2 + 480) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v2 + 488) = swift_task_alloc();
  v12 = sub_23842C798();
  *(_QWORD *)(v2 + 496) = v12;
  *(_QWORD *)(v2 + 504) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v2 + 512) = swift_task_alloc();
  *(_QWORD *)(v2 + 520) = swift_task_alloc();
  *(_QWORD *)(v2 + 528) = swift_task_alloc();
  *(_QWORD *)(v2 + 536) = swift_task_alloc();
  *(_QWORD *)(v2 + 544) = swift_task_alloc();
  sub_238409F1C(&qword_2569069C0);
  *(_QWORD *)(v2 + 552) = swift_task_alloc();
  v13 = sub_23842C420();
  *(_QWORD *)(v2 + 560) = v13;
  *(_QWORD *)(v2 + 568) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v2 + 576) = swift_task_alloc();
  v14 = sub_23842C51C();
  *(_QWORD *)(v2 + 584) = v14;
  *(_QWORD *)(v2 + 592) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v2 + 600) = swift_task_alloc();
  *(_OWORD *)(v2 + 608) = *v1;
  return swift_task_switch();
}

uint64_t sub_23841CE18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  NSObject *v39;
  os_signpost_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, _QWORD, uint64_t);
  uint8_t *v45;
  os_signpost_id_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53[2];

  v1 = *(_QWORD *)(v0 + 600);
  v2 = *(_QWORD *)(v0 + 592);
  v3 = *(_QWORD *)(v0 + 584);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE18E60], v3);
  v4 = sub_23842C510();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) == 0)
  {
    sub_23842C774();
    v20 = sub_23842C78C();
    v21 = sub_23842CA8C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_238407000, v20, v21, "Feature flag is disabled", v22, 2u);
      MEMORY[0x23B8343E8](v22, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 520);
    v24 = *(_QWORD *)(v0 + 496);
    v25 = *(_QWORD *)(v0 + 504);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    sub_23840DE38();
    swift_allocError();
    *(_QWORD *)v26 = 0;
    *(_QWORD *)(v26 + 8) = 0;
    *(_BYTE *)(v26 + 16) = 4;
    goto LABEL_13;
  }
  v5 = *(_QWORD *)(v0 + 576);
  v6 = *(_QWORD *)(v0 + 568);
  v7 = *(_QWORD *)(v0 + 560);
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 96);
  sub_23842C414();
  sub_23840DFEC();
  v8 = sub_23842CB04();
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v11)
  {
    v27 = *(_QWORD *)(v0 + 552);
    v28 = *(_QWORD *)(v0 + 216);
    v29 = *(_QWORD *)(v0 + 224);
    swift_retain();
    swift_retain();
    sub_23842C2B8();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v27, 1, 1, v28);
    sub_23842C1C8();
    sub_23840E940(&qword_256906A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4BD0], MEMORY[0x24BDB4BD8]);
    swift_allocError();
    sub_23842C2C4();
    swift_release();
    sub_23841EB70(v27);
LABEL_13:
    swift_willThrow();
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
  sub_23840E6AC();
  if ((sub_23842CAB0() & 1) != 0)
  {
    sub_23842C774();
    v12 = sub_23842C78C();
    v13 = sub_23842CAA4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_238407000, v12, v13, "We will request confirmation for creating a task", v14, 2u);
      MEMORY[0x23B8343E8](v14, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 544);
    v16 = *(_QWORD *)(v0 + 496);
    v17 = *(_QWORD *)(v0 + 504);
    v51 = *(_OWORD *)(v0 + 608);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    *(_OWORD *)(v0 + 120) = v51;
    sub_23842C288();
    sub_23842C390();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 624) = v18;
    sub_23841EB2C();
    sub_23840ED94(&qword_256906A70, &qword_256906A18, MEMORY[0x24BDB5E58]);
    *v18 = v0;
    v18[1] = sub_23841D760;
    return sub_23842C210();
  }
  else
  {
    sub_23842C774();
    swift_retain_n();
    swift_retain_n();
    v30 = sub_23842C78C();
    v31 = sub_23842CAA4();
    v32 = os_log_type_enabled(v30, v31);
    v33 = *(_QWORD *)(v0 + 536);
    v34 = *(_QWORD *)(v0 + 496);
    v35 = *(_QWORD *)(v0 + 504);
    if (v32)
    {
      v52 = *(_QWORD *)(v0 + 536);
      v50 = *(_QWORD *)(v0 + 496);
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v53[0] = v37;
      *(_DWORD *)v36 = 136315138;
      swift_retain();
      swift_retain();
      sub_23842C2A0();
      swift_release();
      swift_release();
      *(_QWORD *)(v0 + 168) = sub_23840E030(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), v53);
      sub_23842CAEC();
      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_238407000, v30, v31, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v37, -1, -1);
      MEMORY[0x23B8343E8](v36, -1, -1);

      v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v38(v52, v50);
    }
    else
    {

      swift_release_n();
      swift_release_n();
      v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v38(v33, v34);
    }
    *(_QWORD *)(v0 + 640) = v38;
    sub_23842C780();
    sub_23842C708();
    sub_23842C714();
    sub_23842C6E4();
    v39 = sub_23842C714();
    v40 = sub_23842CAC8();
    if ((sub_23842CAD4() & 1) != 0)
    {
      v41 = *(_QWORD *)(v0 + 408);
      v42 = *(_QWORD *)(v0 + 376);
      v43 = *(_QWORD *)(v0 + 384);
      v44 = *(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 16);
      v44(v41, *(_QWORD *)(v0 + 416), v42);
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      v46 = sub_23842C6F0();
      _os_signpost_emit_with_name_impl(&dword_238407000, v39, v40, v46, "CE.Intent.Create.Date", "", v45, 2u);
      MEMORY[0x23B8343E8](v45, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
    }
    else
    {
      v47 = *(_QWORD *)(v0 + 384);

      v44 = *(void (**)(uint64_t, _QWORD, uint64_t))(v47 + 16);
    }
    *(_QWORD *)(v0 + 648) = v44;
    v44(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 376));
    sub_23842C75C();
    swift_allocObject();
    *(_QWORD *)(v0 + 656) = sub_23842C750();
    static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v53);
    v48 = v53[0];
    *(_QWORD *)(v0 + 664) = v53[0];
    sub_23842C684();
    *(_QWORD *)(v0 + 672) = sub_23842C678();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    sub_23842C2A0();
    swift_release();
    swift_release();
    *(_QWORD *)(v0 + 680) = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 40) = &type metadata for ShortcutsRunScheduledQueryIntent;
    *(_QWORD *)(v0 + 48) = sub_23840E6E8();
    *(_QWORD *)(v0 + 16) = v48;
    swift_retain();
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 688) = v49;
    *v49 = v0;
    v49[1] = sub_23841DC20;
    return sub_23842C618();
  }
}

uint64_t sub_23841D760()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 632) = v0;
  swift_task_dealloc();
  v4 = v2[60];
  v3 = v2[61];
  v5 = v2[59];
  (*(void (**)(_QWORD, _QWORD))(v2[57] + 8))(v2[58], v2[56]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch();
}

uint64_t sub_23841D814()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t);
  uint8_t *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_23842C774();
  swift_retain_n();
  swift_retain_n();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v21 = v0[63];
    v22 = v0[62];
    v23 = v0[67];
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v24 = v4;
    *(_DWORD *)v3 = 136315138;
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    v0[21] = sub_23840E030(v0[17], v0[18], &v24);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_238407000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v4, -1, -1);
    MEMORY[0x23B8343E8](v3, -1, -1);

    v5 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v5(v23, v22);
  }
  else
  {
    v6 = v0[67];
    v7 = v0[62];
    v8 = v0[63];
    swift_release_n();
    swift_release_n();

    v5 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v5(v6, v7);
  }
  v0[80] = v5;
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v9 = sub_23842C714();
  v10 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v11 = v0[51];
    v12 = v0[47];
    v13 = v0[48];
    v14 = *(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 16);
    v14(v11, v0[52], v12);
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    v16 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v9, v10, v16, "CE.Intent.Create.Date", "", v15, 2u);
    MEMORY[0x23B8343E8](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    v17 = v0[48];

    v14 = *(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 16);
  }
  v0[81] = v14;
  v14(v0[51], v0[52], v0[47]);
  sub_23842C75C();
  swift_allocObject();
  v0[82] = sub_23842C750();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v24);
  v18 = v24;
  v0[83] = v24;
  sub_23842C684();
  v0[84] = sub_23842C678();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  sub_23842C2A0();
  swift_release();
  swift_release();
  v0[85] = v0[10];
  v0[5] = &type metadata for ShortcutsRunScheduledQueryIntent;
  v0[6] = sub_23840E6E8();
  v0[2] = v18;
  swift_retain();
  v19 = (_QWORD *)swift_task_alloc();
  v0[86] = v19;
  *v19 = v0;
  v19[1] = sub_23841DC20;
  return sub_23842C618();
}

uint64_t sub_23841DC20()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 696) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[41] + 8))(v2[42], v2[40]);
  swift_bridgeObjectRelease();
  swift_release();
  if (!v0)
    sub_23840EDD4((uint64_t)(v2 + 2));
  return swift_task_switch();
}

uint64_t sub_23841DCE8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
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
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v1);
  v2 = sub_23842C714();
  sub_23842C744();
  v3 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 312);
    v6 = *(_QWORD *)(v0 + 288);
    v5 = *(_QWORD *)(v0 + 296);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x24BEE7810])
    {
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 288));
      v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v7 = 1;
    }
    v9 = (uint64_t *)(v0 + 408);
    v12 = *(_QWORD *)(v0 + 400);
    v13 = *(_QWORD *)(v0 + 376);
    v32 = *(_QWORD *)(v0 + 384);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 648))(*(_QWORD *)(v0 + 408), v12, v13);
    v14 = swift_slowAlloc();
    *(_BYTE *)v14 = 0;
    *(_BYTE *)(v14 + 1) = v7;
    *(_WORD *)(v14 + 2) = 2050;
    *(_QWORD *)(v0 + 152) = 0;
    sub_23842CAEC();
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v2, v3, v15, "CE.Intent.Create.Date", v8, (uint8_t *)v14, 0xCu);
    MEMORY[0x23B8343E8](v14, -1, -1);

    v11 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v11(v12, v13);
  }
  else
  {
    v9 = (uint64_t *)(v0 + 400);
    v10 = *(_QWORD *)(v0 + 384);

    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  }
  v16 = *v9;
  *(_QWORD *)(v0 + 704) = v11;
  v17 = *(_QWORD *)(v0 + 368);
  v19 = *(_QWORD *)(v0 + 352);
  v18 = *(_QWORD *)(v0 + 360);
  v20 = *(_QWORD *)(v0 + 344);
  v22 = *(uint64_t **)(v0 + 272);
  v21 = *(_QWORD *)(v0 + 280);
  v24 = *(_QWORD *)(v0 + 256);
  v23 = *(_QWORD *)(v0 + 264);
  v30 = *(_QWORD *)(v0 + 248);
  v31 = *(_QWORD *)(v0 + 240);
  v11(v16, *(_QWORD *)(v0 + 376));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v17, v20);
  *v22 = sub_23842C540();
  v22[1] = v25;
  v22[2] = sub_23842C54C();
  v22[3] = v26;
  v22[4] = sub_23842C534();
  v22[5] = v27;
  sub_23842C528();
  v28 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v0 + 712) = v28;
  v28(v18, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))((char *)v22 + *(int *)(v23 + 28), v24, v31);
  sub_23840E780((uint64_t)v22, v21);
  sub_23842C588();
  sub_23842C258();
  sub_23840E7C4(v21, (uint64_t)v22);
  sub_23842CA74();
  *(_QWORD *)(v0 + 720) = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_23841DFDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 200);
  swift_release();
  sub_23840E780(v1, v2);
  return swift_task_switch();
}

uint64_t sub_23841E02C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t, uint64_t);

  v14 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 704);
  v12 = *(_QWORD *)(v0 + 424);
  v13 = *(_QWORD *)(v0 + 440);
  v10 = *(_QWORD *)(v0 + 416);
  v11 = *(_QWORD *)(v0 + 432);
  v9 = *(_QWORD *)(v0 + 376);
  v8 = *(_QWORD *)(v0 + 368);
  v7 = *(_QWORD *)(v0 + 344);
  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 200);
  sub_23840E940(&qword_256906A58, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
  sub_23840E940(&qword_256906A60, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView, (uint64_t)&protocol conformance descriptor for ScheduledQuerySnippetView);
  sub_23842C264();
  swift_release();
  swift_release();
  sub_23840E808(v4, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v6);
  sub_23840E808(v1, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
  v14(v8, v7);
  v15(v10, v9);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
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

uint64_t sub_23841E2FC()
{
  uint64_t v0;

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

uint64_t sub_23841E4A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(void **)(v0 + 696);
  sub_23840EDD4(v0 + 16);
  sub_23842C774();
  v2 = v1;
  v3 = v1;
  v4 = sub_23842C78C();
  v5 = sub_23842CA8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 696);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 160) = v10;
    sub_23842CAEC();
    *v8 = v10;

    _os_log_impl(&dword_238407000, v4, v5, "Failed creating date query: %@", v7, 0xCu);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v8, -1, -1);
    MEMORY[0x23B8343E8](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 696);

  }
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  v13 = *(_QWORD *)(v0 + 512);
  v14 = *(_QWORD *)(v0 + 496);

  v12(v13, v14);
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v15);
  v16 = sub_23842C714();
  sub_23842C744();
  v17 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v18 = *(_QWORD *)(v0 + 296);
    v19 = *(_QWORD *)(v0 + 304);
    v20 = *(_QWORD *)(v0 + 288);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x24BEE7810])
    {
      v21 = 0;
      v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
      v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v21 = 1;
    }
    v23 = (uint64_t *)(v0 + 408);
    v26 = *(_QWORD *)(v0 + 392);
    v39 = *(_QWORD *)(v0 + 384);
    v27 = *(_QWORD *)(v0 + 376);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 648))(*(_QWORD *)(v0 + 408), v26, v27);
    v28 = swift_slowAlloc();
    *(_BYTE *)v28 = 0;
    *(_BYTE *)(v28 + 1) = v21;
    *(_WORD *)(v28 + 2) = 2050;
    *(_QWORD *)(v0 + 176) = 1;
    sub_23842CAEC();
    v29 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v16, v17, v29, "CE.Intent.Create.Date", v22, (uint8_t *)v28, 0xCu);
    MEMORY[0x23B8343E8](v28, -1, -1);

    v25 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v25(v26, v27);
  }
  else
  {
    v23 = (uint64_t *)(v0 + 392);
    v24 = *(_QWORD *)(v0 + 384);

    v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  v30 = *(void **)(v0 + 696);
  v40 = *(_QWORD *)(v0 + 440);
  v37 = *(_QWORD *)(v0 + 432);
  v31 = *(_QWORD *)(v0 + 416);
  v38 = *(_QWORD *)(v0 + 424);
  v32 = *(_QWORD *)(v0 + 376);
  v25(*v23, v32);
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  v34 = *(_QWORD *)(v0 + 104);
  v33 = *(_QWORD *)(v0 + 112);
  sub_23840DE38();
  swift_allocError();
  *(_QWORD *)v35 = v34;
  *(_QWORD *)(v35 + 8) = v33;
  *(_BYTE *)(v35 + 16) = 2;
  swift_willThrow();
  swift_release();

  swift_release();
  v25(v31, v32);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v40, v38);
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

uint64_t sub_23841EA18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906978 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907160);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23841EAB0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return CreateDateScheduledQueryIntent.perform()(a1);
}

uint64_t sub_23841EB04()
{
  sub_23841EB2C();
  return sub_23842C228();
}

unint64_t sub_23841EB2C()
{
  unint64_t result;

  result = qword_256907190;
  if (!qword_256907190)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDateScheduledQueryIntent, &type metadata for CreateDateScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907190);
  }
  return result;
}

uint64_t sub_23841EB70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238409F1C(&qword_2569069C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23841EBB4()
{
  unint64_t result;

  result = qword_256907198;
  if (!qword_256907198)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDateScheduledQueryIntent, &type metadata for CreateDateScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907198);
  }
  return result;
}

unint64_t sub_23841EC00()
{
  unint64_t result;

  result = qword_2569071A0;
  if (!qword_2569071A0)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDateScheduledQueryIntent, &type metadata for CreateDateScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_2569071A0);
  }
  return result;
}

unint64_t sub_23841EC48()
{
  unint64_t result;

  result = qword_2569071A8;
  if (!qword_2569071A8)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDateScheduledQueryIntent, &type metadata for CreateDateScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_2569071A8);
  }
  return result;
}

uint64_t sub_23841EC8C()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_23841ECB0()
{
  sub_23841EB2C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for CreateDateScheduledQueryIntent()
{
  swift_release();
  return swift_release();
}

_QWORD *_s27ConditionalEngineAppIntents30CreateDateScheduledQueryIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CreateDateScheduledQueryIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for CreateDateScheduledQueryIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for CreateDateScheduledQueryIntent()
{
  return &type metadata for CreateDateScheduledQueryIntent;
}

uint64_t sub_23841EE08()
{
  return sub_23840ED94(&qword_256906AA0, &qword_256906AA8, MEMORY[0x24BDB5E68]);
}

uint64_t sub_23841EE34()
{
  return sub_23840ED94(&qword_256906AB0, &qword_256906AA8, MEMORY[0x24BDB5E60]);
}

uint64_t sub_23841EE60()
{
  return sub_23840ED94(&qword_256906AB8, &qword_256906AA8, MEMORY[0x24BDB5E70]);
}

id EnterLocationSnippetView.placemark.getter()
{
  id *v0;

  return *v0;
}

void EnterLocationSnippetView.placemark.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*EnterLocationSnippetView.placemark.modify())()
{
  return nullsub_1;
}

double EnterLocationSnippetView.radius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void EnterLocationSnippetView.radius.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*EnterLocationSnippetView.radius.modify())()
{
  return nullsub_1;
}

uint64_t EnterLocationSnippetView.init(placemark:radius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_QWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t EnterLocationSnippetView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(void **)v1;
  type metadata accessor for LocationSnippetView();
  v5 = v4;
  result = sub_23842C480();
  *a1 = v5;
  a1[1] = v3;
  return result;
}

uint64_t sub_23841EF68()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for EnterLocationSnippetView()
{
  return &type metadata for EnterLocationSnippetView;
}

uint64_t sub_23841EF8C()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_2569071B8);
  sub_238409554(v0, (uint64_t)qword_2569071B8);
  return sub_23842C480();
}

uint64_t static CreateDailyScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906980 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_2569071B8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateDailyScheduledQueryIntent.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_256906980 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_2569071B8);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateDailyScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906980 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_2569071B8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateDailyScheduledQueryIntent.query.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t CreateDailyScheduledQueryIntent.query.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateDailyScheduledQueryIntent.query.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateDailyScheduledQueryIntent.$query.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateDailyScheduledQueryIntent.time.getter()
{
  return sub_23842C2A0();
}

uint64_t sub_23841F294(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = sub_23842C450();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
  return swift_release();
}

uint64_t CreateDailyScheduledQueryIntent.time.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23842C450();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_23842C2AC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*CreateDailyScheduledQueryIntent.time.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateDailyScheduledQueryIntent.$time.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateDailyScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a1;
  v1 = sub_238409F1C(&qword_2569071D0);
  v29 = *(_QWORD *)(v1 - 8);
  v30 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v28 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23842C3C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23842C4A4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v26 = sub_238409F1C(&qword_2569069D8);
  sub_23842C480();
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v27(v15, 1, 1, v16);
  v18 = sub_23842C9C0();
  v32 = 0;
  v33 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
  v19 = sub_23842C24C();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v25(v9, 1, 1, v19);
  v20 = *MEMORY[0x24BDB6090];
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v21(v6, v20, v3);
  v26 = sub_23842C300();
  sub_238409F1C(&qword_2569071D8);
  sub_23842C480();
  v27(v15, 1, 1, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v28, *MEMORY[0x24BDB54E8], v30);
  v25(v9, 1, 1, v19);
  v21(v6, v20, v3);
  result = sub_23842C2E8();
  v23 = v31;
  *v31 = v26;
  v23[1] = result;
  return result;
}

uint64_t CreateDailyScheduledQueryIntent.init(query:time:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t *a4@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t result;
  uint64_t *v37;
  void (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v52 = a3;
  v53 = a4;
  v46 = a1;
  v47 = a2;
  v4 = sub_23842C450();
  v50 = *(_QWORD *)(v4 - 8);
  v51 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)&v38 - v7;
  v8 = sub_238409F1C(&qword_2569071D0);
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_23842C3C0();
  v10 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23842C4A4();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v40 = sub_238409F1C(&qword_2569069D8);
  sub_23842C480();
  v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  v41(v21, 1, 1, v22);
  v24 = sub_23842C9C0();
  v54 = 0;
  v55 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 1, 1, v24);
  v25 = sub_23842C24C();
  v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v39(v15, 1, 1, v25);
  v26 = *MEMORY[0x24BDB6090];
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v27 = v42;
  v38(v12, v26, v42);
  v28 = sub_23842C300();
  sub_238409F1C(&qword_2569071D8);
  swift_retain();
  sub_23842C480();
  v41(v21, 1, 1, v22);
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDB54E8], v45);
  v39(v15, 1, 1, v25);
  v38(v12, v26, v27);
  v29 = sub_23842C2E8();
  v54 = v46;
  v55 = v47;
  swift_retain_n();
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  v31 = v50;
  v30 = v51;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  v33 = v48;
  v34 = v52;
  v32(v48, (uint64_t)v52, v51);
  v32(v49, (uint64_t)v33, v30);
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  v35 = *(void (**)(char *, uint64_t))(v31 + 8);
  v35(v33, v30);
  v35(v34, v30);
  swift_release_n();
  result = swift_release_n();
  v37 = v53;
  *v53 = v28;
  v37[1] = v29;
  return result;
}

uint64_t CreateDailyScheduledQueryIntent.perform()(uint64_t a1)
{
  _OWORD *v1;
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

  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = type metadata accessor for ScheduledQuerySnippetView();
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  sub_23842C4A4();
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  v3 = sub_23842C24C();
  *(_QWORD *)(v2 + 216) = v3;
  *(_QWORD *)(v2 + 224) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 232) = swift_task_alloc();
  v4 = sub_23842C5B8();
  *(_QWORD *)(v2 + 240) = v4;
  *(_QWORD *)(v2 + 248) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = type metadata accessor for ScheduledQueryEntity();
  *(_QWORD *)(v2 + 272) = swift_task_alloc();
  *(_QWORD *)(v2 + 280) = swift_task_alloc();
  v5 = sub_23842C72C();
  *(_QWORD *)(v2 + 288) = v5;
  *(_QWORD *)(v2 + 296) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 304) = swift_task_alloc();
  *(_QWORD *)(v2 + 312) = swift_task_alloc();
  v6 = sub_23842C450();
  *(_QWORD *)(v2 + 320) = v6;
  *(_QWORD *)(v2 + 328) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 336) = swift_task_alloc();
  v7 = sub_23842C558();
  *(_QWORD *)(v2 + 344) = v7;
  *(_QWORD *)(v2 + 352) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 360) = swift_task_alloc();
  *(_QWORD *)(v2 + 368) = swift_task_alloc();
  v8 = sub_23842C6FC();
  *(_QWORD *)(v2 + 376) = v8;
  *(_QWORD *)(v2 + 384) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v2 + 392) = swift_task_alloc();
  *(_QWORD *)(v2 + 400) = swift_task_alloc();
  *(_QWORD *)(v2 + 408) = swift_task_alloc();
  *(_QWORD *)(v2 + 416) = swift_task_alloc();
  v9 = sub_23842C720();
  *(_QWORD *)(v2 + 424) = v9;
  *(_QWORD *)(v2 + 432) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v2 + 440) = swift_task_alloc();
  v10 = sub_23842C39C();
  *(_QWORD *)(v2 + 448) = v10;
  *(_QWORD *)(v2 + 456) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v2 + 464) = swift_task_alloc();
  v11 = sub_238409F1C(&qword_256906A18);
  *(_QWORD *)(v2 + 472) = v11;
  *(_QWORD *)(v2 + 480) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v2 + 488) = swift_task_alloc();
  v12 = sub_23842C798();
  *(_QWORD *)(v2 + 496) = v12;
  *(_QWORD *)(v2 + 504) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v2 + 512) = swift_task_alloc();
  *(_QWORD *)(v2 + 520) = swift_task_alloc();
  *(_QWORD *)(v2 + 528) = swift_task_alloc();
  *(_QWORD *)(v2 + 536) = swift_task_alloc();
  *(_QWORD *)(v2 + 544) = swift_task_alloc();
  sub_238409F1C(&qword_2569069C0);
  *(_QWORD *)(v2 + 552) = swift_task_alloc();
  v13 = sub_23842C420();
  *(_QWORD *)(v2 + 560) = v13;
  *(_QWORD *)(v2 + 568) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v2 + 576) = swift_task_alloc();
  v14 = sub_23842C51C();
  *(_QWORD *)(v2 + 584) = v14;
  *(_QWORD *)(v2 + 592) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v2 + 600) = swift_task_alloc();
  *(_OWORD *)(v2 + 608) = *v1;
  return swift_task_switch();
}

uint64_t sub_23841FF30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  NSObject *v39;
  os_signpost_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, _QWORD, uint64_t);
  uint8_t *v45;
  os_signpost_id_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53[2];

  v1 = *(_QWORD *)(v0 + 600);
  v2 = *(_QWORD *)(v0 + 592);
  v3 = *(_QWORD *)(v0 + 584);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE18E60], v3);
  v4 = sub_23842C510();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) == 0)
  {
    sub_23842C774();
    v20 = sub_23842C78C();
    v21 = sub_23842CA8C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_238407000, v20, v21, "Feature flag is disabled", v22, 2u);
      MEMORY[0x23B8343E8](v22, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 520);
    v24 = *(_QWORD *)(v0 + 496);
    v25 = *(_QWORD *)(v0 + 504);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    sub_23840DE38();
    swift_allocError();
    *(_QWORD *)v26 = 0;
    *(_QWORD *)(v26 + 8) = 0;
    *(_BYTE *)(v26 + 16) = 4;
    goto LABEL_13;
  }
  v5 = *(_QWORD *)(v0 + 576);
  v6 = *(_QWORD *)(v0 + 568);
  v7 = *(_QWORD *)(v0 + 560);
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 96);
  sub_23842C414();
  sub_23840DFEC();
  v8 = sub_23842CB04();
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v11)
  {
    v27 = *(_QWORD *)(v0 + 552);
    v28 = *(_QWORD *)(v0 + 216);
    v29 = *(_QWORD *)(v0 + 224);
    swift_retain();
    swift_retain();
    sub_23842C2B8();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v27, 1, 1, v28);
    sub_23842C1C8();
    sub_23840E940(&qword_256906A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4BD0], MEMORY[0x24BDB4BD8]);
    swift_allocError();
    sub_23842C2C4();
    swift_release();
    sub_23841EB70(v27);
LABEL_13:
    swift_willThrow();
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
  sub_23840E6AC();
  if ((sub_23842CAB0() & 1) != 0)
  {
    sub_23842C774();
    v12 = sub_23842C78C();
    v13 = sub_23842CAA4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_238407000, v12, v13, "We will request confirmation for creating a task", v14, 2u);
      MEMORY[0x23B8343E8](v14, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 544);
    v16 = *(_QWORD *)(v0 + 496);
    v17 = *(_QWORD *)(v0 + 504);
    v51 = *(_OWORD *)(v0 + 608);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    *(_OWORD *)(v0 + 120) = v51;
    sub_23842C288();
    sub_23842C390();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 624) = v18;
    sub_23842177C();
    sub_23840ED94(&qword_256906A70, &qword_256906A18, MEMORY[0x24BDB5E58]);
    *v18 = v0;
    v18[1] = sub_238420878;
    return sub_23842C210();
  }
  else
  {
    sub_23842C774();
    swift_retain_n();
    swift_retain_n();
    v30 = sub_23842C78C();
    v31 = sub_23842CAA4();
    v32 = os_log_type_enabled(v30, v31);
    v33 = *(_QWORD *)(v0 + 536);
    v34 = *(_QWORD *)(v0 + 496);
    v35 = *(_QWORD *)(v0 + 504);
    if (v32)
    {
      v52 = *(_QWORD *)(v0 + 536);
      v50 = *(_QWORD *)(v0 + 496);
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v53[0] = v37;
      *(_DWORD *)v36 = 136315138;
      swift_retain();
      swift_retain();
      sub_23842C2A0();
      swift_release();
      swift_release();
      *(_QWORD *)(v0 + 168) = sub_23840E030(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), v53);
      sub_23842CAEC();
      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_238407000, v30, v31, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v37, -1, -1);
      MEMORY[0x23B8343E8](v36, -1, -1);

      v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v38(v52, v50);
    }
    else
    {

      swift_release_n();
      swift_release_n();
      v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v38(v33, v34);
    }
    *(_QWORD *)(v0 + 640) = v38;
    sub_23842C780();
    sub_23842C708();
    sub_23842C714();
    sub_23842C6E4();
    v39 = sub_23842C714();
    v40 = sub_23842CAC8();
    if ((sub_23842CAD4() & 1) != 0)
    {
      v41 = *(_QWORD *)(v0 + 408);
      v42 = *(_QWORD *)(v0 + 376);
      v43 = *(_QWORD *)(v0 + 384);
      v44 = *(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 16);
      v44(v41, *(_QWORD *)(v0 + 416), v42);
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      v46 = sub_23842C6F0();
      _os_signpost_emit_with_name_impl(&dword_238407000, v39, v40, v46, "CE.Intent.Create.Daily", "", v45, 2u);
      MEMORY[0x23B8343E8](v45, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
    }
    else
    {
      v47 = *(_QWORD *)(v0 + 384);

      v44 = *(void (**)(uint64_t, _QWORD, uint64_t))(v47 + 16);
    }
    *(_QWORD *)(v0 + 648) = v44;
    v44(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 376));
    sub_23842C75C();
    swift_allocObject();
    *(_QWORD *)(v0 + 656) = sub_23842C750();
    static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v53);
    v48 = v53[0];
    *(_QWORD *)(v0 + 664) = v53[0];
    sub_23842C684();
    *(_QWORD *)(v0 + 672) = sub_23842C678();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    sub_23842C2A0();
    swift_release();
    swift_release();
    *(_QWORD *)(v0 + 680) = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 40) = &type metadata for ShortcutsRunScheduledQueryIntent;
    *(_QWORD *)(v0 + 48) = sub_23840E6E8();
    *(_QWORD *)(v0 + 16) = v48;
    swift_retain();
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 688) = v49;
    *v49 = v0;
    v49[1] = sub_238420D38;
    return sub_23842C624();
  }
}

uint64_t sub_238420878()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 632) = v0;
  swift_task_dealloc();
  v4 = v2[60];
  v3 = v2[61];
  v5 = v2[59];
  (*(void (**)(_QWORD, _QWORD))(v2[57] + 8))(v2[58], v2[56]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch();
}

uint64_t sub_23842092C()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t);
  uint8_t *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_23842C774();
  swift_retain_n();
  swift_retain_n();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v21 = v0[63];
    v22 = v0[62];
    v23 = v0[67];
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v24 = v4;
    *(_DWORD *)v3 = 136315138;
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    v0[21] = sub_23840E030(v0[17], v0[18], &v24);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_238407000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v4, -1, -1);
    MEMORY[0x23B8343E8](v3, -1, -1);

    v5 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v5(v23, v22);
  }
  else
  {
    v6 = v0[67];
    v7 = v0[62];
    v8 = v0[63];
    swift_release_n();
    swift_release_n();

    v5 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v5(v6, v7);
  }
  v0[80] = v5;
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v9 = sub_23842C714();
  v10 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v11 = v0[51];
    v12 = v0[47];
    v13 = v0[48];
    v14 = *(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 16);
    v14(v11, v0[52], v12);
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    v16 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v9, v10, v16, "CE.Intent.Create.Daily", "", v15, 2u);
    MEMORY[0x23B8343E8](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    v17 = v0[48];

    v14 = *(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 16);
  }
  v0[81] = v14;
  v14(v0[51], v0[52], v0[47]);
  sub_23842C75C();
  swift_allocObject();
  v0[82] = sub_23842C750();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v24);
  v18 = v24;
  v0[83] = v24;
  sub_23842C684();
  v0[84] = sub_23842C678();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  sub_23842C2A0();
  swift_release();
  swift_release();
  v0[85] = v0[10];
  v0[5] = &type metadata for ShortcutsRunScheduledQueryIntent;
  v0[6] = sub_23840E6E8();
  v0[2] = v18;
  swift_retain();
  v19 = (_QWORD *)swift_task_alloc();
  v0[86] = v19;
  *v19 = v0;
  v19[1] = sub_238420D38;
  return sub_23842C624();
}

uint64_t sub_238420D38()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 696) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[41] + 8))(v2[42], v2[40]);
  swift_bridgeObjectRelease();
  swift_release();
  if (!v0)
    sub_23840EDD4((uint64_t)(v2 + 2));
  return swift_task_switch();
}

uint64_t sub_238420E00()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
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
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v1);
  v2 = sub_23842C714();
  sub_23842C744();
  v3 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 312);
    v6 = *(_QWORD *)(v0 + 288);
    v5 = *(_QWORD *)(v0 + 296);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x24BEE7810])
    {
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 288));
      v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v7 = 1;
    }
    v9 = (uint64_t *)(v0 + 408);
    v12 = *(_QWORD *)(v0 + 400);
    v13 = *(_QWORD *)(v0 + 376);
    v32 = *(_QWORD *)(v0 + 384);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 648))(*(_QWORD *)(v0 + 408), v12, v13);
    v14 = swift_slowAlloc();
    *(_BYTE *)v14 = 0;
    *(_BYTE *)(v14 + 1) = v7;
    *(_WORD *)(v14 + 2) = 2050;
    *(_QWORD *)(v0 + 152) = 0;
    sub_23842CAEC();
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v2, v3, v15, "CE.Intent.Create.Daily", v8, (uint8_t *)v14, 0xCu);
    MEMORY[0x23B8343E8](v14, -1, -1);

    v11 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v11(v12, v13);
  }
  else
  {
    v9 = (uint64_t *)(v0 + 400);
    v10 = *(_QWORD *)(v0 + 384);

    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  }
  v16 = *v9;
  *(_QWORD *)(v0 + 704) = v11;
  v17 = *(_QWORD *)(v0 + 368);
  v19 = *(_QWORD *)(v0 + 352);
  v18 = *(_QWORD *)(v0 + 360);
  v20 = *(_QWORD *)(v0 + 344);
  v22 = *(uint64_t **)(v0 + 272);
  v21 = *(_QWORD *)(v0 + 280);
  v24 = *(_QWORD *)(v0 + 256);
  v23 = *(_QWORD *)(v0 + 264);
  v30 = *(_QWORD *)(v0 + 248);
  v31 = *(_QWORD *)(v0 + 240);
  v11(v16, *(_QWORD *)(v0 + 376));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v17, v20);
  *v22 = sub_23842C540();
  v22[1] = v25;
  v22[2] = sub_23842C54C();
  v22[3] = v26;
  v22[4] = sub_23842C534();
  v22[5] = v27;
  sub_23842C528();
  v28 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v0 + 712) = v28;
  v28(v18, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))((char *)v22 + *(int *)(v23 + 28), v24, v31);
  sub_23840E780((uint64_t)v22, v21);
  sub_23842C588();
  sub_23842C258();
  sub_23840E7C4(v21, (uint64_t)v22);
  sub_23842CA74();
  *(_QWORD *)(v0 + 720) = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_2384210F4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(void **)(v0 + 696);
  sub_23840EDD4(v0 + 16);
  sub_23842C774();
  v2 = v1;
  v3 = v1;
  v4 = sub_23842C78C();
  v5 = sub_23842CA8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 696);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 160) = v10;
    sub_23842CAEC();
    *v8 = v10;

    _os_log_impl(&dword_238407000, v4, v5, "Failed creating daily query: %@", v7, 0xCu);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v8, -1, -1);
    MEMORY[0x23B8343E8](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 696);

  }
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  v13 = *(_QWORD *)(v0 + 512);
  v14 = *(_QWORD *)(v0 + 496);

  v12(v13, v14);
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v15);
  v16 = sub_23842C714();
  sub_23842C744();
  v17 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v18 = *(_QWORD *)(v0 + 296);
    v19 = *(_QWORD *)(v0 + 304);
    v20 = *(_QWORD *)(v0 + 288);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x24BEE7810])
    {
      v21 = 0;
      v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
      v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v21 = 1;
    }
    v23 = (uint64_t *)(v0 + 408);
    v26 = *(_QWORD *)(v0 + 392);
    v39 = *(_QWORD *)(v0 + 384);
    v27 = *(_QWORD *)(v0 + 376);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 648))(*(_QWORD *)(v0 + 408), v26, v27);
    v28 = swift_slowAlloc();
    *(_BYTE *)v28 = 0;
    *(_BYTE *)(v28 + 1) = v21;
    *(_WORD *)(v28 + 2) = 2050;
    *(_QWORD *)(v0 + 176) = 1;
    sub_23842CAEC();
    v29 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v16, v17, v29, "CE.Intent.Create.Daily", v22, (uint8_t *)v28, 0xCu);
    MEMORY[0x23B8343E8](v28, -1, -1);

    v25 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v25(v26, v27);
  }
  else
  {
    v23 = (uint64_t *)(v0 + 392);
    v24 = *(_QWORD *)(v0 + 384);

    v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  v30 = *(void **)(v0 + 696);
  v40 = *(_QWORD *)(v0 + 440);
  v37 = *(_QWORD *)(v0 + 432);
  v31 = *(_QWORD *)(v0 + 416);
  v38 = *(_QWORD *)(v0 + 424);
  v32 = *(_QWORD *)(v0 + 376);
  v25(*v23, v32);
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  v34 = *(_QWORD *)(v0 + 104);
  v33 = *(_QWORD *)(v0 + 112);
  sub_23840DE38();
  swift_allocError();
  *(_QWORD *)v35 = v34;
  *(_QWORD *)(v35 + 8) = v33;
  *(_BYTE *)(v35 + 16) = 2;
  swift_willThrow();
  swift_release();

  swift_release();
  v25(v31, v32);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v40, v38);
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

uint64_t sub_238421668@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906980 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_2569071B8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_238421700(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return CreateDailyScheduledQueryIntent.perform()(a1);
}

uint64_t sub_238421754()
{
  sub_23842177C();
  return sub_23842C228();
}

unint64_t sub_23842177C()
{
  unint64_t result;

  result = qword_2569071E8;
  if (!qword_2569071E8)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDailyScheduledQueryIntent, &type metadata for CreateDailyScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_2569071E8);
  }
  return result;
}

unint64_t sub_2384217C4()
{
  unint64_t result;

  result = qword_2569071F0;
  if (!qword_2569071F0)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDailyScheduledQueryIntent, &type metadata for CreateDailyScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_2569071F0);
  }
  return result;
}

unint64_t sub_238421810()
{
  unint64_t result;

  result = qword_2569071F8;
  if (!qword_2569071F8)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDailyScheduledQueryIntent, &type metadata for CreateDailyScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_2569071F8);
  }
  return result;
}

unint64_t sub_238421858()
{
  unint64_t result;

  result = qword_256907200;
  if (!qword_256907200)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateDailyScheduledQueryIntent, &type metadata for CreateDailyScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907200);
  }
  return result;
}

uint64_t sub_23842189C()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2384218C0()
{
  sub_23842177C();
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for CreateDailyScheduledQueryIntent()
{
  return &type metadata for CreateDailyScheduledQueryIntent;
}

uint64_t sub_238421920()
{
  uint64_t v0;

  v0 = sub_23842C4A4();
  sub_23840EE34(v0, qword_256907210);
  sub_238409554(v0, (uint64_t)qword_256907210);
  return sub_23842C480();
}

uint64_t static CreateLocationEnteredScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906988 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907210);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateLocationEnteredScheduledQueryIntent.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_256906988 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907210);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateLocationEnteredScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906988 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256907210);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.query.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.query.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.query.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$query.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.location.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

void CreateLocationEnteredScheduledQueryIntent.location.setter(void *a1)
{
  id v1;

  v1 = a1;
  sub_23842C2AC();

}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.location.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$location.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.locationName.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.locationName.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.locationName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$locationName.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.radius.getter()
{
  return sub_23842C2A0();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.radius.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = sub_238409F1C(&qword_2569069A0);
  MEMORY[0x24BDAC7A8](v2);
  sub_238409F5C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23842C2AC();
  return sub_23840E670(a1, &qword_2569069A0);
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.radius.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$radius.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.runsOnce.getter()
{
  unsigned __int8 v1;

  sub_23842C2A0();
  return v1;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.runsOnce.setter()
{
  return sub_23842C2AC();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.runsOnce.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_238409880;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$runsOnce.getter()
{
  return sub_23842C2B8();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t result;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void (*v56)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t *v64;
  char *v65;
  uint64_t v66;
  unsigned int v67;
  void (*v68)(char *, uint64_t, uint64_t, uint64_t);
  void (*v69)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v64 = a1;
  v1 = sub_238409F1C(&qword_2569069A8);
  MEMORY[0x24BDAC7A8](v1);
  v63 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_238409F1C(&qword_2569069B0);
  MEMORY[0x24BDAC7A8](v3);
  v62 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_238409F1C(&qword_2569069B8);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v59 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_23842C3C0();
  v66 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23842C4A4();
  v18 = *(_QWORD *)(v17 - 8);
  v71 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v61 = sub_238409F1C(&qword_2569069D8);
  sub_23842C480();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v19(v16, 1, 1, v17);
  v68 = v19;
  v20 = sub_23842C9C0();
  v72 = 0;
  v73 = 0;
  v56 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v57 = v20;
  v55 = v13;
  v56(v13, 1, 1, v20);
  v21 = sub_23842C24C();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v54 = v21;
  v22(v10, 1, 1, v21);
  v69 = v22;
  v67 = *MEMORY[0x24BDB6090];
  v66 = *(_QWORD *)(v66 + 104);
  v23 = v70;
  ((void (*)(char *))v66)(v7);
  v24 = v7;
  v61 = sub_23842C300();
  v53 = sub_238409F1C(&qword_2569069E0);
  sub_23842C480();
  v25 = v71;
  v19(v16, 1, 1, v71);
  v22(v10, 1, 1, v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v59, *MEMORY[0x24BDB54C8], v60);
  v65 = v24;
  v26 = v24;
  v27 = v67;
  v28 = v23;
  v29 = (void (*)(char *, uint64_t, uint64_t))v66;
  ((void (*)(char *, _QWORD, uint64_t))v66)(v26, v67, v23);
  v52 = v16;
  v60 = sub_23842C318();
  v59 = (char *)sub_238409F1C(&qword_2569069E8);
  sub_23842C480();
  v30 = v68;
  v68(v16, 1, 1, v25);
  v72 = 0;
  v73 = 0;
  v56(v55, 1, 1, v57);
  v31 = v54;
  v69(v10, 1, 1, v54);
  v32 = v27;
  v33 = v28;
  v29(v65, v32, v28);
  v34 = v52;
  v59 = (char *)sub_23842C300();
  v58 = sub_238409F1C(&qword_2569069F0);
  sub_23842C480();
  v35 = v34;
  v30(v34, 1, 1, v71);
  v36 = *MEMORY[0x24BDB5550];
  v37 = sub_238409F1C(&qword_2569069F8);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 104))(v62, v36, v37);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v37);
  v40 = v31;
  v41 = v69;
  v69(v10, 1, 1, v31);
  v42 = v65;
  v43 = v67;
  v44 = v33;
  v45 = (void (*)(char *, uint64_t, uint64_t))v66;
  ((void (*)(char *, _QWORD, uint64_t))v66)(v65, v67, v44);
  v62 = (char *)sub_23842C2DC();
  sub_238409F1C(&qword_256906A00);
  sub_23842C480();
  v68(v35, 1, 1, v71);
  LOBYTE(v72) = 2;
  v46 = sub_23842CA50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v63, 1, 1, v46);
  v41(v10, 1, 1, v40);
  v45(v42, v43, v70);
  result = sub_23842C30C();
  v48 = v64;
  v49 = v60;
  *v64 = v61;
  v48[1] = v49;
  v50 = v62;
  v48[2] = (uint64_t)v59;
  v48[3] = (uint64_t)v50;
  v48[4] = result;
  return result;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.init(query:latitude:longitude:locationName:radius:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, double a7@<D0>, double a8@<D1>)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  char *v51;
  void (*v52)(char *, uint64_t, uint64_t, uint64_t);
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t result;
  uint64_t *v85;
  uint64_t v86;
  char *v87;
  void (*v88)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  char *v104;
  void (*v105)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  void (*v109)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  char *v112;
  id v113;
  uint64_t v114;

  v102 = a5;
  v103 = a6;
  v98 = a3;
  v99 = a4;
  v96 = a1;
  v97 = a2;
  v10 = sub_238409F1C(&qword_2569069A0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v101 = (uint64_t)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v100 = (char *)&v86 - v13;
  v14 = sub_238409F1C(&qword_2569069A8);
  MEMORY[0x24BDAC7A8](v14);
  v95 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_238409F1C(&qword_2569069B0);
  MEMORY[0x24BDAC7A8](v16);
  v94 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_238409F1C(&qword_2569069B8);
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v90 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_23842C3C0();
  v106 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  v112 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v86 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_23842C4A4();
  v30 = *(_QWORD *)(v29 - 8);
  v108 = v29;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v86 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = sub_238409F1C(&qword_2569069D8);
  v33 = v32;
  sub_23842C480();
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  v34(v28, 1, 1, v29);
  v35 = v34;
  v109 = v34;
  v89 = sub_23842C9C0();
  v113 = 0;
  v114 = 0;
  v88 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56);
  v87 = v25;
  v88(v25, 1, 1, v89);
  v36 = sub_23842C24C();
  v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
  v110 = v36;
  v37(v22, 1, 1, v36);
  v105 = v37;
  v107 = *MEMORY[0x24BDB6090];
  v106 = *(_QWORD *)(v106 + 104);
  v39 = v111;
  v38 = v112;
  ((void (*)(char *))v106)(v112);
  v40 = v38;
  v93 = sub_23842C300();
  v86 = sub_238409F1C(&qword_2569069E0);
  swift_retain();
  v41 = v33;
  sub_23842C480();
  v42 = v108;
  v35(v28, 1, 1, v108);
  v37(v22, 1, 1, v36);
  (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v90, *MEMORY[0x24BDB54C8], v92);
  v43 = v40;
  v44 = v107;
  v45 = v39;
  v46 = (void (*)(char *, uint64_t, uint64_t))v106;
  ((void (*)(char *, _QWORD, uint64_t))v106)(v43, v107, v39);
  v104 = v41;
  v92 = sub_23842C318();
  v91 = sub_238409F1C(&qword_2569069E8);
  swift_retain();
  sub_23842C480();
  v47 = v28;
  v48 = v28;
  v49 = v42;
  v50 = v109;
  v109(v48, 1, 1, v42);
  v113 = 0;
  v114 = 0;
  v88(v87, 1, 1, v89);
  v51 = v22;
  v52 = v105;
  v105(v22, 1, 1, v110);
  v53 = v112;
  v46(v112, v44, v45);
  v54 = v47;
  v91 = sub_23842C300();
  v90 = (char *)sub_238409F1C(&qword_2569069F0);
  swift_retain();
  sub_23842C480();
  v50(v47, 1, 1, v49);
  v55 = *MEMORY[0x24BDB5550];
  v56 = sub_238409F1C(&qword_2569069F8);
  v57 = *(_QWORD *)(v56 - 8);
  v58 = v94;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 104))(v94, v55, v56);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v58, 0, 1, v56);
  v59 = v51;
  v60 = v110;
  v52(v51, 1, 1, v110);
  v61 = v53;
  v62 = v107;
  v63 = v111;
  v64 = (void (*)(char *, uint64_t, uint64_t))v106;
  ((void (*)(char *, _QWORD, uint64_t))v106)(v61, v107, v111);
  v65 = v54;
  v66 = sub_23842C2DC();
  sub_238409F1C(&qword_256906A00);
  v67 = v66;
  swift_retain();
  sub_23842C480();
  v109(v65, 1, 1, v108);
  LOBYTE(v113) = 2;
  v68 = sub_23842CA50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 56))(v95, 1, 1, v68);
  v105(v59, 1, 1, v60);
  v64(v112, v62, v63);
  v69 = sub_23842C30C();
  v113 = v96;
  v114 = v97;
  swift_retain_n();
  v70 = v93;
  swift_retain();
  v71 = v92;
  swift_retain();
  v72 = v91;
  swift_retain();
  v73 = v67;
  swift_retain();
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  v74 = v71;
  swift_release();
  swift_release();
  v75 = objc_allocWithZone(MEMORY[0x24BDBFA80]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v76 = objc_msgSend(v75, sel_initWithLatitude_longitude_, a7, a8);
  v77 = (void *)sub_23842C9FC();
  swift_bridgeObjectRelease();
  v78 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v76, v77, 0);

  v113 = v78;
  v79 = v78;
  sub_23842C2AC();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  v80 = sub_238409F1C(&qword_256906A08);
  v81 = *(_QWORD *)(v80 - 8);
  v82 = (uint64_t)v100;
  v83 = v102;
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v100, v102, v80);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v81 + 56))(v82, 0, 1, v80);
  sub_238409F5C(v82, v101);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2AC();
  sub_23840E670(v82, &qword_2569069A0);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v83, v80);
  swift_release_n();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  result = swift_release_n();
  v85 = v103;
  *v103 = v70;
  v85[1] = v74;
  v85[2] = v72;
  v85[3] = v73;
  v85[4] = v69;
  return result;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.perform()(uint64_t a1)
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
  __int128 v15;

  *(_QWORD *)(v2 + 232) = a1;
  *(_QWORD *)(v2 + 240) = type metadata accessor for ScheduledQuerySnippetView();
  *(_QWORD *)(v2 + 248) = swift_task_alloc();
  sub_23842C4A4();
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  v3 = sub_23842C24C();
  *(_QWORD *)(v2 + 264) = v3;
  *(_QWORD *)(v2 + 272) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 280) = swift_task_alloc();
  v4 = sub_23842C5B8();
  *(_QWORD *)(v2 + 288) = v4;
  *(_QWORD *)(v2 + 296) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 304) = swift_task_alloc();
  *(_QWORD *)(v2 + 312) = type metadata accessor for ScheduledQueryEntity();
  *(_QWORD *)(v2 + 320) = swift_task_alloc();
  *(_QWORD *)(v2 + 328) = swift_task_alloc();
  v5 = sub_23842C72C();
  *(_QWORD *)(v2 + 336) = v5;
  *(_QWORD *)(v2 + 344) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 352) = swift_task_alloc();
  *(_QWORD *)(v2 + 360) = swift_task_alloc();
  v6 = sub_23842C558();
  *(_QWORD *)(v2 + 368) = v6;
  *(_QWORD *)(v2 + 376) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 384) = swift_task_alloc();
  *(_QWORD *)(v2 + 392) = swift_task_alloc();
  v7 = sub_23842C6FC();
  *(_QWORD *)(v2 + 400) = v7;
  *(_QWORD *)(v2 + 408) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 416) = swift_task_alloc();
  *(_QWORD *)(v2 + 424) = swift_task_alloc();
  *(_QWORD *)(v2 + 432) = swift_task_alloc();
  *(_QWORD *)(v2 + 440) = swift_task_alloc();
  v8 = sub_23842C720();
  *(_QWORD *)(v2 + 448) = v8;
  *(_QWORD *)(v2 + 456) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v2 + 464) = swift_task_alloc();
  v9 = sub_23842C39C();
  *(_QWORD *)(v2 + 472) = v9;
  *(_QWORD *)(v2 + 480) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v2 + 488) = swift_task_alloc();
  v10 = sub_238409F1C(&qword_256906A18);
  *(_QWORD *)(v2 + 496) = v10;
  *(_QWORD *)(v2 + 504) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v2 + 512) = swift_task_alloc();
  v11 = sub_23842C798();
  *(_QWORD *)(v2 + 520) = v11;
  *(_QWORD *)(v2 + 528) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v2 + 536) = swift_task_alloc();
  *(_QWORD *)(v2 + 544) = swift_task_alloc();
  *(_QWORD *)(v2 + 552) = swift_task_alloc();
  *(_QWORD *)(v2 + 560) = swift_task_alloc();
  *(_QWORD *)(v2 + 568) = swift_task_alloc();
  sub_238409F1C(&qword_2569069A0);
  *(_QWORD *)(v2 + 576) = swift_task_alloc();
  v12 = sub_238409F1C(&qword_256906A08);
  *(_QWORD *)(v2 + 584) = v12;
  *(_QWORD *)(v2 + 592) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v2 + 600) = swift_task_alloc();
  *(_QWORD *)(v2 + 608) = swift_task_alloc();
  sub_238409F1C(&qword_2569069C0);
  *(_QWORD *)(v2 + 616) = swift_task_alloc();
  v13 = sub_23842C420();
  *(_QWORD *)(v2 + 624) = v13;
  *(_QWORD *)(v2 + 632) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v2 + 640) = swift_task_alloc();
  v14 = sub_23842C51C();
  *(_QWORD *)(v2 + 648) = v14;
  *(_QWORD *)(v2 + 656) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v2 + 664) = swift_task_alloc();
  v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 672) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 688) = v15;
  *(_QWORD *)(v2 + 704) = *(_QWORD *)(v1 + 32);
  return swift_task_switch();
}

uint64_t sub_238423384()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 664);
  v2 = *(_QWORD *)(v0 + 656);
  v3 = *(_QWORD *)(v0 + 648);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE18E60], v3);
  v4 = sub_23842C510();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 640);
    v6 = *(_QWORD *)(v0 + 632);
    v7 = *(_QWORD *)(v0 + 624);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(_QWORD *)(v0 + 160) = *(_QWORD *)(v0 + 176);
    *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 184);
    sub_23842C414();
    sub_23840DFEC();
    v8 = sub_23842CB04();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0)
      v11 = v8 & 0xFFFFFFFFFFFFLL;
    if (v11)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23842C2A0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v13 = *(_QWORD *)(v0 + 96);
      v12 = *(_QWORD *)(v0 + 104);
      *(_QWORD *)(v0 + 712) = v12;
      v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256907230 + dword_256907230);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 720) = v14;
      *v14 = v0;
      v14[1] = sub_238423914;
      return v26(v13, v12);
    }
    v23 = *(_QWORD *)(v0 + 616);
    v24 = *(_QWORD *)(v0 + 264);
    v25 = *(_QWORD *)(v0 + 272);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2B8();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, v24);
    sub_23842C1C8();
    sub_23840E940(&qword_256906A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4BD0], MEMORY[0x24BDB4BD8]);
    swift_allocError();
    sub_23842C2C4();
    swift_release();
    sub_23840E670(v23, &qword_2569069C0);
  }
  else
  {
    sub_23842C774();
    v16 = sub_23842C78C();
    v17 = sub_23842CA8C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_238407000, v16, v17, "Feature flag is disabled", v18, 2u);
      MEMORY[0x23B8343E8](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 544);
    v20 = *(_QWORD *)(v0 + 528);
    v21 = *(_QWORD *)(v0 + 520);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_23840DE38();
    swift_allocError();
    *(_QWORD *)v22 = 0;
    *(_QWORD *)(v22 + 8) = 0;
    *(_BYTE *)(v22 + 16) = 4;
  }
  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_238423914(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 728) = a1;
  *(_QWORD *)(v3 + 736) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23842398C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  void (*v31)(uint64_t, uint64_t);
  NSObject *v32;
  os_signpost_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, _QWORD, uint64_t);
  uint8_t *v38;
  os_signpost_id_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  os_log_type_t v50;
  uint64_t v51[3];

  v1 = *(void **)(v0 + 728);
  v2 = v1;
  if (!v1)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v2 = *(void **)(v0 + 192);
    if (!v2)
    {
      v43 = *(_QWORD *)(v0 + 616);
      v44 = *(_QWORD *)(v0 + 264);
      v45 = *(_QWORD *)(v0 + 272);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23842C2B8();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v43, 1, 1, v44);
      sub_23842C1C8();
      sub_23840E940(&qword_256906A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4BD0], MEMORY[0x24BDB4BD8]);
      swift_allocError();
      sub_23842C2C4();
      swift_release();
      sub_23840E670(v43, &qword_2569069C0);
      swift_willThrow();
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
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v1 = *(void **)(v0 + 728);
  }
  *(_QWORD *)(v0 + 744) = v2;
  v3 = *(_QWORD *)(v0 + 592);
  v4 = *(_QWORD *)(v0 + 584);
  v5 = *(_QWORD *)(v0 + 576);
  v6 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4))
  {
    sub_23840E670(*(_QWORD *)(v0 + 576), &qword_2569069A0);
    v7 = 0x4072C00000000000;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 608);
    v9 = *(_QWORD *)(v0 + 600);
    v10 = *(_QWORD *)(v0 + 592);
    v11 = *(_QWORD *)(v0 + 584);
    v12 = *(_QWORD *)(v0 + 576);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    sub_23840E670(v12, &qword_2569069A0);
    v13 = objc_msgSend((id)objc_opt_self(), sel_meters);
    sub_23842C408();

    v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v14(v9, v11);
    sub_23842C3FC();
    v7 = v15;
    v14(v8, v11);
  }
  *(_QWORD *)(v0 + 752) = v7;
  sub_23840E6AC();
  if ((sub_23842CAB0() & 1) != 0)
  {
    sub_23842C774();
    v16 = sub_23842C78C();
    v17 = sub_23842CAA4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_238407000, v16, v17, "We will request confirmation for creating a task", v18, 2u);
      MEMORY[0x23B8343E8](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 704);
    v20 = *(_QWORD *)(v0 + 568);
    v21 = *(_QWORD *)(v0 + 528);
    v22 = *(_QWORD *)(v0 + 520);
    v49 = *(_OWORD *)(v0 + 672);
    v48 = *(_OWORD *)(v0 + 688);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    *(_OWORD *)(v0 + 16) = v49;
    *(_OWORD *)(v0 + 32) = v48;
    *(_QWORD *)(v0 + 48) = v19;
    sub_23842C288();
    sub_23842C390();
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 760) = v23;
    sub_238426970();
    sub_23840ED94(&qword_256906A70, &qword_256906A18, MEMORY[0x24BDB5E58]);
    *v23 = v0;
    v23[1] = sub_2384244A4;
    return sub_23842C210();
  }
  else
  {
    sub_23842C774();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    v25 = sub_23842C78C();
    v50 = sub_23842CAA4();
    v26 = os_log_type_enabled(v25, v50);
    v27 = *(_QWORD *)(v0 + 560);
    v28 = *(_QWORD *)(v0 + 528);
    v29 = *(_QWORD *)(v0 + 520);
    if (v26)
    {
      v47 = *(_QWORD *)(v0 + 560);
      v30 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v51[0] = v46;
      *(_DWORD *)v30 = 136315138;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_23842C2A0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      *(_QWORD *)(v0 + 216) = sub_23840E030(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152), v51);
      sub_23842CAEC();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_238407000, v25, v50, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v46, -1, -1);
      MEMORY[0x23B8343E8](v30, -1, -1);

      v31 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v31(v47, v29);
    }
    else
    {

      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      v31 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v31(v27, v29);
    }
    *(_QWORD *)(v0 + 776) = v31;
    sub_23842C780();
    sub_23842C708();
    sub_23842C714();
    sub_23842C6E4();
    v32 = sub_23842C714();
    v33 = sub_23842CAC8();
    if ((sub_23842CAD4() & 1) != 0)
    {
      v34 = *(_QWORD *)(v0 + 432);
      v35 = *(_QWORD *)(v0 + 400);
      v36 = *(_QWORD *)(v0 + 408);
      v37 = *(void (**)(uint64_t, _QWORD, uint64_t))(v36 + 16);
      v37(v34, *(_QWORD *)(v0 + 440), v35);
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      v39 = sub_23842C6F0();
      _os_signpost_emit_with_name_impl(&dword_238407000, v32, v33, v39, "CE.Intent.Create.Enter", "", v38, 2u);
      MEMORY[0x23B8343E8](v38, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    }
    else
    {
      v40 = *(_QWORD *)(v0 + 408);

      v37 = *(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 16);
    }
    *(_QWORD *)(v0 + 784) = v37;
    v37(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 400));
    sub_23842C75C();
    swift_allocObject();
    *(_QWORD *)(v0 + 792) = sub_23842C750();
    static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v51);
    v41 = v51[0];
    *(_QWORD *)(v0 + 800) = v51[0];
    sub_23842C684();
    *(_QWORD *)(v0 + 808) = sub_23842C678();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    *(_QWORD *)(v0 + 816) = *(_QWORD *)(v0 + 136);
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(_QWORD *)(v0 + 80) = &type metadata for ShortcutsRunScheduledQueryIntent;
    *(_QWORD *)(v0 + 88) = sub_23840E6E8();
    *(_QWORD *)(v0 + 56) = v41;
    swift_retain();
    v42 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 824) = v42;
    *v42 = v0;
    v42[1] = sub_238424A8C;
    return sub_23842C63C();
  }
}

uint64_t sub_2384244A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 768) = v0;
  swift_task_dealloc();
  v4 = v2[63];
  v3 = v2[64];
  v5 = v2[62];
  (*(void (**)(_QWORD, _QWORD))(v2[60] + 8))(v2[61], v2[59]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch();
}

uint64_t sub_238424558()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, uint64_t);
  uint8_t *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_23842C774();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v21 = v0[66];
    v22 = v0[65];
    v23 = v0[70];
    v3 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v3 = 136315138;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23842C2A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v0[27] = sub_23840E030(v0[18], v0[19], &v24);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_238407000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v20, -1, -1);
    MEMORY[0x23B8343E8](v3, -1, -1);

    v4 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v4(v23, v22);
  }
  else
  {
    v5 = v0[70];
    v6 = v0[66];
    v7 = v0[65];
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();

    v4 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v4(v5, v7);
  }
  v0[97] = v4;
  sub_23842C780();
  sub_23842C708();
  sub_23842C714();
  sub_23842C6E4();
  v8 = sub_23842C714();
  v9 = sub_23842CAC8();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v10 = v0[54];
    v11 = v0[50];
    v12 = v0[51];
    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 16);
    v13(v10, v0[55], v11);
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v8, v9, v15, "CE.Intent.Create.Enter", "", v14, 2u);
    MEMORY[0x23B8343E8](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    v16 = v0[51];

    v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16);
  }
  v0[98] = v13;
  v13(v0[54], v0[55], v0[50]);
  sub_23842C75C();
  swift_allocObject();
  v0[99] = sub_23842C750();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v24);
  v17 = v24;
  v0[100] = v24;
  sub_23842C684();
  v0[101] = sub_23842C678();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  v0[102] = v0[17];
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v0[10] = &type metadata for ShortcutsRunScheduledQueryIntent;
  v0[11] = sub_23840E6E8();
  v0[7] = v17;
  swift_retain();
  v18 = (_QWORD *)swift_task_alloc();
  v0[103] = v18;
  *v18 = v0;
  v18[1] = sub_238424A8C;
  return sub_23842C63C();
}

uint64_t sub_238424A8C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 832) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  if (!v0)
    sub_23840EDD4(v2 + 56);
  return swift_task_switch();
}

uint64_t sub_238424B24()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
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
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v1);
  v2 = sub_23842C714();
  sub_23842C744();
  v3 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 360);
    v6 = *(_QWORD *)(v0 + 336);
    v5 = *(_QWORD *)(v0 + 344);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x24BEE7810])
    {
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 336));
      v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v7 = 1;
    }
    v9 = (uint64_t *)(v0 + 432);
    v12 = *(_QWORD *)(v0 + 424);
    v13 = *(_QWORD *)(v0 + 400);
    v32 = *(_QWORD *)(v0 + 408);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 784))(*(_QWORD *)(v0 + 432), v12, v13);
    v14 = swift_slowAlloc();
    *(_BYTE *)v14 = 0;
    *(_BYTE *)(v14 + 1) = v7;
    *(_WORD *)(v14 + 2) = 2050;
    *(_QWORD *)(v0 + 208) = 0;
    sub_23842CAEC();
    v15 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v2, v3, v15, "CE.Intent.Create.Enter", v8, (uint8_t *)v14, 0xCu);
    MEMORY[0x23B8343E8](v14, -1, -1);

    v11 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v11(v12, v13);
  }
  else
  {
    v9 = (uint64_t *)(v0 + 424);
    v10 = *(_QWORD *)(v0 + 408);

    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  }
  v16 = *v9;
  *(_QWORD *)(v0 + 840) = v11;
  v17 = *(_QWORD *)(v0 + 392);
  v19 = *(_QWORD *)(v0 + 376);
  v18 = *(_QWORD *)(v0 + 384);
  v20 = *(_QWORD *)(v0 + 368);
  v22 = *(uint64_t **)(v0 + 320);
  v21 = *(_QWORD *)(v0 + 328);
  v24 = *(_QWORD *)(v0 + 304);
  v23 = *(_QWORD *)(v0 + 312);
  v30 = *(_QWORD *)(v0 + 296);
  v31 = *(_QWORD *)(v0 + 288);
  v11(v16, *(_QWORD *)(v0 + 400));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v17, v20);
  *v22 = sub_23842C540();
  v22[1] = v25;
  v22[2] = sub_23842C54C();
  v22[3] = v26;
  v22[4] = sub_23842C534();
  v22[5] = v27;
  sub_23842C528();
  v28 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v0 + 848) = v28;
  v28(v18, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))((char *)v22 + *(int *)(v23 + 28), v24, v31);
  sub_23840E780((uint64_t)v22, v21);
  sub_23842C588();
  sub_23842C258();
  sub_23840E7C4(v21, (uint64_t)v22);
  sub_23842CA74();
  *(_QWORD *)(v0 + 856) = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_238424E18()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(void **)(v0 + 832);
  sub_23840EDD4(v0 + 56);
  sub_23842C774();
  v2 = v1;
  v3 = v1;
  v4 = sub_23842C78C();
  v5 = sub_23842CA8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 832);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 200) = v10;
    sub_23842CAEC();
    *v8 = v10;

    _os_log_impl(&dword_238407000, v4, v5, "Failed creating location query: %@", v7, 0xCu);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v8, -1, -1);
    MEMORY[0x23B8343E8](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 832);

  }
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 776);
  v13 = *(_QWORD *)(v0 + 536);
  v14 = *(_QWORD *)(v0 + 520);

  v12(v13, v14);
  sub_23840E72C();
  sub_23840DDCC();
  sub_23840E770(v15);
  v16 = sub_23842C714();
  sub_23842C744();
  v17 = sub_23842CABC();
  if ((sub_23842CAD4() & 1) != 0)
  {
    v18 = *(_QWORD *)(v0 + 344);
    v19 = *(_QWORD *)(v0 + 352);
    v20 = *(_QWORD *)(v0 + 336);
    swift_retain();
    sub_23842C768();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x24BEE7810])
    {
      v21 = 0;
      v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 336));
      v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      v21 = 1;
    }
    v23 = (uint64_t *)(v0 + 432);
    v26 = *(_QWORD *)(v0 + 416);
    v42 = *(_QWORD *)(v0 + 408);
    v27 = *(_QWORD *)(v0 + 400);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 784))(*(_QWORD *)(v0 + 432), v26, v27);
    v28 = swift_slowAlloc();
    *(_BYTE *)v28 = 0;
    *(_BYTE *)(v28 + 1) = v21;
    *(_WORD *)(v28 + 2) = 2050;
    *(_QWORD *)(v0 + 224) = 1;
    sub_23842CAEC();
    v29 = sub_23842C6F0();
    _os_signpost_emit_with_name_impl(&dword_238407000, v16, v17, v29, "CE.Intent.Create.Enter", v22, (uint8_t *)v28, 0xCu);
    MEMORY[0x23B8343E8](v28, -1, -1);

    v25 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v25(v26, v27);
  }
  else
  {
    v23 = (uint64_t *)(v0 + 416);
    v24 = *(_QWORD *)(v0 + 408);

    v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  v30 = *v23;
  v38 = *(id *)(v0 + 832);
  v31 = *(void **)(v0 + 744);
  v40 = *(void **)(v0 + 728);
  v43 = *(_QWORD *)(v0 + 464);
  v39 = *(_QWORD *)(v0 + 456);
  v41 = *(_QWORD *)(v0 + 448);
  v37 = *(_QWORD *)(v0 + 440);
  v32 = *(_QWORD *)(v0 + 400);
  v25(v30, v32);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23842C2A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v34 = *(_QWORD *)(v0 + 112);
  v33 = *(_QWORD *)(v0 + 120);
  sub_23840DE38();
  swift_allocError();
  *(_QWORD *)v35 = v34;
  *(_QWORD *)(v35 + 8) = v33;
  *(_BYTE *)(v35 + 16) = 2;
  swift_willThrow();

  swift_release();
  swift_release();

  v25(v37, v32);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v41);
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
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_238425410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906988 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907210);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2384254A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return CreateLocationEnteredScheduledQueryIntent.perform()(a1);
}

uint64_t sub_2384254FC()
{
  sub_238426970();
  return sub_23842C228();
}

unint64_t sub_238425524(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23842CBB8();
  sub_23842CA20();
  v4 = sub_23842CBC4();
  return sub_238425588(a1, a2, v4);
}

unint64_t sub_238425588(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23842CB64() & 1) == 0)
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
      while (!v14 && (sub_23842CB64() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_238425668(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[6] = a1;
  v2[7] = a2;
  sub_238409F1C(&qword_256907260);
  v2[8] = swift_task_alloc();
  v3 = sub_23842C600();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v4 = sub_23842C798();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  sub_238409F1C(&qword_256907268);
  v2[20] = swift_task_alloc();
  v5 = sub_23842C6B4();
  v2[21] = v5;
  v2[22] = *(_QWORD *)(v5 - 8);
  v2[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384257A4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  if (*(_QWORD *)(v0 + 56))
  {
    sub_23842C6D8();
    v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE19018];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 192) = sub_23842C6C0();
    sub_23840E940(qword_256907270, v1, MEMORY[0x24BE19020]);
    sub_23842CA5C();
    return swift_task_switch();
  }
  else
  {
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
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_2384258E8()
{
  uint64_t v0;

  sub_23842C6CC();
  *(_QWORD *)(v0 + 200) = 0;
  swift_release();
  return swift_task_switch();
}

uint64_t sub_238425964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v36;
  _QWORD *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t (*v50)(void);
  uint64_t v51[2];

  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 160);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    v5 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 56);
    sub_23840E670(v3, &qword_256907268);
    v6 = v5 == 1701995880 && v4 == 0xE400000000000000;
    if (!v6 && (sub_23842CB64() & 1) == 0)
    {
      sub_23842C60C();
      *(_QWORD *)(v0 + 240) = sub_23842C5C4();
      v50 = (uint64_t (*)(void))((int)*MEMORY[0x24BE18F08] + MEMORY[0x24BE18F08]);
      v44 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 248) = v44;
      *v44 = v0;
      v44[1] = sub_238426224;
      return v50();
    }
    sub_23842C774();
    swift_bridgeObjectRetain_n();
    v7 = sub_23842C78C();
    v8 = sub_23842CAA4();
    v9 = os_log_type_enabled(v7, v8);
    v10 = *(_QWORD *)(v0 + 144);
    v11 = *(_QWORD *)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 112);
    v13 = *(_QWORD *)(v0 + 56);
    if (v9)
    {
      v14 = *(_QWORD *)(v0 + 48);
      v47 = *(_QWORD *)(v0 + 144);
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v51[0] = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 32) = sub_23840E030(v14, v13, v51);
      sub_23842CAEC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_238407000, v7, v8, "Using current location for: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v16, -1, -1);
      MEMORY[0x23B8343E8](v15, -1, -1);

      v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v17(v47, v11);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v17(v10, v11);
    }
    sub_23842C57C();
    v36 = (void *)sub_23842C570();
    *(_QWORD *)(v0 + 208) = v36;
    if ((sub_23842C564() & 1) != 0)
    {
      v50 = (uint64_t (*)(void))((int)*MEMORY[0x24BE18EB0] + MEMORY[0x24BE18EB0]);
      v37 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v37;
      *v37 = v0;
      v37[1] = sub_238426048;
      return v50();
    }
    swift_bridgeObjectRelease();
    sub_23842C774();
    v38 = sub_23842C78C();
    v39 = sub_23842CA8C();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_238407000, v38, v39, "Location access is not authorized", v40, 2u);
      MEMORY[0x23B8343E8](v40, -1, -1);
    }
    v41 = *(_QWORD *)(v0 + 136);
    v42 = *(_QWORD *)(v0 + 104);

    v17(v41, v42);
    sub_23840DE38();
    swift_allocError();
    *(_OWORD *)v43 = xmmword_23842DE80;
    *(_BYTE *)(v43 + 16) = 4;
    swift_willThrow();

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
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 32))(*(_QWORD *)(v0 + 184), v3, v2);
    sub_23842C774();
    swift_bridgeObjectRetain();
    v18 = sub_23842C78C();
    v19 = sub_23842CAA4();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *(_QWORD *)(v0 + 152);
    v22 = *(_QWORD *)(v0 + 104);
    v23 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 56);
    if (v20)
    {
      v45 = *(_QWORD *)(v0 + 48);
      v48 = *(_QWORD *)(v0 + 152);
      v25 = (uint8_t *)swift_slowAlloc();
      v46 = v22;
      v26 = swift_slowAlloc();
      v51[0] = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 40) = sub_23840E030(v45, v24, v51);
      sub_23842CAEC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_238407000, v18, v19, "Using override location for: %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v26, -1, -1);
      MEMORY[0x23B8343E8](v25, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v48, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    }
    v28 = *(_QWORD *)(v0 + 176);
    v27 = *(_QWORD *)(v0 + 184);
    v29 = *(_QWORD *)(v0 + 168);
    sub_23842C69C();
    v31 = v30;
    sub_23842C6A8();
    v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v31, v32);
    sub_23842C690();
    v34 = (void *)sub_23842C9FC();
    swift_bridgeObjectRelease();
    v49 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v33, v34, 0);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
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
    return (*(uint64_t (**)(id))(v0 + 8))(v49);
  }
}

uint64_t sub_238426048(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2384260B4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD *v4;
  id v5;
  uint64_t (*v6)(void);

  v1 = *(void **)(v0 + 224);
  v2 = *(void **)(v0 + 208);
  if (v1)
  {
    swift_bridgeObjectRelease();
    v5 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v1, 0, 0);

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
    return (*(uint64_t (**)(id))(v0 + 8))(v5);
  }
  else
  {

    sub_23842C60C();
    *(_QWORD *)(v0 + 240) = sub_23842C5C4();
    v6 = (uint64_t (*)(void))((int)*MEMORY[0x24BE18F08] + MEMORY[0x24BE18F08]);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v4;
    *v4 = v0;
    v4[1] = sub_238426224;
    return v6();
  }
}

uint64_t sub_238426224(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 256) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_238426288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
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
  unint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 256) + 16))
  {
    v2 = *(_QWORD *)(v0 + 48);
    v1 = *(_QWORD *)(v0 + 56);
    swift_bridgeObjectRetain();
    v3 = sub_238425524(v2, v1);
    if ((v4 & 1) != 0)
    {
      v6 = *(_QWORD *)(v0 + 72);
      v5 = *(_QWORD *)(v0 + 80);
      v7 = *(_QWORD *)(v0 + 64);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(*(_QWORD *)(v0 + 256) + 56) + *(_QWORD *)(v5 + 72) * v3, v6);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v6);
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 56))(*(_QWORD *)(v0 + 64), 1, 1, *(_QWORD *)(v0 + 72));
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 56))(*(_QWORD *)(v0 + 64), 1, 1, *(_QWORD *)(v0 + 72));
  }
  v9 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v9) == 1)
  {
    sub_23840E670(*(_QWORD *)(v0 + 64), &qword_256907260);
    sub_23842C774();
    swift_bridgeObjectRetain();
    v11 = sub_23842C78C();
    v12 = sub_23842CAA4();
    v13 = os_log_type_enabled(v11, v12);
    v15 = *(_QWORD *)(v0 + 112);
    v14 = *(_QWORD *)(v0 + 120);
    v16 = *(_QWORD *)(v0 + 104);
    v17 = *(_QWORD *)(v0 + 56);
    if (v13)
    {
      v18 = *(_QWORD *)(v0 + 48);
      v46 = *(_QWORD *)(v0 + 120);
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v50 = v20;
      *(_DWORD *)v19 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 16) = sub_23840E030(v18, v17, &v50);
      sub_23842CAEC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_238407000, v11, v12, "No override location found for: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v20, -1, -1);
      MEMORY[0x23B8343E8](v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v46, v16);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    v49 = 0;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 32))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
    sub_23842C774();
    swift_bridgeObjectRetain();
    v21 = sub_23842C78C();
    v22 = sub_23842CAA4();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(_QWORD *)(v0 + 128);
    v25 = *(_QWORD *)(v0 + 104);
    v26 = *(_QWORD *)(v0 + 112);
    v27 = *(_QWORD *)(v0 + 56);
    if (v23)
    {
      v28 = *(_QWORD *)(v0 + 48);
      v48 = *(_QWORD *)(v0 + 128);
      v47 = *(_QWORD *)(v0 + 104);
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v50 = v30;
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 24) = sub_23840E030(v28, v27, &v50);
      sub_23842CAEC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_238407000, v21, v22, "Using CoreRoutine location for: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v30, -1, -1);
      MEMORY[0x23B8343E8](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v48, v47);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    }
    v32 = *(_QWORD *)(v0 + 88);
    v31 = *(_QWORD *)(v0 + 96);
    v33 = *(_QWORD *)(v0 + 72);
    v34 = *(_QWORD *)(v0 + 80);
    sub_23842C5E8();
    v36 = v35;
    sub_23842C5F4();
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v36, v37);
    sub_23842C5D0();
    v40 = v39;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v31, v33);
    if (!v40)
      sub_23842C5DC();
    v41 = *(_QWORD *)(v0 + 96);
    v42 = *(_QWORD *)(v0 + 72);
    v43 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 80) + 8);
    v43(*(_QWORD *)(v0 + 88), v42);
    v44 = (void *)sub_23842C9FC();
    swift_bridgeObjectRelease();
    v49 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v38, v44, 0);

    v43(v41, v42);
  }
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
  return (*(uint64_t (**)(id))(v0 + 8))(v49);
}

uint64_t sub_2384267EC()
{
  uint64_t v0;

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

uint64_t sub_2384268A4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
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

unint64_t sub_238426970()
{
  unint64_t result;

  result = qword_256907238;
  if (!qword_256907238)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationEnteredScheduledQueryIntent, &type metadata for CreateLocationEnteredScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907238);
  }
  return result;
}

unint64_t sub_2384269B8()
{
  unint64_t result;

  result = qword_256907240;
  if (!qword_256907240)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationEnteredScheduledQueryIntent, &type metadata for CreateLocationEnteredScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907240);
  }
  return result;
}

unint64_t sub_238426A04()
{
  unint64_t result;

  result = qword_256907248;
  if (!qword_256907248)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationEnteredScheduledQueryIntent, &type metadata for CreateLocationEnteredScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907248);
  }
  return result;
}

unint64_t sub_238426A4C()
{
  unint64_t result;

  result = qword_256907250;
  if (!qword_256907250)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for CreateLocationEnteredScheduledQueryIntent, &type metadata for CreateLocationEnteredScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907250);
  }
  return result;
}

uint64_t sub_238426A90()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_238426AB4()
{
  sub_238426970();
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for CreateLocationEnteredScheduledQueryIntent()
{
  return &type metadata for CreateLocationEnteredScheduledQueryIntent;
}

uint64_t sub_238426B2C()
{
  return sub_23840ED94(&qword_256906AA0, &qword_256906AA8, MEMORY[0x24BDB5E68]);
}

uint64_t sub_238426B58()
{
  return sub_23840ED94(&qword_256906AB0, &qword_256906AA8, MEMORY[0x24BDB5E60]);
}

uint64_t sub_238426B84()
{
  return sub_23840ED94(&qword_256906AB8, &qword_256906AA8, MEMORY[0x24BDB5E70]);
}

char *sub_238426BB0(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 24);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = sub_23842C4A4();
    v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_238426C4C(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = sub_23842C4A4();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_238426C94(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23842C4A4();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_238426D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23842C4A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *sub_238426D78(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23842C4A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_238426DD4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23842C4A4();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_238426E48()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238426E54(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23842C4A4();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_238426ED0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_238426EDC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_23842C4A4();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LocationSnippetView()
{
  uint64_t result;

  result = qword_2569072D0;
  if (!qword_2569072D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_238426F8C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23842C4A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_238427010()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238427020@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v31;
  int v32;
  char v33;

  v4 = sub_23842C81C();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_23842C4A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocationSnippetView();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, (char *)a1 + *(int *)(v9 + 24), v5);
  v10 = sub_23842C90C();
  v12 = v11;
  v14 = v13 & 1;
  v15 = sub_23842C8B8();
  v17 = v16;
  v32 = v18;
  v20 = v19;
  sub_23840F884(v10, v12, v14);
  swift_bridgeObjectRelease();
  sub_23842C810();
  sub_23842C804();
  v21 = objc_msgSend(*a1, sel_name);
  if (v21)
  {
    v22 = v21;
    sub_23842CA08();

  }
  v23 = v32 & 1;
  sub_23842C7F8();
  swift_bridgeObjectRelease();
  sub_23842C804();
  sub_23842C834();
  v24 = sub_23842C900();
  v26 = v25;
  v33 = v23;
  v28 = v27 & 1;
  *(_QWORD *)a2 = v15;
  *(_QWORD *)(a2 + 8) = v17;
  *(_BYTE *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v20;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v24;
  *(_QWORD *)(a2 + 56) = v25;
  *(_BYTE *)(a2 + 64) = v27 & 1;
  *(_QWORD *)(a2 + 72) = v29;
  sub_23840F7DC(v15, v17, v23);
  swift_bridgeObjectRetain();
  sub_23840F7DC(v24, v26, v28);
  swift_bridgeObjectRetain();
  sub_23840F884(v24, v26, v28);
  swift_bridgeObjectRelease();
  sub_23840F884(v15, v17, v33);
  return swift_bridgeObjectRelease();
}

uint64_t sub_238427294()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v1 = sub_23842C7D4();
  sub_238427020(v0, (uint64_t)&v13);
  v2 = v13;
  v3 = v14;
  v4 = v15;
  v6 = v16;
  v5 = v17;
  v7 = v18;
  v8 = v19;
  v9 = v20;
  v10 = v21;
  v12 = v22;
  v13 = v1;
  v14 = 0;
  v15 = 1;
  v16 = v2;
  v17 = v3;
  v18 = v4;
  v19 = v6;
  v20 = v5;
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v25 = v12;
  sub_23842C870();
  sub_238409F1C(&qword_256907310);
  sub_238427398();
  sub_23842C93C();
  sub_23840F884(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23840F884(v8, v9, v10);
  return swift_bridgeObjectRelease();
}

unint64_t sub_238427398()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256907318;
  if (!qword_256907318)
  {
    v1 = sub_23840E888(&qword_256907310);
    result = MEMORY[0x23B834364](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_256907318);
  }
  return result;
}

uint64_t sub_2384273E4()
{
  sub_23840E888(&qword_256907310);
  sub_238427398();
  return swift_getOpaqueTypeConformance2();
}

uint64_t ScheduledQueryView.init(triggerParameters:displayRepresentation:showDetail:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t View;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  View = type metadata accessor for ScheduledQueryView(0);
  v10 = a4 + *(int *)(View + 20);
  v11 = sub_23842C384();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  *(_BYTE *)(a4 + *(int *)(View + 24)) = a3;
  return result;
}

uint64_t type metadata accessor for ScheduledQueryView(uint64_t a1)
{
  return sub_23840F450(a1, qword_256907380);
}

uint64_t ScheduledQueryView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_23842C7C8();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = sub_238409F1C(&qword_256907320);
  return sub_238427520(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_238427520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;

  v4 = sub_238409F1C(&qword_2569074C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - v8;
  v10 = sub_23842C984();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23842C594();
  sub_23842C978();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDF3FD0], v10);
  v14 = sub_23842C990();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_23842C9A8();
  sub_23842C7B0();
  v15 = v24;
  LOBYTE(v13) = v25;
  v16 = v26;
  LOBYTE(v11) = v27;
  v17 = v29;
  v23 = v28;
  *(_QWORD *)v9 = sub_23842C858();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v18 = sub_238409F1C(&qword_2569074C8);
  sub_23842776C(a1, (uint64_t *)&v9[*(int *)(v18 + 44)]);
  sub_238429374((uint64_t)v9, (uint64_t)v7, &qword_2569074C0);
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v15;
  *(_BYTE *)(a2 + 32) = (_BYTE)v13;
  *(_QWORD *)(a2 + 40) = v16;
  *(_BYTE *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v17;
  v19 = sub_238409F1C(&qword_2569074D0);
  sub_238429374((uint64_t)v7, a2 + *(int *)(v19 + 48), &qword_2569074C0);
  v20 = a2 + *(int *)(v19 + 64);
  *(_QWORD *)v20 = 0;
  *(_BYTE *)(v20 + 8) = 1;
  swift_retain();
  sub_23840E670((uint64_t)v9, &qword_2569074C0);
  sub_23840E670((uint64_t)v7, &qword_2569074C0);
  return swift_release();
}

uint64_t sub_23842775C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23842776C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t View;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
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
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t *v63;

  v63 = a2;
  v3 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_238409F1C(&qword_2569074D8);
  MEMORY[0x24BDAC7A8](v59);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for ScheduledQueryView.SubtitleView(0);
  MEMORY[0x24BDAC7A8](v60);
  v53 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_238409F1C(&qword_2569074E0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v62 = (uint64_t)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v61 = (char *)&v50 - v11;
  v51 = sub_23842C4A4();
  v12 = *(_QWORD *)(v51 - 8);
  v13 = MEMORY[0x24BDAC7A8](v51);
  v52 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  View = type metadata accessor for ScheduledQueryView(0);
  sub_23842C360();
  v16 = sub_23842C90C();
  v18 = v17;
  v20 = v19 & 1;
  sub_23842C888();
  v21 = sub_23842C8C4();
  v56 = v22;
  v57 = v21;
  v55 = v23;
  v58 = v24;
  swift_release();
  sub_23840F884(v16, v18, v20);
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(a1 + *(int *)(View + 24)) == 1)
  {
    v25 = (uint64_t)v53;
    sub_23842C378();
    v26 = v25 + *(int *)(v60 + 20);
    v27 = sub_23842C5B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v26, a1, v27);
    sub_23840F73C(v25, (uint64_t)v6, type metadata accessor for ScheduledQueryView.SubtitleView);
    swift_storeEnumTagMultiPayload();
    sub_23842932C();
    v28 = (uint64_t)v61;
    sub_23842C864();
    sub_23840E808(v25, type metadata accessor for ScheduledQueryView.SubtitleView);
  }
  else
  {
    v29 = (uint64_t)v54;
    sub_23842C378();
    v30 = v51;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v29, 1, v51) == 1)
    {
      sub_23842C480();
      sub_23840E670(v29, &qword_2569069D0);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v52, v29, v30);
    }
    v31 = sub_23842C90C();
    v33 = v32;
    v35 = v34 & 1;
    sub_23842C894();
    v36 = sub_23842C8C4();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    swift_release();
    sub_23840F884(v31, v33, v35);
    swift_bridgeObjectRelease();
    *(_QWORD *)v6 = v36;
    *((_QWORD *)v6 + 1) = v38;
    v6[16] = v40 & 1;
    *((_QWORD *)v6 + 3) = v42;
    swift_storeEnumTagMultiPayload();
    sub_23842932C();
    v28 = (uint64_t)v61;
    sub_23842C864();
  }
  v43 = v55 & 1;
  v44 = v62;
  sub_238429374(v28, v62, &qword_2569074E0);
  v45 = v63;
  v47 = v56;
  v46 = v57;
  *v63 = v57;
  v45[1] = v47;
  *((_BYTE *)v45 + 16) = v43;
  v45[3] = v58;
  v48 = sub_238409F1C(&qword_2569074F0);
  sub_238429374(v44, (uint64_t)v45 + *(int *)(v48 + 48), &qword_2569074E0);
  sub_23840F7DC(v46, v47, v43);
  swift_bridgeObjectRetain();
  sub_23840E670(v28, &qword_2569074E0);
  sub_23840E670(v44, &qword_2569074E0);
  sub_23840F884(v46, v47, v43);
  return swift_bridgeObjectRelease();
}

uint64_t sub_238427C00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  _QWORD *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  _BYTE *v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  char v73;
  _OWORD *v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v83;
  _BYTE *v84;
  _BYTE v85[12];
  int v86;
  _BYTE *v87;
  _BYTE *v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  _BYTE *v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;

  v97 = a1;
  v95 = sub_238409F1C(&qword_256907468);
  MEMORY[0x24BDAC7A8](v95);
  v96 = &v85[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v91 = sub_238409F1C(&qword_256907470);
  MEMORY[0x24BDAC7A8](v91);
  v93 = &v85[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v89 = sub_23842C7BC();
  MEMORY[0x24BDAC7A8](v89);
  v92 = &v85[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_238409F1C(&qword_2569069D0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v85[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v88 = &v85[-v9];
  v10 = sub_23842C4A4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = &v85[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v87 = &v85[-v15];
  v16 = sub_23842C81C();
  MEMORY[0x24BDAC7A8](v16);
  v94 = sub_238409F1C(&qword_256907478);
  v17 = MEMORY[0x24BDAC7A8](v94);
  v19 = &v85[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v90 = &v85[-v20];
  v21 = sub_23842C5B8();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = &v85[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = type metadata accessor for ScheduledQueryView.SubtitleView(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v22 + 16))(v24, v1 + *(int *)(v25 + 20), v21);
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v22 + 88))(v24, v21) == *MEMORY[0x24BE18EE8])
  {
    (*(void (**)(_BYTE *, uint64_t))(v22 + 96))(v24, v21);
    v86 = v24[40];
    swift_bridgeObjectRelease();
    sub_23842C810();
    sub_23842C804();
    sub_23842C978();
    sub_23842C7EC();
    swift_release();
    sub_23842C804();
    v26 = v88;
    sub_238429374(v1, (uint64_t)v88, &qword_2569069D0);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v26, 1, v10) == 1)
    {
      v27 = v87;
      sub_23842C480();
      sub_23840E670((uint64_t)v26, &qword_2569069D0);
    }
    else
    {
      v27 = v87;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 32))(v87, v26, v10);
    }
    sub_23842C7E0();
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v27, v10);
    sub_23842C804();
    sub_23842C834();
    v28 = sub_23842C900();
    v30 = v29;
    v32 = v31 & 1;
    sub_23842C894();
    v33 = sub_23842C8C4();
    v35 = v34;
    v37 = v36;
    swift_release();
    v38 = v37 & 1;
    sub_23840F884(v28, v30, v32);
    swift_bridgeObjectRelease();
    v39 = sub_23842C8B8();
    v41 = v40;
    v43 = v42;
    sub_23840F884(v33, v35, v38);
    swift_bridgeObjectRelease();
    if (v86)
      sub_23842C954();
    else
      sub_23842C960();
    v56 = sub_23842C8AC();
    v58 = v57;
    v60 = v59;
    v88 = v61;
    swift_release();
    v62 = v60 & 1;
    sub_23840F884(v39, v41, v43 & 1);
    swift_bridgeObjectRelease();
    LODWORD(v87) = sub_23842C870();
    sub_23842C7A4();
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    v71 = objc_msgSend((id)objc_opt_self(), sel_systemGray5Color);
    v72 = MEMORY[0x23B833E84](v71);
    v73 = sub_23842C870();
    v74 = v92;
    v75 = &v92[*(int *)(v89 + 20)];
    v76 = *MEMORY[0x24BDEEB68];
    v77 = sub_23842C840();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 104))(v75, v76, v77);
    __asm { FMOV            V0.2D, #4.0 }
    *v74 = _Q0;
    v83 = v93;
    sub_23840F73C((uint64_t)v74, (uint64_t)v93, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)&v83[*(int *)(v91 + 36)] = 256;
    sub_238429374((uint64_t)v83, (uint64_t)&v19[*(int *)(v94 + 36)], &qword_256907470);
    *(_QWORD *)v19 = v56;
    *((_QWORD *)v19 + 1) = v58;
    v19[16] = v62;
    *((_QWORD *)v19 + 3) = v88;
    v19[32] = (_BYTE)v87;
    *((_QWORD *)v19 + 5) = v64;
    *((_QWORD *)v19 + 6) = v66;
    *((_QWORD *)v19 + 7) = v68;
    *((_QWORD *)v19 + 8) = v70;
    v19[72] = 0;
    *((_QWORD *)v19 + 10) = v72;
    v19[88] = v73;
    sub_23840F7DC(v56, v58, v62);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_23840E670((uint64_t)v83, &qword_256907470);
    sub_23840E808((uint64_t)v74, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    sub_23840F884(v56, v58, v62);
    swift_release();
    swift_bridgeObjectRelease();
    v84 = v90;
    sub_2384292E4((uint64_t)v19, (uint64_t)v90);
    sub_238429374((uint64_t)v84, (uint64_t)v96, &qword_256907478);
    swift_storeEnumTagMultiPayload();
    sub_238429178();
    sub_23842C864();
    return sub_23840E670((uint64_t)v84, &qword_256907478);
  }
  else
  {
    sub_238429374(v1, (uint64_t)v8, &qword_2569069D0);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
    {
      sub_23842C480();
      sub_23840E670((uint64_t)v8, &qword_2569069D0);
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 32))(v14, v8, v10);
    }
    v44 = sub_23842C90C();
    v46 = v45;
    v48 = v47 & 1;
    sub_23842C894();
    v92 = (_BYTE *)sub_23842C8C4();
    v93 = v49;
    v51 = v50;
    v53 = v52;
    swift_release();
    sub_23840F884(v44, v46, v48);
    swift_bridgeObjectRelease();
    v54 = v96;
    *v96 = v92;
    v54[1] = v51;
    *((_BYTE *)v54 + 16) = v53 & 1;
    v54[3] = v93;
    swift_storeEnumTagMultiPayload();
    sub_238429178();
    sub_23842C864();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v22 + 8))(v24, v21);
  }
}

uint64_t sub_238428410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_23842C7C8();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = sub_238409F1C(&qword_256907320);
  return sub_238427520(v1, a1 + *(int *)(v3 + 44));
}

_QWORD *initializeBufferWithCopyOfBuffer for ScheduledQueryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23842C5B8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23842C384();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for ScheduledQueryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23842C384();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23842C384();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23842C384();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23842C384();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23842C5B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23842C384();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduledQueryView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2384287BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = sub_23842C5B8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23842C384();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 2)
    return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ScheduledQueryView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238428880(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23842C5B8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_23842C384();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_238428924()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23842C5B8();
  if (v1 <= 0x3F)
  {
    result = sub_23842C384();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2384289B0()
{
  return sub_23840ED94(&qword_2569073C0, qword_2569073C8, MEMORY[0x24BDF4498]);
}

uint64_t *sub_2384289DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23842C4A4();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = sub_238409F1C(&qword_2569069D0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_23842C5B8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_238428AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23842C4A4();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_23842C5B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

char *sub_238428B64(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_23842C4A4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_238409F1C(&qword_2569069D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

char *sub_238428C40(char *a1, char *a2, uint64_t a3)
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

  v6 = sub_23842C4A4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_238409F1C(&qword_2569069D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

char *sub_238428D68(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_23842C4A4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_238409F1C(&qword_2569069D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *sub_238428E44(char *a1, char *a2, uint64_t a3)
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

  v6 = sub_23842C4A4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_238409F1C(&qword_2569069D0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_23842C5B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_238428F6C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238428F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_238409F1C(&qword_2569069D0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_23842C5B8();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_238428FF0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238428FFC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_238409F1C(&qword_2569069D0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_23842C5B8();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for ScheduledQueryView.SubtitleView(uint64_t a1)
{
  return sub_23840F450(a1, (uint64_t *)&unk_256907428);
}

void sub_238429090()
{
  unint64_t v0;
  unint64_t v1;

  sub_238429114();
  if (v0 <= 0x3F)
  {
    sub_23842C5B8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_238429114()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256907438[0])
  {
    sub_23842C4A4();
    v0 = sub_23842CAE0();
    if (!v1)
      atomic_store(v0, qword_256907438);
  }
}

uint64_t sub_238429168()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_238429178()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256907480;
  if (!qword_256907480)
  {
    v1 = sub_23840E888(&qword_256907478);
    v2[0] = sub_2384291FC();
    v2[1] = sub_23840ED94(&qword_2569074B8, &qword_256907470, MEMORY[0x24BDEB950]);
    result = MEMORY[0x23B834364](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256907480);
  }
  return result;
}

unint64_t sub_2384291FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256907488;
  if (!qword_256907488)
  {
    v1 = sub_23840E888(&qword_256907490);
    v2[0] = sub_238429280();
    v2[1] = sub_23840ED94(&qword_2569074A8, &qword_2569074B0, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x23B834364](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256907488);
  }
  return result;
}

unint64_t sub_238429280()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256907498;
  if (!qword_256907498)
  {
    v1 = sub_23840E888(&qword_2569074A0);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B834364](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256907498);
  }
  return result;
}

uint64_t sub_2384292E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_238409F1C(&qword_256907478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23842932C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569074E8;
  if (!qword_2569074E8)
  {
    v1 = type metadata accessor for ScheduledQueryView.SubtitleView(255);
    result = MEMORY[0x23B834364](&unk_23842E110, v1);
    atomic_store(result, (unint64_t *)&qword_2569074E8);
  }
  return result;
}

uint64_t sub_238429374(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_238409F1C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2384293BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569074F8;
  if (!qword_2569074F8)
  {
    v1 = sub_23840E888(&qword_256907500);
    v2[0] = sub_238429178();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B834364](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569074F8);
  }
  return result;
}

uint64_t static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v2 = sub_23842C3C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v11);
  v44 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23842C4A4();
  v41 = *(_QWORD *)(v13 - 8);
  v42 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v43 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23842C798();
  v39 = *(_QWORD *)(v15 - 8);
  v40 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23842C4D4();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23842C4C8();
  v46 = sub_23842C4BC();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  sub_23842C774();
  swift_bridgeObjectRetain_n();
  v24 = sub_23842C78C();
  v25 = sub_23842CAA4();
  if (os_log_type_enabled(v24, v25))
  {
    v37 = v3;
    v26 = swift_slowAlloc();
    v38 = a1;
    v27 = (uint8_t *)v26;
    v28 = swift_slowAlloc();
    v36 = v8;
    v29 = v28;
    v48 = v28;
    *(_DWORD *)v27 = 136315138;
    swift_bridgeObjectRetain();
    v47 = sub_23840E030(v46, v23, &v48);
    v3 = v37;
    sub_23842CAEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_238407000, v24, v25, "Create Run Intent with generated query identifier = %s", v27, 0xCu);
    swift_arrayDestroy();
    v30 = v29;
    v8 = v36;
    MEMORY[0x23B8343E8](v30, -1, -1);
    v31 = v27;
    a1 = v38;
    MEMORY[0x23B8343E8](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v40);
  sub_238409F1C(&qword_2569069E8);
  sub_23842C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v44, 1, 1, v42);
  v32 = sub_23842C9C0();
  v48 = 0;
  v49 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v45, 1, 1, v32);
  v33 = sub_23842C24C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v8, 1, 1, v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDB6090], v2);
  v34 = sub_23842C300();
  v48 = v46;
  v49 = v23;
  swift_retain();
  sub_23842C2AC();
  result = swift_release();
  *a1 = v34;
  return result;
}

uint64_t sub_238429888(uint64_t a1)
{
  return sub_238429980(a1, qword_256907508);
}

uint64_t static ShortcutsRunScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384299F8(&qword_256906990, (uint64_t)qword_256907508, a1);
}

uint64_t static ShortcutsRunScheduledQueryIntent.title.setter(uint64_t a1)
{
  return sub_238429A9C(a1, &qword_256906990, (uint64_t)qword_256907508);
}

uint64_t (*static ShortcutsRunScheduledQueryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_256906990 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256907508);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23842995C(uint64_t a1)
{
  return sub_238429980(a1, qword_256907520);
}

uint64_t sub_238429980(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23842C4A4();
  sub_23840EE34(v3, a2);
  sub_238409554(v3, (uint64_t)a2);
  return sub_23842C480();
}

uint64_t static ShortcutsRunScheduledQueryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2384299F8(&qword_256906998, (uint64_t)qword_256907520, a1);
}

uint64_t sub_2384299F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23842C4A4();
  v6 = sub_238409554(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static ShortcutsRunScheduledQueryIntent.description.setter(uint64_t a1)
{
  return sub_238429A9C(a1, &qword_256906998, (uint64_t)qword_256907520);
}

uint64_t sub_238429A9C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*a2 != -1)
    swift_once();
  v5 = sub_23842C4A4();
  v6 = sub_238409554(v5, a3);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*static ShortcutsRunScheduledQueryIntent.description.modify())()
{
  uint64_t v0;

  if (qword_256906998 != -1)
    swift_once();
  v0 = sub_23842C4A4();
  sub_238409554(v0, (uint64_t)qword_256907520);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ShortcutsRunScheduledQueryIntent.scheduledQueryIdentifier.getter()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

double sub_238429BE8@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_retain();
  sub_23842C2A0();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_238429C30()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23842C2AC();
  return swift_release();
}

uint64_t ShortcutsRunScheduledQueryIntent.scheduledQueryIdentifier.setter()
{
  return sub_23842C2AC();
}

void (*ShortcutsRunScheduledQueryIntent.scheduledQueryIdentifier.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23842C294();
  return sub_23840A1F0;
}

uint64_t ShortcutsRunScheduledQueryIntent.$scheduledQueryIdentifier.getter()
{
  return sub_23842C2B8();
}

uint64_t static ShortcutsRunScheduledQueryIntent.isDiscoverable.getter()
{
  swift_beginAccess();
  return byte_256907538;
}

uint64_t static ShortcutsRunScheduledQueryIntent.isDiscoverable.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_256907538 = a1;
  return result;
}

uint64_t (*static ShortcutsRunScheduledQueryIntent.isDiscoverable.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ShortcutsRunScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v20 = a1;
  v1 = sub_23842C3C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_238409F1C(&qword_2569069C0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_238409F1C(&qword_2569069C8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_238409F1C(&qword_2569069D0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23842C4A4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  sub_238409F1C(&qword_2569069E8);
  sub_23842C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  v16 = sub_23842C9C0();
  v21 = 0;
  v22 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v17 = sub_23842C24C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDB6090], v1);
  result = sub_23842C300();
  *v20 = result;
  return result;
}

uint64_t ShortcutsRunScheduledQueryIntent.perform()(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Entity;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2[19] = a1;
  v2[20] = type metadata accessor for ScheduledQueryErrorView(0);
  v2[21] = swift_task_alloc();
  v2[22] = type metadata accessor for ScheduledQuerySnippetView();
  v2[23] = swift_task_alloc();
  v3 = sub_23842C24C();
  v2[24] = v3;
  v2[25] = *(_QWORD *)(v3 - 8);
  v2[26] = swift_task_alloc();
  v4 = sub_238409F1C(&qword_256907120);
  v2[27] = v4;
  v2[28] = *(_QWORD *)(v4 - 8);
  v2[29] = swift_task_alloc();
  v5 = sub_23842C3C0();
  v2[30] = v5;
  v2[31] = *(_QWORD *)(v5 - 8);
  v2[32] = swift_task_alloc();
  sub_238409F1C(&qword_2569069C0);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  sub_238409F1C(&qword_2569069D0);
  v2[35] = swift_task_alloc();
  v6 = sub_23842C4A4();
  v2[36] = v6;
  v2[37] = *(_QWORD *)(v6 - 8);
  v2[38] = swift_task_alloc();
  sub_238409F1C(&qword_2569070D8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  Entity = type metadata accessor for ScheduledQueryEntity();
  v2[41] = Entity;
  v2[42] = *(_QWORD *)(Entity - 8);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v8 = sub_23842C798();
  v2[47] = v8;
  v2[48] = *(_QWORD *)(v8 - 8);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v9 = swift_task_alloc();
  v10 = *v1;
  v2[52] = v9;
  v2[53] = v10;
  return swift_task_switch();
}

uint64_t sub_23842A264()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  _QWORD *v15;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_23842C774();
  swift_retain_n();
  v1 = sub_23842C78C();
  v2 = sub_23842CAA4();
  if (os_log_type_enabled(v1, v2))
  {
    v23 = *(_QWORD *)(v0 + 384);
    v24 = *(_QWORD *)(v0 + 376);
    v25 = *(_QWORD *)(v0 + 416);
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v26 = v4;
    *(_DWORD *)v3 = 136315138;
    swift_retain();
    sub_23842C2A0();
    swift_release();
    v5 = *(_QWORD *)(v0 + 88);
    if (v5)
      v6 = *(_QWORD *)(v0 + 80);
    else
      v6 = 7104878;
    if (v5)
      v7 = *(_QWORD *)(v0 + 88);
    else
      v7 = 0xE300000000000000;
    *(_QWORD *)(v0 + 144) = sub_23840E030(v6, v7, &v26);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_238407000, v1, v2, "Perform with query identifier = %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v4, -1, -1);
    MEMORY[0x23B8343E8](v3, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v8(v25, v24);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 416);
    v10 = *(_QWORD *)(v0 + 376);
    v11 = *(_QWORD *)(v0 + 384);
    swift_release_n();

    v8 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v8(v9, v10);
  }
  *(_QWORD *)(v0 + 432) = v8;
  swift_retain();
  sub_23842C2A0();
  swift_release();
  v13 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 440) = v13;
  *(_QWORD *)(v0 + 448) = v12;
  if (v12)
  {
    sub_238409F1C(&qword_256907548);
    inited = swift_initStackObject();
    *(_QWORD *)(v0 + 456) = inited;
    *(_OWORD *)(inited + 16) = xmmword_23842E160;
    *(_QWORD *)(inited + 32) = v13;
    *(_QWORD *)(inited + 40) = v12;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 464) = sub_238415280(inited);
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 472) = v15;
    *v15 = v0;
    v15[1] = sub_23842A6A0;
    return ScheduledQueryQuery.suggestedEntities()();
  }
  else
  {
    sub_23842C774();
    v17 = sub_23842C78C();
    v18 = sub_23842CA98();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_238407000, v17, v18, "Missing entity identifier = nil", v19, 2u);
      MEMORY[0x23B8343E8](v19, -1, -1);
    }
    v20 = *(_QWORD *)(v0 + 400);
    v21 = *(_QWORD *)(v0 + 376);

    v8(v20, v21);
    sub_23840DE38();
    swift_allocError();
    *(_OWORD *)v22 = xmmword_23842E170;
    *(_BYTE *)(v22 + 16) = 0;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23842A6A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 480) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v4 + 488) = a1;
  return swift_task_switch();
}

uint64_t sub_23842A71C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  void (*v27)(uint64_t, uint64_t);
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;

  v1 = sub_238415314(*(_QWORD *)(v0 + 488), *(_QWORD *)(v0 + 464));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  v2 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 336);
  v4 = *(_QWORD *)(v0 + 320);
  if (*(_QWORD *)(v1 + 16))
  {
    sub_23840E7C4(v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), *(_QWORD *)(v0 + 320));
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v5(v4, 0, 1, v2);
  }
  else
  {
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v5(*(_QWORD *)(v0 + 320), 1, 1, v2);
  }
  v6 = *(_QWORD *)(v0 + 328);
  v7 = *(_QWORD *)(v0 + 336);
  v8 = *(_QWORD *)(v0 + 320);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_23842B844(*(_QWORD *)(v0 + 320));
    sub_23842C774();
    swift_bridgeObjectRetain_n();
    v9 = sub_23842C78C();
    v10 = sub_23842CA8C();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 448);
    if (v11)
    {
      v13 = *(_QWORD *)(v0 + 440);
      v41 = *(_QWORD *)(v0 + 408);
      v43 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
      v40 = *(_QWORD *)(v0 + 376);
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v45 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 136) = sub_23840E030(v13, v12, &v45);
      sub_23842CAEC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_238407000, v9, v10, "Missing entity identifier = %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8343E8](v15, -1, -1);
      MEMORY[0x23B8343E8](v14, -1, -1);

      v43(v41, v40);
    }
    else
    {
      v27 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
      v28 = *(_QWORD *)(v0 + 408);
      v29 = *(_QWORD *)(v0 + 376);

      swift_bridgeObjectRelease_n();
      v27(v28, v29);
    }
    v30 = *(_QWORD *)(v0 + 440);
    v31 = *(_QWORD *)(v0 + 448);
    sub_23840DE38();
    swift_allocError();
    *(_QWORD *)v32 = v30;
    *(_QWORD *)(v32 + 8) = v31;
    *(_BYTE *)(v32 + 16) = 0;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 368);
    v42 = *(_QWORD *)(v0 + 360);
    v44 = *(_QWORD *)(v0 + 352);
    v17 = *(_QWORD *)(v0 + 320);
    v33 = *(_QWORD *)(v0 + 312);
    v18 = *(_QWORD *)(v0 + 288);
    v19 = *(_QWORD *)(v0 + 296);
    v20 = *(_QWORD *)(v0 + 280);
    v34 = *(_QWORD *)(v0 + 272);
    v35 = *(_QWORD *)(v0 + 328);
    v36 = *(_QWORD *)(v0 + 264);
    v37 = *(_QWORD *)(v0 + 248);
    v38 = *(_QWORD *)(v0 + 256);
    v39 = *(_QWORD *)(v0 + 240);
    v21 = *(_QWORD *)(v0 + 192);
    v22 = *(_QWORD *)(v0 + 200);
    swift_bridgeObjectRelease();
    sub_23840E780(v17, v16);
    sub_238409F1C(&qword_2569070E0);
    sub_23842C480();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v20, 1, 1, v18);
    v5(v33, 1, 1, v35);
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    v23(v34, 1, 1, v21);
    v23(v36, 1, 1, v21);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v38, *MEMORY[0x24BDB6090], v39);
    sub_23840E940((unint64_t *)&qword_256906A80, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQueryEntity, (uint64_t)&protocol conformance descriptor for ScheduledQueryEntity);
    v24 = sub_23842C2D0();
    *(_QWORD *)(v0 + 496) = v24;
    sub_23840E7C4(v16, v42);
    sub_23840E7C4(v42, v44);
    sub_23842C2AC();
    sub_23840E808(v42, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
    *(_QWORD *)(v0 + 128) = v24;
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 504) = v25;
    *v25 = v0;
    v25[1] = sub_23842ADD0;
    return RunScheduledQueryIntent.perform()(*(_QWORD *)(v0 + 232));
  }
}

uint64_t sub_23842AC8C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23842ADD0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 512) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23842AE34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v1 = v0[46];
  v2 = v0[37];
  v3 = v0[38];
  v4 = v0[36];
  v6 = v0[45];
  sub_23842C5A0();
  sub_23842C498();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_23842CA2C();
  sub_23840ED94(&qword_256907558, &qword_256907120, MEMORY[0x24BDB5E58]);
  sub_23842C27C();
  sub_23842CA2C();
  swift_bridgeObjectRelease();
  sub_23842C240();
  sub_23840E7C4(v1, v6);
  sub_23842CA74();
  v0[65] = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_23842AF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 184);
  swift_release();
  sub_23840E780(v1, v2);
  return swift_task_switch();
}

uint64_t sub_23842AFE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  sub_23840E940(&qword_256906A60, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView, (uint64_t)&protocol conformance descriptor for ScheduledQuerySnippetView);
  sub_23842C270();
  swift_release();
  sub_23840E808(v4, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5 = *(_QWORD *)(v0 + 368);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  sub_23840E808(v5, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23842B1A8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;

  v1 = (void *)v0[64];
  v2 = v0[46];
  v3 = v0[43];
  sub_23842C774();
  sub_23840E7C4(v2, v3);
  v4 = v1;
  v5 = v1;
  v6 = sub_23842C78C();
  v7 = sub_23842CA8C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (void *)v0[64];
    v27 = v0[49];
    v28 = (void (*)(uint64_t, uint64_t))v0[54];
    v26 = v0[47];
    v9 = v0[43];
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v29 = v25;
    *(_DWORD *)v10 = 136315394;
    v12 = *(_QWORD *)(v9 + 16);
    v13 = *(_QWORD *)(v9 + 24);
    swift_bridgeObjectRetain();
    v0[14] = sub_23840E030(v12, v13, &v29);
    sub_23842CAEC();
    swift_bridgeObjectRelease();
    sub_23840E808(v9, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
    *(_WORD *)(v10 + 12) = 2112;
    v14 = v8;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v15;
    sub_23842CAEC();
    *v11 = v15;

    _os_log_impl(&dword_238407000, v6, v7, "Failed to run scheduled query %s: %@", (uint8_t *)v10, 0x16u);
    sub_238409F1C(&qword_256906A50);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B8343E8](v25, -1, -1);
    MEMORY[0x23B8343E8](v10, -1, -1);

    v28(v27, v26);
  }
  else
  {
    v16 = (void *)v0[64];
    v17 = (void (*)(uint64_t, uint64_t))v0[54];
    v18 = v0[49];
    v19 = v0[47];
    sub_23840E808(v0[43], (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);

    v17(v18, v19);
  }
  v20 = (void *)v0[64];
  v22 = v0[45];
  v21 = v0[46];
  sub_23842C240();
  sub_23840E7C4(v21, v22);
  sub_23842CA74();
  v23 = v20;
  v0[66] = sub_23842CA68();
  sub_23842CA5C();
  return swift_task_switch();
}

uint64_t sub_23842B4A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[64];
  v2 = v0[45];
  v4 = v0[20];
  v3 = v0[21];
  swift_release();
  sub_23840E780(v2, v3);
  *(_QWORD *)(v3 + *(int *)(v4 + 20)) = v1;
  return swift_task_switch();
}

uint64_t sub_23842B50C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 168);
  sub_23840E940(&qword_256907550, type metadata accessor for ScheduledQueryErrorView, (uint64_t)&protocol conformance descriptor for ScheduledQueryErrorView);
  sub_23842C270();

  swift_release();
  sub_23840E808(v2, type metadata accessor for ScheduledQueryErrorView);
  v3 = *(_QWORD *)(v0 + 368);
  (*(void (**)(void))(*(_QWORD *)(v0 + 200) + 8))();
  sub_23840E808(v3, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledQueryEntity);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23842B6C0()
{
  uint64_t v1;

  sub_23842C2A0();
  return v1;
}

uint64_t sub_23842B6F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256906990 != -1)
    swift_once();
  v2 = sub_23842C4A4();
  v3 = sub_238409554(v2, (uint64_t)qword_256907508);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23842B788()
{
  swift_beginAccess();
  return byte_256907538;
}

uint64_t sub_23842B7C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23840DF78;
  return ShortcutsRunScheduledQueryIntent.perform()(a1);
}

uint64_t sub_23842B81C()
{
  sub_23842B888();
  return sub_23842C228();
}

uint64_t sub_23842B844(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_238409F1C(&qword_2569070D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23842B888()
{
  unint64_t result;

  result = qword_256907560;
  if (!qword_256907560)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ShortcutsRunScheduledQueryIntent, &type metadata for ShortcutsRunScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907560);
  }
  return result;
}

unint64_t sub_23842B8D0()
{
  unint64_t result;

  result = qword_256907568;
  if (!qword_256907568)
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ShortcutsRunScheduledQueryIntent, &type metadata for ShortcutsRunScheduledQueryIntent);
    atomic_store(result, (unint64_t *)&qword_256907568);
  }
  return result;
}

unint64_t sub_23842B918()
{
  unint64_t result;

  result = qword_256907570[0];
  if (!qword_256907570[0])
  {
    result = MEMORY[0x23B834364](&protocol conformance descriptor for ShortcutsRunScheduledQueryIntent, &type metadata for ShortcutsRunScheduledQueryIntent);
    atomic_store(result, qword_256907570);
  }
  return result;
}

uint64_t sub_23842B95C()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_23842B980()
{
  sub_23842B888();
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for ShortcutsRunScheduledQueryIntent()
{
  return &type metadata for ShortcutsRunScheduledQueryIntent;
}

uint64_t sub_23842B9D8()
{
  return sub_23840ED94(&qword_256906D30, &qword_256906D38, MEMORY[0x24BDB5E68]);
}

uint64_t sub_23842BA04()
{
  return sub_23840ED94(&qword_256906D40, &qword_256906D38, MEMORY[0x24BDB5E70]);
}

uint64_t sub_23842BA30()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23842BA3C(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 48))(a1, a2, Entity);
}

uint64_t sub_23842BA78()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23842BA84(uint64_t a1, uint64_t a2)
{
  uint64_t Entity;

  Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Entity - 8) + 56))(a1, a2, a2, Entity);
}

uint64_t type metadata accessor for ScheduledQueryEntityView()
{
  uint64_t result;

  result = qword_2569075D8;
  if (!qword_2569075D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23842BB00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23842BB18(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for AppIntentError(uint64_t a1)
{
  return sub_23842BB40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23842BB40(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s27ConditionalEngineAppIntents14AppIntentErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23842BB18(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AppIntentError(uint64_t a1, uint64_t a2)
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
  sub_23842BB18(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23842BB40(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for AppIntentError(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppIntentError(uint64_t a1, uint64_t a2)
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
  sub_23842BB40(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIntentError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIntentError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23842BCD8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_23842BCF0(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppIntentError()
{
  return &type metadata for AppIntentError;
}

void sub_23842BD1C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23842C9F0();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  __asm { BR              X10 }
}

uint64_t sub_23842BDE8()
{
  sub_23842C9E4();
  sub_23842C9D8();
  sub_23842C9CC();
  sub_23842C9D8();
  return sub_23842C48C();
}

void sub_23842BFEC()
{
  uint64_t v0;

  sub_23842BD1C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_23842BFF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23842C4A4();
  MEMORY[0x24BDAC7A8](v1);
  sub_23842BD1C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
  return sub_23842CA14();
}

uint64_t sub_23842C074()
{
  sub_23842C184();
  return sub_23842C504();
}

unint64_t sub_23842C0A0()
{
  unint64_t result;

  result = qword_256907610;
  if (!qword_256907610)
  {
    result = MEMORY[0x23B834364](&unk_23842E35C, &type metadata for AppIntentError);
    atomic_store(result, (unint64_t *)&qword_256907610);
  }
  return result;
}

unint64_t sub_23842C0E8()
{
  unint64_t result;

  result = qword_256907618;
  if (!qword_256907618)
  {
    result = MEMORY[0x23B834364](&unk_23842E39C, &type metadata for AppIntentError);
    atomic_store(result, (unint64_t *)&qword_256907618);
  }
  return result;
}

uint64_t sub_23842C12C()
{
  sub_23842C0A0();
  return sub_23842CB88();
}

uint64_t sub_23842C154()
{
  sub_23842C0A0();
  return sub_23842CB7C();
}

unint64_t sub_23842C184()
{
  unint64_t result;

  result = qword_256907620;
  if (!qword_256907620)
  {
    result = MEMORY[0x23B834364](&unk_23842E40C, &type metadata for AppIntentError);
    atomic_store(result, (unint64_t *)&qword_256907620);
  }
  return result;
}

uint64_t sub_23842C1C8()
{
  return MEMORY[0x24BDB4BD0]();
}

uint64_t sub_23842C1D4()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t sub_23842C1E0()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_23842C1EC()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_23842C1F8()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_23842C204()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_23842C210()
{
  return MEMORY[0x24BDB4E50]();
}

uint64_t sub_23842C21C()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_23842C228()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_23842C234()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t sub_23842C240()
{
  return MEMORY[0x24BDB5010]();
}

uint64_t sub_23842C24C()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_23842C258()
{
  return MEMORY[0x24BDB5038]();
}

uint64_t sub_23842C264()
{
  return MEMORY[0x24BDFBA70]();
}

uint64_t sub_23842C270()
{
  return MEMORY[0x24BDFBA78]();
}

uint64_t sub_23842C27C()
{
  return MEMORY[0x24BDB5188]();
}

uint64_t sub_23842C288()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_23842C294()
{
  return MEMORY[0x24BDB5458]();
}

uint64_t sub_23842C2A0()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_23842C2AC()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_23842C2B8()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_23842C2C4()
{
  return MEMORY[0x24BDB5490]();
}

uint64_t sub_23842C2D0()
{
  return MEMORY[0x24BDB5518]();
}

uint64_t sub_23842C2DC()
{
  return MEMORY[0x24BDB5560]();
}

uint64_t sub_23842C2E8()
{
  return MEMORY[0x24BDB5568]();
}

uint64_t sub_23842C2F4()
{
  return MEMORY[0x24BDB5570]();
}

uint64_t sub_23842C300()
{
  return MEMORY[0x24BDB5580]();
}

uint64_t sub_23842C30C()
{
  return MEMORY[0x24BDB5588]();
}

uint64_t sub_23842C318()
{
  return MEMORY[0x24BDB55A8]();
}

uint64_t sub_23842C324()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_23842C330()
{
  return MEMORY[0x24BDB5808]();
}

uint64_t sub_23842C33C()
{
  return MEMORY[0x24BDB5810]();
}

uint64_t sub_23842C348()
{
  return MEMORY[0x24BDB5D78]();
}

uint64_t sub_23842C354()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_23842C360()
{
  return MEMORY[0x24BDB5DC0]();
}

uint64_t sub_23842C36C()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_23842C378()
{
  return MEMORY[0x24BDB5DE0]();
}

uint64_t sub_23842C384()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_23842C390()
{
  return MEMORY[0x24BDB5EB0]();
}

uint64_t sub_23842C39C()
{
  return MEMORY[0x24BDB5EC8]();
}

uint64_t sub_23842C3A8()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t sub_23842C3B4()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t sub_23842C3C0()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_23842C3CC()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_23842C3D8()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_23842C3E4()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_23842C3F0()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t sub_23842C3FC()
{
  return MEMORY[0x24BDCB498]();
}

uint64_t sub_23842C408()
{
  return MEMORY[0x24BDCB568]();
}

uint64_t sub_23842C414()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_23842C420()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23842C42C()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_23842C438()
{
  return MEMORY[0x24BDCB9E8]();
}

uint64_t sub_23842C444()
{
  return MEMORY[0x24BDCBC58]();
}

uint64_t sub_23842C450()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23842C45C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_23842C468()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_23842C474()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_23842C480()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_23842C48C()
{
  return MEMORY[0x24BDCD348]();
}

uint64_t sub_23842C498()
{
  return MEMORY[0x24BDCD358]();
}

uint64_t sub_23842C4A4()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_23842C4B0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23842C4BC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23842C4C8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23842C4D4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23842C4E0()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_23842C4EC()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23842C4F8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23842C504()
{
  return MEMORY[0x24BE18E58]();
}

uint64_t sub_23842C510()
{
  return MEMORY[0x24BE18E68]();
}

uint64_t sub_23842C51C()
{
  return MEMORY[0x24BE18E70]();
}

uint64_t sub_23842C528()
{
  return MEMORY[0x24BE18E78]();
}

uint64_t sub_23842C534()
{
  return MEMORY[0x24BE18E80]();
}

uint64_t sub_23842C540()
{
  return MEMORY[0x24BE18E88]();
}

uint64_t sub_23842C54C()
{
  return MEMORY[0x24BE18E90]();
}

uint64_t sub_23842C558()
{
  return MEMORY[0x24BE18E98]();
}

uint64_t sub_23842C564()
{
  return MEMORY[0x24BE18EB8]();
}

uint64_t sub_23842C570()
{
  return MEMORY[0x24BE18EC0]();
}

uint64_t sub_23842C57C()
{
  return MEMORY[0x24BE18EC8]();
}

uint64_t sub_23842C588()
{
  return MEMORY[0x24BE18ED0]();
}

uint64_t sub_23842C594()
{
  return MEMORY[0x24BE18ED8]();
}

uint64_t sub_23842C5A0()
{
  return MEMORY[0x24BE18EE0]();
}

uint64_t sub_23842C5AC()
{
  return MEMORY[0x24BE18EF0]();
}

uint64_t sub_23842C5B8()
{
  return MEMORY[0x24BE18EF8]();
}

uint64_t sub_23842C5C4()
{
  return MEMORY[0x24BE18F10]();
}

uint64_t sub_23842C5D0()
{
  return MEMORY[0x24BE18F18]();
}

uint64_t sub_23842C5DC()
{
  return MEMORY[0x24BE18F20]();
}

uint64_t sub_23842C5E8()
{
  return MEMORY[0x24BE18F28]();
}

uint64_t sub_23842C5F4()
{
  return MEMORY[0x24BE18F30]();
}

uint64_t sub_23842C600()
{
  return MEMORY[0x24BE18F38]();
}

uint64_t sub_23842C60C()
{
  return MEMORY[0x24BE18F48]();
}

uint64_t sub_23842C618()
{
  return MEMORY[0x24BE18F50]();
}

uint64_t sub_23842C624()
{
  return MEMORY[0x24BE18F60]();
}

uint64_t sub_23842C630()
{
  return MEMORY[0x24BE18F70]();
}

uint64_t sub_23842C63C()
{
  return MEMORY[0x24BE18F80]();
}

uint64_t sub_23842C648()
{
  return MEMORY[0x24BE18F90]();
}

uint64_t sub_23842C654()
{
  return MEMORY[0x24BE18FA0]();
}

uint64_t sub_23842C660()
{
  return MEMORY[0x24BE18FB0]();
}

uint64_t sub_23842C66C()
{
  return MEMORY[0x24BE18FC0]();
}

uint64_t sub_23842C678()
{
  return MEMORY[0x24BE18FD0]();
}

uint64_t sub_23842C684()
{
  return MEMORY[0x24BE18FD8]();
}

uint64_t sub_23842C690()
{
  return MEMORY[0x24BE18FE0]();
}

uint64_t sub_23842C69C()
{
  return MEMORY[0x24BE18FE8]();
}

uint64_t sub_23842C6A8()
{
  return MEMORY[0x24BE18FF0]();
}

uint64_t sub_23842C6B4()
{
  return MEMORY[0x24BE18FF8]();
}

uint64_t sub_23842C6C0()
{
  return MEMORY[0x24BE19008]();
}

uint64_t sub_23842C6CC()
{
  return MEMORY[0x24BE19010]();
}

uint64_t sub_23842C6D8()
{
  return MEMORY[0x24BE19018]();
}

uint64_t sub_23842C6E4()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_23842C6F0()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_23842C6FC()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23842C708()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_23842C714()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_23842C720()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23842C72C()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_23842C738()
{
  return MEMORY[0x24BEE7840]();
}

uint64_t sub_23842C744()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_23842C750()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_23842C75C()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_23842C768()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_23842C774()
{
  return MEMORY[0x24BE19028]();
}

uint64_t sub_23842C780()
{
  return MEMORY[0x24BE19030]();
}

uint64_t sub_23842C78C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23842C798()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23842C7A4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23842C7B0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23842C7BC()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23842C7C8()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_23842C7D4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23842C7E0()
{
  return MEMORY[0x24BDEE9F8]();
}

uint64_t sub_23842C7EC()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_23842C7F8()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_23842C804()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_23842C810()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_23842C81C()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_23842C828()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23842C834()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_23842C840()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23842C84C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23842C858()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23842C864()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23842C870()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23842C87C()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23842C888()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_23842C894()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_23842C8A0()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_23842C8AC()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_23842C8B8()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_23842C8C4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23842C8D0()
{
  return MEMORY[0x24BDF1ED0]();
}

uint64_t sub_23842C8DC()
{
  return MEMORY[0x24BDF1ED8]();
}

uint64_t sub_23842C8E8()
{
  return MEMORY[0x24BDF1EE8]();
}

uint64_t sub_23842C8F4()
{
  return MEMORY[0x24BDF1FB0]();
}

uint64_t sub_23842C900()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23842C90C()
{
  return MEMORY[0x24BDF1FE0]();
}

uint64_t sub_23842C918()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23842C924()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23842C930()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23842C93C()
{
  return MEMORY[0x24BDF2570]();
}

uint64_t sub_23842C948()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23842C954()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_23842C960()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_23842C96C()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23842C978()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23842C984()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23842C990()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_23842C99C()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23842C9A8()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23842C9B4()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23842C9C0()
{
  return MEMORY[0x24BDB6620]();
}

uint64_t sub_23842C9CC()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_23842C9D8()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_23842C9E4()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_23842C9F0()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_23842C9FC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23842CA08()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23842CA14()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_23842CA20()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23842CA2C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23842CA38()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23842CA44()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23842CA50()
{
  return MEMORY[0x24BDB6650]();
}

uint64_t sub_23842CA5C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23842CA68()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23842CA74()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23842CA80()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23842CA8C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23842CA98()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23842CAA4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23842CAB0()
{
  return MEMORY[0x24BE19038]();
}

uint64_t sub_23842CABC()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23842CAC8()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23842CAD4()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_23842CAE0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23842CAEC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23842CAF8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23842CB04()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23842CB10()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23842CB1C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23842CB28()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23842CB34()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23842CB40()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23842CB4C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23842CB58()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23842CB64()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23842CB70()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23842CB7C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_23842CB88()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_23842CB94()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23842CBA0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23842CBAC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23842CBB8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23842CBC4()
{
  return MEMORY[0x24BEE4328]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

