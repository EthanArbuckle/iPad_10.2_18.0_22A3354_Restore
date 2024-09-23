void static LocationButton.Title.currentLocation.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t LocationButton.init(_:action:)(unsigned __int8 *a1)
{
  return ((uint64_t (*)(void))((char *)&loc_22E0739F8 + *((int *)qword_22E073A38 + *a1)))();
}

void sub_22E073A08(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = 2;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
}

uint64_t LocationButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22E073A88(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
  return swift_retain();
}

uint64_t sub_22E073A88@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t result;
  uint64_t v16;

  *(_QWORD *)a5 = swift_getKeyPath();
  *(_BYTE *)(a5 + 8) = 0;
  *(_QWORD *)(a5 + 16) = swift_getKeyPath();
  *(_BYTE *)(a5 + 24) = 0;
  v10 = (int *)type metadata accessor for ViewRepresentable();
  v11 = (uint64_t *)(a5 + v10[6]);
  *v11 = swift_getKeyPath();
  sub_22E075014(&qword_255DF4D70);
  swift_storeEnumTagMultiPayload();
  v12 = (uint64_t *)(a5 + v10[7]);
  *v12 = swift_getKeyPath();
  sub_22E075014(&qword_255DF4D80);
  swift_storeEnumTagMultiPayload();
  v13 = a5 + v10[8];
  *(_QWORD *)v13 = swift_getKeyPath();
  *(_BYTE *)(v13 + 8) = 0;
  v14 = (uint64_t *)(a5 + v10[9]);
  *v14 = swift_getKeyPath();
  sub_22E075014(&qword_255DF4D88);
  result = swift_storeEnumTagMultiPayload();
  v16 = a5 + v10[10];
  *(_QWORD *)v16 = a1;
  *(_BYTE *)(v16 + 8) = a2 & 1;
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  return result;
}

void static LocationButton.Title.sendCurrentLocation.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static LocationButton.Title.sendMyCurrentLocation.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void static LocationButton.Title.shareCurrentLocation.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void static LocationButton.Title.shareMyCurrentLocation.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_22E073C00()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_22E073C10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22E073C24()
{
  sub_22E077094();
  sub_22E0770A0();
  return sub_22E0770AC();
}

uint64_t sub_22E073C68()
{
  return sub_22E0770A0();
}

uint64_t sub_22E073C90()
{
  sub_22E077094();
  sub_22E0770A0();
  return sub_22E0770AC();
}

uint64_t sub_22E073CD8()
{
  return sub_22E077028();
}

uint64_t sub_22E073CF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22E073A88(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
  return swift_retain();
}

uint64_t initializeBufferWithCopyOfBuffer for LocationButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LocationButton()
{
  return swift_release();
}

