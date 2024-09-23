uint64_t PregnancyStripedLinearGaugeStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_230288750();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  KeyPath = swift_getKeyPath();
  v9 = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  v10 = type metadata accessor for PregnancyStripedLinearGauge();
  v11 = a2 + *(int *)(v10 + 20);
  *(_QWORD *)v11 = KeyPath;
  *(_BYTE *)(v11 + 8) = 0;
  v12 = a2 + *(int *)(v10 + 24);
  *(_QWORD *)v12 = v9;
  *(_BYTE *)(v12 + 8) = 0;
  v15 = 0x4014000000000000;
  sub_230284510();
  sub_230288624();
  v15 = 0x4000000000000000;
  return sub_230288624();
}

uint64_t sub_230282FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_230288750();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  KeyPath = swift_getKeyPath();
  v9 = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  v10 = type metadata accessor for PregnancyStripedLinearGauge();
  v11 = a2 + *(int *)(v10 + 20);
  *(_QWORD *)v11 = KeyPath;
  *(_BYTE *)(v11 + 8) = 0;
  v12 = a2 + *(int *)(v10 + 24);
  *(_QWORD *)v12 = v9;
  *(_BYTE *)(v12 + 8) = 0;
  v15 = 0x4014000000000000;
  sub_230284510();
  sub_230288624();
  v15 = 0x4000000000000000;
  return sub_230288624();
}

void sub_23028312C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = sub_230288810();
  a3[1] = v6;
  sub_230285880();
  sub_23028317C(a1, a2, (uint64_t)a3 + *(int *)(v7 + 44));
}

