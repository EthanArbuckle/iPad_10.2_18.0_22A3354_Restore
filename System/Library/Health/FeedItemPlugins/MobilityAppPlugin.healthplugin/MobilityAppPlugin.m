uint64_t sub_231D4B384(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  void (*v35)(void);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void (*v45)(void);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t inited;
  int64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, char *, uint64_t);
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  void (*v86)(void);
  __int128 v87;
  _BYTE v88[32];
  __int128 v89;
  __int128 v90;

  v80 = a2;
  v76 = a1;
  v3 = sub_231D7DB3C();
  v83 = *(_QWORD *)(v3 - 8);
  v84 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v81 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_231D7E658();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = v5;
  v8 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  sub_231D4E564(0, (unint64_t *)&qword_255F725C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE43368], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v9 = *(_QWORD *)(sub_231D7E454() - 8);
  v79 = *(_QWORD *)(v9 + 72);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = swift_allocObject();
  v87 = xmmword_231D7F620;
  v82 = v11;
  *(_OWORD *)(v11 + 16) = xmmword_231D7F620;
  v78 = v11 + v10;
  sub_231D4CDF8();
  v77 = v12;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v87;
  v14 = type metadata accessor for MobilityInternalSettingsViewController.Item(0);
  v89 = 0u;
  v90 = 0u;
  *(_QWORD *)(v13 + 56) = v14;
  *(_QWORD *)&v87 = sub_231D4CD8C(&qword_255F725E0, type metadata accessor for MobilityInternalSettingsViewController.Item, (uint64_t)&unk_231D7FF74);
  *(_QWORD *)(v13 + 64) = v87;
  v15 = sub_231D4CEA8((uint64_t *)(v13 + 32));
  v75 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v68 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75(v68, a1, v7);
  v69 = MEMORY[0x24BEE4AD8] + 8;
  sub_231D4DB90((uint64_t)&v89, (uint64_t)v88, (uint64_t)&qword_25419BDC8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4DD6C);
  v16 = *(unsigned __int8 *)(v6 + 80);
  v17 = (v16 + 16) & ~v16;
  v74 = v16 | 7;
  v73 = ((v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 32;
  v72 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  v71 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v19 = v7;
  v71(v18 + v17, (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_231D4CF08((uint64_t)v88, v18 + ((v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  v20 = (char *)v15 + *(int *)(v14 + 28);
  *v20 = 1;
  v85 = *MEMORY[0x24BE435F8];
  v21 = v85;
  v70 = sub_231D7E490();
  v86 = *(void (**)(void))(*(_QWORD *)(v70 - 8) + 104);
  ((void (*)(_BYTE *, uint64_t, uint64_t))v86)(v20, v21, v70);
  sub_231D7E844();
  *v15 = sub_231D7E238();
  v15[1] = v22;
  v15[2] = 0xD000000000000028;
  v15[3] = 0x8000000231D82250;
  v15[4] = (uint64_t)sub_231D4CF68;
  v15[5] = v18;
  v23 = v69;
  sub_231D4DBE8((uint64_t)&v89, (uint64_t)&qword_25419BDC8, v69, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4DD6C);
  v89 = 0u;
  v90 = 0u;
  v24 = v87;
  *(_QWORD *)(v13 + 96) = v14;
  *(_QWORD *)(v13 + 104) = v24;
  v25 = sub_231D4CEA8((uint64_t *)(v13 + 72));
  v26 = v68;
  v75(v68, v76, v19);
  sub_231D4DB90((uint64_t)&v89, (uint64_t)v88, (uint64_t)&qword_25419BDC8, v23, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4DD6C);
  v27 = swift_allocObject();
  v71(v27 + v17, v26, v19);
  sub_231D4CF08((uint64_t)v88, v27 + v72);
  *((_BYTE *)v25 + *(int *)(v14 + 28)) = 1;
  v86();
  *v25 = sub_231D7E238();
  v25[1] = v28;
  v25[2] = 0xD00000000000002ELL;
  v25[3] = 0x8000000231D82280;
  v25[4] = (uint64_t)sub_231D4D004;
  v25[5] = v27;
  sub_231D4DBE8((uint64_t)&v89, (uint64_t)&qword_25419BDC8, v23, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4DD6C);
  v29 = v78;
  sub_231D7E43C();
  v79 += v29;
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_231D7F630;
  v31 = v87;
  *(_QWORD *)(v30 + 56) = v14;
  *(_QWORD *)(v30 + 64) = v31;
  v32 = sub_231D4CEA8((uint64_t *)(v30 + 32));
  v33 = swift_allocObject();
  v34 = v80;
  *(_QWORD *)(v33 + 16) = v80;
  *((_BYTE *)v32 + *(int *)(v14 + 28)) = 1;
  v35 = v86;
  v86();
  v36 = v34;
  *v32 = sub_231D7E238();
  v32[1] = v37;
  v32[2] = 0xD00000000000001FLL;
  v32[3] = 0x8000000231D822B0;
  v32[4] = (uint64_t)sub_231D4D0AC;
  v32[5] = v33;
  *(_QWORD *)(v30 + 96) = v14;
  *(_QWORD *)(v30 + 104) = v31;
  v38 = sub_231D4CEA8((uint64_t *)(v30 + 72));
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = v36;
  *((_BYTE *)v38 + *(int *)(v14 + 28)) = 1;
  v35();
  v40 = v36;
  *v38 = sub_231D7E238();
  v38[1] = v41;
  v38[2] = 0xD000000000000024;
  v38[3] = 0x8000000231D822D0;
  v38[4] = (uint64_t)sub_231D4D0B8;
  v38[5] = v39;
  v42 = v87;
  *(_QWORD *)(v30 + 136) = v14;
  *(_QWORD *)(v30 + 144) = v42;
  v43 = sub_231D4CEA8((uint64_t *)(v30 + 112));
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = v40;
  *((_BYTE *)v43 + *(int *)(v14 + 28)) = 1;
  v45 = v86;
  v86();
  v46 = v40;
  *v43 = sub_231D7E238();
  v43[1] = v47;
  v43[2] = 0xD00000000000001ELL;
  v43[3] = 0x8000000231D82300;
  v43[4] = (uint64_t)sub_231D4D0E8;
  v43[5] = v44;
  *(_QWORD *)(v30 + 176) = v14;
  *(_QWORD *)(v30 + 184) = v42;
  v48 = sub_231D4CEA8((uint64_t *)(v30 + 152));
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = v46;
  *((_BYTE *)v48 + *(int *)(v14 + 28)) = 1;
  v45();
  v50 = v46;
  *v48 = sub_231D7E238();
  v48[1] = v51;
  v48[2] = 0xD000000000000023;
  v48[3] = 0x8000000231D82320;
  v48[4] = (uint64_t)sub_231D4D0F4;
  v48[5] = v49;
  sub_231D7E43C();
  *(_QWORD *)&v89 = 0x3C53447961727241;
  *((_QWORD *)&v89 + 1) = 0xE800000000000000;
  v52 = v81;
  sub_231D7DB30();
  sub_231D7DB24();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v84);
  sub_231D7EBB0();
  swift_bridgeObjectRelease();
  sub_231D7EBB0();
  sub_231D7E280();
  swift_allocObject();
  sub_231D7E274();
  v53 = sub_231D7E334();
  swift_release();
  v54 = sub_231D4CD8C(&qword_255F725E8, (uint64_t (*)(uint64_t))sub_231D4D100, MEMORY[0x24BE43020]);
  sub_231D4D15C(0, &qword_255F725F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v55 = swift_allocObject();
  v87 = xmmword_231D7F640;
  *(_OWORD *)(v55 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v55 + 32) = v53;
  v56 = v55 + 32;
  *(_QWORD *)(v55 + 40) = v54;
  sub_231D4D214();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v87;
  *(_QWORD *)(inited + 32) = v55;
  v58 = *(_QWORD *)(v55 + 16);
  sub_231D7E514();
  sub_231D7E514();
  v59 = sub_231D4D4D8(0, v58, 1, MEMORY[0x24BEE4AF8]);
  v60 = v59;
  if (!*(_QWORD *)(v55 + 16))
  {
    if (!v58)
      goto LABEL_9;
    __break(1u);
    goto LABEL_11;
  }
  v61 = v59[2];
  if ((v59[3] >> 1) - v61 < v58)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v62 = (unint64_t)&v59[2 * v61 + 4];
  if (v56 < v62 + 16 * v58 && v62 < v56 + 16 * v58)
    goto LABEL_13;
  sub_231D4D1C8(0, &qword_255F72600);
  swift_arrayInitWithCopy();
  if (!v58)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_231D4D15C(0, &qword_255F72610, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    swift_arrayDestroy();
    return (uint64_t)v60;
  }
  v63 = v60[2];
  v64 = __OFADD__(v63, v58);
  v65 = v63 + v58;
  if (!v64)
  {
    v60[2] = v65;
    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
LABEL_13:
  result = sub_231D7EEE0();
  __break(1u);
  return result;
}

uint64_t sub_231D4BD64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_231D7E4D8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E4B4();
  v4 = sub_231D7E4CC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void sub_231D4BDEC()
{
  sub_231D7EE98();
  __break(1u);
}

void sub_231D4BE44()
{
  void *v0;
  void (*v1)(void);
  id v2;

  sub_231D7E82C();
  v1 = (void (*)(void))sub_231D7E838();
  v1();
  v2 = objc_msgSend(v0, sel_collectionView);
  if (v2)
  {
    sub_231D7E844();
    sub_231D7EC94();

  }
  else
  {
    __break(1u);
  }
}

id sub_231D4BEC0()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD aBlock[6];

  result = objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    v2 = result;
    v3 = objc_allocWithZone(MEMORY[0x24BEBD468]);
    aBlock[4] = sub_231D4BFC0;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_231D4C7D8;
    aBlock[3] = &unk_2500C8070;
    v4 = _Block_copy(aBlock);
    v5 = objc_msgSend(v3, sel_initWithSectionProvider_, v4);
    _Block_release(v4);
    swift_release();
    objc_msgSend(v2, sel_setCollectionViewLayout_, v5);

    v6.receiver = v0;
    v6.super_class = (Class)type metadata accessor for MobilityInternalSettingsViewController(0);
    return objc_msgSendSuper2(&v6, sel_viewDidLoad);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_231D4BFC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  void (*v7)(_BYTE *, _QWORD);
  _QWORD *v8;
  uint64_t v9;
  void (*v10)(_BYTE *, uint64_t);
  _BYTE v12[32];

  v0 = sub_231D7E4D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v12[-v5];
  sub_231D7E4B4();
  v7 = (void (*)(_BYTE *, _QWORD))sub_231D7E4C0();
  *v8 = 0x4034000000000000;
  v7(v12, 0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v1 + 16))(v4, v6, v0);
  v9 = sub_231D7E4CC();
  v10 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v10(v4, v0);
  v10(v6, v0);
  return v9;
}

void sub_231D4C0B8(void *a1)
{
  id v1;

  v1 = a1;
  sub_231D4BEC0();

}

uint64_t sub_231D4C0EC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), uint64_t (*a5)(void), _QWORD *a6, void (*a7)(uint64_t))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v31)(uint64_t);
  uint64_t v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[3];
  uint64_t v36;

  v31 = a7;
  v32 = a3;
  v33 = a1;
  v11 = sub_231D7E658();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v31 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18((char *)&v31 - v16, a2, v11);
  a4(0);
  v19 = swift_allocObject();
  v20 = (id)a5();
  *(_QWORD *)(v19 + 16) = v20;
  v34 = a6;
  v21 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v19 + *a6, v17, v11);
  v31(v21);
  v18(v15, a2, v11);
  objc_allocWithZone((Class)sub_231D7E880());
  v22 = v20;
  v23 = (void *)sub_231D7E874();
  sub_231D4DB90(v32, (uint64_t)v35, (uint64_t)&qword_25419BDC8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4DD6C);
  v24 = v36;
  if (v36)
  {
    v25 = sub_231D4DC30(v35, v36);
    v26 = *(_QWORD *)(v24 - 8);
    MEMORY[0x24BDAC7A8](v25);
    v28 = (char *)&v31 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v26 + 16))(v28);
    v29 = sub_231D7EF7C();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v24);
    sub_231D4CEE8((uint64_t)v35);
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v33, sel_showViewController_sender_, v23, v29, v31);

  sub_231D7E784();
  swift_setDeallocating();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v19 + *v34, v11);
  return swift_deallocClassInstance();
}

void sub_231D4C354(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_231D4C3B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_231D7EA3C();
  v3 = MEMORY[0x24BEBC5F0];
  a1[3] = v2;
  a1[4] = v3;
  sub_231D4CEA8(a1);
  sub_231D7EA24();
  sub_231D7E514();
  return sub_231D7EA30();
}

uint64_t sub_231D4C424()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v14;

  sub_231D4E564(0, &qword_255F72788, (uint64_t (*)(uint64_t))MEMORY[0x24BEBC088], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v14 - v1;
  v3 = sub_231D7E9F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_231D7E9C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, (unint64_t *)&unk_255F72790, (uint64_t (*)(uint64_t))MEMORY[0x24BEBC0E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_231D7EA00();
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_231D7F640;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEBC058], v7);
  v12 = sub_231D7E9D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v2, 1, 1, v12);
  sub_231D7E9E8();
  sub_231D7E9DC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

uint64_t sub_231D4C608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 32))(a2);
}

uint64_t sub_231D4C62C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_231D7E490();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

void sub_231D4C674()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_231D4C6A0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_231D7E514();
  return v1;
}

uint64_t sub_231D4C6CC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_231D7E514();
  return v1;
}

void sub_231D4C6F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_231D4C728()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MobilityInternalSettingsViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of WalkingSteadinessOnboardingViewController.coordinator()
{
  return 0;
}

uint64_t type metadata accessor for MobilityInternalSettingsViewController(uint64_t a1)
{
  return sub_231D4CE74(a1, qword_255F724F8);
}

uint64_t sub_231D4C778()
{
  return swift_initClassMetadata2();
}

uint64_t sub_231D4C7B4()
{
  return type metadata accessor for MobilityInternalSettingsViewController(0);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_231D4DD6C(a1, &qword_255F725A8, (uint64_t)&unk_2500C7F18, MEMORY[0x24BEE4D40]);
}

id sub_231D4C7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = (void *)v5(a2, a3);
  swift_release();
  sub_231D7E784();
  return v6;
}

uint64_t sub_231D4C83C(uint64_t a1, uint64_t a2)
{
  return sub_231D4D3EC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

void sub_231D4C854(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_231D4C864(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_231D4C86C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_231D4C880@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_231D4C894@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_231D4C8A8(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_231D4C8D8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_231D4C904@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_231D4C928(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_231D4C93C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_231D4C950(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_231D4C964@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_231D4C978(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_231D4C98C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_231D4C9A0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_231D4C9B4()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_231D4C9C4()
{
  return sub_231D7EDCC();
}

_QWORD *sub_231D4C9DC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_231D4C9F8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_231D7EB5C();
  *a2 = 0;
  return result;
}

uint64_t sub_231D4CA6C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_231D7EB68();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_231D4CAE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_231D7EB74();
  v2 = sub_231D7EB44();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_231D4CB28(uint64_t a1, uint64_t a2)
{
  return sub_231D4D3EC(a1, a2, MEMORY[0x24BEE0CD8]);
}

BOOL sub_231D4CB38(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_231D4CB4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_231D4E52C(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_231D4CB88@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_231D4CB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_231D7EB74();
  v2 = v1;
  if (v0 == sub_231D7EB74() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_231D4CC1C()
{
  sub_231D4CD8C(&qword_255F72758, (uint64_t (*)(uint64_t))type metadata accessor for HKMobilityNotificationCategory, (uint64_t)&unk_231D7FEA8);
  sub_231D4CD8C(&qword_255F72760, (uint64_t (*)(uint64_t))type metadata accessor for HKMobilityNotificationCategory, (uint64_t)&unk_231D7FE50);
  return sub_231D7EEEC();
}

_QWORD *sub_231D4CCA0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_231D4CCB0()
{
  sub_231D4CD8C(&qword_255F72620, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F814);
  sub_231D4CD8C(&qword_255F72628, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F768);
  return sub_231D7EEEC();
}

uint64_t sub_231D4CD34()
{
  return sub_231D4CD8C(&qword_255F725B0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F72C);
}

uint64_t sub_231D4CD60()
{
  return sub_231D4CD8C(&qword_255F725B8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F700);
}

uint64_t sub_231D4CD8C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348F00E0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_231D4CDCC()
{
  return sub_231D4CD8C(&qword_255F725C0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F79C);
}

void sub_231D4CDF8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F725D0)
  {
    sub_231D4D1C8(255, &qword_255F725D8);
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F725D0);
  }
}

uint64_t type metadata accessor for MobilityInternalSettingsViewController.Item(uint64_t a1)
{
  return sub_231D4CE74(a1, qword_255F726B0);
}

uint64_t sub_231D4CE74(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_231D4CEA8(uint64_t *a1)
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

uint64_t sub_231D4CEE8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_231D4CF08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D4DD6C(0, &qword_25419BDC8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_231D4CF68(void *a1)
{
  return sub_231D4D028(a1, (void (*)(_QWORD))type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider, MEMORY[0x24BE46D80], &OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context, (void (*)(uint64_t))sub_231D566E8);
}

uint64_t sub_231D4CF90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_231D7E658();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  if (*(_QWORD *)(v0 + v4 + 24))
    sub_231D4CEE8(v0 + v4);
  return swift_deallocObject();
}

uint64_t sub_231D4D004(void *a1)
{
  return sub_231D4D028(a1, (void (*)(_QWORD))type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider, MEMORY[0x24BE46D60], &OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context, (void (*)(uint64_t))sub_231D5DFB4);
}

uint64_t sub_231D4D028(void *a1, void (*a2)(_QWORD), uint64_t (*a3)(void), _QWORD *a4, void (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t v11;
  unint64_t v12;

  v11 = *(_QWORD *)(sub_231D7E658() - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return sub_231D4C0EC(a1, v5 + v12, v5 + ((*(_QWORD *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8), a2, a3, a4, a5);
}

void sub_231D4D0AC()
{
  uint64_t v0;

  sub_231D4D70C(1, *(_QWORD *)(v0 + 16));
}

void sub_231D4D0B8()
{
  uint64_t v0;

  sub_231D4D70C(2, *(_QWORD *)(v0 + 16));
}

uint64_t sub_231D4D0C4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_231D4D0E8()
{
  uint64_t v0;

  sub_231D4D70C(3, *(_QWORD *)(v0 + 16));
}

void sub_231D4D0F4()
{
  uint64_t v0;

  sub_231D4D70C(4, *(_QWORD *)(v0 + 16));
}

void sub_231D4D100()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F725F0)
  {
    sub_231D7E280();
    v0 = sub_231D7E3DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F725F0);
  }
}

void sub_231D4D15C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_231D4D1C8(255, &qword_255F72600);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_231D4D1C8(uint64_t a1, unint64_t *a2)
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

void sub_231D4D214()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72608)
  {
    sub_231D4D15C(255, &qword_255F72610, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72608);
  }
}

uint64_t sub_231D4D278()
{
  sub_231D4CD8C(&qword_255F72768, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_231D7FBD8);
  sub_231D4CD8C(&qword_255F72770, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_231D7FB80);
  return sub_231D7EEEC();
}

uint64_t sub_231D4D2FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_231D7EB44();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_231D4D340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_231D7EB74();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_231D4D368()
{
  sub_231D4CD8C((unint64_t *)&qword_255F72778, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_231D7FF30);
  sub_231D4CD8C(&qword_255F72780, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_231D7FA74);
  return sub_231D7EEEC();
}

uint64_t sub_231D4D3EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_231D7EB74();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_231D4D428()
{
  sub_231D7EB74();
  sub_231D7EBA4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_231D4D468()
{
  uint64_t v0;

  sub_231D7EB74();
  sub_231D7EFB8();
  sub_231D7EBA4();
  v0 = sub_231D7EFD0();
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *sub_231D4D4D8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      sub_231D4D15C(0, &qword_255F725F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = j__malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_231D4D5F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_231D4D5F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_231D4D1C8(0, &qword_255F72600);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_231D7EEE0();
  __break(1u);
  return result;
}

void sub_231D4D70C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _BYTE v26[16];
  uint64_t aBlock;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  uint64_t (*v31)();
  uint64_t v32;

  sub_231D4E564(0, &qword_255F72618, (uint64_t (*)(uint64_t))MEMORY[0x24BE45750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v26[-v7];
  v9 = (id)HKMobilityNotificationCategoryForWalkingSteadinessEventValue();
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, sel_features);

      if (v13)
      {
        v14 = objc_msgSend(v13, sel_seahorse);

        if (v14)
        {
          v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_currentCountryCode_, *MEMORY[0x24BDD2EA8], a2, 0);
          sub_231D4DB54();
          sub_231D7E91C();
          v19 = sub_231D7E904();
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 0, 1, v19);
          sub_231D4DB90((uint64_t)v8, (uint64_t)v6, (uint64_t)&qword_255F72618, (uint64_t)MEMORY[0x24BE45750], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4E564);
          sub_231D7E904();
          v20 = *(_QWORD *)(v19 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v6, 1, v19) == 1)
          {
            sub_231D4DBE8((uint64_t)v6, (uint64_t)&qword_255F72618, (uint64_t)MEMORY[0x24BE45750], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4E564);
            v21 = 1;
          }
          else
          {
            v22 = (void *)sub_231D7E910();
            (*(void (**)(_BYTE *, uint64_t))(v20 + 8))(v6, v19);
            v21 = (uint64_t)objc_msgSend(v22, sel_areAllRequirementsSatisfied);

          }
          v23 = objc_msgSend((id)objc_opt_self(), sel_hkmobility_requestForCategory_shouldHidePregnancyContent_, v10, v21);
          v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3DA0]), sel_initWithHealthStore_, a2);
          v31 = nullsub_1;
          v32 = 0;
          aBlock = MEMORY[0x24BDAC760];
          v28 = 1107296256;
          v29 = sub_231D4C354;
          v30 = &unk_2500C8048;
          v25 = _Block_copy(&aBlock);
          objc_msgSend(v24, sel_postNotificationWithRequest_completion_, v23, v25);
          _Block_release(v25);

          sub_231D4DBE8((uint64_t)v8, (uint64_t)&qword_255F72618, (uint64_t)MEMORY[0x24BE45750], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_231D4E564);
        }
        else
        {
          v16 = objc_msgSend((id)objc_opt_self(), sel_hkmobility_requestForCategory_shouldHidePregnancyContent_, v10, 1);
          v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3DA0]), sel_initWithHealthStore_, a2);
          v31 = j_nullsub_1;
          v32 = 0;
          aBlock = MEMORY[0x24BDAC760];
          v28 = 1107296256;
          v29 = sub_231D4C354;
          v30 = &unk_2500C8020;
          v18 = _Block_copy(&aBlock);
          objc_msgSend(v17, sel_postNotificationWithRequest_completion_, v16, v18);
          _Block_release(v18);

        }
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_231D4DB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D4DB4C()
{
  return swift_release();
}

unint64_t sub_231D4DB54()
{
  unint64_t result;

  result = qword_25419B528;
  if (!qword_25419B528)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25419B528);
  }
  return result;
}

uint64_t sub_231D4DB90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;

  v7 = a5(0, a3, a4, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_231D4DBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

_QWORD *sub_231D4DC30(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void type metadata accessor for HKMobilityNotificationCategory(uint64_t a1)
{
  sub_231D4DD6C(a1, &qword_255F72630, (uint64_t)&unk_2500C80A8, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for UNNotificationPresentationOptions(uint64_t a1)
{
  sub_231D4DD6C(a1, &qword_255F72638, (uint64_t)&unk_2500C80D0, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
  sub_231D4DD6C(a1, &qword_255F72640, (uint64_t)&unk_2500C80F8, MEMORY[0x24BEE4D40]);
}

uint64_t initializeBufferWithCopyOfBuffer for FitnessPlusDataSource.FitnessPlusItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_231D4DCDC(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_231D4DCE8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_231D4DD08(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
  sub_231D4DD6C(a1, &qword_255F72648, (uint64_t)&unk_2500C8178, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_231D4DD6C(a1, qword_255F72650, (uint64_t)&unk_2500C81A8, MEMORY[0x24BEE4D40]);
}

void sub_231D4DD6C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

_QWORD *sub_231D4DDB0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = a2[2];
    v6 = a2[5];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    v7 = *(int *)(a3 + 28);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    *(_QWORD *)(a1 + 40) = v6;
    v10 = sub_231D7E490();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    sub_231D7E514();
    sub_231D7E514();
    swift_retain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_231D4DE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_231D7E490();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_231D4DEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_231D7E490();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  sub_231D7E514();
  sub_231D7E514();
  swift_retain();
  v10(v7, v8, v9);
  return a1;
}

_QWORD *sub_231D4DF94(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_231D7E514();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_231D7E514();
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_231D7E490();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

_OWORD *sub_231D4E048(_OWORD *a1, _OWORD *a2, uint64_t a3)
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
  v8 = sub_231D7E490();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_231D4E0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  v8 = *(int *)(a3 + 28);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_231D7E490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_231D4E138()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_231D4E144(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_231D7E490();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_231D4E1C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_231D4E1CC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_231D7E490();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_231D4E240()
{
  uint64_t result;
  unint64_t v1;

  result = sub_231D7E490();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_231D4E2C4()
{
  return sub_231D4CD8C(&qword_255F725E0, type metadata accessor for MobilityInternalSettingsViewController.Item, (uint64_t)&unk_231D7FF74);
}

uint64_t sub_231D4E2F0()
{
  return sub_231D4CD8C(&qword_255F726F0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_231D7FA38);
}

uint64_t sub_231D4E31C()
{
  return sub_231D4CD8C(&qword_255F726F8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_231D7FA0C);
}

uint64_t sub_231D4E348()
{
  return sub_231D4CD8C(&qword_255F72700, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_231D7FB48);
}

uint64_t sub_231D4E374()
{
  return sub_231D4CD8C(&qword_255F72708, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_231D7FB20);
}

uint64_t sub_231D4E3A0()
{
  return sub_231D4CD8C(&qword_255F72710, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_231D7FBB0);
}

uint64_t sub_231D4E3CC()
{
  return sub_231D4CD8C(&qword_255F72718, (uint64_t (*)(uint64_t))type metadata accessor for UNNotificationPresentationOptions, (uint64_t)&unk_231D7FC90);
}

uint64_t sub_231D4E3F8()
{
  return sub_231D4CD8C(&qword_255F72720, (uint64_t (*)(uint64_t))type metadata accessor for UNNotificationPresentationOptions, (uint64_t)&unk_231D7FC60);
}

uint64_t sub_231D4E424()
{
  return sub_231D4CD8C(&qword_255F72728, (uint64_t (*)(uint64_t))type metadata accessor for UNNotificationPresentationOptions, (uint64_t)&unk_231D7FCB8);
}

uint64_t sub_231D4E450()
{
  return sub_231D4CD8C(&qword_255F72730, (uint64_t (*)(uint64_t))type metadata accessor for UNNotificationPresentationOptions, (uint64_t)&unk_231D7FCF0);
}

uint64_t sub_231D4E47C()
{
  return sub_231D4CD8C(&qword_255F72738, (uint64_t (*)(uint64_t))type metadata accessor for HKMobilityNotificationCategory, (uint64_t)&unk_231D7FE18);
}

uint64_t sub_231D4E4A8()
{
  return sub_231D4CD8C(&qword_255F72740, (uint64_t (*)(uint64_t))type metadata accessor for HKMobilityNotificationCategory, (uint64_t)&unk_231D7FDF0);
}

uint64_t sub_231D4E4D4()
{
  return sub_231D4CD8C(&qword_255F72748, (uint64_t (*)(uint64_t))type metadata accessor for HKMobilityNotificationCategory, (uint64_t)&unk_231D7FE80);
}

uint64_t sub_231D4E500()
{
  return sub_231D4CD8C(&qword_255F72750, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_231D7FAA8);
}

uint64_t sub_231D4E52C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void sub_231D4E564(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

id sub_231D4E5EC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for MobilityAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25419BF10 = (uint64_t)result;
  return result;
}

uint64_t sub_231D4E640()
{
  uint64_t v0;
  id v1;

  v0 = sub_231D7DFEC();
  sub_231D4E6D8(v0, qword_25419BF18);
  sub_231D4E718(v0, (uint64_t)qword_25419BF18);
  if (qword_25419BE08 != -1)
    swift_once();
  v1 = (id)qword_25419BF10;
  return sub_231D7DFE0();
}

uint64_t *sub_231D4E6D8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_231D4E718(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusActionHandler(uint64_t a1)
{
  return sub_231D4CE74(a1, (uint64_t *)&unk_25419BBA8);
}

uint64_t sub_231D4E744()
{
  return swift_initClassMetadata2();
}

uint64_t sub_231D4E780(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_231D4E7BC + 4 * byte_231D7FFB0[a1]))(0xD000000000000011, 0x8000000231D82750);
}

unint64_t sub_231D4E7BC()
{
  return 0xD000000000000016;
}

BOOL sub_231D4E84C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_231D4E860()
{
  sub_231D7EFB8();
  sub_231D7EFC4();
  return sub_231D7EFD0();
}

uint64_t sub_231D4E8A4()
{
  return sub_231D7EFC4();
}

uint64_t sub_231D4E8CC()
{
  sub_231D7EFB8();
  sub_231D7EFC4();
  return sub_231D7EFD0();
}

uint64_t sub_231D4E90C()
{
  unsigned __int8 *v0;

  return sub_231D4E780(*v0);
}

uint64_t sub_231D4E914@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_231D53944(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_231D4E938()
{
  return 0;
}

void sub_231D4E944(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_231D4E950()
{
  sub_231D5400C();
  return sub_231D7F000();
}

uint64_t sub_231D4E978()
{
  sub_231D5400C();
  return sub_231D7F00C();
}

void sub_231D4E9A0(_QWORD *a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD v30[28];
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE3520];
  sub_231D540F8(0, &qword_25419BD28, (uint64_t (*)(void))sub_231D53DA8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys, MEMORY[0x24BEE3520]);
  v30[26] = *(_QWORD *)(v3 - 8);
  v30[27] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v30[25] = (char *)v30 - v4;
  sub_231D540F8(0, &qword_25419BD38, (uint64_t (*)(void))sub_231D53DEC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys, v2);
  v30[23] = *(_QWORD *)(v5 - 8);
  v30[24] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v30[22] = (char *)v30 - v6;
  sub_231D540F8(0, &qword_25419BD40, (uint64_t (*)(void))sub_231D53E30, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys, v2);
  v30[20] = *(_QWORD *)(v7 - 8);
  v30[21] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v30[19] = (char *)v30 - v8;
  sub_231D540F8(0, &qword_25419BD30, (uint64_t (*)(void))sub_231D53E74, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys, v2);
  v30[16] = v9;
  v30[14] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v30[13] = (char *)v30 - v10;
  sub_231D540F8(0, &qword_25419BCF8, (uint64_t (*)(void))sub_231D53EB8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys, v2);
  v30[17] = *(_QWORD *)(v11 - 8);
  v30[18] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v30[15] = (char *)v30 - v12;
  sub_231D540F8(0, &qword_25419BD00, (uint64_t (*)(void))sub_231D53EFC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys, v2);
  v30[12] = v13;
  v30[11] = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v30[10] = (char *)v30 - v14;
  sub_231D540F8(0, &qword_25419BD20, (uint64_t (*)(void))sub_231D53F40, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys, v2);
  v30[7] = v15;
  v30[5] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v30[2] = (char *)v30 - v16;
  sub_231D540F8(0, &qword_25419BD08, (uint64_t (*)(void))sub_231D53F84, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys, v2);
  v30[9] = v17;
  v30[8] = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v30[6] = (char *)v30 - v18;
  v31 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  v19 = MEMORY[0x24BDAC7A8](v31);
  v30[3] = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v30[4] = (char *)v30 - v21;
  sub_231D540F8(0, &qword_25419BD18, (uint64_t (*)(void))sub_231D53FC8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys, v2);
  v30[1] = v22;
  MEMORY[0x24BDAC7A8](v22);
  v23 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v30 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D540F8(0, &qword_25419BD10, (uint64_t (*)(void))sub_231D5400C, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys, v2);
  v34 = v26;
  v32 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v30 - v27;
  sub_231D4DC30(a1, a1[3]);
  sub_231D5400C();
  v33 = v28;
  sub_231D7EFF4();
  sub_231D54154(v35, (uint64_t)v25, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  v29 = (char *)sub_231D4EE64 + 4 * byte_231D7FFB9[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_231D4EE64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v1 - 336);
  sub_231D51FE4(v0, v2, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
  *(_BYTE *)(v1 - 72) = 1;
  sub_231D53F84();
  v3 = *(_QWORD *)(v1 - 320);
  v5 = *(_QWORD *)(v1 - 128);
  v4 = *(_QWORD *)(v1 - 120);
  sub_231D7EF40();
  sub_231D4CD8C(&qword_25419BAD8, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState, (uint64_t)&unk_231D811C0);
  v6 = *(_QWORD *)(v1 - 296);
  sub_231D7EF58();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 304) + 8))(v3, v6);
  sub_231D541F8(v2, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8))(v5, v4);
}

uint64_t sub_231D4F208@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD v40[27];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;

  v40[26] = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE33E0];
  sub_231D540F8(0, &qword_255F72830, (uint64_t (*)(void))sub_231D53DA8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys, MEMORY[0x24BEE33E0]);
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v40[25] = (char *)v40 - v5;
  sub_231D540F8(0, &qword_255F72838, (uint64_t (*)(void))sub_231D53DEC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys, v3);
  v40[15] = *(_QWORD *)(v6 - 8);
  v40[16] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v40[24] = (char *)v40 - v7;
  sub_231D540F8(0, &qword_255F72840, (uint64_t (*)(void))sub_231D53E30, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys, v3);
  v40[13] = *(_QWORD *)(v8 - 8);
  v40[14] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v40[23] = (char *)v40 - v9;
  sub_231D540F8(0, &qword_255F72848, (uint64_t (*)(void))sub_231D53E74, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys, v3);
  v40[10] = v10;
  v40[9] = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v40[21] = (char *)v40 - v11;
  sub_231D540F8(0, &qword_255F72850, (uint64_t (*)(void))sub_231D53EB8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys, v3);
  v40[12] = v12;
  v40[11] = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v40[22] = (char *)v40 - v13;
  sub_231D540F8(0, &qword_255F72858, (uint64_t (*)(void))sub_231D53EFC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys, v3);
  v40[8] = v14;
  v40[7] = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v40[20] = (char *)v40 - v15;
  sub_231D540F8(0, &qword_255F72860, (uint64_t (*)(void))sub_231D53F40, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys, v3);
  v40[4] = v16;
  v40[3] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v40[18] = (char *)v40 - v17;
  sub_231D540F8(0, &qword_255F72868, (uint64_t (*)(void))sub_231D53F84, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys, v3);
  v40[6] = v18;
  v40[5] = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v40[19] = (char *)v40 - v19;
  sub_231D540F8(0, &qword_255F72870, (uint64_t (*)(void))sub_231D53FC8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys, v3);
  v40[2] = v20;
  v40[1] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v40[17] = (char *)v40 - v21;
  sub_231D540F8(0, &qword_255F72878, (uint64_t (*)(void))sub_231D5400C, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys, v3);
  v23 = v22;
  v41 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v40 - v24;
  v26 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)v40 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v33 = a1[3];
  v44 = a1;
  sub_231D4DC30(a1, v33);
  sub_231D5400C();
  v34 = v45;
  sub_231D7EFE8();
  if (!v34)
  {
    v40[0] = v32;
    v45 = v29;
    v35 = sub_231D7EF34();
    if (*(_QWORD *)(v35 + 16) == 1)
      __asm { BR              X10 }
    v36 = sub_231D7EE74();
    swift_allocError();
    v38 = v37;
    sub_231D54050();
    *v38 = v26;
    sub_231D7EF10();
    sub_231D7EE5C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE26D0], v36);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v23);
  }
  return sub_231D4CEE8((uint64_t)v44);
}

void sub_231D4FC34()
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

  v7 = v4;
  *(_QWORD *)(v6 - 104) = v0;
  *(_BYTE *)(v6 - 65) = 8;
  sub_231D53DA8();
  v8 = *(_QWORD *)(v6 - 152);
  sub_231D7EF04();
  if (v2)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 136) + 8))(v1, v5);
    JUMPOUT(0x231D4FC0CLL);
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v3);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 136) + 8))(v1, v5);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x231D4FD90);
}

uint64_t sub_231D4FE5C()
{
  return 0;
}

void sub_231D4FE68(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_231D4FE74()
{
  sub_231D53E74();
  return sub_231D7F000();
}

uint64_t sub_231D4FE9C()
{
  sub_231D53E74();
  return sub_231D7F00C();
}

uint64_t sub_231D4FEC4()
{
  sub_231D53E30();
  return sub_231D7F000();
}

uint64_t sub_231D4FEEC()
{
  sub_231D53E30();
  return sub_231D7F00C();
}

uint64_t sub_231D4FF14()
{
  sub_231D53DEC();
  return sub_231D7F000();
}

uint64_t sub_231D4FF3C()
{
  sub_231D53DEC();
  return sub_231D7F00C();
}

uint64_t sub_231D4FF64()
{
  sub_231D53DA8();
  return sub_231D7F000();
}

uint64_t sub_231D4FF8C()
{
  sub_231D53DA8();
  return sub_231D7F00C();
}

uint64_t sub_231D4FFB4()
{
  return 1;
}

uint64_t sub_231D4FFC8()
{
  sub_231D53F84();
  return sub_231D7F000();
}

uint64_t sub_231D4FFF0()
{
  sub_231D53F84();
  return sub_231D7F00C();
}

uint64_t sub_231D50018()
{
  sub_231D53F40();
  return sub_231D7F000();
}

uint64_t sub_231D50040()
{
  sub_231D53F40();
  return sub_231D7F00C();
}

uint64_t sub_231D50068@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_231D50094()
{
  sub_231D53EFC();
  return sub_231D7F000();
}

uint64_t sub_231D500BC()
{
  sub_231D53EFC();
  return sub_231D7F00C();
}

uint64_t sub_231D500E4()
{
  sub_231D53FC8();
  return sub_231D7F000();
}

uint64_t sub_231D5010C()
{
  sub_231D53FC8();
  return sub_231D7F00C();
}

uint64_t sub_231D50134()
{
  return sub_231D7EFC4();
}

uint64_t sub_231D50158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_231D53C88(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_231D50180()
{
  sub_231D53EB8();
  return sub_231D7F000();
}

uint64_t sub_231D501A8()
{
  sub_231D53EB8();
  return sub_231D7F00C();
}

uint64_t sub_231D501D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_231D4F208(a1, a2);
}

void sub_231D501E4(_QWORD *a1)
{
  sub_231D4E9A0(a1);
}

uint64_t sub_231D501FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = a2;
  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  MEMORY[0x24BDAC7A8](v3);
  v19 = (char *)&v17 - v4;
  sub_231D540F8(0, &qword_255F727D8, (uint64_t (*)(void))sub_231D51DF8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys, MEMORY[0x24BEE33E0]);
  v20 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - v7;
  v9 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_231D4DC30(a1, a1[3]);
  sub_231D51DF8();
  v13 = v21;
  sub_231D7EFE8();
  if (!v13)
  {
    v14 = v18;
    sub_231D4CD8C(&qword_255F727E0, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction, (uint64_t)&unk_231D8028C);
    v15 = (uint64_t)v19;
    sub_231D7EF1C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v20);
    sub_231D51E50(v15, (uint64_t)v11);
    sub_231D54154((uint64_t)v11, v14, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  }
  sub_231D4CEE8((uint64_t)a1);
  return sub_231D541F8((uint64_t)v11, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
}

uint64_t sub_231D5043C()
{
  sub_231D7EFB8();
  sub_231D7EFC4();
  return sub_231D7EFD0();
}

uint64_t sub_231D5047C()
{
  sub_231D7EFB8();
  sub_231D7EFC4();
  return sub_231D7EFD0();
}

uint64_t sub_231D504BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_231D53D00(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_231D504E4()
{
  sub_231D51DF8();
  return sub_231D7F000();
}

uint64_t sub_231D5050C()
{
  sub_231D51DF8();
  return sub_231D7F00C();
}

uint64_t sub_231D50534@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_231D501FC(a1, a2);
}

uint64_t sub_231D50548(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_231D540F8(0, &qword_25419BD48, (uint64_t (*)(void))sub_231D51DF8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - v5;
  sub_231D4DC30(a1, a1[3]);
  sub_231D51DF8();
  sub_231D7EFF4();
  type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  sub_231D4CD8C(&qword_25419BCA8, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction, (uint64_t)&unk_231D80264);
  sub_231D7EF4C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_231D50678()
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void (*v58)(char *, uint64_t);
  char *v59;
  char *v60;
  _QWORD v61[9];
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t ObjectType;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81[4];

  ObjectType = swift_getObjectType();
  v62 = sub_231D7DE90();
  v61[8] = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v61[7] = (char *)v61 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_231D7DB18();
  v65 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v64 = (char *)v61 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D51EA4();
  v61[4] = v2;
  v61[3] = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v61[2] = (char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v68 = (char *)v61 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)v61 - v9;
  v10 = sub_231D7E22C();
  MEMORY[0x24BDAC7A8](v10);
  v61[6] = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_231D7E9B8();
  v77 = *(_QWORD *)(v78 - 8);
  v12 = MEMORY[0x24BDAC7A8](v78);
  v73 = (char *)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v61[1] = (char *)v61 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)v61 - v16;
  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  MEMORY[0x24BDAC7A8](v17);
  v72 = (uint64_t)v61 - v18;
  v74 = sub_231D7E0C4();
  v75 = *(_QWORD *)(v74 - 8);
  v19 = MEMORY[0x24BDAC7A8](v74);
  v67 = (char *)v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v76 = (char *)v61 - v21;
  v22 = sub_231D7E6F4();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v61[5] = (char *)v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v61 - v26;
  sub_231D51EF8(0, &qword_255F727F0, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)v61 - v29;
  v31 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  v32 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)v61 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E7C0();
  sub_231D4CD8C(qword_255F727F8, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData, (uint64_t)&unk_231D8007C);
  sub_231D4CD8C(&qword_25419BCC8, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData, (uint64_t)&unk_231D80054);
  sub_231D7E6E8();
  v35 = *(void (**)(char *, uint64_t))(v23 + 8);
  v35(v27, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) == 1)
  {
    sub_231D51F44((uint64_t)v30);
    v36 = (uint64_t)v73;
    sub_231D7E994();
    v37 = sub_231D7E9AC();
    v38 = sub_231D7EC58();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v81[0] = v40;
      *(_DWORD *)v39 = 136315138;
      v41 = sub_231D7F018();
      v80 = sub_231D6475C(v41, v42, v81);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231D49000, v37, v38, "[%s] Could not access action handler user data!", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v40, -1, -1);
      MEMORY[0x2348F0170](v39, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v36, v78);
  }
  else
  {
    sub_231D51FE4((uint64_t)v30, (uint64_t)v34, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
    sub_231D7E7C0();
    v44 = (void *)sub_231D7E6DC();
    v35(v27, v22);
    sub_231D7E7C0();
    sub_231D7E6D0();
    v35(v27, v22);
    sub_231D4DC30(v81, v81[3]);
    v45 = (void *)sub_231D7E6A0();
    sub_231D4CEE8((uint64_t)v81);
    sub_231D7E7C0();
    v46 = (void *)sub_231D7E6DC();
    v35(v27, v22);
    sub_231D7ECA0();

    sub_231D7E7C0();
    v47 = v76;
    sub_231D7DED8();
    v35(v27, v22);
    v48 = v72;
    sub_231D51F90((uint64_t)v34, v72);
    v49 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 48))(v48, 1, v49);
    v73 = v34;
    if (v50 != 1)
    {
      v60 = (char *)&loc_231D50ECC + *((int *)qword_231D51740 + swift_getEnumCaseMultiPayload());
      __asm { BR              X10 }
    }
    v51 = v70;
    sub_231D7E994();
    v52 = sub_231D7E9AC();
    v53 = sub_231D7EC4C();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v80 = v55;
      *(_DWORD *)v54 = 136315138;
      v56 = sub_231D7F018();
      v79 = sub_231D6475C(v56, v57, &v80);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231D49000, v52, v53, "[%s] No tap action given (likely due to error on generation side, doing nothing", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v55, -1, -1);
      MEMORY[0x2348F0170](v54, -1, -1);

      (*(void (**)(char *, uint64_t))(v77 + 8))(v51, v78);
      v58 = *(void (**)(char *, uint64_t))(v75 + 8);
      v59 = v76;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v77 + 8))(v51, v78);
      v58 = *(void (**)(char *, uint64_t))(v75 + 8);
      v59 = v47;
    }
    v58(v59, v74);
    sub_231D4CEE8((uint64_t)v81);
    return sub_231D541F8((uint64_t)v73, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  }
}

uint64_t sub_231D51764(char a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = sub_231D7E9B8();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_231D7E994();
    v9 = a2;
    v10 = a2;
    v11 = sub_231D7E9AC();
    v12 = sub_231D7EC4C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v24[0] = v22;
      *(_DWORD *)v13 = 136315394;
      v14 = sub_231D7F018();
      v23 = sub_231D6475C(v14, v15, v24);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2112;
      if (a2)
      {
        v16 = a2;
        v17 = _swift_stdlib_bridgeErrorToNSError();
        v23 = v17;
        sub_231D7EDB4();
      }
      else
      {
        v23 = 0;
        sub_231D7EDB4();
        v17 = 0;
      }
      v18 = v21;
      *v21 = v17;

      _os_log_impl(&dword_231D49000, v11, v12, "[%s] Error when setting feature setting: %@", (uint8_t *)v13, 0x16u);
      sub_231D51EF8(0, (unint64_t *)&qword_25419BB50, (void (*)(uint64_t))sub_231D52084);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v18, -1, -1);
      v19 = v22;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v19, -1, -1);
      MEMORY[0x2348F0170](v13, -1, -1);
    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_231D51A08(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v3 = sub_231D7E6F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v8 = sub_231D7E7CC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id sub_231D51AB0()
{
  return sub_231D51D34(type metadata accessor for WalkingSteadinessFeatureStatusActionHandler);
}

uint64_t sub_231D51ABC()
{
  return type metadata accessor for WalkingSteadinessFeatureStatusActionHandler(0);
}

id sub_231D51AC8(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  objc_super v12;
  _QWORD v13[4];

  v2 = v1;
  sub_231D7E6D0();
  sub_231D4DC30(v13, v13[3]);
  sub_231D7E6A0();
  v4 = (void *)sub_231D7E6DC();
  sub_231D7ECA0();

  v5 = objc_allocWithZone((Class)sub_231D7E898());
  v6 = (void *)sub_231D7E88C();
  sub_231D4CEE8((uint64_t)v13);
  objc_msgSend(v6, sel_setAccessType_, 3);
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for HealthDetailsModalViewController();
  v7 = objc_msgSendSuper2(&v12, sel_initWithRootViewController_, v6);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithBarButtonSystemItem_target_action_, 0, v7, sel_dismissPresentedViewController);
  v9 = objc_msgSend(v6, sel_navigationItem);
  objc_msgSend(v9, sel_setLeftBarButtonItem_, v8);

  v10 = sub_231D7E6F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  return v7;
}

id sub_231D51D28()
{
  return sub_231D51D34((uint64_t (*)(_QWORD))type metadata accessor for HealthDetailsModalViewController);
}

id sub_231D51D34(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for HealthDetailsModalViewController()
{
  return objc_opt_self();
}

uint64_t sub_231D51D8C()
{
  return sub_231D4CD8C(&qword_25419BBA0, type metadata accessor for WalkingSteadinessFeatureStatusActionHandler, (uint64_t)&unk_231D800D4);
}

uint64_t sub_231D51DB8()
{
  return sub_231D4CD8C(&qword_25419BCD0, MEMORY[0x24BE448E0], MEMORY[0x24BE448D8]);
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(uint64_t a1)
{
  return sub_231D4CE74(a1, (uint64_t *)&unk_25419BB00);
}

unint64_t sub_231D51DF8()
{
  unint64_t result;

  result = qword_25419BCB0;
  if (!qword_25419BCB0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D802B4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BCB0);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(uint64_t a1)
{
  return sub_231D4CE74(a1, (uint64_t *)&unk_25419BB18);
}

uint64_t sub_231D51E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_231D51EA4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F727E8)
  {
    v0 = sub_231D7ECC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F727E8);
  }
}

void sub_231D51EF8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_231D7EDA8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_231D51F44(uint64_t a1)
{
  uint64_t v2;

  sub_231D51EF8(0, &qword_255F727F0, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D51F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_231D51FE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_231D52028()
{
  return swift_deallocObject();
}

uint64_t sub_231D52038(char a1, void *a2)
{
  return sub_231D51764(a1, a2);
}

uint64_t sub_231D52040(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_231D52084()
{
  unint64_t result;

  result = qword_25419BB48;
  if (!qword_25419BB48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25419BB48);
  }
  return result;
}

uint64_t sub_231D520CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys;
}

uint64_t *sub_231D520E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    v8 = *(int *)(v7 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_231D7DEA8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(v7 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 24));
    sub_231D7E514();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_231D52238(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if (result <= 1)
  {
    v3 = a1 + *(int *)(type metadata accessor for WalkingSteadinessHealthChecklistSettingsState() + 20);
    v4 = sub_231D7DEA8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

_BYTE *sub_231D522B4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    v7 = *(int *)(v6 + 20);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_231D7DEA8();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
    sub_231D7E514();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_BYTE *sub_231D523E0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_231D541F8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      v7 = *(int *)(v6 + 20);
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = sub_231D7DEA8();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
      sub_231D7E514();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_BYTE *sub_231D52524(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    v7 = *(int *)(v6 + 20);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_231D7DEA8();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_BYTE *sub_231D52648(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_231D541F8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      v7 = *(int *)(v6 + 20);
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = sub_231D7DEA8();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_231D52784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_231D52790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_231D527A0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_231D527B0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_231D52814(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() > 1)
      {
        memcpy(a1, a2, *(_QWORD *)(v8 + 64));
      }
      else
      {
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v10 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        v11 = *(int *)(v10 + 20);
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_231D7DEA8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
        *(uint64_t *)((char *)a1 + *(int *)(v10 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v10 + 24));
        sub_231D7E514();
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_231D529D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    result = swift_getEnumCaseMultiPayload();
    if (result <= 1)
    {
      v4 = a1 + *(int *)(type metadata accessor for WalkingSteadinessHealthChecklistSettingsState() + 20);
      v5 = sub_231D7DEA8();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

_BYTE *sub_231D52A84(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;

  v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      *a1 = *a2;
      v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      v8 = *(int *)(v7 + 20);
      v9 = &a1[v8];
      v10 = &a2[v8];
      v11 = sub_231D7DEA8();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      *(_QWORD *)&a1[*(int *)(v7 + 24)] = *(_QWORD *)&a2[*(int *)(v7 + 24)];
      sub_231D7E514();
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

_BYTE *sub_231D52C20(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_BYTE *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;

  v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2)
        return a1;
      sub_231D541F8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      if (swift_getEnumCaseMultiPayload() <= 1)
      {
        *a1 = *a2;
        v16 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        v17 = *(int *)(v16 + 20);
        v18 = &a1[v17];
        v19 = &a2[v17];
        v20 = sub_231D7DEA8();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
        *(_QWORD *)&a1[*(int *)(v16 + 24)] = *(_QWORD *)&a2[*(int *)(v16 + 24)];
        sub_231D7E514();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v10 = *(_QWORD *)(v5 + 64);
      goto LABEL_7;
    }
    sub_231D541F8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
LABEL_6:
    sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    v10 = *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64);
LABEL_7:
    memcpy(a1, a2, v10);
    return a1;
  }
  if (v8)
    goto LABEL_6;
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    *a1 = *a2;
    v11 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    v12 = *(int *)(v11 + 20);
    v13 = &a1[v12];
    v14 = &a2[v12];
    v15 = sub_231D7DEA8();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    *(_QWORD *)&a1[*(int *)(v11 + 24)] = *(_QWORD *)&a2[*(int *)(v11 + 24)];
    sub_231D7E514();
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

_BYTE *sub_231D52F00(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;

  v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      *a1 = *a2;
      v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      v8 = *(int *)(v7 + 20);
      v9 = &a1[v8];
      v10 = &a2[v8];
      v11 = sub_231D7DEA8();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      *(_QWORD *)&a1[*(int *)(v7 + 24)] = *(_QWORD *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

_BYTE *sub_231D53094(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_BYTE *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;

  v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2)
        return a1;
      sub_231D541F8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      if (swift_getEnumCaseMultiPayload() <= 1)
      {
        *a1 = *a2;
        v16 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        v17 = *(int *)(v16 + 20);
        v18 = &a1[v17];
        v19 = &a2[v17];
        v20 = sub_231D7DEA8();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
        *(_QWORD *)&a1[*(int *)(v16 + 24)] = *(_QWORD *)&a2[*(int *)(v16 + 24)];
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v10 = *(_QWORD *)(v5 + 64);
      goto LABEL_7;
    }
    sub_231D541F8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
LABEL_6:
    sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    v10 = *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64);
LABEL_7:
    memcpy(a1, a2, v10);
    return a1;
  }
  if (v8)
    goto LABEL_6;
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    *a1 = *a2;
    v11 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    v12 = *(int *)(v11 + 20);
    v13 = &a1[v12];
    v14 = &a2[v12];
    v15 = sub_231D7DEA8();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
    *(_QWORD *)&a1[*(int *)(v11 + 24)] = *(_QWORD *)&a2[*(int *)(v11 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_231D53364()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_231D53370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_231D533BC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_231D533C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D51EF8(0, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_231D53418()
{
  unint64_t v0;

  sub_231D51EF8(319, &qword_25419BB10, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_231D53494()
{
  unint64_t result;

  result = qword_255F72828;
  if (!qword_255F72828)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8023C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255F72828);
  }
  return result;
}

unint64_t sub_231D534DC()
{
  unint64_t result;

  result = qword_25419BCC0;
  if (!qword_25419BCC0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D801AC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BCC0);
  }
  return result;
}

unint64_t sub_231D53524()
{
  unint64_t result;

  result = qword_25419BCB8;
  if (!qword_25419BCB8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D801D4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BCB8);
  }
  return result;
}

void sub_231D53568(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  v4 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  sub_231D54198();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 + *(int *)(v8 + 48) - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D54154(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  sub_231D54154(a2, (uint64_t)v10, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  v11 = (char *)sub_231D536C4 + 4 * byte_231D7FFD4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_231D536C4()
{
  uint64_t v0;
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v8;

  sub_231D54154(v0, (uint64_t)v2, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_231D541F8((uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
    v5 = 0;
    v6 = (uint64_t (*)(_QWORD))sub_231D54198;
  }
  else
  {
    sub_231D51FE4(v3, (uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
    if (*v2 == *v1
      && (sub_231D7DE9C() & 1) != 0
      && (v8 = *(int *)(*(_QWORD *)(v4 - 88) + 24), (sub_231D605E0(*(_QWORD **)&v2[v8], *(_QWORD **)&v1[v8]) & 1) != 0))
    {
      sub_231D541F8((uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      sub_231D541F8((uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      v5 = 1;
    }
    else
    {
      sub_231D541F8((uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      sub_231D541F8((uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      v5 = 0;
    }
    v6 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
  }
  sub_231D541F8(v0, v6);
  return v5;
}

uint64_t sub_231D53944(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000231D82750 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000231D82770 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000231D82790 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x8000000231D827B0 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000231D827D0 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000231D827F0 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000022 && a2 == 0x8000000231D82810 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000231D82840 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000231D82860)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v5 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_231D53C88(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_231D53CF4()
{
  return 12383;
}

uint64_t sub_231D53D00(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6F69746341706174 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_231D53D8C()
{
  return 0x6F69746341706174;
}

unint64_t sub_231D53DA8()
{
  unint64_t result;

  result = qword_25419BC48;
  if (!qword_25419BC48)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80BBC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC48);
  }
  return result;
}

unint64_t sub_231D53DEC()
{
  unint64_t result;

  result = qword_25419BC78;
  if (!qword_25419BC78)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80B6C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC78);
  }
  return result;
}

unint64_t sub_231D53E30()
{
  unint64_t result;

  result = qword_25419BC90;
  if (!qword_25419BC90)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80B1C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC90);
  }
  return result;
}

unint64_t sub_231D53E74()
{
  unint64_t result;

  result = qword_25419BC60;
  if (!qword_25419BC60)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80ACC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC60);
  }
  return result;
}

unint64_t sub_231D53EB8()
{
  unint64_t result;

  result = qword_25419BBB8;
  if (!qword_25419BBB8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80A7C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBB8);
  }
  return result;
}

unint64_t sub_231D53EFC()
{
  unint64_t result;

  result = qword_25419BBD0;
  if (!qword_25419BBD0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80A2C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBD0);
  }
  return result;
}

unint64_t sub_231D53F40()
{
  unint64_t result;

  result = qword_25419BC30;
  if (!qword_25419BC30)
  {
    result = MEMORY[0x2348F00E0](&unk_231D809DC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC30);
  }
  return result;
}

unint64_t sub_231D53F84()
{
  unint64_t result;

  result = qword_25419BBE8;
  if (!qword_25419BBE8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8098C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBE8);
  }
  return result;
}

unint64_t sub_231D53FC8()
{
  unint64_t result;

  result = qword_25419BC18;
  if (!qword_25419BC18)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8093C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC18);
  }
  return result;
}

unint64_t sub_231D5400C()
{
  unint64_t result;

  result = qword_25419BC00;
  if (!qword_25419BC00)
  {
    result = MEMORY[0x2348F00E0](&unk_231D808EC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC00);
  }
  return result;
}

void sub_231D54050()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255F72880)
  {
    sub_231D540BC();
    sub_231D7EE68();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255F72880);
  }
}

unint64_t sub_231D540BC()
{
  unint64_t result;

  result = qword_255F72888;
  if (!qword_255F72888)
  {
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255F72888);
  }
  return result;
}

void sub_231D540F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v9 = a3();
    v10 = a5(a1, a4, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

uint64_t sub_231D54154(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_231D54198()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255F72898)
  {
    type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255F72898);
  }
}

uint64_t sub_231D541F8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for WalkingSteadinessHealthChecklistSettingsState.SwitchState(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_231D5431C + 4 * byte_231D7FFE2[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_231D54350 + 4 * byte_231D7FFDD[v4]))();
}

uint64_t sub_231D54350(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D54358(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x231D54360);
  return result;
}

uint64_t sub_231D5436C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x231D54374);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_231D54378(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D54380(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D5438C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_231D54394(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys;
}

uint64_t _s17MobilityAppPlugin51WalkingSteadinessFeatureStatusActionHandlerUserDataV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s17MobilityAppPlugin51WalkingSteadinessFeatureStatusActionHandlerUserDataV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_231D5447C + 4 * byte_231D7FFE7[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_231D5449C + 4 * byte_231D7FFEC[v4]))();
}

_BYTE *sub_231D5447C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_231D5449C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_231D544A4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_231D544AC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_231D544B4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_231D544BC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys;
}

unint64_t sub_231D5451C()
{
  unint64_t result;

  result = qword_255F728A0;
  if (!qword_255F728A0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80664, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255F728A0);
  }
  return result;
}

unint64_t sub_231D54564()
{
  unint64_t result;

  result = qword_255F728A8;
  if (!qword_255F728A8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D807BC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255F728A8);
  }
  return result;
}

unint64_t sub_231D545AC()
{
  unint64_t result;

  result = qword_255F728B0;
  if (!qword_255F728B0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D808C4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255F728B0);
  }
  return result;
}

unint64_t sub_231D545F4()
{
  unint64_t result;

  result = qword_25419BC10;
  if (!qword_25419BC10)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80834, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC10);
  }
  return result;
}

unint64_t sub_231D5463C()
{
  unint64_t result;

  result = qword_25419BC08;
  if (!qword_25419BC08)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8085C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC08);
  }
  return result;
}

unint64_t sub_231D54684()
{
  unint64_t result;

  result = qword_25419BC28;
  if (!qword_25419BC28)
  {
    result = MEMORY[0x2348F00E0](&unk_231D807E4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC28);
  }
  return result;
}

unint64_t sub_231D546CC()
{
  unint64_t result;

  result = qword_25419BC20;
  if (!qword_25419BC20)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8080C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC20);
  }
  return result;
}

unint64_t sub_231D54714()
{
  unint64_t result;

  result = qword_25419BBF8;
  if (!qword_25419BBF8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8072C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBF8);
  }
  return result;
}

unint64_t sub_231D5475C()
{
  unint64_t result;

  result = qword_25419BBF0;
  if (!qword_25419BBF0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80754, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBF0);
  }
  return result;
}

unint64_t sub_231D547A4()
{
  unint64_t result;

  result = qword_25419BC40;
  if (!qword_25419BC40)
  {
    result = MEMORY[0x2348F00E0](&unk_231D806DC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC40);
  }
  return result;
}

unint64_t sub_231D547EC()
{
  unint64_t result;

  result = qword_25419BC38;
  if (!qword_25419BC38)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80704, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC38);
  }
  return result;
}

unint64_t sub_231D54834()
{
  unint64_t result;

  result = qword_25419BBE0;
  if (!qword_25419BBE0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8068C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBE0);
  }
  return result;
}

unint64_t sub_231D5487C()
{
  unint64_t result;

  result = qword_25419BBD8;
  if (!qword_25419BBD8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D806B4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBD8);
  }
  return result;
}

unint64_t sub_231D548C4()
{
  unint64_t result;

  result = qword_25419BBC8;
  if (!qword_25419BBC8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D805D4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBC8);
  }
  return result;
}

unint64_t sub_231D5490C()
{
  unint64_t result;

  result = qword_25419BBC0;
  if (!qword_25419BBC0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D805FC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BBC0);
  }
  return result;
}

unint64_t sub_231D54954()
{
  unint64_t result;

  result = qword_25419BC70;
  if (!qword_25419BC70)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80584, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC70);
  }
  return result;
}

unint64_t sub_231D5499C()
{
  unint64_t result;

  result = qword_25419BC68;
  if (!qword_25419BC68)
  {
    result = MEMORY[0x2348F00E0](&unk_231D805AC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC68);
  }
  return result;
}

unint64_t sub_231D549E4()
{
  unint64_t result;

  result = qword_25419BCA0;
  if (!qword_25419BCA0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80534, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BCA0);
  }
  return result;
}

unint64_t sub_231D54A2C()
{
  unint64_t result;

  result = qword_25419BC98;
  if (!qword_25419BC98)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8055C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC98);
  }
  return result;
}

unint64_t sub_231D54A74()
{
  unint64_t result;

  result = qword_25419BC88;
  if (!qword_25419BC88)
  {
    result = MEMORY[0x2348F00E0](&unk_231D804E4, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC88);
  }
  return result;
}

unint64_t sub_231D54ABC()
{
  unint64_t result;

  result = qword_25419BC80;
  if (!qword_25419BC80)
  {
    result = MEMORY[0x2348F00E0](&unk_231D8050C, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC80);
  }
  return result;
}

unint64_t sub_231D54B04()
{
  unint64_t result;

  result = qword_25419BC58;
  if (!qword_25419BC58)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80494, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC58);
  }
  return result;
}

unint64_t sub_231D54B4C()
{
  unint64_t result;

  result = qword_25419BC50;
  if (!qword_25419BC50)
  {
    result = MEMORY[0x2348F00E0](&unk_231D804BC, &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BC50);
  }
  return result;
}

uint64_t sub_231D54B9C()
{
  uint64_t v0;

  v0 = sub_231D7E9B8();
  sub_231D4E6D8(v0, qword_255F728C0);
  sub_231D4E718(v0, (uint64_t)qword_255F728C0);
  return sub_231D7E9A0();
}

uint64_t sub_231D54C60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_231D7EB74();
  v5 = v4;
  if (v3 == sub_231D7EB74() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_231D7EF88();
  sub_231D7E514();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    v12 = sub_231D7EB74();
    v14 = v13;
    if (v12 == sub_231D7EB74() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_7;
    ++v10;
    if (v11 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

void sub_231D54DB4(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;

  if (objc_msgSend(a1, sel_status) == (id)1)
  {
    if (qword_255F724D0 != -1)
      swift_once();
    v4 = sub_231D7E9B8();
    sub_231D4E718(v4, (uint64_t)qword_255F728C0);
    v5 = a2;
    v6 = a1;
    v20 = v5;
    v7 = v6;
    v8 = sub_231D7E9AC();
    v9 = sub_231D7EC64();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v21 = v11;
      *(_DWORD *)v10 = 136446979;
      v12 = sub_231D7F018();
      sub_231D6475C(v12, v13, &v21);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2082;
      sub_231D6475C(0xD00000000000003BLL, 0x8000000231D82940, &v21);
      sub_231D7EDB4();
      *(_WORD *)(v10 + 22) = 2081;
      v14 = sub_231D7EB74();
      sub_231D6475C(v14, v15, &v21);
      sub_231D7EDB4();

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 32) = 2082;
      v16 = objc_msgSend(v7, sel_error);
      sub_231D51EF8(0, &qword_255F72968, (void (*)(uint64_t))sub_231D56628);
      v17 = sub_231D7ED9C();
      v19 = v18;

      sub_231D6475C(v17, v19, &v21);
      sub_231D7EDB4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231D49000, v8, v9, "[%{public}s.%{public}s] Unable to submit notification interaction analytics for category: %{private}s error: %{public}s", (uint8_t *)v10, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v11, -1, -1);
      MEMORY[0x2348F0170](v10, -1, -1);

    }
    else
    {

    }
  }
}

void sub_231D550C8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_231D55118(char a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t (*v24)(_QWORD);
  uint64_t v25;
  uint64_t v26;

  v6 = sub_231D7DAE8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    if (qword_255F724D0 != -1)
      swift_once();
    v11 = sub_231D7E9B8();
    sub_231D4E718(v11, (uint64_t)qword_255F728C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
    v12 = sub_231D7E9AC();
    v13 = sub_231D7EC58();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v24 = a3;
      v15 = v14;
      v23 = swift_slowAlloc();
      v26 = v23;
      *(_DWORD *)v15 = 136446722;
      v16 = sub_231D7F018();
      v25 = sub_231D6475C(v16, v17, &v26);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      v25 = sub_231D6475C(0xD00000000000003BLL, 0x8000000231D82940, &v26);
      sub_231D7EDB4();
      *(_WORD *)(v15 + 22) = 2082;
      sub_231D565BC(&qword_255F72960, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v18 = sub_231D7EF64();
      v25 = sub_231D6475C(v18, v19, &v26);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      _os_log_impl(&dword_231D49000, v12, v13, "[%{public}s.%{public}s] Failed to navigate to: %{public}s", (uint8_t *)v15, 0x20u);
      v20 = v23;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v20, -1, -1);
      v21 = v15;
      a3 = v24;
      MEMORY[0x2348F0170](v21, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }

  }
  return a3(v8);
}

uint64_t sub_231D553D4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_231D5553C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MobilityAppPluginAppDelegate()
{
  return objc_opt_self();
}

uint64_t sub_231D555A0(uint64_t a1, uint64_t a2)
{
  return sub_231D565BC(&qword_25419BD88, a2, (uint64_t (*)(uint64_t))type metadata accessor for MobilityAppPluginAppDelegate, (uint64_t)&unk_231D80CC8);
}

id sub_231D555CC()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_231D555F0(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 7)
    return 0;
  swift_unknownObjectRetain();
  return v1;
}

uint64_t sub_231D55624()
{
  swift_getObjectType();
  return sub_231D7E814();
}

uint64_t sub_231D5564C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void (*v23)(_BYTE *, uint64_t);
  _BYTE v25[16];
  _BYTE *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_231D51EF8(0, (unint64_t *)&unk_255F72950, (void (*)(uint64_t))MEMORY[0x24BE42678]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v25[-v1];
  v3 = sub_231D7E658();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v25[-v8];
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  v11 = sub_231D7DD40();
  v12 = v10;
  v13 = sub_231D7DD34();
  v14 = sub_231D7DC50();
  v15 = sub_231D7DC44();
  v32 = v14;
  v33 = MEMORY[0x24BE47240];
  v31 = v15;
  v16 = v12;
  v17 = objc_msgSend(v16, sel_profileIdentifier);
  v18 = sub_231D7E22C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v2, 1, 1, v18);
  sub_231D7E2F8();

  sub_231D56488((uint64_t)v2, (unint64_t *)&unk_255F72950, (void (*)(uint64_t))MEMORY[0x24BE42678]);
  v29 = v11;
  v30 = MEMORY[0x24BE47D88];
  v28 = v13;
  swift_retain();
  sub_231D7E634();
  v19 = v4;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v7, v9, v3);
  v20 = objc_allocWithZone((Class)type metadata accessor for MobilityInternalSettingsViewController(0));
  v21 = (void *)sub_231D7E640();
  sub_231D7E55C();
  v26 = v7;
  v27 = v21;
  sub_231D7E550();
  v22 = sub_231D7E820();

  v23 = *(void (**)(_BYTE *, uint64_t))(v19 + 8);
  v23(v7, v3);

  swift_release();
  v23(v9, v3);
  return v22;
}

uint64_t sub_231D558B4()
{
  uint64_t v0;

  return sub_231D4B384(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_231D558BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_231D558E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_231D558F0(void *a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v28)(unint64_t, _BYTE *, uint64_t);
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  void (*v57)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v58;
  NSObject *v59;
  os_log_type_t v60;
  int v61;
  _BOOL4 v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE *v74;
  void *v75;
  _BYTE *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t (**v81)(void);
  void *v82;
  id v83;
  _BYTE v84[4];
  int v85;
  os_log_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(unint64_t, _BYTE *, uint64_t);
  id v90;
  uint64_t v91;
  _BYTE *v92;
  _BYTE *v93;
  _BYTE *v94;
  char *v95;
  uint64_t (*v96)(void);
  uint64_t aBlock;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;

  v96 = a3;
  ObjectType = swift_getObjectType();
  sub_231D51EF8(0, (unint64_t *)&qword_25419BD58, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v84[-v7];
  v9 = sub_231D7DAE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v93 = &v84[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v12);
  v92 = &v84[-v14];
  MEMORY[0x24BDAC7A8](v13);
  v16 = &v84[-v15];
  v17 = objc_msgSend(a1, sel_notification);
  sub_231D7EC88();

  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_231D56488((uint64_t)v8, (unint64_t *)&qword_25419BD58, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    if (qword_255F724D0 != -1)
      swift_once();
    v18 = sub_231D7E9B8();
    sub_231D4E718(v18, (uint64_t)qword_255F728C0);
    v19 = sub_231D7E9AC();
    v20 = sub_231D7EC4C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v22 = a2;
      v23 = swift_slowAlloc();
      aBlock = v23;
      *(_DWORD *)v21 = 136446466;
      v24 = sub_231D7F018();
      v103 = sub_231D6475C(v24, v25, &aBlock);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      v103 = sub_231D6475C(0xD00000000000003BLL, 0x8000000231D82940, &aBlock);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v19, v20, "[%{public}s.%{public}s] Unable to resolve notification. No URL present.", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      v26 = v23;
      a2 = v22;
      MEMORY[0x2348F0170](v26, -1, -1);
      MEMORY[0x2348F0170](v21, -1, -1);
    }

    return a2();
  }
  v28 = *(void (**)(unint64_t, _BYTE *, uint64_t))(v10 + 32);
  v94 = v16;
  v89 = v28;
  v28((unint64_t)v16, v8, v9);
  v29 = objc_msgSend(a1, sel_notification);
  v30 = objc_msgSend(v29, sel_request);

  v31 = objc_msgSend(v30, sel_content);
  v32 = objc_msgSend(v31, sel_categoryIdentifier);

  if (!v32)
  {
    sub_231D7EB74();
    v32 = (id)sub_231D7EB44();
    swift_bridgeObjectRelease();
  }
  v33 = (id)HKMobilityAllWalkingSteadinessNotificationCategories();
  type metadata accessor for HKMobilityNotificationCategory(0);
  v34 = sub_231D7EBE0();

  LOBYTE(v33) = sub_231D54C60((uint64_t)v32, v34);
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
  {
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
    v36 = v32;
    v37 = objc_msgSend(a1, sel_actionIdentifier);
    v91 = v9;
    v38 = v37;
    sub_231D7EB74();
    v90 = v32;

    v39 = objc_allocWithZone(MEMORY[0x24BE46DA0]);
    v40 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
    v41 = objc_msgSend(v39, sel_initWithHealthStore_category_action_, v35, v36, v40);

    v42 = *(void **)&v95[OBJC_IVAR____TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate_analyticsManager];
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = v36;
    *(_QWORD *)(v43 + 24) = ObjectType;
    v101 = sub_231D56620;
    v102 = v43;
    aBlock = MEMORY[0x24BDAC760];
    v98 = 1107296256;
    v99 = sub_231D550C8;
    v100 = &unk_2500C8908;
    v44 = _Block_copy(&aBlock);
    v45 = v36;
    v46 = v41;
    v32 = v90;
    v9 = v91;
    swift_release();
    objc_msgSend(v42, sel_submitNotificationInteractionEventWithDataSource_resultHandler_, v46, v44);
    _Block_release(v44);

  }
  v47 = objc_msgSend(a1, sel_actionIdentifier);
  v48 = sub_231D7EB74();
  v50 = v49;

  if (v48 == sub_231D7EB74() && v50 == v51)
  {
    v52 = swift_bridgeObjectRelease_n();
LABEL_15:
    ((void (*)(uint64_t))a2)(v52);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v10 + 8))(v94, v9);
  }
  v53 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  v52 = swift_bridgeObjectRelease();
  if ((v53 & 1) != 0)
    goto LABEL_15;
  v54 = v9;
  v55 = v94;
  if (qword_255F724D0 != -1)
    swift_once();
  v56 = sub_231D7E9B8();
  sub_231D4E718(v56, (uint64_t)qword_255F728C0);
  v57 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16);
  v58 = v92;
  v91 = v54;
  v57(v92, v55, v54);
  v59 = sub_231D7E9AC();
  v60 = sub_231D7EC64();
  v61 = v60;
  v62 = os_log_type_enabled(v59, v60);
  v90 = v32;
  v88 = ObjectType;
  if (v62)
  {
    v63 = v58;
    v64 = swift_slowAlloc();
    v87 = swift_slowAlloc();
    aBlock = v87;
    *(_DWORD *)v64 = 136446722;
    v86 = v59;
    v65 = sub_231D7F018();
    v85 = v61;
    v103 = sub_231D6475C(v65, v66, &aBlock);
    sub_231D7EDB4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2082;
    v103 = sub_231D6475C(0xD00000000000003BLL, 0x8000000231D82940, &aBlock);
    sub_231D7EDB4();
    *(_WORD *)(v64 + 22) = 2082;
    v95 = (char *)(v64 + 24);
    sub_231D565BC(&qword_255F72960, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v67 = v57;
    v68 = v91;
    v69 = sub_231D7EF64();
    v103 = sub_231D6475C(v69, v70, &aBlock);
    sub_231D7EDB4();
    swift_bridgeObjectRelease();
    v71 = v68;
    v57 = v67;
    v95 = *(char **)(v10 + 8);
    ((void (*)(_BYTE *, uint64_t))v95)(v63, v71);
    v59 = v86;
    _os_log_impl(&dword_231D49000, v86, (os_log_type_t)v85, "[%{public}s.%{public}s Attempting to navigate to: %{public}s", (uint8_t *)v64, 0x20u);
    v72 = v87;
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v72, -1, -1);
    MEMORY[0x2348F0170](v64, -1, -1);
  }
  else
  {
    v95 = *(char **)(v10 + 8);
    ((void (*)(_BYTE *, uint64_t))v95)(v58, v91);
  }

  v73 = v10;
  v92 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v74 = v94;
  v75 = (void *)sub_231D7DAD0();
  v76 = v93;
  v77 = v91;
  v57(v93, v74, v91);
  v78 = (*(unsigned __int8 *)(v73 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
  v79 = (v11 + v78 + 7) & 0xFFFFFFFFFFFFFFF8;
  v80 = swift_allocObject();
  v89(v80 + v78, v76, v77);
  v81 = (uint64_t (**)(void))(v80 + v79);
  *v81 = a2;
  v81[1] = v96;
  *(_QWORD *)(v80 + ((v79 + 23) & 0xFFFFFFFFFFFFFFF8)) = v88;
  v101 = sub_231D56544;
  v102 = v80;
  aBlock = MEMORY[0x24BDAC760];
  v98 = 1107296256;
  v99 = sub_231D553D4;
  v100 = &unk_2500C88B8;
  v82 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v83 = v92;
  objc_msgSend(v92, sel_openURL_withCompletionHandler_, v75, v82);
  _Block_release(v82);

  return ((uint64_t (*)(_BYTE *, uint64_t))v95)(v74, v77);
}

uint64_t sub_231D562A4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  swift_getObjectType();
  if (qword_255F724D0 != -1)
    swift_once();
  v2 = sub_231D7E9B8();
  sub_231D4E718(v2, (uint64_t)qword_255F728C0);
  v3 = sub_231D7E9AC();
  v4 = sub_231D7EC64();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136446466;
    v7 = sub_231D7F018();
    sub_231D6475C(v7, v8, &v10);
    sub_231D7EDB4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2082;
    sub_231D6475C(0xD00000000000003CLL, 0x8000000231D82900, &v10);
    sub_231D7EDB4();
    _os_log_impl(&dword_231D49000, v3, v4, "[%{public}s.%{public}s]", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v6, -1, -1);
    MEMORY[0x2348F0170](v5, -1, -1);
  }

  return a1(26);
}

uint64_t sub_231D5647C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_231D56488(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_231D51EF8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_231D564C4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_231D7DAE8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D56544(char a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_231D7DAE8() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_231D55118(a1, v1 + v4, *(uint64_t (**)(_QWORD))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_231D565A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D565B4()
{
  return swift_release();
}

uint64_t sub_231D565BC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2348F00E0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_231D565FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_231D56620(void *a1)
{
  uint64_t v1;

  sub_231D54DB4(a1, *(void **)(v1 + 16));
}

unint64_t sub_231D56628()
{
  unint64_t result;

  result = qword_25419BD70[0];
  if (!qword_25419BD70[0])
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_25419BD70);
  }
  return result;
}

ValueMetadata *type metadata accessor for DataTypeDetailConfiguration.ComponentIdentifier.WalkingSteadiness()
{
  return &type metadata for DataTypeDetailConfiguration.ComponentIdentifier.WalkingSteadiness;
}

uint64_t type metadata accessor for WalkingSteadinessViewController(uint64_t a1)
{
  return sub_231D4CE74(a1, qword_255F72A30);
}

uint64_t sub_231D566AC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_231D566E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void (*v12)(char *, _QWORD, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  unint64_t v24;

  v1 = sub_231D7E5B0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_231D7E664();
  v20 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void **)(v0 + 16);
  sub_231D7E5BC();
  v9 = v8;
  sub_231D7E5EC();
  *((_QWORD *)&v23 + 1) = &_s43WalkingSteadinessChartOrOnboardingComponentVN;
  v24 = sub_231D57EAC();
  *(_QWORD *)&v22 = v9;
  v10 = v9;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v22);
  sub_231D7E604();
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v22);
  sub_231D7E610();
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v22);
  sub_231D7E5F8();
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v22);
  sub_231D7DDA0();
  sub_231D7DD7C();
  *((_QWORD *)&v23 + 1) = sub_231D7E574();
  v24 = MEMORY[0x24BE43DE8];
  sub_231D4CEA8((uint64_t *)&v22);
  v11 = v10;
  sub_231D7E568();
  sub_231D7E5C8();
  v12 = *(void (**)(char *, _QWORD, uint64_t))(v2 + 104);
  v12(v4, *MEMORY[0x24BE43EE0], v1);
  sub_231D7E7D8();
  swift_bridgeObjectRelease();
  v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v4, v1);
  v14 = _s37WalkingSteadinessFitnessPlusComponentCMa();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v11;
  v21[3] = v14;
  v21[4] = sub_231D4CD8C((unint64_t *)&qword_255F72BE8, (uint64_t (*)(uint64_t))_s37WalkingSteadinessFitnessPlusComponentCMa, (uint64_t)&unk_231D81C48);
  v21[0] = v15;
  v16 = v11;
  swift_retain();
  sub_231D7E5E0();
  v12(v4, *MEMORY[0x24BE43EE8], v1);
  sub_231D7E7D8();
  swift_bridgeObjectRelease();
  v13(v4, v1);
  sub_231D4CEE8((uint64_t)v21);
  v17 = sub_231D7E580();

  swift_release();
  sub_231D4CEE8((uint64_t)&v22);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
  return v17;
}

id sub_231D56A80(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_231D58224(a1, a2, a3);
  swift_release();

  return v8;
}

void sub_231D56ADC()
{
  qword_255F73588 = 0x507373656E746946;
  unk_255F73590 = 0xEB0000000073756CLL;
}

void sub_231D56B08()
{
  sub_231D7EE98();
  __break(1u);
}

id sub_231D56B60()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_231D56B94()
{
  return type metadata accessor for WalkingSteadinessViewController(0);
}

uint64_t sub_231D56B9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context;
  v2 = sub_231D7E658();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_231D56BF4()
{
  return type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider(0);
}

uint64_t type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider(uint64_t a1)
{
  return sub_231D4CE74(a1, qword_255F72AA8);
}

uint64_t sub_231D56C10()
{
  uint64_t result;
  unint64_t v1;

  result = sub_231D7E658();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_231D56C8C(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t aBlock;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  void (*v33)(uint64_t);
  _QWORD *v34;

  v3 = *v1;
  v4 = sub_231D7E658();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_231D5707C;
  v8[3] = 0;
  v8[4] = v3;
  sub_231D7E688();
  sub_231D7E64C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = sub_231D7E304();
  v11 = v10;
  if (v9 == sub_231D7E304() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v14 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_231D5707C(a1, 0xD000000000000036, 0x8000000231D82AD0);
      swift_release();
      return;
    }
  }
  v15 = (void *)sub_231D7E670();
  v16 = (void *)sub_231D7EB44();
  v17 = (void *)sub_231D7EB44();
  v18 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v16, v17, 1);

  v19 = (void *)sub_231D7EB44();
  v33 = (void (*)(uint64_t))nullsub_1;
  v34 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_231D550C8;
  v32 = &unk_2500C89C0;
  v20 = _Block_copy(&aBlock);
  swift_release();
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_actionWithTitle_style_handler_, v19, 1, v20);
  _Block_release(v20);

  v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v15;
  v24[3] = sub_231D57F68;
  v24[4] = v8;
  v24[5] = v23;
  v24[6] = sub_231D5707C;
  v24[7] = 0;
  v24[8] = v3;
  v25 = v15;
  swift_retain();
  swift_retain();
  v26 = (void *)sub_231D7EB44();
  v33 = sub_231D57FEC;
  v34 = v24;
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_231D550C8;
  v32 = &unk_2500C8A38;
  v27 = _Block_copy(&aBlock);
  swift_release();
  v28 = objc_msgSend(v21, sel_actionWithTitle_style_handler_, v26, 2, v27);
  _Block_release(v27);
  swift_release();

  objc_msgSend(v18, sel_addAction_, v28);
  objc_msgSend(v18, sel_addAction_, v22);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v18, 1, 0);
  swift_release();

}

uint64_t sub_231D5707C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = sub_231D7EACC();
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_231D7EAF0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D58150();
  v13 = (void *)sub_231D7ECE8();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a1;
  aBlock[4] = sub_231D581B8;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_231D5D244;
  aBlock[3] = &unk_2500C8B28;
  v15 = _Block_copy(aBlock);
  sub_231D7E514();
  v16 = a1;
  swift_release();
  sub_231D7EAE4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  sub_231D4CD8C((unint64_t *)&qword_25419BDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_231D4E564(0, &qword_25419BDE8, v17, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_231D581C4();
  sub_231D7EDD8();
  MEMORY[0x2348EF9F0](0, v12, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_231D5728C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  sub_231D7E514();
  v4 = (void *)sub_231D7EB44();
  v5 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v4, v5, 1);

  v7 = (void *)sub_231D7EB44();
  v10[4] = nullsub_1;
  v10[5] = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_231D550C8;
  v10[3] = &unk_2500C8B50;
  v8 = _Block_copy(v10);
  swift_release();
  v9 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v7, 0, v8);
  _Block_release(v8);

  objc_msgSend(v6, sel_addAction_, v9);
  objc_msgSend(a3, sel_presentViewController_animated_completion_, v6, 1, 0);

}

void sub_231D57410(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  id v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(void);
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v37 = a3;
  v38 = a4;
  v39 = a1;
  v7 = sub_231D7E9B8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v36 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - v11;
  v41 = 0;
  v42 = 0xE000000000000000;
  sub_231D7EE38();
  sub_231D7EBB0();
  v40 = a2;
  sub_231D580B0(0, &qword_255F72968, qword_25419BD70);
  sub_231D7ED9C();
  sub_231D7EBB0();
  swift_bridgeObjectRelease();
  v13 = v41;
  v14 = v42;
  sub_231D7E970();
  swift_bridgeObjectRetain_n();
  v15 = sub_231D7E9AC();
  v16 = sub_231D7EC4C();
  v17 = os_log_type_enabled(v15, v16);
  v35 = a5;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v41 = v32;
    *(_DWORD *)v18 = 136446466;
    v33 = v8;
    v19 = sub_231D7F018();
    v34 = v7;
    v40 = sub_231D6475C(v19, v20, &v41);
    sub_231D7EDB4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    sub_231D7E514();
    v40 = sub_231D6475C(v13, v14, &v41);
    v7 = v34;
    sub_231D7EDB4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_231D49000, v15, v16, "[%{public}s]: %{public}s", (uint8_t *)v18, 0x16u);
    v21 = v32;
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v21, -1, -1);
    MEMORY[0x2348F0170](v18, -1, -1);

    v22 = *(void (**)(char *, uint64_t))(v33 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  }
  v22(v12, v7);
  if (v39)
  {
    v23 = v39;
    v37();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    v24 = v36;
    sub_231D7E970();
    v25 = sub_231D7E9AC();
    v26 = sub_231D7EC4C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v41 = v28;
      *(_DWORD *)v27 = 136315138;
      v29 = sub_231D7F018();
      v40 = sub_231D6475C(v29, v30, &v41);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231D49000, v25, v26, "%s: view controller found nil", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v28, -1, -1);
      MEMORY[0x2348F0170](v27, -1, -1);
    }

    v22(v24, v7);
  }
}

void sub_231D57830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[6];

  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BE0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2EA0], a2);
  v15 = (void *)*MEMORY[0x24BDD2EC0];
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v14;
  v16[6] = a6;
  v16[7] = a7;
  v16[8] = a8;
  v20[4] = sub_231D5803C;
  v20[5] = v16;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 1107296256;
  v20[2] = sub_231D4C354;
  v20[3] = &unk_2500C8A88;
  v17 = _Block_copy(v20);
  v18 = v15;
  swift_retain();
  swift_retain();
  v19 = v14;
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_removeFeatureSettingValueForKey_completion_, v18, v17);
  _Block_release(v17);

}

void sub_231D57984(char a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v15;
  void *v16;
  void *v18;
  _QWORD v19[6];

  if ((a1 & 1) != 0)
  {
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = a3;
    v15[3] = a4;
    v15[4] = a5;
    v15[5] = a7;
    v15[6] = a8;
    v15[7] = a9;
    v19[4] = sub_231D580A0;
    v19[5] = v15;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 1107296256;
    v19[2] = sub_231D4C354;
    v19[3] = &unk_2500C8AD8;
    v16 = _Block_copy(v19);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(a6, sel_resetOnboardingWithCompletion_, v16);
    _Block_release(v16);
  }
  else
  {
    swift_beginAccess();
    v18 = (void *)MEMORY[0x2348F01D0](a5 + 16);
    a3(v18, a2);

  }
}

void sub_231D57AB8(char a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void (*a6)(uint64_t, unint64_t, unint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD v38[2];
  void (*v39)(uint64_t, unint64_t, unint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[3];

  v41 = sub_231D7E9B8();
  v15 = *(_QWORD *)(v41 - 8);
  v16 = MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v38 - v18;
  v20 = a5 + 16;
  if ((a1 & 1) != 0)
  {
    v38[1] = a7;
    v39 = a6;
    sub_231D7E970();
    v21 = sub_231D7E9AC();
    v22 = sub_231D7EC64();
    v23 = os_log_type_enabled(v21, v22);
    v38[0] = a8;
    if (v23)
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v44[0] = v25;
      *(_DWORD *)v24 = 136446466;
      v26 = sub_231D7F018();
      v43 = sub_231D6475C(v26, v27, v44);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2082;
      v43 = sub_231D6475C(0xD000000000000032, 0x8000000231D82B80, v44);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v21, v22, "[%{public}s]: %{public}s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v25, -1, -1);
      MEMORY[0x2348F0170](v24, -1, -1);
    }

    v28 = *(void (**)(char *, uint64_t))(v15 + 8);
    v28(v19, v41);
    swift_beginAccess();
    v29 = MEMORY[0x2348F01D0](v20);
    if (v29)
    {
      v30 = (void *)v29;
      v39(v29, 0xD000000000000032, 0x8000000231D82B80);

    }
    else
    {
      sub_231D7E970();
      v32 = sub_231D7E9AC();
      v33 = sub_231D7EC4C();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        v43 = v35;
        *(_DWORD *)v34 = 136315138;
        v36 = sub_231D7F018();
        v42 = sub_231D6475C(v36, v37, &v43);
        sub_231D7EDB4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231D49000, v32, v33, "%s: view controller found nil", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v35, -1, -1);
        MEMORY[0x2348F0170](v34, -1, -1);
      }

      v28(v40, v41);
    }
  }
  else
  {
    swift_beginAccess();
    v31 = (void *)MEMORY[0x2348F01D0](v20);
    a3(v31, a2);

  }
}

uint64_t sub_231D57E5C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WalkingSteadinessDataTypeDetailDebugActionProviding()
{
  return objc_opt_self();
}

void sub_231D57E8C(void *a1)
{
  sub_231D56C8C(a1);
}

unint64_t sub_231D57EAC()
{
  unint64_t result;

  result = qword_255F72BD0;
  if (!qword_255F72BD0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81BAC, &_s43WalkingSteadinessChartOrOnboardingComponentVN);
    atomic_store(result, (unint64_t *)&qword_255F72BD0);
  }
  return result;
}

uint64_t sub_231D57EF0(uint64_t a1)
{
  uint64_t v2;

  sub_231D580B0(0, &qword_255F72BD8, &qword_255F72BE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D57F44()
{
  swift_release();
  return swift_deallocObject();
}

void sub_231D57F68(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_231D57410(a1, a2, *(void (**)(void))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_231D57F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D57F84()
{
  return swift_release();
}

uint64_t sub_231D57F8C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_231D57FB0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_231D57FEC(uint64_t a1)
{
  uint64_t *v1;

  sub_231D57830(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8]);
}

uint64_t sub_231D58000()
{
  uint64_t v0;

  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_231D5803C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_231D57984(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64));
}

uint64_t sub_231D5806C()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_231D580A0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_231D57AB8(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void (**)(uint64_t, unint64_t, unint64_t))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

void sub_231D580B0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_231D58104(255, a3);
    v4 = sub_231D7EDA8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_231D58104(uint64_t a1, unint64_t *a2)
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

unint64_t sub_231D58150()
{
  unint64_t result;

  result = qword_25419BE00;
  if (!qword_25419BE00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25419BE00);
  }
  return result;
}

uint64_t sub_231D5818C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_231D581B8()
{
  uint64_t v0;

  sub_231D5728C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_231D581C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25419BDF0;
  if (!qword_25419BDF0)
  {
    sub_231D4E564(255, &qword_25419BDE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x2348F00E0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25419BDF0);
  }
  return result;
}

id sub_231D58224(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  _BYTE v16[24];
  ValueMetadata *v17;
  unint64_t v18;
  unint64_t v19;

  sub_231D4E564(0, &qword_255F72BF0, (uint64_t (*)(uint64_t))MEMORY[0x24BE44F78], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v16[-v6];
  v8 = sub_231D7E658();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(&v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], a2, v8);
  swift_retain();
  v11 = a3;
  v12 = (id)sub_231D7E874();
  v13 = (void *)sub_231D7E640();
  sub_231D7EB74();
  v17 = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
  v18 = sub_231D583D4();
  v19 = sub_231D58418();
  sub_231D7E850();
  swift_bridgeObjectRelease();
  sub_231D4CEE8((uint64_t)v16);
  v14 = sub_231D7E85C();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 0, 1, v14);
  sub_231D7E868();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  return v12;
}

unint64_t sub_231D583D4()
{
  unint64_t result;

  result = qword_25419BDD0;
  if (!qword_25419BDD0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80EE4, &type metadata for ImproveWalkingSteadinessArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_25419BDD0);
  }
  return result;
}

unint64_t sub_231D58418()
{
  unint64_t result;

  result = qword_25419BDD8;
  if (!qword_25419BDD8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D80E7C, &type metadata for ImproveWalkingSteadinessArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_25419BDD8);
  }
  return result;
}

uint64_t sub_231D58488(void *a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  char v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  _QWORD v50[2];
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[4];
  _OWORD v59[2];
  uint64_t v60;

  v54 = a2;
  v3 = sub_231D7E9B8();
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v50[1] = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)v50 - v6;
  v7 = sub_231D7E664();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_231D7E658();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v50 - v16;
  v55 = a1;
  v18 = objc_msgSend(a1, sel_identifier);
  v19 = sub_231D7EB74();
  v21 = v20;

  if (v19 == 0xD000000000000033 && v21 == 0x8000000231D82C60 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v23 = v17;
    v24 = v17;
    v25 = v12;
    v26 = v54;
    v22(v24, v54, v11);
    type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider();
    v27 = swift_allocObject();
    v28 = (id)HKMobilityWalkingSteadinessEventType();
    *(_QWORD *)(v27 + 16) = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v27 + OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context, v23, v11);
    sub_231D5DFB4();
    v22(v15, v26, v11);
    v29 = objc_allocWithZone((Class)sub_231D7E880());
    v30 = v55;
    v31 = sub_231D7E874();

    swift_setDeallocating();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27 + OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context, v11);
LABEL_5:
    swift_deallocClassInstance();
    return v31;
  }
  if (v19 == 0xD00000000000002ELL && v21 == 0x8000000231D82CA0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v35 = v54;
    v34(v17, v54, v11);
    type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider(0);
    v36 = swift_allocObject();
    v37 = (id)HKMobilityWalkingSteadinessType();
    *(_QWORD *)(v36 + 16) = v37;
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v36 + OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context, v17, v11);
    v38 = sub_231D566E8();
    v34(v15, v35, v11);
    v39 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessViewController(0));
    v40 = v55;
    v31 = (uint64_t)sub_231D58224(v38, (uint64_t)v15, v40);

    swift_release();
    swift_setDeallocating();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v36 + OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context, v11);
    goto LABEL_5;
  }
  v33 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
    goto LABEL_11;
  v60 = 0;
  memset(v59, 0, sizeof(v59));
  sub_231D58C10((uint64_t)v59, (uint64_t)&v56);
  if (v57)
  {
    sub_231D58D48(&v56, (uint64_t)v58);
    sub_231D4DC30(v58, v58[3]);
    sub_231D7E7B4();
    v47 = v54;
    sub_231D7E580();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v47, v11);
    v48 = objc_allocWithZone((Class)sub_231D7E694());
    v49 = v55;
    v31 = sub_231D7E67C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_231D58CB8((uint64_t)v59);
    sub_231D4CEE8((uint64_t)v58);
  }
  else
  {
    sub_231D58CB8((uint64_t)&v56);
    sub_231D7E97C();
    v41 = v55;
    v42 = sub_231D7E9AC();
    v43 = sub_231D7EC4C();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v44 = 138412290;
      v58[0] = v41;
      v46 = v41;
      sub_231D7EDB4();
      *v45 = v41;

      _os_log_impl(&dword_231D49000, v42, v43, "[MobilityAppPluginAppDelegate] No custom detail view controller or configuration provided for %@", v44, 0xCu);
      sub_231D58CF4();
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v45, -1, -1);
      MEMORY[0x2348F0170](v44, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
    sub_231D58CB8((uint64_t)v59);
    return 0;
  }
  return v31;
}

uint64_t sub_231D58C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D58C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_231D58C54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72BF8)
  {
    sub_231D58104(255, &qword_255F72C00);
    v0 = sub_231D7EDA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72BF8);
  }
}

uint64_t sub_231D58CB8(uint64_t a1)
{
  uint64_t v2;

  sub_231D58C54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_231D58CF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419BB50)
  {
    sub_231D52084();
    v0 = sub_231D7EDA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419BB50);
  }
}

uint64_t sub_231D58D48(__int128 *a1, uint64_t a2)
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

unint64_t sub_231D58D60()
{
  uint64_t (*v0)(uint64_t, uint64_t);
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (**v32)(void *);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t *, uint64_t, uint64_t);
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  void (*v65)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(unint64_t, _QWORD, uint64_t);
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  void (*v77)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t *, _QWORD, uint64_t);
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(unint64_t, uint64_t, uint64_t);
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  void (*v103)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t *, _QWORD, uint64_t);
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  int *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t);
  uint64_t *v129;
  void (*v130)(unint64_t);
  unint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  void (*v140)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  char *v150;
  void (*v151)(char *, _QWORD, uint64_t);
  char *v152;
  unint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t *v164;
  void (*v165)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  char *v176;
  void (*v177)(unint64_t, _QWORD, uint64_t);
  uint64_t v178;
  unint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  void (*v182)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  void (*v198)(uint64_t *, _QWORD, uint64_t);
  uint64_t *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  uint64_t *v211;
  void (*v212)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  char *v222;
  int *v223;
  void (*v224)(unint64_t, _QWORD, uint64_t);
  uint64_t v225;
  unint64_t v226;
  uint64_t *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  unint64_t v232;
  void (*v233)(unint64_t, uint64_t *, uint64_t);
  uint64_t *v234;
  void (*v235)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void (*v250)(unint64_t, _QWORD, uint64_t);
  unint64_t v251;
  unint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  unint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  char *v264;
  void (*v265)(char *, uint64_t);
  void (*v266)(char *, char *, uint64_t);
  char *v267;
  unint64_t v268;
  unint64_t v269;
  char *v270;
  unint64_t v271;
  uint64_t *v273;
  uint64_t *v274;
  char *v275;
  char *v276;
  char *v277;
  char *v278;
  unint64_t v279;
  unint64_t v280;
  unint64_t v281;
  uint64_t v282;
  char *v283;
  uint64_t *v284;
  uint64_t v285;
  int *v286;
  char *v287;
  void (*v288)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v289;
  uint64_t v290;
  char *v291;
  uint64_t v292;
  uint64_t *v293;
  uint64_t v294;
  uint64_t v295;
  unint64_t v296;
  void (*v297)(uint64_t *, uint64_t, uint64_t);
  uint64_t v298;
  unint64_t v299;
  char *v300;
  uint64_t v301;
  uint64_t v302;
  unint64_t v303;
  void (*v304)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v305;
  char *v306;
  char *v307;
  unint64_t v308;
  uint64_t v309;

  v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_255F72C08, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v273 - v2;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v273 - v5;
  v7 = sub_231D7DDB8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v307 = (char *)&v273 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v300 = (char *)&v273 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v306 = (char *)&v273 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v273 - v15);
  v17 = sub_231D7DB48();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v283 = v6;
  v304 = v18;
  v305 = v17;
  ((void (*)(char *, uint64_t, uint64_t))v18)(v6, 1, 1);
  if (qword_25419BDC0 != -1)
    swift_once();
  v19 = sub_231D7DFEC();
  v20 = sub_231D4E718(v19, (uint64_t)qword_25419BF18);
  v308 = MEMORY[0x24BEE4AF8];
  v21 = (uint64_t)v283;
  v302 = v20;
  v22 = sub_231D7E0AC();
  v24 = v23;
  sub_231D5B980(v21, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v16 = v22;
  v16[1] = v24;
  sub_231D4DD6C(0, (unint64_t *)&qword_25419B560, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_231D80E20;
  *(_QWORD *)(v25 + 32) = 0x656C6369747241;
  *(_QWORD *)(v25 + 40) = 0xE700000000000000;
  *(_QWORD *)(v25 + 48) = 0xD000000000000011;
  *(_QWORD *)(v25 + 56) = 0x8000000231D82CD0;
  strcpy((char *)(v25 + 64), "PDF_LINK_TEXT");
  *(_WORD *)(v25 + 78) = -4864;
  v26 = (void *)sub_231D7EBD4();
  swift_bridgeObjectRelease();
  v27 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v27)
  {
    v28 = sub_231D7EB74();
    v30 = v29;

  }
  else
  {
    v28 = 0;
    v30 = 0;
  }
  sub_231D5ADD4();
  v32 = (uint64_t (**)(void *))((char *)v16 + *(int *)(v31 + 64));
  v16[2] = v28;
  v16[3] = v30;
  *v32 = sub_231D5AE6C;
  v32[1] = 0;
  v33 = *MEMORY[0x24BE3F8B0];
  v34 = sub_231D7DDAC();
  (*(void (**)(uint64_t (**)(void *), uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v32, v33, v34);
  v35 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 104);
  v35(v16, *MEMORY[0x24BE3F8A8], v7);
  sub_231D4E564(0, &qword_255F72C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v36 = *(_QWORD *)(v8 + 72);
  v37 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_231D80E30;
  v282 = v38;
  v299 = v37;
  v39 = v38 + v37;
  *(_QWORD *)v39 = sub_231D5B69C();
  *(_BYTE *)(v39 + 8) = 0;
  v40 = *MEMORY[0x24BE3F908];
  v303 = v39;
  v35((uint64_t *)v39, v40, v7);
  v41 = (uint64_t *)(v39 + v36);
  v298 = v36;
  v42 = (uint64_t)v283;
  v304(v283, 1, 1, v305);
  v301 = v8;
  v43 = sub_231D7E0AC();
  v45 = v44;
  v284 = v16;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v41 = v43;
  v41[1] = v45;
  v35(v41, *MEMORY[0x24BE3F910], v7);
  v46 = 2 * v36;
  v295 = 2 * v36;
  v48 = v303;
  v47 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v49 = (uint64_t *)(v303 + v46);
  v304((char *)v42, 1, 1, v305);
  v294 = 0xD000000000000032;
  v50 = sub_231D7E0AC();
  v52 = v51;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v49 = v50;
  v49[1] = v52;
  v49[2] = 0;
  LODWORD(v296) = *MEMORY[0x24BE3F8D0];
  v297 = (void (*)(unint64_t, _QWORD, uint64_t))v35;
  ((void (*)(uint64_t *))v35)(v49);
  v53 = v48 + v295 + v298;
  v47(v42, 1, 1, v305);
  v54 = sub_231D7E0AC();
  v56 = v55;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v53 = v54;
  *(_QWORD *)(v53 + 8) = v56;
  *(_BYTE *)(v53 + 16) = 0;
  LODWORD(v295) = *MEMORY[0x24BE3F930];
  ((void (*)(unint64_t))v35)(v53);
  v57 = v298;
  v58 = v303;
  v59 = v303 + 4 * v298;
  v60 = v305;
  v304((char *)v42, 1, 1, v305);
  v61 = sub_231D7E0AC();
  v63 = v62;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v59 = v61;
  *(_QWORD *)(v59 + 8) = v63;
  *(_BYTE *)(v59 + 16) = 0;
  v297(v58 + 4 * v57, v295, v7);
  v64 = (uint64_t *)(v58 + 5 * v57);
  v65 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v304((char *)v42, 1, 1, v60);
  v66 = sub_231D7E0AC();
  v68 = v67;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v64 = v66;
  v64[1] = v68;
  v64[2] = 0;
  v69 = v297;
  v297((unint64_t)v64, v296, v7);
  v70 = v303 + 6 * v57;
  v65(v42, 1, 1, v305);
  v71 = sub_231D7E0AC();
  v73 = v72;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v70 = v71;
  *(_QWORD *)(v70 + 8) = v73;
  *(_BYTE *)(v70 + 16) = 0;
  v74 = v295;
  v69(v70, v295, v7);
  v293 = (uint64_t *)(8 * v57);
  v75 = 7 * v57;
  v76 = v303;
  v77 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v78 = v303 + v75;
  v79 = v305;
  v304((char *)v42, 1, 1, v305);
  v80 = sub_231D7E0AC();
  v82 = v81;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v78 = v80;
  *(_QWORD *)(v78 + 8) = v82;
  *(_BYTE *)(v78 + 16) = 0;
  v83 = v74;
  v84 = (void (*)(uint64_t *, _QWORD, uint64_t))v297;
  v297(v78, v83, v7);
  v85 = (uint64_t *)((char *)v293 + v76);
  v77(v42, 1, 1, v79);
  v86 = sub_231D7E0AC();
  v88 = v87;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v85 = v86;
  v85[1] = v88;
  v85[2] = 0;
  v84(v85, v296, v7);
  v89 = v298;
  v90 = (char *)v293 + v298 + v303;
  v77(v42, 1, 1, v79);
  v91 = sub_231D7E0AC();
  v93 = v92;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v90 = v91;
  *((_QWORD *)v90 + 1) = v93;
  v90[16] = 0;
  v94 = v295;
  v95 = v297;
  v297((unint64_t)v90, v295, v7);
  v96 = v303;
  v97 = v303 + 10 * v89;
  v98 = v305;
  v304((char *)v42, 1, 1, v305);
  v99 = sub_231D7E0AC();
  v101 = v100;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v97 = v99;
  *(_QWORD *)(v97 + 8) = v101;
  *(_BYTE *)(v97 + 16) = 0;
  v95(v97, v94, v7);
  v102 = v96 + 11 * v298;
  v103 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v304((char *)v42, 1, 1, v98);
  v104 = sub_231D7E0AC();
  v106 = v105;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v102 = v104;
  *(_QWORD *)(v102 + 8) = v106;
  *(_BYTE *)(v102 + 16) = 0;
  v107 = v94;
  v108 = (void (*)(uint64_t *, _QWORD, uint64_t))v297;
  v297(v102, v107, v7);
  v109 = v298;
  v110 = (uint64_t *)(v303 + 12 * v298);
  v103(v42, 1, 1, v305);
  v111 = sub_231D7E0AC();
  v113 = v112;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v110 = v111;
  v110[1] = v113;
  v110[2] = 0;
  v108(v110, v296, v7);
  v114 = (char *)(v303 + 13 * v109);
  sub_231D5B774();
  v286 = v115;
  v291 = &v114[v115[12]];
  v116 = (uint64_t *)&v114[v115[16]];
  v293 = (uint64_t *)&v114[v115[20]];
  v294 = (uint64_t)&v114[v115[24]];
  sub_231D5B100(v114);
  v117 = v305;
  v103(v42, 1, 1, v305);
  v281 = 0xD000000000000015;
  v280 = 0x8000000231D83060;
  v118 = sub_231D7E0AC();
  v120 = v119;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v116 = v118;
  v116[1] = v120;
  v103(v42, 1, 1, v117);
  v279 = 0xD000000000000055;
  v121 = MEMORY[0x24BEE4AF8];
  v122 = sub_231D7E0AC();
  v124 = v123;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v125 = v293;
  v126 = v294;
  *v293 = v122;
  v125[1] = v124;
  *(_QWORD *)v126 = 0x3FE999999999999ALL;
  *(_BYTE *)(v126 + 8) = 0;
  v127 = sub_231D7DE48();
  v128 = (uint64_t (*)(uint64_t))MEMORY[0x24BE3F9C8];
  v309 = v121;
  v294 = sub_231D4CD8C(&qword_255F72C38, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F9C8], MEMORY[0x24BE3F9D0]);
  sub_231D4E564(0, &qword_255F72C40, v128, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  v293 = v129;
  v292 = sub_231D5B8B8(&qword_255F72C48, &qword_255F72C40, v128);
  v285 = v127;
  sub_231D7EDD8();
  LODWORD(v291) = *MEMORY[0x24BE3F918];
  v130 = (void (*)(unint64_t))v297;
  ((void (*)(char *))v297)(v114);
  v131 = v303;
  v132 = v298;
  v133 = (uint64_t *)(v303 + 14 * v298);
  sub_231D5B900();
  v290 = v134;
  v287 = (char *)v133 + *(int *)(v134 + 48);
  v135 = v305;
  v304((char *)v42, 1, 1, v305);
  v278 = (char *)0xD00000000000003FLL;
  v136 = sub_231D7E0AC();
  v138 = v137;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v133 = v136;
  v133[1] = v138;
  v289 = sub_231D7DAA0();
  v288 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v289 - 8) + 56);
  v288(v287, 1, 1, v289);
  LODWORD(v287) = *MEMORY[0x24BE3F8F8];
  v130(v131 + 14 * v132);
  v277 = (char *)(16 * v132);
  v139 = (char *)(v131 + 15 * v132);
  v276 = &v139[v286[12]];
  v273 = (uint64_t *)&v139[v286[16]];
  v274 = (uint64_t *)&v139[v286[20]];
  v275 = &v139[v286[24]];
  sub_231D5B100(v139);
  v140 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v304((char *)v42, 1, 1, v135);
  v141 = sub_231D7E0AC();
  v143 = v142;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v144 = v273;
  *v273 = v141;
  v144[1] = v143;
  v140(v42, 1, 1, v135);
  v145 = MEMORY[0x24BEE4AF8];
  v146 = sub_231D7E0AC();
  v148 = v147;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v149 = v274;
  *v274 = v146;
  v149[1] = v148;
  v150 = v275;
  *(_QWORD *)v275 = 0x3FE999999999999ALL;
  v150[8] = 0;
  v309 = v145;
  sub_231D7EDD8();
  v151 = (void (*)(char *, _QWORD, uint64_t))v297;
  v297((unint64_t)v139, v291, v7);
  v152 = v277;
  v153 = v303;
  v154 = (uint64_t *)&v277[v303];
  v279 = (unint64_t)&v277[v303 + *(int *)(v290 + 48)];
  v140(v42, 1, 1, v305);
  v155 = sub_231D7E0AC();
  v157 = v156;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v154 = v155;
  v154[1] = v157;
  v288((char *)v279, 1, 1, v289);
  v151(&v152[v153], v287, v7);
  v158 = v298;
  v159 = (uint64_t *)&v152[v298 + v153];
  v304((char *)v42, 1, 1, v305);
  v160 = sub_231D7E0AC();
  v162 = v161;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v159 = v160;
  v159[1] = v162;
  v159[2] = 0;
  v151((char *)v159, v296, v7);
  v163 = (char *)(v153 + 18 * v158);
  v279 = (unint64_t)&v163[v286[12]];
  v164 = (uint64_t *)&v163[v286[16]];
  v277 = &v163[v286[20]];
  v278 = &v163[v286[24]];
  sub_231D5B100(v163);
  v165 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v166 = v305;
  v304((char *)v42, 1, 1, v305);
  v167 = sub_231D7E0AC();
  v169 = v168;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v164 = v167;
  v164[1] = v169;
  v170 = v166;
  v165(v42, 1, 1, v166);
  v171 = MEMORY[0x24BEE4AF8];
  v172 = sub_231D7E0AC();
  v174 = v173;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v175 = v277;
  *(_QWORD *)v277 = v172;
  *((_QWORD *)v175 + 1) = v174;
  v176 = v278;
  *(_QWORD *)v278 = 0x3FE999999999999ALL;
  v176[8] = 0;
  v309 = v171;
  sub_231D7EDD8();
  v177 = v297;
  v297((unint64_t)v163, v291, v7);
  v178 = v298;
  v179 = v303;
  v180 = (uint64_t *)(v303 + 19 * v298);
  v281 = (unint64_t)v180 + *(int *)(v290 + 48);
  v181 = v170;
  v182 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v304((char *)v42, 1, 1, v181);
  v183 = sub_231D7E0AC();
  v185 = v184;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v180 = v183;
  v180[1] = v185;
  v288((char *)v281, 1, 1, v289);
  v177(v179 + 19 * v178, v287, v7);
  v186 = (char *)(v179 + 20 * v178);
  v279 = (unint64_t)&v186[v286[12]];
  v187 = (uint64_t *)&v186[v286[16]];
  v277 = &v186[v286[20]];
  v278 = &v186[v286[24]];
  sub_231D5B100(v186);
  v188 = v305;
  v182(v42, 1, 1, v305);
  v280 = 0xD000000000000017;
  v281 = 0x8000000231D832D0;
  v189 = sub_231D7E0AC();
  v191 = v190;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v187 = v189;
  v187[1] = v191;
  v182(v42, 1, 1, v188);
  v192 = MEMORY[0x24BEE4AF8];
  v193 = sub_231D7E0AC();
  v195 = v194;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v196 = v277;
  *(_QWORD *)v277 = v193;
  *((_QWORD *)v196 + 1) = v195;
  v197 = v278;
  *(_QWORD *)v278 = 0x3FE999999999999ALL;
  v197[8] = 0;
  v309 = v192;
  sub_231D7EDD8();
  v198 = (void (*)(uint64_t *, _QWORD, uint64_t))v297;
  v297((unint64_t)v186, v291, v7);
  v199 = (uint64_t *)(v303 + 21 * v298);
  v278 = (char *)v199 + *(int *)(v290 + 48);
  v200 = v305;
  v182(v42, 1, 1, v305);
  v279 = 0xD000000000000043;
  v201 = sub_231D7E0AC();
  v203 = v202;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v199 = v201;
  v199[1] = v203;
  v288(v278, 1, 1, v289);
  v198(v199, v287, v7);
  v204 = v303;
  v205 = v298;
  v206 = (uint64_t *)(v303 + 22 * v298);
  v304((char *)v42, 1, 1, v200);
  v207 = sub_231D7E0AC();
  v209 = v208;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v206 = v207;
  v206[1] = v209;
  v206[2] = 0;
  v198((uint64_t *)(v204 + 22 * v205), v296, v7);
  v210 = (char *)(v204 + 23 * v205);
  v279 = (unint64_t)&v210[v286[12]];
  v211 = (uint64_t *)&v210[v286[16]];
  v278 = &v210[v286[20]];
  v286 = (int *)&v210[v286[24]];
  sub_231D5B100(v210);
  v212 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v213 = v305;
  v304((char *)v42, 1, 1, v305);
  v214 = sub_231D7E0AC();
  v216 = v215;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v211 = v214;
  v211[1] = v216;
  v217 = v301;
  v212(v42, 1, 1, v213);
  v218 = MEMORY[0x24BEE4AF8];
  v219 = sub_231D7E0AC();
  v221 = v220;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v222 = v278;
  *(_QWORD *)v278 = v219;
  *((_QWORD *)v222 + 1) = v221;
  v223 = v286;
  *(_QWORD *)v286 = 0x3FE999999999999ALL;
  *((_BYTE *)v223 + 8) = 0;
  v309 = v218;
  sub_231D7EDD8();
  v224 = v297;
  v297((unint64_t)v210, v291, v7);
  v225 = v298;
  v226 = v303;
  v227 = (uint64_t *)(v303 + 24 * v298);
  v294 = (uint64_t)v227 + *(int *)(v290 + 48);
  v304((char *)v42, 1, 1, v305);
  v228 = sub_231D7E0AC();
  v230 = v229;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v227 = v228;
  v227[1] = v230;
  v288((char *)v294, 1, 1, v289);
  v224(v226 + 24 * v225, v287, v7);
  v231 = v226;
  v232 = v226 + 25 * v225;
  v233 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v217 + 16);
  v233(v232, v284, v7);
  v234 = (uint64_t *)(v231 + 26 * v225);
  v235 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v304;
  v304((char *)v42, 1, 1, v305);
  v236 = sub_231D7E0AC();
  v238 = v237;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *v234 = v236;
  v234[1] = v238;
  v234[2] = 0;
  v297((unint64_t)v234, v296, v7);
  v239 = v303 + 27 * v298;
  v240 = v305;
  v235(v42, 1, 1, v305);
  v296 = 0xD000000000000038;
  v241 = sub_231D7E0AC();
  v243 = v242;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v239 = v241;
  *(_QWORD *)(v239 + 8) = v243;
  *(_BYTE *)(v239 + 16) = 0;
  v244 = v295;
  v297(v239, v295, v7);
  v245 = v303 + 28 * v298;
  v304((char *)v42, 1, 1, v240);
  v246 = sub_231D7E0AC();
  v248 = v247;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v245 = v246;
  *(_QWORD *)(v245 + 8) = v248;
  *(_BYTE *)(v245 + 16) = 0;
  v249 = v244;
  v250 = v297;
  v297(v245, v249, v7);
  v251 = v303;
  v252 = v303 + 29 * v298;
  v304((char *)v42, 1, 1, v305);
  v253 = sub_231D7E0AC();
  v255 = v254;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v252 = v253;
  *(_QWORD *)(v252 + 8) = v255;
  v256 = v298;
  *(_BYTE *)(v252 + 16) = 0;
  v250(v252, v295, v7);
  v257 = v251 + 30 * v256;
  v304((char *)v42, 1, 1, v305);
  v258 = sub_231D7E0AC();
  v260 = v259;
  sub_231D5B980(v42, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  *(_QWORD *)v257 = v258;
  *(_QWORD *)(v257 + 8) = v260;
  *(_BYTE *)(v257 + 16) = 0;
  v250(v257, v295, v7);
  v261 = 31;
  v262 = v303;
  v263 = v256;
  do
  {
    v264 = v306;
    v233((unint64_t)v306, (uint64_t *)v262, v7);
    v233((unint64_t)v3, (uint64_t *)v264, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v217 + 56))(v3, 0, 1, v7);
    v265 = *(void (**)(char *, uint64_t))(v217 + 8);
    v265(v264, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v217 + 48))(v3, 1, v7) == 1)
    {
      sub_231D5B980((uint64_t)v3, &qword_255F72C08, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938]);
    }
    else
    {
      v266 = *(void (**)(char *, char *, uint64_t))(v217 + 32);
      v267 = v300;
      v266(v300, v3, v7);
      v266(v307, v267, v7);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v308 = sub_231D7A384(0, *(_QWORD *)(v308 + 16) + 1, 1, v308);
      v269 = *(_QWORD *)(v308 + 16);
      v268 = *(_QWORD *)(v308 + 24);
      if (v269 >= v268 >> 1)
        v308 = sub_231D7A384(v268 > 1, v269 + 1, 1, v308);
      v270 = v307;
      v271 = v308;
      *(_QWORD *)(v308 + 16) = v269 + 1;
      v256 = v263;
      v266((char *)(v271 + v299 + v269 * v263), v270, v7);
      v217 = v301;
    }
    v262 += v256;
    --v261;
  }
  while (v261);
  v265((char *)v284, v7);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v308;
}

void sub_231D5ADD4()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_255F72C10)
  {
    sub_231D4DD6C(255, (unint64_t *)&qword_255F72C18, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    sub_231D7DDAC();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_255F72C10);
  }
}

uint64_t sub_231D5AE6C(void *a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v2 = sub_231D7EACC();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v15 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_231D7EAF0();
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D58150();
  v9 = (void *)sub_231D7ECE8();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  aBlock[4] = sub_231D5B9E8;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_231D5D244;
  aBlock[3] = &unk_2500C8BD0;
  v11 = _Block_copy(aBlock);
  v12 = a1;
  swift_release();
  sub_231D7EAE4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_231D4CD8C((unint64_t *)&qword_25419BDE0, v3, MEMORY[0x24BEE5468]);
  sub_231D4E564(0, &qword_25419BDE8, v3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_231D5B8B8((unint64_t *)&qword_25419BDF0, &qword_25419BDE8, v3);
  sub_231D7EDD8();
  MEMORY[0x2348EF9F0](0, v8, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v14);
}

uint64_t sub_231D5B07C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[5];

  v0 = type metadata accessor for ImproveWalkingSteadinessPDFProvider();
  v1 = swift_allocObject();
  v3[3] = v0;
  v3[4] = sub_231D4CD8C(&qword_255F72C60, (uint64_t (*)(uint64_t))type metadata accessor for ImproveWalkingSteadinessPDFProvider, (uint64_t)&unk_231D81CB4);
  v3[0] = v1;
  sub_231D7ECAC();
  return sub_231D4CEE8((uint64_t)v3);
}

uint64_t sub_231D5B100@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _QWORD v25[3];
  char *v26;
  __int128 v27;
  _QWORD v28[4];

  v26 = a1;
  v1 = sub_231D7DAE8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v25 - v7;
  v27 = xmmword_231D7F620;
  v25[2] = v28;
  v28[0] = 3436653;
  v28[1] = 0xE300000000000000;
  v28[2] = 7761773;
  v28[3] = 0xE300000000000000;
  v9 = qword_25419BE08;
  sub_231D7E514();
  if (v9 != -1)
    swift_once();
  v10 = (void *)qword_25419BF10;
  v11 = (void *)sub_231D7EB44();
  v12 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    sub_231D7DADC();

    v14 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
    v14(v8, v4, v1);
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v15(v8, 0, 1, v1);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1) != 1)
      goto LABEL_11;
  }
  else
  {
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v15(v8, 1, 1, v1);
  }
  sub_231D5B980((uint64_t)v8, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  if ((unint64_t)v27 < 2)
  {
    __break(1u);
  }
  else
  {
    v25[1] = v27;
    v16 = qword_25419BE08;
    sub_231D7E514();
    if (v16 == -1)
      goto LABEL_9;
  }
  swift_once();
LABEL_9:
  v17 = (void *)qword_25419BF10;
  v18 = (void *)sub_231D7EB44();
  v19 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v17, sel_URLForResource_withExtension_, v18, v19);

  if (!v20)
  {
    v15(v8, 1, 1, v1);
    goto LABEL_13;
  }
  sub_231D7DADC();

  v14 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
  v14(v8, v4, v1);
  v15(v8, 0, 1, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1) == 1)
  {
LABEL_13:
    sub_231D5B980((uint64_t)v8, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    swift_arrayDestroy();
    v22 = v26;
    v23 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v15)(v22, v23, 1, v1);
  }
LABEL_11:
  swift_arrayDestroy();
  v21 = v26;
  v14(v26, v8, v1);
  v22 = v21;
  v23 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v15)(v22, v23, 1, v1);
}

unint64_t sub_231D5B4AC()
{
  return 0xD000000000000018;
}

uint64_t sub_231D5B4C8()
{
  return sub_231D5B51C();
}

uint64_t sub_231D5B4E4()
{
  return sub_231D5B51C();
}

uint64_t sub_231D5B500()
{
  return sub_231D5B51C();
}

uint64_t sub_231D5B51C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - v1;
  v3 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if (qword_25419BDC0 != -1)
    swift_once();
  v4 = sub_231D7DFEC();
  sub_231D4E718(v4, (uint64_t)qword_25419BF18);
  v5 = sub_231D7E0AC();
  sub_231D5B980((uint64_t)v2, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  return v5;
}

uint64_t sub_231D5B650()
{
  if (qword_25419B4E0 != -1)
    swift_once();
  return sub_231D613D8(qword_25419BED8);
}

id sub_231D5B69C()
{
  id v0;
  void *v1;
  id v2;

  if (qword_25419BE08 != -1)
    swift_once();
  v0 = (id)qword_25419BF10;
  v1 = (void *)sub_231D7EB44();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v1, v0, 0);

  if (v2)
    return v2;
  else
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
}

void sub_231D5B774()
{
  uint64_t (*v0)(void);
  unint64_t TupleTypeMetadata;
  uint64_t v2;

  if (!qword_255F72C28)
  {
    MEMORY[0x24BDAC7A8](0);
    v0 = MEMORY[0x24BEE1C68];
    sub_231D4E564(255, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_231D7DE48();
    sub_231D4DD6C(255, (unint64_t *)&qword_255F72C18, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))v0);
    sub_231D4DD6C(255, &qword_255F72C30, MEMORY[0x24BEE13C8], (uint64_t (*)(_QWORD, uint64_t))v0);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v2)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_255F72C28);
  }
}

uint64_t sub_231D5B8B8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_231D4E564(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x2348F00E0](MEMORY[0x24BEE12C8], v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_231D5B900()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255F72C50)
  {
    sub_231D4E564(255, &qword_255F72C58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC3F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255F72C50);
  }
}

uint64_t sub_231D5B980(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_231D4E564(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_231D5B9C4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_231D5B9E8()
{
  return sub_231D5B07C();
}

uint64_t sub_231D5B9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D5BA00()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for ImproveWalkingSteadinessArticleDataProvider()
{
  return &type metadata for ImproveWalkingSteadinessArticleDataProvider;
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource(uint64_t a1)
{
  return sub_231D4CE74(a1, qword_255F72CA0);
}

uint64_t sub_231D5BA2C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_231D5BAD0()
{
  qword_255F72C68 = 1313423693;
  unk_255F72C70 = 0xE400000000000000;
}

uint64_t sub_231D5BAEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + qword_255F72C80;
  swift_beginAccess();
  v4 = v3 + *(int *)(type metadata accessor for WalkingSteadinessHealthChecklistSettingsState() + 20);
  v5 = sub_231D7DEA8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, v4, v5);
}

uint64_t sub_231D5BB60()
{
  uint64_t v0;
  uint64_t ObjectType;
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
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;

  ObjectType = swift_getObjectType();
  sub_231D4E564(0, &qword_255F72D60, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - v3;
  sub_231D5DD0C();
  v6 = v5;
  v15 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D5DE04();
  v10 = v9;
  v17 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2EA0], *(_QWORD *)(v0 + qword_255F72C88));
  sub_231D5DF10(0, (unint64_t *)&qword_25419B528);
  v18 = (id)sub_231D7E928();
  *(_QWORD *)(swift_allocObject() + 16) = ObjectType;
  sub_231D5DDA0();
  type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  sub_231D4CD8C(&qword_255F72D78, (uint64_t (*)(uint64_t))sub_231D5DDA0, MEMORY[0x24BDB9AF8]);
  sub_231D7EA9C();
  swift_release();
  swift_release();
  sub_231D5DF10(0, (unint64_t *)&qword_25419BE00);
  v18 = (id)sub_231D7ECE8();
  v13 = sub_231D7ECDC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 1, 1, v13);
  sub_231D4CD8C(&qword_255F72D88, (uint64_t (*)(uint64_t))sub_231D5DD0C, MEMORY[0x24BDB94C8]);
  sub_231D5DEB8();
  sub_231D7EAA8();
  sub_231D5B980((uint64_t)v4, &qword_255F72D60, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0]);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v6);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_231D4CD8C(&qword_255F72D98, (uint64_t (*)(uint64_t))sub_231D5DE04, MEMORY[0x24BDB9A08]);
  sub_231D7EAB4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v10);
  swift_beginAccess();
  sub_231D7EA78();
  swift_endAccess();

  return swift_release();
}

uint64_t sub_231D5BEE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
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
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a2;
  v5 = sub_231D7E9B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, (unint64_t *)&qword_25419BD60, (uint64_t (*)(uint64_t))MEMORY[0x24BE418F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - v10;
  v12 = sub_231D7DF80();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (void *)sub_231D7E910();
  sub_231D68268(v16, a1, sub_231D70F38, 0, (uint64_t)v11);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    v28 = v5;
    v29 = a3;
    sub_231D5B980((uint64_t)v11, (unint64_t *)&qword_25419BD60, (uint64_t (*)(uint64_t))MEMORY[0x24BE418F8]);
    sub_231D7E994();
    v17 = sub_231D7E9AC();
    v18 = sub_231D7EC4C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v32 = v20;
      *(_DWORD *)v19 = 136446210;
      v21 = sub_231D7F018();
      v31 = sub_231D6475C(v21, v22, &v32);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231D49000, v17, v18, "[%{public}s] Unable to create feature status configuration", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v20, -1, -1);
      MEMORY[0x2348F0170](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v28);
    v23 = v29;
    v24 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 1, 1, v24);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_231D69C10(a3);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v26 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(a3, 0, 1, v26);
  }
}

void sub_231D5C1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x2348F01D0](v7);
  if (v8)
  {
    v9 = (void *)v8;
    sub_231D5D9A4(a1, (uint64_t)v6);
    v10 = (uint64_t)v9 + qword_255F72C80;
    swift_beginAccess();
    sub_231D5DF68((uint64_t)v6, v10);
    swift_endAccess();

  }
  swift_beginAccess();
  v11 = MEMORY[0x2348F01D0](v7);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = v11 + qword_255F72C78;
    swift_beginAccess();
    v14 = MEMORY[0x2348F01D0](v13);

    if (v14)
    {
      swift_getObjectType();
      sub_231D7E70C();
      sub_231D7E784();
    }
  }
}

void sub_231D5C324(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = sub_231D7DEA8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D5DF10(0, (unint64_t *)&qword_25419B530);
  v8 = (void *)sub_231D7ED6C();
  v9 = (void *)sub_231D7EB44();
  v10 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v9, v8);

  if (v10)
  {
    v11 = v2 + qword_255F72C80;
    swift_beginAccess();
    v12 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11 + *(int *)(v12 + 20), v4);
    sub_231D7E514();
    sub_231D7DEE4();
    sub_231D7DECC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_231D7E748();
    v13 = sub_231D7E754();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a1, 0, 1, v13);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_231D5C4D4()
{
  uint64_t inited;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  sub_231D5DC9C();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_231D7F620;
  v1 = (void *)objc_opt_self();
  if (qword_255F724E0 != -1)
    swift_once();
  v2 = (void *)sub_231D7EB44();
  v3 = objc_msgSend(v1, sel_groupSpecifierWithID_, v2);

  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = sub_231D5C680();
  sub_231D7EBEC();
  v7 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(inited + 32))
  {
    v4 = swift_unknownObjectRetain();
    MEMORY[0x2348EF8C4](v4);
    if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_231D7EBF8();
    sub_231D7EC04();
    sub_231D7EBEC();
  }
  if (*(_QWORD *)(inited + 40))
  {
    v5 = swift_unknownObjectRetain();
    MEMORY[0x2348EF8C4](v5);
    if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_231D7EBF8();
    sub_231D7EC04();
    sub_231D7EBEC();
  }
  swift_bridgeObjectRelease();
  return v7;
}

id sub_231D5C680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v13 - v2;
  v4 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  if (qword_25419BDC0 != -1)
    swift_once();
  v5 = sub_231D7DFEC();
  sub_231D4E718(v5, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5B980((uint64_t)v3, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v7, v0, sel_setNotificationsEnabled_, sel_isNotificationsEnabled, 0, 6, 0);

  if (v8)
  {
    v9 = (void *)sub_231D7EB44();
    objc_msgSend(v8, sel_setIdentifier_, v9);

    swift_beginAccess();
    v10 = (void *)sub_231D7EC1C();
    objc_msgSend(v8, sel_setProperty_forKey_, v10, *MEMORY[0x24BE75A18]);

    v11 = (void *)sub_231D7EC1C();
    objc_msgSend(v8, sel_setProperty_forKey_, v11, *MEMORY[0x24BE75868]);

  }
  return v8;
}

id sub_231D5C8EC()
{
  swift_beginAccess();
  return (id)sub_231D7EC1C();
}

uint64_t sub_231D5C93C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v22;
  uint64_t ObjectType;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  ObjectType = swift_getObjectType();
  v3 = sub_231D7EACC();
  v26 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_231D7EAF0();
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_231D7EAD8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D5DF10(0, (unint64_t *)&qword_25419BE00);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5488], v9);
  v13 = (void *)sub_231D7ED00();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = *(_QWORD *)(v1 + qword_255F72C90);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a1;
  v17 = ObjectType;
  v16[4] = v14;
  v16[5] = v17;
  aBlock[4] = sub_231D5DC44;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_231D5D244;
  aBlock[3] = &unk_2500C8CC8;
  v18 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  v19 = a1;
  swift_retain();
  sub_231D7EAE4();
  v27 = MEMORY[0x24BEE4AF8];
  v20 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  sub_231D4CD8C((unint64_t *)&qword_25419BDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_231D4E564(0, &qword_25419BDE8, v20, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_231D581C4();
  sub_231D7EDD8();
  MEMORY[0x2348EF9F0](0, v8, v5, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
  swift_release();
  return swift_release();
}

uint64_t sub_231D5CC10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  sub_231D4DD6C(0, (unint64_t *)&qword_255F727E8, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BE45B58]);
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v15 - v12;
  if (a1)
  {
    swift_getObjectType();
    objc_msgSend(a2, sel_BOOLValue);
    sub_231D7ECB8();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    swift_retain();
    sub_231D7ED30();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  return result;
}

uint64_t sub_231D5CD2C(char a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
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
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  os_log_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t (*v30)(uint64_t);
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  os_log_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t aBlock[7];

  v40 = a3;
  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v5 = sub_231D7EACC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_231D7EAF0();
  v41 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_231D7E9B8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v39 = v14;
    sub_231D7E970();
    v17 = a2;
    v18 = a2;
    v19 = sub_231D7E9AC();
    v38 = sub_231D7EC4C();
    if (os_log_type_enabled(v19, (os_log_type_t)v38))
    {
      v35 = v19;
      v36 = v9;
      v37 = v6;
      v20 = swift_slowAlloc();
      v33 = (_QWORD *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      aBlock[0] = v34;
      *(_DWORD *)v20 = 136446466;
      v21 = sub_231D7F018();
      v42 = sub_231D6475C(v21, v22, aBlock);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2112;
      if (a2)
      {
        v23 = a2;
        v24 = _swift_stdlib_bridgeErrorToNSError();
        v42 = v24;
        sub_231D7EDB4();
      }
      else
      {
        v42 = 0;
        sub_231D7EDB4();
        v24 = 0;
      }
      v25 = v33;
      *v33 = v24;

      v26 = v35;
      _os_log_impl(&dword_231D49000, v35, (os_log_type_t)v38, "[%{public}s] Error when setting Walking Steadiness setting enabled: %@", (uint8_t *)v20, 0x16u);
      sub_231D58CF4();
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v25, -1, -1);
      v27 = v34;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v27, -1, -1);
      MEMORY[0x2348F0170](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v39);
      v9 = v36;
      v6 = v37;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v39);
    }
  }
  sub_231D5DF10(0, (unint64_t *)&qword_25419BE00);
  v28 = (void *)sub_231D7ECE8();
  aBlock[4] = (uint64_t)sub_231D5DC94;
  aBlock[5] = v40;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_231D5D244;
  aBlock[3] = (uint64_t)&unk_2500C8D18;
  v29 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_231D7EAE4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v30 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  sub_231D4CD8C((unint64_t *)&qword_25419BDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_231D4E564(0, &qword_25419BDE8, v30, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_231D581C4();
  sub_231D7EDD8();
  MEMORY[0x2348EF9F0](0, v11, v8, v29);
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v11, v9);
}

void sub_231D5D1A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2348F01D0](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = v2 + qword_255F72C78;
    swift_beginAccess();
    v5 = MEMORY[0x2348F01D0](v4);

    if (v5)
    {
      swift_getObjectType();
      sub_231D7E700();
      sub_231D7E784();
    }
  }
}

uint64_t sub_231D5D244(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_231D5D270(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_231D5C93C(v4);

}

void sub_231D5D2C4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_231D5D2F0()
{
  uint64_t v0;

  sub_231D5DBC8(v0 + qword_255F72C78);
  sub_231D5DB8C(v0 + qword_255F72C80);

  sub_231D7E784();
  return swift_bridgeObjectRelease();
}

id sub_231D5D34C()
{
  return sub_231D51D34(type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource);
}

uint64_t sub_231D5D358(uint64_t a1)
{
  sub_231D5DBC8(a1 + qword_255F72C78);
  sub_231D5DB8C(a1 + qword_255F72C80);

  sub_231D7E784();
  return swift_bridgeObjectRelease();
}

uint64_t sub_231D5D3C0()
{
  return type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource(0);
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusViewController(uint64_t a1)
{
  return sub_231D4CE74(a1, qword_255F72CF0);
}

uint64_t sub_231D5D3DC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_231D5D418()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_255F72C78;
  swift_beginAccess();
  return MEMORY[0x2348F01D0](v1);
}

uint64_t sub_231D5D464(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_255F72C78;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return sub_231D7E784();
}

void (*sub_231D5D4CC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_255F72C78;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2348F01D0](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_231D5D540;
}

void sub_231D5D540(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    sub_231D7E784();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_231D7E784();
  }
  free(v3);
}

void (*sub_231D5D5BC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_231D7E76C();
  return sub_231D5D618;
}

void sub_231D5D618(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

id sub_231D5D64C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - v7;
  v9 = sub_231D7E0C4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = a1;
  sub_231D5D9A4(a1, (uint64_t)v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  v16 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource(0));
  v17 = sub_231D5D9E8((uint64_t)v15, a2, (uint64_t)v12);
  sub_231D4CD8C(&qword_255F72D40, type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource, (uint64_t)&unk_231D80FC0);
  v18 = v17;
  v19 = (void *)sub_231D7E6C4();
  v20 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v8, 1, 1, v20);
  v21 = qword_25419BDC0;
  v22 = v19;
  if (v21 != -1)
    swift_once();
  v23 = sub_231D7DFEC();
  sub_231D4E718(v23, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5B980((uint64_t)v8, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v24 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setTitle_, v24);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a3, v9);
  sub_231D5DB8C(v27);
  return v22;
}

void sub_231D5D90C()
{
  sub_231D7EE98();
  __break(1u);
}

void sub_231D5D964()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_231D5D990()
{
  return sub_231D51D34(type metadata accessor for WalkingSteadinessFeatureStatusViewController);
}

uint64_t sub_231D5D99C()
{
  return type metadata accessor for WalkingSteadinessFeatureStatusViewController(0);
}

uint64_t sub_231D5D9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_231D5D9E8(uint64_t a1, void *a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;

  sub_231D4E564(0, &qword_255F72D48, (uint64_t (*)(uint64_t))MEMORY[0x24BE42170], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - v8;
  *(_QWORD *)&v3[qword_255F72C78 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[qword_255F72C98] = MEMORY[0x24BEE4B08];
  sub_231D5D9A4(a1, (uint64_t)&v3[qword_255F72C80]);
  *(_QWORD *)&v3[qword_255F72C88] = a2;
  v10 = *MEMORY[0x24BDD2EA0];
  v11 = v3;
  v12 = objc_msgSend(a2, sel_featureAvailabilityProviderForIdentifier_, v10);
  *(_QWORD *)&v11[qword_255F72C90] = v12;

  v13 = sub_231D7E0C4();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v9, a3, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
  v15 = (id)sub_231D7E0B8();
  sub_231D5BB60();

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a3, v13);
  sub_231D5DB8C(a1);
  return v15;
}

uint64_t sub_231D5DB8C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D5DBC8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_231D5DBEC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_231D5DC10()
{
  uint64_t v0;

  sub_231D7E784();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D5DC44()
{
  uint64_t v0;

  return sub_231D5CC10(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_231D5DC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D5DC60()
{
  return swift_release();
}

uint64_t sub_231D5DC68()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D5DC8C(char a1, void *a2)
{
  uint64_t v2;

  return sub_231D5CD2C(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_231D5DC94()
{
  uint64_t v0;

  sub_231D5D1A4(v0);
}

void sub_231D5DC9C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72D50)
  {
    sub_231D4DD6C(255, &qword_255F72D58, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72D50);
  }
}

void sub_231D5DD0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72D68)
  {
    sub_231D5DDA0();
    type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    sub_231D4CD8C(&qword_255F72D78, (uint64_t (*)(uint64_t))sub_231D5DDA0, MEMORY[0x24BDB9AF8]);
    v0 = sub_231D7EA54();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72D68);
  }
}

void sub_231D5DDA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72D70)
  {
    sub_231D7E904();
    v0 = sub_231D7EA6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72D70);
  }
}

void sub_231D5DE04()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72D80)
  {
    sub_231D5DD0C();
    sub_231D5DF10(255, (unint64_t *)&qword_25419BE00);
    sub_231D4CD8C(&qword_255F72D88, (uint64_t (*)(uint64_t))sub_231D5DD0C, MEMORY[0x24BDB94C8]);
    sub_231D5DEB8();
    v0 = sub_231D7EA60();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72D80);
  }
}

unint64_t sub_231D5DEB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255F72D90;
  if (!qword_255F72D90)
  {
    v1 = sub_231D5DF10(255, (unint64_t *)&qword_25419BE00);
    result = MEMORY[0x2348F00E0](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_255F72D90);
  }
  return result;
}

uint64_t sub_231D5DF10(uint64_t a1, unint64_t *a2)
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

uint64_t sub_231D5DF48()
{
  return swift_deallocObject();
}

uint64_t sub_231D5DF58@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_231D5BEE0(a1, *(_QWORD *)(v2 + 16), a2);
}

void sub_231D5DF60(uint64_t a1)
{
  uint64_t v1;

  sub_231D5C1E0(a1, v1);
}

uint64_t sub_231D5DF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_231D5DFB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;

  v1 = v0;
  v2 = sub_231D7E5B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_231D7E664();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(v1 + 16);
  sub_231D7E61C();
  sub_231D7E5D4();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v17);
  sub_231D7E604();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v17);
  sub_231D7E5F8();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v17);
  sub_231D7E5C8();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  sub_231D7E7E4();
  swift_bridgeObjectRelease();
  sub_231D57EF0((uint64_t)&v17);
  v11 = _s37WalkingSteadinessFitnessPlusComponentCMa();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  *((_QWORD *)&v18 + 1) = v11;
  v19 = sub_231D5E2C4();
  *(_QWORD *)&v17 = v12;
  v13 = v10;
  swift_retain();
  sub_231D7E5E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE43EE8], v2);
  sub_231D7E7D8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_231D4CEE8((uint64_t)&v17);
  v14 = sub_231D7E580();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

uint64_t sub_231D5E228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context;
  v2 = sub_231D7E658();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_231D5E280()
{
  return type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider();
}

uint64_t type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider()
{
  uint64_t result;

  result = qword_255F72DC8;
  if (!qword_255F72DC8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_231D5E2C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255F72BE8;
  if (!qword_255F72BE8)
  {
    v1 = _s37WalkingSteadinessFitnessPlusComponentCMa();
    result = MEMORY[0x2348F00E0](&unk_231D81C48, v1);
    atomic_store(result, (unint64_t *)&qword_255F72BE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessArticleDataProvider()
{
  return &type metadata for WalkingSteadinessArticleDataProvider;
}

void sub_231D5E31C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - v3;
  v5 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  if (qword_25419BDC0 != -1)
    swift_once();
  v6 = sub_231D7DFEC();
  sub_231D4E718(v6, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v4);
  sub_231D58D60();
  v7 = objc_allocWithZone((Class)sub_231D7DDDC());
  v8 = (void *)sub_231D7DDD0();
  v9 = objc_msgSend(a1, sel_navigationController);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_pushViewController_animated_, v8, 1);

  }
}

unint64_t sub_231D5E4B0()
{
  return 0xD000000000000011;
}

uint64_t sub_231D5E4CC()
{
  return sub_231D5E504();
}

uint64_t sub_231D5E4E8()
{
  return sub_231D5E504();
}

uint64_t sub_231D5E504()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - v1;
  v3 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if (qword_25419BDC0 != -1)
    swift_once();
  v4 = sub_231D7DFEC();
  sub_231D4E718(v4, (uint64_t)qword_25419BF18);
  v5 = sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v2);
  return v5;
}

uint64_t sub_231D5E624()
{
  return sub_231D5E504();
}

id sub_231D5E644()
{
  id v0;
  void *v1;
  id v2;

  if (qword_25419BE08 != -1)
    swift_once();
  v0 = (id)qword_25419BF10;
  v1 = (void *)sub_231D7EB44();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v1, v0, 0);

  if (v2)
    return v2;
  else
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
}

uint64_t sub_231D5E71C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(_QWORD);
  uint64_t v10;
  unint64_t v11;
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
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(unint64_t, _QWORD, uint64_t);
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t *, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t *v46;
  unint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t *, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(unint64_t, _QWORD, uint64_t);
  unint64_t v99;
  void (*v100)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (**v117)(void *);
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void (*v128)(unint64_t, uint64_t, uint64_t);
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v140;
  uint64_t v141;
  unsigned int v142;
  unint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unsigned int v146;
  void (*v147)(_QWORD);
  uint64_t v148;
  void (*v149)(char *, uint64_t, uint64_t);
  uint64_t v150;
  uint64_t v151;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v140 - v1;
  sub_231D4E564(0, &qword_255F72C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v3 = sub_231D7DDB8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_231D81070;
  v140 = v7;
  v8 = v7 + v6;
  *(_QWORD *)v8 = sub_231D5E644();
  *(_BYTE *)(v8 + 8) = 0;
  v9 = *(void (**)(_QWORD))(v4 + 104);
  v10 = v3;
  ((void (*)(unint64_t, _QWORD, uint64_t))v9)(v8, *MEMORY[0x24BE3F908], v3);
  v11 = v8;
  v12 = v8 + v5;
  v13 = sub_231D7DB48();
  v149 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v150 = v13;
  v149(v2, 1, 1);
  if (qword_25419BDC0 != -1)
    swift_once();
  v14 = sub_231D7DFEC();
  v15 = sub_231D4E718(v14, (uint64_t)qword_25419BF18);
  v16 = sub_231D7E0AC();
  v18 = v17;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)(v11 + v5) = v16;
  *(_QWORD *)(v12 + 8) = v18;
  v19 = v10;
  ((void (*)(uint64_t, _QWORD, uint64_t))v9)(v12, *MEMORY[0x24BE3F910], v10);
  v147 = v9;
  v20 = v5;
  v21 = 2 * v5;
  v22 = v20;
  v23 = (uint64_t *)(v11 + v21);
  v145 = v11;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v150);
  v24 = v19;
  v143 = 0xD00000000000002ALL;
  v25 = sub_231D7E0AC();
  v27 = v26;
  sub_231D5F3AC((uint64_t)v2);
  *v23 = v25;
  v23[1] = v27;
  v23[2] = 0;
  v142 = *MEMORY[0x24BE3F8D0];
  v148 = v24;
  v28 = (void (*)(unint64_t, _QWORD, uint64_t))v147;
  v147(v11 + v21);
  v151 = v22;
  v29 = v11 + v21 + v22;
  v31 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v149;
  v30 = v150;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v150);
  v32 = sub_231D7E0AC();
  v34 = v33;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v29 = v32;
  *(_QWORD *)(v29 + 8) = v34;
  *(_BYTE *)(v29 + 16) = 0;
  v146 = *MEMORY[0x24BE3F930];
  v35 = v146;
  v28(v29, v146, v24);
  v36 = 4 * v22;
  v37 = v145;
  v38 = v145 + 4 * v22;
  v31(v2, 1, 1, v30);
  v39 = sub_231D7E0AC();
  v41 = v40;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v38 = v39;
  *(_QWORD *)(v38 + 8) = v41;
  *(_BYTE *)(v38 + 16) = 0;
  v42 = v37 + 4 * v22;
  v44 = (void (*)(uint64_t *, uint64_t, uint64_t))v147;
  v43 = v148;
  ((void (*)(unint64_t, uint64_t, uint64_t))v147)(v42, v35, v148);
  v45 = v150;
  v46 = (uint64_t *)(v37 + v36 + v151);
  v47 = v37;
  v48 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v149;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v150);
  v144 = v15;
  v49 = sub_231D7E0AC();
  v51 = v50;
  sub_231D5F3AC((uint64_t)v2);
  *v46 = v49;
  v46[1] = v51;
  v46[2] = 0;
  v44(v46, v142, v43);
  v52 = v151;
  v53 = v47 + 6 * v151;
  v48(v2, 1, 1, v45);
  v54 = sub_231D7E0AC();
  v56 = v55;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v53 = v54;
  *(_QWORD *)(v53 + 8) = v56;
  *(_BYTE *)(v53 + 16) = 0;
  v57 = v47 + 6 * v52;
  v58 = v146;
  v59 = v148;
  v44((uint64_t *)v57, v146, v148);
  v141 = 8 * v52;
  v60 = v145;
  v61 = v145 + 7 * v52;
  v48(v2, 1, 1, v150);
  v62 = sub_231D7E0AC();
  v64 = v63;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v61 = v62;
  *(_QWORD *)(v61 + 8) = v64;
  *(_BYTE *)(v61 + 16) = 0;
  v65 = v58;
  v66 = v59;
  v44((uint64_t *)v61, v65, v59);
  v67 = v60 + v141;
  v68 = v150;
  v48(v2, 1, 1, v150);
  v69 = sub_231D7E0AC();
  v71 = v70;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v67 = v69;
  *(_QWORD *)(v67 + 8) = v71;
  *(_BYTE *)(v67 + 16) = 0;
  v72 = v146;
  v44((uint64_t *)v67, v146, v66);
  v73 = v60 + v141 + v151;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v68);
  v74 = sub_231D7E0AC();
  v76 = v75;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v73 = v74;
  *(_QWORD *)(v73 + 8) = v76;
  *(_BYTE *)(v73 + 16) = 0;
  v44((uint64_t *)v73, v72, v66);
  v77 = v44;
  v78 = v151;
  v79 = (uint64_t *)(v60 + 10 * v151);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v68);
  v80 = sub_231D7E0AC();
  v82 = v81;
  sub_231D5F3AC((uint64_t)v2);
  *v79 = v80;
  v79[1] = v82;
  v79[2] = 0;
  v83 = v148;
  v77((uint64_t *)(v60 + 10 * v78), v142, v148);
  v84 = v60 + 11 * v78;
  v86 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v149;
  v85 = v150;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v150);
  v87 = sub_231D7E0AC();
  v89 = v88;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v84 = v87;
  *(_QWORD *)(v84 + 8) = v89;
  *(_BYTE *)(v84 + 16) = 0;
  v90 = v146;
  v91 = v83;
  v77((uint64_t *)v84, v146, v83);
  v92 = v151;
  v93 = v145;
  v94 = v145 + 12 * v151;
  v86(v2, 1, 1, v85);
  v95 = sub_231D7E0AC();
  v97 = v96;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v94 = v95;
  *(_QWORD *)(v94 + 8) = v97;
  *(_BYTE *)(v94 + 16) = 0;
  v98 = (void (*)(unint64_t, _QWORD, uint64_t))v147;
  ((void (*)(unint64_t, uint64_t, uint64_t))v147)(v93 + 12 * v92, v90, v91);
  v99 = v93 + 13 * v92;
  v100 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v149;
  v101 = v150;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v149)(v2, 1, 1, v150);
  v102 = sub_231D7E0AC();
  v104 = v103;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v99 = v102;
  *(_QWORD *)(v99 + 8) = v104;
  *(_BYTE *)(v99 + 16) = 0;
  v98(v99, v146, v148);
  v105 = (uint64_t *)(v93 + 14 * v92);
  v100(v2, 1, 1, v101);
  v106 = sub_231D7E0AC();
  v108 = v107;
  sub_231D5F3AC((uint64_t)v2);
  *v105 = v106;
  v105[1] = v108;
  sub_231D5F400(0, (unint64_t *)&qword_25419B560, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BEE3598]);
  v109 = swift_allocObject();
  *(_OWORD *)(v109 + 16) = xmmword_231D80E20;
  *(_QWORD *)(v109 + 32) = 0x656C6369747241;
  *(_QWORD *)(v109 + 40) = 0xE700000000000000;
  *(_QWORD *)(v109 + 48) = 0xD000000000000011;
  *(_QWORD *)(v109 + 56) = 0x8000000231D82CD0;
  *(_QWORD *)(v109 + 64) = 0xD000000000000033;
  *(_QWORD *)(v109 + 72) = 0x8000000231D83C80;
  v110 = (void *)sub_231D7EBD4();
  swift_bridgeObjectRelease();
  v111 = (id)HKUIJoinStringsForAutomationIdentifier();

  v112 = v101;
  if (v111)
  {
    v113 = sub_231D7EB74();
    v115 = v114;

  }
  else
  {
    v113 = 0;
    v115 = 0;
  }
  sub_231D5ADD4();
  v117 = (void (**)(void *))((char *)v105 + *(int *)(v116 + 64));
  v105[2] = v113;
  v105[3] = v115;
  *v117 = sub_231D5E31C;
  v117[1] = 0;
  v118 = *MEMORY[0x24BE3F8B0];
  v119 = sub_231D7DDAC();
  (*(void (**)(void (**)(void *), uint64_t, uint64_t))(*(_QWORD *)(v119 - 8) + 104))(v117, v118, v119);
  v120 = v148;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v147)(v105, *MEMORY[0x24BE3F8A8], v148);
  v121 = 16 * v151;
  v122 = v145;
  v123 = (uint64_t *)(v145 + 15 * v151);
  v100(v2, 1, 1, v112);
  v124 = sub_231D7E0AC();
  v126 = v125;
  sub_231D5F3AC((uint64_t)v2);
  *v123 = v124;
  v123[1] = v126;
  v123[2] = 0;
  v127 = v120;
  v128 = (void (*)(unint64_t, uint64_t, uint64_t))v147;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v147)(v123, v142, v127);
  v129 = v122 + v121;
  v100(v2, 1, 1, v112);
  v130 = sub_231D7E0AC();
  v132 = v131;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v129 = v130;
  *(_QWORD *)(v129 + 8) = v132;
  *(_BYTE *)(v129 + 16) = 0;
  v133 = v146;
  v134 = v148;
  v128(v122 + v121, v146, v148);
  v135 = v122 + v121 + v151;
  v100(v2, 1, 1, v112);
  v136 = sub_231D7E0AC();
  v138 = v137;
  sub_231D5F3AC((uint64_t)v2);
  *(_QWORD *)v135 = v136;
  *(_QWORD *)(v135 + 8) = v138;
  *(_BYTE *)(v135 + 16) = 0;
  v128(v135, v133, v134);
  return v140;
}

uint64_t sub_231D5F3AC(uint64_t a1)
{
  uint64_t v2;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_231D5F400(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x24BEE0D00]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *sub_231D5F448(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_231D7DEA8();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    sub_231D7E514();
  }
  return v4;
}

uint64_t sub_231D5F4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_231D7DEA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_BYTE *sub_231D5F544(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_231D7DEA8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  sub_231D7E514();
  return a1;
}

_BYTE *sub_231D5F5C0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_231D7DEA8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  sub_231D7E514();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *sub_231D5F648(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_231D7DEA8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_231D5F6C0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_231D7DEA8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_231D5F740()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_231D5F74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_231D7DEA8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_231D5F7CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_231D5F7D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_231D7DEA8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessHealthChecklistSettingsState()
{
  uint64_t result;

  result = qword_25419BAE0;
  if (!qword_25419BAE0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231D5F890()
{
  uint64_t result;
  unint64_t v1;

  result = sub_231D7DEA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_231D5F910(char a1)
{
  return *(_QWORD *)&aDisabledon[8 * a1];
}

uint64_t sub_231D5F930(_QWORD *a1, int a2)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char v29;
  char v30;
  char v31;

  v28 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE3520];
  sub_231D540F8(0, &qword_25419BB68, (uint64_t (*)(void))sub_231D60EA4, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys, MEMORY[0x24BEE3520]);
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v24 = (char *)&v21 - v5;
  sub_231D540F8(0, &qword_25419BB60, (uint64_t (*)(void))sub_231D60EE8, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys, v3);
  v22 = *(_QWORD *)(v6 - 8);
  v23 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v21 = (char *)&v21 - v7;
  sub_231D540F8(0, &qword_25419BB70, (uint64_t (*)(void))sub_231D60F2C, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys, v3);
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - v11;
  sub_231D540F8(0, &qword_25419BB58, (uint64_t (*)(void))sub_231D60F70, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys, v3);
  v14 = v13;
  v27 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v21 - v15;
  sub_231D4DC30(a1, a1[3]);
  sub_231D60F70();
  sub_231D7EFF4();
  if ((_BYTE)v28)
  {
    if (v28 == 1)
    {
      v30 = 1;
      sub_231D60EE8();
      v17 = v21;
      sub_231D7EF40();
      v19 = v22;
      v18 = v23;
    }
    else
    {
      v31 = 2;
      sub_231D60EA4();
      v17 = v24;
      sub_231D7EF40();
      v19 = v25;
      v18 = v26;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
  }
  else
  {
    v29 = 0;
    sub_231D60F2C();
    sub_231D7EF40();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v16, v14);
}

uint64_t sub_231D5FBEC(char a1)
{
  if (!a1)
    return 0x7453686374697773;
  if (a1 == 1)
    return 0x73696C6B63656863;
  return 0xD000000000000019;
}

uint64_t sub_231D5FC5C(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  char v14;
  char v15;
  char v16;

  v3 = v1;
  sub_231D540F8(0, &qword_25419BB78, (uint64_t (*)(void))sub_231D60424, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys, MEMORY[0x24BEE3520]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v12 - v8;
  sub_231D4DC30(a1, a1[3]);
  sub_231D60424();
  sub_231D7EFF4();
  v16 = *v3;
  v15 = 0;
  sub_231D60500();
  sub_231D7EF58();
  if (!v2)
  {
    v10 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    v14 = 1;
    sub_231D7DEA8();
    sub_231D60544(&qword_25419BA00, MEMORY[0x24BE412B8]);
    sub_231D7EF58();
    v12[1] = *(_QWORD *)&v3[*(int *)(v10 + 24)];
    v13 = 2;
    sub_231D604AC();
    sub_231D60584(&qword_25419BB40, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_231D7EF58();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_231D5FE48@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v27 = a2;
  v3 = sub_231D7DEA8();
  v29 = *(_QWORD *)(v3 - 8);
  v30 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v28 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D540F8(0, &qword_255F72E58, (uint64_t (*)(void))sub_231D60424, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys, MEMORY[0x24BEE33E0]);
  v32 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - v7;
  v9 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4DC30(a1, a1[3]);
  sub_231D60424();
  v31 = v8;
  v12 = (uint64_t)v33;
  sub_231D7EFE8();
  if (v12)
    return sub_231D4CEE8((uint64_t)a1);
  v26 = v9;
  v13 = v11;
  v33 = a1;
  v14 = v6;
  v16 = v28;
  v15 = v29;
  v17 = v30;
  v37 = 0;
  sub_231D60468();
  v18 = v31;
  v19 = v32;
  sub_231D7EF28();
  v20 = v13;
  *v13 = v38;
  v36 = 1;
  sub_231D60544(&qword_255F72E68, MEMORY[0x24BE412C8]);
  sub_231D7EF28();
  v21 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v20[*(int *)(v26 + 20)], v16, v17);
  sub_231D604AC();
  v28 = v20;
  v35 = 2;
  sub_231D60584(&qword_255F72E70, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  sub_231D7EF28();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v19);
  v22 = v27;
  v23 = (uint64_t)v28;
  *(_QWORD *)&v28[*(int *)(v21 + 24)] = v34;
  sub_231D5D9A4(v23, v22);
  sub_231D4CEE8((uint64_t)v33);
  return sub_231D5DB8C(v23);
}

uint64_t sub_231D60158()
{
  char *v0;

  return sub_231D5F910(*v0);
}

uint64_t sub_231D60160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_231D607EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_231D60184(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_231D60190()
{
  sub_231D60F70();
  return sub_231D7F000();
}

uint64_t sub_231D601B8()
{
  sub_231D60F70();
  return sub_231D7F00C();
}

uint64_t sub_231D601E0()
{
  sub_231D60F2C();
  return sub_231D7F000();
}

uint64_t sub_231D60208()
{
  sub_231D60F2C();
  return sub_231D7F00C();
}

uint64_t sub_231D60230()
{
  sub_231D60EA4();
  return sub_231D7F000();
}

uint64_t sub_231D60258()
{
  sub_231D60EA4();
  return sub_231D7F00C();
}

uint64_t sub_231D60280()
{
  sub_231D60EE8();
  return sub_231D7F000();
}

uint64_t sub_231D602A8()
{
  sub_231D60EE8();
  return sub_231D7F00C();
}

char *sub_231D602D0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  char *result;

  result = sub_231D60908(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_231D602F8(_QWORD *a1)
{
  unsigned __int8 *v1;

  return sub_231D5F930(a1, *v1);
}

uint64_t sub_231D60310()
{
  char *v0;

  return sub_231D5FBEC(*v0);
}

uint64_t sub_231D60318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_231D60D3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_231D6033C()
{
  sub_231D60424();
  return sub_231D7F000();
}

uint64_t sub_231D60364()
{
  sub_231D60424();
  return sub_231D7F00C();
}

uint64_t sub_231D6038C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_231D5FE48(a1, a2);
}

uint64_t sub_231D603A0(_QWORD *a1)
{
  return sub_231D5FC5C(a1);
}

uint64_t sub_231D603B4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*a1 == *a2 && (sub_231D7DE9C() & 1) != 0)
    return sub_231D605E0(*(_QWORD **)&a1[*(int *)(a3 + 24)], *(_QWORD **)&a2[*(int *)(a3 + 24)]);
  else
    return 0;
}

unint64_t sub_231D60424()
{
  unint64_t result;

  result = qword_25419BAC0;
  if (!qword_25419BAC0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81398, &type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BAC0);
  }
  return result;
}

unint64_t sub_231D60468()
{
  unint64_t result;

  result = qword_255F72E60;
  if (!qword_255F72E60)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81370, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState);
    atomic_store(result, (unint64_t *)&qword_255F72E60);
  }
  return result;
}

void sub_231D604AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419BB38)
  {
    v0 = sub_231D7EC10();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419BB38);
  }
}

unint64_t sub_231D60500()
{
  unint64_t result;

  result = qword_25419BAB8;
  if (!qword_25419BAB8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81348, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState);
    atomic_store(result, (unint64_t *)&qword_25419BAB8);
  }
  return result;
}

uint64_t sub_231D60544(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_231D7DEA8();
    result = MEMORY[0x2348F00E0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_231D60584(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    sub_231D604AC();
    v8 = a2;
    result = MEMORY[0x2348F00E0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_231D605E0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_231D7EF88(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_231D7EF88() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.CodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState;
}

unint64_t sub_231D606D0()
{
  unint64_t result;

  result = qword_255F72E78;
  if (!qword_255F72E78)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81228, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState);
    atomic_store(result, (unint64_t *)&qword_255F72E78);
  }
  return result;
}

unint64_t sub_231D60718()
{
  unint64_t result;

  result = qword_255F72E80;
  if (!qword_255F72E80)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81320, &type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255F72E80);
  }
  return result;
}

unint64_t sub_231D60760()
{
  unint64_t result;

  result = qword_25419BAD0;
  if (!qword_25419BAD0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81290, &type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BAD0);
  }
  return result;
}

unint64_t sub_231D607A8()
{
  unint64_t result;

  result = qword_25419BAC8;
  if (!qword_25419BAC8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D812B8, &type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BAC8);
  }
  return result;
}

uint64_t sub_231D607EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x64656C6261736964 && a2 == 0xE800000000000000;
  if (v3 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 28271 && a2 == 0xE200000000000000 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 6710895 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

char *sub_231D60908(_QWORD *a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE33E0];
  sub_231D540F8(0, &qword_255F72E88, (uint64_t (*)(void))sub_231D60EA4, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys, MEMORY[0x24BEE33E0]);
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v34 = (char *)&v26 - v4;
  sub_231D540F8(0, &qword_255F72E90, (uint64_t (*)(void))sub_231D60EE8, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys, v2);
  v32 = v5;
  v29 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v33 = (char *)&v26 - v6;
  sub_231D540F8(0, &qword_255F72E98, (uint64_t (*)(void))sub_231D60F2C, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys, v2);
  v27 = *(_QWORD *)(v7 - 8);
  v28 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - v8;
  sub_231D540F8(0, &qword_255F72EA0, (uint64_t (*)(void))sub_231D60F70, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys, v2);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - v13;
  sub_231D4DC30(a1, a1[3]);
  sub_231D60F70();
  v15 = v35;
  sub_231D7EFE8();
  if (!v15)
  {
    v17 = v33;
    v16 = v34;
    v35 = v12;
    v18 = v14;
    v19 = sub_231D7EF34();
    if (*(_QWORD *)(v19 + 16) == 1)
    {
      v14 = (char *)*(unsigned __int8 *)(v19 + 32);
      if (*(_BYTE *)(v19 + 32))
      {
        if ((_DWORD)v14 == 1)
        {
          v37 = 1;
          sub_231D60EE8();
          sub_231D7EF04();
          v20 = v35;
          (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v32);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v11);
        }
        else
        {
          v38 = 2;
          sub_231D60EA4();
          sub_231D7EF04();
          v25 = v35;
          (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v11);
        }
      }
      else
      {
        v36 = 0;
        sub_231D60F2C();
        sub_231D7EF04();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v11);
      }
    }
    else
    {
      v21 = sub_231D7EE74();
      swift_allocError();
      v23 = v22;
      sub_231D54050();
      *v23 = &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState;
      sub_231D7EF10();
      sub_231D7EE5C();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v11);
    }
  }
  sub_231D4CEE8((uint64_t)a1);
  return v14;
}

uint64_t sub_231D60D3C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7453686374697773 && a2 == 0xEB00000000657461;
  if (v3 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73696C6B63656863 && a2 == 0xEF73757461745374 || (sub_231D7EF88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000231D83DA0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_231D60EA4()
{
  unint64_t result;

  result = qword_25419BA88;
  if (!qword_25419BA88)
  {
    result = MEMORY[0x2348F00E0](&unk_231D816B8, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA88);
  }
  return result;
}

unint64_t sub_231D60EE8()
{
  unint64_t result;

  result = qword_25419BA70;
  if (!qword_25419BA70)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81668, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA70);
  }
  return result;
}

unint64_t sub_231D60F2C()
{
  unint64_t result;

  result = qword_25419BAA0;
  if (!qword_25419BAA0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81618, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BAA0);
  }
  return result;
}

unint64_t sub_231D60F70()
{
  unint64_t result;

  result = qword_25419BA58;
  if (!qword_25419BA58)
  {
    result = MEMORY[0x2348F00E0](&unk_231D815C8, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA58);
  }
  return result;
}

uint64_t _s17MobilityAppPlugin45WalkingSteadinessHealthChecklistSettingsStateV11SwitchStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s17MobilityAppPlugin45WalkingSteadinessHealthChecklistSettingsStateV11SwitchStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_231D61090 + 4 * byte_231D81145[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_231D610C4 + 4 * byte_231D81140[v4]))();
}

uint64_t sub_231D610C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D610CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x231D610D4);
  return result;
}

uint64_t sub_231D610E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x231D610E8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_231D610EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D610F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys;
}

unint64_t sub_231D61144()
{
  unint64_t result;

  result = qword_255F72EA8;
  if (!qword_255F72EA8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D815A0, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255F72EA8);
  }
  return result;
}

unint64_t sub_231D6118C()
{
  unint64_t result;

  result = qword_25419BA68;
  if (!qword_25419BA68)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81510, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA68);
  }
  return result;
}

unint64_t sub_231D611D4()
{
  unint64_t result;

  result = qword_25419BA60;
  if (!qword_25419BA60)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81538, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA60);
  }
  return result;
}

unint64_t sub_231D6121C()
{
  unint64_t result;

  result = qword_25419BAB0;
  if (!qword_25419BAB0)
  {
    result = MEMORY[0x2348F00E0](&unk_231D814C0, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BAB0);
  }
  return result;
}

unint64_t sub_231D61264()
{
  unint64_t result;

  result = qword_25419BAA8;
  if (!qword_25419BAA8)
  {
    result = MEMORY[0x2348F00E0](&unk_231D814E8, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BAA8);
  }
  return result;
}

unint64_t sub_231D612AC()
{
  unint64_t result;

  result = qword_25419BA80;
  if (!qword_25419BA80)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81470, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA80);
  }
  return result;
}

unint64_t sub_231D612F4()
{
  unint64_t result;

  result = qword_25419BA78;
  if (!qword_25419BA78)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81498, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA78);
  }
  return result;
}

unint64_t sub_231D6133C()
{
  unint64_t result;

  result = qword_25419BA98;
  if (!qword_25419BA98)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81420, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA98);
  }
  return result;
}

unint64_t sub_231D61384()
{
  unint64_t result;

  result = qword_25419BA90;
  if (!qword_25419BA90)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81448, &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25419BA90);
  }
  return result;
}

uint64_t sub_231D613D8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v1 = a1;
  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_231D7EDF0())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x24BEE4B08];
    if (v2)
      goto LABEL_4;
LABEL_7:
    v8 = -1 << *(_BYTE *)(v1 + 32);
    v29 = v1 + 56;
    v5 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(v1 + 56);
    sub_231D7E514();
    result = swift_retain();
    v6 = 0;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  sub_231D61A98();
  v3 = sub_231D7EE20();
  if (!v2)
    goto LABEL_7;
LABEL_4:
  sub_231D7E514();
  swift_retain();
  sub_231D7EDE4();
  sub_231D5DF10(0, &qword_25419B510);
  sub_231D61B28(&qword_25419B518, &qword_25419B510);
  result = sub_231D7EC34();
  v1 = v31;
  v29 = v32;
  v5 = v33;
  v6 = v34;
  v7 = v35;
LABEL_11:
  v11 = (unint64_t)(v5 + 64) >> 6;
  v12 = v3 + 56;
  while (v1 < 0)
  {
    if (!sub_231D7EDFC())
      goto LABEL_45;
    sub_231D5DF10(0, &qword_25419B510);
    swift_dynamicCast();
    v16 = v30;
LABEL_36:
    result = sub_231D7ED78();
    v22 = -1 << *(_BYTE *)(v3 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_46;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v16;
    ++*(_QWORD *)(v3 + 16);
  }
  if (v7)
  {
    v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v15 = v14 | (v6 << 6);
LABEL_35:
    v16 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v15);
    v30 = v16;
    v21 = v16;
    goto LABEL_36;
  }
  v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v11)
      goto LABEL_45;
    v18 = *(_QWORD *)(v29 + 8 * v17);
    v19 = v6 + 1;
    if (!v18)
    {
      v19 = v6 + 2;
      if (v6 + 2 >= v11)
        goto LABEL_45;
      v18 = *(_QWORD *)(v29 + 8 * v19);
      if (!v18)
      {
        v19 = v6 + 3;
        if (v6 + 3 >= v11)
          goto LABEL_45;
        v18 = *(_QWORD *)(v29 + 8 * v19);
        if (!v18)
        {
          v19 = v6 + 4;
          if (v6 + 4 >= v11)
            goto LABEL_45;
          v18 = *(_QWORD *)(v29 + 8 * v19);
          if (!v18)
          {
            v19 = v6 + 5;
            if (v6 + 5 >= v11)
              goto LABEL_45;
            v18 = *(_QWORD *)(v29 + 8 * v19);
            if (!v18)
            {
              v20 = v6 + 6;
              while (v11 != v20)
              {
                v18 = *(_QWORD *)(v29 + 8 * v20++);
                if (v18)
                {
                  v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_231D61B68();
              return v3;
            }
          }
        }
      }
    }
LABEL_34:
    v7 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v19 << 6);
    v6 = v19;
    goto LABEL_35;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider()
{
  return objc_opt_self();
}

id sub_231D617A8()
{
  return (id)*MEMORY[0x24BE46D18];
}

id sub_231D617B8()
{
  return (id)*MEMORY[0x24BE46D28];
}

void sub_231D617D0(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_231D68268(a1, a2, sub_231D70F38, 0, a3);
}

void sub_231D617E0(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_231D69EF4(a1, sub_231D70F38, 0, a2);
}

uint64_t sub_231D617F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE41688];
  v3 = sub_231D7DF38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_231D6183C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2348F00E0](&unk_231D81824, a3);
  return sub_231D7E10C();
}

uint64_t sub_231D61888()
{
  MEMORY[0x2348F00E0](&unk_231D81824);
  return sub_231D7E100();
}

unint64_t sub_231D618D4()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_231D618F0(uint64_t a1)
{
  MEMORY[0x2348F00E0](&unk_231D817BC, a1);
  return sub_231D7E0E8();
}

uint64_t sub_231D61934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2348F00E0](&unk_231D817BC, a3);
  return sub_231D7E0DC();
}

uint64_t sub_231D61980(uint64_t a1, uint64_t a2)
{
  return sub_231D565BC(&qword_25419BAF8, a2, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider, (uint64_t)&unk_231D81774);
}

uint64_t sub_231D619AC()
{
  return sub_231D565BC(&qword_25419BBA0, 255, type metadata accessor for WalkingSteadinessFeatureStatusActionHandler, (uint64_t)&unk_231D800D4);
}

uint64_t sub_231D619DC()
{
  return sub_231D565BC(&qword_25419B4D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE41698], MEMORY[0x24BE41690]);
}

uint64_t sub_231D61A0C(uint64_t a1, uint64_t a2)
{
  return sub_231D565BC(&qword_25419BAF0, a2, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider, (uint64_t)&unk_231D817BC);
}

uint64_t sub_231D61A38()
{
  return sub_231D565BC(qword_255F727F8, 255, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData, (uint64_t)&unk_231D8007C);
}

uint64_t sub_231D61A68()
{
  return sub_231D565BC(&qword_25419BCC8, 255, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData, (uint64_t)&unk_231D80054);
}

void sub_231D61A98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419B540)
  {
    sub_231D5DF10(255, &qword_25419B500);
    sub_231D61B28(&qword_25419B508, &qword_25419B500);
    v0 = sub_231D7EE2C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419B540);
  }
}

uint64_t sub_231D61B28(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_231D5DF10(255, a2);
    result = MEMORY[0x2348F00E0](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_231D61B68()
{
  return swift_release();
}

uint64_t sub_231D61B70()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  sub_231D61C68();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_231D818B0;
  *(_QWORD *)(inited + 32) = (id)HKMobilityWalkingSteadinessType();
  *(_QWORD *)(inited + 40) = (id)HKMobilityWalkingSteadinessEventType();
  sub_231D7EBEC();
  if (inited >> 62)
  {
    sub_231D7E514();
    v3 = sub_231D7EEA4();
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
  sub_231D61CE4(inited, &qword_25419B548, &qword_25419B510, 0x24BDD3F08, &qword_25419B518);
  v2 = v1;
LABEL_6:
  result = swift_bridgeObjectRelease();
  qword_25419BED8 = v2;
  return result;
}

void sub_231D61C68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419BD50)
  {
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419BD50);
  }
}

void sub_231D61CC0(unint64_t a1)
{
  sub_231D61CE4(a1, (unint64_t *)&qword_25419B540, &qword_25419B500, 0x24BDD3DC0, &qword_25419B508);
}

void sub_231D61CE4(unint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  id v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v49;

  v7 = a1;
  v8 = a1 >> 62;
  if (a1 >> 62)
  {
    sub_231D7E514();
    v11 = sub_231D7EEA4();
    swift_bridgeObjectRelease();
    if (v11)
    {
LABEL_3:
      sub_231D62058(0, a2, a3, a4, a5);
      v9 = sub_231D7EE20();
      if (!v8)
        goto LABEL_4;
LABEL_8:
      sub_231D7E514();
      v10 = sub_231D7EEA4();
      swift_bridgeObjectRelease();
      if (!v10)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v9 = MEMORY[0x24BEE4B08];
  if (v8)
    goto LABEL_8;
LABEL_4:
  v10 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
    return;
LABEL_9:
  v12 = v9 + 56;
  v49 = v10;
  if ((v7 & 0xC000000000000001) != 0)
  {
    v13 = 0;
    v45 = v7;
    while (1)
    {
      v14 = MEMORY[0x2348EFB4C](v13, v7);
      v15 = __OFADD__(v13++, 1);
      if (v15)
      {
        __break(1u);
        goto LABEL_37;
      }
      v16 = v14;
      v17 = sub_231D7ED78();
      v18 = -1 << *(_BYTE *)(v9 + 32);
      v19 = v17 & ~v18;
      v20 = v19 >> 6;
      v21 = *(_QWORD *)(v12 + 8 * (v19 >> 6));
      v22 = 1 << v19;
      if (((1 << v19) & v21) != 0)
      {
        sub_231D5DF10(0, a3);
        v23 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v19);
        v24 = sub_231D7ED84();

        if ((v24 & 1) != 0)
        {
LABEL_11:
          sub_231D7E784();
          v7 = v45;
          goto LABEL_12;
        }
        v25 = ~v18;
        while (1)
        {
          v19 = (v19 + 1) & v25;
          v20 = v19 >> 6;
          v21 = *(_QWORD *)(v12 + 8 * (v19 >> 6));
          v22 = 1 << v19;
          if ((v21 & (1 << v19)) == 0)
            break;
          v26 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v19);
          v27 = sub_231D7ED84();

          if ((v27 & 1) != 0)
            goto LABEL_11;
        }
        v7 = v45;
      }
      *(_QWORD *)(v12 + 8 * v20) = v22 | v21;
      *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v19) = v16;
      v28 = *(_QWORD *)(v9 + 16);
      v15 = __OFADD__(v28, 1);
      v29 = v28 + 1;
      if (v15)
        goto LABEL_38;
      *(_QWORD *)(v9 + 16) = v29;
LABEL_12:
      if (v13 == v49)
        return;
    }
  }
  v30 = 0;
  v46 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v30 != v46)
  {
    v31 = *(id *)(v7 + 32 + 8 * v30);
    v32 = sub_231D7ED78();
    v33 = -1 << *(_BYTE *)(v9 + 32);
    v34 = v32 & ~v33;
    v35 = v34 >> 6;
    v36 = *(_QWORD *)(v12 + 8 * (v34 >> 6));
    v37 = 1 << v34;
    if (((1 << v34) & v36) != 0)
    {
      sub_231D5DF10(0, a3);
      v38 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v34);
      v39 = sub_231D7ED84();

      if ((v39 & 1) != 0)
        goto LABEL_24;
      v40 = ~v33;
      v34 = (v34 + 1) & v40;
      v35 = v34 >> 6;
      v36 = *(_QWORD *)(v12 + 8 * (v34 >> 6));
      v37 = 1 << v34;
      if ((v36 & (1 << v34)) != 0)
      {
        while (1)
        {
          v41 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v34);
          v42 = sub_231D7ED84();

          if ((v42 & 1) != 0)
            break;
          v34 = (v34 + 1) & v40;
          v35 = v34 >> 6;
          v36 = *(_QWORD *)(v12 + 8 * (v34 >> 6));
          v37 = 1 << v34;
          if ((v36 & (1 << v34)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v10 = v49;
        goto LABEL_25;
      }
LABEL_32:
      v10 = v49;
    }
    *(_QWORD *)(v12 + 8 * v35) = v37 | v36;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v34) = v31;
    v43 = *(_QWORD *)(v9 + 16);
    v15 = __OFADD__(v43, 1);
    v44 = v43 + 1;
    if (v15)
      goto LABEL_39;
    *(_QWORD *)(v9 + 16) = v44;
LABEL_25:
    if (++v30 == v10)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_231D62058(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    sub_231D5DF10(255, a3);
    sub_231D61B28(a5, a3);
    v8 = sub_231D7EE2C();
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_231D620E0(uint64_t a1)
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
    sub_231D6227C();
    v3 = sub_231D7EE20();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_231D7EFB8();
      sub_231D7E514();
      sub_231D7EBA4();
      result = sub_231D7EFD0();
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
        if (v17 || (result = sub_231D7EF88(), (result & 1) != 0))
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
            result = sub_231D7EF88();
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

void sub_231D6227C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419B538)
  {
    v0 = sub_231D7EE2C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419B538);
  }
}

uint64_t type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController()
{
  uint64_t result;

  result = qword_25419B4F0;
  if (!qword_25419B4F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231D62314()
{
  uint64_t result;
  unint64_t v1;

  result = sub_231D7E9B8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_231D62388()
{
  uint64_t v1;

  v1 = sub_231D7EB74();
  sub_231D7E514();
  sub_231D7EBB0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_231D623F4()
{
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_231D623FC(uint64_t *a1))()
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_231D7EB74();
  v5 = v2;
  sub_231D7E514();
  sub_231D7EBB0();
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v5;
  return sub_231D62484;
}

uint64_t sub_231D62484()
{
  return swift_bridgeObjectRelease();
}

id sub_231D6248C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  if (a3)
  {
    sub_231D7EB74();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a4;
  sub_231D7E994();
  if (v7)
  {
    v9 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, v8);

  return v10;
}

id sub_231D62558(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  sub_231D7E994();
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, v4);

  return v5;
}

uint64_t sub_231D625CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_25419B4E8;
  v2 = sub_231D7E9B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

id sub_231D62608()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_231D6263C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + qword_25419B4E8;
  v2 = sub_231D7E9B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_231D62678()
{
  return type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
}

void sub_231D62680(uint64_t a1, void *a2)
{
  sub_231D626A8(a2);
}

void sub_231D626A8(void *a1)
{
  uint64_t v2;
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
  char *v15;
  Class isa;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  id v67;
  char *v68;
  id v69;
  NSObject *v70;
  uint64_t ObjectType;
  uint64_t v72;
  uint64_t v73;

  ObjectType = swift_getObjectType();
  v2 = sub_231D7E9B8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v57 - v5;
  v7 = sub_231D7E0C4();
  v58 = *(_QWORD *)(v7 - 8);
  v59 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v60 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v62 = (uint64_t)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v57 - v12;
  sub_231D63048();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_231D7DF80();
  isa = v70[-1].isa;
  MEMORY[0x24BDAC7A8](v70);
  v68 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_231D7E904();
  v66 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = a1;
  v21 = objc_msgSend(a1, sel_resolvedHealthStore);
  if (v21)
  {
    v57 = v18;
    v63 = v3;
    v64 = v2;
    v22 = *MEMORY[0x24BDD2EA0];
    v23 = v21;
    v24 = objc_allocWithZone(MEMORY[0x24BDD3BF8]);
    v69 = v23;
    v25 = objc_msgSend(v24, sel_initWithFeatureIdentifier_healthStore_, v22, v23);
    sub_231D5DF10(0, (unint64_t *)&qword_25419B528);
    v67 = v25;
    sub_231D7E91C();
    v31 = (void *)sub_231D7E910();
    sub_231D68268(v31, (uint64_t)v20, sub_231D70F38, 0, (uint64_t)v15);

    v32 = v70;
    if ((*((unsigned int (**)(char *, uint64_t, NSObject *))isa + 6))(v15, 1, v70) == 1)
    {
      sub_231D541F8((uint64_t)v15, (uint64_t (*)(_QWORD))sub_231D63048);
      sub_231D7E994();
      v33 = sub_231D7E9AC();
      v34 = sub_231D7EC4C();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v73 = v36;
        *(_DWORD *)v35 = 136446210;
        v37 = sub_231D7F018();
        v72 = sub_231D6475C(v37, v38, &v73);
        sub_231D7EDB4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231D49000, v33, v34, "[%{public}s] Unable to create feature status configuration", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v36, -1, -1);
        MEMORY[0x2348F0170](v35, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v63 + 8))(v6, v64);
      v39 = *(void (**)(char *, uint64_t))(v66 + 8);
    }
    else
    {
      (*((void (**)(char *, char *, NSObject *))isa + 4))(v68, v15, v32);
      v40 = v65;
      sub_231D69C10(v65);
      v41 = sub_231D7E9AC();
      v42 = sub_231D7EC64();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = swift_slowAlloc();
        v44 = swift_slowAlloc();
        v73 = v44;
        *(_DWORD *)v43 = 136315394;
        v45 = sub_231D7F018();
        v72 = sub_231D6475C(v45, v46, &v73);
        sub_231D7EDB4();
        v40 = v65;
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 12) = 2080;
        v72 = sub_231D6475C(0xD000000000000014, 0x8000000231D83EB0, &v73);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v41, v42, "[%s.%s]: Presenting walking steadiness settings view", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v44, -1, -1);
        MEMORY[0x2348F0170](v43, -1, -1);
      }

      v48 = v66;
      v47 = v67;
      v50 = (uint64_t)v60;
      v49 = v61;
      v52 = v58;
      v51 = v59;
      v53 = v62;
      sub_231D5D9A4((uint64_t)v40, v62);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v52 + 104))(v50, *MEMORY[0x24BE42158], v51);
      v54 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessFeatureStatusViewController(0));
      v55 = v69;
      v56 = sub_231D5D64C(v53, v55, v50);
      objc_msgSend(v49, sel_showViewController_sender_, v56, 0);

      sub_231D541F8((uint64_t)v40, (uint64_t (*)(_QWORD))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      (*((void (**)(char *, NSObject *))isa + 1))(v68, v70);
      v39 = *(void (**)(char *, uint64_t))(v48 + 8);
    }
    v39(v20, v57);
  }
  else
  {
    v70 = sub_231D7E9AC();
    v26 = sub_231D7EC4C();
    if (os_log_type_enabled(v70, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v73 = v28;
      *(_DWORD *)v27 = 136315394;
      v29 = sub_231D7F018();
      v72 = sub_231D6475C(v29, v30, &v73);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      v72 = sub_231D6475C(0xD000000000000014, 0x8000000231D83EB0, &v73);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v70, v26, "[%s.%s] No available health store for walking steadiness settings view", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v28, -1, -1);
      MEMORY[0x2348F0170](v27, -1, -1);
    }

  }
}

void sub_231D63048()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419BD60)
  {
    sub_231D7DF80();
    v0 = sub_231D7EDA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419BD60);
  }
}

char *WalkingSteadinessOnboardingViewController.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  objc_class *v5;
  id v11;

  v11 = objc_allocWithZone(v5);
  return WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(a1, a2, a3, a4, a5);
}

uint64_t sub_231D630FC()
{
  uint64_t v0;

  v0 = sub_231D7E9B8();
  sub_231D4E6D8(v0, qword_255F72EC8);
  sub_231D4E718(v0, (uint64_t)qword_255F72EC8);
  return sub_231D7E994();
}

void *WalkingSteadinessOnboardingViewController.coordinator.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void WalkingSteadinessOnboardingViewController.coordinator.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*WalkingSteadinessOnboardingViewController.coordinator.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

char *WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  _BYTE *v5;
  _BYTE *v6;
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  void *v23;
  char v28[40];
  objc_super v29;
  _QWORD v30[5];

  v6 = v5;
  swift_getObjectType();
  *(_QWORD *)&v6[OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator] = 0;
  v6[OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_navigateToDetailRoomUponOnboardingCompletion] = a4;
  v30[3] = sub_231D5DF10(0, &qword_255F72EF0);
  v30[4] = MEMORY[0x24BE46E80];
  v30[0] = a1;
  sub_231D7E004();
  swift_allocObject();
  v11 = a1;
  sub_231D7DFF8();
  sub_231D7E01C();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2EA0], v11);
  swift_retain();
  sub_231D7E010();
  v29.receiver = v6;
  v29.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingViewController();
  v12 = objc_msgSendSuper2(&v29, sel_initWithNibName_bundle_, 0, 0);
  sub_231D52040(a2, (uint64_t)v30);
  sub_231D52040(a3, (uint64_t)v28);
  sub_231D7E064();
  swift_allocObject();
  v13 = v11;
  swift_retain();
  v14 = (char *)v12;
  swift_retain();
  sub_231D7E058();
  objc_msgSend(v14, sel_setModalPresentationStyle_, 2);
  sub_231D565BC(&qword_255F72EF8, v15, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessOnboardingViewController, (uint64_t)&protocol conformance descriptor for WalkingSteadinessOnboardingViewController);
  v16 = v13;
  swift_retain();
  sub_231D7DF44();
  v17 = objc_allocWithZone((Class)sub_231D7E04C());
  sub_231D7E040();
  sub_231D565BC(&qword_255F72F00, v18, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessOnboardingViewController, (uint64_t)&protocol conformance descriptor for WalkingSteadinessOnboardingViewController);
  v19 = objc_allocWithZone((Class)sub_231D7E034());
  v20 = sub_231D7E028();
  swift_release();

  v21 = sub_231D7E22C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(a5, v21);
  sub_231D4CEE8(a3);
  sub_231D4CEE8(a2);
  v22 = (void **)&v14[OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator];
  swift_beginAccess();
  v23 = *v22;
  *v22 = (void *)v20;

  return v14;
}

uint64_t WalkingSteadinessOnboardingViewController.dismiss(dueToCompletion:deepLinkUrlToUse:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t aBlock;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t (*v65)();
  uint64_t v66;

  v59 = a2;
  ObjectType = swift_getObjectType();
  sub_231D646A0();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_231D7DAE8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v4;
  v16[3] = a3;
  v16[4] = a4;
  if ((a1 & 1) == 0
    || *((_BYTE *)v4
       + OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_navigateToDetailRoomUponOnboardingCompletion) != 1)
  {
    sub_231D64734(a3);
    v35 = qword_255F724E8;
    v36 = v4;
    if (v35 != -1)
      swift_once();
    v37 = sub_231D7E9B8();
    sub_231D4E718(v37, (uint64_t)qword_255F72EC8);
    v38 = sub_231D7E9AC();
    v39 = sub_231D7EC64();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc();
      v58 = a4;
      v41 = v40;
      v42 = swift_slowAlloc();
      aBlock = v42;
      *(_DWORD *)v41 = 136446466;
      v43 = sub_231D7F018();
      v60 = sub_231D6475C(v43, v44, &aBlock);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2082;
      v60 = sub_231D6475C(0xD000000000000035, 0x8000000231D83F10, &aBlock);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v38, v39, "[%{public}s.%{public}s]: Dismissing onboarding and landing back where user was before", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v42, -1, -1);
      v45 = v41;
      a4 = v58;
      MEMORY[0x2348F0170](v45, -1, -1);
    }

    if (a3)
    {
      v65 = (uint64_t (*)())a3;
      v66 = a4;
      aBlock = MEMORY[0x24BDAC760];
      v62 = 1107296256;
      v63 = sub_231D5D244;
      v64 = &unk_2500C9278;
      v34 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(v36, sel_dismissViewControllerAnimated_completion_, 1, v34);
    goto LABEL_20;
  }
  v58 = a4;
  sub_231D64734(a3);
  v17 = qword_255F724E8;
  v57 = v4;
  if (v17 != -1)
    swift_once();
  v18 = sub_231D7E9B8();
  v19 = sub_231D4E718(v18, (uint64_t)qword_255F72EC8);
  v20 = sub_231D7E9AC();
  v21 = sub_231D7EC64();
  v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = swift_slowAlloc();
    v55 = v19;
    v53 = v22;
    v24 = v23;
    v54 = swift_slowAlloc();
    aBlock = v54;
    *(_DWORD *)v24 = 136446466;
    v52[1] = v24 + 4;
    v25 = sub_231D7F018();
    v60 = sub_231D6475C(v25, v26, &aBlock);
    v56 = ObjectType;
    sub_231D7EDB4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    v60 = sub_231D6475C(0xD000000000000035, 0x8000000231D83F10, &aBlock);
    sub_231D7EDB4();
    _os_log_impl(&dword_231D49000, v20, (os_log_type_t)v53, "[%{public}s.%{public}s]: Dismissing onboarding and navigating to Walking Steadiness detail room", (uint8_t *)v24, 0x16u);
    v27 = v54;
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v27, -1, -1);
    MEMORY[0x2348F0170](v24, -1, -1);
  }

  sub_231D64DC4(v59, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_231D64E08((uint64_t)v11);
    v28 = sub_231D7E9AC();
    v29 = sub_231D7EC58();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      aBlock = v31;
      *(_DWORD *)v30 = 136446466;
      v32 = sub_231D7F018();
      v60 = sub_231D6475C(v32, v33, &aBlock);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      v60 = sub_231D6475C(0xD000000000000035, 0x8000000231D83F10, &aBlock);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v28, v29, "[%{public}s.%{public}s]: Failed to construct deep link URL to go to detail room after onboarding completed", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v31, -1, -1);
      MEMORY[0x2348F0170](v30, -1, -1);
    }

    if (a3)
    {
      v65 = (uint64_t (*)())a3;
      v66 = v58;
      aBlock = MEMORY[0x24BDAC760];
      v62 = 1107296256;
      v63 = sub_231D5D244;
      v64 = &unk_2500C92A0;
      v34 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(v57, sel_dismissViewControllerAnimated_completion_, 1, v34);
LABEL_20:
    _Block_release(v34);
    return swift_release();
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  v47 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v48 = (void *)sub_231D7DAD0();
  sub_231D63E64(MEMORY[0x24BEE4AF8]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_231D565BC(&qword_255F72620, 255, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F814);
  v49 = (void *)sub_231D7EB20();
  swift_bridgeObjectRelease();
  v50 = swift_allocObject();
  *(_QWORD *)(v50 + 16) = sub_231D64728;
  *(_QWORD *)(v50 + 24) = v16;
  v65 = sub_231D64E68;
  v66 = v50;
  aBlock = MEMORY[0x24BDAC760];
  v62 = 1107296256;
  v63 = sub_231D553D4;
  v64 = &unk_2500C92F0;
  v51 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v47, sel_openURL_options_completionHandler_, v48, v49, v51);
  _Block_release(v51);
  swift_release();

  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_231D63DB8(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[6];

  if (a2)
  {
    v5[4] = a2;
    v5[5] = a3;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 1107296256;
    v5[2] = sub_231D5D244;
    v5[3] = &unk_2500C9368;
    v4 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, v4);
  _Block_release(v4);
}

unint64_t sub_231D63E64(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_231D64F44(0, &qword_255F72F48, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, &qword_255F72620, (uint64_t)&unk_231D7F814);
  v2 = sub_231D7EEC8();
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
    sub_231D64E88(v6, (uint64_t)&v13, (unint64_t *)&unk_255F72F50, type metadata accessor for OpenExternalURLOptionsKey);
    v7 = v13;
    result = sub_231D746A4(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_231D64ED4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_231D63FB8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_231D64F44(0, (unint64_t *)&qword_255F72F30, (uint64_t (*)(uint64_t))type metadata accessor for Key, (unint64_t *)&qword_255F72778, (uint64_t)&unk_231D7FF30);
  v2 = sub_231D7EEC8();
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
    sub_231D64E88(v6, (uint64_t)&v13, (unint64_t *)&qword_255F72F38, type metadata accessor for Key);
    v7 = v13;
    result = sub_231D746A4(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_231D64ED4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

id WalkingSteadinessOnboardingViewController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;

  v3 = a2;
  if (!a1)
  {
    ObjCClassFromMetadata = 0;
    if (!a2)
      return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
    goto LABEL_3;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (v3)
LABEL_3:
    v3 = swift_getObjCClassFromMetadata();
  return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void WalkingSteadinessOnboardingViewController.init(navigationBarClass:toolbarClass:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingViewController.__allocating_init(rootViewController:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void WalkingSteadinessOnboardingViewController.init(rootViewController:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void WalkingSteadinessOnboardingViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_231D64374()
{
  void *v0;

  return objc_msgSend(v0, sel_presentationController);
}

void sub_231D64398(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  _QWORD v8[6];

  if (a3)
  {
    v8[4] = a3;
    v8[5] = a4;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_231D5D244;
    v8[3] = &unk_2500C9340;
    v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, sel_presentViewController_animated_completion_, a1, a2 & 1, v7);
  _Block_release(v7);
}

void sub_231D64454(uint64_t a1, char a2)
{
  void *v2;
  id v4;

  sub_231D5DF10(0, &qword_255F72F40);
  v4 = (id)sub_231D7EBD4();
  objc_msgSend(v2, sel_setViewControllers_animated_, v4, a2 & 1);

}

uint64_t sub_231D644CC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;

  sub_231D64EE4(a2, (uint64_t)v11);
  v4 = v12;
  if (v12)
  {
    v5 = sub_231D4DC30(v11, v12);
    v6 = *(_QWORD *)(v4 - 8);
    MEMORY[0x24BDAC7A8](v5);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    v9 = sub_231D7EF7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    sub_231D4CEE8((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v2, sel_showViewController_sender_, a1, v9);
  return sub_231D7E784();
}

void sub_231D645C8(char a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v6[6];

  if (a2)
  {
    v6[4] = a2;
    v6[5] = a3;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 1107296256;
    v6[2] = sub_231D5D244;
    v6[3] = &unk_2500C9318;
    v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, a1 & 1, v5);
  _Block_release(v5);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingViewController()
{
  return objc_opt_self();
}

void sub_231D646A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419BD58)
  {
    sub_231D7DAE8();
    v0 = sub_231D7EDA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419BD58);
  }
}

uint64_t sub_231D646F4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void sub_231D64728()
{
  uint64_t v0;

  sub_231D63DB8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_231D64734(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_231D64744(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D64754()
{
  return swift_release();
}

uint64_t sub_231D6475C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_231D6482C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_231D65034((uint64_t)v12, *a3);
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
      sub_231D65034((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_231D7E514();
  }
  sub_231D4CEE8((uint64_t)v12);
  return v7;
}

uint64_t sub_231D6482C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_231D7EDC0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_231D649E4(a5, a6);
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
  v8 = sub_231D7EE80();
  if (!v8)
  {
    sub_231D7EE8C();
    __break(1u);
LABEL_17:
    result = sub_231D7EEE0();
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

uint64_t sub_231D649E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_231D64A78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_231D64C64(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_231D64C64(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_231D64A78(uint64_t a1, unint64_t a2)
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
      v3 = sub_231D64BEC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_231D7EE44();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_231D7EE8C();
      __break(1u);
LABEL_10:
      v2 = sub_231D7EBBC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_231D7EEE0();
    __break(1u);
LABEL_14:
    result = sub_231D7EE8C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_231D64BEC(uint64_t a1, uint64_t a2)
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
  sub_231D4DD6C(0, qword_25419B568, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_231D64C64(char a1, int64_t a2, char a3, char *a4)
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
    sub_231D4DD6C(0, qword_25419B568, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_231D7EEE0();
  __break(1u);
  return result;
}

uint64_t sub_231D64DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D646A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_231D64E08(uint64_t a1)
{
  uint64_t v2;

  sub_231D646A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D64E44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D64E68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_231D64E88(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_231D64FD4(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

_OWORD *sub_231D64ED4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_231D64EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D4DD6C(0, &qword_25419BDC8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_231D64F44(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    a3(255);
    sub_231D565BC(a4, 255, a3, a5);
    v9 = sub_231D7EED4();
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_231D64FD4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t TupleTypeMetadata2;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

uint64_t sub_231D65034(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_231D65098@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v43 = *v1;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v39 - v4;
  v6 = sub_231D7DEC0();
  MEMORY[0x24BDAC7A8](v6);
  v44 = sub_231D7DFBC();
  MEMORY[0x24BDAC7A8](v44);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_231D7E9B8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v39 - v14;
  v16 = (void *)sub_231D7E910();
  v17 = objc_msgSend(v16, sel_areAllRequirementsSatisfied);

  if (v17)
  {
    sub_231D7E988();
    v18 = sub_231D7E9AC();
    v19 = sub_231D7EC64();
    v20 = os_log_type_enabled(v18, v19);
    v41 = a1;
    v42 = v8;
    if (v20)
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v46 = v22;
      *(_DWORD *)v21 = 136446466;
      v40 = v9;
      v23 = sub_231D7F018();
      v45 = sub_231D6475C(v23, v24, &v46);
      v43 = v10;
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      v45 = sub_231D6475C(0xD000000000000017, 0x8000000231D84360, &v46);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v18, v19, "[%{public}s.%{public}s]: Creating walking steadiness promo tile configuration", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v22, -1, -1);
      MEMORY[0x2348F0170](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v15, v40);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    }
    v43 = sub_231D7EB74();
    v40 = v31;
    sub_231D5DF10(0, (unint64_t *)&qword_25419B530);
    sub_231D7ED6C();
    sub_231D7DEB4();
    sub_231D7DFB0();
    swift_storeEnumTagMultiPayload();
    v32 = sub_231D7DB48();
    v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v33(v5, 1, 1, v32);
    if (qword_25419BDC0 != -1)
      swift_once();
    v34 = sub_231D7DFEC();
    sub_231D4E718(v34, (uint64_t)qword_25419BF18);
    sub_231D7E0AC();
    sub_231D5F3AC((uint64_t)v5);
    v33(v5, 1, 1, v32);
    sub_231D7E0AC();
    sub_231D5F3AC((uint64_t)v5);
    v33(v5, 1, 1, v32);
    sub_231D7E0AC();
    sub_231D5F3AC((uint64_t)v5);
    v35 = v41;
    sub_231D7DFA4();
    v36 = sub_231D7DFC8();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v35, 0, 1, v36);
  }
  else
  {
    sub_231D7E988();
    v25 = sub_231D7E9AC();
    v26 = sub_231D7EC64();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v46 = v28;
      *(_DWORD *)v27 = 136446466;
      v40 = v9;
      v29 = sub_231D7F018();
      v45 = sub_231D6475C(v29, v30, &v46);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2082;
      v45 = sub_231D6475C(0xD000000000000017, 0x8000000231D84360, &v46);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v25, v26, "[%{public}s.%{public}s]: Onboarding promotion context not satisfied, no promotion tile", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v28, -1, -1);
      MEMORY[0x2348F0170](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v40);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    v38 = sub_231D7DFC8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(a1, 1, 1, v38);
  }
}

uint64_t sub_231D657A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t *, _QWORD);
  void *v16;
  unsigned int v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  void **v33;
  void (*v34)(uint64_t *, _QWORD);
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
  id v42;
  char *v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  unint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77[5];

  v71 = *v2;
  v75 = sub_231D7E9B8();
  v5 = *(_QWORD *)(v75 - 8);
  v6 = MEMORY[0x24BDAC7A8](v75);
  v70 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v62 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v62 - v11;
  v13 = sub_231D7DD04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a2, a1, v13);
  if (qword_25419B4E0 != -1)
    swift_once();
  sub_231D5DF10(0, &qword_25419B510);
  v14 = sub_231D7EC28();
  v15 = (void (*)(uint64_t *, _QWORD))sub_231D7DCE0();
  sub_231D65F14(v14);
  v15(v77, 0);
  v16 = (void *)sub_231D7E910();
  v17 = objc_msgSend(v16, sel_areAllRequirementsSatisfied);

  sub_231D7E988();
  v18 = sub_231D7E9AC();
  v19 = sub_231D7EC64();
  v20 = os_log_type_enabled(v18, v19);
  v67 = a2;
  if (!v20)
  {

    v74 = *(_QWORD *)(v5 + 8);
    ((void (*)(char *, uint64_t))v74)(v12, v75);
    if ((v17 & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v21 = swift_slowAlloc();
  LODWORD(v73) = v17;
  v22 = v21;
  v23 = swift_slowAlloc();
  v74 = v5;
  v24 = v23;
  v77[0] = v23;
  *(_DWORD *)v22 = 136446722;
  v25 = sub_231D7F018();
  v76 = sub_231D6475C(v25, v26, v77);
  sub_231D7EDB4();
  swift_bridgeObjectRelease();
  *(_WORD *)(v22 + 12) = 2082;
  v76 = sub_231D6475C(0xD000000000000026, 0x8000000231D84330, v77);
  sub_231D7EDB4();
  *(_WORD *)(v22 + 22) = 1024;
  v27 = v73;
  LODWORD(v76) = v73;
  sub_231D7EDB4();
  _os_log_impl(&dword_231D49000, v18, v19, "[%{public}s.%{public}s]: Setting hide from discover to %{BOOL}d given promotion requirements", (uint8_t *)v22, 0x1Cu);
  swift_arrayDestroy();
  MEMORY[0x2348F0170](v24, -1, -1);
  MEMORY[0x2348F0170](v22, -1, -1);

  v74 = *(_QWORD *)(v74 + 8);
  ((void (*)(char *, uint64_t))v74)(v12, v75);
  if ((v27 & 1) == 0)
LABEL_7:
    sub_231D7DCA4();
LABEL_8:
  v28 = (void *)sub_231D7E910();
  v29 = objc_msgSend(v28, sel_unsatisfiedRequirementIdentifiers);

  type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
  v30 = sub_231D7EBE0();

  v63 = v30;
  v32 = *(_QWORD *)(v30 + 16);
  if (v32)
  {
    v33 = (void **)(v63 + 32);
    v73 = *MEMORY[0x24BDD2D30];
    *(_QWORD *)&v31 = 136446722;
    v66 = v31;
    v69 = (unint64_t)"SetUpWalkingSteadiness";
    v65 = 0x8000000231D84330;
    v64 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v31 = 136446466;
    v68 = v31;
    v72 = 0x8000000231D82AA0;
    while (1)
    {
      v35 = *v33;
      v36 = sub_231D7EB74();
      v38 = v37;
      if (v36 == sub_231D7EB74() && v38 == v39)
        break;
      v41 = sub_231D7EF88();
      v42 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v41 & 1) != 0)
        goto LABEL_20;
      v43 = v70;
      sub_231D7E988();
      v44 = v42;
      v45 = sub_231D7E9AC();
      v46 = sub_231D7EC58();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = swift_slowAlloc();
        v48 = swift_slowAlloc();
        v77[0] = v48;
        *(_DWORD *)v47 = v66;
        v49 = sub_231D7F018();
        *(_QWORD *)(v47 + 4) = sub_231D6475C(v49, v50, v77);
        swift_bridgeObjectRelease();
        *(_WORD *)(v47 + 12) = 2082;
        *(_QWORD *)(v47 + 14) = sub_231D6475C(0xD000000000000026, v65, v77);
        *(_WORD *)(v47 + 22) = 2080;
        v51 = sub_231D7EB74();
        *(_QWORD *)(v47 + 24) = sub_231D6475C(v51, v52, v77);

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231D49000, v45, v46, "[%{public}s.%{public}s]: Unaccounted feature tag with identifier: %s", (uint8_t *)v47, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v48, -1, -1);
        MEMORY[0x2348F0170](v47, -1, -1);

        v53 = v70;
      }
      else
      {

        v53 = v43;
      }
      ((void (*)(char *, uint64_t))v74)(v53, v75);
LABEL_11:
      ++v33;
      if (!--v32)
        return swift_bridgeObjectRelease();
    }
    v54 = v35;
    swift_bridgeObjectRelease_n();
LABEL_20:
    sub_231D7E988();
    v55 = sub_231D7E9AC();
    v56 = sub_231D7EC64();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = swift_slowAlloc();
      v58 = swift_slowAlloc();
      v77[0] = v58;
      *(_DWORD *)v57 = v68;
      v59 = sub_231D7F018();
      *(_QWORD *)(v57 + 4) = sub_231D6475C(v59, v60, v77);
      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 12) = 2082;
      *(_QWORD *)(v57 + 14) = sub_231D6475C(0xD000000000000026, v69 | 0x8000000000000000, v77);
      _os_log_impl(&dword_231D49000, v55, v56, "[%{public}s.%{public}s]: Setting HeightNotAvailable feature tag", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v58, -1, -1);
      MEMORY[0x2348F0170](v57, -1, -1);
    }

    ((void (*)(char *, uint64_t))v74)(v10, v75);
    v34 = (void (*)(uint64_t *, _QWORD))sub_231D7DCE0();
    sub_231D669D4(&v76, 0xD000000000000023, v72);
    swift_bridgeObjectRelease();
    v34(v77, 0);

    goto LABEL_11;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_231D65F14(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    sub_231D7E514();
    sub_231D669D4(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessPromotionFeedItemProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WalkingSteadinessPromotionActionHandler()
{
  uint64_t result;

  result = qword_25419BA40;
  if (!qword_25419BA40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231D660DC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_231D66118@<X0>(uint64_t a1@<X8>)
{
  return sub_231D65098(a1);
}

void sub_231D6613C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t sub_231D6614C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_231D657A0(a1, a2);
}

uint64_t sub_231D6616C()
{
  return sub_231D7EB74();
}

uint64_t sub_231D6617C(uint64_t a1)
{
  MEMORY[0x2348F00E0](&unk_231D81B00, a1);
  return sub_231D7E7FC();
}

uint64_t sub_231D661C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2348F00E0](&unk_231D81B00, a3);
  return sub_231D7E7F0();
}

unint64_t sub_231D6620C()
{
  return 0xD000000000000016;
}

void sub_231D66228()
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
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(unint64_t, uint64_t, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  char *v36;
  char v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  id v50;
  char *v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  void (*v57)(char *, uint64_t);
  char *v58;
  char *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  _QWORD v65[3];
  uint64_t v66;
  char v67[40];
  _QWORD v68[4];
  char v69[40];
  _QWORD v70[4];

  v1 = sub_231D7E22C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v59 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v53 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v64 = (char *)&v53 - v7;
  v8 = sub_231D7E6F4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v58 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v63 = (char *)&v53 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v53 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v53 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v53 - v20;
  sub_231D7E7C0();
  sub_231D7E6D0();
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v21, v8);
  sub_231D4DC30(v70, v70[3]);
  v60 = (void *)sub_231D7E6A0();
  v62 = v0;
  sub_231D7E7C0();
  v23 = (void *)sub_231D7E6DC();
  v22(v19, v8);
  sub_231D7ECA0();

  sub_231D7E7C0();
  sub_231D7E6D0();
  v24 = v16;
  v25 = v8;
  v22(v24, v8);
  sub_231D4DC30(v68, v68[3]);
  sub_231D7E6B8();
  sub_231D4E564(0, &qword_255F72F70, (uint64_t (*)(uint64_t))MEMORY[0x24BE42678], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v26 = *(_QWORD *)(v2 + 72);
  v27 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_231D80E20;
  v53 = v27;
  v29 = v28 + v27;
  v30 = *MEMORY[0x24BE425F0];
  v61 = v2;
  v31 = *(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 104);
  v31(v29, v30, v1);
  v54 = v26;
  v31(v29 + v26, *MEMORY[0x24BE42668], v1);
  v31(v29 + 2 * v26, *MEMORY[0x24BE42650], v1);
  v32 = v63;
  sub_231D7E7C0();
  sub_231D7E6D0();
  v57 = v22;
  v22(v32, v8);
  sub_231D4DC30(v65, v66);
  sub_231D7E6AC();
  v33 = *(_QWORD *)(v28 + 16);
  if (!v33)
  {
    v39 = v25;
    LODWORD(v56) = 0;
    v40 = (uint64_t)v59;
    v41 = v58;
    v42 = v57;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v1);
LABEL_16:
    swift_bridgeObjectRelease();
    sub_231D4CEE8((uint64_t)v65);
    sub_231D7E7C0();
    sub_231D7E6D0();
    v49 = v39;
    v42(v41, v39);
    sub_231D4DC30(v65, v66);
    sub_231D7E6AC();
    v50 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingViewController());
    v51 = WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(v60, (uint64_t)v69, (uint64_t)v67, (char)v56, v40);
    sub_231D4CEE8((uint64_t)v65);
    sub_231D4CEE8((uint64_t)v68);
    sub_231D4CEE8((uint64_t)v70);
    sub_231D7E7C0();
    v52 = (void *)sub_231D7E6DC();
    v42(v41, v49);
    objc_msgSend(v52, sel_presentViewController_animated_completion_, v51, 1, 0);

    return;
  }
  v55 = v25;
  v34 = v61;
  v35 = *(void (**)(char *, unint64_t, uint64_t))(v61 + 16);
  v36 = v56;
  v35(v56, v29, v1);
  sub_231D565BC(&qword_255F72F78, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE42678], MEMORY[0x24BE42688]);
  v37 = sub_231D7EB38();
  v38 = *(char **)(v34 + 8);
  sub_231D7E514();
  v63 = v38;
  ((void (*)(char *, uint64_t))v38)(v36, v1);
  if ((v37 & 1) != 0)
  {
    v39 = v55;
    swift_bridgeObjectRelease();
    LODWORD(v56) = 1;
    goto LABEL_7;
  }
  if (v33 == 1)
  {
    v39 = v55;
    swift_bridgeObjectRelease();
    LODWORD(v56) = 0;
LABEL_7:
    v40 = (uint64_t)v59;
    v41 = v58;
    v42 = v57;
LABEL_15:
    ((void (*)(char *, uint64_t))v63)(v64, v1);
    goto LABEL_16;
  }
  v43 = v36;
  v61 = v28;
  v44 = v28 + v54 + v53;
  v45 = v54;
  v46 = 1;
  while (1)
  {
    v35(v43, v44, v1);
    v47 = v46 + 1;
    if (__OFADD__(v46, 1))
      break;
    v48 = sub_231D7EB38();
    ((void (*)(char *, uint64_t))v63)(v43, v1);
    if ((v48 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      LODWORD(v56) = 1;
      goto LABEL_14;
    }
    ++v46;
    v44 += v45;
    if (v47 == v33)
    {
      swift_bridgeObjectRelease();
      LODWORD(v56) = 0;
LABEL_14:
      v39 = v55;
      v40 = (uint64_t)v59;
      v41 = v58;
      v42 = v57;
      goto LABEL_15;
    }
  }
  __break(1u);
}

id sub_231D668E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessPromotionActionHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_231D6691C()
{
  return type metadata accessor for WalkingSteadinessPromotionActionHandler();
}

uint64_t sub_231D66924()
{
  return sub_231D565BC(&qword_25419BB30, 255, MEMORY[0x24BE42BF8], MEMORY[0x24BE42BE8]);
}

uint64_t sub_231D66954()
{
  return sub_231D565BC(&qword_25419BA38, 255, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessPromotionActionHandler, (uint64_t)&unk_231D81A48);
}

uint64_t sub_231D66990(uint64_t a1, uint64_t a2)
{
  return sub_231D565BC(&qword_25419BA50, a2, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessPromotionFeedItemProvider, (uint64_t)&unk_231D81AB8);
}

uint64_t sub_231D669BC()
{
  return MEMORY[0x24BEE1798];
}

uint64_t sub_231D669C8()
{
  return MEMORY[0x24BEE1770];
}

uint64_t sub_231D669D4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_231D7EFB8();
  sub_231D7E514();
  sub_231D7EBA4();
  v8 = sub_231D7EFD0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_231D7EF88() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      sub_231D7E514();
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
      if (v19 || (sub_231D7EF88() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  sub_231D7E514();
  sub_231D66E58(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_231D66B80()
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
  sub_231D6227C();
  v3 = sub_231D7EE14();
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
      sub_231D7EFB8();
      sub_231D7EBA4();
      result = sub_231D7EFD0();
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

uint64_t sub_231D66E58(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_231D66B80();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_231D66FF0();
      goto LABEL_22;
    }
    sub_231D6719C();
  }
  v11 = *v4;
  sub_231D7EFB8();
  sub_231D7EBA4();
  result = sub_231D7EFD0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_231D7EF88(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_231D7EF94();
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
          result = sub_231D7EF88();
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

void *sub_231D66FF0()
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
  sub_231D6227C();
  v2 = *v0;
  v3 = sub_231D7EE08();
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
    result = (void *)sub_231D7E514();
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

uint64_t sub_231D6719C()
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
  sub_231D6227C();
  v3 = sub_231D7EE14();
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
    sub_231D7EFB8();
    sub_231D7E514();
    sub_231D7EBA4();
    result = sub_231D7EFD0();
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

ValueMetadata *_s43WalkingSteadinessChartOrOnboardingComponentVMa()
{
  return &_s43WalkingSteadinessChartOrOnboardingComponentVN;
}

uint64_t sub_231D67454(uint64_t a1, void *a2)
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
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  void *v28;

  v28 = a2;
  v3 = sub_231D7E5A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_231D7E658();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E64C();
  v11 = sub_231D7E304();
  v13 = v12;
  if (v11 == sub_231D7E304() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
LABEL_12:
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v22 = v28;
    goto LABEL_13;
  }
  v15 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  if ((v15 & 1) != 0)
    goto LABEL_12;
  sub_231D7E64C();
  v16 = sub_231D7E304();
  v18 = v17;
  if (v16 == sub_231D7E304() && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  v21 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v22 = v28;
  if ((v21 & 1) != 0)
  {
LABEL_13:
    v25 = v22;
    sub_231D7E598();
    v24 = sub_231D7E58C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return v24;
  }
  sub_231D6779C();
  v23 = (void *)sub_231D7E640();
  sub_231D67BF0(v22);

  sub_231D67E54();
  swift_allocObject();
  v24 = sub_231D7E538();
  sub_231D4CD8C(&qword_255F72FB0, (uint64_t (*)(uint64_t))sub_231D67E54, MEMORY[0x24BE43BF8]);
  return v24;
}

uint64_t sub_231D676EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_231D7E37C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E370();
  v4 = sub_231D7E340();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t sub_231D67778()
{
  return 0xD000000000000022;
}

uint64_t sub_231D67794(uint64_t a1)
{
  void **v1;

  return sub_231D67454(a1, *v1);
}

uint64_t sub_231D6779C()
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
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  Class v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  void (*v34)(uint64_t *, _QWORD);
  _QWORD *v35;
  uint64_t v36;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41[4];
  _QWORD v42[4];

  v0 = sub_231D7E37C();
  v40 = *(_QWORD *)(v0 - 8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v38 - v4;
  sub_231D7E628();
  sub_231D5DF10(0, &qword_255F72FC0);
  sub_231D68084(0, &qword_255F72FC8, (unint64_t *)&qword_255F72FD0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_231D7F620;
  sub_231D7DDA0();
  v7 = sub_231D7DD94();
  v9 = v8;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  v11 = sub_231D680D8();
  *(_QWORD *)(v6 + 64) = v11;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  v12 = sub_231D7EB74();
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = v11;
  *(_QWORD *)(v6 + 72) = v12;
  *(_QWORD *)(v6 + 80) = v13;
  v14 = (void *)sub_231D7EC40();
  v15 = (void *)sub_231D7DD70();
  v16 = (void *)MEMORY[0x2348EEA84]();
  sub_231D61C68();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_231D818B0;
  *(_QWORD *)(v17 + 32) = v14;
  *(_QWORD *)(v17 + 40) = v15;
  v41[0] = v17;
  sub_231D7EBEC();
  v39 = v14;
  v38 = v15;
  v18 = (void *)sub_231D7EBD4();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v18);

  objc_msgSend(v16, sel_setPredicate_, v19);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_231D81B70;
  v21 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v22 = (void *)sub_231D7EB44();
  v23 = objc_msgSend(v21, sel_initWithKey_ascending_, v22, 1);

  *(_QWORD *)(v20 + 32) = v23;
  v41[0] = v20;
  sub_231D7EBEC();
  sub_231D5DF10(0, &qword_255F72FE0);
  v24 = (void *)sub_231D7EBD4();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setSortDescriptors_, v24);

  sub_231D4DC30(v42, v42[3]);
  v25 = v16;
  v26 = (void *)sub_231D7DC68();
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB688]), sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v25, v26, 0, 0);

  sub_231D67EFC(0);
  v29 = objc_allocWithZone(v28);
  v30 = v27;
  v31 = (void *)sub_231D7E790();
  sub_231D7E364();
  sub_231D7E34C();
  v32 = v40;
  v33 = *(void (**)(char *, uint64_t))(v40 + 8);
  v33(v3, v0);
  v34 = (void (*)(uint64_t *, _QWORD))sub_231D7E358();
  *v35 = 0x4030000000000000;
  v34(v41, 0);
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v3, v5, v0);
  sub_231D67FAC();
  v36 = sub_231D7E328();

  v33(v3, v0);
  v33(v5, v0);
  sub_231D4CEE8((uint64_t)v42);
  return v36;
}

uint64_t sub_231D67BF0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v23 = sub_231D7DB3C();
  v2 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_231D7E454();
  v5 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_231D7E4A8();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BE43650];
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  sub_231D7E49C();
  sub_231D68084(0, (unint64_t *)&qword_255F725D0, &qword_255F725D8);
  v14 = swift_allocObject();
  v22 = xmmword_231D7F640;
  *(_OWORD *)(v14 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v14 + 56) = v8;
  *(_QWORD *)(v14 + 64) = sub_231D4CD8C(&qword_255F72FB8, v9, MEMORY[0x24BE43648]);
  v15 = sub_231D4CEA8((uint64_t *)(v14 + 32));
  (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(v15, v12, v8);
  sub_231D7DB30();
  sub_231D7DB24();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v23);
  sub_231D7E448();
  sub_231D68030();
  v16 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v22;
  v18 = v17 + v16;
  v19 = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 16))(v18, v7, v24);
  sub_231D7E730();
  swift_allocObject();
  v20 = sub_231D7E718();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  return v20;
}

void sub_231D67E54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72F80)
  {
    sub_231D67F20(255, &qword_255F72F88, (uint64_t (*)(uint64_t))sub_231D67EFC, sub_231D67FAC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BE42FF0]);
    sub_231D7E730();
    sub_231D67FC8();
    v0 = sub_231D7E544();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72F80);
  }
}

void sub_231D67EFC(uint64_t a1)
{
  sub_231D67F20(a1, &qword_255F72F90, (uint64_t (*)(uint64_t))MEMORY[0x24BE48418], sub_231D67F90, MEMORY[0x24BE449C8]);
}

void sub_231D67F20(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4();
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

uint64_t sub_231D67F90()
{
  return sub_231D4CD8C(&qword_255F72F98, (uint64_t (*)(uint64_t))MEMORY[0x24BE48418], MEMORY[0x24BE41F18]);
}

uint64_t sub_231D67FAC()
{
  return sub_231D4CD8C(&qword_255F72FA0, (uint64_t (*)(uint64_t))sub_231D67EFC, MEMORY[0x24BE449E0]);
}

unint64_t sub_231D67FC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255F72FA8;
  if (!qword_255F72FA8)
  {
    sub_231D67F20(255, &qword_255F72F88, (uint64_t (*)(uint64_t))sub_231D67EFC, sub_231D67FAC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BE42FF0]);
    result = MEMORY[0x2348F00E0](MEMORY[0x24BE43020], v1);
    atomic_store(result, (unint64_t *)&qword_255F72FA8);
  }
  return result;
}

void sub_231D68030()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F725C8)
  {
    sub_231D7E454();
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F725C8);
  }
}

void sub_231D68084(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_231D58104(255, a3);
    v4 = sub_231D7EF70();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_231D680D8()
{
  unint64_t result;

  result = qword_255F72FD8;
  if (!qword_255F72FD8)
  {
    result = MEMORY[0x2348F00E0](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255F72FD8);
  }
  return result;
}

double sub_231D6811C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  v3 = objc_msgSend(a1, sel_identifier);
  v4 = sub_231D7EB74();
  v6 = v5;

  if (v4 == 0xD00000000000002ELL && v6 == 0x8000000231D82CA0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v8 = type metadata accessor for WalkingSteadinessDataTypeDetailDebugActionProviding();
    v9 = swift_allocObject();
    *(_QWORD *)(a2 + 24) = v8;
    *(_QWORD *)(a2 + 32) = sub_231D68220();
    *(_QWORD *)a2 = v9;
    return result;
  }
  v7 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    goto LABEL_5;
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_231D6820C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_231D6811C(a1, a2);
}

unint64_t sub_231D68220()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255F72FE8;
  if (!qword_255F72FE8)
  {
    v1 = type metadata accessor for WalkingSteadinessDataTypeDetailDebugActionProviding();
    result = MEMORY[0x2348F00E0](&unk_231D80DC4, v1);
    atomic_store(result, (unint64_t *)&qword_255F72FE8);
  }
  return result;
}

void sub_231D68268(void *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  char v50;
  NSObject *v51;
  os_log_type_t v52;
  _BOOL4 v53;
  id v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  unsigned int v65;
  void *v66;
  unsigned __int8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  char v73;
  NSObject *v74;
  os_log_type_t v75;
  _BOOL4 v76;
  uint64_t v77;
  uint8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  NSObject *v113;
  os_log_type_t v114;
  uint8_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  char *v122;
  NSObject *v123;
  os_log_type_t v124;
  uint8_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  NSObject *v132;
  os_log_type_t v133;
  uint8_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  NSObject *v141;
  os_log_type_t v142;
  uint8_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  NSObject *v150;
  os_log_type_t v151;
  id v152;
  uint8_t *v153;
  uint64_t v154;
  id v155;
  void *v156;
  id v157;
  unsigned int v158;
  void *v159;
  unsigned __int8 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;
  NSObject *v166;
  os_log_type_t v167;
  uint8_t *v168;
  uint64_t v169;
  id v170;
  void *v171;
  id v172;
  unsigned int v173;
  void *v174;
  unsigned __int8 v175;
  NSObject *v176;
  os_log_type_t v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  void *v181;
  uint64_t v182;
  unint64_t v183;
  unint64_t v184;
  id v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  id v195;
  uint64_t (*v196)(void);
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;

  v196 = a3;
  v197 = a4;
  v192 = a2;
  v7 = sub_231D7E9B8();
  v198 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v186 = (char *)&v185 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v185 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v187 = (char *)&v185 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v188 = (char *)&v185 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v189 = (char *)&v185 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v190 = (char *)&v185 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v191 = (char *)&v185 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v185 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v185 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)&v185 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v34 = (char *)&v185 - v33;
  v35 = MEMORY[0x24BDAC7A8](v32);
  v37 = (char *)&v185 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v185 - v38;
  v185 = a1;
  v40 = objc_msgSend(a1, sel_highestPriorityUnsatisfiedRequirement);
  if (v40)
  {
    v41 = v40;
    v193 = a5;
    v194 = v7;
    v42 = sub_231D7EB74();
    v44 = v43;
    v195 = v41;
    if (v42 == sub_231D7EB74() && v44 == v45)
    {
      swift_bridgeObjectRelease_n();
LABEL_8:
      sub_231D7E988();
      v51 = sub_231D7E9AC();
      v52 = sub_231D7EC64();
      v53 = os_log_type_enabled(v51, v52);
      v54 = v195;
      if (v53)
      {
        v55 = (uint8_t *)swift_slowAlloc();
        v56 = swift_slowAlloc();
        v200 = v56;
        *(_DWORD *)v55 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v51, v52, "[%{public}s:FeatureStatusConfiguration] Health app hidden, hiding", v55, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v56, -1, -1);
        MEMORY[0x2348F0170](v55, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v39, v194);
      v57 = v193;
      v58 = sub_231D7DF80();
      v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56);
      v60 = v57;
      goto LABEL_11;
    }
    v50 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v50 & 1) != 0)
      goto LABEL_8;
    v68 = sub_231D7EB74();
    v70 = v69;
    v71 = v195;
    if (v68 == sub_231D7EB74() && v70 == v72)
    {
      swift_bridgeObjectRelease_n();
LABEL_25:
      sub_231D7E988();
      v74 = sub_231D7E9AC();
      v75 = sub_231D7EC64();
      v76 = os_log_type_enabled(v74, v75);
      v77 = v193;
      if (v76)
      {
        v78 = (uint8_t *)swift_slowAlloc();
        v79 = swift_slowAlloc();
        v200 = v79;
        *(_DWORD *)v78 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v74, v75, "[%{public}s:FeatureStatusConfiguration] Not background delivered hiding", v78, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v79, -1, -1);
        MEMORY[0x2348F0170](v78, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v37, v194);
      v58 = sub_231D7DF80();
      v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56);
      v60 = v77;
      goto LABEL_11;
    }
    v73 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v73 & 1) != 0)
      goto LABEL_25;
    v80 = sub_231D7EB74();
    v82 = v81;
    if (v80 == sub_231D7EB74() && v82 == v83)
    {
      swift_bridgeObjectRelease_n();
LABEL_32:
      sub_231D7E988();
      v85 = sub_231D7E9AC();
      v86 = sub_231D7EC64();
      if (os_log_type_enabled(v85, v86))
      {
        v87 = (uint8_t *)swift_slowAlloc();
        v88 = swift_slowAlloc();
        v200 = v88;
        *(_DWORD *)v87 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v85, v86, "[%{public}s:FeatureStatusConfiguration] Country not supported on local device, treating as unavailable", v87, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v88, -1, -1);
        MEMORY[0x2348F0170](v87, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v34, v194);
      v89 = v193;
LABEL_35:
      sub_231D6DA6C(v89);
LABEL_36:

LABEL_37:
      v58 = sub_231D7DF80();
      v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56);
      v60 = v89;
LABEL_22:
      v61 = 0;
      goto LABEL_23;
    }
    v84 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v84 & 1) != 0)
      goto LABEL_32;
    v90 = sub_231D7EB74();
    v92 = v91;
    if (v90 == sub_231D7EB74() && v92 == v93)
    {
      swift_bridgeObjectRelease_n();
LABEL_42:
      sub_231D7E988();
      v95 = sub_231D7E9AC();
      v96 = sub_231D7EC64();
      if (os_log_type_enabled(v95, v96))
      {
        v97 = (uint8_t *)swift_slowAlloc();
        v98 = swift_slowAlloc();
        v200 = v98;
        *(_DWORD *)v97 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v95, v96, "[%{public}s:FeatureStatusConfiguration] Age gated, treating as unavailable", v97, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v98, -1, -1);
        MEMORY[0x2348F0170](v97, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v31, v194);
      v89 = v193;
      goto LABEL_35;
    }
    v94 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v94 & 1) != 0)
      goto LABEL_42;
    v99 = sub_231D7EB74();
    v101 = v100;
    if (v99 == sub_231D7EB74() && v101 == v102)
    {
      swift_bridgeObjectRelease_n();
LABEL_49:
      sub_231D7E988();
      v104 = sub_231D7E9AC();
      v105 = sub_231D7EC64();
      if (os_log_type_enabled(v104, v105))
      {
        v106 = (uint8_t *)swift_slowAlloc();
        v107 = swift_slowAlloc();
        v200 = v107;
        *(_DWORD *)v106 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v104, v105, "[%{public}s:FeatureStatusConfiguration] Capability not supported on phone, treating as unavailable", v106, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v107, -1, -1);
        MEMORY[0x2348F0170](v106, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v28, v194);
      v89 = v193;
      sub_231D6DE1C(v193);
      goto LABEL_36;
    }
    v103 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v103 & 1) != 0)
      goto LABEL_49;
    v108 = sub_231D7EB74();
    v110 = v109;
    if (v108 == sub_231D7EB74() && v110 == v111)
    {
      swift_bridgeObjectRelease_n();
LABEL_56:
      sub_231D7E988();
      v113 = sub_231D7E9AC();
      v114 = sub_231D7EC64();
      if (os_log_type_enabled(v113, v114))
      {
        v115 = (uint8_t *)swift_slowAlloc();
        v116 = swift_slowAlloc();
        v200 = v116;
        *(_DWORD *)v115 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v113, v114, "[%{public}s:FeatureStatusConfiguration] Age is not present, treating as unavailable", v115, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v116, -1, -1);
        MEMORY[0x2348F0170](v115, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v25, v194);
      v89 = v193;
      sub_231D6E24C(v193);
      goto LABEL_36;
    }
    v112 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v112 & 1) != 0)
      goto LABEL_56;
    v117 = sub_231D7EB74();
    v119 = v118;
    if (v117 == sub_231D7EB74() && v119 == v120)
    {
      swift_bridgeObjectRelease_n();
LABEL_63:
      v122 = v191;
      sub_231D7E988();
      v123 = sub_231D7E9AC();
      v124 = sub_231D7EC64();
      if (os_log_type_enabled(v123, v124))
      {
        v125 = (uint8_t *)swift_slowAlloc();
        v126 = swift_slowAlloc();
        v200 = v126;
        *(_DWORD *)v125 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v123, v124, "[%{public}s:FeatureStatusConfiguration] Notifications not authorized, treating as unavailable invalid settings", v125, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v126, -1, -1);
        MEMORY[0x2348F0170](v125, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v122, v194);
      v89 = v193;
      sub_231D6E760(v193);
      goto LABEL_66;
    }
    v121 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v121 & 1) != 0)
      goto LABEL_63;
    v127 = sub_231D7EB74();
    v129 = v128;
    if (v127 == sub_231D7EB74() && v129 == v130)
    {
      swift_bridgeObjectRelease_n();
LABEL_71:
      sub_231D7E988();
      v132 = sub_231D7E9AC();
      v133 = sub_231D7EC64();
      if (os_log_type_enabled(v132, v133))
      {
        v134 = (uint8_t *)swift_slowAlloc();
        v135 = swift_slowAlloc();
        v200 = v135;
        *(_DWORD *)v134 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v132, v133, "[%{public}s:FeatureStatusConfiguration] Fitness tracking is not enabled, treating as unavailable", v134, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v135, -1, -1);
        MEMORY[0x2348F0170](v134, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v190, v194);
      v89 = v193;
      sub_231D6EBF8(v193);
      goto LABEL_66;
    }
    v131 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v131 & 1) != 0)
      goto LABEL_71;
    v136 = sub_231D7EB74();
    v138 = v137;
    if (v136 == sub_231D7EB74() && v138 == v139)
    {
      swift_bridgeObjectRelease_n();
LABEL_78:
      sub_231D7E988();
      v141 = sub_231D7E9AC();
      v142 = sub_231D7EC64();
      if (os_log_type_enabled(v141, v142))
      {
        v143 = (uint8_t *)swift_slowAlloc();
        v144 = swift_slowAlloc();
        v200 = v144;
        *(_DWORD *)v143 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v141, v142, "[%{public}s:FeatureStatusConfiguration] Height is not set, treating as unavailable", v143, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v144, -1, -1);
        MEMORY[0x2348F0170](v143, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v189, v194);
      v89 = v193;
      sub_231D6F030(v193);
      goto LABEL_66;
    }
    v140 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v140 & 1) != 0)
      goto LABEL_78;
    v145 = sub_231D7EB74();
    v147 = v146;
    if (v145 == sub_231D7EB74() && v147 == v148)
    {
      swift_bridgeObjectRelease_n();
LABEL_85:
      sub_231D7E988();
      v150 = sub_231D7E9AC();
      v151 = sub_231D7EC64();
      v152 = (id)v151;
      if (os_log_type_enabled(v150, v151))
      {
        v153 = (uint8_t *)swift_slowAlloc();
        v154 = swift_slowAlloc();
        v200 = v154;
        *(_DWORD *)v153 = 136446210;
        v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v150, (os_log_type_t)v152, "[%{public}s:FeatureStatusConfiguration] Onboarding not acknowledged, treating as not onboarded", v153, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v154, -1, -1);
        MEMORY[0x2348F0170](v153, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v198 + 8))(v188, v194);
      v155 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
      if (v155)
      {
        v156 = v155;
        v157 = objc_msgSend(v155, sel_features);

        if (v157)
        {
          v158 = objc_msgSend(v157, sel_seahorse);

          if (v158
            && (v159 = (void *)sub_231D7E910(),
                v160 = objc_msgSend(v159, sel_areAllRequirementsSatisfied),
                v159,
                (v160 & 1) == 0))
          {
            v89 = v193;
            sub_231D706D0(v196, v197, v193);
          }
          else
          {
            v89 = v193;
            sub_231D6F588((uint64_t (*)(uint64_t))v196, v197, v193);
          }
LABEL_66:

          goto LABEL_37;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_114;
    }
    v149 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v149 & 1) != 0)
      goto LABEL_85;
    v161 = sub_231D7EB74();
    v163 = v162;
    if (v161 == sub_231D7EB74() && v163 == v164)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_99;
    }
  }
  else
  {
    sub_231D7E988();
    v46 = sub_231D7E9AC();
    v47 = sub_231D7EC64();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v200 = v49;
      *(_DWORD *)v48 = 136446210;
      v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v46, v47, "[%{public}s:FeatureStatusConfiguration] Onboarded, available, and enabled", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v49, -1, -1);
      MEMORY[0x2348F0170](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v198 + 8))(v12, v7);
    v62 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v62)
    {
      v63 = v62;
      v64 = objc_msgSend(v62, sel_features);

      if (v64)
      {
        v65 = objc_msgSend(v64, sel_seahorse);

        if (v65
          && (v66 = (void *)sub_231D7E910(),
              v67 = objc_msgSend(v66, sel_areAllRequirementsSatisfied),
              v66,
              (v67 & 1) == 0))
        {
          sub_231D70B0C(v196, v197, a5);
        }
        else
        {
          sub_231D6FE20((uint64_t (*)(uint64_t))v196, v197, a5);
        }
        v58 = sub_231D7DF80();
        v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56);
        v60 = a5;
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  v165 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v165 & 1) != 0)
  {
LABEL_99:
    sub_231D7E988();
    v166 = sub_231D7E9AC();
    v167 = sub_231D7EC64();
    v152 = (id)v167;
    if (os_log_type_enabled(v166, v167))
    {
      v168 = (uint8_t *)swift_slowAlloc();
      v169 = swift_slowAlloc();
      v200 = v169;
      *(_DWORD *)v168 = 136446210;
      v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v166, (os_log_type_t)v152, "[%{public}s:FeatureStatusConfiguration] Onboarded and acknowledged but feature disabled", v168, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v169, -1, -1);
      MEMORY[0x2348F0170](v168, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v198 + 8))(v187, v194);
    v170 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v170)
    {
      v171 = v170;
      v172 = objc_msgSend(v170, sel_features);

      if (v172)
      {
        v173 = objc_msgSend(v172, sel_seahorse);

        if (v173
          && (v174 = (void *)sub_231D7E910(),
              v175 = objc_msgSend(v174, sel_areAllRequirementsSatisfied),
              v174,
              (v175 & 1) == 0))
        {
          v89 = v193;
          sub_231D70234(v196, v197, v193);
        }
        else
        {
          v89 = v193;
          sub_231D6F9A8((uint64_t (*)(uint64_t))v196, v197, v193);
        }
        goto LABEL_66;
      }
      goto LABEL_115;
    }
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }

  sub_231D7E988();
  v152 = v185;
  v176 = sub_231D7E9AC();
  v177 = sub_231D7EC58();
  if (!os_log_type_enabled(v176, v177))
  {

    goto LABEL_111;
  }
  v178 = swift_slowAlloc();
  v179 = swift_slowAlloc();
  v200 = v179;
  *(_DWORD *)v178 = 136446466;
  v199 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v200);
  sub_231D7EDB4();
  *(_WORD *)(v178 + 12) = 2082;
  v180 = objc_msgSend(v152, sel_highestPriorityUnsatisfiedRequirement);
  if (v180)
  {
    v181 = v180;
    v182 = sub_231D7EB74();
    v184 = v183;

    v199 = sub_231D6475C(v182, v184, &v200);
    sub_231D7EDB4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231D49000, v176, v177, "[%{public}s:FeatureStatusConfiguration] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v178, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v179, -1, -1);
    MEMORY[0x2348F0170](v178, -1, -1);

LABEL_111:
    (*(void (**)(char *, uint64_t))(v198 + 8))(v186, v194);
    v58 = sub_231D7DF80();
    v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56);
    v60 = v193;
LABEL_11:
    v61 = 1;
LABEL_23:
    v59(v60, v61, 1, v58);
    return;
  }
LABEL_116:

  __break(1u);
}

uint64_t sub_231D69C10@<X0>(char *a1@<X8>)
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
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint8_t *v17;
  uint64_t v18;
  int v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;

  v2 = sub_231D7DEA8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v25 - v7;
  v9 = sub_231D7E9B8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_231D7DF5C();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_231D7E988();
    v14 = sub_231D7E9AC();
    v15 = sub_231D7EC58();
    v29 = v14;
    v28 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31 = v26;
      v27 = v9;
      *(_DWORD *)v16 = 136446210;
      v25[1] = v16 + 4;
      v30 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v31);
      sub_231D7EDB4();
      v17 = v16;
      _os_log_impl(&dword_231D49000, v29, (os_log_type_t)v28, "[%{public}s] Expected to have primary description content but it's not present", v16, 0xCu);
      v18 = v26;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v18, -1, -1);
      MEMORY[0x2348F0170](v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v27);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
  }
  sub_231D7DF50();
  v19 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v8, v2);
  if (v19 == *MEMORY[0x24BE41298])
  {
    v20 = 1;
  }
  else if (v19 == *MEMORY[0x24BE412A0])
  {
    v20 = 2;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    v20 = 0;
  }
  sub_231D7DF50();
  v21 = sub_231D7DF5C();
  if (v21)
    v22 = v21;
  else
    v22 = MEMORY[0x24BEE4AF8];
  *a1 = v20;
  v23 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  result = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 32))(&a1[*(int *)(v23 + 20)], v6, v2);
  *(_QWORD *)&a1[*(int *)(v23 + 24)] = v22;
  return result;
}

void sub_231D69EF4(void *a1@<X0>, uint64_t (*a2)(void)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  unsigned int v49;
  void *v50;
  unsigned __int8 v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  id v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  v116 = a4;
  v7 = sub_231D7E9B8();
  v117 = *(_QWORD *)(v7 - 8);
  v118 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v111 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v111 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v114 = (char *)&v111 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v115 = (char *)&v111 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v111 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v111 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v111 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v111 - v27;
  v113 = a1;
  v29 = objc_msgSend(a1, sel_highestPriorityUnsatisfiedRequirement);
  if (!v29)
  {
    sub_231D7E988();
    v42 = sub_231D7E9AC();
    v43 = sub_231D7EC64();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      v120 = v45;
      *(_DWORD *)v44 = 136446210;
      v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v42, v43, "[%{public}s:FeatureStatusConfiguration] Onboarded, available, and enabled", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v45, -1, -1);
      MEMORY[0x2348F0170](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v117 + 8))(v13, v118);
    v46 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v46)
    {
      v47 = v46;
      v48 = objc_msgSend(v46, sel_features);

      if (v48)
      {
        v49 = objc_msgSend(v48, sel_seahorse);

        if (v49
          && (v50 = (void *)sub_231D7E910(),
              v51 = objc_msgSend(v50, sel_areAllRequirementsSatisfied),
              v50,
              (v51 & 1) == 0))
        {
          v52 = v116;
          sub_231D706D0(a2, a3, v116);
        }
        else
        {
          v52 = v116;
          sub_231D6F588((uint64_t (*)(uint64_t))a2, a3, v116);
        }
        goto LABEL_37;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_66;
  }
  v30 = v29;
  v112 = v10;
  v31 = sub_231D7EB74();
  v33 = v32;
  v34 = v30;
  if (v31 == sub_231D7EB74() && v33 == v35)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v37 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
  {
LABEL_18:
    sub_231D7E988();
    v53 = sub_231D7E9AC();
    v54 = sub_231D7EC64();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v120 = v56;
      *(_DWORD *)v55 = 136446210;
      v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v53, v54, "[%{public}s:FeatureStatusConfiguration] Health app hidden, hiding", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v56, -1, -1);
      MEMORY[0x2348F0170](v55, -1, -1);
    }

    goto LABEL_21;
  }
  v38 = sub_231D7EB74();
  v40 = v39;
  if (v38 == sub_231D7EB74() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_25:
    sub_231D7E988();
    v59 = sub_231D7E9AC();
    v60 = sub_231D7EC64();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      v120 = v62;
      *(_DWORD *)v61 = 136446210;
      v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v59, v60, "[%{public}s:FeatureStatusConfiguration] Not background delivered hiding", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v62, -1, -1);
      MEMORY[0x2348F0170](v61, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v117 + 8))(v26, v118);
    goto LABEL_22;
  }
  v58 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v58 & 1) != 0)
    goto LABEL_25;
  v63 = sub_231D7EB74();
  v65 = v64;
  if (v63 != sub_231D7EB74() || v65 != v66)
  {
    v67 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v67 & 1) != 0)
      goto LABEL_32;
    v73 = sub_231D7EB74();
    v75 = v74;
    if (v73 == sub_231D7EB74() && v75 == v76)
    {
      swift_bridgeObjectRelease_n();
LABEL_43:
      sub_231D7E988();
      v78 = sub_231D7E9AC();
      v79 = sub_231D7EC64();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        v81 = swift_slowAlloc();
        v120 = v81;
        *(_DWORD *)v80 = 136446210;
        v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v78, v79, "[%{public}s:FeatureStatusConfiguration] Age gated, treating as unavailable", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v81, -1, -1);
        MEMORY[0x2348F0170](v80, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v117 + 8))(v20, v118);
      v52 = v116;
      goto LABEL_35;
    }
    v77 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v77 & 1) != 0)
      goto LABEL_43;
    v82 = sub_231D7EB74();
    v84 = v83;
    if (v82 == sub_231D7EB74() && v84 == v85)
    {
      swift_bridgeObjectRelease_n();
      v86 = v115;
LABEL_50:
      sub_231D7E988();
      v88 = sub_231D7E9AC();
      v89 = sub_231D7EC64();
      if (os_log_type_enabled(v88, v89))
      {
        v90 = (uint8_t *)swift_slowAlloc();
        v91 = swift_slowAlloc();
        v120 = v91;
        *(_DWORD *)v90 = 136446210;
        v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v88, v89, "[%{public}s:FeatureStatusConfiguration] Capability not supported on phone, treating as unavailable", v90, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v91, -1, -1);
        MEMORY[0x2348F0170](v90, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v117 + 8))(v86, v118);
      v52 = v116;
      sub_231D6DE1C(v116);
      goto LABEL_36;
    }
    v87 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v86 = v115;
    if ((v87 & 1) != 0)
      goto LABEL_50;
    v92 = sub_231D7EB74();
    v94 = v93;
    if (v92 == sub_231D7EB74() && v94 == v95)
    {
      swift_bridgeObjectRelease_n();
      v96 = v114;
LABEL_57:
      sub_231D7E988();
      v98 = sub_231D7E9AC();
      v99 = sub_231D7EC64();
      if (os_log_type_enabled(v98, v99))
      {
        v100 = (uint8_t *)swift_slowAlloc();
        v101 = swift_slowAlloc();
        v120 = v101;
        *(_DWORD *)v100 = 136446210;
        v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
        sub_231D7EDB4();
        _os_log_impl(&dword_231D49000, v98, v99, "[%{public}s:FeatureStatusConfiguration] Fitness tracking is not enabled, treating as unavailable", v100, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v101, -1, -1);
        MEMORY[0x2348F0170](v100, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v117 + 8))(v96, v118);
      v52 = v116;
      sub_231D6EBF8(v116);
      goto LABEL_36;
    }
    v97 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v96 = v114;
    if ((v97 & 1) != 0)
      goto LABEL_57;

    v28 = v112;
    sub_231D7E988();
    v13 = (char *)v113;
    v102 = sub_231D7E9AC();
    v103 = sub_231D7EC58();
    if (os_log_type_enabled(v102, v103))
    {
      v104 = swift_slowAlloc();
      v105 = swift_slowAlloc();
      v120 = v105;
      *(_DWORD *)v104 = 136446466;
      v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
      sub_231D7EDB4();
      *(_WORD *)(v104 + 12) = 2082;
      v106 = objc_msgSend(v13, sel_highestPriorityUnsatisfiedRequirement);
      if (v106)
      {
        v107 = v106;
        v108 = sub_231D7EB74();
        v110 = v109;

        v119 = sub_231D6475C(v108, v110, &v120);
        sub_231D7EDB4();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231D49000, v102, v103, "[%{public}s:FeatureStatusConfiguration] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v104, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2348F0170](v105, -1, -1);
        MEMORY[0x2348F0170](v104, -1, -1);

        (*(void (**)(char *, uint64_t))(v117 + 8))(v112, v118);
        goto LABEL_22;
      }
LABEL_66:

      __break(1u);
      return;
    }

LABEL_21:
    (*(void (**)(char *, uint64_t))(v117 + 8))(v28, v118);
LABEL_22:
    v57 = sub_231D7DF80();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v116, 1, 1, v57);
    return;
  }
  swift_bridgeObjectRelease_n();
LABEL_32:
  sub_231D7E988();
  v68 = sub_231D7E9AC();
  v69 = sub_231D7EC64();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc();
    v71 = swift_slowAlloc();
    v120 = v71;
    *(_DWORD *)v70 = 136446210;
    v119 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v120);
    sub_231D7EDB4();
    _os_log_impl(&dword_231D49000, v68, v69, "[%{public}s:FeatureStatusConfiguration] Country not supported on local device, treating as unavailable", v70, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v71, -1, -1);
    MEMORY[0x2348F0170](v70, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v117 + 8))(v23, v118);
  v52 = v116;
LABEL_35:
  sub_231D6DA6C(v52);
LABEL_36:

LABEL_37:
  v72 = sub_231D7DF80();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v52, 0, 1, v72);
}

void sub_231D6AE04(uint64_t a1@<X1>, uint64_t a2@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  char v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  NSObject *v102;
  os_log_type_t v103;
  uint8_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  NSObject *v111;
  os_log_type_t v112;
  uint8_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  NSObject *v120;
  os_log_type_t v121;
  uint8_t *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  void (*v126)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char v132;
  NSObject *v133;
  os_log_type_t v134;
  uint8_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  NSObject *v151;
  os_log_type_t v152;
  uint8_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char v159;
  NSObject *v160;
  os_log_type_t v161;
  uint8_t *v162;
  uint64_t v163;
  id v164;
  NSObject *v165;
  os_log_type_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  void *v170;
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  char *v175;
  char *v176;
  char *v177;
  char *v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  char *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;

  v181 = a1;
  v3 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  v188 = *(_QWORD *)(v3 - 8);
  v189 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v183 = (char *)&v174 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BB10, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v182 = (char *)&v174 - v6;
  v7 = sub_231D7E9B8();
  v185 = *(_QWORD *)(v7 - 8);
  v186 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v175 = (char *)&v174 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v174 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v176 = (char *)&v174 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v177 = (char *)&v174 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v178 = (char *)&v174 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v179 = (char *)&v174 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v174 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v174 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v174 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v174 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)&v174 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)&v174 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v174 - v39;
  v187 = (id)sub_231D7E910();
  v41 = objc_msgSend(v187, sel_highestPriorityUnsatisfiedRequirement);
  if (!v41)
  {
    sub_231D7E988();
    v47 = sub_231D7E9AC();
    v48 = sub_231D7EC64();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = a2;
      v51 = swift_slowAlloc();
      v191 = v51;
      *(_DWORD *)v49 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v47, v48, "[%{public}s:ActionHandler] Onboarded, available, and enabled", v49, 0xCu);
      swift_arrayDestroy();
      v52 = v51;
      a2 = v50;
      MEMORY[0x2348F0170](v52, -1, -1);
      MEMORY[0x2348F0170](v49, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v12, v186);
    v54 = v188;
    v53 = v189;
    v55 = v187;
    v57 = v182;
    v56 = (uint64_t)v183;
    sub_231D69C10(v182);
    v58 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56);
    v59(v57, 0, 1, v58);
    v59((char *)v56, 1, 1, v58);
    sub_231D51E50((uint64_t)v57, v56);
    sub_231D70F3C(v56, a2);
    goto LABEL_8;
  }
  v180 = a2;
  v42 = v41;
  v43 = sub_231D7EB74();
  v45 = v44;
  v184 = v42;
  if (v43 == sub_231D7EB74() && v45 == v46)
  {
    swift_bridgeObjectRelease_n();
LABEL_10:
    sub_231D7E988();
    v62 = sub_231D7E9AC();
    v63 = sub_231D7EC64();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v191 = v65;
      *(_DWORD *)v64 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v62, v63, "[%{public}s:ActionHandler] Health app hidden, hiding", v64, 0xCu);
      v60 = 1;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v65, -1, -1);
      MEMORY[0x2348F0170](v64, -1, -1);

      (*(void (**)(char *, uint64_t))(v185 + 8))(v40, v186);
LABEL_14:
      a2 = v180;
LABEL_15:
      v54 = v188;
      v53 = v189;
      goto LABEL_16;
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v40, v186);
LABEL_13:
    v60 = 1;
    goto LABEL_14;
  }
  v61 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v61 & 1) != 0)
    goto LABEL_10;
  v66 = sub_231D7EB74();
  v68 = v67;
  if (v66 == sub_231D7EB74() && v68 == v69)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    sub_231D7E988();
    v71 = sub_231D7E9AC();
    v72 = sub_231D7EC64();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      v74 = swift_slowAlloc();
      v191 = v74;
      *(_DWORD *)v73 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v71, v72, "[%{public}s:ActionHandler] Not background delivered hiding", v73, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v74, -1, -1);
      MEMORY[0x2348F0170](v73, -1, -1);

      (*(void (**)(char *, uint64_t))(v185 + 8))(v38, v186);
      v60 = 1;
      goto LABEL_14;
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v38, v186);
    goto LABEL_13;
  }
  v70 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v70 & 1) != 0)
    goto LABEL_21;
  v75 = sub_231D7EB74();
  v77 = v76;
  if (v75 == sub_231D7EB74() && v77 == v78)
  {
    swift_bridgeObjectRelease_n();
LABEL_28:
    sub_231D7E988();
    v80 = sub_231D7E9AC();
    v81 = sub_231D7EC64();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      v83 = swift_slowAlloc();
      v191 = v83;
      *(_DWORD *)v82 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v80, v81, "[%{public}s:ActionHandler] Country not supported on local device, treating as unavailable", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v83, -1, -1);
      MEMORY[0x2348F0170](v82, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v35, v186);
    a2 = v180;
    v54 = v188;
    v53 = v189;
    v55 = v187;
    v85 = v182;
    v84 = (uint64_t)v183;
    v86 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    goto LABEL_39;
  }
  v79 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v79 & 1) != 0)
    goto LABEL_28;
  v87 = sub_231D7EB74();
  v89 = v88;
  if (v87 == sub_231D7EB74() && v89 == v90)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:
    sub_231D7E988();
    v92 = sub_231D7E9AC();
    v93 = sub_231D7EC64();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      v95 = swift_slowAlloc();
      v191 = v95;
      *(_DWORD *)v94 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v92, v93, "[%{public}s:ActionHandler] Age gated, treating as unavailable", v94, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v95, -1, -1);
      MEMORY[0x2348F0170](v94, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v32, v186);
LABEL_38:
    a2 = v180;
    v54 = v188;
    v53 = v189;
    v55 = v187;
    v85 = v182;
    v84 = (uint64_t)v183;
    v86 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
LABEL_39:
    swift_storeEnumTagMultiPayload();
    v96 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 56);
    v96(v85, 0, 1, v86);
LABEL_40:
    v96((char *)v84, 1, 1, v86);
    sub_231D51E50((uint64_t)v85, v84);
    sub_231D70F3C(v84, a2);

LABEL_8:
    v60 = 0;
LABEL_16:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56))(a2, v60, 1, v53);
    return;
  }
  v91 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v91 & 1) != 0)
    goto LABEL_35;
  v97 = sub_231D7EB74();
  v99 = v98;
  if (v97 == sub_231D7EB74() && v99 == v100)
  {
    swift_bridgeObjectRelease_n();
LABEL_45:
    sub_231D7E988();
    v102 = sub_231D7E9AC();
    v103 = sub_231D7EC64();
    if (os_log_type_enabled(v102, v103))
    {
      v104 = (uint8_t *)swift_slowAlloc();
      v105 = swift_slowAlloc();
      v191 = v105;
      *(_DWORD *)v104 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v102, v103, "[%{public}s:ActionHandler] Capability not supported on phone, treating as unavailable", v104, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v105, -1, -1);
      MEMORY[0x2348F0170](v104, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v29, v186);
    goto LABEL_38;
  }
  v101 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v101 & 1) != 0)
    goto LABEL_45;
  v106 = sub_231D7EB74();
  v108 = v107;
  if (v106 == sub_231D7EB74() && v108 == v109)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    sub_231D7E988();
    v111 = sub_231D7E9AC();
    v112 = sub_231D7EC64();
    if (os_log_type_enabled(v111, v112))
    {
      v113 = (uint8_t *)swift_slowAlloc();
      v114 = swift_slowAlloc();
      v191 = v114;
      *(_DWORD *)v113 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v111, v112, "[%{public}s:ActionHandler] Age is not present, treating as unavailable", v113, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v114, -1, -1);
      MEMORY[0x2348F0170](v113, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v26, v186);
    a2 = v180;
    v54 = v188;
    v53 = v189;
    v55 = v187;
    v86 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v85 = v182;
    swift_storeEnumTagMultiPayload();
    v96 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 56);
    v96(v85, 0, 1, v86);
    v84 = (uint64_t)v183;
    goto LABEL_40;
  }
  v110 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v110 & 1) != 0)
    goto LABEL_52;
  v115 = sub_231D7EB74();
  v117 = v116;
  if (v115 == sub_231D7EB74() && v117 == v118)
  {
    swift_bridgeObjectRelease_n();
LABEL_59:
    sub_231D7E988();
    v120 = sub_231D7E9AC();
    v121 = sub_231D7EC64();
    if (os_log_type_enabled(v120, v121))
    {
      v122 = (uint8_t *)swift_slowAlloc();
      v123 = swift_slowAlloc();
      v191 = v123;
      *(_DWORD *)v122 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v120, v121, "[%{public}s:ActionHandler] Notifications not authorized, treating as unavailable invalid settings", v122, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v123, -1, -1);
      MEMORY[0x2348F0170](v122, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v23, v186);
    v124 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v125 = v182;
LABEL_62:
    swift_storeEnumTagMultiPayload();
    v126 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v124 - 8) + 56);
    v126(v125, 0, 1, v124);
    v127 = (uint64_t)v183;
    v126(v183, 1, 1, v124);
    sub_231D51E50((uint64_t)v125, v127);
    a2 = v180;
    sub_231D70F3C(v127, v180);

    v60 = 0;
    goto LABEL_15;
  }
  v119 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v119 & 1) != 0)
    goto LABEL_59;
  v128 = sub_231D7EB74();
  v130 = v129;
  if (v128 == sub_231D7EB74() && v130 == v131)
  {
    swift_bridgeObjectRelease_n();
LABEL_67:
    sub_231D7E988();
    v133 = sub_231D7E9AC();
    v134 = sub_231D7EC64();
    if (os_log_type_enabled(v133, v134))
    {
      v135 = (uint8_t *)swift_slowAlloc();
      v136 = swift_slowAlloc();
      v191 = v136;
      *(_DWORD *)v135 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v133, v134, "[%{public}s:ActionHandler] Fitness tracking is not enabled, treating as unavailable", v135, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v136, -1, -1);
      MEMORY[0x2348F0170](v135, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v179, v186);
    v124 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v125 = v182;
    goto LABEL_62;
  }
  v132 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v132 & 1) != 0)
    goto LABEL_67;
  v137 = sub_231D7EB74();
  v139 = v138;
  if (v137 == sub_231D7EB74() && v139 == v140)
  {
    swift_bridgeObjectRelease_n();
LABEL_74:
    sub_231D7E988();
    v142 = sub_231D7E9AC();
    v143 = sub_231D7EC64();
    if (os_log_type_enabled(v142, v143))
    {
      v144 = (uint8_t *)swift_slowAlloc();
      v145 = swift_slowAlloc();
      v191 = v145;
      *(_DWORD *)v144 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v142, v143, "[%{public}s:ActionHandler] Height is not set, treating as unavailable", v144, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v145, -1, -1);
      MEMORY[0x2348F0170](v144, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v178, v186);
    v124 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v125 = v182;
    goto LABEL_62;
  }
  v141 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v141 & 1) != 0)
    goto LABEL_74;
  v146 = sub_231D7EB74();
  v148 = v147;
  if (v146 == sub_231D7EB74() && v148 == v149)
  {
    swift_bridgeObjectRelease_n();
LABEL_81:
    sub_231D7E988();
    v151 = sub_231D7E9AC();
    v152 = sub_231D7EC64();
    if (os_log_type_enabled(v151, v152))
    {
      v153 = (uint8_t *)swift_slowAlloc();
      v154 = swift_slowAlloc();
      v191 = v154;
      *(_DWORD *)v153 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v151, v152, "[%{public}s:ActionHandler] Onboarding not acknowledged, treating as not onboarded", v153, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v154, -1, -1);
      MEMORY[0x2348F0170](v153, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v177, v186);
    v124 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    v125 = v182;
    goto LABEL_62;
  }
  v150 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v150 & 1) != 0)
    goto LABEL_81;
  v155 = sub_231D7EB74();
  v157 = v156;
  if (v155 == sub_231D7EB74() && v157 == v158)
  {
    swift_bridgeObjectRelease_n();
LABEL_88:
    sub_231D7E988();
    v160 = sub_231D7E9AC();
    v161 = sub_231D7EC64();
    if (os_log_type_enabled(v160, v161))
    {
      v162 = (uint8_t *)swift_slowAlloc();
      v163 = swift_slowAlloc();
      v191 = v163;
      *(_DWORD *)v162 = 136446210;
      v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v160, v161, "[%{public}s:ActionHandler] Onboarded and acknowledged but feature disabled", v162, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v163, -1, -1);
      MEMORY[0x2348F0170](v162, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v185 + 8))(v176, v186);
    v125 = v182;
    sub_231D69C10(v182);
    v124 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    goto LABEL_62;
  }
  v159 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v159 & 1) != 0)
    goto LABEL_88;

  sub_231D7E988();
  v164 = v187;
  v165 = sub_231D7E9AC();
  v166 = sub_231D7EC58();
  if (!os_log_type_enabled(v165, v166))
  {

    goto LABEL_95;
  }
  v167 = swift_slowAlloc();
  v168 = swift_slowAlloc();
  v191 = v168;
  *(_DWORD *)v167 = 136446466;
  v190 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v191);
  sub_231D7EDB4();
  *(_WORD *)(v167 + 12) = 2082;
  v169 = objc_msgSend(v164, sel_highestPriorityUnsatisfiedRequirement);
  if (v169)
  {
    v170 = v169;
    v171 = sub_231D7EB74();
    v173 = v172;

    v190 = sub_231D6475C(v171, v173, &v191);
    sub_231D7EDB4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231D49000, v165, v166, "[%{public}s:ActionHandler] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v167, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v168, -1, -1);
    MEMORY[0x2348F0170](v167, -1, -1);

LABEL_95:
    (*(void (**)(char *, uint64_t))(v185 + 8))(v175, v186);

    goto LABEL_13;
  }

  __break(1u);
}

void sub_231D6C798(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  char v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  char v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint64_t v109;
  char *v110;
  id v111;
  NSObject *v112;
  os_log_type_t v113;
  uint64_t v114;
  id v115;
  void *v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  id v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v2 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  v129 = *(_QWORD *)(v2 - 8);
  v130 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v125 = (char *)&v121 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BB10, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v121 - v5;
  v128 = sub_231D7E9B8();
  v126 = *(_QWORD *)(v128 - 8);
  v7 = MEMORY[0x24BDAC7A8](v128);
  v122 = (char *)&v121 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v121 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v123 = (char *)&v121 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v121 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v121 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v121 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v121 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v121 - v26;
  v127 = (id)sub_231D7E910();
  v28 = objc_msgSend(v127, sel_highestPriorityUnsatisfiedRequirement);
  if (!v28)
  {
    sub_231D7E988();
    v35 = sub_231D7E9AC();
    v36 = sub_231D7EC64();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v132 = v38;
      *(_DWORD *)v37 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v35, v36, "[%{public}s:ActionHandler] Not onboarded and no unavailability reason", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v38, -1, -1);
      MEMORY[0x2348F0170](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v11, v128);
    v40 = v129;
    v39 = v130;
    v41 = v127;
    v42 = (uint64_t)v125;
    v43 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
    v44(v6, 0, 1, v43);
    v44((char *)v42, 1, 1, v43);
    sub_231D51E50((uint64_t)v6, v42);
    sub_231D70F3C(v42, a1);
    goto LABEL_8;
  }
  v29 = v28;
  v121 = v6;
  v124 = a1;
  v30 = sub_231D7EB74();
  v32 = v31;
  v33 = v29;
  if (v30 == sub_231D7EB74() && v32 == v34)
  {
    swift_bridgeObjectRelease_n();
LABEL_10:
    sub_231D7E988();
    v47 = sub_231D7E9AC();
    v48 = sub_231D7EC64();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      v132 = v50;
      *(_DWORD *)v49 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v47, v48, "[%{public}s:ActionHandler] Health app hidden, hiding", v49, 0xCu);
      v45 = 1;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v50, -1, -1);
      MEMORY[0x2348F0170](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v126 + 8))(v27, v128);
LABEL_14:
      a1 = v124;
LABEL_15:
      v39 = v130;
LABEL_16:
      v40 = v129;
      goto LABEL_17;
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v27, v128);
LABEL_13:
    v45 = 1;
    goto LABEL_14;
  }
  v46 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0)
    goto LABEL_10;
  v51 = sub_231D7EB74();
  v53 = v52;
  v54 = v29;
  if (v51 == sub_231D7EB74() && v53 == v55)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:
    sub_231D7E988();
    v57 = sub_231D7E9AC();
    v58 = sub_231D7EC64();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v132 = v60;
      *(_DWORD *)v59 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v57, v58, "[%{public}s:ActionHandler] Not background delivered hiding", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v60, -1, -1);
      MEMORY[0x2348F0170](v59, -1, -1);

      (*(void (**)(char *, uint64_t))(v126 + 8))(v25, v128);
      v45 = 1;
      goto LABEL_14;
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v25, v128);
    goto LABEL_13;
  }
  v56 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v56 & 1) != 0)
    goto LABEL_22;
  v61 = sub_231D7EB74();
  v63 = v62;
  if (v61 == sub_231D7EB74() && v63 == v64)
  {
    swift_bridgeObjectRelease_n();
    a1 = v124;
    v65 = (uint64_t)v121;
LABEL_29:
    sub_231D7E988();
    v67 = sub_231D7E9AC();
    v68 = sub_231D7EC64();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      v70 = swift_slowAlloc();
      v132 = v70;
      *(_DWORD *)v69 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      a1 = v124;
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v67, v68, "[%{public}s:ActionHandler] Country not supported on local device, treating as unavailable", v69, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v70, -1, -1);
      MEMORY[0x2348F0170](v69, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v22, v128);
    v39 = v130;
    v71 = v127;
    v72 = (uint64_t)v125;
    v73 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 56);
    v74(v65, 0, 1, v73);
    v74(v72, 1, 1, v73);
    sub_231D51E50(v65, v72);
    sub_231D70F3C(v72, a1);

    v45 = 0;
    goto LABEL_16;
  }
  v66 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1 = v124;
  v65 = (uint64_t)v121;
  if ((v66 & 1) != 0)
    goto LABEL_29;
  v75 = sub_231D7EB74();
  v77 = v76;
  if (v75 == sub_231D7EB74() && v77 == v78)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:
    sub_231D7E988();
    v80 = sub_231D7E9AC();
    v81 = sub_231D7EC64();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      v83 = swift_slowAlloc();
      v132 = v83;
      *(_DWORD *)v82 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      a1 = v124;
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v80, v81, "[%{public}s:ActionHandler] Age gated, treating as unavailable", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v83, -1, -1);
      MEMORY[0x2348F0170](v82, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v19, v128);
    v40 = v129;
    v84 = v127;
    v85 = (uint64_t)v125;
    v86 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    v87 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 56);
    v87(v65, 0, 1, v86);
    v87(v85, 1, 1, v86);
    sub_231D51E50(v65, v85);
    sub_231D70F3C(v85, a1);

    v45 = 0;
    v39 = v130;
    goto LABEL_17;
  }
  v79 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v79 & 1) != 0)
    goto LABEL_36;
  v88 = sub_231D7EB74();
  v90 = v89;
  if (v88 == sub_231D7EB74() && v90 == v91)
  {
    swift_bridgeObjectRelease_n();
LABEL_43:
    sub_231D7E988();
    v93 = sub_231D7E9AC();
    v94 = sub_231D7EC64();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc();
      v96 = swift_slowAlloc();
      v132 = v96;
      *(_DWORD *)v95 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      a1 = v124;
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v93, v94, "[%{public}s:ActionHandler] Capability not supported on phone, treating as unavailable", v95, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v96, -1, -1);
      MEMORY[0x2348F0170](v95, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v16, v128);
    v40 = v129;
    v39 = v130;
    v41 = v127;
    v97 = (uint64_t)v125;
    v98 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
LABEL_46:
    swift_storeEnumTagMultiPayload();
    v99 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v98 - 8) + 56);
    v99(v65, 0, 1, v98);
    v99(v97, 1, 1, v98);
    sub_231D51E50(v65, v97);
    sub_231D70F3C(v97, a1);

LABEL_8:
    v45 = 0;
LABEL_17:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(a1, v45, 1, v39);
    return;
  }
  v92 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v92 & 1) != 0)
    goto LABEL_43;
  v100 = sub_231D7EB74();
  v102 = v101;
  if (v100 == sub_231D7EB74() && v102 == v103)
  {
    swift_bridgeObjectRelease_n();
    v104 = v123;
LABEL_51:
    sub_231D7E988();
    v106 = sub_231D7E9AC();
    v107 = sub_231D7EC64();
    if (os_log_type_enabled(v106, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc();
      v109 = swift_slowAlloc();
      v132 = v109;
      *(_DWORD *)v108 = 136446210;
      v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v106, v107, "[%{public}s:ActionHandler] Fitness tracking is not enabled, treating as unavailable", v108, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v109, -1, -1);
      MEMORY[0x2348F0170](v108, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v126 + 8))(v104, v128);
    v40 = v129;
    v39 = v130;
    v41 = v127;
    v97 = (uint64_t)v125;
    v98 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    goto LABEL_46;
  }
  v105 = sub_231D7EF88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v104 = v123;
  if ((v105 & 1) != 0)
    goto LABEL_51;

  v110 = v122;
  sub_231D7E988();
  v111 = v127;
  v112 = sub_231D7E9AC();
  v113 = sub_231D7EC58();
  if (!os_log_type_enabled(v112, v113))
  {

    (*(void (**)(char *, uint64_t))(v126 + 8))(v110, v128);
    v45 = 1;
    goto LABEL_15;
  }
  v114 = swift_slowAlloc();
  v127 = (id)swift_slowAlloc();
  v132 = (uint64_t)v127;
  *(_DWORD *)v114 = 136446466;
  v131 = sub_231D6475C(0xD00000000000002DLL, 0x8000000231D84440, &v132);
  sub_231D7EDB4();
  *(_WORD *)(v114 + 12) = 2082;
  v115 = objc_msgSend(v111, sel_highestPriorityUnsatisfiedRequirement);
  if (v115)
  {
    v116 = v115;
    v117 = sub_231D7EB74();
    v119 = v118;

    v131 = sub_231D6475C(v117, v119, &v132);
    sub_231D7EDB4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231D49000, v112, v113, "[%{public}s:ActionHandler] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v114, 0x16u);
    v120 = v127;
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v120, -1, -1);
    MEMORY[0x2348F0170](v114, -1, -1);

    (*(void (**)(char *, uint64_t))(v126 + 8))(v110, v128);
    goto LABEL_13;
  }

  __break(1u);
}

uint64_t sub_231D6D8C8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - v1;
  v3 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if (qword_25419BDC0 != -1)
    swift_once();
  v4 = sub_231D7DFEC();
  sub_231D4E718(v4, (uint64_t)qword_25419BF18);
  v5 = sub_231D7E0AC();
  v7 = v6;
  result = sub_231D5F3AC((uint64_t)v2);
  qword_25419BA28 = v5;
  unk_25419BA30 = v7;
  return result;
}

uint64_t sub_231D6D9F4()
{
  uint64_t v0;

  v0 = sub_231D7DEC0();
  sub_231D4E6D8(v0, qword_25419BA08);
  sub_231D4E718(v0, (uint64_t)qword_25419BA08);
  sub_231D70FD4();
  sub_231D7ED6C();
  return sub_231D7DEB4();
}

uint64_t sub_231D6DA6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  _QWORD v27[4];

  v27[3] = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v27 - v3;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v27 - v6;
  v8 = sub_231D7DEA8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v27 - v13;
  v15 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  if (qword_25419BDC0 != -1)
    swift_once();
  v16 = sub_231D7DFEC();
  sub_231D4E718(v16, (uint64_t)qword_25419BF18);
  v17 = sub_231D7E0AC();
  v19 = v18;
  sub_231D5F3AC((uint64_t)v14);
  if (qword_25419B5C8 != -1)
    swift_once();
  v27[2] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE41280], v8);
  v20 = qword_25419BA20;
  sub_231D7E514();
  v27[1] = v11;
  if (v20 != -1)
    swift_once();
  v21 = sub_231D7DEC0();
  v22 = sub_231D4E718(v21, (uint64_t)qword_25419BA08);
  v23 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v7, v22, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v7, 0, 1, v21);
  sub_231D70F80();
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v24 + 32) = v17;
  *(_QWORD *)(v24 + 40) = v19;
  sub_231D7E514();
  sub_231D7DEFC();
  MEMORY[0x2348EEC1C](v17, v19);
  swift_bridgeObjectRelease();
  sub_231D7DEFC();
  v25 = sub_231D7DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v4, 1, 1, v25);
  return sub_231D7DF68();
}

uint64_t sub_231D6DE1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
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
  void *v14;
  void *v15;
  id v16;
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
  _QWORD v29[2];
  char *v30;
  uint64_t v31;

  v31 = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)v29 - v3;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v1);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v29 - v5;
  v7 = sub_231D7DEA8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v29 - v12;
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_231D7EB44();
  v16 = objc_msgSend(v14, sel_modelSpecificLocalizedStringKeyForKey_, v15);

  if (v16)
  {
    sub_231D7EB74();

  }
  v17 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
  if (qword_25419BDC0 != -1)
    swift_once();
  v18 = sub_231D7DFEC();
  sub_231D4E718(v18, (uint64_t)qword_25419BF18);
  v19 = sub_231D7E0AC();
  v21 = v20;
  swift_bridgeObjectRelease();
  sub_231D5F3AC((uint64_t)v13);
  if (qword_25419B5C8 != -1)
    swift_once();
  v29[1] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE41280], v7);
  v22 = qword_25419BA20;
  sub_231D7E514();
  v29[0] = v10;
  if (v22 != -1)
    swift_once();
  v23 = sub_231D7DEC0();
  v24 = sub_231D4E718(v23, (uint64_t)qword_25419BA08);
  v25 = *(_QWORD *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v6, v24, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v6, 0, 1, v23);
  sub_231D70F80();
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v26 + 32) = v19;
  *(_QWORD *)(v26 + 40) = v21;
  sub_231D7E514();
  sub_231D7DEFC();
  MEMORY[0x2348EEC1C](v19, v21);
  swift_bridgeObjectRelease();
  sub_231D7DEFC();
  v27 = sub_231D7DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v30, 1, 1, v27);
  return sub_231D7DF68();
}

uint64_t sub_231D6E24C@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
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
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;

  v38 = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v37 = (char *)&v29 - v3;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v1);
  MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)&v29 - v5;
  v32 = sub_231D7DEA8();
  v6 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - v9;
  v11 = sub_231D7DB48();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  if (qword_25419BDC0 != -1)
    swift_once();
  v13 = sub_231D7DFEC();
  sub_231D4E718(v13, (uint64_t)qword_25419BF18);
  v14 = sub_231D7E0AC();
  v16 = v15;
  sub_231D5F3AC((uint64_t)v10);
  v31 = v12;
  v12(v10, 1, 1, v11);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v10);
  sub_231D4E564(0, &qword_255F72FC8, (uint64_t (*)(uint64_t))sub_231D71010, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v17 = swift_allocObject();
  v29 = xmmword_231D7F640;
  *(_OWORD *)(v17 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v17 + 64) = sub_231D680D8();
  v35 = v14;
  *(_QWORD *)(v17 + 32) = v14;
  *(_QWORD *)(v17 + 40) = v16;
  v33 = v16;
  sub_231D7E514();
  v18 = sub_231D7EB50();
  v20 = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_25419B5C8 != -1)
    swift_once();
  v30 = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v34, *MEMORY[0x24BE41288], v32);
  v21 = qword_25419BA20;
  sub_231D7E514();
  if (v21 != -1)
    swift_once();
  v22 = sub_231D7DEC0();
  v23 = sub_231D4E718(v22, (uint64_t)qword_25419BA08);
  v24 = *(_QWORD *)(v22 - 8);
  v25 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v36, v23, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v22);
  sub_231D70F80();
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v29;
  *(_QWORD *)(v26 + 32) = v18;
  *(_QWORD *)(v26 + 40) = v20;
  v31(v10, 1, 1, v11);
  sub_231D7E514();
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v10);
  v27 = sub_231D7DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v37, 1, 1, v27);
  return sub_231D7DF68();
}

uint64_t sub_231D6E760@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
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
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v36 = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)v30 - v3;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v1);
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)v30 - v5;
  v33 = sub_231D7DEA8();
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v30 - v10;
  v12 = sub_231D7DB48();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  if (qword_25419BDC0 != -1)
    swift_once();
  v14 = sub_231D7DFEC();
  sub_231D4E718(v14, (uint64_t)qword_25419BF18);
  v15 = sub_231D7E0AC();
  v17 = v16;
  sub_231D5F3AC((uint64_t)v11);
  v13(v11, 1, 1, v12);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v11);
  sub_231D4E564(0, &qword_255F72FC8, (uint64_t (*)(uint64_t))sub_231D71010, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v18 = swift_allocObject();
  v31 = xmmword_231D7F640;
  *(_OWORD *)(v18 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v18 + 64) = sub_231D680D8();
  v32 = v15;
  *(_QWORD *)(v18 + 32) = v15;
  *(_QWORD *)(v18 + 40) = v17;
  sub_231D7E514();
  v19 = sub_231D7EB50();
  v21 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_25419B5C8 != -1)
    swift_once();
  v30[1] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE41288], v33);
  v22 = qword_25419BA20;
  sub_231D7E514();
  if (v22 != -1)
    swift_once();
  v23 = sub_231D7DEC0();
  v24 = sub_231D4E718(v23, (uint64_t)qword_25419BA08);
  v25 = *(_QWORD *)(v23 - 8);
  v26 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v34, v24, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v26, 0, 1, v23);
  sub_231D70F80();
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = v31;
  *(_QWORD *)(v27 + 32) = v19;
  *(_QWORD *)(v27 + 40) = v21;
  sub_231D7E514();
  sub_231D7DF14();
  v28 = sub_231D7DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v35, 1, 1, v28);
  return sub_231D7DF68();
}

uint64_t sub_231D6EBF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
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
  _QWORD v30[2];
  __int128 v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;

  v34 = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v33 = (char *)v30 - v3;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v1);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v30 - v5;
  v7 = sub_231D7DEA8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v30 - v12;
  v14 = sub_231D7DF2C();
  v16 = v15;
  v17 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
  if (qword_25419BDC0 != -1)
    swift_once();
  v18 = sub_231D7DFEC();
  sub_231D4E718(v18, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v13);
  sub_231D4E564(0, &qword_255F72FC8, (uint64_t (*)(uint64_t))sub_231D71010, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v19 = swift_allocObject();
  v31 = xmmword_231D7F640;
  *(_OWORD *)(v19 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v19 + 64) = sub_231D680D8();
  v32 = v14;
  *(_QWORD *)(v19 + 32) = v14;
  *(_QWORD *)(v19 + 40) = v16;
  sub_231D7E514();
  v20 = sub_231D7EB50();
  v22 = v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_25419B5C8 != -1)
    swift_once();
  v30[1] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE41288], v7);
  v23 = qword_25419BA20;
  sub_231D7E514();
  if (v23 != -1)
    swift_once();
  v24 = sub_231D7DEC0();
  v25 = sub_231D4E718(v24, (uint64_t)qword_25419BA08);
  v26 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v6, v25, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v6, 0, 1, v24);
  sub_231D70F80();
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = v31;
  *(_QWORD *)(v27 + 32) = v20;
  *(_QWORD *)(v27 + 40) = v22;
  sub_231D7E514();
  sub_231D7DF14();
  v28 = sub_231D7DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v33, 1, 1, v28);
  return sub_231D7DF68();
}

uint64_t sub_231D6F030@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
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
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;

  v42 = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)&v31 - v3;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v1);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v31 - v5;
  v39 = sub_231D7DEA8();
  v6 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - v9;
  v11 = sub_231D7DB48();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  if (qword_25419BDC0 != -1)
    swift_once();
  v13 = sub_231D7DFEC();
  sub_231D4E718(v13, (uint64_t)qword_25419BF18);
  v14 = sub_231D7E0AC();
  v35 = v15;
  v36 = v14;
  sub_231D5F3AC((uint64_t)v10);
  v12(v10, 1, 1, v11);
  v16 = sub_231D7E0AC();
  v18 = v17;
  sub_231D5F3AC((uint64_t)v10);
  v12(v10, 1, 1, v11);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v10);
  sub_231D4E564(0, &qword_255F72FC8, (uint64_t (*)(uint64_t))sub_231D71010, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v19 = swift_allocObject();
  v31 = xmmword_231D7F640;
  *(_OWORD *)(v19 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v19 + 64) = sub_231D680D8();
  v37 = v16;
  *(_QWORD *)(v19 + 32) = v16;
  *(_QWORD *)(v19 + 40) = v18;
  sub_231D7E514();
  v20 = sub_231D7EB50();
  v33 = v21;
  v34 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_25419B5C8 != -1)
    swift_once();
  v32 = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v38, *MEMORY[0x24BE41288], v39);
  v22 = qword_25419BA20;
  sub_231D7E514();
  if (v22 != -1)
    swift_once();
  v23 = sub_231D7DEC0();
  v24 = sub_231D4E718(v23, (uint64_t)qword_25419BA08);
  v25 = *(_QWORD *)(v23 - 8);
  v26 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v40, v24, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v26, 0, 1, v23);
  sub_231D70F80();
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = v31;
  v28 = v35;
  *(_QWORD *)(v27 + 32) = v36;
  *(_QWORD *)(v27 + 40) = v28;
  v12(v10, 1, 1, v11);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v10);
  v29 = sub_231D7DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v41, 1, 1, v29);
  return sub_231D7DF68();
}

uint64_t sub_231D6F588@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[7];
  uint64_t (*v37)(uint64_t);
  char *v38;
  uint64_t v39;

  v36[6] = a2;
  v37 = a1;
  v39 = a3;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419BB88, (uint64_t (*)(uint64_t))MEMORY[0x24BE47FD0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)v36 - v5;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v36 - v7;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v3);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v36 - v10;
  v12 = sub_231D7DEA8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25419B5C8 != -1)
    swift_once();
  v16 = unk_25419BA30;
  v36[4] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BE412A0], v12);
  v17 = qword_25419BA20;
  v36[3] = v16;
  sub_231D7E514();
  if (v17 != -1)
    swift_once();
  v36[5] = v15;
  v18 = sub_231D7DEC0();
  v19 = sub_231D4E718(v18, (uint64_t)qword_25419BA08);
  v20 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v11, v19, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v11, 0, 1, v18);
  v21 = sub_231D7DEF0();
  v36[1] = v22;
  v36[2] = v21;
  sub_231D70F80();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_231D7F620;
  v24 = sub_231D7DB48();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v8, 1, 1, v24);
  if (qword_25419BDC0 != -1)
    swift_once();
  v26 = sub_231D7DFEC();
  sub_231D4E718(v26, (uint64_t)qword_25419BF18);
  v27 = sub_231D7E0AC();
  v29 = v28;
  sub_231D5F3AC((uint64_t)v8);
  *(_QWORD *)(v23 + 32) = v27;
  *(_QWORD *)(v23 + 40) = v29;
  v25(v8, 1, 1, v24);
  v30 = sub_231D7E0AC();
  v32 = v31;
  v33 = sub_231D5F3AC((uint64_t)v8);
  *(_QWORD *)(v23 + 48) = v30;
  *(_QWORD *)(v23 + 56) = v32;
  if ((v37(v33) & 1) != 0)
    sub_231D7DF08();
  v34 = sub_231D7DD4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v38, 1, 1, v34);
  return sub_231D7DF74();
}

uint64_t sub_231D6F9A8@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
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
  _QWORD v36[7];
  uint64_t (*v37)(uint64_t);
  char *v38;
  uint64_t v39;

  v36[6] = a2;
  v37 = a1;
  v39 = a3;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419BB88, (uint64_t (*)(uint64_t))MEMORY[0x24BE47FD0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)v36 - v5;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v36 - v7;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v3);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v36 - v10;
  v12 = sub_231D7DEA8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25419B5C8 != -1)
    swift_once();
  v16 = unk_25419BA30;
  v36[4] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BE412A0], v12);
  v17 = qword_25419BA20;
  v36[3] = v16;
  sub_231D7E514();
  if (v17 != -1)
    swift_once();
  v36[5] = v15;
  v18 = sub_231D7DEC0();
  v19 = sub_231D4E718(v18, (uint64_t)qword_25419BA08);
  v20 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v11, v19, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v11, 0, 1, v18);
  v21 = sub_231D7DB48();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v22(v8, 1, 1, v21);
  if (qword_25419BDC0 != -1)
    swift_once();
  v23 = sub_231D7DFEC();
  sub_231D4E718(v23, (uint64_t)qword_25419BF18);
  v24 = sub_231D7E0AC();
  v36[1] = v25;
  v36[2] = v24;
  sub_231D5F3AC((uint64_t)v8);
  sub_231D70F80();
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_231D7F620;
  v22(v8, 1, 1, v21);
  v27 = sub_231D7E0AC();
  v29 = v28;
  sub_231D5F3AC((uint64_t)v8);
  *(_QWORD *)(v26 + 32) = v27;
  *(_QWORD *)(v26 + 40) = v29;
  v22(v8, 1, 1, v21);
  v30 = sub_231D7E0AC();
  v32 = v31;
  v33 = sub_231D5F3AC((uint64_t)v8);
  *(_QWORD *)(v26 + 48) = v30;
  *(_QWORD *)(v26 + 56) = v32;
  if ((v37(v33) & 1) != 0)
    sub_231D7DF08();
  v34 = sub_231D7DD4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v38, 1, 1, v34);
  return sub_231D7DF74();
}

uint64_t sub_231D6FE20@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[5];
  uint64_t (*v35)(uint64_t);
  char *v36;
  uint64_t v37;

  v34[4] = a2;
  v35 = a1;
  v37 = a3;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419BB88, (uint64_t (*)(uint64_t))MEMORY[0x24BE47FD0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)v34 - v5;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v34 - v7;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v3);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v34 - v10;
  v12 = sub_231D7DEA8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25419B5C8 != -1)
    swift_once();
  v16 = unk_25419BA30;
  v34[2] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BE41298], v12);
  v17 = qword_25419BA20;
  v34[1] = v16;
  sub_231D7E514();
  if (v17 != -1)
    swift_once();
  v34[3] = v15;
  v18 = sub_231D7DEC0();
  v19 = sub_231D4E718(v18, (uint64_t)qword_25419BA08);
  v20 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v11, v19, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v11, 0, 1, v18);
  sub_231D70F80();
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_231D7F620;
  v22 = sub_231D7DB48();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v8, 1, 1, v22);
  if (qword_25419BDC0 != -1)
    swift_once();
  v24 = sub_231D7DFEC();
  sub_231D4E718(v24, (uint64_t)qword_25419BF18);
  v25 = sub_231D7E0AC();
  v27 = v26;
  sub_231D5F3AC((uint64_t)v8);
  *(_QWORD *)(v21 + 32) = v25;
  *(_QWORD *)(v21 + 40) = v27;
  v23(v8, 1, 1, v22);
  v28 = sub_231D7E0AC();
  v30 = v29;
  v31 = sub_231D5F3AC((uint64_t)v8);
  *(_QWORD *)(v21 + 48) = v28;
  *(_QWORD *)(v21 + 56) = v30;
  if ((v35(v31) & 1) != 0)
    sub_231D7DF08();
  v32 = sub_231D7DD4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v36, 1, 1, v32);
  return sub_231D7DF74();
}

uint64_t sub_231D70234@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ObjCClassFromMetadata;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[4];
  uint64_t (*v37)(void);
  uint64_t v38;

  v36[3] = a2;
  v37 = a1;
  v38 = a3;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419BB88, (uint64_t (*)(uint64_t))MEMORY[0x24BE47FD0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v36 - v5;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v36 - v8;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v3);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v36 - v11;
  v13 = sub_231D7DEA8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25419B5C8 != -1)
    swift_once();
  v17 = unk_25419BA30;
  v36[2] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BE412A0], v13);
  v18 = qword_25419BA20;
  v36[1] = v17;
  sub_231D7E514();
  if (v18 != -1)
    swift_once();
  v19 = sub_231D7DEC0();
  v20 = sub_231D4E718(v19, (uint64_t)qword_25419BA08);
  v21 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v12, v20, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v19);
  v22 = sub_231D7DB48();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v9, 1, 1, v22);
  if (qword_25419BDC0 != -1)
    swift_once();
  v24 = sub_231D7DFEC();
  sub_231D4E718(v24, (uint64_t)qword_25419BF18);
  v36[0] = sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v9);
  sub_231D70F80();
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_231D7F620;
  v23(v9, 1, 1, v22);
  v26 = sub_231D7E0AC();
  v28 = v27;
  sub_231D5F3AC((uint64_t)v9);
  *(_QWORD *)(v25 + 32) = v26;
  *(_QWORD *)(v25 + 40) = v28;
  type metadata accessor for MobilityAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v30 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v31 = sub_231D7DAAC();
  v33 = v32;

  *(_QWORD *)(v25 + 48) = v31;
  *(_QWORD *)(v25 + 56) = v33;
  if ((v37() & 1) != 0)
    sub_231D7DF08();
  v34 = sub_231D7DD4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v6, 1, 1, v34);
  return sub_231D7DF74();
}

uint64_t sub_231D706D0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
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
  uint64_t ObjCClassFromMetadata;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[4];
  uint64_t (*v37)(void);
  uint64_t v38;

  v36[3] = a2;
  v37 = a1;
  v38 = a3;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419BB88, (uint64_t (*)(uint64_t))MEMORY[0x24BE47FD0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v36 - v5;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v36 - v8;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v3);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v36 - v11;
  v13 = sub_231D7DEA8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25419B5C8 != -1)
    swift_once();
  v36[2] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BE412A0], v13);
  v17 = qword_25419BA20;
  sub_231D7E514();
  if (v17 != -1)
    swift_once();
  v18 = sub_231D7DEC0();
  v19 = sub_231D4E718(v18, (uint64_t)qword_25419BA08);
  v20 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v12, v19, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v18);
  v21 = sub_231D7DEF0();
  v36[0] = v22;
  v36[1] = v21;
  sub_231D70F80();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_231D7F620;
  v24 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
  if (qword_25419BDC0 != -1)
    swift_once();
  v25 = sub_231D7DFEC();
  sub_231D4E718(v25, (uint64_t)qword_25419BF18);
  v26 = sub_231D7E0AC();
  v28 = v27;
  sub_231D5F3AC((uint64_t)v9);
  *(_QWORD *)(v23 + 32) = v26;
  *(_QWORD *)(v23 + 40) = v28;
  type metadata accessor for MobilityAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v30 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v31 = sub_231D7DAAC();
  v33 = v32;

  *(_QWORD *)(v23 + 48) = v31;
  *(_QWORD *)(v23 + 56) = v33;
  if ((v37() & 1) != 0)
    sub_231D7DF08();
  v34 = sub_231D7DD4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v6, 1, 1, v34);
  return sub_231D7DF74();
}

uint64_t sub_231D70B0C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
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
  uint64_t ObjCClassFromMetadata;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[2];
  uint64_t (*v35)(void);
  uint64_t v36;

  v34[1] = a2;
  v35 = a1;
  v36 = a3;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419BB88, (uint64_t (*)(uint64_t))MEMORY[0x24BE47FD0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v34 - v5;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v34 - v8;
  sub_231D4E564(0, &qword_25419BB90, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], v3);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v34 - v11;
  v13 = sub_231D7DEA8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25419B5C8 != -1)
    swift_once();
  v34[0] = qword_25419BA28;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BE41298], v13);
  v17 = qword_25419BA20;
  sub_231D7E514();
  if (v17 != -1)
    swift_once();
  v18 = sub_231D7DEC0();
  v19 = sub_231D4E718(v18, (uint64_t)qword_25419BA08);
  v20 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v12, v19, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v18);
  sub_231D70F80();
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_231D7F620;
  v22 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
  if (qword_25419BDC0 != -1)
    swift_once();
  v23 = sub_231D7DFEC();
  sub_231D4E718(v23, (uint64_t)qword_25419BF18);
  v24 = sub_231D7E0AC();
  v26 = v25;
  sub_231D5F3AC((uint64_t)v9);
  *(_QWORD *)(v21 + 32) = v24;
  *(_QWORD *)(v21 + 40) = v26;
  type metadata accessor for MobilityAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v28 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v29 = sub_231D7DAAC();
  v31 = v30;

  *(_QWORD *)(v21 + 48) = v29;
  *(_QWORD *)(v21 + 56) = v31;
  if ((v35() & 1) != 0)
    sub_231D7DF08();
  v32 = sub_231D7DD4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v6, 1, 1, v32);
  return sub_231D7DF74();
}

uint64_t sub_231D70F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_231D70F80()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419B560)
  {
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419B560);
  }
}

unint64_t sub_231D70FD4()
{
  unint64_t result;

  result = qword_25419B530;
  if (!qword_25419B530)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25419B530);
  }
  return result;
}

unint64_t sub_231D71010()
{
  unint64_t result;

  result = qword_255F72FD0;
  if (!qword_255F72FD0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255F72FD0);
  }
  return result;
}

uint64_t sub_231D71064()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t _s37WalkingSteadinessFitnessPlusComponentCMa()
{
  return objc_opt_self();
}

uint64_t sub_231D710A8()
{
  uint64_t v0;

  if (qword_255F724D8 != -1)
    swift_once();
  v0 = qword_255F73588;
  sub_231D7E514();
  return v0;
}

uint64_t sub_231D71108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_231D7DB18();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E64C();
  v4 = sub_231D7E304();
  v6 = v5;
  if (v4 == sub_231D7E304() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return 0;
  }
  v9 = (void *)sub_231D7E640();
  v18[0] = 0;
  v10 = objc_msgSend(v9, sel_dateOfBirthComponentsWithError_, v18);

  if (v10)
  {
    v11 = v18[0];
    sub_231D7DB0C();
    v12 = (void *)sub_231D7DAF4();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v13 = objc_msgSend(v10, sel_hk_ageWithCurrentDate_, v12);

  }
  else
  {
    v14 = v18[0];
    v15 = (void *)sub_231D7DAB8();

    swift_willThrow();
    v13 = 0;
  }
  return sub_231D775D0((uint64_t)v13, v10 == 0);
}

uint64_t sub_231D712DC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
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
  id v32;
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
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53[5];
  uint64_t v54[6];

  v50 = *v0;
  v51 = sub_231D7E484();
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v52 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_231D7E388();
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_231D7E2C8();
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v47 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_231D7DB54();
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_231D7DB6C();
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_231D7DB18();
  MEMORY[0x24BDAC7A8](v10);
  v11 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_255F73138, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v34 - v13;
  v36 = sub_231D7E52C();
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v11);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v34 - v18;
  v20 = sub_231D7DB48();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v21(v19, 1, 1, v20);
  if (qword_25419BDC0 != -1)
    swift_once();
  v22 = sub_231D7DFEC();
  sub_231D4E718(v22, (uint64_t)qword_25419BF18);
  v38 = sub_231D7E0AC();
  v37 = v23;
  sub_231D5F3AC((uint64_t)v19);
  v24 = sub_231D7DA94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v14, 1, 1, v24);
  sub_231D7DB00();
  sub_231D7E520();
  v21(v19, 1, 1, v20);
  v25 = sub_231D7E0AC();
  v27 = v26;
  sub_231D5F3AC((uint64_t)v19);
  v28 = v39;
  v29 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v7, *MEMORY[0x24BDCEF70], v41);
  sub_231D7DB60();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
  MEMORY[0x2348EF0E4](v16, v25, v27, MEMORY[0x24BEE4B08], v9);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v42);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v36);
  v54[3] = sub_231D7E508();
  v54[4] = MEMORY[0x24BE43AE8];
  sub_231D4CEA8(v54);
  sub_231D7E4FC();
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v47, *MEMORY[0x24BE42A48], v44);
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v48, *MEMORY[0x24BE42EF0], v46);
  v30 = swift_allocObject();
  v31 = v51;
  *(_QWORD *)(v30 + 16) = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v52, *MEMORY[0x24BE435B8], v31);
  v53[3] = sub_231D7E2E0();
  v53[4] = MEMORY[0x24BE42A68];
  sub_231D4CEA8(v53);
  sub_231D7E2D4();
  v32 = objc_allocWithZone((Class)sub_231D7E478());
  return sub_231D7E46C();
}

uint64_t sub_231D7189C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12[5];

  sub_231D4E564(0, &qword_255F73140, (uint64_t (*)(uint64_t))MEMORY[0x24BE422B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v10[-v3];
  v5 = sub_231D7E154();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v11 = a1;
  v12[3] = sub_231D7E16C();
  v12[4] = MEMORY[0x24BE42308];
  sub_231D4CEA8(v12);
  sub_231D7E160();
  v6 = sub_231D7E4F0();
  sub_231D4CEE8((uint64_t)v12);
  sub_231D745E4(0, &qword_255F73148, &qword_255F73150, &qword_255F73158);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v7 + 32) = v6;
  v8 = MEMORY[0x2348EF1E0]();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_231D719F8()
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
  uint64_t v9;
  uint64_t v11[3];
  uint64_t v12;
  uint64_t v13;

  v0 = sub_231D7E3A0();
  v1 = MEMORY[0x24BE42F10];
  v12 = v0;
  v13 = MEMORY[0x24BE42F10];
  sub_231D4CEA8(v11);
  sub_231D7E394();
  v2 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v11);
  v12 = v0;
  v13 = v1;
  sub_231D4CEA8(v11);
  sub_231D7E394();
  v3 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v11);
  v12 = v0;
  v13 = v1;
  sub_231D4CEA8(v11);
  sub_231D7E394();
  v4 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v11);
  v12 = v0;
  v13 = v1;
  sub_231D4CEA8(v11);
  sub_231D7E394();
  v5 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v11);
  v12 = v0;
  v13 = v1;
  sub_231D4CEA8(v11);
  sub_231D7E394();
  v6 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v11);
  v12 = v0;
  v13 = v1;
  sub_231D4CEA8(v11);
  sub_231D7E394();
  v7 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v11);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_231D81C80;
  *(_QWORD *)(v8 + 32) = v2;
  *(_QWORD *)(v8 + 40) = v3;
  *(_QWORD *)(v8 + 48) = v4;
  *(_QWORD *)(v8 + 56) = v5;
  *(_QWORD *)(v8 + 64) = v6;
  *(_QWORD *)(v8 + 72) = v7;
  v9 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_231D71C18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4[5];

  sub_231D7E19C();
  v4[3] = sub_231D7E8F8();
  v4[4] = MEMORY[0x24BE453D0];
  sub_231D4CEA8(v4);
  sub_231D7E8EC();
  v0 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v4);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_231D7F640;
  *(_QWORD *)(v1 + 32) = v0;
  v2 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_231D71CF0()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22[3];
  uint64_t v23;
  uint64_t v24;

  v0 = sub_231D7E2EC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v22[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22[-1] - v5;
  v7 = sub_231D7DB48();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v21(v6, 1, 1, v7);
  if (qword_25419BDC0 != -1)
    swift_once();
  v8 = sub_231D7DFEC();
  sub_231D4E718(v8, (uint64_t)qword_25419BF18);
  v9 = sub_231D7E0AC();
  v11 = v10;
  sub_231D5F3AC((uint64_t)v6);
  v12 = *MEMORY[0x24BE42A98];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v13(v3, v12, v0);
  v14 = sub_231D7E1E4();
  v23 = sub_231D7E8D4();
  v24 = MEMORY[0x24BE45310];
  sub_231D4CEA8(v22);
  MEMORY[0x2348EF5DC](v9, v11, v3, v14);
  v15 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v22);
  v21(v6, 1, 1, v7);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v6);
  v16 = ((uint64_t (*)(char *, uint64_t, uint64_t))v13)(v3, v12, v0);
  MEMORY[0x2348EEEBC](v16);
  v23 = sub_231D7E8B0();
  v24 = MEMORY[0x24BE45200];
  sub_231D4CEA8(v22);
  sub_231D7E8A4();
  v17 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v22);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_231D7F620;
  *(_QWORD *)(v18 + 32) = v15;
  *(_QWORD *)(v18 + 40) = v17;
  v19 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_231D7200C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  void **v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  __int128 v26;
  uint64_t v27[6];

  v25[3] = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419B4C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE452E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v25 - v3;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v25 - v6;
  v8 = sub_231D7DB48();
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_25419BDC0 != -1)
    swift_once();
  v10 = sub_231D7DFEC();
  sub_231D4E718(v10, (uint64_t)qword_25419BF18);
  v25[2] = sub_231D7E0AC();
  v25[1] = v11;
  sub_231D5F3AC((uint64_t)v7);
  sub_231D4E564(0, &qword_255F73170, (uint64_t (*)(uint64_t))sub_231D7463C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  v26 = xmmword_231D7F640;
  v13 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  v14 = *v13;
  *(_QWORD *)(inited + 32) = *v13;
  v15 = (void *)objc_opt_self();
  v16 = *MEMORY[0x24BEBB610];
  v17 = v14;
  v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(_QWORD *)(inited + 64) = sub_231D5DF10(0, &qword_255F73178);
  *(_QWORD *)(inited + 40) = v18;
  sub_231D63FB8(inited);
  sub_231D72420(0x6174536F54746953, 0xEA0000000000646ELL);
  v9(v7, 1, 1, v8);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v7);
  sub_231D7E190();
  sub_231D7E8BC();
  v19 = sub_231D7E8C8();
  v20 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2348EEEBC](v20);
  sub_231D7E19C();
  sub_231D7E1A8();
  v27[3] = sub_231D7E148();
  v27[4] = MEMORY[0x24BE42278];
  sub_231D4CEA8(v27);
  sub_231D7E13C();
  v21 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v27);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(_QWORD *)(v22 + 32) = v21;
  v23 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v23;
}

id sub_231D72420(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_231D7E9B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = qword_25419BE08;
  sub_231D7E514();
  if (v8 != -1)
    swift_once();
  v9 = (id)qword_25419BF10;
  v10 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v11 = 0x24BEBD000uLL;
  v12 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v10, v9, 0);

  if (!v12)
  {
    sub_231D7E994();
    swift_bridgeObjectRetain_n();
    v13 = sub_231D7E9AC();
    v14 = sub_231D7EC58();
    v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      v16 = swift_slowAlloc();
      HIDWORD(v22) = v15;
      v17 = v16;
      v23 = swift_slowAlloc();
      v25 = v23;
      *(_DWORD *)v17 = 136315394;
      v18 = sub_231D7F018();
      v24 = sub_231D6475C(v18, v19, &v25);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      sub_231D7E514();
      v24 = sub_231D6475C(a1, a2, &v25);
      v11 = 9863680000;
      sub_231D7EDB4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231D49000, v13, BYTE4(v22), "[%s] Image named: %s not found for Improved Walking Steadiness", (uint8_t *)v17, 0x16u);
      v20 = v23;
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v20, -1, -1);
      MEMORY[0x2348F0170](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return objc_msgSend(objc_allocWithZone(*(Class *)(v11 + 1600)), sel_init);
  }
  return v12;
}

uint64_t sub_231D726D4()
{
  return sub_231D72B5C(0xD000000000000016, 0x8000000231D84D60, 0xD000000000000011, 0x8000000231D84D80);
}

uint64_t sub_231D7270C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  void **v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  __int128 v26;
  uint64_t v27[6];

  v25[3] = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419B4C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE452E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v25 - v3;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v25 - v6;
  v8 = sub_231D7DB48();
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_25419BDC0 != -1)
    swift_once();
  v10 = sub_231D7DFEC();
  sub_231D4E718(v10, (uint64_t)qword_25419BF18);
  v25[2] = sub_231D7E0AC();
  v25[1] = v11;
  sub_231D5F3AC((uint64_t)v7);
  sub_231D4E564(0, &qword_255F73170, (uint64_t (*)(uint64_t))sub_231D7463C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  v26 = xmmword_231D7F640;
  v13 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  v14 = *v13;
  *(_QWORD *)(inited + 32) = *v13;
  v15 = (void *)objc_opt_self();
  v16 = *MEMORY[0x24BEBB610];
  v17 = v14;
  v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(_QWORD *)(inited + 64) = sub_231D5DF10(0, &qword_255F73178);
  *(_QWORD *)(inited + 40) = v18;
  sub_231D63FB8(inited);
  sub_231D72420(0x73696152666C6143, 0xEA00000000007365);
  v9(v7, 1, 1, v8);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v7);
  sub_231D7E190();
  sub_231D7E8BC();
  v19 = sub_231D7E8C8();
  v20 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2348EEEBC](v20);
  sub_231D7E19C();
  sub_231D7E1A8();
  v27[3] = sub_231D7E148();
  v27[4] = MEMORY[0x24BE42278];
  sub_231D4CEA8(v27);
  sub_231D7E13C();
  v21 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v27);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(_QWORD *)(v22 + 32) = v21;
  v23 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_231D72B20()
{
  return sub_231D72B5C(0xD000000000000015, 0x8000000231D84D00, 0xD000000000000010, 0x8000000231D84D20);
}

uint64_t sub_231D72B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *);
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t *, char *, uint64_t);
  char *v35;
  uint64_t *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v41;
  unsigned int v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;

  v44 = a3;
  v45 = a4;
  v4 = sub_231D7E8B0();
  v47 = *(_QWORD *)(v4 - 8);
  v48 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)&v41 - v7;
  v8 = sub_231D7E2EC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v41 - v13;
  v46 = sub_231D7E178();
  v50 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v49 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_231D7DB48();
  v43 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v43(v14, 1, 1);
  if (qword_25419BDC0 != -1)
    swift_once();
  v17 = sub_231D7DFEC();
  v41 = sub_231D4E718(v17, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v14);
  sub_231D74F10();
  v42 = *MEMORY[0x24BE42A98];
  v18 = *(uint64_t (**)(char *))(v9 + 104);
  v19 = v18(v11);
  MEMORY[0x2348EEEB0](v19);
  sub_231D7E184();
  v20 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v43;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v43)(v14, 1, 1, v16);
  sub_231D7E0AC();
  v21 = sub_231D5F3AC((uint64_t)v14);
  MEMORY[0x2348EEEB0](v21);
  v22 = v42;
  ((void (*)(char *, _QWORD, uint64_t))v18)(v11, v42, v8);
  sub_231D7E8A4();
  v20(v14, 1, 1, v16);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v14);
  v23 = ((uint64_t (*)(char *, uint64_t, uint64_t))v18)(v11, v22, v8);
  MEMORY[0x2348EEEBC](v23);
  sub_231D7E8A4();
  sub_231D4E564(0, &qword_255F73180, (uint64_t (*)(uint64_t))sub_231D7507C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_231D80E20;
  v25 = MEMORY[0x24BE423E0];
  v26 = v46;
  *(_QWORD *)(v24 + 56) = v46;
  *(_QWORD *)(v24 + 64) = v25;
  *(_QWORD *)(v24 + 72) = MEMORY[0x24BE423D8];
  v27 = sub_231D4CEA8((uint64_t *)(v24 + 32));
  v28 = v49;
  (*(void (**)(uint64_t *, char *, uint64_t))(v50 + 16))(v27, v49, v26);
  v29 = MEMORY[0x24BE45208];
  v30 = v48;
  *(_QWORD *)(v24 + 104) = v48;
  *(_QWORD *)(v24 + 112) = v29;
  v31 = MEMORY[0x24BE45200];
  *(_QWORD *)(v24 + 120) = MEMORY[0x24BE45200];
  v32 = sub_231D4CEA8((uint64_t *)(v24 + 80));
  v33 = v47;
  v34 = *(void (**)(uint64_t *, char *, uint64_t))(v47 + 16);
  v35 = v51;
  v34(v32, v51, v30);
  *(_QWORD *)(v24 + 152) = v30;
  *(_QWORD *)(v24 + 160) = v29;
  *(_QWORD *)(v24 + 168) = v31;
  v36 = sub_231D4CEA8((uint64_t *)(v24 + 128));
  v37 = v52;
  v34(v36, v52, v30);
  v38 = sub_231D7E514();
  swift_bridgeObjectRelease();
  v39 = *(void (**)(char *, uint64_t))(v33 + 8);
  v39(v37, v30);
  v39(v35, v30);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v28, v26);
  return v38;
}

uint64_t sub_231D72FF8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  void **v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  __int128 v26;
  uint64_t v27[6];

  v25[3] = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419B4C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE452E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v25 - v3;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v25 - v6;
  v8 = sub_231D7DB48();
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_25419BDC0 != -1)
    swift_once();
  v10 = sub_231D7DFEC();
  sub_231D4E718(v10, (uint64_t)qword_25419BF18);
  v25[2] = sub_231D7E0AC();
  v25[1] = v11;
  sub_231D5F3AC((uint64_t)v7);
  sub_231D4E564(0, &qword_255F73170, (uint64_t (*)(uint64_t))sub_231D7463C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  v26 = xmmword_231D7F640;
  v13 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  v14 = *v13;
  *(_QWORD *)(inited + 32) = *v13;
  v15 = (void *)objc_opt_self();
  v16 = *MEMORY[0x24BEBB610];
  v17 = v14;
  v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(_QWORD *)(inited + 64) = sub_231D5DF10(0, &qword_255F73178);
  *(_QWORD *)(inited + 40) = v18;
  sub_231D63FB8(inited);
  sub_231D72420(0x6375646241706948, 0xEC0000006E6F6974);
  v9(v7, 1, 1, v8);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v7);
  sub_231D7E190();
  sub_231D7E8BC();
  v19 = sub_231D7E8C8();
  v20 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2348EEEBC](v20);
  sub_231D7E19C();
  sub_231D7E1A8();
  v27[3] = sub_231D7E148();
  v27[4] = MEMORY[0x24BE42278];
  sub_231D4CEA8(v27);
  sub_231D7E13C();
  v21 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v27);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(_QWORD *)(v22 + 32) = v21;
  v23 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_231D73410()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t *, char *, uint64_t);
  char *v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;

  v0 = sub_231D7E8B0();
  v43 = *(_QWORD *)(v0 - 8);
  v44 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v42 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v47 = (char *)&v38 - v3;
  v4 = sub_231D7E2EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - v9;
  v41 = sub_231D7E178();
  v46 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v45 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_231D7DB48();
  v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v40(v10, 1, 1, v12);
  if (qword_25419BDC0 != -1)
    swift_once();
  v13 = sub_231D7DFEC();
  sub_231D4E718(v13, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v10);
  sub_231D74F10();
  v14 = *MEMORY[0x24BE42A98];
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v16 = v15(v7, v14, v4);
  MEMORY[0x2348EEEB0](v16);
  sub_231D7E184();
  v17 = v12;
  v39 = v12;
  v18 = v40;
  v40(v10, 1, 1, v17);
  sub_231D7E0AC();
  v19 = sub_231D5F3AC((uint64_t)v10);
  MEMORY[0x2348EEEB0](v19);
  v15(v7, v14, v4);
  sub_231D7E8A4();
  v18(v10, 1, 1, v39);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v10);
  v20 = v15(v7, v14, v4);
  MEMORY[0x2348EEEBC](v20);
  v21 = v42;
  sub_231D7E8A4();
  sub_231D4E564(0, &qword_255F73180, (uint64_t (*)(uint64_t))sub_231D7507C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_231D80E20;
  v23 = MEMORY[0x24BE423E0];
  v24 = v41;
  *(_QWORD *)(v22 + 56) = v41;
  *(_QWORD *)(v22 + 64) = v23;
  *(_QWORD *)(v22 + 72) = MEMORY[0x24BE423D8];
  v25 = sub_231D4CEA8((uint64_t *)(v22 + 32));
  v26 = v45;
  (*(void (**)(uint64_t *, char *, uint64_t))(v46 + 16))(v25, v45, v24);
  v27 = MEMORY[0x24BE45208];
  v28 = v44;
  *(_QWORD *)(v22 + 104) = v44;
  *(_QWORD *)(v22 + 112) = v27;
  v29 = MEMORY[0x24BE45200];
  *(_QWORD *)(v22 + 120) = MEMORY[0x24BE45200];
  v30 = sub_231D4CEA8((uint64_t *)(v22 + 80));
  v31 = v43;
  v32 = *(void (**)(uint64_t *, char *, uint64_t))(v43 + 16);
  v33 = v47;
  v32(v30, v47, v28);
  *(_QWORD *)(v22 + 152) = v28;
  *(_QWORD *)(v22 + 160) = v27;
  *(_QWORD *)(v22 + 168) = v29;
  v34 = sub_231D4CEA8((uint64_t *)(v22 + 128));
  v32(v34, v21, v28);
  v35 = sub_231D7E514();
  swift_bridgeObjectRelease();
  v36 = *(void (**)(char *, uint64_t))(v31 + 8);
  v36(v21, v28);
  v36(v33, v28);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v26, v24);
  return v35;
}

uint64_t sub_231D738C8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  void **v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  __int128 v26;
  uint64_t v27[6];

  v25[3] = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419B4C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE452E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v25 - v3;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v25 - v6;
  v8 = sub_231D7DB48();
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_25419BDC0 != -1)
    swift_once();
  v10 = sub_231D7DFEC();
  sub_231D4E718(v10, (uint64_t)qword_25419BF18);
  v25[2] = sub_231D7E0AC();
  v25[1] = v11;
  sub_231D5F3AC((uint64_t)v7);
  sub_231D4E564(0, &qword_255F73170, (uint64_t (*)(uint64_t))sub_231D7463C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  v26 = xmmword_231D7F640;
  v13 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  v14 = *v13;
  *(_QWORD *)(inited + 32) = *v13;
  v15 = (void *)objc_opt_self();
  v16 = *MEMORY[0x24BEBB610];
  v17 = v14;
  v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(_QWORD *)(inited + 64) = sub_231D5DF10(0, &qword_255F73178);
  *(_QWORD *)(inited + 40) = v18;
  sub_231D63FB8(inited);
  sub_231D72420(0x57656F546C656548, 0xEE00676E696B6C61);
  v9(v7, 1, 1, v8);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v7);
  sub_231D7E190();
  sub_231D7E8BC();
  v19 = sub_231D7E8C8();
  v20 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2348EEEBC](v20);
  sub_231D7E19C();
  sub_231D7E1A8();
  v27[3] = sub_231D7E148();
  v27[4] = MEMORY[0x24BE42278];
  sub_231D4CEA8(v27);
  sub_231D7E13C();
  v21 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v27);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(_QWORD *)(v22 + 32) = v21;
  v23 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_231D73CE4()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;

  v0 = sub_231D7E8B0();
  v35 = *(_QWORD *)(v0 - 8);
  v36 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v34 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_231D7E2EC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - v7;
  v9 = sub_231D7E178();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v37 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_231D7DB48();
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v31(v8, 1, 1, v11);
  if (qword_25419BDC0 != -1)
    swift_once();
  v12 = sub_231D7DFEC();
  sub_231D4E718(v12, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v8);
  sub_231D74F10();
  v13 = *MEMORY[0x24BE42A98];
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v15 = v14(v5, v13, v2);
  MEMORY[0x2348EEEB0](v15);
  sub_231D7E184();
  v31(v8, 1, 1, v11);
  sub_231D7E0AC();
  v16 = sub_231D5F3AC((uint64_t)v8);
  MEMORY[0x2348EEEB0](v16);
  v14(v5, v13, v2);
  v17 = v34;
  sub_231D7E8A4();
  sub_231D4E564(0, &qword_255F73180, (uint64_t (*)(uint64_t))sub_231D7507C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_231D7F620;
  v19 = MEMORY[0x24BE423E0];
  v20 = v33;
  *(_QWORD *)(v18 + 56) = v33;
  *(_QWORD *)(v18 + 64) = v19;
  *(_QWORD *)(v18 + 72) = MEMORY[0x24BE423D8];
  v21 = sub_231D4CEA8((uint64_t *)(v18 + 32));
  v22 = v32;
  v23 = v37;
  (*(void (**)(uint64_t *, char *, uint64_t))(v32 + 16))(v21, v37, v20);
  v24 = MEMORY[0x24BE45208];
  v25 = v36;
  *(_QWORD *)(v18 + 104) = v36;
  *(_QWORD *)(v18 + 112) = v24;
  *(_QWORD *)(v18 + 120) = MEMORY[0x24BE45200];
  v26 = sub_231D4CEA8((uint64_t *)(v18 + 80));
  v27 = v35;
  (*(void (**)(uint64_t *, char *, uint64_t))(v35 + 16))(v26, v17, v25);
  v28 = sub_231D7E514();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v25);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v20);
  return v28;
}

uint64_t sub_231D740B0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  void **v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  __int128 v26;
  uint64_t v27[6];

  v25[3] = a1;
  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_231D4E564(0, &qword_25419B4C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE452E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v25 - v3;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v25 - v6;
  v8 = sub_231D7DB48();
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_25419BDC0 != -1)
    swift_once();
  v10 = sub_231D7DFEC();
  sub_231D4E718(v10, (uint64_t)qword_25419BF18);
  v25[2] = sub_231D7E0AC();
  v25[1] = v11;
  sub_231D5F3AC((uint64_t)v7);
  sub_231D4E564(0, &qword_255F73170, (uint64_t (*)(uint64_t))sub_231D7463C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  v26 = xmmword_231D7F640;
  v13 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  v14 = *v13;
  *(_QWORD *)(inited + 32) = *v13;
  v15 = (void *)objc_opt_self();
  v16 = *MEMORY[0x24BEBB610];
  v17 = v14;
  v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(_QWORD *)(inited + 64) = sub_231D5DF10(0, &qword_255F73178);
  *(_QWORD *)(inited + 40) = v18;
  sub_231D63FB8(inited);
  sub_231D72420(0xD000000000000017, 0x8000000231D833F0);
  v9(v7, 1, 1, v8);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v7);
  sub_231D7E190();
  sub_231D7E8BC();
  v19 = sub_231D7E8C8();
  v20 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2348EEEBC](v20);
  sub_231D7E19C();
  sub_231D7E1A8();
  v27[3] = sub_231D7E148();
  v27[4] = MEMORY[0x24BE42278];
  sub_231D4CEA8(v27);
  sub_231D7E13C();
  v21 = sub_231D7E400();
  sub_231D4CEE8((uint64_t)v27);
  sub_231D745E4(0, &qword_255F73160, &qword_255F73168, &qword_25419B4B8);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(_QWORD *)(v22 + 32) = v21;
  v23 = MEMORY[0x2348EF0F0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_231D744C4()
{
  return sub_231D72B5C(0xD000000000000024, 0x8000000231D84B90, 0xD00000000000001FLL, 0x8000000231D84BE0);
}

uint64_t type metadata accessor for ImproveWalkingSteadinessPDFProvider()
{
  return objc_opt_self();
}

uint64_t sub_231D7451C()
{
  return sub_231D712DC();
}

uint64_t sub_231D7453C()
{
  return swift_deallocObject();
}

uint64_t sub_231D7454C()
{
  uint64_t v0;

  return sub_231D7189C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_231D74554()
{
  return sub_231D719F8();
}

uint64_t sub_231D7455C()
{
  return MEMORY[0x24BEE4AF8];
}

void sub_231D74568(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_231D58104(255, a3);
    v4 = sub_231D7EC10();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_231D745BC()
{
  uint64_t v0;

  return sub_231D7200C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_231D745C4()
{
  uint64_t v0;

  return sub_231D7270C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_231D745CC()
{
  uint64_t v0;

  return sub_231D72FF8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_231D745D4()
{
  uint64_t v0;

  return sub_231D738C8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_231D745DC()
{
  uint64_t v0;

  return sub_231D740B0(*(_QWORD *)(v0 + 16));
}

void sub_231D745E4(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_231D74568(255, a3, a4);
    v5 = sub_231D7EF70();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_231D7463C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255F72F38)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255F72F38);
  }
}

unint64_t sub_231D746A4(uint64_t a1)
{
  uint64_t v2;

  sub_231D7EB74();
  sub_231D7EFB8();
  sub_231D7EBA4();
  v2 = sub_231D7EFD0();
  swift_bridgeObjectRelease();
  return sub_231D74724(a1, v2);
}

unint64_t sub_231D74724(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_231D7EB74();
    v8 = v7;
    if (v6 == sub_231D7EB74() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_231D7EF88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_231D7EB74();
          v15 = v14;
          if (v13 == sub_231D7EB74() && v15 == v16)
            break;
          v18 = sub_231D7EF88();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_231D74898(uint64_t a1, char a2)
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
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  _OWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  sub_231D750D8();
  v35 = a2;
  v6 = sub_231D7EEBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
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
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v33)
        goto LABEL_34;
      v19 = *(_QWORD *)(v34 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v33)
              goto LABEL_34;
            v19 = *(_QWORD *)(v34 + 8 * v13);
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
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v16);
    if ((v35 & 1) != 0)
    {
      sub_231D64ED4(v22, v36);
    }
    else
    {
      sub_231D65034((uint64_t)v22, (uint64_t)v36);
      v23 = v21;
    }
    sub_231D7EB74();
    sub_231D7EFB8();
    sub_231D7EBA4();
    v24 = sub_231D7EFD0();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v21;
    result = (uint64_t)sub_231D64ED4(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_231D74BCC(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_231D746A4((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_OWORD *)(v15[7] + 32 * v9);
        sub_231D4CEE8((uint64_t)v16);
        return sub_231D64ED4(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_231D74D50();
      goto LABEL_7;
    }
    sub_231D74898(v12, a3 & 1);
    v18 = sub_231D746A4((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_231D74CEC(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for Key(0);
  result = (_OWORD *)sub_231D7EFA0();
  __break(1u);
  return result;
}

_OWORD *sub_231D74CEC(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_231D64ED4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

id sub_231D74D50()
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
  _OWORD v22[2];

  v1 = v0;
  sub_231D750D8();
  v2 = *v0;
  v3 = sub_231D7EEB0();
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
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_231D65034(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_231D64ED4(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
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

unint64_t sub_231D74F10()
{
  id v0;
  uint64_t inited;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v11[2];
  __int128 v12;
  uint64_t v13;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  sub_231D7E1CC();
  objc_msgSend(v0, sel_setLineSpacing_);
  sub_231D7E1D8();
  objc_msgSend(v0, sel_setParagraphSpacing_);
  sub_231D4E564(0, &qword_255F73170, (uint64_t (*)(uint64_t))sub_231D7463C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  v2 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  v3 = v2;
  v4 = sub_231D7E1F0();
  *(_QWORD *)(inited + 64) = sub_231D5DF10(0, &qword_255F73178);
  *(_QWORD *)(inited + 40) = v4;
  v5 = sub_231D63FB8(inited);
  v6 = (void *)*MEMORY[0x24BEBB3A8];
  v13 = sub_231D5DF10(0, &qword_255F73190);
  *(_QWORD *)&v12 = v0;
  sub_231D64ED4(&v12, v11);
  v7 = v6;
  v8 = v0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_231D74BCC(v11, v7, isUniquelyReferenced_nonNull_native);

  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_231D7507C()
{
  unint64_t result;

  result = qword_255F73188;
  if (!qword_255F73188)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255F73188);
  }
  return result;
}

void sub_231D750D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72F30)
  {
    type metadata accessor for Key(255);
    sub_231D75144();
    v0 = sub_231D7EED4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72F30);
  }
}

unint64_t sub_231D75144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255F72778;
  if (!qword_255F72778)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x2348F00E0](&unk_231D7FF30, v1);
    atomic_store(result, (unint64_t *)&qword_255F72778);
  }
  return result;
}

uint64_t sub_231D7518C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = sub_231D7E9B8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v29 - v9;
  v11 = (void *)sub_231D7E910();
  v12 = objc_msgSend(v11, sel_areAllRequirementsSatisfied);

  if (v12)
  {
    sub_231D7E988();
    v13 = sub_231D7E9AC();
    v14 = sub_231D7EC64();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v31 = a2;
      v17 = v16;
      v34 = v16;
      *(_DWORD *)v15 = 136315394;
      v32 = v4;
      v18 = sub_231D7F018();
      v33 = sub_231D6475C(v18, v19, &v34);
      v30 = v5;
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      v33 = sub_231D6475C(0xD000000000000024, 0x8000000231D84ED0, &v34);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v13, v14, "[%s.%s] Creating walking steadiness settings feed item", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      v20 = v17;
      a2 = v31;
      MEMORY[0x2348F0170](v20, -1, -1);
      MEMORY[0x2348F0170](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v32);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    return sub_231D755AC(a1, 0xD00000000000002DLL, 0x8000000231D84E00, a2);
  }
  else
  {
    sub_231D7E988();
    v21 = sub_231D7E9AC();
    v22 = sub_231D7EC64();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v34 = v24;
      *(_DWORD *)v23 = 136315394;
      v32 = v4;
      v25 = sub_231D7F018();
      v33 = sub_231D6475C(v25, v26, &v34);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      v33 = sub_231D6475C(0xD000000000000024, 0x8000000231D84ED0, &v34);
      sub_231D7EDB4();
      _os_log_impl(&dword_231D49000, v21, v22, "[%s.%s]: Not creating walking steadiness settings feed item", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v24, -1, -1);
      MEMORY[0x2348F0170](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v32);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v28 = sub_231D7DD04();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a2, 1, 1, v28);
  }
}

uint64_t sub_231D755AC@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t inited;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;

  v52 = a3;
  v51 = a2;
  v63 = a1;
  v66 = a4;
  v47 = *v4;
  v57 = sub_231D7E9B8();
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v58 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_231D7DF98();
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v53 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_231D7DC74();
  v67 = *(_QWORD *)(v62 - 8);
  v7 = MEMORY[0x24BDAC7A8](v62);
  v50 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v47 - v9;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v47 - v12;
  v49 = sub_231D7E25C();
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_231D7E3D0();
  v64 = *(_QWORD *)(v16 - 8);
  v65 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  v59 = sub_231D7DC98();
  v60 = v19;
  LODWORD(v61) = v20;
  v21 = sub_231D7DB48();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v22(v13, 1, 1, v21);
  if (qword_25419BDC0 != -1)
    swift_once();
  v23 = sub_231D7DFEC();
  sub_231D4E718(v23, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v13);
  sub_231D7E244();
  v22(v13, 1, 1, v21);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v13);
  sub_231D7E3AC();
  v24 = v67;
  v25 = v62;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v10, *MEMORY[0x24BE474D0], v62);
  v26 = (void *)sub_231D7DD10();
  v27 = sub_231D7E3C4();
  v28 = v10;
  v29 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  v30 = v27;
  v63 = v10;
  v32 = v31;
  v29(v50, v28, v25);
  sub_231D76284(v30, v32);
  v58 = v26;
  sub_231D7E514();
  v33 = v66;
  v34 = v30;
  v61 = v32;
  sub_231D7DCC8();
  v35 = v18;
  sub_231D7E3B8();
  sub_231D7E250();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v49);
  sub_231D7DCBC();
  sub_231D762C8(0, (unint64_t *)&qword_25419B560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_231D7F640;
  *(_QWORD *)(inited + 32) = sub_231D7DD28();
  *(_QWORD *)(inited + 40) = v37;
  sub_231D620E0(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  sub_231D7DCEC();
  v38 = v54;
  v39 = v53;
  v40 = v55;
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v53, *MEMORY[0x24BE419A0], v55);
  sub_231D7DF8C();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
  sub_231D7DCF8();
  sub_231D7DCB0();
  sub_231D762C8(0, (unint64_t *)&qword_25419BD50);
  v41 = swift_initStackObject();
  *(_OWORD *)(v41 + 16) = xmmword_231D81B70;
  sub_231D76230();
  *(_QWORD *)(v41 + 32) = MEMORY[0x2348EF96C]((id)*MEMORY[0x24BDD2860]);
  v68 = v41;
  sub_231D7EBEC();
  v42 = v68;
  if (v68 >> 62)
  {
    sub_231D7E514();
    v43 = sub_231D7EEA4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v43 = *(_QWORD *)((v68 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v44 = v67;
  if (v43)
    sub_231D61CC0(v42);
  swift_bridgeObjectRelease();
  sub_231D7DCD4();

  sub_231D7630C(v34, v61);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v63, v25);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v35, v65);
  v45 = sub_231D7DD04();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v33, 0, 1, v45);
}

uint64_t type metadata accessor for WalkingSteadinessNotificationSettingsFeatureStatusFeedItemProvider()
{
  return objc_opt_self();
}

unint64_t sub_231D75F38()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_231D75F58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE474D0];
  v3 = sub_231D7DC74();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_231D75F9C(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  sub_231D760C8(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BCF0, v5, MEMORY[0x24BDB9DE0]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v13 - v9;
  sub_231D7518C(a1, (uint64_t)v4);
  sub_231D7EA84();
  sub_231D760E4();
  v11 = sub_231D7EA90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

unint64_t sub_231D760AC()
{
  return 0xD000000000000042;
}

void sub_231D760C8(uint64_t a1)
{
  sub_231D4E564(a1, &qword_25419B4C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

unint64_t sub_231D760E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25419BCE8;
  if (!qword_25419BCE8)
  {
    sub_231D4E564(255, &qword_25419BCF0, (uint64_t (*)(uint64_t))sub_231D760C8, MEMORY[0x24BDB9DE0]);
    result = MEMORY[0x2348F00E0](MEMORY[0x24BDB9DF8], v1);
    atomic_store(result, (unint64_t *)&qword_25419BCE8);
  }
  return result;
}

uint64_t sub_231D76144()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_231D762C8(0, (unint64_t *)&qword_25419BD50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_231D81B70;
  sub_231D76230();
  *(_QWORD *)(inited + 32) = MEMORY[0x2348EF96C]((id)*MEMORY[0x24BDD2860]);
  sub_231D7EBEC();
  if (inited >> 62)
  {
    sub_231D7E514();
    v3 = sub_231D7EEA4();
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
  sub_231D61CC0(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_231D76230()
{
  unint64_t result;

  result = qword_25419B520;
  if (!qword_25419B520)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25419B520);
  }
  return result;
}

uint64_t sub_231D7626C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 5u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_231D76284(uint64_t a1, unint64_t a2)
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

void sub_231D762C8(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_231D7EF70();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_231D7630C(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for FitnessPlusDataSource()
{
  uint64_t result;

  result = qword_255F731A0;
  if (!qword_255F731A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231D7638C()
{
  return swift_initClassMetadata2();
}

BOOL sub_231D763D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_231D763EC()
{
  type metadata accessor for FitnessPlusCell();
  sub_231D4CD8C(&qword_255F73218, (uint64_t (*)(uint64_t))type metadata accessor for FitnessPlusCell, (uint64_t)&unk_231D820D4);
  return sub_231D7EC94();
}

uint64_t sub_231D76440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v9;

  v1 = sub_231D7E2BC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E2B0();
  v5 = sub_231D7E2A4();
  if (v0)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    v6 = (void *)v5;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v7 = objc_msgSend((id)objc_opt_self(), sel_estimatedDimension_, 100.0);
    v1 = sub_231D7ED24();

  }
  return v1;
}

uint64_t sub_231D7653C()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t (**v33)();
  uint64_t (*v34)();
  char *v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t (**v40)@<X0>(void *@<X0>, uint64_t@<X8>);
  char *v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t (*v58)();
  uint64_t v59[6];

  v0 = sub_231D7E9B8();
  v45 = *(_QWORD *)(v0 - 8);
  v46 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_255F73228, (uint64_t (*)(uint64_t))MEMORY[0x24BE8AFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE8D6F0]);
  v51 = v3;
  v49 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v49 + 64);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v48 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v47 = (char *)&v45 - v6;
  sub_231D77ABC();
  v8 = v7;
  v53 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v53 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v50 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v52 = (char *)&v45 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v56 = (char *)&v45 - v13;
  v14 = sub_231D7DB9C();
  v54 = *(_QWORD *)(v14 - 8);
  v55 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v57 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_231D7DC20();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall)
    && (sub_231D5DF10(0, &qword_255F73238),
        v20 = (void *)sub_231D7EC7C(),
        v21 = (void *)sub_231D7EB44(),
        v22 = objc_msgSend(v20, sel_BOOLForKey_, v21),
        v20,
        v21,
        (v22 & 1) != 0))
  {
    sub_231D7E994();
    v23 = sub_231D7E9AC();
    v24 = sub_231D7EC64();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_231D49000, v23, v24, "FitnessPlusDataSource: subscription check has been overridden to be true", v25, 2u);
      MEMORY[0x2348F0170](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v2, v46);
    return sub_231D76EE0();
  }
  else
  {
    sub_231D7DBFC();
    sub_231D5DF10(0, (unint64_t *)&qword_25419BE00);
    swift_retain();
    sub_231D7ECE8();
    (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BE87648], v16);
    v59[3] = sub_231D7DC14();
    v59[4] = MEMORY[0x24BE87608];
    sub_231D4CEA8(v59);
    sub_231D7DC08();
    sub_231D7DC38();
    swift_allocObject();
    sub_231D7DC2C();
    sub_231D7ECE8();
    v46 = sub_231D7DBF0();
    sub_231D7DB90();
    v27 = v47;
    sub_231D7DBE4();
    v28 = v48;
    v29 = v49;
    v30 = v51;
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v48, v27, v51);
    v31 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    v32 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v32 + v31, v28, v30);
    v33 = (uint64_t (**)())(v32 + ((v4 + v31 + 7) & 0xFFFFFFFFFFFFFFF8));
    v34 = v58;
    *v33 = sub_231D77B14;
    v33[1] = v34;
    swift_retain();
    v35 = v52;
    sub_231D7DBA8();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v30);
    v36 = v53;
    v37 = v50;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v50, v35, v8);
    v38 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v39 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v39 + v38, v37, v8);
    v40 = (uint64_t (**)@<X0>(void *@<X0>, uint64_t@<X8>))(v39 + ((v9 + v38 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v40 = sub_231D76CA8;
    v40[1] = 0;
    v41 = v56;
    sub_231D7DBA8();
    v42 = *(void (**)(char *, uint64_t))(v36 + 8);
    v42(v35, v8);
    v43 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_231D7DBC0();
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = 0;
    *(_QWORD *)(v44 + 24) = 0;
    v43(sub_231D77D08, v44);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v42(v41, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v57, v55);
  }
}

uint64_t sub_231D76B00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _DWORD v13[4];

  v0 = sub_231D7E9B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_231D7DB18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7DB0C();
  v8 = sub_231D7DB78();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_231D7E994();
  v9 = sub_231D7E9AC();
  v10 = sub_231D7EC64();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67109120;
    v13[3] = v8 & 1;
    sub_231D7EDB4();
    _os_log_impl(&dword_231D49000, v9, v10, "FitnessPlusDataSource: subscription check yielded %{BOOL}d", v11, 8u);
    MEMORY[0x2348F0170](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v8 & 1) != 0)
    sub_231D76EE0();
  return sub_231D7DBCC();
}

uint64_t sub_231D76CA8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  _QWORD v19[3];
  uint64_t v20;

  v4 = sub_231D7E9B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7E994();
  v8 = a1;
  v9 = a1;
  v10 = sub_231D7E9AC();
  v11 = sub_231D7EC4C();
  if (os_log_type_enabled(v10, v11))
  {
    v19[0] = v4;
    v12 = swift_slowAlloc();
    v19[1] = a2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v20 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getErrorValue();
    v15 = sub_231D7EFAC();
    v19[2] = sub_231D6475C(v15, v16, &v20);
    sub_231D7EDB4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_231D49000, v10, v11, "FitnessPlusDataSource: subscription check error: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v14, -1, -1);
    MEMORY[0x2348F0170](v13, -1, -1);

    (*(void (**)(char *, _QWORD))(v5 + 8))(v7, v19[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v17 = a1;
  return sub_231D7DBB4();
}

uint64_t sub_231D76EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;

  v1 = v0;
  v2 = sub_231D7DB3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4CDF8();
  v6 = swift_allocObject();
  v12 = xmmword_231D7F640;
  *(_OWORD *)(v6 + 16) = xmmword_231D7F640;
  v7 = (*(_BYTE *)(v1 + qword_255F73198 + 8) & 1) == 0 && *(uint64_t *)(v1 + qword_255F73198) > 54;
  v9 = qword_255F73330;
  v8 = unk_255F73338;
  sub_231D7E514();
  *(_QWORD *)(v6 + 56) = &type metadata for FitnessPlusDataSource.FitnessPlusItem;
  *(_QWORD *)(v6 + 64) = sub_231D77A68();
  v10 = swift_allocObject();
  *(_QWORD *)(v6 + 32) = v10;
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v8;
  *(_QWORD *)(v10 + 32) = 0xD00000000000001DLL;
  *(_QWORD *)(v10 + 40) = 0x8000000231D85020;
  *(_BYTE *)(v10 + 48) = v7;
  sub_231D4E564(0, (unint64_t *)&qword_255F725C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE43368], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_231D7E454();
  *(_OWORD *)(swift_allocObject() + 16) = v12;
  sub_231D7DB30();
  sub_231D7DB24();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_231D7E448();
  sub_231D7E460();
  return swift_bridgeObjectRelease();
}

void sub_231D770CC()
{
  sub_231D770FC();
}

void sub_231D770E4()
{
  sub_231D770FC();
}

void sub_231D770FC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_231D77124()
{
  sub_231D7E73C();
  return swift_deallocClassInstance();
}

uint64_t sub_231D77140()
{
  return type metadata accessor for FitnessPlusDataSource();
}

uint64_t sub_231D77148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(void (*)(uint64_t), _QWORD *);
  _QWORD *v10;

  sub_231D4E564(0, &qword_255F73228, (uint64_t (*)(uint64_t))MEMORY[0x24BE8AFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE8D6F0]);
  v9 = (void (*)(void (*)(uint64_t), _QWORD *))sub_231D7DBC0();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a1;
  v10[5] = a2;
  swift_retain();
  swift_retain();
  v9(sub_231D77D98, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_231D77204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(uint64_t (*)(uint64_t), _QWORD *);
  _QWORD *v10;

  sub_231D77ABC();
  v9 = (void (*)(uint64_t (*)(uint64_t), _QWORD *))sub_231D7DBC0();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_231D77D1C, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_231D772A8(void *a1, char a2, uint64_t (*a3)(void **), uint64_t a4, void (*a5)(void *))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v16;
  void (*v17)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v18;
  void *v19;
  char v20;

  sub_231D77ABC();
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v16 = a1;
    a5(a1);
    v17 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_231D7DBC0();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a3;
    *(_QWORD *)(v18 + 24) = a4;
    swift_retain();
    v17(sub_231D77D08, v18);
    swift_release();
    swift_release();
    sub_231D77D38(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v19 = a1;
    v20 = 0;
    return a3(&v19);
  }
}

void sub_231D773DC(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(id *), uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  id v19;
  id v20;
  void (*v21)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v22;
  _QWORD v23[2];
  void (*v24)(id *);
  uint64_t v25;
  id v26;
  char v27;

  v24 = a4;
  v25 = a5;
  v23[1] = a3;
  sub_231D77ABC();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_231D7DB84();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D77DA4();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (id *)((char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_231D77E20(a1, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v26 = *v18;
    v19 = v26;
    v27 = 1;
    v20 = v26;
    v24(&v26);

  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v13 + 32))(v15, v18, v12);
    a2(v15);
    v21 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_231D7DBC0();
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v24;
    *(_QWORD *)(v22 + 24) = v25;
    swift_retain();
    v21(sub_231D77D08, v22);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_231D775D0(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD v23[5];

  v4 = sub_231D7EA3C();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_231D7DB3C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v22 - v10;
  v12 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  if (qword_25419BDC0 != -1)
    swift_once();
  v13 = sub_231D7DFEC();
  sub_231D4E718(v13, (uint64_t)qword_25419BF18);
  v14 = sub_231D7E0AC();
  v22[1] = v15;
  v22[2] = v14;
  sub_231D5F3AC((uint64_t)v11);
  type metadata accessor for FitnessPlusDataSource();
  v16 = swift_allocObject() + qword_255F73198;
  *(_QWORD *)v16 = a1;
  *(_BYTE *)(v16 + 8) = a2 & 1;
  sub_231D4E564(0, (unint64_t *)&qword_255F725C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE43368], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_231D7E454();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_231D7F640;
  sub_231D7DB30();
  sub_231D7DB24();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_231D7E448();
  sub_231D7E724();
  sub_231D7653C();
  sub_231D7E310();
  swift_release();
  sub_231D7EA18();
  v17 = sub_231D7E130();
  v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BE42248];
  swift_allocObject();
  v19 = sub_231D7E124();
  v23[3] = v17;
  v23[4] = sub_231D4CD8C(&qword_255F731F0, v18, MEMORY[0x24BE42230]);
  v23[0] = v19;
  sub_231D77994();
  sub_231D4CD8C(&qword_255F73200, (uint64_t (*)(uint64_t))sub_231D77994, MEMORY[0x24BE428C8]);
  v20 = sub_231D7E31C();
  swift_release();
  sub_231D4CEE8((uint64_t)v23);
  sub_231D4CD8C(&qword_255F73208, (uint64_t (*)(uint64_t))sub_231D779F0, MEMORY[0x24BE42788]);
  return v20;
}

void sub_231D77994()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F731F8)
  {
    type metadata accessor for FitnessPlusDataSource();
    v0 = sub_231D7E28C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F731F8);
  }
}

void sub_231D779F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F73210)
  {
    sub_231D77994();
    sub_231D4CD8C(&qword_255F73200, (uint64_t (*)(uint64_t))sub_231D77994, MEMORY[0x24BE428C8]);
    v0 = sub_231D7E268();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F73210);
  }
}

unint64_t sub_231D77A68()
{
  unint64_t result;

  result = qword_255F73220;
  if (!qword_255F73220)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81DF8, &type metadata for FitnessPlusDataSource.FitnessPlusItem);
    atomic_store(result, (unint64_t *)&qword_255F73220);
  }
  return result;
}

uint64_t sub_231D77AAC()
{
  return sub_231D77D54((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

void sub_231D77ABC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F73230)
  {
    v0 = sub_231D7DBD8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F73230);
  }
}

uint64_t sub_231D77B14()
{
  return sub_231D76B00();
}

uint64_t sub_231D77B1C()
{
  uint64_t v0;
  uint64_t v1;

  sub_231D4E564(0, &qword_255F73228, (uint64_t (*)(uint64_t))MEMORY[0x24BE8AFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE8D6F0]);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D77BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;

  sub_231D4E564(0, &qword_255F73228, (uint64_t (*)(uint64_t))MEMORY[0x24BE8AFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE8D6F0]);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (uint64_t *)(v2 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_231D77148(a1, a2, v2 + v7, *v8, v8[1]);
}

uint64_t sub_231D77C28()
{
  uint64_t v0;
  uint64_t v1;

  sub_231D77ABC();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D77CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;

  sub_231D77ABC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (uint64_t *)(v2 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_231D77204(a1, a2, v2 + v7, *v8, v8[1]);
}

uint64_t sub_231D77D0C()
{
  return sub_231D77D54((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_231D77D1C(uint64_t a1)
{
  uint64_t v1;

  return sub_231D772A8(*(void **)a1, *(_BYTE *)(a1 + 8), *(uint64_t (**)(void **))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

void sub_231D77D38(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_231D77D44()
{
  return sub_231D77D54((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_231D77D54(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 24));
  a1(*(_QWORD *)(v1 + 40));
  return swift_deallocObject();
}

void sub_231D77D98(uint64_t a1)
{
  uint64_t v1;

  sub_231D773DC(a1, *(void (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(_QWORD *)(v1 + 40));
}

void sub_231D77DA4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F73240)
  {
    sub_231D7DB84();
    sub_231D58104(255, qword_25419BD70);
    v0 = sub_231D7EFDC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F73240);
  }
}

uint64_t sub_231D77E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D77DA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_231D77E68()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_231D77E94(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  char v3;
  uint64_t v4;
  char v5;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *(_BYTE *)(result + 8);
  v4 = *(_QWORD *)result;
  v5 = v3;
  if (v2)
    return v2(&v4);
  return result;
}

uint64_t sub_231D77ED4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_231D77EF8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  swift_willThrow();
  return v1;
}

uint64_t destroy for FitnessPlusDataSource.FitnessPlusItem()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
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
  sub_231D7E514();
  sub_231D7E514();
  return a1;
}

uint64_t assignWithCopy for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_231D7E514();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_231D7E514();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FitnessPlusDataSource.FitnessPlusItem()
{
  return &type metadata for FitnessPlusDataSource.FitnessPlusItem;
}

uint64_t getEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem.WorkoutType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem.WorkoutType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_231D781E0 + 4 * byte_231D81D95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_231D78214 + 4 * byte_231D81D90[v4]))();
}

uint64_t sub_231D78214(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D7821C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x231D78224);
  return result;
}

uint64_t sub_231D78230(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x231D78238);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_231D7823C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_231D78244(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_231D78250(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FitnessPlusDataSource.FitnessPlusItem.WorkoutType()
{
  return &type metadata for FitnessPlusDataSource.FitnessPlusItem.WorkoutType;
}

unint64_t sub_231D78270()
{
  unint64_t result;

  result = qword_255F73248;
  if (!qword_255F73248)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81E74, &type metadata for FitnessPlusDataSource.FitnessPlusItem.WorkoutType);
    atomic_store(result, (unint64_t *)&qword_255F73248);
  }
  return result;
}

double sub_231D782B4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  double result;

  sub_231D7E514();
  v2 = sub_231D7EEF8();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    *(_QWORD *)(a1 + 24) = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
    *(_QWORD *)(a1 + 32) = sub_231D583D4();
    v3 = sub_231D58418();
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    *(_QWORD *)(a1 + 24) = &type metadata for WalkingSteadinessArticleDataProvider;
    *(_QWORD *)(a1 + 32) = sub_231D7867C();
    v3 = sub_231D786C0();
LABEL_5:
    *(_QWORD *)(a1 + 40) = v3;
    return result;
  }
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_231D78364(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_231D78380(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_231D78380(char a1, int64_t a2, char a3, _QWORD *a4)
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
    sub_231D7871C();
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
    sub_231D78770();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_231D7EEE0();
  __break(1u);
  return result;
}

uint64_t sub_231D7851C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  __int128 v6;
  ValueMetadata *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  sub_231D78364(0, 2, 0);
  v0 = v10;
  v7 = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
  v8 = sub_231D583D4();
  v9 = sub_231D58418();
  v2 = *(_QWORD *)(v10 + 16);
  v1 = *(_QWORD *)(v10 + 24);
  if (v2 >= v1 >> 1)
  {
    sub_231D78364(v1 > 1, v2 + 1, 1);
    v0 = v10;
  }
  *(_QWORD *)(v0 + 16) = v2 + 1;
  sub_231D78704(&v6, (_OWORD *)(v0 + 48 * v2 + 32));
  v7 = &type metadata for WalkingSteadinessArticleDataProvider;
  v8 = sub_231D7867C();
  v9 = sub_231D786C0();
  v10 = v0;
  v4 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  if (v4 >= v3 >> 1)
  {
    sub_231D78364(v3 > 1, v4 + 1, 1);
    v0 = v10;
  }
  *(_QWORD *)(v0 + 16) = v4 + 1;
  sub_231D78704(&v6, (_OWORD *)(v0 + 48 * v4 + 32));
  return v0;
}

unint64_t sub_231D7867C()
{
  unint64_t result;

  result = qword_25419BE10;
  if (!qword_25419BE10)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81110, &type metadata for WalkingSteadinessArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_25419BE10);
  }
  return result;
}

unint64_t sub_231D786C0()
{
  unint64_t result;

  result = qword_25419BE18[0];
  if (!qword_25419BE18[0])
  {
    result = MEMORY[0x2348F00E0](&unk_231D810A8, &type metadata for WalkingSteadinessArticleDataProvider);
    atomic_store(result, qword_25419BE18);
  }
  return result;
}

_OWORD *sub_231D78704(__int128 *a1, _OWORD *a2)
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

void sub_231D7871C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419B558)
  {
    sub_231D78770();
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419B558);
  }
}

unint64_t sub_231D78770()
{
  unint64_t result;

  result = qword_25419B4D0;
  if (!qword_25419B4D0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_25419B4D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MobilityArticleTileDataController()
{
  return &type metadata for MobilityArticleTileDataController;
}

uint64_t sub_231D787DC()
{
  uint64_t result;

  sub_231D5DF10(0, (unint64_t *)&unk_255F732C0);
  result = sub_231D7ED90();
  qword_255F73250 = result;
  return result;
}

void sub_231D78908(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;

  v2 = sub_231D7E964();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D7ED0C();
  if (qword_255F724F0 != -1)
    swift_once();
  sub_231D7E958();
  sub_231D7E94C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_231D7E1FC();
  v6 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_finishedTest_, v6);

}

void sub_231D78A24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  sub_231D7E1FC();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  v6 = objc_allocWithZone(MEMORY[0x24BE7CE58]);
  v7 = a2;
  v8 = a3;
  v9 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v12[4] = sub_231D798B8;
  v12[5] = v5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_231D5D244;
  v12[3] = &unk_2500C9970;
  v10 = _Block_copy(v12);
  swift_release();
  v11 = objc_msgSend(v6, sel_initWithTestName_scrollView_completionHandler_, v9, v7, v10);

  _Block_release(v10);
  objc_msgSend(v11, sel_setDirection_, 3);
  objc_msgSend((id)objc_opt_self(), sel_runTestWithParameters_, v11);

}

uint64_t sub_231D78B6C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v29 = sub_231D7E208();
  v4 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v27 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v5;
  v26 = sub_231D7E964();
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - v10;
  v12 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  if (qword_25419BDC0 != -1)
    swift_once();
  v13 = sub_231D7DFEC();
  sub_231D4E718(v13, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v11);
  sub_231D58D60();
  v14 = objc_allocWithZone((Class)sub_231D7DDDC());
  v15 = (void *)sub_231D7DDD0();
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A718]), sel_initWithRootViewController_, v15);
  v17 = (void *)sub_231D7E220();
  sub_231D7E1FC();
  v18 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_startedTest_, v18);

  sub_231D7ED18();
  if (qword_255F724F0 != -1)
    swift_once();
  sub_231D7E958();
  sub_231D7E94C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v26);
  v19 = v27;
  v20 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v27, a2, v29);
  v21 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v22 + v21, v19, v20);
  aBlock[4] = sub_231D7972C;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_231D5D244;
  aBlock[3] = &unk_2500C98D0;
  v23 = _Block_copy(aBlock);
  v24 = a1;
  swift_release();
  objc_msgSend(v17, sel_presentViewController_animated_completion_, v16, 1, v23);

  _Block_release(v23);
  return 1;
}

BOOL sub_231D78F14(void *a1, uint64_t a2)
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
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  _QWORD aBlock[7];

  v57 = a2;
  v59 = a1;
  v2 = sub_231D7EACC();
  v55 = *(_QWORD *)(v2 - 8);
  v56 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v54 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_231D7EAF0();
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_231D7E208();
  v6 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v48 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = v7;
  v8 = sub_231D7EAC0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v58 = sub_231D7EB08();
  v12 = *(_QWORD *)(v58 - 8);
  v13 = MEMORY[0x24BDAC7A8](v58);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v45 - v16;
  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v45 - v19;
  v21 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  if (qword_25419BDC0 != -1)
    swift_once();
  v22 = sub_231D7DFEC();
  sub_231D4E718(v22, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5F3AC((uint64_t)v20);
  sub_231D58D60();
  v23 = objc_allocWithZone((Class)sub_231D7DDDC());
  v24 = (void *)sub_231D7DDD0();
  objc_msgSend(v24, sel_loadViewIfNeeded);
  v25 = (id)sub_231D7DDC4();
  if (v25)
  {
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A718]), sel_initWithRootViewController_, v24);
    v47 = v26;
    v27 = (void *)sub_231D7E220();
    v59 = v25;
    v28 = v27;
    objc_msgSend(v27, sel_presentViewController_animated_completion_, v26, 1, 0);
    sub_231D5DF10(0, (unint64_t *)&qword_25419BE00);
    v45 = sub_231D7ECE8();
    sub_231D7EAFC();
    *v11 = 4;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5420], v8);
    MEMORY[0x2348EF810](v15, v11);
    (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
    v46 = *(void (**)(char *, uint64_t))(v12 + 8);
    v46(v15, v58);
    v29 = v48;
    v30 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v48, v57, v50);
    v31 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v32 = (v49 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
    v33 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v33 + v31, v29, v30);
    *(_QWORD *)(v33 + v32) = v59;
    *(_QWORD *)(v33 + ((v32 + 15) & 0xFFFFFFFFFFFFFFF8)) = v28;
    aBlock[4] = sub_231D79800;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_231D5D244;
    aBlock[3] = &unk_2500C9920;
    v34 = _Block_copy(aBlock);
    v35 = v59;
    v36 = v28;
    swift_release();
    v37 = v51;
    sub_231D7EAE4();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_231D7984C();
    sub_231D4E564(0, &qword_25419BDE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_231D581C4();
    v38 = v54;
    v39 = v56;
    sub_231D7EDD8();
    v40 = (void *)v45;
    MEMORY[0x2348EF9CC](v17, v37, v38, v34);
    _Block_release(v34);

    v41 = v39;
    v25 = v59;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v41);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v53);
    v46(v17, v58);
  }
  else
  {
    sub_231D7E1FC();
    v42 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
    v43 = (void *)sub_231D7EB44();
    objc_msgSend(v59, sel_failedTest_withFailure_, v42, v43);

  }
  return v25 != 0;
}

uint64_t sub_231D794E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;

  v7 = sub_231D7E208();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    __break(1u);
    goto LABEL_13;
  }
  sub_231D7E514();
  result = sub_231D7E214();
  if (!a3)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_231D7E514();
  v12 = sub_231D7EEF8();
  result = swift_bridgeObjectRelease();
  if (!v12)
  {
    if (a1)
    {
      v13 = sub_231D78B6C(a1, (uint64_t)v11);
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  if (v12 == 1)
  {
    if (a1)
    {
      v13 = sub_231D78F14(a1, (uint64_t)v11);
LABEL_11:
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      return v13 & 1;
    }
    goto LABEL_14;
  }
  if (a1)
  {
    sub_231D7E1FC();
    v14 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_231D7EE38();
    swift_bridgeObjectRelease();
    v16 = 0xD000000000000011;
    v17 = 0x8000000231D850A0;
    sub_231D7E1FC();
    sub_231D7EBB0();
    swift_bridgeObjectRelease();
    v15 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_failedTest_withFailure_, v14, v15);

    v13 = 0;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_231D796B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_231D7E208();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_231D7972C()
{
  uint64_t v0;

  sub_231D7E208();
  sub_231D78908(*(void **)(v0 + 16));
}

uint64_t sub_231D7975C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D7976C()
{
  return swift_release();
}

uint64_t sub_231D79774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_231D7E208();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_231D79800()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_231D7E208() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_231D78A24(v0 + v2, *(void **)(v0 + v3), *(void **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_231D7984C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25419BDE0;
  if (!qword_25419BDE0)
  {
    v1 = sub_231D7EACC();
    result = MEMORY[0x2348F00E0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_25419BDE0);
  }
  return result;
}

uint64_t sub_231D79894()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_231D798B8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

_QWORD *sub_231D798E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37[2];
  uint64_t v38[5];
  __int128 v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  sub_231D4E564(0, &qword_25419B5C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE48390], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v31 - v3;
  v5 = sub_231D7DD1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_231D7E9AC();
  v10 = sub_231D7EC64();
  if (os_log_type_enabled(v9, v10))
  {
    v32 = v6;
    v11 = swift_slowAlloc();
    v33 = v5;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v38[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v34 = v4;
    v14 = sub_231D7F018();
    *(_QWORD *)&v37[0] = sub_231D6475C(v14, v15, v38);
    v4 = v34;
    sub_231D7EDB4();
    v6 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231D49000, v9, v10, "%{public}s Creating generator pipelines", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348F0170](v13, -1, -1);
    v16 = v12;
    v5 = v33;
    MEMORY[0x2348F0170](v16, -1, -1);
  }

  v39 = xmmword_231D7F620;
  v17 = (void *)sub_231D7DD10();
  if (v17)
  {

    v18 = 0;
    v19 = 0;
    v20 = 0;
    v40[1] = 0;
    v40[2] = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    sub_231D7851C();
    sub_231D7A7F4();
    v18 = v21;
    swift_allocObject();
    v20 = sub_231D7E934();
    v19 = sub_231D4CD8C(&qword_25419BCD8, (uint64_t (*)(uint64_t))sub_231D7A7F4, MEMORY[0x24BE3F870]);
  }
  v40[3] = v18;
  v40[4] = v19;
  v40[0] = v20;
  sub_231D79DF4(a1, (uint64_t)v4);
  v22 = sub_231D7DD64();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v4, 1, v22) == 1)
  {
    sub_231D7A1AC((uint64_t)v4);
    v41 = 0u;
    v42 = 0u;
    v43 = 0;
  }
  else
  {
    *((_QWORD *)&v42 + 1) = v22;
    v43 = MEMORY[0x24BE48388];
    v24 = sub_231D4CEA8((uint64_t *)&v41);
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(v24, v4, v22);
  }
  sub_231D7A200((uint64_t)v40, (uint64_t)v38);
  sub_231D7A2C4((uint64_t)v38, (uint64_t)&v35);
  if (v36)
  {
    sub_231D58D48(&v35, (uint64_t)v37);
    sub_231D58D48(v37, (uint64_t)&v35);
    v25 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_231D7A5A0(0, v25[2] + 1, 1, v25);
    v27 = v25[2];
    v26 = v25[3];
    if (v27 >= v26 >> 1)
      v25 = sub_231D7A5A0((_QWORD *)(v26 > 1), v27 + 1, 1, v25);
    v25[2] = v27 + 1;
    sub_231D58D48(&v35, (uint64_t)&v25[5 * v27 + 4]);
  }
  else
  {
    sub_231D7A328((uint64_t)&v35);
    v25 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  sub_231D7A200((uint64_t)&v41, (uint64_t)v38);
  sub_231D7A2C4((uint64_t)v38, (uint64_t)&v35);
  if (v36)
  {
    sub_231D58D48(&v35, (uint64_t)v37);
    sub_231D58D48(v37, (uint64_t)&v35);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_231D7A5A0(0, v25[2] + 1, 1, v25);
    v29 = v25[2];
    v28 = v25[3];
    if (v29 >= v28 >> 1)
      v25 = sub_231D7A5A0((_QWORD *)(v28 > 1), v29 + 1, 1, v25);
    v25[2] = v29 + 1;
    sub_231D58D48(&v35, (uint64_t)&v25[5 * v29 + 4]);
  }
  else
  {
    sub_231D7A328((uint64_t)&v35);
  }
  sub_231D7A264(0, &qword_25419B9F0, &qword_25419B4B0, MEMORY[0x24BE47AB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  swift_arrayDestroy();
  return v25;
}

uint64_t sub_231D79DF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_231D7DD1C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)sub_231D7DD10();
  v9 = (void *)sub_231D7DC8C();
  v10 = sub_231D7DC80();

  if ((v10 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v11 = (void *)*MEMORY[0x24BDD2EA0];
    sub_231D7A264(0, &qword_25419BB80, &qword_25419B9F8, MEMORY[0x24BE48230], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_231D80E20;
    v13 = type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider();
    v14 = swift_allocObject();
    *(_QWORD *)(v12 + 56) = v13;
    *(_QWORD *)(v12 + 64) = sub_231D4CD8C(&qword_25419BAF8, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider, (uint64_t)&unk_231D81774);
    *(_QWORD *)(v12 + 32) = v14;
    v15 = type metadata accessor for WalkingSteadinessNotificationSettingsFeatureStatusFeedItemProvider();
    v16 = swift_allocObject();
    *(_QWORD *)(v12 + 96) = v15;
    *(_QWORD *)(v12 + 104) = sub_231D4CD8C(&qword_25419BB28, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessNotificationSettingsFeatureStatusFeedItemProvider, (uint64_t)&unk_231D81D34);
    *(_QWORD *)(v12 + 72) = v16;
    v17 = type metadata accessor for WalkingSteadinessPromotionFeedItemProvider();
    v18 = swift_allocObject();
    *(_QWORD *)(v12 + 136) = v17;
    *(_QWORD *)(v12 + 144) = sub_231D4CD8C(&qword_25419BA50, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessPromotionFeedItemProvider, (uint64_t)&unk_231D81AB8);
    *(_QWORD *)(v12 + 112) = v18;
    v19 = v11;
    sub_231D7DD58();
    v20 = sub_231D7DD64();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a2, 0, 1, v20);
  }
  else
  {
    v22 = sub_231D7DD64();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 1, 1, v22);
  }
}

uint64_t sub_231D7A044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin25MobilityAppPluginDelegate_logger;
  v2 = sub_231D7E9B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_231D7A094()
{
  return type metadata accessor for MobilityAppPluginDelegate();
}

uint64_t type metadata accessor for MobilityAppPluginDelegate()
{
  uint64_t result;

  result = qword_25419BE98;
  if (!qword_25419BE98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231D7A0D8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_231D7E9B8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_231D7A144@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = swift_allocObject();
  result = sub_231D7E988();
  *a1 = v2;
  return result;
}

_QWORD *sub_231D7A188(uint64_t a1)
{
  return sub_231D798E0(a1);
}

uint64_t sub_231D7A1AC(uint64_t a1)
{
  uint64_t v2;

  sub_231D4E564(0, &qword_25419B5C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE48390], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D7A200(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D7A264(0, &qword_25419B9F0, &qword_25419B4B0, MEMORY[0x24BE47AB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_231D7A264(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_231D58104(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_231D7A2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D7A264(0, &qword_25419B9F0, &qword_25419B4B0, MEMORY[0x24BE47AB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_231D7A328(uint64_t a1)
{
  uint64_t v2;

  sub_231D7A264(0, &qword_25419B9F0, &qword_25419B4B0, MEMORY[0x24BE47AB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D7A384(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_231D4E564(0, &qword_255F72C20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = *(_QWORD *)(sub_231D7DDB8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_231D7EE8C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_231D7DDB8() - 8);
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
    sub_231D7A6DC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_231D7A5A0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      sub_231D7A264(0, &qword_25419B550, &qword_25419B4B0, MEMORY[0x24BE47AB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_231D7A890(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_231D7A6DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_231D7DDB8() - 8);
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
  result = sub_231D7EEE0();
  __break(1u);
  return result;
}

void sub_231D7A7F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25419BCE0)
  {
    sub_231D7A84C();
    v0 = sub_231D7E940();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25419BCE0);
  }
}

unint64_t sub_231D7A84C()
{
  unint64_t result;

  result = qword_25419BB98;
  if (!qword_25419BB98)
  {
    result = MEMORY[0x2348F00E0](&unk_231D81EC4, &type metadata for MobilityArticleTileDataController);
    atomic_store(result, (unint64_t *)&qword_25419BB98);
  }
  return result;
}

uint64_t sub_231D7A890(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_231D58104(0, &qword_25419B4B0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_231D7EEE0();
  __break(1u);
  return result;
}

id sub_231D7A9A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay);
  }
  else
  {
    v4 = v0;
    type metadata accessor for FitnessPlusCell();
    sub_231D565BC(&qword_255F733B0, v5, (uint64_t (*)(uint64_t))type metadata accessor for FitnessPlusCell, (uint64_t)&unk_231D8204C);
    v6 = (void *)sub_231D7DE00();
    v7 = *(void **)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

id sub_231D7AA44()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay);
  }
  else
  {
    v4 = v0;
    sub_231D5DF10(0, &qword_255F733D0);
    v5 = (void *)sub_231D7ED54();
    type metadata accessor for FitnessPlusCell();
    sub_231D565BC(&qword_255F733B0, v6, (uint64_t (*)(uint64_t))type metadata accessor for FitnessPlusCell, (uint64_t)&unk_231D8204C);
    v7 = (void *)sub_231D7DE0C();

    v8 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_231D7AB18()
{
  return sub_231D7ADF0(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage, (uint64_t (*)(uint64_t))sub_231D7AB2C);
}

id sub_231D7AB2C(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
  objc_msgSend(v2, sel_setContentMode_, 2);
  objc_msgSend(v2, sel_setClipsToBounds_, 1);
  v6 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  v7 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  v3 = v2;
  sub_231D7E514();
  sub_231D7EBB0();
  v4 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setAccessibilityIdentifier_, v4, v6, v7);

  return v3;
}

id sub_231D7AC14()
{
  return sub_231D7AC30(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel);
}

id sub_231D7AC30(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v2 = *a1;
  v3 = *(void **)(v1 + *a1);
  if (v3)
  {
    v4 = *(id *)(v1 + *a1);
  }
  else
  {
    v5 = sub_231D7ACB4(v1);
    v6 = *(void **)(v1 + v2);
    *(_QWORD *)(v1 + v2) = v5;
    v4 = v5;

    v3 = 0;
  }
  v7 = v3;
  return v4;
}

id sub_231D7AC8C()
{
  return sub_231D7AC30(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel);
}

id sub_231D7ACB4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v3 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v2, sel_setTextColor_, v3);

  objc_msgSend(v2, sel_setLineBreakMode_, 0);
  objc_msgSend(v2, sel_setNumberOfLines_, 0);
  v7 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  v8 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  v4 = v2;
  sub_231D7E514();
  sub_231D7EBB0();
  v5 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityIdentifier_, v5, v7, v8);

  return v4;
}

id sub_231D7ADDC()
{
  return sub_231D7ADF0(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton, (uint64_t (*)(uint64_t))sub_231D7AE4C);
}

id sub_231D7ADF0(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2(v2);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_231D7AE4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[2];

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v16 - v3;
  sub_231D7E298();
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_buttonWithType_, 1);
  v6 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  if (qword_25419BDC0 != -1)
    swift_once();
  v7 = sub_231D7DFEC();
  sub_231D4E718(v7, (uint64_t)qword_25419BF18);
  sub_231D7E0AC();
  sub_231D5B980((uint64_t)v4, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v8 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitle_forState_, v8, 0);

  objc_msgSend(v5, sel_addTarget_action_forControlEvents_, a1, sel_linkButtonPressed, 64);
  objc_msgSend(v5, sel_setContentHorizontalAlignment_, 4);
  v9 = objc_msgSend(v5, sel_titleLabel);
  objc_msgSend(v9, sel_setNumberOfLines_, 0);

  sub_231D5DF10(0, &qword_255F733D0);
  v10 = (void *)sub_231D7ED60();
  objc_msgSend(v5, sel_setTitleColor_forState_, v10, 0);
  v11 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  v12 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  v16[0] = v11;
  v16[1] = v12;
  v13 = v5;
  sub_231D7E514();
  sub_231D7EBB0();
  v14 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setAccessibilityIdentifier_, v14);

  return v13;
}

id sub_231D7B124(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t inited;
  id v18;
  id v19;
  id v20;
  id v21;
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
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  _QWORD aBlock[6];
  objc_super v56;

  *(_QWORD *)&v4[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay] = 0;
  v9 = (uint64_t *)&v4[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier];
  v10 = v4;
  sub_231D7EE38();
  v11 = sub_231D7EB74();
  v13 = v12;
  swift_bridgeObjectRelease();
  sub_231D7EBB0();
  *v9 = v11;
  v9[1] = v13;
  v14 = &v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item];
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_QWORD *)v14 + 4) = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton] = 0;

  v56.receiver = v10;
  v56.super_class = (Class)type metadata accessor for FitnessPlusCell();
  v15 = objc_msgSendSuper2(&v56, sel_initWithFrame_, a1, a2, a3, a4);
  sub_231D7E514();
  v16 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setAccessibilityIdentifier_, v16);

  sub_231D4E564(0, &qword_255F733D8, (uint64_t (*)(uint64_t))sub_231D7D790, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_231D81F70;
  *(_QWORD *)(inited + 32) = sub_231D7AB18();
  *(_OWORD *)(inited + 40) = 0u;
  *(_OWORD *)(inited + 56) = 0u;
  *(_QWORD *)(inited + 72) = sub_231D7BEC4();
  *(_OWORD *)(inited + 80) = xmmword_231D81F80;
  *(_OWORD *)(inited + 96) = xmmword_231D81F90;
  *(_QWORD *)(inited + 112) = sub_231D7AC14();
  *(_OWORD *)(inited + 120) = xmmword_231D81FA0;
  *(_OWORD *)(inited + 136) = xmmword_231D81F90;
  *(_QWORD *)(inited + 152) = sub_231D7AC8C();
  *(_OWORD *)(inited + 160) = xmmword_231D81FB0;
  *(_OWORD *)(inited + 176) = xmmword_231D81F90;
  *(_QWORD *)(inited + 192) = sub_231D7ADDC();
  *(_OWORD *)(inited + 200) = xmmword_231D81FC0;
  *(_OWORD *)(inited + 216) = xmmword_231D81F80;
  sub_231D7C820(inited, 0.0, 0.0, 0.0, 0.0);
  swift_setDeallocating();
  sub_231D7D790();
  swift_arrayDestroy();
  v18 = sub_231D7AB18();
  objc_msgSend(v18, sel_hk_constraintAspectRatioFromSize_, 5.0, 3.0);

  v19 = objc_msgSend(v15, sel_contentView);
  v20 = sub_231D7A9A8();
  v21 = sub_231D7AB18();
  objc_msgSend(v19, sel_insertSubview_aboveSubview_, v20, v21);

  v22 = objc_msgSend(v15, sel_contentView);
  v23 = sub_231D7AA44();
  v24 = sub_231D7AB18();
  objc_msgSend(v22, sel_insertSubview_belowSubview_, v23, v24);

  v25 = sub_231D7A9A8();
  v26 = sub_231D7AB18();
  objc_msgSend(v25, sel_hk_alignConstraintsWithView_, v26);

  v27 = sub_231D7AA44();
  v28 = objc_msgSend(v15, sel_contentView);
  objc_msgSend(v27, sel_hk_alignHorizontalConstraintsWithView_insets_, v28, 0.0, 0.0, 0.0, 0.0);

  v29 = sub_231D7AA44();
  v30 = objc_msgSend(v29, sel_topAnchor);

  v31 = sub_231D7AB18();
  v32 = objc_msgSend(v31, sel_bottomAnchor);

  v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v32);
  objc_msgSend(v33, sel_setActive_, 1);

  v34 = sub_231D7AA44();
  v35 = objc_msgSend(v34, sel_bottomAnchor);

  v36 = objc_msgSend(v15, sel_contentView);
  v37 = objc_msgSend(v36, sel_bottomAnchor);

  v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  objc_msgSend(v38, sel_setActive_, 1);

  v39 = objc_msgSend(v15, sel_contentView);
  v40 = objc_msgSend(v39, sel_layer);

  objc_msgSend(v40, sel_setCornerRadius_, 10.0);
  v41 = objc_msgSend(v15, sel_contentView);
  v42 = objc_msgSend(v41, sel_layer);

  objc_msgSend(v42, sel_setMasksToBounds_, 1);
  v43 = objc_msgSend(v15, sel_contentView);
  v44 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  aBlock[4] = sub_231D7BE6C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_231D7D230;
  aBlock[3] = &unk_2500C99E0;
  v45 = _Block_copy(aBlock);
  v46 = objc_msgSend(v44, sel_initWithDynamicProvider_, v45);
  _Block_release(v45);
  swift_release();
  objc_msgSend(v43, sel_setBackgroundColor_, v46);

  v47 = sub_231D7AC14();
  sub_231D5DF10(0, &qword_255F73178);
  v48 = (void *)sub_231D7ED3C();
  objc_msgSend(v47, sel_setFont_, v48);

  v49 = sub_231D7AC8C();
  v50 = (void *)sub_231D7ED3C();
  objc_msgSend(v49, sel_setFont_, v50);

  v51 = sub_231D7ADDC();
  v52 = objc_msgSend(v51, sel_titleLabel);

  if (v52)
  {
    v53 = (void *)sub_231D7ED3C();
    objc_msgSend(v52, sel_setFont_, v53);

  }
  sub_231D7B914();

  return v15;
}

uint64_t sub_231D7B914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_getObjectType();
  sub_231D4E564(0, &qword_255F733B8, (uint64_t (*)(uint64_t))sub_231D7D748, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_231D7F620;
  v1 = sub_231D7EA48();
  v2 = MEMORY[0x24BEBCB18];
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v2;
  v3 = sub_231D7EA0C();
  v4 = MEMORY[0x24BEBC318];
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 56) = v4;
  sub_231D7ED48();
  sub_231D7E784();
  return swift_bridgeObjectRelease();
}

void sub_231D7B9C4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31[5];

  swift_getObjectType();
  v1 = sub_231D7E9B8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t)v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  sub_231D7D1EC(v5, (uint64_t)v31);
  if (!v31[3])
  {
    sub_231D7D1B0((uint64_t)v31);
LABEL_10:
    sub_231D7E994();
    v15 = v0;
    v16 = sub_231D7E9AC();
    v17 = sub_231D7EC58();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v27 = v1;
      v19 = v18;
      v20 = swift_slowAlloc();
      v31[0] = v20;
      *(_DWORD *)v19 = 136446466;
      v21 = sub_231D7F018();
      v28 = sub_231D6475C(v21, v22, v31);
      sub_231D7EDB4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2082;
      v28 = sub_231D6475C(0xD000000000000021, 0x8000000231D85410, v31);
      sub_231D7EDB4();

      _os_log_impl(&dword_231D49000, v16, v17, "[%{public}s] Unexpected data source item type: %{public}s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v20, -1, -1);
      MEMORY[0x2348F0170](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v27);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    return;
  }
  sub_231D58104(0, &qword_255F725D8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_10;
  v27 = v29;
  v6 = v30;
  v7 = sub_231D7AB18();
  v8 = qword_25419BE08;
  sub_231D7E514();
  if (v8 != -1)
    swift_once();
  v9 = (id)qword_25419BF10;
  v10 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v10, v9, 0);

  if (!v11)
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setImage_, v11);

  v12 = sub_231D7AC14();
  sub_231D7D5B4(v6);
  if (v13)
  {
    v14 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v12, sel_setText_, v14);

  v23 = sub_231D7AC8C();
  sub_231D7D5B4(v6);
  v25 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    v26 = (void *)sub_231D7EB44();
    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v23, sel_setText_, v26);

}

id sub_231D7BE6C(void *a1)
{
  id v1;
  void *v2;
  char **v3;

  v1 = objc_msgSend(a1, sel_userInterfaceStyle);
  v2 = (void *)objc_opt_self();
  v3 = &selRef_tertiarySystemBackgroundColor;
  if (v1 != (id)2)
    v3 = &selRef_blackColor;
  return objc_msgSend(v2, *v3);
}

id sub_231D7BEC4()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  if (qword_25419BE08 != -1)
    swift_once();
  v2 = (id)qword_25419BF10;
  v3 = (void *)sub_231D7EB44();
  v4 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v3, v2, 0);

  if (!v4)
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v4);

  v21 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  v22 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  v6 = v5;
  sub_231D7E514();
  sub_231D7EBB0();
  v7 = (void *)sub_231D7EB44();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAccessibilityIdentifier_, v7, v21, v22);

  objc_msgSend(v1, sel_addSubview_, v6);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v8 = objc_msgSend(v6, sel_topAnchor);
  v9 = objc_msgSend(v1, sel_topAnchor);
  v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

  objc_msgSend(v10, sel_setActive_, 1);
  v11 = objc_msgSend(v6, sel_bottomAnchor);
  v12 = objc_msgSend(v1, sel_bottomAnchor);
  v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  objc_msgSend(v13, sel_setActive_, 1);
  v14 = objc_msgSend(v6, sel_leadingAnchor);
  v15 = objc_msgSend(v1, sel_leadingAnchor);
  v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  objc_msgSend(v16, sel_setActive_, 1);
  v17 = objc_msgSend(v6, sel_trailingAnchor);
  v18 = objc_msgSend(v1, sel_trailingAnchor);
  v19 = objc_msgSend(v17, sel_constraintLessThanOrEqualToAnchor_, v18);

  objc_msgSend(v19, sel_setActive_, 1);
  return v1;
}

uint64_t sub_231D7C250()
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
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t (*v22)(char *, uint64_t);
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t aBlock;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  uint64_t (*v36)(char);
  uint64_t v37;

  v29 = sub_231D7E9B8();
  v1 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231D4E564(0, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v28 - v5;
  v7 = sub_231D7DAE8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  sub_231D7D1EC(v11, (uint64_t)&aBlock);
  if (v35)
  {
    sub_231D58104(0, &qword_255F725D8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = sub_231D7D5B4(v31);
      v14 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_231D7D1B0((uint64_t)&aBlock);
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  sub_231D7E514();
  sub_231D7DAC4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_231D5B980((uint64_t)v6, (unint64_t *)&qword_25419BD58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    sub_231D7E994();
    sub_231D7E514();
    v15 = sub_231D7E9AC();
    v16 = sub_231D7EC4C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v28 = v1;
      v19 = v18;
      v30 = v18;
      *(_DWORD *)v17 = 136315138;
      aBlock = v12;
      v33 = v14;
      sub_231D7D280();
      v20 = sub_231D7ED9C();
      aBlock = sub_231D6475C(v20, v21, &v30);
      sub_231D7EDB4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231D49000, v15, v16, "FitnesssPlusCell: Unable to construct URL from '%s'", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348F0170](v19, -1, -1);
      MEMORY[0x2348F0170](v17, -1, -1);

      v22 = *(uint64_t (**)(char *, uint64_t))(v28 + 8);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v22 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
    }
    return v22(v3, v29);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v23 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    v24 = (void *)sub_231D7DAD0();
    sub_231D63E64(MEMORY[0x24BEE4AF8]);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_231D565BC(&qword_255F72620, 255, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_231D7F814);
    v25 = (void *)sub_231D7EB20();
    swift_bridgeObjectRelease();
    v36 = sub_231D7C6FC;
    v37 = 0;
    aBlock = MEMORY[0x24BDAC760];
    v33 = 1107296256;
    v34 = sub_231D553D4;
    v35 = &unk_2500C99B8;
    v26 = _Block_copy(&aBlock);
    objc_msgSend(v23, sel_openURL_options_completionHandler_, v24, v25, v26);
    _Block_release(v26);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_231D7C6FC(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v2 = sub_231D7E9B8();
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_231D7E994();
    v7 = sub_231D7E9AC();
    v8 = sub_231D7EC4C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_231D49000, v7, v8, "FitnessPlusCell: unable to open link to Fitness+", v9, 2u);
      MEMORY[0x2348F0170](v9, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

void sub_231D7C820(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  uint64_t v6;
  void *v10;
  double *v11;
  double v12;
  IMP *p_imp;
  IMP *v14;
  IMP *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  IMP *v35;
  IMP *v36;
  IMP *v37;
  id v38;
  double v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  double v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v56;
  id v57;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    v53 = a1 + 32;
    v10 = 0;
    v52 = sub_231D7E514();
    v11 = (double *)(v52 + 64);
    v12 = 0.0;
    p_imp = &stru_2500CAFF0.imp;
    v14 = &stru_2500CAFF0.imp;
    v15 = &stru_2500CAFF0.imp;
    v54 = v6;
    do
    {
      v24 = *(v11 - 3);
      v25 = *(v11 - 2);
      v26 = *(v11 - 1);
      v27 = *v11;
      v57 = *((id *)v11 - 4);
      v28 = objc_msgSend(v5, (SEL)p_imp[276]);
      objc_msgSend(v28, sel_addSubview_, v57);

      objc_msgSend(v57, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      if (v10)
      {
        v56 = v10;
        v29 = objc_msgSend(v57, sel_topAnchor);
        v30 = objc_msgSend(v56, sel_bottomAnchor);
        v31 = objc_msgSend(v29, (SEL)v14[280], v30, v12 + v24);
        v32 = v6;
        v33 = v10;
        v34 = v5;
        v35 = p_imp;
        v36 = v14;
        v37 = v15;
        v38 = v31;

        objc_msgSend(v38, (SEL)v37 + 1480, 1);
        v15 = v37;
        v14 = v36;
        p_imp = v35;
        v5 = v34;
        v10 = v33;
        v6 = v32;
      }
      v16 = objc_msgSend(v57, sel_leadingAnchor, v52);
      v17 = objc_msgSend(v5, (SEL)p_imp[276]);
      v18 = objc_msgSend(v17, sel_leadingAnchor);

      v19 = objc_msgSend(v16, (SEL)v14[280], v18, v25 + a3);
      objc_msgSend(v19, (SEL)v15[281], 1);

      v20 = objc_msgSend(v57, sel_trailingAnchor);
      v21 = objc_msgSend(v5, (SEL)p_imp[276]);
      v22 = objc_msgSend(v21, sel_trailingAnchor);

      v23 = objc_msgSend(v20, (SEL)v14[280], v22, -(v27 + a5));
      objc_msgSend(v23, (SEL)v15[281], 1);

      v11 += 5;
      v10 = v57;
      v12 = v26;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    v39 = *(double *)(v52 + 40) + a2;
    v40 = *(id *)(v52 + 32);
    v41 = objc_msgSend(v40, sel_topAnchor);
    v42 = objc_msgSend(v5, (SEL)p_imp[276]);
    v43 = objc_msgSend(v42, sel_topAnchor);

    v44 = objc_msgSend(v41, (SEL)v14[280], v43, v39);
    objc_msgSend(v44, (SEL)v15[281], 1);

    v45 = v53 + 40 * v54;
    v46 = *(double *)(v45 - 16) + a4;
    v47 = *(id *)(v45 - 40);
    v48 = objc_msgSend(v47, sel_bottomAnchor);
    v49 = objc_msgSend(v5, (SEL)p_imp[276]);
    v50 = objc_msgSend(v49, sel_bottomAnchor);

    v51 = objc_msgSend(v48, (SEL)v14[280], v50, -v46);
    objc_msgSend(v51, (SEL)v15[281], 1);

  }
}

id sub_231D7CCA4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FitnessPlusCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FitnessPlusCell()
{
  return objc_opt_self();
}

uint64_t sub_231D7CD90()
{
  uint64_t v0;

  v0 = qword_255F73330;
  sub_231D7E514();
  return v0;
}

uint64_t sub_231D7CDC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  return sub_231D7D1EC(v3, a1);
}

uint64_t sub_231D7CE14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  sub_231D7D108(a1, v3);
  swift_endAccess();
  sub_231D7B9C4();
  return sub_231D7D1B0(a1);
}

void (*sub_231D7CE80(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_231D7CEC8;
}

void sub_231D7CEC8(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_231D7B9C4();
}

id sub_231D7CEF8()
{
  return sub_231D7A9A8();
}

id sub_231D7CF18()
{
  return sub_231D7AA44();
}

double sub_231D7CF40()
{
  id *v0;
  id v1;
  id v2;
  double result;

  v1 = objc_msgSend(*v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_userInterfaceStyle);

  result = 0.1;
  if (v2 == (id)2)
    return 1.0;
  return result;
}

uint64_t sub_231D7CFA0()
{
  return sub_231D7C250();
}

uint64_t sub_231D7CFC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE43600];
  v3 = sub_231D7E490();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_231D7D108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D7D14C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_231D7D14C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F733A8)
  {
    sub_231D58104(255, &qword_255F725D8);
    v0 = sub_231D7EDA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F733A8);
  }
}

uint64_t sub_231D7D1B0(uint64_t a1)
{
  uint64_t v2;

  sub_231D7D14C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231D7D1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231D7D14C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_231D7D230(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

void sub_231D7D280()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F72C18)
  {
    v0 = sub_231D7EDA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F72C18);
  }
}

uint64_t sub_231D7D2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231D7D2E4()
{
  return swift_release();
}

void sub_231D7D2F0()
{
  char *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  *(_QWORD *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay] = 0;
  v1 = (uint64_t *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier];
  sub_231D7EE38();
  v2 = sub_231D7EB74();
  v4 = v3;
  swift_bridgeObjectRelease();
  sub_231D7EBB0();
  *v1 = v2;
  v1[1] = v4;
  v5 = &v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton] = 0;

  sub_231D7EE98();
  __break(1u);
}

void sub_231D7D430()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v0 = sub_231D7AC14();
  sub_231D5DF10(0, &qword_255F73178);
  v1 = (void *)sub_231D7ED3C();
  objc_msgSend(v0, sel_setFont_, v1);

  v2 = sub_231D7AC8C();
  v3 = (void *)sub_231D7ED3C();
  objc_msgSend(v2, sel_setFont_, v3);

  v4 = sub_231D7ADDC();
  v5 = objc_msgSend(v4, sel_titleLabel);

  if (v5)
  {
    v6 = (id)sub_231D7ED3C();
    objc_msgSend(v5, sel_setFont_, v6);

  }
}

uint64_t sub_231D7D5B4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  sub_231D4E564(0, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - v3;
  v5 = sub_231D7DB48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  if ((a1 & 1) != 0)
  {
    if (qword_25419BDC0 != -1)
      swift_once();
  }
  else if (qword_25419BDC0 != -1)
  {
    swift_once();
  }
  v6 = sub_231D7DFEC();
  sub_231D4E718(v6, (uint64_t)qword_25419BF18);
  v7 = sub_231D7E0AC();
  sub_231D5B980((uint64_t)v4, &qword_25419BDB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  return v7;
}

unint64_t sub_231D7D748()
{
  unint64_t result;

  result = qword_255F733C0;
  if (!qword_255F733C0)
  {
    sub_231D58104(255, &qword_255F733C8);
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255F733C0);
  }
  return result;
}

void sub_231D7D790()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255F733E0)
  {
    sub_231D5DF10(255, &qword_255F733E8);
    type metadata accessor for NSDirectionalEdgeInsets(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255F733E0);
  }
}

uint64_t type metadata accessor for MobilityAdvertisableFeatureSourceProvider()
{
  return objc_opt_self();
}

uint64_t sub_231D7D834@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MobilityAdvertisableFeatureSourceProvider();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_231D7D868(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];

  v2 = sub_231D7DFD4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_231D7E07C();
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v7(v5, a1, v2);
  v8 = sub_231D7E070();
  sub_231D7D988();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_231D7F640;
  sub_231D7DE78();
  v7(v5, a1, v2);
  v13[4] = v6;
  v13[5] = sub_231D7DA2C();
  v13[1] = v8;
  swift_retain();
  v10 = sub_231D7DE6C();
  v11 = MEMORY[0x24BE41030];
  *(_QWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 40) = v11;
  swift_release();
  return v9;
}

void sub_231D7D988()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255F73490)
  {
    sub_231D7D9DC();
    v0 = sub_231D7EF70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255F73490);
  }
}

unint64_t sub_231D7D9DC()
{
  unint64_t result;

  result = qword_255F73498;
  if (!qword_255F73498)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255F73498);
  }
  return result;
}

unint64_t sub_231D7DA2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255F734A0;
  if (!qword_255F734A0)
  {
    v1 = sub_231D7E07C();
    result = MEMORY[0x2348F00E0](MEMORY[0x24BE46E30], v1);
    atomic_store(result, (unint64_t *)&qword_255F734A0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_231D7DA94()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_231D7DAA0()
{
  return MEMORY[0x24BDCC3F0]();
}

uint64_t sub_231D7DAAC()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_231D7DAB8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_231D7DAC4()
{
  return MEMORY[0x24BE88470]();
}

uint64_t sub_231D7DAD0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_231D7DADC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_231D7DAE8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_231D7DAF4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_231D7DB00()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_231D7DB0C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_231D7DB18()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_231D7DB24()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_231D7DB30()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_231D7DB3C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_231D7DB48()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_231D7DB54()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_231D7DB60()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_231D7DB6C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_231D7DB78()
{
  return MEMORY[0x24BE85D28]();
}

uint64_t sub_231D7DB84()
{
  return MEMORY[0x24BE8AFB0]();
}

uint64_t sub_231D7DB90()
{
  return MEMORY[0x24BE8CA08]();
}

uint64_t sub_231D7DB9C()
{
  return MEMORY[0x24BE8CA10]();
}

uint64_t sub_231D7DBA8()
{
  return MEMORY[0x24BE8D6D0]();
}

uint64_t sub_231D7DBB4()
{
  return MEMORY[0x24BE8D6D8]();
}

uint64_t sub_231D7DBC0()
{
  return MEMORY[0x24BE8D6E0]();
}

uint64_t sub_231D7DBCC()
{
  return MEMORY[0x24BE8D6E8]();
}

uint64_t sub_231D7DBD8()
{
  return MEMORY[0x24BE8D6F0]();
}

uint64_t sub_231D7DBE4()
{
  return MEMORY[0x24BE86548]();
}

uint64_t sub_231D7DBF0()
{
  return MEMORY[0x24BE86558]();
}

uint64_t sub_231D7DBFC()
{
  return MEMORY[0x24BE86568]();
}

uint64_t sub_231D7DC08()
{
  return MEMORY[0x24BE87610]();
}

uint64_t sub_231D7DC14()
{
  return MEMORY[0x24BE87618]();
}

uint64_t sub_231D7DC20()
{
  return MEMORY[0x24BE87650]();
}

uint64_t sub_231D7DC2C()
{
  return MEMORY[0x24BE880A0]();
}

uint64_t sub_231D7DC38()
{
  return MEMORY[0x24BE880B0]();
}

uint64_t sub_231D7DC44()
{
  return MEMORY[0x24BE47238]();
}

uint64_t sub_231D7DC50()
{
  return MEMORY[0x24BE47248]();
}

uint64_t sub_231D7DC5C()
{
  return MEMORY[0x24BE47298]();
}

uint64_t sub_231D7DC68()
{
  return MEMORY[0x24BE472A8]();
}

uint64_t sub_231D7DC74()
{
  return MEMORY[0x24BE474E8]();
}

uint64_t sub_231D7DC80()
{
  return MEMORY[0x24BE47598]();
}

uint64_t sub_231D7DC8C()
{
  return MEMORY[0x24BE475A0]();
}

uint64_t sub_231D7DC98()
{
  return MEMORY[0x24BE475C8]();
}

uint64_t sub_231D7DCA4()
{
  return MEMORY[0x24BE47678]();
}

uint64_t sub_231D7DCB0()
{
  return MEMORY[0x24BE47688]();
}

uint64_t sub_231D7DCBC()
{
  return MEMORY[0x24BE47698]();
}

uint64_t sub_231D7DCC8()
{
  return MEMORY[0x24BE476A0]();
}

uint64_t sub_231D7DCD4()
{
  return MEMORY[0x24BE476C0]();
}

uint64_t sub_231D7DCE0()
{
  return MEMORY[0x24BE47798]();
}

uint64_t sub_231D7DCEC()
{
  return MEMORY[0x24BE477A8]();
}

uint64_t sub_231D7DCF8()
{
  return MEMORY[0x24BE477C0]();
}

uint64_t sub_231D7DD04()
{
  return MEMORY[0x24BE477D0]();
}

uint64_t sub_231D7DD10()
{
  return MEMORY[0x24BE47988]();
}

uint64_t sub_231D7DD1C()
{
  return MEMORY[0x24BE479B8]();
}

uint64_t sub_231D7DD28()
{
  return MEMORY[0x24BE47C20]();
}

uint64_t sub_231D7DD34()
{
  return MEMORY[0x24BE47D78]();
}

uint64_t sub_231D7DD40()
{
  return MEMORY[0x24BE47D90]();
}

uint64_t sub_231D7DD4C()
{
  return MEMORY[0x24BE47FD0]();
}

uint64_t sub_231D7DD58()
{
  return MEMORY[0x24BE48380]();
}

uint64_t sub_231D7DD64()
{
  return MEMORY[0x24BE48390]();
}

uint64_t sub_231D7DD70()
{
  return MEMORY[0x24BE48680]();
}

uint64_t sub_231D7DD7C()
{
  return MEMORY[0x24BE48690]();
}

uint64_t sub_231D7DD88()
{
  return MEMORY[0x24BE483F8]();
}

uint64_t sub_231D7DD94()
{
  return MEMORY[0x24BE48408]();
}

uint64_t sub_231D7DDA0()
{
  return MEMORY[0x24BE48418]();
}

uint64_t sub_231D7DDAC()
{
  return MEMORY[0x24BE3F8C0]();
}

uint64_t sub_231D7DDB8()
{
  return MEMORY[0x24BE3F938]();
}

uint64_t sub_231D7DDC4()
{
  return MEMORY[0x24BE3F940]();
}

uint64_t sub_231D7DDD0()
{
  return MEMORY[0x24BE3F948]();
}

uint64_t sub_231D7DDDC()
{
  return MEMORY[0x24BE3F950]();
}

uint64_t sub_231D7DDE8()
{
  return MEMORY[0x24BE3F958]();
}

uint64_t sub_231D7DDF4()
{
  return MEMORY[0x24BE3F960]();
}

uint64_t sub_231D7DE00()
{
  return MEMORY[0x24BE3F968]();
}

uint64_t sub_231D7DE0C()
{
  return MEMORY[0x24BE3F970]();
}

uint64_t sub_231D7DE18()
{
  return MEMORY[0x24BE3F978]();
}

uint64_t sub_231D7DE24()
{
  return MEMORY[0x24BE3F9B0]();
}

uint64_t sub_231D7DE30()
{
  return MEMORY[0x24BE3F9B8]();
}

uint64_t sub_231D7DE3C()
{
  return MEMORY[0x24BE3F9C0]();
}

uint64_t sub_231D7DE48()
{
  return MEMORY[0x24BE3F9C8]();
}

uint64_t sub_231D7DE54()
{
  return MEMORY[0x24BE3F9D8]();
}

uint64_t sub_231D7DE60()
{
  return MEMORY[0x24BE3F9E0]();
}

uint64_t sub_231D7DE6C()
{
  return MEMORY[0x24BE41028]();
}

uint64_t sub_231D7DE78()
{
  return MEMORY[0x24BE41038]();
}

uint64_t sub_231D7DE84()
{
  return MEMORY[0x24BE41218]();
}

uint64_t sub_231D7DE90()
{
  return MEMORY[0x24BE41220]();
}

uint64_t sub_231D7DE9C()
{
  return MEMORY[0x24BE41290]();
}

uint64_t sub_231D7DEA8()
{
  return MEMORY[0x24BE412A8]();
}

uint64_t sub_231D7DEB4()
{
  return MEMORY[0x24BE413A8]();
}

uint64_t sub_231D7DEC0()
{
  return MEMORY[0x24BE413B0]();
}

uint64_t sub_231D7DECC()
{
  return MEMORY[0x24BE41520]();
}

uint64_t sub_231D7DED8()
{
  return MEMORY[0x24BE41F40]();
}

uint64_t sub_231D7DEE4()
{
  return MEMORY[0x24BE41578]();
}

uint64_t sub_231D7DEF0()
{
  return MEMORY[0x24BE41580]();
}

uint64_t sub_231D7DEFC()
{
  return MEMORY[0x24BE41598]();
}

uint64_t sub_231D7DF08()
{
  return MEMORY[0x24BE415A0]();
}

uint64_t sub_231D7DF14()
{
  return MEMORY[0x24BE415B8]();
}

uint64_t sub_231D7DF20()
{
  return MEMORY[0x24BE415C0]();
}

uint64_t sub_231D7DF2C()
{
  return MEMORY[0x24BE415C8]();
}

uint64_t sub_231D7DF38()
{
  return MEMORY[0x24BE41698]();
}

uint64_t sub_231D7DF44()
{
  return MEMORY[0x24BE41F48]();
}

uint64_t sub_231D7DF50()
{
  return MEMORY[0x24BE418C8]();
}

uint64_t sub_231D7DF5C()
{
  return MEMORY[0x24BE418D0]();
}

uint64_t sub_231D7DF68()
{
  return MEMORY[0x24BE418E0]();
}

uint64_t sub_231D7DF74()
{
  return MEMORY[0x24BE418E8]();
}

uint64_t sub_231D7DF80()
{
  return MEMORY[0x24BE418F8]();
}

uint64_t sub_231D7DF8C()
{
  return MEMORY[0x24BE41998]();
}

uint64_t sub_231D7DF98()
{
  return MEMORY[0x24BE419B8]();
}

uint64_t sub_231D7DFA4()
{
  return MEMORY[0x24BE41A38]();
}

uint64_t sub_231D7DFB0()
{
  return MEMORY[0x24BE41A50]();
}

uint64_t sub_231D7DFBC()
{
  return MEMORY[0x24BE41A68]();
}

uint64_t sub_231D7DFC8()
{
  return MEMORY[0x24BE41A70]();
}

uint64_t sub_231D7DFD4()
{
  return MEMORY[0x24BE41D00]();
}

uint64_t sub_231D7DFE0()
{
  return MEMORY[0x24BE46DC8]();
}

uint64_t sub_231D7DFEC()
{
  return MEMORY[0x24BE46DD0]();
}

uint64_t sub_231D7DFF8()
{
  return MEMORY[0x24BE46DD8]();
}

uint64_t sub_231D7E004()
{
  return MEMORY[0x24BE46DE0]();
}

uint64_t sub_231D7E010()
{
  return MEMORY[0x24BE46DE8]();
}

uint64_t sub_231D7E01C()
{
  return MEMORY[0x24BE46DF0]();
}

uint64_t sub_231D7E028()
{
  return MEMORY[0x24BE46DF8]();
}

uint64_t sub_231D7E034()
{
  return MEMORY[0x24BE46E00]();
}

uint64_t sub_231D7E040()
{
  return MEMORY[0x24BE46E10]();
}

uint64_t sub_231D7E04C()
{
  return MEMORY[0x24BE46E18]();
}

uint64_t sub_231D7E058()
{
  return MEMORY[0x24BE46E20]();
}

uint64_t sub_231D7E064()
{
  return MEMORY[0x24BE46E28]();
}

uint64_t sub_231D7E070()
{
  return MEMORY[0x24BE46E38]();
}

uint64_t sub_231D7E07C()
{
  return MEMORY[0x24BE46E40]();
}

uint64_t sub_231D7E088()
{
  return MEMORY[0x24BE46E48]();
}

uint64_t sub_231D7E094()
{
  return MEMORY[0x24BE46E50]();
}

uint64_t sub_231D7E0A0()
{
  return MEMORY[0x24BE46E58]();
}

uint64_t sub_231D7E0AC()
{
  return MEMORY[0x24BE46E60]();
}

uint64_t sub_231D7E0B8()
{
  return MEMORY[0x24BE420C0]();
}

uint64_t sub_231D7E0C4()
{
  return MEMORY[0x24BE42170]();
}

uint64_t sub_231D7E0D0()
{
  return MEMORY[0x24BE421F0]();
}

uint64_t sub_231D7E0DC()
{
  return MEMORY[0x24BE421F8]();
}

uint64_t sub_231D7E0E8()
{
  return MEMORY[0x24BE42208]();
}

uint64_t sub_231D7E0F4()
{
  return MEMORY[0x24BE42210]();
}

uint64_t sub_231D7E100()
{
  return MEMORY[0x24BE42218]();
}

uint64_t sub_231D7E10C()
{
  return MEMORY[0x24BE42220]();
}

uint64_t sub_231D7E118()
{
  return MEMORY[0x24BE42228]();
}

uint64_t sub_231D7E124()
{
  return MEMORY[0x24BE42238]();
}

uint64_t sub_231D7E130()
{
  return MEMORY[0x24BE42248]();
}

uint64_t sub_231D7E13C()
{
  return MEMORY[0x24BE42270]();
}

uint64_t sub_231D7E148()
{
  return MEMORY[0x24BE42280]();
}

uint64_t sub_231D7E154()
{
  return MEMORY[0x24BE422B0]();
}

uint64_t sub_231D7E160()
{
  return MEMORY[0x24BE42300]();
}

uint64_t sub_231D7E16C()
{
  return MEMORY[0x24BE42310]();
}

uint64_t sub_231D7E178()
{
  return MEMORY[0x24BE423E8]();
}

uint64_t sub_231D7E184()
{
  return MEMORY[0x24BE423F0]();
}

uint64_t sub_231D7E190()
{
  return MEMORY[0x24BE423F8]();
}

uint64_t sub_231D7E19C()
{
  return MEMORY[0x24BE42418]();
}

uint64_t sub_231D7E1A8()
{
  return MEMORY[0x24BE42428]();
}

uint64_t sub_231D7E1B4()
{
  return MEMORY[0x24BE42438]();
}

uint64_t sub_231D7E1C0()
{
  return MEMORY[0x24BE42440]();
}

uint64_t sub_231D7E1CC()
{
  return MEMORY[0x24BE42448]();
}

uint64_t sub_231D7E1D8()
{
  return MEMORY[0x24BE42470]();
}

uint64_t sub_231D7E1E4()
{
  return MEMORY[0x24BE42480]();
}

uint64_t sub_231D7E1F0()
{
  return MEMORY[0x24BE424A8]();
}

uint64_t sub_231D7E1FC()
{
  return MEMORY[0x24BE425B8]();
}

uint64_t sub_231D7E208()
{
  return MEMORY[0x24BE425C0]();
}

uint64_t sub_231D7E214()
{
  return MEMORY[0x24BE425D0]();
}

uint64_t sub_231D7E220()
{
  return MEMORY[0x24BE425D8]();
}

uint64_t sub_231D7E22C()
{
  return MEMORY[0x24BE42678]();
}

uint64_t sub_231D7E238()
{
  return MEMORY[0x24BE426A0]();
}

uint64_t sub_231D7E244()
{
  return MEMORY[0x24BE426A8]();
}

uint64_t sub_231D7E250()
{
  return MEMORY[0x24BE426B0]();
}

uint64_t sub_231D7E25C()
{
  return MEMORY[0x24BE426B8]();
}

uint64_t sub_231D7E268()
{
  return MEMORY[0x24BE42778]();
}

uint64_t sub_231D7E274()
{
  return MEMORY[0x24BE42888]();
}

uint64_t sub_231D7E280()
{
  return MEMORY[0x24BE42898]();
}

uint64_t sub_231D7E28C()
{
  return MEMORY[0x24BE428B8]();
}

uint64_t sub_231D7E298()
{
  return MEMORY[0x24BE42910]();
}

uint64_t sub_231D7E2A4()
{
  return MEMORY[0x24BE429C8]();
}

uint64_t sub_231D7E2B0()
{
  return MEMORY[0x24BE429D0]();
}

uint64_t sub_231D7E2BC()
{
  return MEMORY[0x24BE429E8]();
}

uint64_t sub_231D7E2C8()
{
  return MEMORY[0x24BE42A58]();
}

uint64_t sub_231D7E2D4()
{
  return MEMORY[0x24BE42A60]();
}

uint64_t sub_231D7E2E0()
{
  return MEMORY[0x24BE42A70]();
}

uint64_t sub_231D7E2EC()
{
  return MEMORY[0x24BE42AA8]();
}

uint64_t sub_231D7E2F8()
{
  return MEMORY[0x24BE42C28]();
}

uint64_t sub_231D7E304()
{
  return MEMORY[0x24BE42C30]();
}

uint64_t sub_231D7E310()
{
  return MEMORY[0x24BE42D28]();
}

uint64_t sub_231D7E31C()
{
  return MEMORY[0x24BE42D30]();
}

uint64_t sub_231D7E328()
{
  return MEMORY[0x24BE42D38]();
}

uint64_t sub_231D7E334()
{
  return MEMORY[0x24BE42D48]();
}

uint64_t sub_231D7E340()
{
  return MEMORY[0x24BE42DF0]();
}

uint64_t sub_231D7E34C()
{
  return MEMORY[0x24BE42E00]();
}

uint64_t sub_231D7E358()
{
  return MEMORY[0x24BE42E18]();
}

uint64_t sub_231D7E364()
{
  return MEMORY[0x24BE42E48]();
}

uint64_t sub_231D7E370()
{
  return MEMORY[0x24BE42E60]();
}

uint64_t sub_231D7E37C()
{
  return MEMORY[0x24BE42E90]();
}

uint64_t sub_231D7E388()
{
  return MEMORY[0x24BE42EF8]();
}

uint64_t sub_231D7E394()
{
  return MEMORY[0x24BE42F08]();
}

uint64_t sub_231D7E3A0()
{
  return MEMORY[0x24BE42F18]();
}

uint64_t sub_231D7E3AC()
{
  return MEMORY[0x24BE42FB0]();
}

uint64_t sub_231D7E3B8()
{
  return MEMORY[0x24BE42FB8]();
}

uint64_t sub_231D7E3C4()
{
  return MEMORY[0x24BE42FC0]();
}

uint64_t sub_231D7E3D0()
{
  return MEMORY[0x24BE42FC8]();
}

uint64_t sub_231D7E3DC()
{
  return MEMORY[0x24BE42FF0]();
}

uint64_t sub_231D7E3E8()
{
  return MEMORY[0x24BE43060]();
}

uint64_t sub_231D7E3F4()
{
  return MEMORY[0x24BE430A0]();
}

uint64_t sub_231D7E400()
{
  return MEMORY[0x24BE430B0]();
}

uint64_t sub_231D7E40C()
{
  return MEMORY[0x24BE431A0]();
}

uint64_t sub_231D7E418()
{
  return MEMORY[0x24BE431A8]();
}

uint64_t sub_231D7E424()
{
  return MEMORY[0x24BE431B0]();
}

uint64_t sub_231D7E430()
{
  return MEMORY[0x24BE431B8]();
}

uint64_t sub_231D7E43C()
{
  return MEMORY[0x24BE43348]();
}

uint64_t sub_231D7E448()
{
  return MEMORY[0x24BE43360]();
}

uint64_t sub_231D7E454()
{
  return MEMORY[0x24BE43368]();
}

uint64_t sub_231D7E460()
{
  return MEMORY[0x24BE434B0]();
}

uint64_t sub_231D7E46C()
{
  return MEMORY[0x24BE43570]();
}

uint64_t sub_231D7E478()
{
  return MEMORY[0x24BE43588]();
}

uint64_t sub_231D7E484()
{
  return MEMORY[0x24BE435C0]();
}

uint64_t sub_231D7E490()
{
  return MEMORY[0x24BE43608]();
}

uint64_t sub_231D7E49C()
{
  return MEMORY[0x24BE43640]();
}

uint64_t sub_231D7E4A8()
{
  return MEMORY[0x24BE43650]();
}

uint64_t sub_231D7E4B4()
{
  return MEMORY[0x24BE436B8]();
}

uint64_t sub_231D7E4C0()
{
  return MEMORY[0x24BE436E0]();
}

uint64_t sub_231D7E4CC()
{
  return MEMORY[0x24BE436F0]();
}

uint64_t sub_231D7E4D8()
{
  return MEMORY[0x24BE436F8]();
}

uint64_t sub_231D7E4E4()
{
  return MEMORY[0x24BE43AD0]();
}

uint64_t sub_231D7E4F0()
{
  return MEMORY[0x24BE43AD8]();
}

uint64_t sub_231D7E4FC()
{
  return MEMORY[0x24BE43AE0]();
}

uint64_t sub_231D7E508()
{
  return MEMORY[0x24BE43AF0]();
}

uint64_t sub_231D7E514()
{
  return MEMORY[0x24BE43B70]();
}

uint64_t sub_231D7E520()
{
  return MEMORY[0x24BE43B80]();
}

uint64_t sub_231D7E52C()
{
  return MEMORY[0x24BE43B88]();
}

uint64_t sub_231D7E538()
{
  return MEMORY[0x24BE43BD8]();
}

uint64_t sub_231D7E544()
{
  return MEMORY[0x24BE43BE0]();
}

uint64_t sub_231D7E550()
{
  return MEMORY[0x24BE43D20]();
}

uint64_t sub_231D7E55C()
{
  return MEMORY[0x24BE43D78]();
}

uint64_t sub_231D7E568()
{
  return MEMORY[0x24BE43DD8]();
}

uint64_t sub_231D7E574()
{
  return MEMORY[0x24BE43DF0]();
}

uint64_t sub_231D7E580()
{
  return MEMORY[0x24BE43DF8]();
}

uint64_t sub_231D7E58C()
{
  return MEMORY[0x24BE43E48]();
}

uint64_t sub_231D7E598()
{
  return MEMORY[0x24BE43E50]();
}

uint64_t sub_231D7E5A4()
{
  return MEMORY[0x24BE43E60]();
}

uint64_t sub_231D7E5B0()
{
  return MEMORY[0x24BE43EF0]();
}

uint64_t sub_231D7E5BC()
{
  return MEMORY[0x24BE43EF8]();
}

uint64_t sub_231D7E5C8()
{
  return MEMORY[0x24BE43F10]();
}

uint64_t sub_231D7E5D4()
{
  return MEMORY[0x24BE43F20]();
}

uint64_t sub_231D7E5E0()
{
  return MEMORY[0x24BE43F38]();
}

uint64_t sub_231D7E5EC()
{
  return MEMORY[0x24BE43F40]();
}

uint64_t sub_231D7E5F8()
{
  return MEMORY[0x24BE43F48]();
}

uint64_t sub_231D7E604()
{
  return MEMORY[0x24BE43F58]();
}

uint64_t sub_231D7E610()
{
  return MEMORY[0x24BE43F68]();
}

uint64_t sub_231D7E61C()
{
  return MEMORY[0x24BE44018]();
}

uint64_t sub_231D7E628()
{
  return MEMORY[0x24BE44090]();
}

uint64_t sub_231D7E634()
{
  return MEMORY[0x24BE44098]();
}

uint64_t sub_231D7E640()
{
  return MEMORY[0x24BE440A0]();
}

uint64_t sub_231D7E64C()
{
  return MEMORY[0x24BE440B8]();
}

uint64_t sub_231D7E658()
{
  return MEMORY[0x24BE440C0]();
}

uint64_t sub_231D7E664()
{
  return MEMORY[0x24BE440D8]();
}

uint64_t sub_231D7E670()
{
  return MEMORY[0x24BE44268]();
}

uint64_t sub_231D7E67C()
{
  return MEMORY[0x24BE44270]();
}

uint64_t sub_231D7E688()
{
  return MEMORY[0x24BE44290]();
}

uint64_t sub_231D7E694()
{
  return MEMORY[0x24BE442A0]();
}

uint64_t sub_231D7E6A0()
{
  return MEMORY[0x24BE443D0]();
}

uint64_t sub_231D7E6AC()
{
  return MEMORY[0x24BE443D8]();
}

uint64_t sub_231D7E6B8()
{
  return MEMORY[0x24BE443E8]();
}

uint64_t sub_231D7E6C4()
{
  return MEMORY[0x24BE44410]();
}

uint64_t sub_231D7E6D0()
{
  return MEMORY[0x24BE44440]();
}

uint64_t sub_231D7E6DC()
{
  return MEMORY[0x24BE44448]();
}

uint64_t sub_231D7E6E8()
{
  return MEMORY[0x24BE44450]();
}

uint64_t sub_231D7E6F4()
{
  return MEMORY[0x24BE44458]();
}

uint64_t sub_231D7E700()
{
  return MEMORY[0x24BE44750]();
}

uint64_t sub_231D7E70C()
{
  return MEMORY[0x24BE44768]();
}

uint64_t sub_231D7E718()
{
  return MEMORY[0x24BE44828]();
}

uint64_t sub_231D7E724()
{
  return MEMORY[0x24BE44830]();
}

uint64_t sub_231D7E730()
{
  return MEMORY[0x24BE44840]();
}

uint64_t sub_231D7E73C()
{
  return MEMORY[0x24BE44858]();
}

uint64_t sub_231D7E748()
{
  return MEMORY[0x24BE44888]();
}

uint64_t sub_231D7E754()
{
  return MEMORY[0x24BE44890]();
}

uint64_t sub_231D7E760()
{
  return MEMORY[0x24BE448B0]();
}

uint64_t sub_231D7E76C()
{
  return MEMORY[0x24BE44910]();
}

uint64_t sub_231D7E778()
{
  return MEMORY[0x24BE44918]();
}

uint64_t sub_231D7E784()
{
  return MEMORY[0x24BE44920]();
}

uint64_t sub_231D7E790()
{
  return MEMORY[0x24BE449D8]();
}

uint64_t sub_231D7E79C()
{
  return MEMORY[0x24BE44AA0]();
}

uint64_t sub_231D7E7A8()
{
  return MEMORY[0x24BE44AA8]();
}

uint64_t sub_231D7E7B4()
{
  return MEMORY[0x24BE44B20]();
}

uint64_t sub_231D7E7C0()
{
  return MEMORY[0x24BE44BE0]();
}

uint64_t sub_231D7E7CC()
{
  return MEMORY[0x24BE44BE8]();
}

uint64_t sub_231D7E7D8()
{
  return MEMORY[0x24BE44C38]();
}

uint64_t sub_231D7E7E4()
{
  return MEMORY[0x24BE44C40]();
}

uint64_t sub_231D7E7F0()
{
  return MEMORY[0x24BE44D98]();
}

uint64_t sub_231D7E7FC()
{
  return MEMORY[0x24BE44DA0]();
}

uint64_t sub_231D7E808()
{
  return MEMORY[0x24BE44DA8]();
}

uint64_t sub_231D7E814()
{
  return MEMORY[0x24BE44ED8]();
}

uint64_t sub_231D7E820()
{
  return MEMORY[0x24BE44F30]();
}

uint64_t sub_231D7E82C()
{
  return MEMORY[0x24BE44F48]();
}

uint64_t sub_231D7E838()
{
  return MEMORY[0x24BE44F58]();
}

uint64_t sub_231D7E844()
{
  return MEMORY[0x24BE44F68]();
}

uint64_t sub_231D7E850()
{
  return MEMORY[0x24BE3F838]();
}

uint64_t sub_231D7E85C()
{
  return MEMORY[0x24BE44F78]();
}

uint64_t sub_231D7E868()
{
  return MEMORY[0x24BE44F90]();
}

uint64_t sub_231D7E874()
{
  return MEMORY[0x24BE44FA8]();
}

uint64_t sub_231D7E880()
{
  return MEMORY[0x24BE44FB0]();
}

uint64_t sub_231D7E88C()
{
  return MEMORY[0x24BE451D0]();
}

uint64_t sub_231D7E898()
{
  return MEMORY[0x24BE451D8]();
}

uint64_t sub_231D7E8A4()
{
  return MEMORY[0x24BE451F8]();
}

uint64_t sub_231D7E8B0()
{
  return MEMORY[0x24BE45210]();
}

uint64_t sub_231D7E8BC()
{
  return MEMORY[0x24BE452D0]();
}

uint64_t sub_231D7E8C8()
{
  return MEMORY[0x24BE452E0]();
}

uint64_t sub_231D7E8D4()
{
  return MEMORY[0x24BE45318]();
}

uint64_t sub_231D7E8E0()
{
  return MEMORY[0x24BE45320]();
}

uint64_t sub_231D7E8EC()
{
  return MEMORY[0x24BE453C8]();
}

uint64_t sub_231D7E8F8()
{
  return MEMORY[0x24BE453D8]();
}

uint64_t sub_231D7E904()
{
  return MEMORY[0x24BE45750]();
}

uint64_t sub_231D7E910()
{
  return MEMORY[0x24BE45768]();
}

uint64_t sub_231D7E91C()
{
  return MEMORY[0x24BE457F0]();
}

uint64_t sub_231D7E928()
{
  return MEMORY[0x24BE457F8]();
}

uint64_t sub_231D7E934()
{
  return MEMORY[0x24BE3F840]();
}

uint64_t sub_231D7E940()
{
  return MEMORY[0x24BE3F858]();
}

uint64_t sub_231D7E94C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_231D7E958()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_231D7E964()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_231D7E970()
{
  return MEMORY[0x24BE484B8]();
}

uint64_t sub_231D7E97C()
{
  return MEMORY[0x24BE484D0]();
}

uint64_t sub_231D7E988()
{
  return MEMORY[0x24BE46E68]();
}

uint64_t sub_231D7E994()
{
  return MEMORY[0x24BE46E70]();
}

uint64_t sub_231D7E9A0()
{
  return MEMORY[0x24BE46E78]();
}

uint64_t sub_231D7E9AC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_231D7E9B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_231D7E9C4()
{
  return MEMORY[0x24BEBC060]();
}

uint64_t sub_231D7E9D0()
{
  return MEMORY[0x24BEBC088]();
}

uint64_t sub_231D7E9DC()
{
  return MEMORY[0x24BEBC098]();
}

uint64_t sub_231D7E9E8()
{
  return MEMORY[0x24BEBC0B0]();
}

uint64_t sub_231D7E9F4()
{
  return MEMORY[0x24BEBC0B8]();
}

uint64_t sub_231D7EA00()
{
  return MEMORY[0x24BEBC0E0]();
}

uint64_t sub_231D7EA0C()
{
  return MEMORY[0x24BEBC320]();
}

uint64_t sub_231D7EA18()
{
  return MEMORY[0x24BEBC598]();
}

uint64_t sub_231D7EA24()
{
  return MEMORY[0x24BEBC5B0]();
}

uint64_t sub_231D7EA30()
{
  return MEMORY[0x24BEBC5C0]();
}

uint64_t sub_231D7EA3C()
{
  return MEMORY[0x24BEBC5F8]();
}

uint64_t sub_231D7EA48()
{
  return MEMORY[0x24BEBCB20]();
}

uint64_t sub_231D7EA54()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_231D7EA60()
{
  return MEMORY[0x24BDB99F8]();
}

uint64_t sub_231D7EA6C()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_231D7EA78()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_231D7EA84()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_231D7EA90()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_231D7EA9C()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_231D7EAA8()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_231D7EAB4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_231D7EAC0()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_231D7EACC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_231D7EAD8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_231D7EAE4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_231D7EAF0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_231D7EAFC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_231D7EB08()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_231D7EB14()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_231D7EB20()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_231D7EB2C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_231D7EB38()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_231D7EB44()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_231D7EB50()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_231D7EB5C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_231D7EB68()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_231D7EB74()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_231D7EB80()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_231D7EB8C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_231D7EB98()
{
  return MEMORY[0x24BE41D50]();
}

uint64_t sub_231D7EBA4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_231D7EBB0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_231D7EBBC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_231D7EBC8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_231D7EBD4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_231D7EBE0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_231D7EBEC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_231D7EBF8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_231D7EC04()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_231D7EC10()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_231D7EC1C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_231D7EC28()
{
  return MEMORY[0x24BE48788]();
}

uint64_t sub_231D7EC34()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_231D7EC40()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_231D7EC4C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_231D7EC58()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_231D7EC64()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_231D7EC70()
{
  return MEMORY[0x24BDD2520]();
}

uint64_t sub_231D7EC7C()
{
  return MEMORY[0x24BE485B0]();
}

uint64_t sub_231D7EC88()
{
  return MEMORY[0x24BE485B8]();
}

uint64_t sub_231D7EC94()
{
  return MEMORY[0x24BE45478]();
}

uint64_t sub_231D7ECA0()
{
  return MEMORY[0x24BE45498]();
}

uint64_t sub_231D7ECAC()
{
  return MEMORY[0x24BE454A0]();
}

uint64_t sub_231D7ECB8()
{
  return MEMORY[0x24BE45B50]();
}

uint64_t sub_231D7ECC4()
{
  return MEMORY[0x24BE45B58]();
}

uint64_t sub_231D7ECD0()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_231D7ECDC()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_231D7ECE8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_231D7ECF4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_231D7ED00()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_231D7ED0C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_231D7ED18()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_231D7ED24()
{
  return MEMORY[0x24BE45570]();
}

uint64_t sub_231D7ED30()
{
  return MEMORY[0x24BE45BA8]();
}

uint64_t sub_231D7ED3C()
{
  return MEMORY[0x24BE455D0]();
}

uint64_t sub_231D7ED48()
{
  return MEMORY[0x24BEBCFC0]();
}

uint64_t sub_231D7ED54()
{
  return MEMORY[0x24BE455F8]();
}

uint64_t sub_231D7ED60()
{
  return MEMORY[0x24BEBCFE8]();
}

uint64_t sub_231D7ED6C()
{
  return MEMORY[0x24BE46E88]();
}

uint64_t sub_231D7ED78()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_231D7ED84()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_231D7ED90()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_231D7ED9C()
{
  return MEMORY[0x24BE8DCC8]();
}

uint64_t sub_231D7EDA8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_231D7EDB4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_231D7EDC0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_231D7EDCC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_231D7EDD8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_231D7EDE4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_231D7EDF0()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_231D7EDFC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_231D7EE08()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_231D7EE14()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_231D7EE20()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_231D7EE2C()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_231D7EE38()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_231D7EE44()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_231D7EE50()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_231D7EE5C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_231D7EE68()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_231D7EE74()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_231D7EE80()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_231D7EE8C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_231D7EE98()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_231D7EEA4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_231D7EEB0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_231D7EEBC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_231D7EEC8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_231D7EED4()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_231D7EEE0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_231D7EEEC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_231D7EEF8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_231D7EF04()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_231D7EF10()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_231D7EF1C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_231D7EF28()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_231D7EF34()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_231D7EF40()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_231D7EF4C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_231D7EF58()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_231D7EF64()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_231D7EF70()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_231D7EF7C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_231D7EF88()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_231D7EF94()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_231D7EFA0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_231D7EFAC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_231D7EFB8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_231D7EFC4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_231D7EFD0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_231D7EFDC()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_231D7EFE8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_231D7EFF4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_231D7F000()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_231D7F00C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_231D7F018()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t HKMobilityAllWalkingSteadinessNotificationCategories()
{
  return MEMORY[0x24BE46D40]();
}

uint64_t HKMobilityNotificationCategoryForWalkingSteadinessEventValue()
{
  return MEMORY[0x24BE46D48]();
}

uint64_t HKMobilityWalkingSteadinessEventType()
{
  return MEMORY[0x24BE46D60]();
}

uint64_t HKMobilityWalkingSteadinessType()
{
  return MEMORY[0x24BE46D80]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x24BE4A1C8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