__n128 initializeWithTake for Configuration(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for LocationButton(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for LocationButton()
{
  return &type metadata for LocationButton;
}

_BYTE *initializeBufferWithCopyOfBuffer for LocationButton.Title.Storage(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LocationButton.Title()
{
  return &type metadata for LocationButton.Title;
}

void sub_22E073DF4(void *a1)
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
  _BYTE *v10;
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
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  char v33;
  void (*v34)(_BYTE *, uint64_t);
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  void *v42;
  uint64_t v43;
  _BYTE *v44;
  _BYTE *v45;
  _BYTE *v46;
  _BYTE *v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  _BYTE *v51;
  _BYTE *v52;
  void (*v53)(_BYTE *, uint64_t);
  _BYTE *v54;
  _BYTE *v55;
  char v56;
  void (*v57)(_BYTE *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  _BYTE *v72;
  void *v73;
  double v74;
  id v75;
  double v76;
  double v77;
  _BYTE v78[12];
  int v79;
  _BYTE *v80;
  _BYTE *v81;
  void (*v82)(_BYTE *, _QWORD, uint64_t, uint64_t);
  _BYTE *v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  _BYTE *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;

  v2 = v1;
  v90 = a1;
  v3 = sub_22E077004();
  v85 = *(_QWORD *)(v3 - 8);
  v86 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v84 = &v78[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_22E076F50();
  v91 = *(_QWORD *)(v5 - 8);
  v92 = v5;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = &v78[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v95 = sub_22E075014(&qword_255DF4E70);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v83 = &v78[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v78[-v9];
  v11 = sub_22E075014(&qword_255DF4D78);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v80 = &v78[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v94 = &v78[-v15];
  v16 = MEMORY[0x24BDAC7A8](v14);
  v88 = &v78[-v17];
  v18 = MEMORY[0x24BDAC7A8](v16);
  v87 = &v78[-v19];
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = &v78[-v21];
  MEMORY[0x24BDAC7A8](v20);
  v24 = &v78[-v23];
  v25 = sub_22E076E9C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = &v78[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v27);
  v31 = &v78[-v30];
  v32 = type metadata accessor for ViewRepresentable();
  sub_22E076284(&qword_255DF4D80, (uint64_t (*)(_QWORD))MEMORY[0x24BDECB68], 0x61566C6F626D7953, 0xEE0073746E616972, (uint64_t)v31);
  sub_22E076E84();
  v33 = sub_22E076E90();
  v34 = *(void (**)(_BYTE *, uint64_t))(v26 + 8);
  v35 = v29;
  v36 = v95;
  v34(v35, v25);
  v34(v31, v25);
  v37 = 1;
  if ((v33 & 1) == 0)
    v37 = 2;
  v96 = v37;
  v93 = v32;
  v89 = v2;
  v38 = v91;
  v39 = v92;
  sub_22E07648C((uint64_t)v24);
  sub_22E076F44();
  v82 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v38 + 56);
  v82(v22, 0, 1, v39);
  v40 = (uint64_t)&v10[*(int *)(v36 + 48)];
  sub_22E076D8C((uint64_t)v24, (uint64_t)v10, &qword_255DF4D78);
  sub_22E076D8C((uint64_t)v22, v40, &qword_255DF4D78);
  v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
  if (v41((uint64_t)v10, 1, v39) == 1)
  {
    sub_22E076688((uint64_t)v22, &qword_255DF4D78);
    sub_22E076688((uint64_t)v24, &qword_255DF4D78);
    if (v41(v40, 1, v39) == 1)
    {
      sub_22E076688((uint64_t)v10, &qword_255DF4D78);
      v43 = v89;
      v42 = v90;
LABEL_16:
      v96 = 0;
      v50 = v93;
      goto LABEL_19;
    }
    goto LABEL_8;
  }
  v44 = v87;
  sub_22E076D8C((uint64_t)v10, (uint64_t)v87, &qword_255DF4D78);
  if (v41(v40, 1, v39) == 1)
  {
    sub_22E076688((uint64_t)v22, &qword_255DF4D78);
    sub_22E076688((uint64_t)v24, &qword_255DF4D78);
    (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v44, v39);
LABEL_8:
    sub_22E076688((uint64_t)v10, &qword_255DF4E70);
    v43 = v89;
    v42 = v90;
    v45 = v94;
    goto LABEL_9;
  }
  v52 = v81;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v38 + 32))(v81, v40, v39);
  sub_22E076DD0(&qword_255DF4E80, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEF00], MEMORY[0x24BDEEF10]);
  v79 = sub_22E07704C();
  v53 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
  v54 = v52;
  v36 = v95;
  v53(v54, v39);
  sub_22E076688((uint64_t)v22, &qword_255DF4D78);
  sub_22E076688((uint64_t)v24, &qword_255DF4D78);
  v53(v87, v39);
  sub_22E076688((uint64_t)v10, &qword_255DF4D78);
  v43 = v89;
  v42 = v90;
  v45 = v94;
  if ((v79 & 1) != 0)
    goto LABEL_16;
LABEL_9:
  v46 = v88;
  sub_22E07648C((uint64_t)v88);
  sub_22E076F38();
  v82(v45, 0, 1, v39);
  v47 = v83;
  v48 = (uint64_t)&v83[*(int *)(v36 + 48)];
  sub_22E076D8C((uint64_t)v46, (uint64_t)v83, &qword_255DF4D78);
  sub_22E076D8C((uint64_t)v45, v48, &qword_255DF4D78);
  if (v41((uint64_t)v47, 1, v39) == 1)
  {
    sub_22E076688((uint64_t)v45, &qword_255DF4D78);
    sub_22E076688((uint64_t)v46, &qword_255DF4D78);
    v49 = v41(v48, 1, v39);
    v50 = v93;
    if (v49 == 1)
    {
      sub_22E076688((uint64_t)v47, &qword_255DF4D78);
LABEL_18:
      v58 = 0;
      goto LABEL_22;
    }
LABEL_14:
    sub_22E076688((uint64_t)v47, &qword_255DF4E70);
    goto LABEL_19;
  }
  v51 = v80;
  sub_22E076D8C((uint64_t)v47, (uint64_t)v80, &qword_255DF4D78);
  if (v41(v48, 1, v39) == 1)
  {
    sub_22E076688((uint64_t)v94, &qword_255DF4D78);
    sub_22E076688((uint64_t)v88, &qword_255DF4D78);
    (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v51, v39);
    v50 = v93;
    goto LABEL_14;
  }
  v55 = v81;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v38 + 32))(v81, v48, v39);
  sub_22E076DD0(&qword_255DF4E80, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEF00], MEMORY[0x24BDEEF10]);
  v56 = sub_22E07704C();
  v57 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
  v57(v55, v39);
  sub_22E076688((uint64_t)v94, &qword_255DF4D78);
  sub_22E076688((uint64_t)v88, &qword_255DF4D78);
  v57(v51, v39);
  sub_22E076688((uint64_t)v47, &qword_255DF4D78);
  v50 = v93;
  if ((v56 & 1) != 0)
    goto LABEL_18;
LABEL_19:
  v59 = v43 + *(int *)(v50 + 40);
  if (*(_BYTE *)(v59 + 8))
    v58 = 1;
  else
    v58 = *(_QWORD *)v59;
LABEL_22:
  objc_msgSend(v42, sel_setLabel_, v58);
  objc_msgSend(v42, sel_setIcon_, v96);
  v60 = *(_QWORD *)(v43 + 16);
  v61 = *(_BYTE *)(v43 + 24);
  j__swift_retain();
  v62 = sub_22E0766C4(v60, v61, 0xEF3E726F6C6F433CLL, (void (*)(uint64_t, _QWORD))j_j__swift_release);
  j__swift_release();
  if (!v62)
    sub_22E077034();
  sub_22E076864();
  v63 = (void *)sub_22E077070();
  objc_msgSend(v42, sel_setBackgroundColor_, v63);

  v64 = *(_QWORD *)v43;
  v65 = *(_BYTE *)(v43 + 8);
  j__swift_retain();
  v66 = sub_22E0766C4(v64, v65, 0xEF3E726F6C6F433CLL, (void (*)(uint64_t, _QWORD))j_j__swift_release);
  j__swift_release();
  if (!v66)
    sub_22E077040();
  v67 = (void *)sub_22E077070();
  objc_msgSend(v42, sel_setTintColor_, v67);

  v68 = v43 + *(int *)(v50 + 32);
  v69 = *(_QWORD *)v68;
  v70 = *(_BYTE *)(v68 + 8);
  j__swift_retain();
  v71 = sub_22E0766C4(v69, v70, 0xEE003E746E6F463CLL, (void (*)(uint64_t, _QWORD))j__swift_release);
  j__swift_release();
  if (v71)
  {
    v72 = v84;
    sub_22E076284(&qword_255DF4D88, (uint64_t (*)(_QWORD))MEMORY[0x24BDF17A8], 0x747865746E6F43, 0xE700000000000000, (uint64_t)v84);
    v73 = (void *)sub_22E076FF8();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v85 + 8))(v72, v86);
    objc_msgSend(v73, sel_pointSize);
    v75 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, v74);
    objc_msgSend(v75, sel_pointSize);
    v77 = v76;

    objc_msgSend(v42, sel_setFontSize_, v77);
  }
  else
  {
    v73 = 0;
  }
  objc_msgSend(v42, sel_updateConstraints);

}