void sub_23028317C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t ObjCClassFromMetadata;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  __int128 v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
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
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v88 = a2;
  v86 = a1;
  v79 = a3;
  sub_230285384();
  v83 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = (uint64_t)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230285418(0, &qword_255E55630, v5);
  v85 = v6;
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v80 = (uint64_t)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v84 = (uint64_t)&v76 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v89 = (uint64_t)&v76 - v11;
  sub_2302852CC();
  v13 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2302887F8();
  v17 = MEMORY[0x24BDF48E8];
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v76 - v21;
  sub_230285270();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v76 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v76 - v27;
  v29 = *MEMORY[0x24BDEEB68];
  v30 = sub_230288714();
  v31 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104);
  v31(v22, v29, v30);
  sub_2302858FC((uint64_t)v22, (uint64_t)v15, (uint64_t (*)(_QWORD))v17);
  *(_WORD *)&v15[*(int *)(v13 + 36)] = 256;
  sub_2302858FC((uint64_t)v15, (uint64_t)v26, (uint64_t (*)(_QWORD))sub_2302852CC);
  sub_230285940((uint64_t)v15, (uint64_t (*)(_QWORD))sub_2302852CC);
  sub_230285940((uint64_t)v22, (uint64_t (*)(_QWORD))v17);
  v78 = v26;
  v87 = v28;
  sub_23028597C((uint64_t)v26, (uint64_t)v28, (uint64_t (*)(_QWORD))sub_230285270);
  v31(v20, v29, v30);
  sub_230285DB0(0, (unint64_t *)&qword_255E556C0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v33 = (void *)objc_opt_self();
  v82 = ObjCClassFromMetadata;
  v34 = objc_msgSend(v33, sel_bundleForClass_, ObjCClassFromMetadata);
  v35 = (void *)sub_23028884C();
  v36 = (void *)objc_opt_self();
  v37 = objc_msgSend(v36, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v35, v34, 0);

  if (v37)
  {
    v38 = MEMORY[0x2348B56C0](v37);
    v39 = MEMORY[0x24BDF48E8];
    v40 = v81;
    sub_2302858FC((uint64_t)v20, v81, (uint64_t (*)(_QWORD))MEMORY[0x24BDF48E8]);
    v41 = v83;
    *(_QWORD *)(v40 + *(int *)(v83 + 52)) = v38;
    *(_WORD *)(v40 + *(int *)(v41 + 56)) = 256;
    sub_230285940((uint64_t)v20, (uint64_t (*)(_QWORD))v39);
    sub_230288660();
    v42 = type metadata accessor for PregnancyStripedLinearGauge();
    v43 = v88;
    v44 = v88 + *(int *)(v42 + 20);
    v45 = *(_QWORD *)v44;
    LOBYTE(v38) = *(_BYTE *)(v44 + 8);
    sub_23028486C(*(_QWORD *)v44, v38);
    sub_2302859C0(v45, v38);
    sub_230284990(v45, v38);
    sub_230284884();
    sub_230288630();
    sub_230288810();
    sub_230288648();
    v46 = v84;
    sub_2302858FC(v40, v84, (uint64_t (*)(_QWORD))sub_230285384);
    v47 = (_OWORD *)(v46 + *(int *)(v85 + 36));
    v48 = v91;
    *v47 = v90;
    v47[1] = v48;
    v47[2] = v92;
    sub_230285940(v40, (uint64_t (*)(_QWORD))sub_230285384);
    sub_230285B54(v46, v89);
    v49 = v43 + *(int *)(v42 + 24);
    v50 = *(id *)v49;
    LOBYTE(v46) = *(_BYTE *)(v49 + 8);
    sub_230284878(*(id *)v49, v46);
    v51 = sub_230285BB0(v50, v46);
    sub_23028499C(v50, v46);
    v85 = MEMORY[0x2348B56C0](v51);
    sub_230288630();
    sub_23028860C();
    v52 = v93;
    v53 = v94;
    v54 = v95;
    v84 = v96;
    v55 = v97;
    v83 = sub_230288804();
    v81 = v56;
    v57 = objc_msgSend(v33, sel_bundleForClass_, v82);
    v58 = (void *)sub_23028884C();
    v59 = objc_msgSend(v36, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v58, v57, 0);

    if (v59)
    {
      v60 = MEMORY[0x2348B56C0](v59);
      v82 = sub_230288804();
      v77 = v61;
      sub_230288660();
      v63 = v62;
      sub_230288744();
      v65 = v63 * v64;
      v66 = (uint64_t)v78;
      sub_2302858FC((uint64_t)v87, (uint64_t)v78, (uint64_t (*)(_QWORD))sub_230285270);
      v67 = MEMORY[0x24BDEBEF8];
      v68 = v89;
      v69 = v80;
      sub_230285830(v89, v80, (uint64_t)&qword_255E55630, (uint64_t)sub_230285384, MEMORY[0x24BDEBEF8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_230285418);
      v70 = v79;
      sub_2302858FC(v66, v79, (uint64_t (*)(_QWORD))sub_230285270);
      sub_2302851BC();
      v72 = v71;
      sub_230285830(v69, v70 + *(int *)(v71 + 48), (uint64_t)&qword_255E55630, (uint64_t)sub_230285384, v67, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_230285418);
      v73 = v70 + *(int *)(v72 + 64);
      *(_QWORD *)v73 = v60;
      *(_WORD *)(v73 + 8) = 256;
      *(_QWORD *)(v73 + 16) = v52;
      *(_QWORD *)(v73 + 24) = v53;
      *(_QWORD *)(v73 + 32) = v54;
      *(_QWORD *)(v73 + 40) = v84;
      *(_QWORD *)(v73 + 48) = v55;
      *(_QWORD *)(v73 + 56) = v85;
      *(_WORD *)(v73 + 64) = 256;
      v74 = v81;
      *(_QWORD *)(v73 + 72) = v83;
      *(_QWORD *)(v73 + 80) = v74;
      v75 = v77;
      *(_QWORD *)(v73 + 88) = v82;
      *(_QWORD *)(v73 + 96) = v75;
      *(double *)(v73 + 104) = v65;
      *(_QWORD *)(v73 + 112) = 0;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_230285D74(v68, (uint64_t)&qword_255E55630, (uint64_t)sub_230285384, v67, (uint64_t (*)(_QWORD))sub_230285418);
      sub_230285940((uint64_t)v87, (uint64_t (*)(_QWORD))sub_230285270);
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      sub_230285D74(v69, (uint64_t)&qword_255E55630, (uint64_t)sub_230285384, v67, (uint64_t (*)(_QWORD))sub_230285418);
      sub_230285940(v66, (uint64_t (*)(_QWORD))sub_230285270);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_23028396C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_2302886FC();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  sub_2302857B4();
  return sub_2302839B4((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_2302839B4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v24;
  uint64_t v25;

  sub_23028575C(0, &qword_255E55690, MEMORY[0x24BDF0168], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v5;
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - v6;
  v8 = sub_23028872C();
  v25 = *(_QWORD *)(v8 - 8);
  v9 = v25;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - v13;
  sub_230288738();
  sub_230288720();
  v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  v16 = (uint64_t)v5;
  v17 = MEMORY[0x24BDF0168];
  v18 = MEMORY[0x24BEE1C68];
  sub_230285830((uint64_t)v7, v16, (uint64_t)&qword_255E55690, MEMORY[0x24BDF0168], (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_23028575C);
  v15(a1, v12, v8);
  sub_2302856D8();
  v20 = (uint64_t)&a1[*(int *)(v19 + 48)];
  v21 = (uint64_t)v24;
  sub_230285830((uint64_t)v24, v20, (uint64_t)&qword_255E55690, v17, (uint64_t)v18, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_23028575C);
  sub_230285D74((uint64_t)v7, (uint64_t)&qword_255E55690, v17, (uint64_t)v18, (uint64_t (*)(_QWORD))sub_23028575C);
  v22 = *(void (**)(char *, uint64_t))(v25 + 8);
  v22(v14, v8);
  sub_230285D74(v21, (uint64_t)&qword_255E55690, v17, (uint64_t)v18, (uint64_t (*)(_QWORD))sub_23028575C);
  return ((uint64_t (*)(char *, uint64_t))v22)(v12, v8);
}

uint64_t sub_230283BBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE v8[16];
  uint64_t v9;
  void (*v10)(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v11;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v4 = &v8[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2302858FC(v1, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PregnancyStripedLinearGauge);
  v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  sub_23028597C((uint64_t)v4, v6 + v5, (uint64_t (*)(_QWORD))type metadata accessor for PregnancyStripedLinearGauge);
  v10 = sub_230285058;
  v11 = v6;
  v9 = v1;
  sub_2302850AC();
  sub_230285640();
  sub_230285344(&qword_255E556A0, (uint64_t (*)(uint64_t))sub_2302850AC, MEMORY[0x24BDEC6F8]);
  sub_230285344(&qword_255E556A8, (uint64_t (*)(uint64_t))sub_230285640, MEMORY[0x24BDF4498]);
  sub_2302887B0();
  return swift_release();
}

void sub_230283D08(uint64_t a1, double a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  unsigned __int8 v18;
  _OWORD v19[2];
  unsigned __int8 v20;
  _BYTE v21[48];

  v15 = a1;
  v14 = sub_2302886A8();
  v13 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~*(_QWORD *)&a2 & 0x7FF0000000000000) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v5 = (uint64_t)a2 + 3;
  if (!__OFADD__((uint64_t)a2, 3))
  {
    if (v5 < 0)
      goto LABEL_17;
    if ((uint64_t)a2 == -3)
      return;
    sub_230285DB0(0, (unint64_t *)&qword_255E556C0);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v7 = (void *)objc_opt_self();
    v8 = (void *)objc_opt_self();
    v9 = 0;
    while (v5 != v9)
    {
      sub_230288780();
      sub_230288768();
      sub_230288774();
      v19[0] = v16;
      v19[1] = v17;
      v20 = v18;
      sub_230286434((uint64_t)v19, (uint64_t)v21);
      sub_230286488((uint64_t)v21, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_230286470);
      v10 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
      v11 = (void *)sub_23028884C();
      v12 = objc_msgSend(v8, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v11, v10, 0);

      if (!v12)
        goto LABEL_18;
      ++v9;
      MEMORY[0x2348B56C0](v12);
      sub_23028869C();
      swift_release();
      sub_230288690();
      sub_230286488((uint64_t)v19, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2302864C0);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v14);
      sub_2302864C0(v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18);
      if (v5 == v9)
        return;
    }
    __break(1u);
    goto LABEL_13;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
}

uint64_t sub_230283FC8()
{
  return sub_2302887A4();
}

uint64_t sub_230283FE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v0 = sub_230288708();
  MEMORY[0x24BDAC7A8](v0);
  (*(void (**)(char *, _QWORD))(v2 + 104))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDEE8B0]);
  return sub_2302887C8();
}

void sub_230284070()
{
  qword_255E55518 = 0;
}

double static PregnancyStripedFillProgressKey.defaultValue.getter()
{
  if (qword_255E55510 != -1)
    swift_once();
  return *(double *)&qword_255E55518;
}

double sub_2302840BC@<D0>(_QWORD *a1@<X8>)
{
  double result;

  if (qword_255E55510 != -1)
    swift_once();
  result = *(double *)&qword_255E55518;
  *a1 = qword_255E55518;
  return result;
}

uint64_t sub_23028410C()
{
  sub_230286330();
  return sub_230288678();
}

double EnvironmentValues.pregnancyStripedFillProgress.getter()
{
  double v1;

  sub_230284554();
  sub_2302886E4();
  return v1;
}

double sub_230284194@<D0>(double *a1@<X8>)
{
  double result;
  double v3;

  sub_230284554();
  sub_2302886E4();
  result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2302841E0()
{
  sub_230284554();
  return sub_2302886F0();
}

uint64_t EnvironmentValues.pregnancyStripedFillProgress.setter()
{
  sub_230284554();
  return sub_2302886F0();
}

uint64_t (*EnvironmentValues.pregnancyStripedFillProgress.modify(uint64_t a1))(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_230284554();
  sub_2302886E4();
  return sub_2302842AC;
}

uint64_t sub_2302842AC(_QWORD *a1)
{
  a1[1] = *a1;
  return sub_2302886F0();
}

id sub_2302842E0()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  qword_255E55528 = (uint64_t)result;
  return result;
}

id static PregnancyStripedIndicatorStrokeColorKey.defaultValue.getter()
{
  if (qword_255E55520 != -1)
    swift_once();
  return (id)qword_255E55528;
}

id sub_230284358@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_255E55520 != -1)
    swift_once();
  v2 = (void *)qword_255E55528;
  *a1 = qword_255E55528;
  return v2;
}

uint64_t sub_2302843A8()
{
  sub_2302862D8();
  return sub_230288678();
}

uint64_t EnvironmentValues.pregnancyGaugeIndicatorStrokeColor.getter()
{
  uint64_t v1;

  sub_230284598();
  sub_2302886E4();
  return v1;
}

uint64_t sub_230284430@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_230284598();
  result = sub_2302886E4();
  *a1 = v3;
  return result;
}

uint64_t sub_23028447C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  sub_230284598();
  v2 = v1;
  return sub_2302886F0();
}

uint64_t type metadata accessor for PregnancyStripedLinearGauge()
{
  uint64_t result;

  result = qword_255E555B0;
  if (!qword_255E555B0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_230284510()
{
  unint64_t result;

  result = qword_255E55530;
  if (!qword_255E55530)
  {
    result = MEMORY[0x2348B5ABC](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_255E55530);
  }
  return result;
}

unint64_t sub_230284554()
{
  unint64_t result;

  result = qword_255E55538;
  if (!qword_255E55538)
  {
    result = MEMORY[0x2348B5ABC](&protocol conformance descriptor for PregnancyStripedFillProgressKey, &type metadata for PregnancyStripedFillProgressKey);
    atomic_store(result, (unint64_t *)&qword_255E55538);
  }
  return result;
}

unint64_t sub_230284598()
{
  unint64_t result;

  result = qword_255E55540;
  if (!qword_255E55540)
  {
    result = MEMORY[0x2348B5ABC](&protocol conformance descriptor for PregnancyStripedIndicatorStrokeColorKey, &type metadata for PregnancyStripedIndicatorStrokeColorKey);
    atomic_store(result, (unint64_t *)&qword_255E55540);
  }
  return result;
}

uint64_t EnvironmentValues.pregnancyGaugeIndicatorStrokeColor.setter()
{
  sub_230284598();
  return sub_2302886F0();
}

void (*EnvironmentValues.pregnancyGaugeIndicatorStrokeColor.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_230284598();
  sub_2302886E4();
  return sub_230284660;
}

void sub_230284660(uint64_t a1, char a2)
{
  id v2;
  id v4;

  v2 = *(id *)a1;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)a1;
  if ((a2 & 1) != 0)
  {
    v4 = v2;
    sub_2302886F0();

  }
  else
  {
    sub_2302886F0();
  }
}

uint64_t sub_2302846E0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for PregnancyStripedLinearGaugeStyle()
{
  return &type metadata for PregnancyStripedLinearGaugeStyle;
}

ValueMetadata *type metadata accessor for PregnancyStripedFillProgressKey()
{
  return &type metadata for PregnancyStripedFillProgressKey;
}

ValueMetadata *type metadata accessor for PregnancyStripedIndicatorStrokeColorKey()
{
  return &type metadata for PregnancyStripedIndicatorStrokeColorKey;
}

uint64_t sub_230284720()
{
  return sub_230285344(&qword_255E55548, (uint64_t (*)(uint64_t))type metadata accessor for PregnancyStripedLinearGauge, (uint64_t)&unk_230289348);
}

char *sub_23028474C(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_230288750();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = *(_QWORD *)v10;
    v12 = v10[8];
    sub_23028486C(*(_QWORD *)v10, v12);
    *(_QWORD *)v9 = v11;
    v9[8] = v12;
    v13 = a3[6];
    v14 = &a1[v13];
    v15 = &a2[v13];
    v16 = *(id *)v15;
    v17 = v15[8];
    sub_230284878(*(id *)v15, v17);
    *(_QWORD *)v14 = v16;
    v14[8] = v17;
    v18 = a3[7];
    v19 = &a1[v18];
    v20 = &a2[v18];
    sub_230284884();
    v22 = v21;
    v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
    v23(v19, v20, v21);
    v23(&a1[a3[8]], &a2[a3[8]], v22);
  }
  return a1;
}

uint64_t sub_23028486C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

id sub_230284878(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

void sub_230284884()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55550)
  {
    sub_230284510();
    v0 = sub_23028863C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55550);
  }
}