id sub_22E074730()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFB78]), sel_init);
  sub_22E075014(&qword_255DF4E90);
  sub_22E076FE0();
  objc_msgSend(v0, sel_addTarget_action_forControlEvents_, v2, sel_action, 64);

  return v0;
}

id sub_22E0747BC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  id result;
  objc_super v13;

  v4 = (uint64_t *)(v2 + *(int *)(a1 + 40));
  v5 = *v4;
  v6 = *((_BYTE *)v4 + 8);
  v8 = v4[2];
  v7 = v4[3];
  v9 = (objc_class *)type metadata accessor for Coordinator();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtC23_CoreLocationUI_SwiftUIP33_8A043ABF03A1FE75D0192BCB51A8BCAD11Coordinator_config];
  *(_QWORD *)v11 = v5;
  v11[8] = v6;
  *((_QWORD *)v11 + 2) = v8;
  *((_QWORD *)v11 + 3) = v7;
  v13.receiver = v10;
  v13.super_class = v9;
  swift_retain();
  result = objc_msgSendSuper2(&v13, sel_init);
  *a2 = result;
  return result;
}

uint64_t sub_22E074854()
{
  return sub_22E076F74();
}

uint64_t sub_22E074894()
{
  sub_22E076DD0(&qword_255DF4E98, (uint64_t (*)(uint64_t))type metadata accessor for ViewRepresentable, (uint64_t)&unk_22E077490);
  return sub_22E076FD4();
}