uint64_t sub_2302848DC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v9)(uint64_t, uint64_t);

  v4 = sub_230288750();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_230284990(*(_QWORD *)(a1 + a2[5]), *(_BYTE *)(a1 + a2[5] + 8));
  sub_23028499C(*(id *)(a1 + a2[6]), *(_BYTE *)(a1 + a2[6] + 8));
  v5 = a1 + a2[7];
  sub_230284884();
  v7 = v6;
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v9(v5, v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(a1 + a2[8], v7);
}

uint64_t sub_230284990(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

void sub_23028499C(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_2302849A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);

  v6 = sub_230288750();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *(_BYTE *)(v9 + 8);
  sub_23028486C(*(_QWORD *)v9, v11);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = v11;
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(id *)v14;
  v16 = *(_BYTE *)(v14 + 8);
  sub_230284878(*(id *)v14, v16);
  *(_QWORD *)v13 = v15;
  *(_BYTE *)(v13 + 8) = v16;
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = a2 + v17;
  sub_230284884();
  v21 = v20;
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  v22(v18, v19, v20);
  v22(a1 + a3[8], a2 + a3[8], v21);
  return a1;
}

uint64_t sub_230284A9C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);

  v6 = sub_230288750();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *(_BYTE *)(v9 + 8);
  sub_23028486C(*(_QWORD *)v9, v11);
  v12 = *(_QWORD *)v8;
  v13 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = v11;
  sub_230284990(v12, v13);
  v14 = a3[6];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = *(id *)v16;
  v18 = *(_BYTE *)(v16 + 8);
  sub_230284878(*(id *)v16, v18);
  v19 = *(void **)v15;
  v20 = *(_BYTE *)(v15 + 8);
  *(_QWORD *)v15 = v17;
  *(_BYTE *)(v15 + 8) = v18;
  sub_23028499C(v19, v20);
  v21 = a3[7];
  v22 = a1 + v21;
  v23 = a2 + v21;
  sub_230284884();
  v25 = v24;
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24);
  v26(v22, v23, v24);
  v26(a1 + a3[8], a2 + a3[8], v25);
  return a1;
}

uint64_t sub_230284BA8(uint64_t a1, uint64_t a2, int *a3)
{
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
  void (*v18)(uint64_t, uint64_t, uint64_t);

  v6 = sub_230288750();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  v11 = a1 + v8;
  v12 = a2 + v8;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_BYTE *)(v11 + 8) = *(_BYTE *)(v12 + 8);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  sub_230284884();
  v17 = v16;
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
  v18(v14, v15, v16);
  v18(a1 + a3[8], a2 + a3[8], v17);
  return a1;
}

uint64_t sub_230284C80(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);

  v6 = sub_230288750();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  LOBYTE(v9) = *((_BYTE *)v9 + 8);
  v11 = *(_QWORD *)v8;
  v12 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = (_BYTE)v9;
  sub_230284990(v11, v12);
  v13 = a3[6];
  v14 = a1 + v13;
  v15 = (uint64_t *)(a2 + v13);
  v16 = *v15;
  LOBYTE(v15) = *((_BYTE *)v15 + 8);
  v17 = *(void **)v14;
  v18 = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v14 = v16;
  *(_BYTE *)(v14 + 8) = (_BYTE)v15;
  sub_23028499C(v17, v18);
  v19 = a3[7];
  v20 = a1 + v19;
  v21 = a2 + v19;
  sub_230284884();
  v23 = v22;
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40);
  v24(v20, v21, v22);
  v24(a1 + a3[8], a2 + a3[8], v23);
  return a1;
}

uint64_t sub_230284D74()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_230284D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;

  v6 = sub_230288750();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 254)
  {
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 > 1)
      return (v9 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    sub_230284884();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v10);
  }
}

uint64_t sub_230284E24()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_230284E30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = sub_230288750();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
      return result;
    }
    sub_230284884();
    v10 = v13;
    v14 = *(_QWORD *)(v13 - 8);
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_230284ED4()
{
  unint64_t v0;
  unint64_t v1;

  sub_230288750();
  if (v0 <= 0x3F)
  {
    sub_230284884();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_230284F64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_230284F74()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for PregnancyStripedLinearGauge();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_230288750();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_230284990(*(_QWORD *)(v3 + v1[5]), *(_BYTE *)(v3 + v1[5] + 8));
  sub_23028499C(*(id *)(v3 + v1[6]), *(_BYTE *)(v3 + v1[6] + 8));
  v5 = v3 + v1[7];
  sub_230284884();
  v7 = v6;
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v8(v5, v6);
  v8(v3 + v1[8], v7);
  return swift_deallocObject();
}

void sub_230285058(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PregnancyStripedLinearGauge() - 8) + 80);
  sub_23028312C(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_2302850A4@<X0>(uint64_t a1@<X8>)
{
  return sub_23028396C(a1);
}

void sub_2302850AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E555F8)
  {
    sub_230285124();
    sub_230285344(&qword_255E55670, (uint64_t (*)(uint64_t))sub_230285124, MEMORY[0x24BDF4750]);
    v0 = sub_230288684();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E555F8);
  }
}

void sub_230285124()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55600)
  {
    sub_23028575C(255, &qword_255E55608, (uint64_t (*)(uint64_t))sub_2302851BC, MEMORY[0x24BDF53F0]);
    sub_2302855F8(&qword_255E55668, &qword_255E55608, (uint64_t (*)(uint64_t))sub_2302851BC);
    v0 = sub_2302887EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55600);
  }
}

void sub_2302851BC()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_255E55610)
  {
    sub_230285270();
    sub_230285418(255, &qword_255E55630, (void (*)(uint64_t))sub_230285384);
    sub_230285418(255, &qword_255E55640, (void (*)(uint64_t))sub_230285474);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_255E55610);
  }
}

void sub_230285270()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55618)
  {
    sub_2302852CC();
    v0 = sub_2302886B4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55618);
  }
}

void sub_2302852CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55620)
  {
    sub_2302887F8();
    sub_230285344(&qword_255E55628, (uint64_t (*)(uint64_t))MEMORY[0x24BDF48E8], MEMORY[0x24BDF48D8]);
    v0 = sub_230288618();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55620);
  }
}

uint64_t sub_230285344(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348B5ABC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_230285384()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55638)
  {
    sub_2302887F8();
    sub_230285344(&qword_255E55628, (uint64_t (*)(uint64_t))MEMORY[0x24BDF48E8], MEMORY[0x24BDF48D8]);
    v0 = sub_230288600();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55638);
  }
}