uint64_t sub_22E0748FC()
{
  sub_22E076DD0(&qword_255DF4E98, (uint64_t (*)(uint64_t))type metadata accessor for ViewRepresentable, (uint64_t)&unk_22E077490);
  return sub_22E076F80();
}

void sub_22E074964()
{
  sub_22E076DD0(&qword_255DF4E98, (uint64_t (*)(uint64_t))type metadata accessor for ViewRepresentable, (uint64_t)&unk_22E077490);
  sub_22E076FC8();
  __break(1u);
}

id sub_22E074A0C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Coordinator()
{
  return objc_opt_self();
}

uint64_t sub_22E074A74()
{
  return sub_22E076DD0(&qword_255DF4D68, (uint64_t (*)(uint64_t))type metadata accessor for ViewRepresentable, (uint64_t)&unk_22E077440);
}

uint64_t type metadata accessor for ViewRepresentable()
{
  uint64_t result;

  result = qword_255DF4E00;
  if (!qword_255DF4E00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t _s23_CoreLocationUI_SwiftUI14LocationButtonV5TitleV7StorageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s23_CoreLocationUI_SwiftUI14LocationButtonV5TitleV7StorageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22E074BB8 + 4 * byte_22E0772E5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22E074BEC + 4 * byte_22E0772E0[v4]))();
}

uint64_t sub_22E074BEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22E074BF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22E074BFCLL);
  return result;
}

uint64_t sub_22E074C08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22E074C10);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22E074C14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22E074C1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22E074C28(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22E074C34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocationButton.Title.Storage()
{
  return &type metadata for LocationButton.Title.Storage;
}

uint64_t _s23_CoreLocationUI_SwiftUI13ConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

uint64_t _s23_CoreLocationUI_SwiftUI13ConfigurationVwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v3;
  v4 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s23_CoreLocationUI_SwiftUI13ConfigurationVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_22E074D18(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

uint64_t sub_22E074D68(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *a2;
    v8 = *((_BYTE *)a2 + 8);
    j__swift_retain();
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = a2[2];
    v10 = *((_BYTE *)a2 + 24);
    j__swift_retain();
    *(_QWORD *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 24) = v10;
    v11 = a3[6];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    sub_22E075014(&qword_255DF4D70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_22E076F50();
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        v16 = sub_22E075014(&qword_255DF4D78);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = a3[7];
    v19 = (_QWORD *)(a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    sub_22E075014(&qword_255DF4D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_22E076E9C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v22 = a3[8];
    v23 = a1 + v22;
    v24 = (uint64_t *)((char *)a2 + v22);
    v25 = *v24;
    v26 = *((_BYTE *)v24 + 8);
    j__swift_retain();
    *(_QWORD *)v23 = v25;
    *(_BYTE *)(v23 + 8) = v26;
    v27 = a3[9];
    v28 = (_QWORD *)(a1 + v27);
    v29 = (uint64_t *)((char *)a2 + v27);
    sub_22E075014(&qword_255DF4D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v30 = sub_22E077004();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      *v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v31 = a3[10];
    v32 = a1 + v31;
    v33 = (uint64_t)a2 + v31;
    *(_QWORD *)v32 = *(_QWORD *)v33;
    *(_BYTE *)(v32 + 8) = *(_BYTE *)(v33 + 8);
    v34 = *(_QWORD *)(v33 + 24);
    *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
    *(_QWORD *)(v32 + 24) = v34;
  }
  swift_retain();
  return a1;
}

uint64_t sub_22E075014(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E325128]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22E075058(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  j__swift_release();
  j__swift_release();
  v4 = a1 + a2[6];
  sub_22E075014(&qword_255DF4D70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_22E076F50();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[7];
  sub_22E075014(&qword_255DF4D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_22E076E9C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  j__swift_release();
  v9 = a1 + a2[9];
  sub_22E075014(&qword_255DF4D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_22E077004();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22E0751D0(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  j__swift_retain();
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a2[2];
  v9 = *((_BYTE *)a2 + 24);
  j__swift_retain();
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)((char *)a2 + v10);
  sub_22E075014(&qword_255DF4D70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = sub_22E076F50();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = sub_22E075014(&qword_255DF4D78);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  else
  {
    *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v16 = a3[7];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)((char *)a2 + v16);
  sub_22E075014(&qword_255DF4D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_22E076E9C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    *v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = (uint64_t *)((char *)a2 + v20);
  v23 = *v22;
  v24 = *((_BYTE *)v22 + 8);
  j__swift_retain();
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = v24;
  v25 = a3[9];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)((char *)a2 + v25);
  sub_22E075014(&qword_255DF4D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v28 = sub_22E077004();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    *v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v29 = a3[10];
  v30 = a1 + v29;
  v31 = (uint64_t)a2 + v29;
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *(_BYTE *)(v30 + 8) = *(_BYTE *)(v31 + 8);
  v32 = *(_QWORD *)(v31 + 24);
  *(_QWORD *)(v30 + 16) = *(_QWORD *)(v31 + 16);
  *(_QWORD *)(v30 + 24) = v32;
  swift_retain();
  return a1;
}

uint64_t sub_22E075454(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  j__swift_retain();
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  j__swift_release();
  v8 = a2[2];
  v9 = *((_BYTE *)a2 + 24);
  j__swift_retain();
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  j__swift_release();
  if ((uint64_t *)a1 != a2)
  {
    v10 = a3[6];
    v11 = (_QWORD *)(a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    sub_22E076688(a1 + v10, &qword_255DF4D70);
    sub_22E075014(&qword_255DF4D70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_22E076F50();
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        v15 = sub_22E075014(&qword_255DF4D78);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v16 = a3[7];
    v17 = (_QWORD *)(a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    sub_22E076688(a1 + v16, &qword_255DF4D80);
    sub_22E075014(&qword_255DF4D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_22E076E9C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = (uint64_t *)((char *)a2 + v20);
  v23 = *v22;
  v24 = *((_BYTE *)v22 + 8);
  j__swift_retain();
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = v24;
  j__swift_release();
  if ((uint64_t *)a1 != a2)
  {
    v25 = a3[9];
    v26 = (_QWORD *)(a1 + v25);
    v27 = (uint64_t *)((char *)a2 + v25);
    sub_22E076688(a1 + v25, &qword_255DF4D88);
    sub_22E075014(&qword_255DF4D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = sub_22E077004();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      *v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v29 = a3[10];
  v30 = a1 + v29;
  v31 = (uint64_t *)((char *)a2 + v29);
  v32 = *v31;
  *(_BYTE *)(v30 + 8) = *((_BYTE *)v31 + 8);
  *(_QWORD *)v30 = v32;
  v33 = v31[3];
  *(_QWORD *)(v30 + 16) = v31[2];
  *(_QWORD *)(v30 + 24) = v33;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22E075748(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  __int128 v29;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_22E075014(&qword_255DF4D70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_22E076F50();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      v12 = sub_22E075014(&qword_255DF4D78);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v7, v8, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v13 = a3[7];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_22E075014(&qword_255DF4D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = sub_22E076E9C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  v18 = a3[8];
  v19 = a3[9];
  v20 = a1 + v18;
  v21 = a2 + v18;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  v22 = (void *)(a1 + v19);
  v23 = (const void *)(a2 + v19);
  v24 = sub_22E075014(&qword_255DF4D88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v25 = sub_22E077004();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  v26 = a3[10];
  v27 = (_OWORD *)(a1 + v26);
  v28 = (_OWORD *)(a2 + v26);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  return a1;
}

uint64_t sub_22E075994(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  char v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  j__swift_release();
  v7 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v7;
  j__swift_release();
  if (a1 != a2)
  {
    v8 = a3[6];
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_22E076688(a1 + v8, &qword_255DF4D70);
    v11 = sub_22E075014(&qword_255DF4D70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_22E076F50();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        v14 = sub_22E075014(&qword_255DF4D78);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    v15 = a3[7];
    v16 = (void *)(a1 + v15);
    v17 = (const void *)(a2 + v15);
    sub_22E076688(a1 + v15, &qword_255DF4D80);
    v18 = sub_22E075014(&qword_255DF4D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_22E076E9C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
  }
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = (uint64_t *)(a2 + v20);
  v23 = *v22;
  LOBYTE(v22) = *((_BYTE *)v22 + 8);
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = (_BYTE)v22;
  j__swift_release();
  if (a1 != a2)
  {
    v24 = a3[9];
    v25 = (void *)(a1 + v24);
    v26 = (const void *)(a2 + v24);
    sub_22E076688(a1 + v24, &qword_255DF4D88);
    v27 = sub_22E075014(&qword_255DF4D88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = sub_22E077004();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v25, v26, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
  }
  v29 = a3[10];
  v30 = a1 + v29;
  v31 = a2 + v29;
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *(_BYTE *)(v30 + 8) = *(_BYTE *)(v31 + 8);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)(v31 + 16);
  swift_release();
  return a1;
}

uint64_t sub_22E075C60()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E075C6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;

  v6 = sub_22E075014(&qword_255DF4D90);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = sub_22E075014(&qword_255DF4D98);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v11 = sub_22E075014(qword_255DF4DA0);
  v7 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v13 = *(_QWORD *)(a1 + a3[10] + 16);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  return (v13 + 1);
}

uint64_t sub_22E075D44()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E075D50(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v8 = sub_22E075014(&qword_255DF4D90);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  v12 = sub_22E075014(&qword_255DF4D98);
  v9 = *(_QWORD *)(v12 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v12;
    v11 = a4[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = sub_22E075014(qword_255DF4DA0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[10] + 16) = (a2 - 1);
  return result;
}

void sub_22E075E24()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_22E075EF8();
  if (v0 <= 0x3F)
  {
    sub_22E075F94(319, &qword_255DF4E18, (void (*)(uint64_t))MEMORY[0x24BDECB68]);
    if (v1 <= 0x3F)
    {
      sub_22E075F94(319, qword_255DF4E20, (void (*)(uint64_t))MEMORY[0x24BDF17A8]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_22E075EF8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255DF4E10)
  {
    sub_22E075F50(&qword_255DF4D78);
    v0 = sub_22E076E78();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255DF4E10);
  }
}

uint64_t sub_22E075F50(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E325134](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_22E075F94(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_22E076E78();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_22E075FE4()
{
  unint64_t result;

  result = qword_255DF4E68;
  if (!qword_255DF4E68)
  {
    result = MEMORY[0x22E325140](&unk_22E077418, &type metadata for LocationButton.Title.Storage);
    atomic_store(result, (unint64_t *)&qword_255DF4E68);
  }
  return result;
}

uint64_t sub_22E076028()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_22E076034()
{
  return sub_22E076DD0(&qword_255DF4D68, (uint64_t (*)(uint64_t))type metadata accessor for ViewRepresentable, (uint64_t)&unk_22E077440);
}

uint64_t sub_22E076060@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22E076EFC();
  *a1 = result;
  return result;
}

uint64_t sub_22E076088@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22E076EA8();
  *a1 = result;
  return result;
}

uint64_t sub_22E0760B0()
{
  swift_retain();
  return sub_22E076EB4();
}

uint64_t sub_22E0760D8()
{
  return sub_22E076ED8();
}

uint64_t sub_22E0760F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = sub_22E075014(&qword_255DF4D78);
  MEMORY[0x24BDAC7A8](v2);
  sub_22E076D8C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_255DF4D78);
  return sub_22E076EE4();
}

uint64_t sub_22E076178()
{
  return sub_22E076EC0();
}

uint64_t sub_22E076198(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_22E076E9C();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22E076ECC();
}

uint64_t sub_22E076214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22E076F08();
  *a1 = result;
  return result;
}

uint64_t sub_22E07623C()
{
  swift_retain();
  return sub_22E076F14();
}

uint64_t sub_22E076264()
{
  return sub_22E076EF0();
}

uint64_t sub_22E076284@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v23 = a4;
  v9 = v5;
  v11 = sub_22E076F2C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E075014(a1);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E076D8C(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    v19 = sub_22E077064();
    v20 = sub_22E076FEC();
    if (os_log_type_enabled(v20, v19))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v24 = v22;
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)(v21 + 4) = sub_22E0768A0(a3, v23, &v24);
      _os_log_impl(&dword_22E072000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E325188](v22, -1, -1);
      MEMORY[0x22E325188](v21, -1, -1);
    }

    sub_22E076F20();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_22E07648C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_22E076F2C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E075014(&qword_255DF4D70);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E076D8C(v2, (uint64_t)v9, &qword_255DF4D70);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_22E076D44((uint64_t)v9, a1);
  v11 = sub_22E077064();
  v12 = sub_22E076FEC();
  if (os_log_type_enabled(v12, v11))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v16 = v14;
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = sub_22E0768A0(0xD00000000000001DLL, 0x800000022E077CA0, &v16);
    _os_log_impl(&dword_22E072000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E325188](v14, -1, -1);
    MEMORY[0x22E325188](v13, -1, -1);
  }

  sub_22E076F20();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_22E076688(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_22E075014(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22E0766C4(uint64_t a1, char a2, unint64_t a3, void (*a4)(uint64_t, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v8 = sub_22E076F2C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v12 = sub_22E077064();
    v13 = sub_22E076FEC();
    if (os_log_type_enabled(v13, v12))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v18 = v15;
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)(v14 + 4) = sub_22E0768A0(0x6C616E6F6974704FLL, a3, &v18);
      _os_log_impl(&dword_22E072000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E325188](v15, -1, -1);
      MEMORY[0x22E325188](v14, -1, -1);
    }

    sub_22E076F20();
    swift_getAtKeyPath();
    a4(a1, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v18;
  }
  return a1;
}

unint64_t sub_22E076864()
{
  unint64_t result;

  result = qword_255DF4E78;
  if (!qword_255DF4E78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DF4E78);
  }
  return result;
}

unint64_t sub_22E0768A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22E076970(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22E076A8C((uint64_t)v12, *a3);
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
      sub_22E076A8C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_22E076A6C((uint64_t)v12);
  return v7;
}

unint64_t sub_22E076970(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_22E076AC8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_22E077088();
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

uint64_t sub_22E076A6C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_22E076A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22E076AC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22E076B5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22E076C58(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22E076C58((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22E076B5C(uint64_t a1, unint64_t a2)
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
      v3 = sub_22E076BF4(v2, 0);
      result = sub_22E07707C();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_22E077058();
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

_QWORD *sub_22E076BF4(uint64_t a1, uint64_t a2)
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
  sub_22E075014(&qword_255DF4E88);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22E076C58(char *result, int64_t a2, char a3, char *a4)
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
    sub_22E075014(&qword_255DF4E88);
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

uint64_t sub_22E076D44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22E075014(&qword_255DF4D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E076D8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_22E075014(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E076DD0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E325140](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for CLLocationButtonLabel()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255DF4EA0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255DF4EA0);
  }
}

uint64_t sub_22E076E78()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_22E076E84()
{
  return MEMORY[0x24BDECB40]();
}

uint64_t sub_22E076E90()
{
  return MEMORY[0x24BDECB60]();
}

uint64_t sub_22E076E9C()
{
  return MEMORY[0x24BDECB68]();
}

uint64_t sub_22E076EA8()
{
  return MEMORY[0x24BDEDE80]();
}

uint64_t sub_22E076EB4()
{
  return MEMORY[0x24BDEDE88]();
}

uint64_t sub_22E076EC0()
{
  return MEMORY[0x24BDEDFD8]();
}

uint64_t sub_22E076ECC()
{
  return MEMORY[0x24BDEDFE0]();
}

uint64_t sub_22E076ED8()
{
  return MEMORY[0x24BDEE1C8]();
}

uint64_t sub_22E076EE4()
{
  return MEMORY[0x24BDEE1D0]();
}

uint64_t sub_22E076EF0()
{
  return MEMORY[0x24BDEE258]();
}

uint64_t sub_22E076EFC()
{
  return MEMORY[0x24BDEE2C8]();
}

uint64_t sub_22E076F08()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_22E076F14()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_22E076F20()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_22E076F2C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_22E076F38()
{
  return MEMORY[0x24BDEEEF0]();
}

uint64_t sub_22E076F44()
{
  return MEMORY[0x24BDEEEF8]();
}

uint64_t sub_22E076F50()
{
  return MEMORY[0x24BDEEF00]();
}

uint64_t sub_22E076F5C()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_22E076F68()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_22E076F74()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_22E076F80()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_22E076F8C()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_22E076F98()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_22E076FA4()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_22E076FB0()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_22E076FBC()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_22E076FC8()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_22E076FD4()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_22E076FE0()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_22E076FEC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_22E076FF8()
{
  return MEMORY[0x24BDF1558]();
}

uint64_t sub_22E077004()
{
  return MEMORY[0x24BDF17A8]();
}

uint64_t sub_22E077010()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22E07701C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22E077028()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22E077034()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_22E077040()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_22E07704C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22E077058()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22E077064()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22E077070()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_22E07707C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22E077088()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22E077094()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22E0770A0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22E0770AC()
{
  return MEMORY[0x24BEE4328]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