void sub_230285418(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2302886B4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_230285474()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55648)
  {
    sub_230285528();
    sub_2302855B4();
    sub_230285344(&qword_255E55660, (uint64_t (*)(uint64_t))sub_230285528, MEMORY[0x24BDED500]);
    v0 = sub_230288654();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55648);
  }
}

void sub_230285528()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55650)
  {
    sub_2302855B4();
    v0 = sub_2302886C0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55650);
  }
}

unint64_t sub_2302855B4()
{
  unint64_t result;

  result = qword_255E55658;
  if (!qword_255E55658)
  {
    result = MEMORY[0x2348B5ABC](MEMORY[0x24BDF4440], MEMORY[0x24BDF4458]);
    atomic_store(result, (unint64_t *)&qword_255E55658);
  }
  return result;
}

uint64_t sub_2302855F8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_23028575C(255, a2, a3, MEMORY[0x24BDF53F0]);
    result = MEMORY[0x2348B5ABC](MEMORY[0x24BDF5428], v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_230285640()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55678)
  {
    sub_23028575C(255, &qword_255E55680, (uint64_t (*)(uint64_t))sub_2302856D8, MEMORY[0x24BDF53F0]);
    sub_2302855F8(&qword_255E55698, &qword_255E55680, (uint64_t (*)(uint64_t))sub_2302856D8);
    v0 = sub_2302887E0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55678);
  }
}

void sub_2302856D8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255E55688)
  {
    sub_23028872C();
    sub_23028575C(255, &qword_255E55690, MEMORY[0x24BDF0168], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255E55688);
  }
}

void sub_23028575C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_2302857B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E556B0)
  {
    sub_23028575C(255, &qword_255E55680, (uint64_t (*)(uint64_t))sub_2302856D8, MEMORY[0x24BDF53F0]);
    v0 = sub_23028866C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E556B0);
  }
}

uint64_t sub_230285830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;

  v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

void sub_230285880()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E556B8)
  {
    sub_23028575C(255, &qword_255E55608, (uint64_t (*)(uint64_t))sub_2302851BC, MEMORY[0x24BDF53F0]);
    v0 = sub_23028866C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E556B8);
  }
}

uint64_t sub_2302858FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_230285940(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23028597C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_2302859C0(uint64_t a1, char a2)
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
  double v14;

  v4 = sub_2302886D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_230288864();
  v9 = sub_23028875C();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v14 = *(double *)&v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_230285DE8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_23027F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348B5B10](v11, -1, -1);
    MEMORY[0x2348B5B10](v10, -1, -1);
  }

  sub_2302886CC();
  swift_getAtKeyPath();
  sub_230284990(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_230285B54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_230285418(0, &qword_255E55630, (void (*)(uint64_t))sub_230285384);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_230285BB0(void *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  uint64_t v16;

  v15 = a1;
  v3 = sub_2302886D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return v15;
  swift_retain();
  v7 = sub_230288864();
  v8 = sub_23028875C();
  v9 = v7;
  if (os_log_type_enabled(v8, v7))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    sub_230285DB0(0, &qword_255E556C8);
    v12 = sub_2302888F4();
    *(_QWORD *)(v10 + 4) = sub_230285DE8(v12, v13, &v16);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23027F000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348B5B10](v11, -1, -1);
    MEMORY[0x2348B5B10](v10, -1, -1);
  }

  sub_2302886CC();
  swift_getAtKeyPath();
  sub_23028499C(v15, 0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (id)v16;
}

uint64_t sub_230285D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v6;

  v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_230285DB0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_230285DE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_230285EB8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_230285FD4((uint64_t)v12, *a3);
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
      sub_230285FD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_230285EB8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_230286010(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_2302888B8();
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

uint64_t sub_230285FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_230286010(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2302860A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23028619C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23028619C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2302860A4(uint64_t a1, unint64_t a2)
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
      v3 = sub_23028613C(v2, 0);
      result = sub_2302888AC();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_230288858();
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

_QWORD *sub_23028613C(uint64_t a1, uint64_t a2)
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
  sub_230286280();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23028619C(char *result, int64_t a2, char a3, char *a4)
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
    sub_230286280();
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

void sub_230286280()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E556D0)
  {
    v0 = sub_2302888C4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E556D0);
  }
}

unint64_t sub_2302862D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E556D8;
  if (!qword_255E556D8)
  {
    v1 = sub_230285DB0(255, &qword_255E556C8);
    result = MEMORY[0x2348B5ABC](MEMORY[0x24BEE5BE0], v1);
    atomic_store(result, (unint64_t *)&qword_255E556D8);
  }
  return result;
}

unint64_t sub_230286330()
{
  unint64_t result;

  result = qword_255E556E0;
  if (!qword_255E556E0)
  {
    result = MEMORY[0x2348B5ABC](MEMORY[0x24BEE50E0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255E556E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for GaugeStripedBackground()
{
  return &type metadata for GaugeStripedBackground;
}

uint64_t sub_230286384()
{
  sub_2302850AC();
  sub_230285640();
  sub_230285344(&qword_255E556A0, (uint64_t (*)(uint64_t))sub_2302850AC, MEMORY[0x24BDEC6F8]);
  sub_230285344(&qword_255E556A8, (uint64_t (*)(uint64_t))sub_230285640, MEMORY[0x24BDF4498]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_230286424()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_230286434(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1B28] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_230286470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_retain();
  return result;
}

uint64_t sub_230286488(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t sub_2302864C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_release();
  return result;
}

uint64_t sub_2302864D8()
{
  return sub_230285344(&qword_255E556E8, (uint64_t (*)(uint64_t))sub_230286504, MEMORY[0x24BDF4400]);
}

void sub_230286504()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E556F0)
  {
    v0 = sub_2302887D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E556F0);
  }
}

void static UIColor.pregnancyGreen.getter()
{
  sub_230286604();
}

unint64_t sub_230286588()
{
  unint64_t result;

  result = qword_255E556C0;
  if (!qword_255E556C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E556C0);
  }
  return result;
}

void static UIColor.pregnancyPill.getter()
{
  sub_230286604();
}

void static UIColor.pregnancyDarkGreen.getter()
{
  sub_230286604();
}

void sub_230286604()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  id v3;

  sub_230286588();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_23028884C();
  v3 = objc_msgSend((id)objc_opt_self(), sel_colorNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  if (!v3)
    __break(1u);
}

void static UIColor.pregnancyGreenPrediction.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  id v3;

  sub_230286588();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_23028884C();
  v3 = objc_msgSend((id)objc_opt_self(), sel_colorNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  if (v3)
  {
    objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t PregnancyModeTimelineViewModel.currentDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 20);
  v4 = sub_230288594();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for PregnancyModeTimelineViewModel()
{
  uint64_t result;

  result = qword_2540D0000;
  if (!qword_2540D0000)
    return swift_getSingletonMetadata();
  return result;
}

id PregnancyModeTimelineViewModel.pregnancySample.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 24));
}

uint64_t PregnancyModeTimelineViewModel.pregnancyStartDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 28);
  v4 = sub_230288594();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PregnancyModeTimelineViewModel.estimatedDueDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 32);
  v4 = sub_230288594();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

BOOL PregnancyModeTimelineViewModel.needsEndDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = sub_230288594();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230285DB0(0, &qword_255E556F8);
  v5 = objc_msgSend(*(id *)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 24)), sel_startDate);
  sub_23028857C();

  LOBYTE(v5) = sub_230288870();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (v5 & 1) == 0;
}

double PregnancyModeTimelineViewModel.currentValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 36));
}

double PregnancyModeTimelineViewModel.filledProgress.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 40));
}

uint64_t PregnancyModeTimelineViewModel.init(currentDay:pregnancySample:estimatedDueDate:today:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  void (*v41)(void);
  id v42;
  uint64_t v43;
  int *v44;
  char *v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(void);
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  char v64;
  char *v65;
  char *v66;
  int v67;
  uint64_t result;
  int *v69;
  double v70;
  uint64_t v71;
  char *v72;
  char *v73;
  void (*v74)(void);
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  char v80;
  char v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  void (*v91)(void);
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  int v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  int *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  char *v110;
  char *v111;

  v110 = a3;
  v111 = a4;
  sub_230287314();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v93 = (uint64_t)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v94 = (uint64_t)&v87 - v11;
  v12 = sub_2302885A0();
  v104 = *(int **)(v12 - 8);
  v105 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_2302885F4();
  v109 = *(_QWORD *)(v106 - 8);
  MEMORY[0x24BDAC7A8](v106);
  v16 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_230288594();
  v18 = *(_QWORD *)(v17 - 8);
  v102 = v17;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v89 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v90 = (char *)&v87 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v92 = (char *)&v87 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v88 = (char *)&v87 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v101 = (char *)&v87 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v95 = (char *)&v87 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v108 = (char *)&v87 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v103 = (char *)&v87 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v87 - v35;
  v37 = sub_230288828();
  v98 = *(_QWORD *)(v37 - 8);
  v99 = v37;
  v38 = a1;
  (*(void (**)(uint64_t, uint64_t))(v98 + 16))(a5, a1);
  v39 = (int *)type metadata accessor for PregnancyModeTimelineViewModel();
  v40 = a5 + v39[8];
  v100 = v18;
  v41 = *(void (**)(void))(v18 + 16);
  ((void (*)(uint64_t, char *, uint64_t))v41)(v40, v110, v17);
  *(_QWORD *)(a5 + v39[6]) = a2;
  v97 = a2;
  v42 = objc_msgSend(v97, sel_startDate);
  v87 = a5 + v39[7];
  sub_23028857C();

  v44 = v104;
  v43 = v105;
  (*((void (**)(char *, _QWORD, uint64_t))v104 + 13))(v14, *MEMORY[0x24BDCEF70], v105);
  sub_2302885AC();
  v45 = v14;
  v46 = v111;
  (*((void (**)(char *, uint64_t))v44 + 1))(v45, v43);
  v105 = v38;
  sub_23028881C();
  v47 = *(void (**)(char *, uint64_t))(v109 + 8);
  v48 = a5;
  v49 = v102;
  v50 = v106;
  v47(v16, v106);
  v104 = v39;
  v51 = v39[5];
  v109 = v48;
  v52 = v48 + v51;
  v53 = v50;
  ((void (*)(uint64_t, char *, uint64_t))v41)(v52, v36, v49);
  sub_2302885DC();
  LODWORD(v18) = sub_2302885D0();
  v47(v16, v50);
  v107 = v36;
  v54 = v41;
  LOBYTE(v50) = sub_230288558();
  v55 = v103;
  v56 = v108;
  v54();
  ((void (*)(char *, char *, uint64_t))v54)(v56, v46, v49);
  v91 = v54;
  v96 = v18;
  if ((v50 & 1) != 0)
  {
    sub_2302885DC();
    v57 = v94;
    sub_230287368((uint64_t)v16, v94);
    v47(v16, v53);
    ((void (*)(char *, char *, uint64_t))v54)(v101, v56, v49);
    v58 = v100;
    v59 = v53;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v57, 1, v49) == 1)
    {
      v60 = v95;
      (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v95, v101, v49);
      sub_230287574(v57);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v58 + 8))(v101, v49);
      v60 = v95;
      (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v95, v57, v49);
    }
    sub_230285344(&qword_255E55708, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v63 = v60;
    v64 = sub_230288840();
    v62 = *(void (**)(char *, uint64_t))(v58 + 8);
    v62(v63, v49);
    v62(v108, v49);
    v62(v55, v49);
    if ((v64 & 1) == 0)
    {

      v62(v111, v49);
      v62(v110, v49);
      (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v105, v99);
      v76 = v107;
LABEL_17:
      result = ((uint64_t (*)(char *, uint64_t))v62)(v76, v49);
      v69 = v104;
      *(_QWORD *)(v109 + v104[9]) = 0x3FEE3D70A3D70A3DLL;
      v70 = 0.92;
      goto LABEL_27;
    }
    v61 = v58;
  }
  else
  {
    v59 = v53;
    v61 = v100;
    v62 = *(void (**)(char *, uint64_t))(v100 + 8);
    v62(v56, v49);
    v62(v55, v49);
  }
  v65 = v110;
  sub_2302885DC();
  v66 = v107;
  v67 = sub_2302885D0();
  v47(v16, v59);
  if ((v67 & v96 & 1) != 0)
  {

    v62(v111, v49);
    v62(v65, v49);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v105, v99);
    result = ((uint64_t (*)(char *, uint64_t))v62)(v66, v49);
    v69 = v104;
    *(_QWORD *)(v109 + v104[9]) = 0x3FF0000000000000;
    v70 = 1.0;
    goto LABEL_27;
  }
  sub_2302885DC();
  v71 = v93;
  v72 = v111;
  sub_230287368((uint64_t)v16, v93);
  v47(v16, v59);
  v73 = v92;
  v74 = v91;
  ((void (*)(char *, char *, uint64_t))v91)(v92, v72, v49);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v71, 1, v49) == 1)
  {
    v75 = v88;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v88, v73, v49);
    sub_230287574(v71);
  }
  else
  {
    v62(v73, v49);
    v75 = v88;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 32))(v88, v71, v49);
  }
  v77 = v90;
  v78 = v89;
  v79 = v107;
  v80 = sub_230288564();
  v62(v75, v49);
  ((void (*)(char *, char *, uint64_t))v74)(v77, v79, v49);
  ((void (*)(char *, char *, uint64_t))v74)(v78, v65, v49);
  if ((v80 & 1) != 0)
  {
    sub_230285344(&qword_255E55708, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v81 = sub_230288840();
    v62(v78, v49);
    v62(v77, v49);
    if ((v81 & 1) == 0)
    {

      v62(v111, v49);
      v62(v65, v49);
      (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v105, v99);
      v76 = v79;
      goto LABEL_17;
    }
  }
  else
  {
    v62(v78, v49);
    v62(v77, v49);
  }
  sub_230285344(&qword_255E55708, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  if ((sub_230288840() & 1) != 0)
  {
    sub_23028854C();
    v83 = v82;
    sub_23028854C();
    v85 = v84;

    v86 = v85 / v83;
    if (v85 / v83 <= 0.003)
      v86 = 0.003;
    if (v86 <= 1.0)
      v70 = v86;
    else
      v70 = 1.0;
    v69 = v104;
    *(double *)(v109 + v104[9]) = v70;
    v62(v111, v49);
    v62(v65, v49);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v105, v99);
    result = ((uint64_t (*)(char *, uint64_t))v62)(v79, v49);
  }
  else
  {

    v62(v111, v49);
    v62(v65, v49);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v105, v99);
    result = ((uint64_t (*)(char *, uint64_t))v62)(v79, v49);
    v69 = v104;
    *(_QWORD *)(v109 + v104[9]) = 0;
    v70 = 0.0;
  }
LABEL_27:
  *(double *)(v109 + v69[10]) = v70;
  return result;
}

void sub_230287314()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E55700)
  {
    sub_230288594();
    v0 = sub_230288894();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E55700);
  }
}

uint64_t sub_230287368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, _QWORD, uint64_t);
  void (*v18)(char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v22 = a2;
  v3 = sub_2302885E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230287314();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_230288594();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - v15;
  v17 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
  v17(v6, *MEMORY[0x24BDCF220], v3);
  v21 = a1;
  sub_2302885C4();
  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v6, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_230287574((uint64_t)v9);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v22, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    sub_2302885B8();
    v17(v6, *MEMORY[0x24BDCF260], v3);
    sub_2302885C4();
    v18(v6, v3);
    v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v14, v10);
    return ((uint64_t (*)(char *, uint64_t))v20)(v16, v10);
  }
}

uint64_t sub_230287574(uint64_t a1)
{
  uint64_t v2;

  sub_230287314();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PregnancyModeTimelineViewModel.startDateShorthandText.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
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
  void (*v21)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_23028851C();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_230288534();
  v24 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_230288540();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v23 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  v15 = sub_230288594();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for PregnancyModeTimelineViewModel();
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v25 + *(int *)(v19 + 28), v15);
  MEMORY[0x2348B53F0](v20);
  sub_230288528();
  sub_230288504();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v26);
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  sub_230288510();
  sub_2302884F8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v2, v28);
  v21(v12, v5);
  sub_230285344(&qword_255E55710, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
  sub_230288588();
  v21(v14, v5);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  return v29;
}

uint64_t PregnancyModeTimelineViewModel.estimatedDueDateShorthandText.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
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
  void (*v21)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_23028851C();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_230288534();
  v24 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_230288540();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v23 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  v15 = sub_230288594();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for PregnancyModeTimelineViewModel();
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v25 + *(int *)(v19 + 32), v15);
  MEMORY[0x2348B53F0](v20);
  sub_230288528();
  sub_230288504();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v26);
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  sub_230288510();
  sub_2302884F8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v2, v28);
  v21(v12, v5);
  sub_230285344(&qword_255E55710, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
  sub_230288588();
  v21(v14, v5);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  return v29;
}

uint64_t PregnancyModeTimelineViewModel.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  sub_230288828();
  sub_230285344(&qword_255E55718, (uint64_t (*)(uint64_t))MEMORY[0x24BDD2488], MEMORY[0x24BDD24A0]);
  sub_230288834();
  v1 = type metadata accessor for PregnancyModeTimelineViewModel();
  sub_230288594();
  sub_230285344(&qword_255E55720, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_230288834();
  v2 = *(id *)(v0 + *(int *)(v1 + 24));
  sub_230288888();

  sub_230288834();
  sub_230288834();
  sub_2302888DC();
  return sub_2302888DC();
}

uint64_t PregnancyModeTimelineViewModel.hashValue.getter()
{
  sub_2302888D0();
  PregnancyModeTimelineViewModel.hash(into:)();
  return sub_2302888E8();
}

uint64_t sub_230287BBC()
{
  sub_2302888D0();
  PregnancyModeTimelineViewModel.hash(into:)();
  return sub_2302888E8();
}

uint64_t sub_230287BFC()
{
  sub_2302888D0();
  PregnancyModeTimelineViewModel.hash(into:)();
  return sub_2302888E8();
}

BOOL _s23HealthMenstrualCyclesUI30PregnancyModeTimelineViewModelV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;

  sub_230288828();
  sub_230285344(&qword_255E55730, (uint64_t (*)(uint64_t))MEMORY[0x24BDD2488], MEMORY[0x24BDD24C0]);
  sub_2302888A0();
  if (!v6
    && (v4 = type metadata accessor for PregnancyModeTimelineViewModel(), (sub_230288570() & 1) != 0)
    && (sub_230285DB0(0, &qword_255E55738), (sub_23028887C() & 1) != 0)
    && (sub_230288570() & 1) != 0
    && (sub_230288570() & 1) != 0
    && *(double *)(a1 + *(int *)(v4 + 36)) == *(double *)(a2 + *(int *)(v4 + 36)))
  {
    return *(double *)(a1 + *(int *)(v4 + 40)) == *(double *)(a2 + *(int *)(v4 + 40));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_230287D54()
{
  return sub_230285344(&qword_255E55728, (uint64_t (*)(uint64_t))type metadata accessor for PregnancyModeTimelineViewModel, (uint64_t)&protocol conformance descriptor for PregnancyModeTimelineViewModel);
}

char *initializeBufferWithCopyOfBuffer for PregnancyModeTimelineViewModel(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_230288828();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_230288594();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = *(void **)&a2[v13];
    *(_QWORD *)&a1[v13] = v15;
    v16 = &a1[v14];
    v17 = &a2[v14];
    v18 = v15;
    v12(v16, v17, v11);
    v12(&a1[a3[8]], &a2[a3[8]], v11);
    v19 = a3[10];
    *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
    *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  }
  return a1;
}

uint64_t destroy for PregnancyModeTimelineViewModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  v4 = sub_230288828();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_230288594();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v8(v5, v6);

  v8(a1 + a2[7], v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(a1 + a2[8], v6);
}

uint64_t initializeWithCopy for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v6 = sub_230288828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230288594();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a3[7];
  v14 = *(void **)(a2 + v12);
  *(_QWORD *)(a1 + v12) = v14;
  v15 = a1 + v13;
  v16 = a2 + v13;
  v17 = v14;
  v11(v15, v16, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  v18 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  return a1;
}

uint64_t assignWithCopy for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = sub_230288828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230288594();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = *(void **)(a2 + v12);
  v14 = *(void **)(a1 + v12);
  *(_QWORD *)(a1 + v12) = v13;
  v15 = v13;

  v11(a1 + a3[7], a2 + a3[7], v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v6 = sub_230288828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230288594();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v11(a1 + v12, a2 + v12, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  v13 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v6 = sub_230288828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230288594();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = *(void **)(a1 + v12);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);

  v11(a1 + a3[7], a2 + a3[7], v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  v14 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PregnancyModeTimelineViewModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2302882C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_230288828();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_230288594();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for PregnancyModeTimelineViewModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_230288374(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_230288828();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_230288594();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_230288418()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_230288828();
  if (v1 <= 0x3F)
  {
    result = sub_230288594();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2302884BC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2302884EC()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_2302884F8()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_230288504()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_230288510()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_23028851C()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_230288528()
{
  return MEMORY[0x24BDCE138]();
}

uint64_t sub_230288534()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_230288540()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_23028854C()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_230288558()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_230288564()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_230288570()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23028857C()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_230288588()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_230288594()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2302885A0()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2302885AC()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2302885B8()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_2302885C4()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2302885D0()
{
  return MEMORY[0x24BDCF188]();
}

uint64_t sub_2302885DC()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2302885E8()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2302885F4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_230288600()
{
  return MEMORY[0x24BDEB338]();
}

uint64_t sub_23028860C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_230288618()
{
  return MEMORY[0x24BDEB938]();
}

uint64_t sub_230288624()
{
  return MEMORY[0x24BDEBC28]();
}

uint64_t sub_230288630()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_23028863C()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_230288648()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_230288654()
{
  return MEMORY[0x24BDEC0D0]();
}

uint64_t sub_230288660()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23028866C()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_230288678()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_230288684()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_230288690()
{
  return MEMORY[0x24BDED068]();
}

uint64_t sub_23028869C()
{
  return MEMORY[0x24BDED070]();
}

uint64_t sub_2302886A8()
{
  return MEMORY[0x24BDED080]();
}

uint64_t sub_2302886B4()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2302886C0()
{
  return MEMORY[0x24BDED4E0]();
}

uint64_t sub_2302886CC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2302886D8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2302886E4()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_2302886F0()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_2302886FC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_230288708()
{
  return MEMORY[0x24BDEE8B8]();
}

uint64_t sub_230288714()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_230288720()
{
  return MEMORY[0x24BDF0198]();
}

uint64_t sub_23028872C()
{
  return MEMORY[0x24BDF01C8]();
}

uint64_t sub_230288738()
{
  return MEMORY[0x24BDF01D8]();
}

uint64_t sub_230288744()
{
  return MEMORY[0x24BDF01E0]();
}

uint64_t sub_230288750()
{
  return MEMORY[0x24BDF01E8]();
}

uint64_t sub_23028875C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_230288768()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_230288774()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_230288780()
{
  return MEMORY[0x24BDF1BA0]();
}

uint64_t sub_23028878C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_230288798()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2302887A4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2302887B0()
{
  return MEMORY[0x24BDF3300]();
}

uint64_t sub_2302887BC()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_2302887C8()
{
  return MEMORY[0x24BDF43E8]();
}

uint64_t sub_2302887D4()
{
  return MEMORY[0x24BDF43F0]();
}

uint64_t sub_2302887E0()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_2302887EC()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_2302887F8()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_230288804()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_230288810()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23028881C()
{
  return MEMORY[0x24BDD2480]();
}

uint64_t sub_230288828()
{
  return MEMORY[0x24BDD2488]();
}

uint64_t sub_230288834()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_230288840()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23028884C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230288858()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_230288864()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_230288870()
{
  return MEMORY[0x24BDD26B8]();
}

uint64_t sub_23028887C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_230288888()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_230288894()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2302888A0()
{
  return MEMORY[0x24BEE1F70]();
}

uint64_t sub_2302888AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2302888B8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2302888C4()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2302888D0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2302888DC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2302888E8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2302888F4()
{
  return MEMORY[0x24BEE4A98]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HKUIDynamicColorWithColors()
{
  return MEMORY[0x24BE4A1A0]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

