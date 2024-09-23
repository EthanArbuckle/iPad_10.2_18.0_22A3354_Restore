unint64_t sub_2321DAF50()
{
  unint64_t result;

  result = qword_255FA1418;
  if (!qword_255FA1418)
  {
    type metadata accessor for HKDisplayTypeChartStyle(255);
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255FA1418);
  }
  return result;
}

uint64_t sub_2321DAF88(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v24;

  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, a3);
  v10 = objc_msgSend(v9, sel_profile);
  v11 = objc_msgSend(v10, sel_displayTypeController);

  if (v11)
  {
    v12 = objc_msgSend(v11, sel_displayTypeForObjectType_, a1);
    if (v12)
    {
      v13 = v12;
      v14 = objc_msgSend(a2, sel__unit);
      v15 = objc_msgSend(v13, sel_hk_valueFormatterForUnit_, v14);

      v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A918]), sel_initWithDisplayType_unitPreferenceController_, v13, a5);
      objc_msgSend(a2, sel__value);
      v17 = (void *)sub_23220108C();
      v18 = objc_msgSend(v15, sel_stringFromValue_displayType_unitController_, v17, v13, a5);

      if (v18)
      {
        v19 = sub_232200EC4();

        objc_msgSend(a2, sel__value);
        v20 = (void *)sub_23220108C();
        v21 = objc_msgSend(v16, sel_stringFromNumber_displayType_unitController_, v20, 0, 0);

        if (v21)
        {
          v24 = v19;
          v22 = sub_232200EC4();

          swift_bridgeObjectRelease();
          objc_msgSend(a2, sel__value);
          if ((a4 & 1) != 0)
            v22 = v24;
          goto LABEL_10;
        }
        swift_bridgeObjectRelease();
      }
      v22 = 0;
LABEL_10:

      v9 = v15;
      goto LABEL_11;
    }
  }
  v22 = 0;
  v16 = v11;
LABEL_11:

  return v22;
}

void sub_2321DB220(uint64_t *a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t);
  id v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  id v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  os_log_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  os_log_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ObjectType;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v2 = v1;
  v63 = a1;
  ObjectType = swift_getObjectType();
  v3 = sub_23220039C();
  v60 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v62 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2321FEAAC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v64 = (uint64_t)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v65 = (uint64_t)&v53 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v53 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v58 = (uint64_t)&v53 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v53 - v19;
  v21 = (uint64_t)v2 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel;
  swift_beginAccess();
  v66 = v21;
  sub_2321DEADC(v21, (uint64_t)v20);
  v22 = sub_2321FF094();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  if (v24(v20, 1, v22) == 1)
  {
    __break(1u);
    goto LABEL_14;
  }
  sub_2321FF04C();
  v25 = *(void (**)(char *, uint64_t))(v23 + 8);
  v25(v20, v22);
  v26 = (id)sub_2321FEA88();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v26)
  {
    v27 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v24;
    v28 = v66;
    goto LABEL_9;
  }
  v57 = v5;
  v29 = v62;
  sub_23220033C();
  v30 = v2;
  v31 = sub_232200390();
  v32 = sub_2322012E4();
  v27 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v24;
  if (!os_log_type_enabled(v31, (os_log_type_t)v32))
  {

    (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v61);
    v28 = v66;
    goto LABEL_8;
  }
  v54 = v32;
  v55 = v31;
  v56 = v30;
  v33 = swift_slowAlloc();
  v53 = swift_slowAlloc();
  v68 = v53;
  *(_DWORD *)v33 = 136446466;
  v34 = sub_232201BF0();
  v67 = sub_232013174(v34, v35, &v68);
  sub_232201710();
  swift_bridgeObjectRelease();
  *(_WORD *)(v33 + 12) = 2080;
  v28 = v66;
  v36 = v58;
  sub_2321DEADC(v66, v58);
  if (v24((char *)v36, 1, v22) != 1)
  {
    sub_2321FF04C();
    v25((char *)v36, v22);
    v37 = sub_232200F00();
    v67 = sub_232013174(v37, v38, &v68);
    sub_232201710();
    v39 = v56;

    swift_bridgeObjectRelease();
    v40 = v55;
    _os_log_impl(&dword_231FFB000, v55, (os_log_type_t)v54, "[%{public}s] Can not access data model image: %s", (uint8_t *)v33, 0x16u);
    v41 = v53;
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v41, -1, -1);
    MEMORY[0x2348FF468](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v61);
LABEL_8:
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
LABEL_9:
    sub_2321DEADC(v28, (uint64_t)v16);
    if (v27((uint64_t)v16, 1, v22) != 1)
    {
      v42 = sub_2321FF01C();
      v44 = v43;
      v25(v16, v22);
      v45 = v65;
      sub_2321DEADC(v28, v65);
      if (v27(v45, 1, v22) != 1)
      {
        v46 = v27;
        v47 = sub_2321FF040();
        v25((char *)v45, v22);
        v48 = v64;
        sub_2321DEADC(v28, v64);
        if (v46(v48, 1, v22) != 1)
        {
          v49 = sub_2321FF034();
          v51 = v50;
          v25((char *)v48, v22);
          v52 = v63;
          *v63 = v42;
          v52[1] = v44;
          v52[2] = (uint64_t)v26;
          v52[3] = v47;
          v52[4] = v49;
          v52[5] = v51;
          return;
        }
        goto LABEL_16;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:

  __break(1u);
}

void sub_2321DB744()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  id v38;
  id v39;
  uint64_t v40;
  _BYTE v41[16];
  __int128 v42;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_23220039C();
  v35 = *(_QWORD *)(v2 - 8);
  v36 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v33 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - v5;
  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - v8;
  v10 = &v0[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context];
  swift_beginAccess();
  sub_2321DE9A8((uint64_t)v10, (uint64_t)&v37);
  v11 = v39;
  sub_2320254AC((uint64_t)&v37, &qword_255FA1490, &qword_255FA1498);
  if (v11)
  {
    v34 = v9;
    v12 = *((_QWORD *)v10 + 3);
    if (!v12)
    {
      __break(1u);
      return;
    }
    v13 = sub_232016AD8(v10, *((_QWORD *)v10 + 3));
    v14 = *(_QWORD *)(v12 - 8);
    MEMORY[0x24BDAC7A8](v13);
    v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v14 + 16))(v16);
    v17 = sub_2321FF4FC();
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
    v20 = (uint64_t)v34;
    if (v19 >> 60 != 15)
    {
      sub_2320169E4(v17, v19);
      sub_2321FF058();
      v30 = sub_2321FF094();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v20, 0, 1, v30);
      v31 = (uint64_t)v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel;
      swift_beginAccess();
      sub_2321DEA04(v20, v31);
      swift_endAccess();
      v32 = sub_2321DBDA0();
      sub_2321DB220((uint64_t *)&v37);
      sub_2321B6788((uint64_t *)&v37);
      sub_23201602C(v17, v19);
      v42 = v37;
      sub_2321DEA58((uint64_t)&v42);

      sub_23212A148((uint64_t)&v40, (uint64_t)v41);
      sub_2321DEA58((uint64_t)v41);

      return;
    }
  }
  sub_23220033C();
  v21 = v1;
  v22 = sub_232200390();
  v23 = sub_2322012E4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_QWORD *)&v42 = v25;
    *(_DWORD *)v24 = 136446466;
    v26 = sub_232201BF0();
    *(_QWORD *)&v37 = sub_232013174(v26, v27, (uint64_t *)&v42);
    sub_232201710();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    sub_2321DE9A8((uint64_t)v10, (uint64_t)&v37);
    sub_2320254E8(0, &qword_255FA1490, &qword_255FA1498);
    v28 = sub_232200F00();
    *(_QWORD *)&v37 = sub_232013174(v28, v29, (uint64_t *)&v42);
    sub_232201710();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231FFB000, v22, v23, "[%{public}s] Can not access user data: %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v25, -1, -1);
    MEMORY[0x2348FF468](v24, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v36);
}

id sub_2321DBDA0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  __int128 v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[16];
  __int128 v22;

  v1 = OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView);
  }
  else
  {
    v4 = v0;
    sub_2321DB220((uint64_t *)&v18);
    v5 = (objc_class *)type metadata accessor for SummaryAlertTileView();
    v6 = (char *)objc_allocWithZone(v5);
    v22 = v18;
    v7 = v19;
    sub_23212A148((uint64_t)&v20, (uint64_t)v21);
    v8 = &v6[qword_255FA0988];
    v9 = v18;
    v10 = v20;
    *((_OWORD *)v8 + 1) = v19;
    *((_OWORD *)v8 + 2) = v10;
    *(_OWORD *)v8 = v9;
    sub_23212A1F0((uint64_t)&v22);
    v11 = (id)v7;
    v12 = *((id *)&v7 + 1);
    sub_23212A1F0((uint64_t)v21);
    v17.receiver = v6;
    v17.super_class = v5;
    v13 = objc_msgSendSuper2(&v17, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    sub_2321B6788((uint64_t *)&v18);
    sub_2321DEA58((uint64_t)&v22);

    sub_2321DEA58((uint64_t)v21);
    objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v14 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v13;
    v3 = v13;

    v2 = 0;
  }
  v15 = v2;
  return v3;
}

void (*sub_2321DBEF0(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_2321DBDA0();
  return sub_2321DBF24;
}

void sub_2321DBF24(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView) = v2;

}

uint64_t sub_2321DBF3C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_23220039C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23220033C();
  v6 = sub_232200390();
  v7 = sub_2322012FC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v18 = v2;
    v9 = (uint8_t *)v8;
    v10 = swift_slowAlloc();
    v20 = v10;
    *(_DWORD *)v9 = 136446210;
    v11 = sub_232201BF0();
    v19 = sub_232013174(v11, v12, &v20);
    sub_232201710();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231FFB000, v6, v7, "%{public}s loaded", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v10, -1, -1);
    MEMORY[0x2348FF468](v9, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v13 = (objc_class *)type metadata accessor for SummaryAlertTileViewController();
  v21.receiver = v1;
  v21.super_class = v13;
  objc_msgSendSuper2(&v21, sel_viewDidLoad);
  sub_2321DC454();
  v14 = sub_2321DBDA0();
  v15 = (void *)sub_2321FECE0();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_2321FF250();

  return swift_release();
}

void sub_2321DC170(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;

  v2 = sub_2321FED10();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_255FA14A8, (void (*)(uint64_t))MEMORY[0x24BE43170]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - v7;
  v9 = sub_2321FEF98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v13 = MEMORY[0x2348FF510](a1 + 16);
  if (v13)
  {
    v14 = (void *)v13;
    sub_2321DCA0C();
    if (v15)
    {
      v16 = v15;
      v28 = v3;
      MEMORY[0x2348FE574]();
      v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
      v18 = v9;
      v27 = v9;
      v19 = v5;
      v20 = v2;
      if (v17 == 1)
      {
        (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BE43158], v18);
        sub_23200040C((uint64_t)v8, &qword_255FA14A8, (void (*)(uint64_t))MEMORY[0x24BE43170]);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v18);
      }
      sub_2321FEF8C();
      v21 = (id)HKStringFromProfileType();
      v22 = sub_232200EC4();
      v24 = v23;

      *(_QWORD *)&v29[0] = v22;
      *((_QWORD *)&v29[0] + 1) = v24;
      sub_232200F48();
      sub_2321FED28();
      v25 = v16;
      v26 = v28;
      (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v19, *MEMORY[0x24BE42088], v20);
      v30 = 0;
      memset(v29, 0, sizeof(v29));
      sub_2321FED1C();
      swift_bridgeObjectRelease();

      sub_2320254AC((uint64_t)v29, &qword_255FA14B0, &qword_255FA14B8);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v20);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v27);
    }

  }
}

void sub_2321DC454()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;

  v1 = objc_msgSend(v0, sel_view);
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = v1;
  v3 = sub_2321DBDA0();
  objc_msgSend(v2, sel_addSubview_, v3);

  sub_232000608(0, (unint64_t *)&qword_2541B78C8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2322170A0;
  v5 = sub_2321DBDA0();
  v6 = objc_msgSend(v5, sel_topAnchor);

  v7 = objc_msgSend(v0, sel_view);
  if (!v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, sel_topAnchor);

  v10 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v9);
  *(_QWORD *)(v4 + 32) = v10;
  v11 = sub_2321DBDA0();
  v12 = objc_msgSend(v11, sel_bottomAnchor);

  v13 = objc_msgSend(v0, sel_view);
  if (!v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_bottomAnchor);

  v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v4 + 40) = v16;
  v17 = sub_2321DBDA0();
  v18 = objc_msgSend(v17, sel_leadingAnchor);

  v19 = objc_msgSend(v0, sel_view);
  if (!v19)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, sel_leadingAnchor);

  v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(_QWORD *)(v4 + 48) = v22;
  v23 = sub_2321DBDA0();
  v24 = objc_msgSend(v23, sel_trailingAnchor);

  v25 = objc_msgSend(v0, sel_view);
  if (v25)
  {
    v26 = v25;
    v27 = (void *)objc_opt_self();
    v28 = objc_msgSend(v26, sel_trailingAnchor);

    v29 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v28);
    *(_QWORD *)(v4 + 56) = v29;
    sub_232201050();
    sub_232003E9C(0, qword_255FA14C0);
    v30 = (id)sub_232201020();
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_activateConstraints_, v30);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_2321DC794()
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
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;

  v0 = sub_2321FED10();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_255FA14A8, (void (*)(uint64_t))MEMORY[0x24BE43170]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - v5;
  v7 = sub_2321FEF98();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321DCA0C();
  if (v11)
  {
    v12 = v11;
    v21 = v1;
    MEMORY[0x2348FE574]();
    v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    v20 = v7;
    v14 = v0;
    if (v13 == 1)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE43158], v7);
      sub_23200040C((uint64_t)v6, &qword_255FA14A8, (void (*)(uint64_t))MEMORY[0x24BE43170]);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    }
    sub_2321FEF8C();
    v15 = (id)HKStringFromProfileType();
    v16 = sub_232200EC4();
    v18 = v17;

    *(_QWORD *)&v22[0] = v16;
    *((_QWORD *)&v22[0] + 1) = v18;
    sub_232200F48();
    sub_2321FED28();
    v19 = v21;
    (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v3, *MEMORY[0x24BE42088], v14);
    v23 = 0;
    memset(v22, 0, sizeof(v22));
    sub_2321FED1C();
    swift_bridgeObjectRelease();

    sub_2320254AC((uint64_t)v22, &qword_255FA14B0, &qword_255FA14B8);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v14);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v20);
  }
}

void sub_2321DCA0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
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
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  void *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  _QWORD v51[8];
  int v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  _QWORD v60[3];
  _QWORD *v61;
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = sub_23220039C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)sub_2321FF40C();
  v8 = *(v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v57 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v51[4] = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v51 - v13;
  v56 = sub_2321FEFF8();
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v59 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_2541B0ED8, (void (*)(uint64_t))MEMORY[0x24BE42678]);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v51 - v17;
  v58 = v1;
  v19 = (_QWORD *)(v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context);
  swift_beginAccess();
  sub_2321DE9A8((uint64_t)v19, (uint64_t)&v64);
  v20 = v65;
  if (!v65)
  {
    __break(1u);
    goto LABEL_8;
  }
  v53 = v8;
  v54 = v7;
  v51[3] = ObjectType;
  v51[7] = v6;
  v51[5] = v4;
  v51[6] = v3;
  v21 = sub_232016AD8(&v64, v65);
  v7 = v51;
  v22 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v24);
  v25 = (void *)sub_2321FF4D8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v20);
  v26 = objc_msgSend(v25, sel_profileIdentifier);

  sub_2321DE9A8((uint64_t)v19, (uint64_t)v62);
  v27 = v63;
  if (!v63)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v28 = sub_232016AD8(v62, v63);
  v29 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)v51 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v31);
  sub_2321FF4E4();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v27);
  v32 = sub_2321FEDA0();
  v33 = (void (*)(uint64_t))MEMORY[0x24BE42678];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v18, 0, 1, v32);
  v52 = sub_2321FEE54();

  sub_23200040C((uint64_t)v18, &qword_2541B0ED8, v33);
  sub_232016AFC((uint64_t)v62);
  sub_232016AFC((uint64_t)&v64);
  sub_2321FEFEC();
  v34 = v58 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel;
  swift_beginAccess();
  sub_2321DEADC(v34, (uint64_t)v14);
  v35 = sub_2321FF094();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
  if (v37(v14, 1, v35) == 1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v51[2] = v37;
  v38 = (void *)sub_2321FF07C();
  v39 = *(void (**)(char *, uint64_t))(v36 + 8);
  v39(v14, v35);
  sub_2322013EC();
  sub_2321DE9A8((uint64_t)v19, (uint64_t)v62);
  v40 = v63;
  if (!v63)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v51[1] = v39;
  v41 = sub_232016AD8(v62, v63);
  v7 = v51;
  v42 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)v51 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v42 + 16))(v44);
  sub_2321FF4D8();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v40);
  sub_2321DE9A8((uint64_t)v19, (uint64_t)v60);
  v19 = v61;
  if (v61)
  {
    v45 = sub_232016AD8(v60, (uint64_t)v61);
    v46 = *(v19 - 1);
    MEMORY[0x24BDAC7A8](v45);
    v48 = (char *)v51 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v46 + 16))(v48);
    sub_2321FF4F0();
    (*(void (**)(char *, _QWORD *))(v46 + 8))(v48, v19);
    v49 = v57;
    sub_2321FF3E8();
    sub_232016AFC((uint64_t)v60);
    sub_232016AFC((uint64_t)v62);
    v50 = v59;
    sub_2321FEFE0();

    (*(void (**)(char *, _QWORD *))(v53 + 8))(v49, v54);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v50, v56);
    return;
  }
LABEL_11:
  __break(1u);

  __break(1u);
}

id sub_2321DD370(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  objc_super v12;

  v6 = &v3[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel];
  v7 = sub_2321FF094();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = &v3[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context];
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dismissalStateCancellable] = 0;
  if (a2)
  {
    v9 = (void *)sub_232200E94();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for SummaryAlertTileViewController();
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

id sub_2321DD4C0(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;
  objc_super v8;

  v3 = &v1[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel];
  v4 = sub_2321FF094();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = &v1[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dismissalStateCancellable] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for SummaryAlertTileViewController();
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

id sub_2321DD59C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummaryAlertTileViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2321DD650()
{
  return type metadata accessor for SummaryAlertTileViewController();
}

uint64_t type metadata accessor for SummaryAlertTileViewController()
{
  uint64_t result;

  result = qword_255FA1458;
  if (!qword_255FA1458)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2321DD694()
{
  unint64_t v0;

  sub_2320002B4(319, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_2321DD724@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context;
  swift_beginAccess();
  return sub_2321DE9A8(v3, a1);
}

uint64_t sub_2321DD774(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context;
  swift_beginAccess();
  sub_2321DEA80(a1, v3);
  swift_endAccess();
  sub_2321DB744();
  return sub_2320254AC(a1, &qword_255FA1490, &qword_255FA1498);
}

void (*sub_2321DD7F8(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2321DD840;
}

void sub_2321DD840(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_2321DB744();
}

id sub_2321DD870@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_2321DBDA0();
  *a1 = result;
  return result;
}

void sub_2321DD898(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v3 = *(void **)(*v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView);
  *(_QWORD *)(*v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView) = v2;

}

uint64_t (*sub_2321DD8B4(id **a1))()
{
  id *v2;

  v2 = (id *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2321DBEF0(v2);
  return sub_2320E5D7C;
}

uint64_t sub_2321DD90C(uint64_t a1)
{
  MEMORY[0x2348FF39C](&unk_232219F28, a1);
  return sub_2321FF7B4();
}

uint64_t sub_2321DD940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2348FF39C](&unk_232219F28, a3);
  return sub_2321FF7C0();
}

uint64_t (*sub_2321DD98C(_QWORD *a1, uint64_t a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  MEMORY[0x2348FF39C](&unk_232219F28, a2);
  v4[4] = sub_2321FF7A8();
  return sub_2320E5D7C;
}

uint64_t sub_2321DD9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2348FF39C](&unk_232219F28, a3);
  return sub_2321FF7CC();
}

void sub_2321DDA44()
{
  sub_2321DC794();
}

uint64_t sub_2321DDACC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v1 = v0;
  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v25 - v6;
  v8 = (uint64_t)v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel;
  swift_beginAccess();
  sub_2321DEADC(v8, (uint64_t)v7);
  v9 = sub_2321FF094();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  result = v11(v7, 1, v9);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v13 = sub_2321FF028();
    v15 = v14;
    v16 = *(void (**)(char *, uint64_t))(v10 + 8);
    v16(v7, v9);
    if (v15)
      return v13;
    v17 = objc_msgSend(v1, sel_resolvedHealthStore);
    v18 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, v17);
    if (!v18)
    {

      return 0;
    }
    v19 = v18;
    sub_2321DEADC(v8, (uint64_t)v5);
    result = v11(v5, 1, v9);
    if ((_DWORD)result != 1)
    {
      v20 = v19;
      v21 = (void *)sub_2321FF07C();
      v16(v5, v9);
      v22 = objc_msgSend(v20, sel_displayTypeForObjectType_, v21);

      if (v22)
      {
        v23 = objc_msgSend(v22, sel_localization);

        v24 = objc_msgSend(v23, sel_displayName);
        v13 = sub_232200EC4();

        return v13;
      }
      return 0;
    }
  }
  __break(1u);
  return result;
}

id sub_2321DDD20(uint64_t a1, uint64_t a2)
{
  return sub_2321DDD38(a1, a2, (SEL *)&selRef_hk_alertHeaderBackgroundColor);
}

id sub_2321DDD2C(uint64_t a1, uint64_t a2)
{
  return sub_2321DDD38(a1, a2, (SEL *)&selRef_hk_alertHeaderForegroundColor);
}

id sub_2321DDD38(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend((id)objc_opt_self(), *a3);
}

uint64_t sub_2321DDD6C(uint64_t a1)
{
  MEMORY[0x2348FF39C](&unk_232219E00, a1);
  return sub_2321FF5C8();
}

uint64_t sub_2321DDDB4()
{
  id v0;
  uint64_t v1;

  sub_232003E9C(0, &qword_2541B0D60);
  v0 = (id)*MEMORY[0x24BEBE1D0];
  v1 = sub_232201668();

  return v1;
}

uint64_t sub_2321DDE2C()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_title);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_232200EC4();

  return v3;
}

uint64_t sub_2321DDE90@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - v4;
  v6 = *v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel;
  swift_beginAccess();
  sub_2321DEADC(v6, (uint64_t)v5);
  v7 = sub_2321FF094();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_2321DEB30();
    v11 = a1 + *(int *)(v10 + 48);
    sub_2321FF088();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    v12 = *MEMORY[0x24BE43120];
    v13 = sub_2321FEF74();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);
    v14 = *MEMORY[0x24BE43130];
    v15 = sub_2321FEF80();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(a1, v14, v15);
  }
  return result;
}

uint64_t sub_2321DDFE8(uint64_t a1)
{
  MEMORY[0x2348FF39C](&unk_232219E00, a1);
  MEMORY[0x2348FF39C](&unk_232219F80, a1);
  return sub_2321FF5BC() & 1;
}

uint64_t sub_2321DE048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ObjectType;
  _QWORD v40[3];
  uint64_t v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v1 = v0;
  ObjectType = swift_getObjectType();
  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v38 - v3;
  v5 = v0 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context;
  swift_beginAccess();
  result = sub_2321DE9A8(v5, (uint64_t)v40);
  v7 = v41;
  if (!v41)
  {
    __break(1u);
    goto LABEL_6;
  }
  v8 = sub_232016AD8(v40, v41);
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  v12 = (void *)sub_2321FF4D8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  sub_2321FD7F8();
  swift_allocObject();
  v14 = sub_2321FD7EC();
  sub_2321FD81C();
  swift_allocObject();
  v15 = sub_2321FD810();
  v16 = objc_allocWithZone(MEMORY[0x24BDD3B20]);
  v17 = v12;
  v18 = (void *)sub_232200E94();
  v19 = objc_msgSend(v16, sel_initWithProtectionCategory_domain_healthStore_, 0, v18, v13);

  v42 = v17;
  v43 = 0;
  v38 = v14;
  v44 = v14;
  v20 = v15;
  v21 = v19;
  v45 = v20;
  v46 = v19;
  sub_232016AFC((uint64_t)v40);
  v22 = v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel;
  swift_beginAccess();
  sub_2321DEADC(v22, (uint64_t)v4);
  v23 = sub_2321FF094();
  v24 = *(_QWORD *)(v23 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v4, 1, v23);
  if ((_DWORD)result == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v25 = (void *)sub_2321FF07C();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v23);
  result = sub_2321DE9A8(v5, (uint64_t)v40);
  v26 = v41;
  if (v41)
  {
    v27 = sub_232016AD8(v40, v41);
    v28 = *(_QWORD *)(v26 - 8);
    MEMORY[0x24BDAC7A8](v27);
    v30 = (char *)&v38 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v28 + 16))(v30);
    v31 = (void *)sub_2321FF4D8();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v26);
    v32 = (void *)sub_2322011C4();

    v33 = sub_2321D5890(v25);
    v35 = v34;

    sub_232016AFC((uint64_t)v40);
    v40[0] = sub_2320FE5CC();
    v36 = (_QWORD *)swift_allocObject();
    v36[2] = v33;
    v36[3] = v35;
    v36[4] = ObjectType;
    sub_232048D04();
    sub_232000590((unint64_t *)&qword_2541AF300, (uint64_t (*)(uint64_t))sub_232048D04, MEMORY[0x24BDB9AF8]);
    v37 = sub_2322007C8();
    swift_release();
    swift_release();
    *(_QWORD *)(v1 + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dismissalStateCancellable) = v37;

    swift_release();
    swift_release();

    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2321DE474(void **a1, uint64_t a2, unint64_t a3)
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
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = sub_23220039C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v36 - v11;
  v13 = *a1;
  if (v13)
  {
    v14 = v13;
    sub_23220033C();
    swift_bridgeObjectRetain();
    v15 = v13;
    swift_bridgeObjectRetain();
    v16 = v13;
    v17 = sub_232200390();
    v18 = sub_2322012E4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v41 = v37;
      *(_DWORD *)v19 = 136446723;
      v39 = v7;
      v20 = sub_232201BF0();
      v40 = sub_232013174(v20, v21, &v41);
      v38 = v6;
      sub_232201710();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2081;
      swift_bridgeObjectRetain();
      v40 = sub_232013174(a2, a3, &v41);
      sub_232201710();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 22) = 2082;
      v40 = (uint64_t)v13;
      v22 = v13;
      sub_232016A8C(0, (unint64_t *)&qword_2541B78D0);
      v23 = sub_232200F0C();
      v40 = sub_232013174(v23, v24, &v41);
      sub_232201710();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_231FFB000, v17, v18, "%{public}s Could not save dismissal state for %{private}s. Error: %{public}s", (uint8_t *)v19, 0x20u);
      v25 = v37;
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v25, -1, -1);
      MEMORY[0x2348FF468](v19, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v10, v38);
    }

    swift_bridgeObjectRelease_n();
    v34 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    v35 = v10;
  }
  else
  {
    sub_23220033C();
    swift_bridgeObjectRetain_n();
    v27 = sub_232200390();
    v28 = sub_2322012FC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v41 = v30;
      *(_DWORD *)v29 = 136446467;
      v38 = a2;
      v31 = sub_232201BF0();
      v33 = sub_232013174(v31, v32, &v41);
      v39 = v7;
      v40 = v33;
      sub_232201710();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2081;
      swift_bridgeObjectRetain();
      v40 = sub_232013174(v38, a3, &v41);
      sub_232201710();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231FFB000, v27, v28, "%{public}s Saved dismissal state for %{private}s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v30, -1, -1);
      MEMORY[0x2348FF468](v29, -1, -1);

      v34 = *(uint64_t (**)(char *, uint64_t))(v39 + 8);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v34 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    }
    v35 = v12;
  }
  return v34(v35, v6);
}

uint64_t sub_2321DE8EC()
{
  return sub_232000590(&qword_255FA1470, (uint64_t (*)(uint64_t))type metadata accessor for SummaryAlertTileViewController, (uint64_t)&unk_232219DB0);
}

uint64_t sub_2321DE918()
{
  return sub_232000590(&qword_255FA1478, (uint64_t (*)(uint64_t))type metadata accessor for SummaryAlertTileViewController, (uint64_t)&unk_232219EB0);
}

uint64_t sub_2321DE944()
{
  return sub_232000590(&qword_255FA1480, (uint64_t (*)(uint64_t))type metadata accessor for SummaryAlertTileViewController, (uint64_t)&unk_232219E88);
}

uint64_t sub_2321DE970()
{
  return MEMORY[0x24BE42038];
}

uint64_t sub_2321DE97C()
{
  return sub_232000590(&qword_255FA1488, (uint64_t (*)(uint64_t))type metadata accessor for SummaryAlertTileViewController, (uint64_t)&unk_232219EE8);
}

uint64_t sub_2321DE9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2320254E8(0, &qword_255FA1490, &qword_255FA1498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2321DEA04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2321DEA58(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2321DEA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2320254E8(0, &qword_255FA1490, &qword_255FA1498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2321DEADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2320002B4(0, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2321DEB30()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255FA14A0)
  {
    sub_2321FDC6C();
    sub_2321FEF74();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255FA14A0);
  }
}

uint64_t sub_2321DEBA0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2321DEBC4(void **a1)
{
  uint64_t v1;

  return sub_2321DE474(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2321DEBD0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2321DEBF4()
{
  uint64_t v0;

  sub_2321DC170(v0);
}

uint64_t sub_2321DEBFC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321DEC08(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_2321E1338(a1, a2, a3, type metadata accessor for SnidgetFeedItemGeneratorRequest);
}

uint64_t sub_2321DEC14()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2321DEC20(char *a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_2321E13CC(a1, a2, a3, a4, type metadata accessor for SnidgetFeedItemGeneratorRequest);
}

uint64_t type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider(uint64_t a1)
{
  return sub_23201A14C(a1, qword_2541B2680);
}

uint64_t sub_2321DEC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321E1458(a1, a2, a3, MEMORY[0x24BEE0150] + 64, type metadata accessor for SnidgetFeedItemGeneratorRequest);
}

uint64_t sub_2321DEC58()
{
  return sub_232000590(&qword_2541B7328, MEMORY[0x24BE4B610], MEMORY[0x24BE4B608]);
}

uint64_t sub_2321DEC84()
{
  return sub_232000590(&qword_2541B2AC0, MEMORY[0x24BE4B638], MEMORY[0x24BE4B5D8]);
}

uint64_t sub_2321DECB0(uint64_t a1, char a2)
{
  void *v2;
  void *v5;
  id v6;
  uint64_t v7;

  if (objc_msgSend(v2, sel__isStandalonePhoneSummary))
  {
    if ((a1 != 1) | a2 & 1)
    {
      if (qword_2541B7488 != -1)
        swift_once();
    }
    else if (qword_2541B7488 != -1)
    {
      swift_once();
    }
  }
  else if ((a1 != 1) | a2 & 1)
  {
    if (qword_2541B7488 != -1)
      swift_once();
  }
  else if (qword_2541B7488 != -1)
  {
    swift_once();
  }
  sub_2321FDA14();
  v5 = (void *)sub_2322001D4();
  v6 = objc_msgSend((id)objc_opt_self(), sel_labelColor, 0xE000000000000000);
  v7 = sub_232201464();
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t sub_2321DEEB0()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 2);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  if (qword_2541B7488 != -1)
    swift_once();
  sub_2321FDA14();
  sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_232210D40;
  v2 = (void *)sub_2321FDBF4();
  v3 = objc_msgSend(v0, sel_stringFromDate_, v2, 0xE000000000000000);

  v4 = sub_232200EC4();
  v6 = v5;

  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v1 + 64) = sub_2320168D8();
  *(_QWORD *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = v6;
  sub_232200EA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2322001E0();
  v8 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v9 = sub_232201464();

  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2321DF0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  sub_232044250();
  if ((sub_2322016A4() & 1) != 0)
    return sub_232043CD8(v2, v3);
  else
    return 0;
}

void sub_2321DF134(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id *v3;
  void *v4;
  id *v5;
  uint64_t (*v8)(uint64_t, uint64_t);
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
  _BYTE *v19;
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
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t *v74;
  void *v75;
  uint64_t *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  _BYTE *v82;
  void **v83;
  uint64_t *v84;
  void *v85;
  uint64_t *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  _BYTE *v91;
  uint64_t *v92;
  void *v93;
  uint64_t *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _BYTE *v99;
  _BYTE *v100;
  id v101;
  id v102;
  id v103;
  unsigned int v104;
  void *v105;
  id v106;
  _BYTE *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(_BYTE *, _BYTE *, uint64_t);
  uint64_t (*v117)(uint64_t);
  id v118;
  _BYTE *v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _BYTE *v130;
  void (*v131)(_BYTE *, uint64_t);
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  _BYTE v135[4];
  unsigned int v136;
  uint64_t v137;
  unsigned int v138;
  uint64_t *v139;
  void **v140;
  id v141;
  void (*v142)(_BYTE *, uint64_t, uint64_t, uint64_t);
  id v143;
  uint64_t v144;
  _QWORD *v145;
  _BYTE *v146;
  _BYTE *v147;
  _BYTE *v148;
  _BYTE *v149;
  _BYTE *v150;
  _BYTE *v151;
  _BYTE *v152;
  _BYTE *v153;
  _BYTE *v154;
  _BYTE *v155;
  _QWORD *v156;
  _BYTE *v157;
  _BYTE *v158;
  _BYTE *v159;
  _BYTE *v160;
  _BYTE *v161;
  _BYTE *v162;
  _BYTE *v163;
  _BYTE *v164;
  uint64_t v165;
  _BYTE *v166;
  uint64_t v167;
  _BYTE *v168;
  uint64_t v169;
  uint64_t v170;
  _BYTE *v171;

  v5 = v3;
  v167 = a2;
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v171 = &v135[-v10];
  sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], v8);
  MEMORY[0x24BDAC7A8](v11);
  v168 = &v135[-v12];
  v13 = type metadata accessor for SnidgetFeedItemMetadata(0);
  MEMORY[0x24BDAC7A8](v13);
  v152 = &v135[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_232121470();
  MEMORY[0x24BDAC7A8](v15);
  v166 = &v135[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2320057B8(0, &qword_2541B2930, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FE0], v8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = &v135[-v18];
  v145 = (_QWORD *)sub_2321FDC6C();
  v144 = *(v145 - 1);
  MEMORY[0x24BDAC7A8](v145);
  v153 = &v135[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2320057B8(0, (unint64_t *)&qword_2541B2838, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], v8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v150 = &v135[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = MEMORY[0x24BDAC7A8](v22);
  v151 = &v135[-v25];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v149 = &v135[-v27];
  v28 = MEMORY[0x24BDAC7A8](v26);
  v155 = &v135[-v29];
  v30 = MEMORY[0x24BDAC7A8](v28);
  v157 = &v135[-v31];
  v32 = MEMORY[0x24BDAC7A8](v30);
  v158 = &v135[-v33];
  v34 = MEMORY[0x24BDAC7A8](v32);
  v159 = &v135[-v35];
  MEMORY[0x24BDAC7A8](v34);
  v160 = &v135[-v36];
  v165 = sub_2321FD9F0();
  v156 = *(_QWORD **)(v165 - 8);
  v37 = MEMORY[0x24BDAC7A8](v165);
  v147 = &v135[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v39 = MEMORY[0x24BDAC7A8](v37);
  v148 = &v135[-v40];
  v41 = MEMORY[0x24BDAC7A8](v39);
  v146 = &v135[-v42];
  v43 = MEMORY[0x24BDAC7A8](v41);
  v154 = &v135[-v44];
  v45 = MEMORY[0x24BDAC7A8](v43);
  v161 = &v135[-v46];
  v47 = MEMORY[0x24BDAC7A8](v45);
  v162 = &v135[-v48];
  v49 = MEMORY[0x24BDAC7A8](v47);
  v163 = &v135[-v50];
  MEMORY[0x24BDAC7A8](v49);
  v164 = &v135[-v51];
  v52 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, *v5);
  if (v52)
  {
    v53 = v52;
    v54 = objc_msgSend((id)objc_opt_self(), sel_activitySummaryType);
    v55 = objc_msgSend(v53, sel_displayTypeForObjectType_, v54);

    if (v55)
    {
      sub_232084944(a1);
      if (v4)
      {

LABEL_5:
        v57 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider(0);
        v58 = sub_232131F00(*(id *)((char *)v5 + *(int *)(v57 + 20) + 16));
        v169 = v167;
        swift_bridgeObjectRetain();
        sub_23209D274(v58);
        v59 = v169;
        sub_2321FF208();
        v60 = sub_2321FEF5C();
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v19, 1, 1, v60);
        v61 = v55;
        sub_2321FF1FC();
        v62 = sub_2321FFC28();
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 56))(v166, 1, 1, v62);
        sub_2321FFF7C();
        swift_allocObject();
        v63 = sub_2321FFF70();
        v64 = sub_2321FE65C();
        v65 = (uint64_t)v168;
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v168, 1, 1, v64);
        v66 = sub_2321FD8B8();
        v67 = (uint64_t)v171;
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v171, 1, 1, v66);
        v68 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(0);
        sub_2320D71E8(0, v65, v59, v67, (_BYTE *)a3 + *(int *)(v68 + 20));

        *a3 = v63;
        return;
      }
      v70 = v56;
      if (!v56)
        goto LABEL_5;
      v71 = HKCodableSummaryActivityRingsValue.activitySummary.getter();
      if (!v71)
      {

        goto LABEL_5;
      }
      v72 = v71;
      v141 = v70;
      v139 = a3;
      v138 = objc_msgSend(v71, sel__isStandalonePhoneSummary);
      v73 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider(0);
      v170 = v73;
      v74 = sub_2320251BC(&v169);
      sub_23200054C((uint64_t)v5, (uint64_t)v74, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
      v75 = (void *)sub_2322001C8();
      sub_232201434();

      sub_232016AFC((uint64_t)&v169);
      sub_2321FDA08();
      v140 = (void **)v73;
      v170 = v73;
      v76 = sub_2320251BC(&v169);
      sub_23200054C((uint64_t)v5, (uint64_t)v76, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
      v77 = (void *)sub_2322001BC();
      v78 = (void *)sub_2322001EC();
      v79 = objc_msgSend(*v5, sel_viewControllerFactory);
      v143 = v72;
      v80 = (void *)sub_23220141C();

      sub_232016AFC((uint64_t)&v169);
      if (v80)
      {
        v81 = v80;
        v82 = v160;
        sub_2321FDA08();
        v142 = (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v156[7];
        v142(v82, 0, 1, v165);

      }
      else
      {
        v142 = (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v156[7];
        v142(v160, 1, 1, v165);
      }
      v83 = v140;
      v170 = (uint64_t)v140;
      v84 = sub_2320251BC(&v169);
      sub_23200054C((uint64_t)v5, (uint64_t)v84, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
      v85 = (void *)sub_2322001C8();
      sub_23220144C();

      sub_232016AFC((uint64_t)&v169);
      sub_2321FDA08();
      v170 = (uint64_t)v83;
      v86 = sub_2320251BC(&v169);
      sub_23200054C((uint64_t)v5, (uint64_t)v86, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
      v87 = (void *)sub_2322001BC();
      v88 = (void *)sub_2322001EC();
      v89 = (void *)sub_232201428();

      sub_232016AFC((uint64_t)&v169);
      if (v89)
      {
        v90 = v89;
        v91 = v159;
        sub_2321FDA08();
        v142(v91, 0, 1, v165);

      }
      else
      {
        v142(v159, 1, 1, v165);
      }
      v170 = (uint64_t)v83;
      v92 = sub_2320251BC(&v169);
      sub_23200054C((uint64_t)v5, (uint64_t)v92, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
      v93 = (void *)sub_2322001C8();
      objc_msgSend(v55, sel__isWheelchairUser);
      sub_232201458();

      sub_232016AFC((uint64_t)&v169);
      sub_2321FDA08();
      v170 = (uint64_t)v83;
      v94 = sub_2320251BC(&v169);
      sub_23200054C((uint64_t)v5, (uint64_t)v94, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
      v95 = (void *)sub_2322001BC();
      v96 = (void *)sub_2322001EC();
      v97 = (void *)sub_232201440();

      sub_232016AFC((uint64_t)&v169);
      if (v97)
      {
        v98 = v97;
        v99 = v158;
        sub_2321FDA08();
        v142(v99, 0, 1, v165);

      }
      else
      {
        v142(v158, 1, 1, v165);
      }
      v100 = v153;
      v101 = v141;
      if (objc_msgSend(v141, sel_hasHasEverHadAWatch))
        v136 = objc_msgSend(v101, sel_hasEverHadAWatch);
      else
        v136 = 2;
      v102 = objc_msgSend(*v5, sel_profileIdentifier);
      v103 = objc_msgSend(v102, sel_type);

      v140 = (id *)((char *)v5 + *((int *)v140 + 5));
      sub_2321DECB0((uint64_t)v103, *((_BYTE *)v140 + 8));
      sub_2321FDA08();
      v104 = objc_msgSend(v101, sel_hasActivityResumeDate);
      v105 = v101;
      v137 = 0;
      if (v104)
      {
        objc_msgSend(v101, sel_activityResumeDate);
        v106 = (id)HKDecodeDateForValue();
        sub_2321FDC30();

        sub_2321DEEB0();
        v107 = v157;
        sub_2321FDA08();
        (*(void (**)(_BYTE *, _QWORD *))(v144 + 8))(v100, v145);
        v108 = 0;
      }
      else
      {
        v108 = 1;
        v107 = v157;
      }
      v109 = v165;
      ((void (*)(_BYTE *, uint64_t, uint64_t))v142)(v107, v108, 1);
      sub_2321FF208();
      sub_232000448();
      v111 = *(int *)(v110 + 48);
      v145 = v55;
      objc_msgSend(v105, sel_dateData);
      v112 = (id)HKDecodeDateForValue();
      sub_2321FDC30();

      v19[v111] = 0;
      v113 = *MEMORY[0x24BE42FD8];
      v114 = sub_2321FEF5C();
      v115 = *(_QWORD *)(v114 - 8);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v115 + 104))(v19, v113, v114);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v115 + 56))(v19, 0, 1, v114);
      v144 = sub_2321FF1FC();
      v116 = (void (*)(_BYTE *, _BYTE *, uint64_t))v156[2];
      v116(v154, v164, v109);
      v117 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8];
      sub_232016080((uint64_t)v160, (uint64_t)v155, (unint64_t *)&qword_2541B2838, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8]);
      v116(v146, v163, v109);
      sub_232016080((uint64_t)v159, (uint64_t)v149, (unint64_t *)&qword_2541B2838, v117);
      v116(v148, v162, v109);
      sub_232016080((uint64_t)v158, (uint64_t)v151, (unint64_t *)&qword_2541B2838, v117);
      v116(v147, v161, v109);
      sub_232016080((uint64_t)v157, (uint64_t)v150, (unint64_t *)&qword_2541B2838, v117);
      v118 = v143;
      v119 = v166;
      sub_2321FFC10();
      v120 = sub_2321FFC28();
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v120 - 8) + 56))(v119, 0, 1, v120);
      sub_2321FFF7C();
      swift_allocObject();
      v121 = sub_2321FFF70();
      v122 = v141;
      objc_msgSend(v141, sel_dateData);
      v123 = (id)HKDecodeDateForValue();
      sub_2321FDC30();

      v124 = (uint64_t)v168;
      sub_2321FE62C();
      v125 = sub_2321FE65C();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v125 - 8) + 56))(v124, 0, 1, v125);
      v126 = sub_232131F00(v140[2]);
      v169 = v167;
      swift_bridgeObjectRetain();
      sub_23209D274(v126);
      v127 = v169;
      v128 = sub_2321FD8B8();
      v129 = (uint64_t)v171;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v128 - 8) + 56))(v171, 1, 1, v128);
      v130 = v152;
      sub_2320D71E8(1, v124, v127, v129, v152);

      sub_232079A90((uint64_t)v157);
      v131 = (void (*)(_BYTE *, uint64_t))v156[1];
      v132 = v165;
      v131(v161, v165);
      sub_232079A90((uint64_t)v158);
      v131(v162, v132);
      sub_232079A90((uint64_t)v159);
      v131(v163, v132);
      sub_232079A90((uint64_t)v160);
      v131(v164, v132);
      v133 = v139;
      *v139 = v121;
      v134 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(0);
      sub_232104E50((uint64_t)v130, (uint64_t)v133 + *(int *)(v134 + 20));
    }
    else
    {
      sub_232005578();
      swift_allocError();
      *v69 = 1;
      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_2321E0068@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
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
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  id result;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v3 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (uint64_t *)((char *)&v50 - v7);
  v9 = sub_23220039C();
  v51 = *(_QWORD *)(v9 - 8);
  v52 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v50 - v13;
  sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], v11);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v50 - v16;
  sub_232121470();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320057B8(0, &qword_2541B2930, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FE0], v11);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v50 - v22;
  v24 = (char *)v1 + *(int *)(v3 + 20);
  if ((v24[8] & 1) != 0)
  {
    v25 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(0);
    return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a1, 1, 1, v25);
  }
  else
  {
    v50 = a1;
    result = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, *v1);
    if (result)
    {
      v27 = result;
      v28 = objc_msgSend(result, sel_displayTypeForObjectType_, *((_QWORD *)v24 + 2));

      if (v28)
      {
        sub_2321FF208();
        v29 = sub_2321FEF5C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v23, 1, 1, v29);
        v30 = v28;
        sub_2321FF1FC();
        v31 = sub_2321FFC28();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v20, 1, 1, v31);
        sub_2321FFF7C();
        swift_allocObject();
        v32 = sub_2321FFF70();
        v33 = sub_2321FE65C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v17, 1, 1, v33);
        v34 = sub_2321FD8B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v14, 1, 1, v34);
        v35 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(0);
        v36 = v50;
        sub_2320D71E8(0, (uint64_t)v17, MEMORY[0x24BEE4AF8], (uint64_t)v14, (_BYTE *)v50 + *(int *)(v35 + 20));

        *v36 = v32;
        return (id)(*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v36, 0, 1, v35);
      }
      else
      {
        v37 = v53;
        sub_232200318();
        sub_23200054C((uint64_t)v1, (uint64_t)v8, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
        sub_23200054C((uint64_t)v1, (uint64_t)v6, type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider);
        v38 = sub_232200390();
        v39 = sub_2322012E4();
        if (os_log_type_enabled(v38, v39))
        {
          v40 = swift_slowAlloc();
          v41 = swift_slowAlloc();
          v55 = v41;
          *(_DWORD *)v40 = 136315394;
          v42 = sub_232085348(*v8, *((unsigned __int8 *)v8 + *(int *)(v3 + 20) + 8));
          v54 = sub_232013174(v42, v43, &v55);
          sub_232201710();
          swift_bridgeObjectRelease();
          sub_2321E0838((uint64_t)v8);
          *(_WORD *)(v40 + 12) = 2080;
          v44 = objc_msgSend(*(id *)&v6[*(int *)(v3 + 20) + 16], sel_sensitiveLoggingIdentifier);
          v45 = sub_232200EC4();
          v47 = v46;

          v54 = sub_232013174(v45, v47, &v55);
          sub_232201710();
          swift_bridgeObjectRelease();
          sub_2321E0838((uint64_t)v6);
          _os_log_impl(&dword_231FFB000, v38, v39, "[%s]: No display type could be found for %s for error case feedItem", (uint8_t *)v40, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2348FF468](v41, -1, -1);
          MEMORY[0x2348FF468](v40, -1, -1);

          (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v52);
        }
        else
        {
          sub_2321E0838((uint64_t)v8);
          sub_2321E0838((uint64_t)v6);

          (*(void (**)(char *, uint64_t))(v51 + 8))(v37, v52);
        }
        v48 = v50;
        v49 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(0);
        return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v48, 1, 1, v49);
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void *sub_2321E062C@<X0>(void *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v3;
  uint64_t v5;
  id v6;

  v3 = result;
  if ((unint64_t)result >= 2)
  {
    v5 = a2;
    v6 = result;
    result = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    v5 = 0;
  }
  *a3 = v3;
  a3[1] = v5;
  return result;
}

void sub_2321E0678(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2321DF134(*(void **)a1, *(_QWORD *)(a1 + 8), a2);
}

uint64_t sub_2321E0698@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8];
  sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v18 - v7;
  v9 = (uint64_t)a1
     + *(int *)(type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(0) + 20);
  v10 = type metadata accessor for SnidgetFeedItemMetadata(0);
  sub_232016080(v9 + *(int *)(v10 + 20), (uint64_t)v8, qword_2541B78E0, v5);
  sub_2321FFF94();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4B630];
  swift_allocObject();
  v18[1] = sub_2321FFF88();
  sub_232000590(&qword_2541B2AB8, v11, MEMORY[0x24BE4B620]);
  v12 = sub_2321FF0B8();
  v14 = v13;
  result = swift_release();
  if (!v2)
  {
    v16 = *a1;
    sub_2320057B8(0, &qword_2541B3D08, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B5F0], (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for HostingConfigurationContent);
    sub_23200054C(v9, (uint64_t)a2 + *(int *)(v17 + 32), type metadata accessor for SnidgetFeedItemMetadata);
    *a2 = v16;
    a2[1] = v12;
    a2[2] = v14;
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.FeedItemModel(uint64_t a1)
{
  return sub_23201A14C(a1, (uint64_t *)&unk_2541B2670);
}

uint64_t sub_2321E0838(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_2321E0874(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    *((_BYTE *)a1 + v6) = *((_BYTE *)a2 + v6);
    v9 = (int *)type metadata accessor for SnidgetFeedItemMetadata(0);
    v10 = v9[5];
    v11 = &v7[v10];
    v12 = &v8[v10];
    v13 = sub_2321FE65C();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    swift_retain();
    if (v15(v12, 1, v13))
    {
      sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    *(_QWORD *)&v7[v9[6]] = *(_QWORD *)&v8[v9[6]];
    v17 = v9[7];
    v18 = &v7[v17];
    v19 = &v8[v17];
    v20 = sub_2321FD8B8();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    if (v22(v19, 1, v20))
    {
      sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  return v5;
}

uint64_t sub_2321E0A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for SnidgetFeedItemMetadata(0);
  v6 = v4 + *(int *)(v5 + 20);
  v7 = sub_2321FE65C();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v9 = v4 + *(int *)(v5 + 28);
  v10 = sub_2321FD8B8();
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  return result;
}

_QWORD *sub_2321E0B38(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *((_BYTE *)a1 + v4) = *((_BYTE *)a2 + v4);
  v7 = (int *)type metadata accessor for SnidgetFeedItemMetadata(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_2321FE65C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  if (v13(v10, 1, v11))
  {
    sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_QWORD *)&v5[v7[6]] = *(_QWORD *)&v6[v7[6]];
  v15 = v7[7];
  v16 = &v5[v15];
  v17 = &v6[v15];
  v18 = sub_2321FD8B8();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

_QWORD *sub_2321E0CEC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *((_BYTE *)a1 + v6) = *((_BYTE *)a2 + v6);
  v9 = (int *)type metadata accessor for SnidgetFeedItemMetadata(0);
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_2321FE65C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  *(_QWORD *)&v7[v9[6]] = *(_QWORD *)&v8[v9[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v9[7];
  v20 = &v7[v19];
  v21 = &v8[v19];
  v22 = sub_2321FD8B8();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

_QWORD *sub_2321E0F40(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *((_BYTE *)a1 + v4) = *((_BYTE *)a2 + v4);
  v7 = (int *)type metadata accessor for SnidgetFeedItemMetadata(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_2321FE65C();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_QWORD *)&v5[v7[6]] = *(_QWORD *)&v6[v7[6]];
  v14 = v7[7];
  v15 = &v5[v14];
  v16 = &v6[v14];
  v17 = sub_2321FD8B8();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *sub_2321E10DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *((_BYTE *)a1 + v6) = *((_BYTE *)a2 + v6);
  v9 = (int *)type metadata accessor for SnidgetFeedItemMetadata(0);
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_2321FE65C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  *(_QWORD *)&v7[v9[6]] = *(_QWORD *)&v8[v9[6]];
  swift_bridgeObjectRelease();
  v19 = v9[7];
  v20 = &v7[v19];
  v21 = &v8[v19];
  v22 = sub_2321FD8B8();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t sub_2321E1320()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321E132C(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_2321E1338(a1, a2, a3, type metadata accessor for SnidgetFeedItemMetadata);
}

uint64_t sub_2321E1338(char *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v5 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v5) = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = a4(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_2321E13B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2321E13C0(char *a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_2321E13CC(a1, a2, a3, a4, type metadata accessor for SnidgetFeedItemMetadata);
}

char *sub_2321E13CC(char *result, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  char *v6;
  uint64_t v8;

  v6 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = a5(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(&v6[*(int *)(a4 + 20)], a2, a2, v8);
  }
  return result;
}

uint64_t sub_2321E1440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321E1458(a1, a2, a3, MEMORY[0x24BEE0190] + 64, type metadata accessor for SnidgetFeedItemMetadata);
}

uint64_t sub_2321E1458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t result;
  unint64_t v6;

  result = a5(319);
  if (v6 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel()
{
  return &type metadata for ActivitySummarySnidgetFeedItemModelProvider.GeneratorInputModel;
}

uint64_t sub_2321E164C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321E1658(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_2321E16D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2321E16E0(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for OngoingFactorsSnidgetFeedItemModelProvider()
{
  uint64_t result;

  result = qword_2541B2650;
  if (!qword_2541B2650)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2321E1790(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_255F9CF40, (uint64_t (*)(uint64_t))type metadata accessor for OngoingFactorsSnidgetFeedItemModelProvider, (uint64_t)&unk_23221A0D8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_2321E17CC(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t inited;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  id v49;
  uint64_t v50;
  char *v51;
  id v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  id v96;
  void *v97;
  void *v98;
  id *v99;
  char v100;
  id v101;
  uint64_t v102;
  void *v103;
  _QWORD *v104;
  unint64_t v105;
  unint64_t v106;
  _QWORD *v107;
  id v108;
  char *v109;
  void (*v110)(void *, uint64_t);
  unint64_t v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(uint64_t, uint64_t);
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v134;
  void (*v135)(char *, char *, uint64_t);
  char *v136;
  id v137;
  id v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  _BYTE *v151;
  void (*v152)(char *, uint64_t);
  void *v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  _QWORD *v159;
  _QWORD *v160;
  BOOL v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  id v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void (*v179)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v180;
  void (*v181)(char *, char *, uint64_t);
  char *v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  _BYTE *v193;
  void (*v194)(char *, uint64_t);
  unint64_t v195;
  _QWORD v196[2];
  unint64_t v197;
  uint64_t v198;
  id v199;
  char *v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  char *v204;
  uint64_t v205;
  char *v206;
  char *v207;
  char *v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  char *v212;
  char *v213;
  uint64_t v214;
  char *v215;
  char *v216;
  _QWORD *v217;
  id *v218;
  _BYTE *v219;
  char *v220;
  void *v221;
  uint64_t *v222;
  void *v223;
  _QWORD v224[3];
  uint64_t v225;

  v221 = a3;
  v205 = a2;
  v222 = a4;
  v223 = a1;
  v6 = type metadata accessor for SnidgetFeedItemMetadata(0);
  MEMORY[0x24BDAC7A8](v6);
  v219 = (char *)v196 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v196 - v10;
  sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], v8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v196 - v13;
  sub_2320057B8(0, &qword_2541B2368, (uint64_t (*)(uint64_t))MEMORY[0x24BE445A8], v8);
  MEMORY[0x24BDAC7A8](v15);
  v209 = (char *)v196 - v16;
  sub_2320057B8(0, (unint64_t *)&qword_2541B2838, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], v8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v208 = (char *)v196 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v207 = (char *)v196 - v20;
  sub_2320057B8(0, &qword_2541B2930, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FE0], v8);
  MEMORY[0x24BDAC7A8](v21);
  v220 = (char *)v196 - v22;
  v23 = sub_2321FD9F0();
  v210 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v206 = (char *)v196 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v212 = (char *)v196 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v215 = (char *)v196 - v28;
  v214 = sub_2321FDC6C();
  v211 = *(_QWORD *)(v214 - 8);
  v29 = MEMORY[0x24BDAC7A8](v214);
  v213 = (char *)v196 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v216 = (char *)v196 - v31;
  v32 = (void *)objc_opt_self();
  v33 = (void *)*v4;
  v34 = objc_msgSend(v32, sel_sharedInstanceForHealthStore_, *v4);
  if (!v34)
  {
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  v35 = v34;
  v36 = (id *)((char *)v4 + *(int *)(type metadata accessor for OngoingFactorsSnidgetFeedItemModelProvider() + 20));
  v217 = v4;
  v218 = v36;
  v37 = objc_msgSend(v35, sel_displayTypeForObjectType_, v36[2]);

  if (!v37)
  {
    sub_232000300();
    swift_allocError();
    swift_willThrow();
    return;
  }
  v203 = v23;
  v204 = v14;
  sub_2320848CC(v223);
  v39 = v5;
  if (v5)
  {

    return;
  }
  v40 = v38;
  if (!v38)
  {
LABEL_19:
    v66 = sub_2321FE65C();
    v67 = (uint64_t)v204;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v204, 1, 1, v66);
    v68 = sub_2321FD8B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 56))(v11, 1, 1, v68);
    v69 = (uint64_t)v221;
    swift_bridgeObjectRetain();
    v70 = v219;
    sub_2320D71E8(0, v67, v69, (uint64_t)v11, v219);
    sub_2321FF208();
    v71 = sub_2321FEF5C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v220, 1, 1, v71);
    v72 = v37;
    v73 = sub_2321FF1FC();
    sub_232000344(0);
    v75 = v222;
    sub_23200054C((uint64_t)v70, (uint64_t)v222 + *(int *)(v74 + 52), type metadata accessor for SnidgetFeedItemMetadata);

    v75[1] = 0;
    v75[2] = 0;
    *v75 = v73;
    sub_232002CEC((uint64_t)v70, type metadata accessor for SnidgetFeedItemMetadata);
    return;
  }
  if (!objc_msgSend(v38, sel_hasEarliestStartDate)
    || !objc_msgSend(v40, sel_hasLatestEndDate))
  {

    goto LABEL_19;
  }
  v202 = v37;
  v200 = v11;
  v41 = *(id *)((char *)v218 + *(int *)(type metadata accessor for SnidgetFeedItemGeneratorRequest(0) + 32));
  type metadata accessor for SnidgetStringBuilder();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = v33;
  v43 = (void *)objc_opt_self();
  v44 = v41;
  v45 = v33;
  v46 = objc_msgSend(v43, sel_sharedInstanceForHealthStore_, v45);
  v201 = inited;
  *(_QWORD *)(inited + 32) = v46;
  if (!v41)
  {
    v47 = v46;
    v44 = objc_msgSend(v47, sel_createHKUnitPreferenceController);

  }
  v48 = v222;

  *(_QWORD *)(v201 + 24) = v44;
  v49 = objc_msgSend(v40, sel_categoryValueRawValuesCount);
  v50 = (uint64_t)v200;
  if (((unint64_t)v49 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_65;
  }
  v51 = (char *)v49;
  v52 = v40;
  v53 = sub_2321E4C64(0, v51, v52);

  MEMORY[0x24BDAC7A8](v54);
  v195 = (unint64_t)v217;
  v55 = sub_23200648C((void (*)(__int128 *__return_ptr, uint64_t *))sub_2321E4D6C, (uint64_t)&v196[-4], (uint64_t)v53);
  v198 = 0;
  swift_bridgeObjectRelease();
  v56 = *(_QWORD *)(v55 + 16);
  v199 = v52;
  if (v56)
  {
    v224[0] = MEMORY[0x24BEE4AF8];
    sub_2320139A4(0, v56, 0);
    v57 = v224[0];
    v197 = v55;
    v58 = (uint64_t *)(v55 + 56);
    do
    {
      v59 = *(v58 - 3);
      v60 = *(v58 - 2);
      v62 = *(v58 - 1);
      v61 = *v58;
      v224[0] = v57;
      v64 = *(_QWORD *)(v57 + 16);
      v63 = *(_QWORD *)(v57 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v64 >= v63 >> 1)
      {
        sub_2320139A4(v63 > 1, v64 + 1, 1);
        v57 = v224[0];
      }
      v58 += 4;
      *(_QWORD *)(v57 + 16) = v64 + 1;
      v65 = (_QWORD *)(v57 + 32 * v64);
      v65[4] = v59;
      v65[5] = v60;
      v65[6] = v62;
      v65[7] = v61;
      --v56;
    }
    while (v56);
    swift_bridgeObjectRelease();
    v48 = v222;
    v50 = (uint64_t)v200;
    v52 = v199;
  }
  else
  {
    swift_bridgeObjectRelease();
    v57 = MEMORY[0x24BEE4AF8];
  }
  v39 = v221;
  if (!*(_QWORD *)(v57 + 16))
  {
    swift_bridgeObjectRelease();
    v87 = sub_2321FE65C();
    v88 = (uint64_t)v204;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v204, 1, 1, v87);
    v89 = sub_2321FD8B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v50, 1, 1, v89);
    swift_bridgeObjectRetain();
    v90 = v219;
    sub_2320D71E8(0, v88, (uint64_t)v39, v50, v219);
    sub_2321FF208();
    v91 = sub_2321FEF5C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56))(v220, 1, 1, v91);
    v92 = v202;
    v93 = sub_2321FF1FC();
    sub_232000344(0);
    sub_23200054C((uint64_t)v90, (uint64_t)v48 + *(int *)(v94 + 52), type metadata accessor for SnidgetFeedItemMetadata);

    swift_release();
    v48[1] = 0;
    v48[2] = 0;
    *v48 = v93;
    sub_232002CEC((uint64_t)v90, type metadata accessor for SnidgetFeedItemMetadata);
    return;
  }
  v197 = *(_QWORD *)(v57 + 16);
  v76 = *(_QWORD *)(v57 + 32);
  v77 = *(_QWORD *)(v57 + 40);
  v219 = (_BYTE *)v57;
  v78 = *(_QWORD *)(v57 + 56);
  v79 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v80 = objc_msgSend(v79, sel_sharedBehavior);
  if (!v80)
    goto LABEL_68;
  v81 = v80;
  v45 = objc_msgSend(v80, sel_features);

  if (!v45)
  {
LABEL_69:
    __break(1u);
    return;
  }
  v82 = objc_msgSend(v45, sel_seahorse);

  if (v82)
  {
    v196[1] = v76;
    v45 = objc_msgSend(v218[2], sel_identifier);
    if (!v45)
    {
      sub_232200EC4();
      v45 = (id)sub_232200E94();
      swift_bridgeObjectRelease();
    }
    v83 = sub_232200EC4();
    v85 = v84;
    if (v83 == sub_232200EC4() && v85 == v86)
    {

      swift_bridgeObjectRelease_n();
LABEL_32:
      swift_bridgeObjectRelease();
LABEL_33:
      v52 = v199;
LABEL_34:
      v96 = v202;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v97 = v96;
      v98 = v96;
      v99 = (id *)v201;
      sub_2321E3264((uint64_t)v39, v52, v97, v201, v48);

      swift_setDeallocating();
      return;
    }
    v95 = sub_232201ADC();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v95 & 1) != 0)
      goto LABEL_32;
    if (*((_BYTE *)v218 + 8) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v219 = (_BYTE *)0xE700000000000000;
      goto LABEL_33;
    }
    v100 = sub_232201ADC();
    swift_bridgeObjectRelease();
    v52 = v199;
    if ((v100 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
  }
  if (v77 && v78)
  {
    sub_2321FFC64();
    v225 = sub_232003E9C(0, (unint64_t *)&qword_2541B55A8);
    v224[0] = v202;
    v101 = v202;
    v102 = sub_2321FFC58();
    v45 = v103;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232002CEC((uint64_t)v224, (uint64_t (*)(_QWORD))sub_2320317E8);
    v104 = sub_232096810(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v106 = v104[2];
    v105 = v104[3];
    if (v106 >= v105 >> 1)
      v104 = sub_232096810((_QWORD *)(v105 > 1), v106 + 1, 1, v104);
    v104[2] = v106 + 1;
    v107 = &v104[2 * v106];
    v107[4] = v102;
    v107[5] = v45;
  }
  else
  {
    swift_bridgeObjectRelease();
    v104 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  objc_msgSend(v52, sel_latestEndDate);
  v108 = (id)HKDecodeDateForValue();
  v109 = v216;
  sub_2321FDC30();

  v40 = v213;
  sub_2321FDBAC();
  LOBYTE(v108) = sub_2321FDC24();
  v110 = *(void (**)(void *, uint64_t))(v211 + 8);
  v48 = (_QWORD *)v214;
  v110(v40, v214);
  v110(v109, (uint64_t)v48);
  if ((v108 & 1) != 0)
  {
    if (*((_QWORD *)v219 + 2) >= v197)
    {
      v111 = v197 - 1;
      v223 = v110;
      if (v197 != 1)
      {
        v159 = v219 + 88;
        do
        {
          if (*(v159 - 2))
            v161 = *v159 == 0;
          else
            v161 = 1;
          if (!v161)
          {
            sub_2321FFC64();
            v225 = sub_232003E9C(0, (unint64_t *)&qword_2541B55A8);
            v224[0] = v202;
            v162 = v202;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v163 = sub_2321FFC58();
            v165 = v164;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_232002CEC((uint64_t)v224, (uint64_t (*)(_QWORD))sub_2320317E8);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v104 = sub_232096810(0, v104[2] + 1, 1, v104);
            v167 = v104[2];
            v166 = v104[3];
            if (v167 >= v166 >> 1)
              v104 = sub_232096810((_QWORD *)(v166 > 1), v167 + 1, 1, v104);
            v104[2] = v167 + 1;
            v160 = &v104[2 * v167];
            v160[4] = v163;
            v160[5] = v165;
          }
          v159 += 4;
          --v111;
        }
        while (v111);
      }
      swift_bridgeObjectRelease();
      v112 = (void *)objc_opt_self();
      v40 = (void *)MEMORY[0x24BEE0D00];
      v113 = (void *)sub_232201020();
      swift_bridgeObjectRelease();
      v114 = objc_msgSend(v112, sel_localizedStringByJoiningStrings_, v113);

      sub_232200EC4();
      v39 = v199;
      objc_msgSend(v199, sel_earliestStartDate);
      v115 = (id)HKDecodeDateForValue();
      v116 = (uint64_t)v216;
      sub_2321FDC30();

      v117 = (uint64_t)v213;
      sub_2321FDC60();
      v45 = (id)sub_2321E3CAC(v116, v117);
      v48 = v118;
      v119 = v117;
      v120 = v214;
      v121 = (void (*)(uint64_t, uint64_t))v223;
      ((void (*)(uint64_t, uint64_t))v223)(v119, v214);
      v121(v116, v120);
      if (qword_2541B7488 == -1)
        goto LABEL_49;
      goto LABEL_66;
    }
LABEL_65:
    __break(1u);
LABEL_66:
    swift_once();
LABEL_49:
    v195 = 0xE000000000000000;
    sub_2321FDA14();
    sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v122 = swift_allocObject();
    *(_OWORD *)(v122 + 16) = xmmword_232210D40;
    *(_QWORD *)(v122 + 56) = v40;
    *(_QWORD *)(v122 + 64) = sub_2320168D8();
    *(_QWORD *)(v122 + 32) = v45;
    *(_QWORD *)(v122 + 40) = v48;
    sub_232200EA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v123 = v215;
    SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();
    v124 = v212;
    SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();
    sub_2321FF208();
    sub_232000448();
    v126 = *(int *)(v125 + 48);
    v219 = v202;
    objc_msgSend(v39, sel_earliestStartDate);
    v127 = (id)HKDecodeDateForValue();
    v128 = v220;
    sub_2321FDC30();

    v128[v126] = 1;
    v129 = *MEMORY[0x24BE42FD8];
    v130 = sub_2321FEF5C();
    v131 = *(_QWORD *)(v130 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v131 + 104))(v128, v129, v130);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v131 + 56))(v128, 0, 1, v130);
    v223 = (void *)sub_2321FF1FC();
    v132 = v210;
    v133 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v210 + 56);
    v134 = v203;
    v133(v207, 1, 1, v203);
    v135 = *(void (**)(char *, char *, uint64_t))(v132 + 16);
    v135(v206, v123, v134);
    v136 = v208;
    v135(v208, v124, v134);
    v133(v136, 0, 1, v134);
    v224[0] = 0x5F74656764696E53;
    v224[1] = 0xE800000000000000;
    v137 = v218[2];
    v138 = objc_msgSend(v137, sel_description);
    sub_232200EC4();

    sub_232200F48();
    swift_bridgeObjectRelease();
    v139 = v209;
    sub_2321FF58C();
    swift_bridgeObjectRelease();
    v140 = sub_2321FF5A4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v140 - 8) + 56))(v139, 0, 1, v140);
    sub_2321FF6C4();
    swift_allocObject();
    v141 = sub_2321FF6B8();
    v142 = v199;
    objc_msgSend(v199, sel_earliestStartDate);
    v143 = (id)HKDecodeDateForValue();
    sub_2321FDC30();

    v144 = (uint64_t)v204;
    sub_2321FE62C();
    v145 = sub_2321FE65C();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v145 - 8) + 56))(v144, 0, 1, v145);
    v146 = sub_2321FD8B8();
    v147 = (uint64_t)v200;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v146 - 8) + 56))(v200, 1, 1, v146);
    sub_232000344(0);
    v150 = (uint64_t)v221;
    v149 = v222;
    v151 = (char *)v222 + *(int *)(v148 + 52);
    swift_bridgeObjectRetain();
    sub_2320D71E8(1, v144, v150, v147, v151);
    swift_release();

    *v149 = (uint64_t)v223;
    v149[1] = v141;
    v149[2] = 0;
    v152 = *(void (**)(char *, uint64_t))(v132 + 8);
    v152(v212, v134);
    v152(v215, v134);
    return;
  }
  swift_bridgeObjectRelease();
  sub_232003E9C(0, &qword_2541B5668);
  v153 = (void *)sub_232201560();
  objc_msgSend(v52, sel_earliestStartDate);
  v154 = (id)HKDecodeDateForValue();
  sub_2321FDC30();

  v155 = (void *)sub_2321FDBF4();
  v110(v109, (uint64_t)v48);
  objc_msgSend(v52, sel_latestEndDate);
  v156 = (id)HKDecodeDateForValue();
  sub_2321FDC30();

  v157 = (void *)sub_2321FDBF4();
  v110(v109, (uint64_t)v48);
  v158 = objc_msgSend(v153, sel_stringFromDate_toDate_, v155, v157);

  sub_232200EC4();
  if (v104[2])
    swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v168 = v215;
  SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)();
  swift_bridgeObjectRelease();
  v169 = v212;
  SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();
  swift_bridgeObjectRelease();
  sub_2321FF208();
  sub_232000448();
  v171 = *(int *)(v170 + 48);
  v219 = v202;
  v172 = v199;
  objc_msgSend(v199, sel_earliestStartDate);
  v173 = (id)HKDecodeDateForValue();
  v174 = v220;
  sub_2321FDC30();

  v174[v171] = 1;
  v175 = *MEMORY[0x24BE42FD8];
  v176 = sub_2321FEF5C();
  v177 = *(_QWORD *)(v176 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v177 + 104))(v174, v175, v176);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v177 + 56))(v174, 0, 1, v176);
  v223 = (void *)sub_2321FF1FC();
  v178 = v210;
  v179 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v210 + 56);
  v180 = v203;
  v179(v207, 1, 1, v203);
  v181 = *(void (**)(char *, char *, uint64_t))(v178 + 16);
  v181(v206, v168, v180);
  v182 = v208;
  v181(v208, v169, v180);
  v179(v182, 0, 1, v180);
  v183 = sub_2321FF5A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v183 - 8) + 56))(v209, 1, 1, v183);
  sub_2321FF6C4();
  swift_allocObject();
  v184 = sub_2321FF6B8();
  objc_msgSend(v172, sel_latestEndDate);
  v185 = (id)HKDecodeDateForValue();
  sub_2321FDC30();

  v186 = (uint64_t)v204;
  sub_2321FE62C();
  v187 = sub_2321FE65C();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v187 - 8) + 56))(v186, 0, 1, v187);
  v188 = sub_2321FD8B8();
  v189 = (uint64_t)v200;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v188 - 8) + 56))(v200, 1, 1, v188);
  sub_232000344(0);
  v191 = (uint64_t)v221;
  v192 = v222;
  v193 = (char *)v222 + *(int *)(v190 + 52);
  swift_bridgeObjectRetain();
  sub_2320D71E8(1, v186, v191, v189, v193);
  swift_release();

  *v192 = (uint64_t)v223;
  v192[1] = v184;
  v192[2] = 0;
  v194 = *(void (**)(char *, uint64_t))(v178 + 8);
  v194(v169, v180);
  v194(v215, v180);
}

uint64_t sub_2321E2F08(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  char v17;
  uint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint8_t *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = sub_23220039C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_identifier);
  v9 = sub_232200EC4();
  v11 = v10;

  if (sub_232200EC4() == v9 && v12 == v11)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v14 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x2348FE748](a2);
  }
  if (sub_232200EC4() == v9 && v15 == v11)
    goto LABEL_16;
  v17 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0xD00000000000001CLL;
  }
  if (sub_232200EC4() == v9 && v19 == v11)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
    return 0xD00000000000001CLL;
  }
  v20 = sub_232201ADC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
    return 0xD00000000000001CLL;
  sub_232200318();
  v21 = a1;
  v22 = sub_232200390();
  v23 = sub_2322012E4();
  v24 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    v25 = swift_slowAlloc();
    v33 = v24;
    v26 = (uint8_t *)v25;
    v34 = swift_slowAlloc();
    v36 = v34;
    *(_DWORD *)v26 = 136315138;
    v32[1] = v26 + 4;
    v27 = objc_msgSend(v21, sel_sensitiveLoggingIdentifier);
    v28 = sub_232200EC4();
    v30 = v29;

    v35 = sub_232013174(v28, v30, &v36);
    sub_232201710();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231FFB000, v22, (os_log_type_t)v33, "Unsupported type %s for ongoing factors", v26, 0xCu);
    v31 = v34;
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v31, -1, -1);
    MEMORY[0x2348FF468](v26, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

uint64_t sub_2321E3264@<X0>(uint64_t a1@<X2>, void *a2@<X3>, void *a3@<X4>, uint64_t a4@<X5>, _QWORD *a5@<X8>)
{
  uint64_t (*v6)(uint64_t, uint64_t);
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  id v38;
  id v39;
  void (*v40)(char *, uint64_t);
  void (*v41)(char *, uint64_t);
  void *v42;
  id v43;
  char *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void (*v51)(char *, uint64_t);
  char *v52;
  char *v53;
  id v54;
  id v55;
  char *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  char *v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  id v74;
  id v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  _BYTE *v87;
  void (*v88)(char *, uint64_t);
  uint64_t v90;
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  id v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  _QWORD *v108;
  id v109;
  char *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;

  v108 = a5;
  v96 = a4;
  v99 = a3;
  v107 = a1;
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v106 = (char *)&v90 - v8;
  sub_2320057B8(0, qword_2541B78E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47DF8], v6);
  MEMORY[0x24BDAC7A8](v9);
  v105 = (char *)&v90 - v10;
  sub_2320057B8(0, &qword_2541B2368, (uint64_t (*)(uint64_t))MEMORY[0x24BE445A8], v6);
  MEMORY[0x24BDAC7A8](v11);
  v104 = (char *)&v90 - v12;
  sub_2320057B8(0, (unint64_t *)&qword_2541B2838, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], v6);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v102 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v100 = (char *)&v90 - v16;
  sub_2320057B8(0, &qword_2541B2930, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FE0], v6);
  MEMORY[0x24BDAC7A8](v17);
  v98 = (char *)&v90 - v18;
  v19 = sub_2321FDD08();
  MEMORY[0x24BDAC7A8](v19);
  v95 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_232200E7C();
  MEMORY[0x24BDAC7A8](v21);
  v94 = (char *)&v90 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = sub_2321FDE28();
  v92 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v24 = (char *)&v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = sub_2321FD9F0();
  v101 = *(_QWORD *)(v103 - 8);
  v25 = MEMORY[0x24BDAC7A8](v103);
  v97 = (char *)&v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v113 = (char *)&v90 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v90 - v29;
  v31 = sub_2321FDC6C();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v90 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v90 - v36;
  v38 = a2;
  objc_msgSend(a2, sel_latestEndDate);
  v39 = (id)HKDecodeDateForValue();
  sub_2321FDC30();

  sub_2321FDBAC();
  LOBYTE(v39) = sub_2321FDC24();
  v40 = *(void (**)(char *, uint64_t))(v32 + 8);
  v40(v35, v31);
  v112 = v37;
  v41 = v40;
  v40(v37, v31);
  v109 = v38;
  v110 = v30;
  if ((v39 & 1) != 0)
  {
    v42 = v38;
    objc_msgSend(v38, sel_earliestStartDate);
    v43 = (id)HKDecodeDateForValue();
    v44 = v112;
    sub_2321FDC30();

    sub_2321E4A28();
    v91 = v41;
    v41(v44, v31);
    SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();
    v96 = sub_232003E9C(0, qword_255FA1618);
    objc_msgSend(v42, sel_earliestStartDate);
    v45 = (id)HKDecodeDateForValue();
    sub_2321FDC30();

    sub_2321FDE1C();
    sub_2321FDDEC();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v24, v93);
    sub_2321FDC60();
    v46 = (void *)sub_2321FF628();
    v47 = (void *)objc_opt_self();
    v48 = objc_msgSend(v47, sel_hk_chartLollipopLabelColor);
    v49 = (void *)sub_2321FF604();
    v50 = objc_msgSend(v47, sel_hk_chartLollipopValueColor);
    sub_232201584();
    swift_bridgeObjectRelease();

    v51 = v91;
    v91(v35, v31);
    v51(v44, v31);
    v38 = v109;
    v52 = v110;
  }
  else
  {
    v53 = v30;
    v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    objc_msgSend(v54, sel_setDateStyle_, 2);
    objc_msgSend(v54, sel_setTimeStyle_, 0);
    objc_msgSend(v38, sel_latestEndDate);
    v55 = (id)HKDecodeDateForValue();
    v56 = v112;
    sub_2321FDC30();

    v57 = (void *)sub_2321FDBF4();
    v40(v56, v31);
    v58 = objc_msgSend(v54, sel_stringFromDate_, v57);

    sub_232200EC4();
    SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();
    sub_232200E70();
    if (qword_2541B7488 != -1)
      swift_once();
    v59 = (id)qword_2541BF760;
    sub_2321FDCFC();
    sub_232200EF4();
    v52 = v53;
    SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();

  }
  sub_2321FF208();
  sub_232000448();
  v61 = *(int *)(v60 + 48);
  v62 = v99;
  objc_msgSend(v38, sel_earliestStartDate);
  v63 = (id)HKDecodeDateForValue();
  v64 = v98;
  sub_2321FDC30();

  v64[v61] = 1;
  v65 = *MEMORY[0x24BE42FD8];
  v66 = sub_2321FEF5C();
  v67 = *(_QWORD *)(v66 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 104))(v64, v65, v66);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v64, 0, 1, v66);
  v99 = (id)sub_2321FF1FC();
  v68 = v100;
  v69 = v101;
  v70 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
  v71 = v52;
  v72 = v103;
  v70(v100, v71, v103);
  v73 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
  v73(v68, 0, 1, v72);
  v70(v97, v113, v72);
  v73(v102, 1, 1, v72);
  v114 = 0x5F74656764696E53;
  v115 = 0xE800000000000000;
  v74 = objc_retain(*(id *)(v111
                          + *(int *)(type metadata accessor for OngoingFactorsSnidgetFeedItemModelProvider() + 20)
                          + 16));
  v75 = objc_msgSend(v74, sel_description);
  sub_232200EC4();

  sub_232200F48();
  swift_bridgeObjectRelease();
  v76 = v104;
  sub_2321FF58C();
  swift_bridgeObjectRelease();
  v77 = sub_2321FF5A4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 56))(v76, 0, 1, v77);
  sub_2321FF6C4();
  swift_allocObject();
  v78 = sub_2321FF6B8();
  objc_msgSend(v109, sel_earliestStartDate);
  v79 = (id)HKDecodeDateForValue();
  sub_2321FDC30();

  v80 = (uint64_t)v105;
  sub_2321FE62C();
  v81 = sub_2321FE65C();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 56))(v80, 0, 1, v81);
  v82 = sub_2321FD8B8();
  v83 = (uint64_t)v106;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 56))(v106, 1, 1, v82);
  sub_232000344(0);
  v86 = v107;
  v85 = v108;
  v87 = (char *)v108 + *(int *)(v84 + 52);
  swift_bridgeObjectRetain();
  sub_2320D71E8(1, v80, v86, v83, v87);
  *v85 = v99;
  v85[1] = v78;
  v85[2] = 0;
  v88 = *(void (**)(char *, uint64_t))(v69 + 8);
  v88(v113, v72);
  return ((uint64_t (*)(char *, uint64_t))v88)(v110, v72);
}

uint64_t sub_2321E3CAC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t result;
  char v47;
  BOOL v48;
  void (*v49)(char *, uint64_t, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  char v56;
  void (*v57)(char *, uint64_t, uint64_t, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t, uint64_t);
  char *v62;
  char v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  id v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  unsigned int (*v72)(uint64_t, uint64_t, uint64_t);
  char *v73;
  void (*v74)(char *, char *, uint64_t);
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  char *v87;
  uint64_t v88;
  void (*v89)(char *, uint64_t);
  _DWORD v90[2];
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  unsigned int v119;
  __int128 v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;

  v114 = a2;
  v123 = a1;
  v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v100 = (char *)v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v102 = (char *)v90 - v6;
  v98 = sub_2321FDC6C();
  v109 = *(_QWORD *)(v98 - 8);
  v7 = MEMORY[0x24BDAC7A8](v98);
  v99 = (char *)v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v94 = (char *)v90 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v97 = (char *)v90 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v108 = (char *)v90 - v13;
  sub_2320057B8(0, &qword_2541AF180, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], v2);
  MEMORY[0x24BDAC7A8](v14);
  v93 = (char *)v90 - v15;
  sub_2320057B8(0, &qword_2541B2880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF2D8], v2);
  MEMORY[0x24BDAC7A8](v16);
  v92 = (char *)v90 - v17;
  v104 = sub_2321FD960();
  v103 = *(_QWORD *)(v104 - 8);
  v18 = MEMORY[0x24BDAC7A8](v104);
  v101 = (char *)v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v107 = (char *)v90 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v116 = (char *)v90 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v115 = (char *)v90 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v118 = (char *)v90 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v117 = (char *)v90 - v28;
  v29 = sub_2321FDD14();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v90 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_2321FDDD4();
  v105 = *(_QWORD *)(v106 - 8);
  MEMORY[0x24BDAC7A8](v106);
  v124 = (char *)v90 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v32, *MEMORY[0x24BDCEF70], v29);
  sub_2321FDD20();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  sub_2320057B8(0, &qword_2541B5798, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v35 = v34;
  v36 = sub_2321FDDC8();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(_QWORD *)(v37 + 72);
  v39 = *(unsigned __int8 *)(v37 + 80);
  v40 = (v39 + 32) & ~v39;
  v122 = 2 * v38;
  v111 = v39 | 7;
  v112 = v40 + 3 * v38;
  v113 = v35;
  v41 = swift_allocObject();
  v120 = xmmword_232211930;
  *(_OWORD *)(v41 + 16) = xmmword_232211930;
  v121 = *MEMORY[0x24BDCF240];
  v42 = *(void (**)(uint64_t))(v37 + 104);
  v42(v41 + v40);
  v119 = *MEMORY[0x24BDCF250];
  v42(v41 + v40 + v38);
  v110 = *MEMORY[0x24BDCF220];
  v43 = v110;
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v41 + v40 + 2 * v38, v110, v36);
  sub_2321AA91C(v41);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2321FDD50();
  swift_bridgeObjectRelease();
  v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v120;
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v44 + v40, v121, v36);
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v44 + v40 + v38, v119, v36);
  ((void (*)(uint64_t, uint64_t, uint64_t))v42)(v44 + v40 + v122, v43, v36);
  sub_2321AA91C(v44);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2321FDD50();
  swift_bridgeObjectRelease();
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = v120;
  v95 = v40;
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v45 + v40, v121, v36);
  v96 = v38;
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v45 + v40 + v38, v119, v36);
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v45 + v40 + v122, v110, v36);
  sub_2321AA91C(v45);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2321FDD44();
  swift_bridgeObjectRelease();
  result = sub_2321FD930();
  if ((v47 & 1) != 0)
    goto LABEL_6;
  if (result < 0)
  {
    v48 = __OFSUB__(0, result);
    result = -result;
    if (v48)
    {
      __break(1u);
      goto LABEL_20;
    }
  }
  if (result < 1)
  {
LABEL_6:
    result = sub_2321FD93C();
    v55 = (uint64_t)v102;
    if ((v56 & 1) != 0)
      goto LABEL_11;
    if ((result & 0x8000000000000000) == 0 || (v48 = __OFSUB__(0, result), result = -result, !v48))
    {
      if (result >= 1)
      {
        v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v105 + 56);
        v58 = v92;
        v59 = v106;
        v57(v92, 1, 1, v106);
        v60 = sub_2321FDE28();
        v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56);
        v62 = v93;
        v61(v93, 1, 1, v60);
        v91 = sub_2321FD930();
        v90[1] = v63 & 1;
        sub_2321FD93C();
        sub_2321FD948();
        v57(v58, 1, 1, v59);
        v61(v62, 1, 1, v60);
        sub_2321FD930();
        sub_2321FD93C();
        v55 = (uint64_t)v102;
        sub_2321FD948();
        goto LABEL_12;
      }
LABEL_11:
      v64 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
      v65 = v104;
      v64(v116, v117, v104);
      v64(v107, v118, v65);
      goto LABEL_12;
    }
LABEL_20:
    __break(1u);
    return result;
  }
  v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v105 + 56);
  v50 = v92;
  v51 = v106;
  v49(v92, 1, 1, v106);
  v52 = sub_2321FDE28();
  v53 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56);
  v54 = v93;
  v53(v93, 1, 1, v52);
  sub_2321FD930();
  sub_2321FD948();
  v49(v50, 1, 1, v51);
  v53(v54, 1, 1, v52);
  sub_2321FD930();
  sub_2321FD948();
  v55 = (uint64_t)v102;
LABEL_12:
  v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17A0]), sel_init);
  objc_msgSend(v66, sel_setDateTimeStyle_, 1);
  objc_msgSend(v66, sel_setFormattingContext_, 5);
  v67 = v124;
  sub_2321FDD74();
  v68 = v109;
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 16);
  v70 = v97;
  v71 = v98;
  v69(v97, v114, v98);
  v72 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
  if (v72(v55, 1, v71) == 1)
  {
    v73 = v70;
    v74 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
    v74(v108, v73, v71);
    sub_23204ADF0(v55);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v68 + 8))(v70, v71);
    v74 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
    v74(v108, (char *)v55, v71);
  }
  v75 = (uint64_t)v100;
  sub_2321FDD74();
  v76 = v99;
  v69(v99, v123, v71);
  if (v72(v75, 1, v71) == 1)
  {
    v77 = v94;
    v74(v94, v76, v71);
    sub_23204ADF0(v75);
    v78 = v109;
  }
  else
  {
    v78 = v109;
    (*(void (**)(char *, uint64_t))(v109 + 8))(v76, v71);
    v77 = v94;
    v74(v94, (char *)v75, v71);
  }
  v79 = swift_allocObject();
  *(_OWORD *)(v79 + 16) = v120;
  v80 = v79 + v95;
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v79 + v95, v121, v36);
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v80 + v96, v119, v36);
  ((void (*)(uint64_t, _QWORD, uint64_t))v42)(v80 + v122, v110, v36);
  sub_2321AA91C(v79);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v81 = v101;
  v82 = v108;
  sub_2321FDD44();
  swift_bridgeObjectRelease();
  v83 = (void *)sub_2321FD918();
  v84 = objc_msgSend(v66, sel_localizedStringFromDateComponents_, v83);

  v85 = sub_232200EC4();
  v86 = *(void (**)(char *, uint64_t))(v103 + 8);
  v87 = v81;
  v88 = v104;
  v86(v87, v104);
  v89 = *(void (**)(char *, uint64_t))(v78 + 8);
  v89(v77, v71);
  v89(v82, v71);
  v86(v107, v88);
  v86(v116, v88);
  v86(v115, v88);
  v86(v118, v88);
  v86(v117, v88);
  (*(void (**)(char *, uint64_t))(v105 + 8))(v67, v106);
  return v85;
}

void sub_2321E4A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v7;

  v0 = sub_2321FDD08();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_232200E7C();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_2321FDC6C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232003E9C(0, qword_255FA1618);
  sub_2321FDC60();
  v6 = sub_232201590();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __asm { BR              X10 }
}

uint64_t sub_2321E4B4C()
{
  id v0;

  sub_232200E70();
  if (qword_2541B7488 != -1)
    swift_once();
  v0 = (id)qword_2541BF760;
  sub_2321FDCFC();
  return sub_232200EF4();
}

void sub_2321E4C44(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2321E17CC(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), a2);
}

char *sub_2321E4C64(char *result, char *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return (char *)v4;
  v7 = result;
  v11 = MEMORY[0x24BEE4AF8];
  result = (char *)sub_2320139DC(0, v3 & ~(v3 >> 63), 0);
  if ((uint64_t)a2 >= (uint64_t)v7 && (v3 & 0x8000000000000000) == 0)
  {
    v4 = v11;
    while (a2 != v7)
    {
      result = (char *)objc_msgSend(a3, sel_categoryValueRawValuesAtIndex_, v7);
      v8 = result;
      v10 = *(_QWORD *)(v11 + 16);
      v9 = *(_QWORD *)(v11 + 24);
      if (v10 >= v9 >> 1)
        result = (char *)sub_2320139DC(v9 > 1, v10 + 1, 1);
      *(_QWORD *)(v11 + 16) = v10 + 1;
      *(_QWORD *)(v11 + 8 * v10 + 32) = v8;
      if (a2 == ++v7)
        return (char *)v4;
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_2321E4D6C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *a1;
  v6 = type metadata accessor for OngoingFactorsSnidgetFeedItemModelProvider();
  result = sub_2321E2F08(*(void **)(v4 + *(int *)(v6 + 20) + 16), v5);
  *a2 = result;
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;
  return result;
}

uint64_t sub_2321E4DC4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t inited;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void (*v21)(unint64_t, _QWORD, uint64_t);
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = *v2;
  v5 = sub_2321FE38C();
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2321FE3BC();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a1;
  v29 = (id)sub_2321FE3F8();
  sub_232027434();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_232210D20;
  v12 = type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator.Request(0);
  *(_QWORD *)(inited + 32) = sub_2321FE464();
  v37 = inited;
  sub_232201050();
  v13 = *(_BYTE *)(a2 + *(int *)(v12 + 36));
  sub_2320057B8(0, &qword_2541B7530, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v14 = sub_2321FE194();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 72);
  v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  if ((v13 & 1) != 0)
  {
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_232210D40;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104))(v18 + v17, *MEMORY[0x24BE47410], v14);
  }
  else
  {
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_232210D30;
    v20 = v18 + v17;
    v21 = *(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104);
    v21(v20, *MEMORY[0x24BE47460], v14);
    v21(v20 + v16, *MEMORY[0x24BE47490], v14);
  }
  v19 = v29;
  sub_2321A492C(v18);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v22 = swift_bridgeObjectRetain();
  sub_2321A4950(v22);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v7, *MEMORY[0x24BE47918], v31);
  sub_2321FE3B0();

  swift_bridgeObjectRelease();
  v23 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v36 + OBJC_IVAR____TtC9Summaries54CorrelatedStatisticsCurrentValueSharableModelGenerator_domain, v10, v33);
  v24 = sub_232000590(&qword_2541B0730, type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator, (uint64_t)&unk_23221A1D0);
  v25 = v35;
  v26 = static CurrentValueSummaryModelGenerating.makePublisher(generatorContext:request:)(v35, a2, v34, v24);
  sub_2321E5704(a2);
  v27 = sub_2321FE440();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v25, v27);
  *(_QWORD *)(v23 + 16) = v26;
  return v23;
}

id sub_2321E5114(void *a1, void *a2, void *a3)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  id v24;
  uint64_t inited;
  unint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  char v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  void (*v42)(char *, uint64_t);
  id v43;
  id v44;
  char *v45;
  char *v46;
  char *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  char *v58;
  id v59;
  char *v60;
  unint64_t v61;

  v6 = sub_2321FDC6C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v54 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v54 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v54 - v19;
  MEMORY[0x24BDAC7A8](v18);
  if (!a1 || !a2)
    return 0;
  v55 = a3;
  v60 = (char *)&v54 - v21;
  v58 = v22;
  v23 = a1;
  v24 = a2;
  objc_msgSend(v23, sel__setSourceRevision_, 0);
  objc_msgSend(v24, sel__setSourceRevision_, 0);
  sub_232027434();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_232213870;
  *(_QWORD *)(inited + 32) = v23;
  *(_QWORD *)(inited + 40) = v24;
  v61 = inited;
  sub_232201050();
  v26 = v61;
  v57 = v24;
  if (v61 >> 62)
  {
    v33 = v23;
    v34 = v24;
    swift_bridgeObjectRetain();
    v35 = sub_232201998();
    swift_bridgeObjectRelease();
    if (v35)
      goto LABEL_5;
LABEL_8:
    v30 = v23;
    v56 = MEMORY[0x24BEE4B08];
    goto LABEL_9;
  }
  v27 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10);
  v28 = v23;
  v29 = v24;
  if (!v27)
    goto LABEL_8;
LABEL_5:
  v30 = v23;
  sub_2321AA584(v26);
  v56 = v31;
LABEL_9:
  swift_bridgeObjectRelease();
  v55 = v55;
  v59 = v30;
  v36 = objc_msgSend(v30, sel_startDate);
  sub_2321FDC30();

  v37 = v57;
  v38 = objc_msgSend(v57, sel_startDate);
  sub_2321FDC30();

  sub_232000590((unint64_t *)&qword_2541AF160, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v39 = sub_232200E34();
  v40 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  if ((v39 & 1) != 0)
    v41 = v17;
  else
    v41 = v20;
  v40(v60, v41, v6);
  v42 = *(void (**)(char *, uint64_t))(v7 + 8);
  v42(v17, v6);
  v42(v20, v6);
  v43 = objc_msgSend(v59, sel_endDate);
  sub_2321FDC30();

  v44 = objc_msgSend(v37, sel_endDate);
  sub_2321FDC30();

  if ((sub_232200E40() & 1) != 0)
    v45 = v10;
  else
    v45 = v13;
  v46 = v58;
  v40(v58, v45, v6);
  v42(v10, v6);
  v42(v13, v6);
  v47 = v60;
  v48 = (void *)sub_2321FDBF4();
  v49 = (void *)sub_2321FDBF4();
  sub_232003E9C(0, &qword_2541B0D68);
  sub_23210B964();
  v50 = (void *)sub_2322010B0();
  swift_bridgeObjectRelease();
  v51 = (void *)objc_opt_self();
  v52 = v55;
  v32 = objc_msgSend(v51, sel_correlationWithType_startDate_endDate_objects_, v55, v48, v49, v50);

  v42(v46, v6);
  v42(v47, v6);

  return v32;
}

uint64_t sub_2321E5550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC9Summaries54CorrelatedStatisticsCurrentValueSharableModelGenerator_domain;
  v2 = sub_2321FE3BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2321E55A8()
{
  return type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator(0);
}

uint64_t type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator(uint64_t a1)
{
  return sub_23201A14C(a1, (uint64_t *)&unk_2541B0738);
}

id sub_2321E55C8(void **a1, uint64_t a2)
{
  return sub_2321E63C4(*a1, a2);
}

uint64_t sub_2321E55D0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC9Summaries54CorrelatedStatisticsCurrentValueSharableModelGenerator_domain;
  v4 = sub_2321FE3BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

_UNKNOWN **sub_2321E5618()
{
  return &off_250108A60;
}

uint64_t sub_2321E5624(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B0720, type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator, (uint64_t)&unk_23221A148);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_2321E5660()
{
  return &off_250108AA8;
}

uint64_t sub_2321E566C(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B0728, type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator, (uint64_t)&unk_23221A178);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_2321E56A8()
{
  return &off_250108AC0;
}

uint64_t sub_2321E56B4(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B4D98, type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator, (uint64_t)&unk_23221A1A4);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator.Request(uint64_t a1)
{
  return sub_23201A14C(a1, qword_2541B0680);
}

uint64_t sub_2321E5704(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator.Request(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2321E5740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t result;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void (*v45)(uint64_t, _QWORD, uint64_t);
  unint64_t v46;
  void (*v47)(_QWORD);
  void *v48;
  void *v49;
  void (*v50)(_BYTE *, uint64_t);
  _BYTE *v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, _QWORD, uint64_t);
  uint64_t v67;
  unint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  _BYTE v84[12];
  unsigned int v85;
  void (*v86)(_BYTE *, _QWORD, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  _BYTE *v103;
  _BYTE *v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE *v112;
  uint64_t v113;
  void (**v114)(_QWORD, _QWORD);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;

  v115 = a2;
  sub_2321E6B0C(0, (unint64_t *)&qword_2541B2C80, (void (*)(uint64_t))sub_23201B100, (void (*)(void))sub_2321E6A84);
  v5 = v4;
  v114 = *(void (***)(_QWORD, _QWORD))(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v84[-v6];
  sub_2321E6AA0();
  v106 = v8;
  v105 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v104 = &v84[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2321E6B0C(0, &qword_2541B2CD8, v10, (void (*)(void))sub_2321E6B98);
  v12 = v11;
  v108 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v107 = &v84[-v13];
  v113 = sub_2321FE38C();
  v109 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113);
  v112 = &v84[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v111 = sub_2321FE3BC();
  v110 = *(_QWORD *)(v111 - 8);
  v15 = MEMORY[0x24BDAC7A8](v111);
  v103 = &v84[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v18 = &v84[-v17];
  v19 = (void *)objc_opt_self();
  v20 = (void *)sub_2321FD858();
  v21 = objc_msgSend(v19, sel_predicateForSamplesWithinDateInterval_options_, v20, 0);

  v22 = type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator.Request(0);
  v23 = sub_23220018C();
  v24 = (void *)sub_2321FE464();
  objc_opt_self();
  v25 = swift_dynamicCastObjCClass();
  if (!v25)
  {
    swift_bridgeObjectRelease();

LABEL_21:
    sub_2321FE3D4();
    sub_232016AD8(&v118, v119);
    v80 = (void *)sub_2321FE314();
    v81 = (void *)sub_2321FE464();
    v82 = v21;
    v83 = sub_232201284();

    sub_232016AFC((uint64_t)&v118);
    v118 = v83;
    sub_23201B100();
    sub_2321B2ED0(0, (unint64_t *)&qword_2541B3568, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
    sub_2321E6A84();
    sub_2322007A4();
    swift_release();
    sub_2321E6C04(&qword_2541B7980, (unint64_t *)&qword_2541B2C80, (void (*)(uint64_t))sub_23201B100, (void (*)(void))sub_2321E6A84);
    v78 = sub_232200774();

    ((void (**)(_BYTE *, uint64_t))v114)[1](v7, v5);
    return v78;
  }
  v102 = v24;
  if (!(v23 >> 62))
  {
    if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10) == 2)
      goto LABEL_4;
    goto LABEL_20;
  }
  v101 = v25;
  swift_bridgeObjectRetain();
  v79 = sub_232201998();
  swift_bridgeObjectRelease();
  v25 = v101;
  if (v79 != 2)
  {
LABEL_20:

    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
LABEL_4:
  v101 = v25;
  sub_2321FE3D4();
  sub_232016AD8(&v118, v119);
  result = sub_2321FE314();
  v27 = (void *)result;
  v100 = v12;
  v114 = (void (**)(_QWORD, _QWORD))(v23 & 0xC000000000000001);
  if ((v23 & 0xC000000000000001) != 0)
  {
    v28 = (id)MEMORY[0x2348FEA30](0, v23);
  }
  else
  {
    if (!*(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_25;
    }
    v28 = *(id *)(v23 + 32);
  }
  v29 = v28;
  v30 = v21;
  v31 = sub_232201284();

  v91 = v30;
  sub_232016AFC((uint64_t)&v118);
  v117 = v31;
  sub_2321FE434();
  v98 = (id)sub_2321FE3F8();
  sub_232027434();
  v94 = v32;
  inited = swift_initStackObject();
  v90 = xmmword_232210D20;
  *(_OWORD *)(inited + 16) = xmmword_232210D20;
  *(_QWORD *)(inited + 32) = sub_2321FE464();
  v116 = inited;
  sub_232201050();
  v97 = v116;
  v34 = *(int *)(v22 + 36);
  v99 = a3;
  v89 = v34;
  LOBYTE(v30) = *(_BYTE *)(a3 + v34);
  sub_2320057B8(0, &qword_2541B7530, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v36 = v35;
  v37 = sub_2321FE194();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(_QWORD *)(v38 + 72);
  v40 = *(unsigned __int8 *)(v38 + 80);
  v41 = (v40 + 32) & ~v40;
  v96 = v37;
  v95 = v38;
  v93 = v39;
  v92 = v41;
  v88 = v36;
  v87 = v40;
  if ((v30 & 1) != 0)
  {
    v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_232210D40;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v42 + v41, *MEMORY[0x24BE47410], v37);
  }
  else
  {
    v44 = v39;
    v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_232210D30;
    v45 = *(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104);
    v45(v42 + v41, *MEMORY[0x24BE47460], v37);
    v45(v42 + v41 + v44, *MEMORY[0x24BE47490], v37);
  }
  v43 = v98;
  sub_2321A492C(v42);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v46 = swift_bridgeObjectRetain();
  sub_2321A4950(v46);
  swift_bridgeObjectRelease();
  v47 = *(void (**)(_QWORD))(v109 + 104);
  v85 = *MEMORY[0x24BE47918];
  v86 = (void (*)(_BYTE *, _QWORD, uint64_t))v47;
  v47(v112);
  sub_2321FE3B0();

  swift_bridgeObjectRelease();
  sub_23201B100();
  v49 = v48;
  sub_2321E6A84();
  v98 = v49;
  v109 = sub_232200738();
  v50 = *(void (**)(_BYTE *, uint64_t))(v110 + 8);
  v51 = v18;
  v52 = v111;
  v50(v51, v111);
  sub_232016AFC((uint64_t)&v118);
  swift_release();
  sub_2321FE3D4();
  sub_232016AD8(&v118, v119);
  result = sub_2321FE314();
  v53 = (void *)result;
  if (v114)
  {
    v54 = (id)MEMORY[0x2348FEA30](1, v23);
    v55 = v99;
LABEL_15:
    swift_bridgeObjectRelease();
    v56 = v91;
    v57 = sub_232201284();

    v114 = (void (**)(_QWORD, _QWORD))v56;
    sub_232016AFC((uint64_t)&v118);
    v117 = v57;
    sub_2321FE434();
    v58 = (void *)sub_2321FE3F8();
    v59 = swift_initStackObject();
    *(_OWORD *)(v59 + 16) = v90;
    *(_QWORD *)(v59 + 32) = sub_2321FE464();
    v116 = v59;
    sub_232201050();
    if ((*(_BYTE *)(v55 + v89) & 1) != 0)
    {
      v60 = v92;
      v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_232210D40;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v95 + 104))(v61 + v60, *MEMORY[0x24BE47410], v96);
    }
    else
    {
      v63 = v93;
      v64 = v92;
      v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_232210D30;
      v65 = v61 + v64;
      v66 = *(void (**)(uint64_t, _QWORD, uint64_t))(v95 + 104);
      v67 = v96;
      v66(v65, *MEMORY[0x24BE47460], v96);
      v66(v65 + v63, *MEMORY[0x24BE47490], v67);
    }
    v62 = v58;
    sub_2321A492C(v61);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v68 = swift_bridgeObjectRetain();
    sub_2321A4950(v68);
    swift_bridgeObjectRelease();
    v86(v112, v85, v113);
    v69 = v103;
    sub_2321FE3B0();

    swift_bridgeObjectRelease();
    v70 = sub_232200738();
    v50(v69, v52);
    sub_232016AFC((uint64_t)&v118);
    swift_release();
    v117 = v70;
    v118 = v109;
    swift_retain();
    swift_retain();
    v71 = v104;
    sub_232200558();
    v72 = swift_allocObject();
    *(_QWORD *)(v72 + 16) = v101;
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = sub_2321E6BD8;
    *(_QWORD *)(v73 + 24) = v72;
    sub_2321B2ED0(0, (unint64_t *)&qword_2541B3568, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
    sub_2321E6B98();
    v74 = v102;
    v75 = v107;
    v76 = v106;
    sub_2322007A4();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v105 + 8))(v71, v76);
    sub_2321E6C04(&qword_2541AF220, &qword_2541B2CD8, (void (*)(uint64_t))sub_2321E6AA0, (void (*)(void))sub_2321E6B98);
    v77 = v100;
    v78 = sub_232200774();

    swift_release();
    swift_release();

    (*(void (**)(_BYTE *, uint64_t))(v108 + 8))(v75, v77);
    return v78;
  }
  v55 = v99;
  if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v54 = *(id *)(v23 + 40);
    goto LABEL_15;
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_2321E63C4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  id result;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t (*v41)(uint64_t);
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint8_t *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
  uint8_t *v60;
  uint8_t *v61;
  id v62;
  char *v63;
  _OWORD v64[2];
  uint64_t v65;
  uint64_t v66;

  v4 = sub_23220039C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v60 - v10;
  sub_2320057B8(0, (unint64_t *)&qword_2541B2A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0], v8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v60 - v16;
  sub_2320057B8(0, &qword_2541B28D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70], v8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v60 - v22;
  if (!a1)
  {
    sub_2321FE6B0();
    v44 = sub_2321FE6D4();
    v45 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v23, 0, 1, v44);
    sub_232003E9C(0, &qword_2541B0CD0);
    v46 = sub_2321FFD78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v17, 1, 1, v46);
    sub_232016080((uint64_t)v23, (uint64_t)v21, &qword_2541B28D0, v45);
    v43 = sub_2320151CC(0, 0xF000000000000000, 0xBu, (uint64_t)v17, (uint64_t)v21, 0, 0);
    sub_232016D88((uint64_t)v23, &qword_2541B28D0, v45);
    return v43;
  }
  v63 = v17;
  objc_opt_self();
  v24 = swift_dynamicCastObjCClass();
  if (!v24)
  {
    v47 = a1;
    sub_232200318();
    v48 = v47;
    v49 = sub_232200390();
    v50 = sub_2322012E4();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v62 = (id)swift_slowAlloc();
      *(_QWORD *)&v64[0] = v62;
      *(_DWORD *)v51 = 136315138;
      v60 = v51 + 4;
      v61 = v51;
      swift_getObjectType();
      v52 = sub_232201BF0();
      v66 = sub_232013174(v52, v53, (uint64_t *)v64);
      sub_232201710();

      swift_bridgeObjectRelease();
      v54 = v61;
      _os_log_impl(&dword_231FFB000, v49, v50, "Unexpected correlated sample received: %s", v61, 0xCu);
      v55 = v62;
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v55, -1, -1);
      MEMORY[0x2348FF468](v54, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v56 = (uint64_t)v63;
    sub_2321FE6B0();
    v57 = sub_2321FE6D4();
    v58 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v23, 0, 1, v57);
    sub_232003E9C(0, &qword_2541B0CD0);
    v59 = sub_2321FFD78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v56, 1, 1, v59);
    sub_232016080((uint64_t)v23, (uint64_t)v21, &qword_2541B28D0, v58);
    v43 = sub_2320151CC(0, 0xF000000000000000, 0xBu, v56, (uint64_t)v21, 0, 0);
    sub_232016D88((uint64_t)v23, &qword_2541B28D0, v58);

    return v43;
  }
  v25 = (void *)v24;
  sub_232003E9C(0, &qword_2541B0D18);
  v26 = a1;
  v27 = (void *)HKCodableSummaryBloodPressureValue.init(correlation:)(v25);
  v28 = a2
      + *(int *)(type metadata accessor for CorrelatedStatisticsCurrentValueSharableModelGenerator.Request(0) + 32);
  v29 = sub_2322001A4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v15, v28, v29);
  v30 = *MEMORY[0x24BE4AD80];
  v31 = sub_2321FFD78();
  v32 = *(_QWORD *)(v31 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 104))(v15, v30, v31);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v15, 0, 1, v31);
  sub_232003E9C(0, &qword_2541B56C8);
  v33 = v26;
  sub_232201674();

  v34 = sub_2321FD8B8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v11, 0, 1, v34);
  v35 = HKCodableSummarySupplementaryValue.init(dateInterval:dataCount:)((uint64_t)v11, 1, 0);
  v62 = v27;
  result = objc_msgSend(v27, sel_data);
  if (result)
  {
    v37 = result;
    sub_232003E9C(0, &qword_2541B0CD0);
    v38 = sub_2321FDAD4();
    v40 = v39;

    v41 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0];
    v42 = (uint64_t)v63;
    sub_232016080((uint64_t)v15, (uint64_t)v63, (unint64_t *)&qword_2541B2A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0]);
    v65 = 0;
    memset(v64, 0, sizeof(v64));
    v43 = sub_232015828(v38, v40, 5, v42, (uint64_t)v35, 0, (uint64_t)v64);

    sub_232003ED4(v38, v40);
    sub_232016D88((uint64_t)v15, (unint64_t *)&qword_2541B2A70, v41);

    return v43;
  }
  __break(1u);
  return result;
}

uint64_t sub_2321E6A84()
{
  return sub_232000590(&qword_2541B79D0, (uint64_t (*)(uint64_t))sub_23201B100, MEMORY[0x24BDB9AF8]);
}

void sub_2321E6AA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541B2D48)
  {
    sub_23201B100();
    sub_2321E6A84();
    v0 = sub_23220054C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541B2D48);
  }
}

void sub_2321E6B0C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a3(255);
    sub_2321B2ED0(255, (unint64_t *)&qword_2541B3568, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
    a4();
    v6 = sub_232200540();
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_2321E6B98()
{
  return sub_232000590(&qword_2541AF230, (uint64_t (*)(uint64_t))sub_2321E6AA0, MEMORY[0x24BDB96E0]);
}

uint64_t sub_2321E6BB4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2321E6BD8(void *a1, void *a2)
{
  uint64_t v2;

  return sub_2321E5114(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_2321E6BE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2321E6C04(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_2321E6B0C(255, a2, a3, a4);
    result = MEMORY[0x2348FF39C](MEMORY[0x24BDB96C0], v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_2321E6C44(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2321FD8B8();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2321FE4A0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[8];
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    v22 = sub_2322001A4();
    v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    v23(v20, v21, v22);
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  }
  return a1;
}

uint64_t sub_2321E6DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_2321FD8B8();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(a2 + 32);
  v9 = sub_2322001A4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

char *sub_2321E6E7C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);

  v6 = sub_2321FD8B8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = v16;
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_2322001A4();
  v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  swift_bridgeObjectRetain();
  v21(v18, v19, v20);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

char *sub_2321E6FD4(char *a1, char *a2, int *a3)
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
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v6 = sub_2321FD8B8();
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
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  a1[a3[6]] = a2[a3[6]];
  v16 = a3[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[8];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = sub_2322001A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

char *sub_2321E7180(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = sub_2321FD8B8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_2322001A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

char *sub_2321E72BC(char *a1, char *a2, int *a3)
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
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v6 = sub_2321FD8B8();
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
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = a3[8];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = sub_2322001A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

uint64_t sub_2321E7454()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321E7460(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_2321FE4A0();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_2322001A4();
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[8];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_2321E7548()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321E7554(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_2321FE4A0();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[7] + 8) = (a2 - 1);
        return result;
      }
      v10 = sub_2322001A4();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2321E7638()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2320057B8(319, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_2321FE4A0();
    if (v1 <= 0x3F)
    {
      sub_2322001A4();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t type metadata accessor for ActivityDataTypeDetailChartCell()
{
  uint64_t result;

  result = qword_2541B1198;
  if (!qword_2541B1198)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2321E7740()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2321E777C()
{
  type metadata accessor for ActivityDataTypeDetailChartCell();
  return sub_2322013E0();
}

uint64_t sub_2321E77B0()
{
  type metadata accessor for ActivityDataTypeDetailChartCell();
  return sub_2321FEDAC();
}

uint64_t sub_2321E77E0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BYTE v19[24];
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[5];

  swift_getObjectType();
  v1 = sub_23220039C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_2321FF16C();
  if (v20)
  {
    sub_232016A8C(0, (unint64_t *)&qword_2541B11F0);
    sub_232016A8C(0, &qword_2541B1180);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v22 + 1))
      {
        sub_2320167F8(&v21, (uint64_t)v24);
        v5 = (void *)sub_2321FF148();
        v6 = objc_msgSend(v5, sel_view);

        objc_msgSend(v6, sel_removeFromSuperview);
        v7 = (void *)sub_2321FF148();
        objc_msgSend(v7, sel_removeFromParentViewController);

        sub_2321E7B44(v24);
        sub_2321FF154();
        sub_2321FF130();
        return sub_232016AFC((uint64_t)v24);
      }
    }
    else
    {
      v23 = 0;
      v21 = 0u;
      v22 = 0u;
    }
  }
  else
  {
    sub_2320254AC((uint64_t)v19, &qword_255F9F870, (unint64_t *)&qword_2541B11F0);
    v21 = 0u;
    v22 = 0u;
    v23 = 0;
  }
  sub_2320254AC((uint64_t)&v21, &qword_255FA16B0, &qword_2541B1180);
  sub_23220033C();
  v9 = v0;
  v10 = sub_232200390();
  v11 = sub_2322012E4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_QWORD *)&v21 = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = sub_232201BF0();
    v24[0] = sub_232013174(v14, v15, (uint64_t *)&v21);
    sub_232201710();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    sub_2321FF16C();
    sub_2320254E8(0, &qword_255F9F870, (unint64_t *)&qword_2541B11F0);
    v16 = sub_232200F00();
    v24[0] = sub_232013174(v16, v17, (uint64_t *)&v21);
    sub_232201710();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231FFB000, v10, v11, "%s: Item kind wrong: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v13, -1, -1);
    MEMORY[0x2348FF468](v12, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id sub_2321E7B44(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  sub_23202D234(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2321FDC6C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2321FF13C();
  if (v9)
  {
    v10 = (void *)v9;
    sub_2321FED64();

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_2321FDC60();
  sub_23204ADF0((uint64_t)v4);
LABEL_6:
  v11 = sub_2321E7D1C();
  v12 = (void *)sub_2321FF160();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, sel_resolvedHealthToolbox);

    v15 = a1[3];
    v16 = a1[4];
    sub_232016AD8(a1, v15);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
    v18 = (void *)sub_2321FDBF4();
    v13 = objc_msgSend(v14, sel_createActivityChartForActivityMoveMode_displayDate_activityOptions_chartSharableModel_, v17, v18, v11, 0);

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

uint64_t sub_2321E7D1C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE v20[24];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  swift_getObjectType();
  v1 = sub_23220039C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_2321FF16C();
  if (!v21)
  {
    sub_2320254AC((uint64_t)v20, &qword_255F9F870, (unint64_t *)&qword_2541B11F0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0;
    goto LABEL_8;
  }
  sub_232016A8C(0, (unint64_t *)&qword_2541B11F0);
  sub_232016A8C(0, &qword_2541B1180);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    goto LABEL_8;
  }
  if (!*((_QWORD *)&v23 + 1))
  {
LABEL_8:
    sub_2320254AC((uint64_t)&v22, &qword_255FA16B0, &qword_2541B1180);
    sub_23220033C();
    v8 = v0;
    v9 = sub_232200390();
    v10 = sub_2322012E4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      *(_QWORD *)&v22 = v12;
      *(_DWORD *)v11 = 136315394;
      v13 = sub_232201BF0();
      v25[0] = sub_232013174(v13, v14, (uint64_t *)&v22);
      sub_232201710();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      sub_2321FF16C();
      sub_2320254E8(0, &qword_255F9F870, (unint64_t *)&qword_2541B11F0);
      v15 = sub_232200F00();
      v25[0] = sub_232013174(v15, v16, (uint64_t *)&v22);
      sub_232201710();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231FFB000, v9, v10, "%s: Item kind wrong: %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v12, -1, -1);
      MEMORY[0x2348FF468](v11, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
  sub_2320167F8(&v22, (uint64_t)v25);
  v5 = v26;
  v6 = v27;
  sub_232016AD8(v25, v26);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6);
  if (v7 == 2)
  {
    sub_232016AFC((uint64_t)v25);
    return 0;
  }
  if ((v7 & 1) != 0)
    v17 = 0;
  else
    v17 = 6;
  sub_232016AFC((uint64_t)v25);
  return v17;
}

id sub_2321E8070(void *a1, double a2, double a3, double a4, double a5)
{
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)type metadata accessor for ActivityDataTypeDetailChartCell();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a2, a3, a4, a5);
}

id sub_2321E80E0(void *a1, uint64_t a2, uint64_t a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for ActivityDataTypeDetailChartCell();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

id sub_2321E8128()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityDataTypeDetailChartCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2321E815C()
{
  return type metadata accessor for ActivityDataTypeDetailChartCell();
}

void sub_2321E8164(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_232059CAC();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_232210D30;
  v7 = objc_msgSend((id)objc_opt_self(), sel_activitySummaryType);
  v8 = objc_msgSend(v7, sel_identifier);

  v9 = sub_232200EC4();
  v11 = v10;

  *(_QWORD *)(v6 + 32) = v9;
  *(_QWORD *)(v6 + 40) = v11;
  *(_QWORD *)(v6 + 48) = 0xD000000000000019;
  *(_QWORD *)(v6 + 56) = 0x800000023220ACC0;
  v12 = (void *)sub_232201020();
  swift_bridgeObjectRelease();
  v13 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v13)
  {
    v14 = sub_232200EC4();
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  *(_QWORD *)a3 = 0xD000000000000019;
  *(_QWORD *)(a3 + 8) = 0x800000023220ACC0;
  *(_BYTE *)(a3 + 16) = a1;
  *(_BYTE *)(a3 + 17) = a2 & 1;
  *(_QWORD *)(a3 + 24) = v14;
  *(_QWORD *)(a3 + 32) = v16;
}

void sub_2321E82A4(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_232059CAC();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_232210D30;
  v7 = objc_msgSend((id)objc_opt_self(), sel_activitySummaryType);
  v8 = objc_msgSend(v7, sel_identifier);

  v9 = sub_232200EC4();
  v11 = v10;

  *(_QWORD *)(v6 + 32) = v9;
  *(_QWORD *)(v6 + 40) = v11;
  *(_QWORD *)(v6 + 48) = 0xD000000000000018;
  *(_QWORD *)(v6 + 56) = 0x800000023220ACE0;
  v12 = (void *)sub_232201020();
  swift_bridgeObjectRelease();
  v13 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v13)
  {
    v14 = sub_232200EC4();
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  *(_QWORD *)a3 = 0xD000000000000018;
  *(_QWORD *)(a3 + 8) = 0x800000023220ACE0;
  *(_BYTE *)(a3 + 16) = a1;
  *(_BYTE *)(a3 + 17) = a2 & 1;
  *(_QWORD *)(a3 + 24) = v14;
  *(_QWORD *)(a3 + 32) = v16;
}

ValueMetadata *type metadata accessor for ActivityDataTypeDetailChartCell.ActiveEnergyDataSourceItem()
{
  return &type metadata for ActivityDataTypeDetailChartCell.ActiveEnergyDataSourceItem;
}

uint64_t _s9Summaries31ActivityDataTypeDetailChartCellC26ActiveEnergyDataSourceItemVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s9Summaries31ActivityDataTypeDetailChartCellC26ActiveEnergyDataSourceItemVwca_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9Summaries31ActivityDataTypeDetailChartCellC26ActiveEnergyDataSourceItemVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ActivityDataTypeDetailChartCell.MoveTimeDataSourceItem()
{
  return &type metadata for ActivityDataTypeDetailChartCell.MoveTimeDataSourceItem;
}

uint64_t sub_2321E8524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321E8590(a1, a2, a3, (uint64_t (*)(void))sub_23209A258, (uint64_t (*)(void))sub_2321E8538);
}

unint64_t sub_2321E8538()
{
  unint64_t result;

  result = qword_255FA16B8;
  if (!qword_255FA16B8)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A2B8, &type metadata for ActivityDataTypeDetailChartCell.MoveTimeDataSourceItem);
    atomic_store(result, (unint64_t *)&qword_255FA16B8);
  }
  return result;
}

uint64_t sub_2321E857C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321E8590(a1, a2, a3, (uint64_t (*)(void))sub_23209A2A0, (uint64_t (*)(void))sub_2321E85C0);
}

uint64_t sub_2321E8590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2321E85C0()
{
  unint64_t result;

  result = qword_2541B1190;
  if (!qword_2541B1190)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A38C, &type metadata for ActivityDataTypeDetailChartCell.ActiveEnergyDataSourceItem);
    atomic_store(result, (unint64_t *)&qword_2541B1190);
  }
  return result;
}

uint64_t sub_2321E8610(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(uint64_t, _QWORD, uint64_t, uint64_t), char a9)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t (*v16)(uint64_t);
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
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  void (*v36)(char *, _QWORD, uint64_t, uint64_t);
  void *v37;
  int v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  void (*v67)(_QWORD, _QWORD, _QWORD);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, _QWORD, uint64_t, uint64_t);
  void *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unsigned int (*v98)(uint64_t, uint64_t, uint64_t);
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  char *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  void (*v116)(uint64_t, _QWORD, uint64_t, uint64_t);
  void (*v117)(_QWORD, _QWORD, _QWORD);
  uint64_t v118;
  void (*v119)(_QWORD, _QWORD, _QWORD);
  uint64_t v120;
  uint64_t v121;

  v108 = a4;
  v116 = a8;
  LODWORD(v121) = a7;
  v114 = a6;
  v12 = a3 & 1;
  v115 = a9 & 1;
  v13 = sub_2321FE584();
  v109 = *(_QWORD *)(v13 - 8);
  v110 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v100 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B28C0, v16, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v99 = (uint64_t)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)&v105 = (char *)&v97 - v20;
  v21 = sub_2321FD9C0();
  v103 = *(_QWORD *)(v21 - 8);
  v104 = v21;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v101 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v102 = (char *)&v97 - v24;
  v25 = sub_2321FDDD4();
  v112 = *(_QWORD *)(v25 - 8);
  v113 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v97 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], v15);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v106 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v97 - v31;
  v33 = sub_2321FFD00();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
  v118 = a5;
  v35(v32, a5, v33);
  v36 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56);
  v36(v32, 0, 1, v33);
  v111 = a1;
  v37 = a1;
  v38 = v12;
  v39 = v12;
  v40 = v121;
  v117 = (void (*)(_QWORD, _QWORD, _QWORD))sub_2321E9DAC(v37, a2, v39, (uint64_t)v32, v121, (uint64_t)v116, v115);
  v42 = v41;
  sub_232016D88((uint64_t)v32, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
  if (!v42)
  {
    LODWORD(v117) = v38 != 0;
    type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
    sub_232000590(&qword_255FA16C8, (uint64_t (*)(uint64_t))type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure, (uint64_t)&unk_23221A558);
    swift_allocError();
    v57 = v56;
    sub_2321EC6A0();
    v59 = (char *)(v57 + *(int *)(v58 + 80));
    *(_QWORD *)v57 = a2;
    *(_BYTE *)(v57 + 8) = (_BYTE)v117;
    v60 = v111;
    *(_QWORD *)(v57 + 16) = v111;
    *(_BYTE *)(v57 + 24) = v40;
    v35(v59, v118, v33);
    v36(v59, 0, 1, v33);
    swift_storeEnumTagMultiPayload();
    v61 = v60;
    return swift_willThrow();
  }
  v43 = v42;
  v116 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v36;
  v115 = v38;
  v111 = (void *)a2;
  v44 = v118;
  sub_2321FDDA4();
  v45 = v114;
  v46 = sub_23206AEA8(v40, (uint64_t)v27);
  v48 = v47;
  (*(void (**)(char *, uint64_t))(v112 + 8))(v27, v113);
  if ((v48 & 1) != 0)
  {
    v62 = v45;
    swift_bridgeObjectRelease();
    type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
    sub_232000590(&qword_255FA16C8, (uint64_t (*)(uint64_t))type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure, (uint64_t)&unk_23221A558);
    swift_allocError();
    v64 = v63;
    v65 = sub_2321FD8B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 16))(v64, v62, v65);
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  v113 = v46;
  v49 = v105;
  sub_232016080(v108, v105, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
  v51 = v109;
  v50 = v110;
  v98 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
  if (v98(v49, 1, v110) == 1)
  {
    sub_232016D88(v49, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
    v52 = (uint64_t)v102;
    sub_2321FD9B4();
    v53 = (void (*)(uint64_t, uint64_t, uint64_t))v35;
    v55 = v103;
    v54 = v104;
  }
  else
  {
    v66 = v101;
    sub_2321FE578();
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v49, v50);
    v52 = (uint64_t)v102;
    v55 = v103;
    v54 = v104;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v102, v66, v104);
    v53 = (void (*)(uint64_t, uint64_t, uint64_t))v35;
  }
  v67 = v117;
  v112 = sub_232089154((uint64_t)v117, v43, (uint64_t)"", 0, 2, v52);
  v118 = v68;
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v52, v54);
  v119 = v67;
  v120 = v43;
  swift_bridgeObjectRetain();
  sub_232200F48();
  swift_bridgeObjectRelease();
  v69 = (uint64_t)v106;
  if (qword_2541B7488 != -1)
    swift_once();
  sub_2321FDA14();
  swift_bridgeObjectRelease();
  sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v70 = swift_allocObject();
  v71 = MEMORY[0x24BEE1768];
  v105 = xmmword_232210D40;
  *(_OWORD *)(v70 + 16) = xmmword_232210D40;
  v72 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v70 + 56) = v71;
  *(_QWORD *)(v70 + 64) = v72;
  *(_QWORD *)(v70 + 32) = v113;
  v113 = sub_232200EA0();
  v74 = v73;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v53(v69, v44, v33);
  v117 = v53;
  v75 = v44;
  v76 = v116;
  v116(v69, 0, 1, v33);
  v77 = v107;
  v78 = sub_2321EC7E8(v114, v69, v121);
  if (v77)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_232016D88(v69, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
    type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
    sub_232000590(&qword_255FA16C8, (uint64_t (*)(uint64_t))type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure, (uint64_t)&unk_23221A558);
    swift_allocError();
    v81 = v80;
    v117(v80, v75, v33);
    v76(v81, 0, 1, v33);
    goto LABEL_12;
  }
  v83 = v113;
  v121 = v79;
  v84 = v78;
  sub_232016D88(v69, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
  if (v115)
    goto LABEL_20;
  v85 = v74;
  if (v111 == (void *)2)
  {
    v88 = v99;
    sub_232016080(v108, v99, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
    v89 = v110;
    if (v98(v88, 1, v110) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_232016D88(v88, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(void))(v109 + 32))();
      v90 = v83;
      v91 = swift_allocObject();
      *(_OWORD *)(v91 + 16) = xmmword_232210D30;
      v92 = sub_2321FE56C();
      v94 = v93;
      v95 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v91 + 56) = MEMORY[0x24BEE0D00];
      v96 = sub_2320168D8();
      *(_QWORD *)(v91 + 32) = v92;
      *(_QWORD *)(v91 + 40) = v94;
      *(_QWORD *)(v91 + 96) = v95;
      *(_QWORD *)(v91 + 104) = v96;
      *(_QWORD *)(v91 + 64) = v96;
      *(_QWORD *)(v91 + 72) = v90;
      *(_QWORD *)(v91 + 80) = v85;
      sub_232200EA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v109 + 8))(v100, v89);
    }
    return (uint64_t)v84;
  }
  if (v111 != (void *)1)
  {
LABEL_20:
    swift_bridgeObjectRelease();
  }
  else
  {
    v86 = v83;
    swift_bridgeObjectRelease();
    v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = v105;
    *(_QWORD *)(v87 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v87 + 64) = sub_2320168D8();
    *(_QWORD *)(v87 + 32) = v86;
    *(_QWORD *)(v87 + 40) = v85;
    sub_232200EA0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v84;
}

uint64_t sub_2321E8F9C(void *a1, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, int a7, uint64_t *a8, char a9, uint64_t a10)
{
  uint64_t *v10;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
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
  uint64_t (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134[2];

  v129 = a8;
  LODWORD(v131) = a7;
  v120 = a6;
  v113 = a5;
  v130 = a3;
  v117 = *v10;
  v13 = a4 & 1;
  LODWORD(v128) = a9 & 1;
  v14 = sub_23220039C();
  v122 = *(_QWORD *)(v14 - 8);
  v123 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v121 = (char *)&v104 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v118 = (char *)&v104 - v17;
  v18 = sub_2321FE584();
  v114 = *(_QWORD *)(v18 - 8);
  v115 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v106 = (char *)&v104 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B28C0, v21, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v105 = (uint64_t)&v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v108 = (uint64_t)&v104 - v25;
  v111 = sub_2321FD9C0();
  v110 = *(_QWORD *)(v111 - 8);
  v26 = MEMORY[0x24BDAC7A8](v111);
  v107 = (char *)&v104 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v109 = (char *)&v104 - v28;
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], v20);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v104 - v30;
  v32 = sub_2321FD8B8();
  v33 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v119 = (char *)&v104 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80];
  sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], v20);
  MEMORY[0x24BDAC7A8](v36);
  v38 = (char *)&v104 - v37;
  v112 = a1;
  v39 = sub_2321E9C08(a1, a2);
  v126 = v40;
  v127 = v39;
  v124 = v41;
  v125 = v42;
  v43 = sub_2321FFD00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v38, 1, 1, v43);
  v44 = (uint64_t)v129;
  v116 = v13;
  v129 = v10;
  v45 = sub_2321E9DAC(a2, v130, v13, (uint64_t)v38, v131, v44, (char)v128);
  v47 = v46;
  sub_232016D88((uint64_t)v38, &qword_2541B2A40, v35);
  if (!v47)
  {
    sub_232200318();
    v48 = a2;
    v49 = sub_232200390();
    v50 = sub_2322012CC();
    if (os_log_type_enabled(v49, v50))
    {
      LODWORD(v129) = v116 != 0;
      v51 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v134[0] = v52;
      *(_DWORD *)v51 = 136315906;
      v132 = v117;
      swift_getMetatypeMetadata();
      v53 = sub_232200F00();
      v132 = sub_232013174(v53, v54, v134);
      sub_232201710();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2080;
      v55 = objc_msgSend(v48, sel_sensitiveLoggingIdentifier);
      v56 = sub_232200EC4();
      v58 = v57;

      v132 = sub_232013174(v56, v58, v134);
      sub_232201710();

      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 22) = 2080;
      v132 = v130;
      LOBYTE(v133) = (_BYTE)v129;
      sub_2320057B8(0, &qword_255FA16C0, (uint64_t (*)(uint64_t))type metadata accessor for HKProfileType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      v59 = sub_232200F00();
      v132 = sub_232013174(v59, v60, v134);
      sub_232201710();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 32) = 2080;
      LOBYTE(v132) = v131;
      v61 = sub_232200F00();
      v132 = sub_232013174(v61, v62, v134);
      sub_232201710();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231FFB000, v49, v50, "[%s] Was not able to create string key for objectType: %s, profile: %s and dateRange: %s", (uint8_t *)v51, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v52, -1, -1);
      MEMORY[0x2348FF468](v51, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v122 + 8))(v121, v123);
    return v127;
  }
  v128 = a2;
  sub_232016080(v120, (uint64_t)v31, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878]);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1)
  {
    swift_bridgeObjectRelease();
    sub_232016D88((uint64_t)v31, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878]);
LABEL_12:
    v73 = v118;
    sub_232200318();
    v74 = sub_232200390();
    v75 = sub_2322012CC();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc();
      v77 = swift_slowAlloc();
      v134[0] = v77;
      *(_DWORD *)v76 = 136315138;
      v132 = v117;
      swift_getMetatypeMetadata();
      v78 = sub_232200F00();
      v132 = sub_232013174(v78, v79, v134);
      sub_232201710();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231FFB000, v74, v75, "[%s] Was not able to get change period value. Returning short strings.", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v77, -1, -1);
      MEMORY[0x2348FF468](v76, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v122 + 8))(v73, v123);
    return v127;
  }
  v63 = v119;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v119, v31, v32);
  v64 = sub_23206AEA8(v131, a10);
  if ((v65 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v63, v32);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v66 = v64;
  v123 = v33;
  v131 = v32;
  v67 = v108;
  sub_232016080(v113, v108, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
  v69 = v114;
  v68 = v115;
  v121 = *(char **)(v114 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v121)(v67, 1, v115) == 1)
  {
    sub_232016D88(v67, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
    v70 = (uint64_t)v109;
    sub_2321FD9B4();
    v71 = v111;
    v72 = v110;
  }
  else
  {
    v81 = v107;
    sub_2321FE578();
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v67, v68);
    v72 = v110;
    v70 = (uint64_t)v109;
    v71 = v111;
    (*(void (**)(char *, char *, uint64_t))(v110 + 32))(v109, v81, v111);
  }
  v122 = sub_232089154(v45, v47, (uint64_t)"", 0, 2, v70);
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v70, v71);
  v132 = v45;
  v133 = v47;
  swift_bridgeObjectRetain();
  sub_232200F48();
  swift_bridgeObjectRelease();
  v82 = v132;
  v83 = v133;
  if (qword_2541B7488 != -1)
    swift_once();
  sub_2321FDA14();
  sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v84 = swift_allocObject();
  v85 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v84 + 16) = xmmword_232210D40;
  v86 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v84 + 56) = v85;
  *(_QWORD *)(v84 + 64) = v86;
  *(_QWORD *)(v84 + 32) = v66;
  v87 = sub_232200EA0();
  v89 = v88;
  swift_bridgeObjectRelease();
  v132 = v82;
  v133 = v83;
  swift_bridgeObjectRetain();
  sub_232200F48();
  swift_bridgeObjectRelease();
  v90 = sub_2321EB97C(v112, v128, v132, v133);
  v92 = v91;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v116)
    goto LABEL_23;
  if (v130 == 2)
  {
    v96 = v105;
    sub_232016080(v113, v105, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
    v97 = v115;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v121)(v96, 1, v115) != 1)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(void))(v114 + 32))();
      v98 = swift_allocObject();
      *(_OWORD *)(v98 + 16) = xmmword_232211930;
      v99 = sub_2321FE56C();
      v101 = v100;
      v102 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v98 + 56) = MEMORY[0x24BEE0D00];
      v103 = sub_2320168D8();
      *(_QWORD *)(v98 + 32) = v99;
      *(_QWORD *)(v98 + 40) = v101;
      *(_QWORD *)(v98 + 96) = v102;
      *(_QWORD *)(v98 + 104) = v103;
      *(_QWORD *)(v98 + 64) = v103;
      *(_QWORD *)(v98 + 72) = v90;
      *(_QWORD *)(v98 + 80) = v92;
      *(_QWORD *)(v98 + 136) = v102;
      *(_QWORD *)(v98 + 144) = v103;
      *(_QWORD *)(v98 + 112) = v87;
      *(_QWORD *)(v98 + 120) = v89;
      sub_232200EA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v114 + 8))(v106, v97);
      goto LABEL_27;
    }
    (*(void (**)(char *, uint64_t))(v123 + 8))(v119, v131);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232016D88(v96, &qword_2541B28C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47CC8]);
    return v127;
  }
  if (v130 != 1)
  {
LABEL_23:
    (*(void (**)(char *, uint64_t))(v123 + 8))(v119, v131);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v127;
  }
  swift_bridgeObjectRelease();
  v93 = swift_allocObject();
  *(_OWORD *)(v93 + 16) = xmmword_232210D30;
  v94 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v93 + 56) = MEMORY[0x24BEE0D00];
  v95 = sub_2320168D8();
  *(_QWORD *)(v93 + 32) = v90;
  *(_QWORD *)(v93 + 40) = v92;
  *(_QWORD *)(v93 + 96) = v94;
  *(_QWORD *)(v93 + 104) = v95;
  *(_QWORD *)(v93 + 64) = v95;
  *(_QWORD *)(v93 + 72) = v87;
  *(_QWORD *)(v93 + 80) = v89;
  sub_232200EA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_27:
  (*(void (**)(char *, uint64_t))(v123 + 8))(v119, v131);
  return v127;
}

uint64_t sub_2321E9C08(void *a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_2321EB97C(a1, a2, 0, 0);
  v4 = v3;
  if (qword_2541B7488 != -1)
    swift_once();
  sub_2321FDA14();
  sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_232210D40;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 64) = sub_2320168D8();
  *(_QWORD *)(v5 + 32) = v2;
  *(_QWORD *)(v5 + 40) = v4;
  sub_232200EA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_2321FDA14();
}

uint64_t sub_2321E9DAC(void *a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, char a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v12 = sub_2321E9F9C(a1, a4);
  if (!v13)
    return 0;
  v14 = v12;
  sub_2321EAE78(a2, a3 & 1);
  if (v15)
  {
    sub_2321EB0D4(a4);
    if (v16)
    {
      if (a5 == 4)
      {
        if ((a7 & 1) != 0)
          goto LABEL_7;
        goto LABEL_12;
      }
      if (a5 == 5)
      {
        if ((a7 & 1) != 0)
        {
LABEL_7:
          sub_2321EC550();
LABEL_13:
          sub_232200F48();
          sub_232200F48();
          swift_bridgeObjectRelease();
          sub_232200F48();
          sub_232200F48();
          swift_bridgeObjectRelease();
          sub_232200F48();
          sub_232200F48();
          swift_bridgeObjectRelease();
          sub_232200F48();
          sub_232200F48();
          swift_bridgeObjectRelease();
          return v14;
        }
LABEL_12:
        sub_232201AB8();
        goto LABEL_13;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2321E9F9C(void *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  char v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  char v29;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  char v73;
  id v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  id v90[2];

  v90[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *v2;
  v6 = sub_23220039C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, sel_identifier);
  v11 = sub_232200EC4();
  v13 = v12;

  if (sub_232200EC4() == v11 && v14 == v13)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    v21 = sub_2321FFD00();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(a2, 1, v21) == 1)
      return 0x455F455649544341;
    v22 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, v2[2]);
    v23 = objc_msgSend(v22, sel_preferredUnitForType_, a1);

    sub_232003E9C(0, qword_2541B74A8);
    v24 = sub_232200E94();
    v25 = (void *)objc_opt_self();
    v26 = objc_msgSend(v25, sel_unitFromString_, v24);

    LOBYTE(v24) = sub_2322016A4();
    if ((v24 & 1) != 0)
    {

      return 0xD000000000000012;
    }
    else
    {
      v27 = (void *)sub_232200E94();
      v28 = objc_msgSend(v25, sel_unitFromString_, v27);

      v29 = sub_2322016A4();
      if ((v29 & 1) != 0)
        return 0xD000000000000010;
      else
        return 0xD000000000000011;
    }
  }
  v88 = v5;
  v16 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
    goto LABEL_14;
  if (sub_232200EC4() == v11 && v17 == v13)
  {
    v20 = 0x53414D5F59444F42;
LABEL_22:
    swift_bridgeObjectRelease_n();
    return v20;
  }
  v19 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    v20 = 0x53414D5F59444F42;
LABEL_12:
    swift_bridgeObjectRelease();
    return v20;
  }
  if (sub_232200EC4() == v11 && v31 == v13)
  {
    v20 = 0x5F53544847494C46;
    goto LABEL_22;
  }
  v32 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
  {
    v20 = 0x5F53544847494C46;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v33 == v13)
  {
LABEL_73:
    v20 = 0xD000000000000010;
    swift_bridgeObjectRelease_n();
    return v20;
  }
  v34 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v34 & 1) != 0)
    goto LABEL_75;
  if (sub_232200EC4() == v11 && v35 == v13)
    goto LABEL_73;
  v36 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v36 & 1) != 0)
    goto LABEL_75;
  if (sub_232200EC4() == v11 && v37 == v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v38 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
  {
LABEL_41:
    v20 = 0x4F485F444E415453;
    swift_bridgeObjectRelease();
    v39 = (void *)v2[2];
    v90[0] = 0;
    v40 = objc_msgSend(v39, sel_wheelchairUseWithError_, v90);
    if (v40)
    {
      v41 = v40;
      v42 = v90[0];
      v43 = objc_msgSend(v41, sel_wheelchairUse);

      if (v43 == (id)2)
        return 0x554F485F4C4C4F52;
    }
    else
    {
      v44 = v90[0];
      v45 = (void *)sub_2321FDA5C();

      swift_willThrow();
    }
    return v20;
  }
  if (sub_232200EC4() == v11 && v46 == v13)
  {
    v20 = 0x4C475F444F4F4C42;
    goto LABEL_22;
  }
  v47 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
  {
    v20 = 0x4C475F444F4F4C42;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v48 == v13)
  {
    swift_bridgeObjectRelease_n();
    return 0xD000000000000011;
  }
  v49 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v49 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0xD000000000000011;
  }
  if (sub_232200EC4() == v11 && v50 == v13)
    goto LABEL_73;
  v51 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v51 & 1) != 0)
    goto LABEL_75;
  if (sub_232200EC4() == v11 && v52 == v13)
  {
    v20 = 0x5F4C5546444E494DLL;
    goto LABEL_22;
  }
  v53 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v53 & 1) != 0)
  {
    v20 = 0x5F4C5546444E494DLL;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v54 == v13)
  {
    swift_bridgeObjectRelease_n();
    return 0xD000000000000011;
  }
  v55 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v55 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0xD000000000000011;
  }
  if (sub_232200EC4() == v11 && v56 == v13)
    goto LABEL_73;
  v57 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v57 & 1) != 0)
  {
LABEL_75:
    v20 = 0xD000000000000010;
    swift_bridgeObjectRelease();
    return v20;
  }
  if (sub_232200EC4() == v11 && v58 == v13)
  {
    swift_bridgeObjectRelease_n();
    return 0xD000000000000012;
  }
  v59 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v59 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0xD000000000000012;
  }
  if (sub_232200EC4() == v11 && v60 == v13)
  {
    v20 = 0x4E415F5045454C53;
    goto LABEL_22;
  }
  v61 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v61 & 1) != 0)
  {
    v20 = 0x4E415F5045454C53;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v62 == v13)
  {
    v20 = 0x554F435F50455453;
    goto LABEL_22;
  }
  v63 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v63 & 1) != 0)
  {
    v20 = 0x554F435F50455453;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v64 == v13)
  {
    v20 = 0x534548535550;
    swift_bridgeObjectRelease_n();
    return v20;
  }
  v65 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v65 & 1) != 0)
  {
    v20 = 0x534548535550;
    swift_bridgeObjectRelease();
    return v20;
  }
  if (sub_232200EC4() == v11 && v66 == v13)
  {
    v20 = 0x465F4F4944524143;
    goto LABEL_22;
  }
  v67 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v67 & 1) != 0)
  {
    v20 = 0x465F4F4944524143;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v68 == v13)
  {
    v20 = 0x525F4F4944524143;
    goto LABEL_22;
  }
  v69 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v69 & 1) != 0)
  {
    v20 = 0x525F4F4944524143;
    goto LABEL_12;
  }
  if (sub_232200EC4() == v11 && v70 == v13)
  {
    swift_bridgeObjectRelease_n();
    return 0xD000000000000012;
  }
  v71 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v71 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0xD000000000000012;
  }
  if (sub_232200EC4() == v11 && v72 == v13)
  {
    swift_bridgeObjectRelease_n();
    return 0x5354554F4B524F57;
  }
  v73 = sub_232201ADC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v73 & 1) != 0)
    return 0x5354554F4B524F57;
  sub_232200318();
  v74 = a1;
  v75 = sub_232200390();
  v76 = sub_2322012E4();
  v87 = v76;
  if (os_log_type_enabled(v75, v76))
  {
    v77 = swift_slowAlloc();
    v86 = (void *)swift_slowAlloc();
    v90[0] = v86;
    *(_DWORD *)v77 = 136315395;
    v78 = sub_232201BF0();
    v89 = sub_232013174(v78, v79, (uint64_t *)v90);
    sub_232201710();
    swift_bridgeObjectRelease();
    *(_WORD *)(v77 + 12) = 2081;
    v88 = v77 + 14;
    v80 = objc_msgSend(v74, sel_identifier);
    v81 = sub_232200EC4();
    v83 = v82;

    v89 = sub_232013174(v81, v83, (uint64_t *)v90);
    sub_232201710();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231FFB000, v75, (os_log_type_t)v87, "%s Unexpected object type %{private}s for trend string", (uint8_t *)v77, 0x16u);
    v84 = v86;
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v84, -1, -1);
    MEMORY[0x2348FF468](v77, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

uint64_t sub_2321EAE78(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v4 = sub_23220039C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    if (a1 == 1)
      return 0x505F454C474E4953;
    if (a1 == 2)
      return 0x474E4952414853;
  }
  sub_232200318();
  v9 = sub_232200390();
  v10 = sub_2322012E4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v20 = v17;
    *(_DWORD *)v11 = 136315395;
    v12 = sub_232201BF0();
    v18 = sub_232013174(v12, v13, &v20);
    sub_232201710();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2081;
    v18 = a1;
    v19 = a2 & 1;
    sub_2320057B8(0, &qword_255FA16C0, (uint64_t (*)(uint64_t))type metadata accessor for HKProfileType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v14 = sub_232200F00();
    v18 = sub_232013174(v14, v15, &v20);
    sub_232201710();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231FFB000, v9, v10, "%s Unexpected profile type %{private}s for trend string", (uint8_t *)v11, 0x16u);
    v16 = v17;
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v16, -1, -1);
    MEMORY[0x2348FF468](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

uint64_t sub_2321EB0D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  v3 = *v1;
  v4 = sub_23220039C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80];
  sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v26 - v13;
  sub_232016080(a1, (uint64_t)v26 - v13, &qword_2541B2A40, v8);
  v15 = sub_2321FFD00();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    v17 = 0x554C434E4F434E49;
  }
  else
  {
    v17 = 0x4953414552434544;
    sub_232016080((uint64_t)v14, (uint64_t)v12, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
    v18 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v12, v15);
    if (v18 == *MEMORY[0x24BE4AC68])
    {
      v17 = 0x4953414552434E49;
    }
    else if (v18 != *MEMORY[0x24BE4AC60])
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
      sub_232200318();
      v19 = sub_232200390();
      v20 = sub_2322012E4();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = swift_slowAlloc();
        *(_DWORD *)v21 = 136315138;
        v26[1] = v21 + 4;
        v27 = v22;
        v28 = v3;
        swift_getMetatypeMetadata();
        v23 = sub_232200F00();
        v28 = sub_232013174(v23, v24, &v27);
        sub_232201710();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231FFB000, v19, v20, "[%s]: Unknown changeType.", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348FF468](v22, -1, -1);
        MEMORY[0x2348FF468](v21, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v17 = 0;
    }
  }
  sub_232016D88((uint64_t)v14, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
  return v17;
}

unint64_t sub_2321EB3EC()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int EnumCaseMultiPayload;
  void (*v18)(char *, uint64_t);
  unint64_t v19;
  uint64_t (*v20)(void);
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;
  char v24;
  void *v25;
  char v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t (*v30)(void);
  uint64_t v32[2];
  uint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;

  v1 = sub_2321FDC6C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2321FD8B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v32[1] = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v32[0] = (uint64_t)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v32 - v12;
  v14 = type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321ED908(v0, (uint64_t)v16);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_2321ED94C((uint64_t)v16, (uint64_t)v13);
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_23220189C();
    swift_bridgeObjectRelease();
    v35 = 0xD00000000000002DLL;
    v36 = 0x800000023220AFB0;
    v20 = MEMORY[0x24BE4AC80];
    sub_232016080((uint64_t)v13, v32[0], &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
    sub_232200F00();
    sub_232200F48();
    swift_bridgeObjectRelease();
    v19 = v35;
    v21 = (uint64_t)v13;
    v22 = (uint64_t (*)(uint64_t))v20;
LABEL_6:
    sub_232016D88(v21, &qword_2541B2A40, v22);
    return v19;
  }
  if (EnumCaseMultiPayload != 1)
  {
    v23 = *(_QWORD *)v16;
    v24 = v16[8];
    v25 = (void *)*((_QWORD *)v16 + 2);
    v26 = v16[24];
    sub_2321EC6A0();
    sub_2321ED94C((uint64_t)&v16[*(int *)(v27 + 80)], (uint64_t)v13);
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_23220189C();
    sub_232200F48();
    v33 = v23;
    v34 = v24;
    sub_2320057B8(0, &qword_255FA16C0, (uint64_t (*)(uint64_t))type metadata accessor for HKProfileType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_232200F00();
    sub_232200F48();
    swift_bridgeObjectRelease();
    sub_232200F48();
    v28 = v25;
    v29 = objc_msgSend(v28, sel_description);
    sub_232200EC4();

    sub_232200F48();
    swift_bridgeObjectRelease();
    sub_232200F48();
    LOBYTE(v33) = v26;
    sub_232200F00();
    sub_232200F48();
    swift_bridgeObjectRelease();
    sub_232200F48();
    v30 = MEMORY[0x24BE4AC80];
    sub_232016080((uint64_t)v13, v32[0], &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
    sub_232200F00();
    sub_232200F48();
    swift_bridgeObjectRelease();
    sub_232200F48();

    v19 = v35;
    v21 = (uint64_t)v13;
    v22 = (uint64_t (*)(uint64_t))v30;
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v16, v5);
  v35 = 0;
  v36 = 0xE000000000000000;
  sub_23220189C();
  sub_232200F48();
  sub_2321FD894();
  sub_232000590(&qword_2541AF170, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  sub_232201AB8();
  v18 = *(void (**)(char *, uint64_t))(v2 + 8);
  v18(v4, v1);
  sub_232200F48();
  swift_bridgeObjectRelease();
  sub_232200F48();
  sub_2321FD870();
  sub_232201AB8();
  v18(v4, v1);
  sub_232200F48();
  swift_bridgeObjectRelease();
  v19 = v35;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v19;
}

uint64_t sub_2321EB930()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SummaryTrendFeedItemStringBuilder()
{
  return objc_opt_self();
}

id sub_2321EB97C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id result;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  id v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  char v59;
  double v60;
  double v61;
  id v62;
  uint64_t v63;
  char v64;
  double v65;
  double v66;
  double v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;

  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, *(_QWORD *)(v4 + 16));
  v9 = objc_msgSend(v8, sel_profile);
  v10 = objc_msgSend(v9, sel_displayTypeController);

  objc_msgSend(a1, sel__value);
  v11 = (void *)sub_23220108C();
  if (!v10)
    goto LABEL_7;
  v12 = objc_msgSend(v10, sel_displayTypeForObjectType_, a2);
  if (!v12)
  {

LABEL_7:
    return 0;
  }
  v13 = v12;
  v78 = a4;
  v79 = v11;
  v14 = objc_msgSend(a2, sel_identifier);
  v15 = (id)sub_232200EC4();
  v17 = v16;

  if ((id)sub_232200EC4() == v15 && v18 == v17)
    goto LABEL_5;
  v20 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v26 == v17)
    goto LABEL_5;
  v27 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v28 == v17)
    goto LABEL_5;
  v29 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v30 == v17)
    goto LABEL_5;
  v31 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v31 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v32 == v17)
    goto LABEL_5;
  v33 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v34 == v17)
    goto LABEL_5;
  v35 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v36 == v17)
    goto LABEL_5;
  v37 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v38 == v17)
    goto LABEL_5;
  v39 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v39 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v40 == v17)
  {
LABEL_5:
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    v21 = objc_msgSend(a1, sel__unit);
    v15 = objc_msgSend(v13, sel_hk_valueFormatterForUnit_, v21);

    v22 = v79;
    v23 = objc_msgSend(v15, sel_stringFromValue_displayType_unitController_, v79, v13, *(_QWORD *)(v4 + 24));
    if (v23)
    {
      v24 = v23;
      sub_232200EC4();

LABEL_11:
      sub_232002E08();
      v19 = sub_232201734();
      swift_bridgeObjectRelease();

      return (id)v19;
    }
    __break(1u);
    goto LABEL_57;
  }
  v41 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v41 & 1) != 0)
    goto LABEL_9;
  if ((id)sub_232200EC4() == v15 && v42 == v17)
    goto LABEL_39;
  v43 = sub_232201ADC();
  swift_bridgeObjectRelease();
  if ((v43 & 1) == 0)
  {
    if ((id)sub_232200EC4() == v15 && v44 == v17)
    {
LABEL_39:
      swift_bridgeObjectRelease();
      goto LABEL_44;
    }
    v45 = sub_232201ADC();
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0)
    {
LABEL_57:
      if ((id)sub_232200EC4() == v15 && v58 == v17)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v59 = sub_232201ADC();
        swift_bridgeObjectRelease();
        if ((v59 & 1) == 0)
          goto LABEL_69;
      }
      swift_bridgeObjectRelease();
      if (v78)
      {
        if (qword_2541B7488 == -1)
          goto LABEL_63;
        goto LABEL_83;
      }
      v62 = objc_msgSend(a1, sel__unit);
      v15 = objc_msgSend(v13, sel_hk_valueFormatterForUnit_, v62);

      result = objc_msgSend(v15, sel_stringFromValue_displayType_unitController_, v79, v13, *(_QWORD *)(v4 + 24));
      if (!result)
      {
        __break(1u);
LABEL_69:
        if ((id)sub_232200EC4() == v15 && v63 == v17)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_73;
        }
        v64 = sub_232201ADC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v64 & 1) != 0)
        {
LABEL_73:
          result = objc_msgSend(a1, sel__value);
          v66 = v65 / 3600.0;
          if ((~*(_QWORD *)&v66 & 0x7FF0000000000000) != 0)
          {
            if (v66 > -9.22337204e18)
            {
              if (v66 < 9.22337204e18)
              {
                v67 = (double)(uint64_t)v66;
                v68 = objc_msgSend((id)objc_opt_self(), sel_countUnit);
                v69 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v68, v67);

                v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A7F8]), sel_init);
                objc_msgSend(v70, sel_setOmitUnit_, 1);
                v71 = objc_msgSend(v69, sel_localizedStringForType_parameters_, a2, v70);
                sub_232200EC4();

                goto LABEL_55;
              }
              goto LABEL_89;
            }
LABEL_88:
            __break(1u);
LABEL_89:
            __break(1u);
            goto LABEL_90;
          }
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
        v72 = *(_QWORD *)(v4 + 24);
        v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A918]), sel_initWithDisplayType_unitPreferenceController_forceUnitlessForAllTypes_, v13, v72, 1);
        v73 = objc_msgSend(v57, sel_stringFromNumber_displayType_unitController_, v79, v13, v72);
        if (v73)
        {
          v74 = v73;
          sub_232200EC4();

          goto LABEL_55;
        }
        sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
        v75 = swift_allocObject();
        *(_OWORD *)(v75 + 16) = xmmword_232210D40;
        objc_msgSend(a1, sel__value);
        v76 = MEMORY[0x24BEE1448];
        *(_QWORD *)(v75 + 56) = MEMORY[0x24BEE13C8];
        *(_QWORD *)(v75 + 64) = v76;
        *(_QWORD *)(v75 + 32) = v77;
        sub_232200EE8();
LABEL_54:

        goto LABEL_55;
      }
LABEL_53:
      v57 = result;
      sub_232200EC4();

      goto LABEL_54;
    }
  }
LABEL_44:
  swift_bridgeObjectRelease();
  if (v78)
  {
    if (qword_2541B7488 != -1)
      swift_once();
    sub_2321FDA14();
    v46 = objc_msgSend(v13, sel_presentation, 0xE000000000000000);
    v47 = objc_msgSend(a1, sel__unit);
    objc_msgSend(a1, sel_doubleValueForUnit_, v47);
    v49 = v48;

    objc_msgSend(v46, sel_adjustedDoubleForDaemonDouble_, v49);
    v51 = v50;

    if ((~*(_QWORD *)&v51 & 0x7FF0000000000000) != 0)
    {
      if (v51 > -9.22337204e18)
      {
        if (v51 < 9.22337204e18)
        {
          v52 = (uint64_t)v51;
LABEL_51:
          sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
          v53 = swift_allocObject();
          v54 = MEMORY[0x24BEE1768];
          *(_OWORD *)(v53 + 16) = xmmword_232210D40;
          v55 = MEMORY[0x24BEE17F0];
          *(_QWORD *)(v53 + 56) = v54;
          *(_QWORD *)(v53 + 64) = v55;
          *(_QWORD *)(v53 + 32) = v52;
          sub_232200EA0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_55:
          v22 = v79;
          goto LABEL_11;
        }
        goto LABEL_82;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    swift_once();
LABEL_63:
    sub_2321FDA14();
    result = objc_msgSend(a1, sel__value, 0xE000000000000000);
    v61 = round(v60 / 60.0);
    if ((~*(_QWORD *)&v61 & 0x7FF0000000000000) != 0)
    {
      if (v61 > -9.22337204e18)
      {
        if (v61 < 9.22337204e18)
        {
          v52 = (uint64_t)v61;
          goto LABEL_51;
        }
        goto LABEL_86;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  v56 = objc_msgSend(a1, sel__unit);
  v15 = objc_msgSend(v13, sel_hk_valueFormatterForUnit_, v56);

  result = objc_msgSend(v15, sel_stringFromValue_displayType_unitController_, v79, v13, *(_QWORD *)(v4 + 24));
  if (result)
    goto LABEL_53;
LABEL_90:
  __break(1u);
  return result;
}

uint64_t sub_2321EC550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  uint64_t result;
  double v7;
  _QWORD v8[2];

  v0 = sub_2321FDC6C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321FDC60();
  sub_2321FDAEC();
  v5 = v4;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = v5 / 86400.0;
  if ((~COERCE__INT64(v5 / 86400.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v7 < 9.22337204e18)
  {
    v8[1] = (uint64_t)v7 % 3 + 1;
    return sub_232201AB8();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure()
{
  uint64_t result;

  result = qword_255FA1748;
  if (!qword_255FA1748)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2321EC6A0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  unint64_t TupleTypeMetadata;
  uint64_t v2;

  if (!qword_255FA16D0)
  {
    MEMORY[0x24BDAC7A8](0);
    v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
    sub_2320057B8(255, &qword_255FA16C0, (uint64_t (*)(uint64_t))type metadata accessor for HKProfileType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_232003E9C(255, (unint64_t *)&qword_2541B74A0);
    sub_2320057B8(255, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], v0);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v2)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_255FA16D0);
  }
}

char *sub_2321EC7E8(uint64_t a1, uint64_t a2, char a3)
{
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
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v30 - v10;
  v12 = sub_23206ACAC(a3);
  if (!v13)
  {
    type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
    sub_232000590(&qword_255FA16C8, (uint64_t (*)(uint64_t))type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure, (uint64_t)&unk_23221A558);
    swift_allocError();
    v19 = v18;
    v20 = sub_2321FD8B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v19, a1, v20);
LABEL_13:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return v11;
  }
  v14 = v12;
  v15 = v13;
  sub_232016080(a2, (uint64_t)v11, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
  v16 = sub_2321FFD00();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, v16) == 1)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    v27 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80];
    sub_232016D88((uint64_t)v11, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
    v11 = (char *)type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
    sub_232000590(&qword_255FA16C8, (uint64_t (*)(uint64_t))type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure, (uint64_t)&unk_23221A558);
    swift_allocError();
    sub_232016080(a2, v28, &qword_2541B2A40, v27);
    goto LABEL_13;
  }
  sub_232016080((uint64_t)v11, (uint64_t)v9, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
  v21 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v9, v16);
  if (v21 == *MEMORY[0x24BE4AC68])
  {
    v33 = v14;
    if (qword_2541B7488 == -1)
      goto LABEL_10;
    goto LABEL_15;
  }
  if (v21 != *MEMORY[0x24BE4AC60])
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v16);
    goto LABEL_12;
  }
  v33 = v14;
  if (qword_2541B7488 != -1)
LABEL_15:
    swift_once();
LABEL_10:
  v31 = sub_2321FDA14();
  v32 = v22;
  sub_2321FDA14();
  sub_232016D88((uint64_t)v11, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80]);
  sub_2320057B8(0, (unint64_t *)&qword_2541B5860, (uint64_t (*)(uint64_t))sub_23204FB8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v23 = swift_allocObject();
  v30 = xmmword_232210D40;
  *(_OWORD *)(v23 + 16) = xmmword_232210D40;
  *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
  v24 = sub_2320168D8();
  *(_QWORD *)(v23 + 64) = v24;
  v25 = v33;
  *(_QWORD *)(v23 + 32) = v33;
  *(_QWORD *)(v23 + 40) = v15;
  swift_bridgeObjectRetain();
  v11 = (char *)sub_232200EA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v30;
  *(_QWORD *)(v26 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v26 + 64) = v24;
  *(_QWORD *)(v26 + 32) = v25;
  *(_QWORD *)(v26 + 40) = v15;
  sub_232200EA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_2321ECD1C(char *a1, char *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      a1[8] = a2[8];
      v9 = (void *)*((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 2) = v9;
      a1[24] = a2[24];
      sub_2321EC6A0();
      v11 = *(int *)(v10 + 80);
      v12 = &a1[v11];
      v13 = &a2[v11];
      v14 = sub_2321FFD00();
      v15 = *(_QWORD *)(v14 - 8);
      v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
      v17 = v9;
      if (v16(v13, 1, v14))
      {
        sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = sub_2321FD8B8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      v19 = sub_2321FFD00();
      v20 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(a2, 1, v19))
      {
        sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(a1, a2, v19);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(a1, 0, 1, v19);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2321ECF44(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {

    sub_2321EC6A0();
    a1 += *(int *)(v3 + 80);
  }
  else
  {
    if ((_DWORD)result == 1)
    {
      v6 = sub_2321FD8B8();
      v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
      v8 = a1;
      return v7(v8, v6);
    }
    if ((_DWORD)result)
      return result;
  }
  v4 = sub_2321FFD00();
  v5 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4);
  if (!(_DWORD)result)
  {
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v8 = a1;
    v6 = v4;
    return v7(v8, v6);
  }
  return result;
}

char *sub_2321ECFFC(char *a1, char *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1[8] = a2[8];
    v6 = (void *)*((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 2) = v6;
    a1[24] = a2[24];
    sub_2321EC6A0();
    v8 = *(int *)(v7 + 80);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_2321FFD00();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    v14 = v6;
    if (v13(v10, 1, v11))
    {
      sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = sub_2321FD8B8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    v16 = sub_2321FFD00();
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(a2, 1, v16))
    {
      sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(a1, a2, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_2321ED1F8(char *a1, char *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    sub_2321ED404((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v6 = *(_QWORD *)a2;
      a1[8] = a2[8];
      *(_QWORD *)a1 = v6;
      v7 = (void *)*((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 2) = v7;
      a1[24] = a2[24];
      sub_2321EC6A0();
      v9 = *(int *)(v8 + 80);
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = sub_2321FFD00();
      v13 = *(_QWORD *)(v12 - 8);
      v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
      v15 = v7;
      if (v14(v11, 1, v12))
      {
        sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v5 = sub_2321FD8B8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      v17 = sub_2321FFD00();
      v18 = *(_QWORD *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
      {
        sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(a1, a2, v17);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2321ED404(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_2321ED440(char *a1, char *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1[8] = a2[8];
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    a1[24] = a2[24];
    sub_2321EC6A0();
    v7 = *(int *)(v6 + 80);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_2321FFD00();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = sub_2321FD8B8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
  }
  else
  {
    v13 = sub_2321FFD00();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(a2, 1, v13))
    {
      sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(a1, a2, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_2321ED630(char *a1, char *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_2321ED404((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      a1[8] = a2[8];
      *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
      a1[24] = a2[24];
      sub_2321EC6A0();
      v7 = *(int *)(v6 + 80);
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = sub_2321FFD00();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v5 = sub_2321FD8B8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    }
    else
    {
      v13 = sub_2321FFD00();
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(a2, 1, v13))
      {
        sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(a1, a2, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_2321ED830()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  sub_2320057B8(319, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v1 <= 0x3F)
  {
    v5 = *(_QWORD *)(v0 - 8) + 64;
    v2 = sub_2321FD8B8();
    if (v3 <= 0x3F)
    {
      v6 = *(_QWORD *)(v2 - 8) + 64;
      swift_getTupleTypeLayout();
      v7 = &v4;
      swift_initEnumMetadataMultiPayload();
    }
  }
}

uint64_t sub_2321ED908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummaryTrendFeedItemStringBuilder.Failure();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2321ED94C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2320057B8(0, &qword_2541B2A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4AC80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2321ED9A8(uint64_t a1, uint64_t a2)
{
  char v4;
  _QWORD *v6;

  sub_232002E08();
  v4 = sub_232201740();
  if ((v4 & 1) != 0 || (sub_232201740() & 1) != 0)
    return (v4 & 1) == 0;
  sub_2321EDAB4();
  swift_allocError();
  *v6 = a1;
  v6[1] = a2;
  swift_bridgeObjectRetain();
  return swift_willThrow();
}

unint64_t sub_2321EDAB4()
{
  unint64_t result;

  result = qword_255FA1780;
  if (!qword_255FA1780)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A5CC, &type metadata for SummariesNotificationRouter.ResolutionError);
    atomic_store(result, (unint64_t *)&qword_255FA1780);
  }
  return result;
}

ValueMetadata *type metadata accessor for SummariesNotificationRouter.ResolutionError()
{
  return &type metadata for SummariesNotificationRouter.ResolutionError;
}

void **sub_2321EDB08(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(void **)((char *)a2 + v8);
    *(_QWORD *)v9 = v11;
    v9[8] = *((_BYTE *)a2 + v8 + 8);
    v12 = *(void **)((char *)a2 + v8 + 16);
    *((_QWORD *)v9 + 2) = v12;
    v13 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
    v14 = *(int *)(v13 + 28);
    v27 = &v10[v14];
    v28 = &v9[v14];
    v15 = sub_2321FE938();
    v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16 = v4;
    v17 = v11;
    v18 = v12;
    v26(v28, v27, v15);
    v19 = *(int *)(v13 + 32);
    v20 = *(void **)&v10[v19];
    *(_QWORD *)&v9[v19] = v20;
    v21 = *(int *)(a3 + 24);
    v22 = *(void **)((char *)a2 + v21);
    *(void **)((char *)v7 + v21) = v22;
    v23 = v20;
    v24 = v22;
  }
  return v7;
}

void sub_2321EDC1C(id *a1, uint64_t a2)
{
  id *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v4 = (id *)((char *)a1 + *(int *)(a2 + 20));
  v5 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
  v6 = (char *)v4 + *(int *)(v5 + 28);
  v7 = sub_2321FE938();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

}

void **sub_2321EDCB0(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  char *v25;
  char *v26;

  v5 = *a2;
  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = *(void **)((char *)a2 + v6);
  *(_QWORD *)v7 = v9;
  v7[8] = *((_BYTE *)a2 + v6 + 8);
  v10 = *(void **)((char *)a2 + v6 + 16);
  *((_QWORD *)v7 + 2) = v10;
  v11 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
  v12 = *(int *)(v11 + 28);
  v25 = &v8[v12];
  v26 = &v7[v12];
  v13 = sub_2321FE938();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v5;
  v16 = v9;
  v17 = v10;
  v14(v26, v25, v13);
  v18 = *(int *)(v11 + 32);
  v19 = *(void **)&v8[v18];
  *(_QWORD *)&v7[v18] = v19;
  v20 = *(int *)(a3 + 24);
  v21 = *(void **)((char *)a2 + v20);
  *(void **)((char *)a1 + v20) = v21;
  v22 = v19;
  v23 = v21;
  return a1;
}

void **sub_2321EDD98(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(void **)((char *)a1 + v9);
  v13 = *(void **)((char *)a2 + v9);
  *(_QWORD *)v10 = v13;
  v14 = v13;

  v10[8] = v11[8];
  v15 = (void *)*((_QWORD *)v11 + 2);
  v16 = (void *)*((_QWORD *)v10 + 2);
  *((_QWORD *)v10 + 2) = v15;
  v17 = v15;

  v18 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
  v19 = *(int *)(v18 + 28);
  v20 = &v10[v19];
  v21 = &v11[v19];
  v22 = sub_2321FE938();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  v23 = *(int *)(v18 + 32);
  v24 = *(void **)&v10[v23];
  v25 = *(void **)&v11[v23];
  *(_QWORD *)&v10[v23] = v25;
  v26 = v25;

  v27 = *(int *)(a3 + 24);
  v28 = *(void **)((char *)a2 + v27);
  v29 = *(void **)((char *)a1 + v27);
  *(void **)((char *)a1 + v27) = v28;
  v30 = v28;

  return a1;
}

_QWORD *sub_2321EDE90(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)v7 = *(_QWORD *)((char *)a2 + v6);
  v7[8] = *((_BYTE *)a2 + v6 + 8);
  *((_QWORD *)v7 + 2) = *(_QWORD *)((char *)a2 + v6 + 16);
  v9 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
  v10 = *(int *)(v9 + 28);
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_2321FE938();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_QWORD *)&v7[*(int *)(v9 + 32)] = *(_QWORD *)&v8[*(int *)(v9 + 32)];
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_2321EDF4C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(void **)((char *)a1 + v7);
  *(_QWORD *)v8 = *(_QWORD *)v9;

  v8[8] = v9[8];
  v11 = (void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = *((_QWORD *)v9 + 2);

  v12 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
  v13 = *(int *)(v12 + 28);
  v14 = &v8[v13];
  v15 = &v9[v13];
  v16 = sub_2321FE938();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = *(int *)(v12 + 32);
  v18 = *(void **)&v8[v17];
  *(_QWORD *)&v8[v17] = *(_QWORD *)&v9[v17];

  v19 = *(int *)(a3 + 24);
  v20 = *(void **)((char *)a1 + v19);
  *(void **)((char *)a1 + v19) = *(void **)((char *)a2 + v19);

  return a1;
}

uint64_t sub_2321EE030()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321EE03C(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_2321EE0B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2321EE0C4(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider()
{
  uint64_t result;

  result = qword_2541B25A8;
  if (!qword_2541B25A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2321EE174()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SnidgetFeedItemGeneratorRequest(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2321EE1F8(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_255F9CF58, (uint64_t (*)(uint64_t))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider, (uint64_t)&unk_23221A73C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_2321EE234(char *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  _BYTE *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v101 = a1;
  v95 = a2;
  v92 = a3;
  v4 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v97 = (uint64_t)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v96 = (uint64_t *)((char *)&v86 - v7);
  v8 = sub_23220039C();
  v98 = *(_QWORD *)(v8 - 8);
  v99 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v100 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2321FD8B8();
  v11 = (void (*)(uint64_t))MEMORY[0x24BDCB878];
  v91 = v10;
  v93 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v86 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_2541B2930, (void (*)(uint64_t))MEMORY[0x24BE42FE0]);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v90 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v87 = (char *)&v86 - v16;
  sub_2320002B4(0, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v86 - v21;
  sub_2320002B4(0, &qword_2541B7F60, v11);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v24);
  v88 = (uint64_t)&v86 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v89 = (char *)&v86 - v29;
  v30 = type metadata accessor for SnidgetFeedItemMetadata(0);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v86 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v94 = (char *)&v86 - v34;
  v35 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, *v3);
  if (v35)
  {
    v36 = v35;
    v37 = objc_msgSend(v35, sel_displayTypeForObjectType_, *(_QWORD *)((char *)v3 + *(int *)(v4 + 20) + 16));

    if (v37)
    {
      v38 = v102;
      sub_2320847A0(v101);
      if (v38)
      {

      }
      else
      {
        v53 = v39;
        if (v39)
        {
          v54 = v94;
          v64 = sub_2321EEB14(v94, v39, v95);
          v102 = (uint64_t)v37;
          sub_2320004AC((uint64_t)&v54[*(int *)(v30 + 20)], (uint64_t)v22, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
          v65 = sub_2321FE65C();
          v66 = *(_QWORD *)(v65 - 8);
          v67 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 48))(v22, 1, v65);
          v101 = v64;
          if (v67 == 1)
          {
            sub_23200040C((uint64_t)v22, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
            v68 = 1;
            v69 = v91;
            v70 = v87;
            v71 = (uint64_t)v89;
          }
          else
          {
            v71 = (uint64_t)v89;
            sub_2321FE638();
            (*(void (**)(char *, uint64_t))(v66 + 8))(v22, v65);
            v68 = 0;
            v69 = v91;
            v70 = v87;
          }
          v72 = v93;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v93 + 56))(v71, v68, 1, v69);
          v73 = v88;
          sub_2320004AC(v71, v88, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v73, 1, v69) == 1)
          {
            v74 = sub_2321FEF5C();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v70, 1, 1, v74);
          }
          else
          {
            v75 = v86;
            (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v86, v73, v69);
            sub_232000448();
            v77 = *(int *)(v76 + 48);
            sub_2321FD870();
            v70[v77] = 0;
            v78 = *MEMORY[0x24BE42FD8];
            v79 = sub_2321FEF5C();
            v80 = *(_QWORD *)(v79 - 8);
            v81 = v78;
            v71 = (uint64_t)v89;
            (*(void (**)(char *, uint64_t, uint64_t))(v80 + 104))(v70, v81, v79);
            (*(void (**)(char *, uint64_t))(v72 + 8))(v75, v69);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v80 + 56))(v70, 0, 1, v79);
          }
          v82 = v92;
          sub_2321FF208();
          v83 = sub_2321FF1FC();

          sub_232045E64(0);
          v63 = v94;
          sub_23200054C((uint64_t)v94, v82 + *(int *)(v84 + 52), type metadata accessor for SnidgetFeedItemMetadata);
          v85 = v101;
          *(_QWORD *)v82 = v83;
          *(_QWORD *)(v82 + 8) = v85;
          *(_BYTE *)(v82 + 16) = 1;
          sub_23200040C(v71, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
        }
        else
        {
          v56 = sub_2321FE65C();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v20, 1, 1, v56);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v93 + 56))(v26, 1, 1, v91);
          v57 = v95;
          swift_bridgeObjectRetain();
          sub_2320D71E8(0, (uint64_t)v20, v57, (uint64_t)v26, v33);
          sub_2321FF208();
          v58 = sub_2321FEF5C();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v90, 1, 1, v58);
          v59 = v37;
          v60 = sub_2321FF1FC();
          sub_232045E64(0);
          v62 = v92;
          sub_23200054C((uint64_t)v33, v92 + *(int *)(v61 + 52), type metadata accessor for SnidgetFeedItemMetadata);

          *(_QWORD *)v62 = v60;
          *(_QWORD *)(v62 + 8) = 0;
          v63 = v33;
          *(_BYTE *)(v62 + 16) = 1;
        }
        sub_232002CEC((uint64_t)v63, type metadata accessor for SnidgetFeedItemMetadata);
      }
    }
    else
    {
      v40 = v100;
      sub_232200318();
      v41 = v96;
      sub_23200054C((uint64_t)v3, (uint64_t)v96, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
      v42 = v97;
      sub_23200054C((uint64_t)v3, v97, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
      v43 = sub_232200390();
      v44 = sub_2322012E4();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = swift_slowAlloc();
        v102 = swift_slowAlloc();
        v104 = v102;
        *(_DWORD *)v45 = 136315394;
        v46 = sub_2320852A0(*v41, *((unsigned __int8 *)v41 + *(int *)(v4 + 20) + 8));
        v103 = sub_232013174(v46, v47, &v104);
        sub_232201710();
        swift_bridgeObjectRelease();
        sub_232002CEC((uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
        *(_WORD *)(v45 + 12) = 2080;
        v48 = objc_msgSend(*(id *)(v42 + *(int *)(v4 + 20) + 16), sel_sensitiveLoggingIdentifier);
        v49 = sub_232200EC4();
        v51 = v50;

        v103 = sub_232013174(v49, v51, &v104);
        sub_232201710();
        swift_bridgeObjectRelease();
        sub_232002CEC(v42, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
        _os_log_impl(&dword_231FFB000, v43, v44, "[%s]: unable to find display type: %s", (uint8_t *)v45, 0x16u);
        v52 = v102;
        swift_arrayDestroy();
        MEMORY[0x2348FF468](v52, -1, -1);
        MEMORY[0x2348FF468](v45, -1, -1);

        (*(void (**)(char *, uint64_t))(v98 + 8))(v100, v99);
      }
      else
      {
        sub_232002CEC((uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
        sub_232002CEC(v42, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);

        (*(void (**)(char *, uint64_t))(v98 + 8))(v40, v99);
      }
      sub_232005578();
      swift_allocError();
      *v55 = 0;
      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

char *sub_2321EEB14(_BYTE *a1, void *a2, uint64_t a3)
{
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
  char *v16;
  char *v17;
  char *result;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  char v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
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
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;

  v55 = a1;
  v56 = a3;
  v4 = sub_2321FF8B0();
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  v47 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v47 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v48 = (uint64_t)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23216A870();
  v49 = *(_QWORD *)(v8 - 8);
  v50 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v47 - v12;
  sub_2320002B4(0, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v47 - v15;
  if (objc_msgSend(a2, sel_hasBurdenValue))
  {
    v17 = (char *)objc_msgSend(a2, sel_burdenValue);
    if ((objc_msgSend(a2, sel_hasLastAnalysisDayIndexRange) & 1) == 0)
    {
      if (!v17)
        goto LABEL_19;
      goto LABEL_11;
    }
  }
  else
  {
    if (!objc_msgSend(a2, sel_hasLastAnalysisDayIndexRange))
    {
LABEL_19:
      v44 = sub_2321FE65C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v16, 1, 1, v44);
      v45 = sub_2321FD8B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v13, 1, 1, v45);
      v46 = v56;
      swift_bridgeObjectRetain();
      sub_2320D71E8(0, (uint64_t)v16, v46, (uint64_t)v13, v55);
      return 0;
    }
    v17 = 0;
  }
  result = (char *)objc_msgSend(a2, sel_lastAnalysisDayIndexRange);
  if (!result)
  {
    __break(1u);
    goto LABEL_24;
  }
  v19 = result;
  v20 = sub_232201530();
  v22 = v21;
  v24 = v23;

  if (!v17)
  {
    if ((v24 & 1) == 0)
    {
      v42 = v57;
      v43 = sub_2321EEFE0(v55, v20, v22, v56);
      if (!v42)
        return (char *)v43;
      return v10;
    }
    goto LABEL_19;
  }
  if ((v24 & 1) == 0)
  {
    v10 = (char *)sub_2321EFA9C(v55, v17, v20, v22, v56);

    return v10;
  }
LABEL_11:
  v25 = v17;
  if (!objc_msgSend(v17, sel_hasDayIndexRange))
    goto LABEL_15;
  result = (char *)objc_msgSend(v17, sel_dayIndexRange);
  if (result)
  {
    v26 = result;
    v27 = sub_232201530();
    v29 = v28;
    v31 = v30;

    v25 = v17;
    if ((v31 & 1) == 0)
    {
      v10 = (char *)sub_2321EF5E0(v55, v17, v27, v29, v56);

      return v10;
    }
LABEL_15:
    sub_232200378();
    v32 = v48;
    sub_23200054C(v54, v48, (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
    v33 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    v34 = swift_allocObject();
    sub_2321F1074(v32, v34 + v33);
    v35 = v51;
    v36 = v53;
    sub_2321FF838();
    v37 = v25;
    v38 = v50;
    sub_2321FF868();
    swift_release();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v38);
    v39 = sub_2321FE65C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v16, 1, 1, v39);
    v40 = sub_2321FD8B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v13, 1, 1, v40);
    v41 = v56;
    swift_bridgeObjectRetain();
    sub_2320D71E8(0, (uint64_t)v16, v41, (uint64_t)v13, v55);

    return 0;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_2321EEFE0(_BYTE *a1, uint64_t a2, char *a3, uint64_t a4)
{
  void **v4;
  void **v5;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  _QWORD *inited;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  id *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  _BYTE *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;

  v67 = a3;
  v5 = v4;
  v62 = a1;
  v63 = a4;
  v66 = a2;
  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v6);
  v61 = (char *)&v57 - v7;
  sub_2320002B4(0, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
  MEMORY[0x24BDAC7A8](v8);
  v60 = (char *)&v57 - v9;
  sub_2320002B4(0, &qword_2541B2368, (void (*)(uint64_t))MEMORY[0x24BE445A8]);
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)&v57 - v11;
  sub_2320002B4(0, (unint64_t *)&qword_2541B2838, (void (*)(uint64_t))MEMORY[0x24BDCC5A8]);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v58 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v65 = (char *)&v57 - v15;
  v16 = sub_2321FD8B8();
  v70 = *(_QWORD *)(v16 - 8);
  v71 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_2321FD9F0();
  v75 = *(_QWORD *)(v69 - 8);
  v19 = MEMORY[0x24BDAC7A8](v69);
  v64 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v57 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v72 = (char *)&v57 - v24;
  v25 = *v4;
  v26 = (void **)((char *)v5 + *(int *)(type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider() + 20));
  v27 = *(int *)(type metadata accessor for SnidgetFeedItemGeneratorRequest(0) + 32);
  v57 = v26;
  v28 = *(id *)((char *)v26 + v27);
  type metadata accessor for SnidgetStringBuilder();
  inited = (_QWORD *)swift_initStackObject();
  inited[2] = v25;
  v30 = (void *)objc_opt_self();
  v31 = v28;
  v32 = v25;
  v33 = objc_msgSend(v30, sel_sharedInstanceForHealthStore_, v32);
  inited[4] = v33;
  if (!v28)
  {
    v34 = v33;
    v31 = objc_msgSend(v34, sel_createHKUnitPreferenceController);

  }
  inited[3] = v31;
  v35 = v23;
  if (qword_2541B7488 != -1)
    swift_once();
  sub_2321FDA14();
  v36 = v72;
  SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)();
  swift_bridgeObjectRelease();
  v37 = (uint64_t)v5;
  sub_2321F00CC(v66, v67, v18);
  v38 = v68;
  sub_2321F0564((uint64_t)v18, (uint64_t)v23);
  if (v38)
  {
    swift_release();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v18, v71);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v36, v69);
  }
  else
  {
    v68 = 0;
    v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v75 + 56);
    v40 = v75;
    v41 = v69;
    v39(v65, 1, 1, v69);
    v42 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    v42(v64, v36, v41);
    v43 = v58;
    v42(v58, v35, v41);
    v39(v43, 0, 1, v41);
    v73 = 0x5F74656764696E53;
    v74 = 0xE800000000000000;
    v44 = v57[2];
    v45 = objc_msgSend(v44, sel_description);
    sub_232200EC4();
    v67 = v35;

    sub_232200F48();
    swift_bridgeObjectRelease();
    v46 = v59;
    sub_2321FF58C();
    swift_bridgeObjectRelease();
    v47 = sub_2321FF5A4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v46, 0, 1, v47);
    sub_2321FF6C4();
    swift_allocObject();
    v37 = sub_2321FF6B8();
    v48 = v41;
    v49 = v70;
    v50 = v71;
    v51 = (uint64_t)v61;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v61, v18, v71);
    v52 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56);
    v52(v51, 0, 1, v50);
    v53 = (uint64_t)v60;
    sub_2321FE650();
    v52(v51, 1, 1, v50);
    v54 = v63;
    swift_bridgeObjectRetain();
    sub_2320D71E8(1, v53, v54, v51, v62);
    swift_release();
    v55 = *(void (**)(char *, uint64_t))(v75 + 8);
    v55(v67, v48);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v18, v50);
    v55(v72, v48);
  }
  return v37;
}

uint64_t sub_2321EF5E0(_BYTE *a1, char *a2, uint64_t a3, char *a4, uint64_t a5)
{
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void *v30;
  char *v31;
  char *v32;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;

  v57 = a5;
  v58 = a3;
  v59 = a4;
  v62 = a2;
  v56 = a1;
  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v49 - v7;
  sub_2320002B4(0, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
  MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)&v49 - v9;
  sub_2320002B4(0, &qword_2541B2368, (void (*)(uint64_t))MEMORY[0x24BE445A8]);
  MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v49 - v11;
  sub_2320002B4(0, (unint64_t *)&qword_2541B2838, (void (*)(uint64_t))MEMORY[0x24BDCC5A8]);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v49 - v16;
  v18 = sub_2321FD8B8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v60 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_2321FD9F0();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v61 = (char *)&v49 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v49 - v28;
  v30 = v62;
  v62 = (char *)v5;
  v31 = v65;
  sub_2321F0858(v30, (uint64_t)&v49 - v28);
  if (!v31)
  {
    v50 = v25;
    v51 = v18;
    v65 = v29;
    v52 = v22;
    v32 = v60;
    sub_2321F00CC(v58, v59, v60);
    sub_2321F0564((uint64_t)v32, (uint64_t)v61);
    v59 = 0;
    v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56);
    v35 = v52;
    v49 = v17;
    v36 = v21;
    v34(v17, 1, 1, v21);
    v37 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
    v37(v50, v65, v36);
    v37(v15, v61, v36);
    v34(v15, 0, 1, v36);
    v63 = 0x5F74656764696E53;
    v64 = 0xE800000000000000;
    v38 = objc_retain(*(id *)&v62[*(int *)(type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider() + 20)
                                + 16]);
    v39 = objc_msgSend(v38, sel_description);
    sub_232200EC4();

    sub_232200F48();
    swift_bridgeObjectRelease();
    v40 = v53;
    sub_2321FF58C();
    swift_bridgeObjectRelease();
    v41 = sub_2321FF5A4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v40, 0, 1, v41);
    sub_2321FF6C4();
    swift_allocObject();
    v5 = sub_2321FF6B8();
    v42 = v19;
    v43 = (uint64_t)v55;
    v44 = v51;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v55, v32, v51);
    v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    v45(v43, 0, 1, v44);
    v46 = (uint64_t)v54;
    sub_2321FE650();
    v45(v43, 1, 1, v44);
    v47 = v57;
    swift_bridgeObjectRetain();
    sub_2320D71E8(1, v46, v47, v43, v56);
    v48 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v48((uint64_t)v61, v36);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v44);
    v48((uint64_t)v65, v36);
  }
  return v5;
}

id sub_2321EFA9C(_BYTE *a1, char *a2, uint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v5;
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id result;
  void *v21;
  char *v22;
  char *v23;
  char v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;

  v59 = a5;
  v55 = a4;
  v56 = a3;
  v58 = a1;
  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v51 - v8;
  sub_2320002B4(0, qword_2541B78E0, (void (*)(uint64_t))MEMORY[0x24BE47DF8]);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v51 - v11;
  v64 = sub_2321FF8B0();
  v61 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v62 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  sub_23216A870();
  v63 = v17;
  v60 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = a2;
  if (!objc_msgSend(a2, sel_hasDayIndexRange))
    goto LABEL_7;
  v54 = v5;
  result = objc_msgSend(v57, sel_dayIndexRange);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v21 = result;
  v53 = sub_232201530();
  v23 = v22;
  v25 = v24;

  v5 = v54;
  if ((v25 & 1) != 0)
  {
LABEL_7:
    sub_232200378();
    sub_23200054C(v5, (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
    v32 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v33 = swift_allocObject();
    sub_2321F1074((uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v33 + v32);
    v34 = v62;
    v35 = v64;
    sub_2321FF838();
    v36 = v63;
    sub_2321FF868();
    swift_release();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v34, v35);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v19, v36);
    v37 = sub_2321FE65C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v12, 1, 1, v37);
    v38 = sub_2321FD8B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v9, 1, 1, v38);
    v39 = v59;
    swift_bridgeObjectRetain();
    sub_2320D71E8(0, (uint64_t)v12, v39, (uint64_t)v9, v58);
    return 0;
  }
  if ((uint64_t)v23 < 1)
  {
    sub_232200378();
    sub_23200054C(v5, (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
    v40 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v41 = swift_allocObject();
    sub_2321F1074((uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v41 + v40);
    v42 = v62;
    v43 = v64;
    sub_2321FF838();
    v44 = v63;
    sub_2321FF868();
    swift_release();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v19, v44);
    sub_232005578();
    swift_allocError();
    *v45 = 0;
    return (id)swift_willThrow();
  }
  else
  {
    v26 = v56;
    if (v53 >= v56)
    {
      v52 = v23;
      sub_232201374();
      sub_232200378();
      sub_23200054C(v5, (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
      v46 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      v47 = swift_allocObject();
      sub_2321F1074((uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v47 + v46);
      v48 = v62;
      v49 = v64;
      sub_2321FF838();
      v50 = v63;
      sub_2321FF85C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v48, v49);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v19, v50);
      return (id)sub_2321EF5E0(v58, v57, v53, v52, v59);
    }
    else
    {
      sub_232200378();
      sub_23200054C(v5, (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider);
      v27 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      v28 = swift_allocObject();
      sub_2321F1074((uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
      v29 = v62;
      v30 = v64;
      sub_2321FF838();
      v31 = v63;
      sub_2321FF85C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v29, v30);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v19, v31);
      return (id)sub_2321EEFE0(v58, v26, v55, v59);
    }
  }
}

void sub_2321F00CC(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  char *v34;
  void *v35;
  id v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;

  v65 = a3;
  v66 = a2;
  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v64 = (uint64_t)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v53 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v59 = (uint64_t)&v53 - v10;
  v11 = sub_2321FD8B8();
  v62 = *(_QWORD *)(v11 - 8);
  v63 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v53 - v14;
  v58 = sub_2321FDC6C();
  v16 = *(_QWORD *)(v58 - 8);
  v17 = MEMORY[0x24BDAC7A8](v58);
  v55 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v53 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v53 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v53 - v25;
  v27 = sub_2321FDDD4();
  v56 = *(_QWORD *)(v27 - 8);
  v57 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v53 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = objc_msgSend(*(id *)(v3 + *(int *)(type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider() + 24)), sel_currentCalendar);
  sub_2321FDD68();

  v31 = (void *)objc_opt_self();
  v32 = (void *)sub_2321FDD5C();
  v33 = objc_msgSend(v31, sel_hk_dateOnDayIndex_atHour_calendar_, a1, 0, v32);

  sub_2321FDC30();
  v34 = &v66[a1];
  if (__OFADD__(a1, v66))
  {
    __break(1u);
  }
  else
  {
    v35 = (void *)sub_2321FDD5C();
    v36 = objc_msgSend(v31, sel_hk_dateOnDayIndex_atHour_calendar_, v34, 0, v35);

    sub_2321FDC30();
    v54 = v16;
    v37 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v38 = v58;
    v37(v21, v26, v58);
    v37(v55, v24, v38);
    sub_2321FD87C();
    v39 = (void *)objc_opt_self();
    v66 = v15;
    v40 = (void *)sub_2321FD858();
    v41 = (void *)sub_2321FDD5C();
    v42 = (void *)sub_2321FDD5C();
    v43 = objc_msgSend(v39, sel_hk_julianDayDateIntervalFromOpenUpperBoundDateInterval_sourceCalendar_localCalendar_, v40, v41, v42);

    if (v43)
    {
      v44 = (uint64_t)v60;
      sub_2321FD864();

      v45 = 0;
      v46 = v62;
    }
    else
    {
      v45 = 1;
      v46 = v62;
      v44 = (uint64_t)v60;
    }
    v47 = *(void (**)(char *, uint64_t))(v54 + 8);
    v47(v24, v38);
    v47(v26, v38);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v29, v57);
    v48 = v63;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(v44, v45, 1, v63);
    v49 = v59;
    sub_2320004F8(v44, v59);
    v50 = v64;
    sub_2320004F8(v49, v64);
    v51 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
    v52 = v61;
    v51(v61, v66, v48);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v50, 1, v48) == 1)
    {
      v51(v65, v52, v48);
      sub_23200040C(v50, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v46 + 8))(v52, v48);
      v51(v65, (char *)v50, v48);
    }
  }
}

uint64_t sub_2321F0564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void **v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a2;
  v3 = v2;
  v31 = a1;
  v4 = sub_2321FDE28();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_2321FDDD4();
  v8 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  v12 = objc_msgSend(*(void **)((char *)v2 + *(int *)(v11 + 24)), sel_currentCalendar, v29);
  sub_2321FDD68();

  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1510]), sel_init);
  sub_2321FDDB0();
  v14 = (void *)sub_2321FDDF8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  objc_msgSend(v13, sel_setTimeZone_, v14);

  v15 = (void *)sub_232200E94();
  objc_msgSend(v13, sel_setDateTemplate_, v15);

  v16 = (void *)sub_2321FD858();
  v17 = objc_msgSend(v13, sel_stringFromDateInterval_, v16);

  if (v17)
  {
    v31 = v8;
    sub_232200EC4();

    v18 = *v3;
    v19 = (char *)v3 + *(int *)(v11 + 20);
    v20 = *(void **)&v19[*(int *)(type metadata accessor for SnidgetFeedItemGeneratorRequest(0) + 32)];
    type metadata accessor for SnidgetStringBuilder();
    swift_initStackObject();
    v21 = (void *)objc_opt_self();
    v22 = v20;
    v23 = v18;
    v24 = objc_msgSend(v21, sel_sharedInstanceForHealthStore_, v23);
    v25 = v24;
    if (!v20)
    {
      v26 = v24;
      v22 = objc_msgSend(v26, sel_createHKUnitPreferenceController);

    }
    SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v10, v30);
  }
  else
  {
    sub_232005578();
    swift_allocError();
    *v28 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v30);
  }
}

void sub_2321F0858(void *a1@<X0>, uint64_t a2@<X8>)
{
  void **v2;
  void **v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id *inited;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _BYTE *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  _BYTE *v33;
  char *v34;
  uint64_t v35;
  void *v36;

  v3 = v2;
  sub_2320002B4(0, (unint64_t *)&qword_2541B2838, (void (*)(uint64_t))MEMORY[0x24BDCC5A8]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v34 - v7;
  if (!objc_msgSend(a1, sel_hasValueClamped) || !objc_msgSend(a1, sel_hasValue))
  {
    sub_232005578();
    swift_allocError();
    *v26 = 0;
    swift_willThrow();
    return;
  }
  v35 = a2;
  v9 = objc_msgSend(a1, sel_value);
  if (!v9)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  v10 = v9;
  v36 = (void *)sub_232201470();

  v11 = *v3;
  v12 = (char *)v3 + *(int *)(type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider() + 20);
  v13 = *(int *)(type metadata accessor for SnidgetFeedItemGeneratorRequest(0) + 32);
  v34 = v12;
  v14 = *(void **)&v12[v13];
  type metadata accessor for SnidgetStringBuilder();
  inited = (id *)swift_initStackObject();
  inited[2] = v11;
  v16 = (void *)objc_opt_self();
  v17 = v14;
  v18 = v11;
  v19 = objc_msgSend(v16, sel_sharedInstanceForHealthStore_, v18);
  v20 = v19;
  inited[4] = v19;
  if (!v14)
  {
    v21 = v19;
    v17 = objc_msgSend(v21, sel_createHKUnitPreferenceController);

  }
  inited[3] = v17;
  if (objc_msgSend(a1, sel_valueClamped))
  {
    v22 = objc_msgSend((id)objc_opt_self(), sel_percentUnit);
    v23 = v36;
    objc_msgSend(v36, sel_doubleValueForUnit_, v22);

    v24 = (void *)sub_23220108C();
    v25 = (id)HKAFibBurdenClampedLowerBoundLocalizedString();

    sub_232200EC4();
    SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)();

    swift_bridgeObjectRelease();
    return;
  }
  v27 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForHealthStore_, v18);
  if (!v27)
    goto LABEL_17;
  v28 = v27;
  v29 = objc_msgSend(v27, sel_displayTypeForObjectType_, *((_QWORD *)v34 + 2));

  if (!v29)
  {
    sub_232005578();
    swift_allocError();
    *v33 = 0;
    swift_willThrow();

    goto LABEL_14;
  }
  SnidgetStringBuilder.makeQuantityPrimaryAttributedString(displayType:quantity:)(v29, v36, v8);
  v30 = sub_2321FD9F0();
  v31 = *(_QWORD *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v8, 1, v30) == 1)
  {
    sub_23200040C((uint64_t)v8, (unint64_t *)&qword_2541B2838, (void (*)(uint64_t))MEMORY[0x24BDCC5A8]);
    sub_232005578();
    swift_allocError();
    *v32 = 0;
    swift_willThrow();

    swift_setDeallocating();
LABEL_14:

    return;
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v35, v8, v30);
}

uint64_t sub_2321F0C6C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_23220189C();
  sub_232200F48();
  v2 = *a1;
  v3 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  sub_2320852A0(v2, *((unsigned __int8 *)a1 + *(int *)(v3 + 20) + 8));
  sub_232200F48();
  swift_bridgeObjectRelease();
  sub_232200F48();
  return 0;
}

void sub_2321F0D14(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2321EE234(*(char **)a1, *(_QWORD *)(a1 + 16), a2);
}

uint64_t sub_2321F0D34()
{
  sub_2321F1340();
  return sub_232201BD8();
}

uint64_t sub_2321F0D5C()
{
  sub_2321F1340();
  return sub_232201BE4();
}

uint64_t sub_2321F0D84(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_2321F12E8();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232016AD8(a1, a1[3]);
  sub_2321F1340();
  sub_232201BC0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2321F0E48()
{
  unint64_t result;

  result = qword_2541B3D78;
  if (!qword_2541B3D78)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A6EC, &type metadata for AFibHistoryVisualizationView);
    atomic_store(result, (unint64_t *)&qword_2541B3D78);
  }
  return result;
}

uint64_t sub_2321F0E8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_2321F1294();
  v3 = v2;
  sub_2321FEDDC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

uint64_t sub_2321F0EC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2321F0ED8()
{
  return sub_2321F0F0C(&qword_2541B7410, &qword_2541B7418, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SnidgetHarnessPluginView.ActionHandler, (uint64_t)&unk_2322120D8);
}

uint64_t sub_2321F0F0C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD *), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_2321F0F80(255, a2, a3);
    result = MEMORY[0x2348FF39C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2321F0F4C()
{
  return sub_2321F0F0C(&qword_2541B3688, &qword_2541B3690, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SnidgetHarnessPluginView, (uint64_t)&unk_232212090);
}

void sub_2321F0F80(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD *))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[8];

  if (!*a2)
  {
    sub_231FFFDE4(255, &qword_2541B2998, MEMORY[0x24BE43750]);
    v9[0] = v6;
    v9[1] = &type metadata for AFibHistoryVisualizationView;
    v9[2] = sub_23200409C();
    v9[3] = sub_232045F94();
    v9[4] = sub_231FFFE84(&qword_2541B2970, MEMORY[0x24BE43748]);
    v9[5] = sub_231FFFE84((unint64_t *)&unk_2541B2960, MEMORY[0x24BE43740]);
    v9[6] = sub_232045FD8();
    v9[7] = sub_23204601C();
    v7 = a3(a1, v9);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_2321F1074(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2321F10B8()
{
  return sub_2321F10DC();
}

uint64_t sub_2321F10DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider() - 8) + 80);
  return sub_2321F0C6C((uint64_t *)(v0 + ((v1 + 16) & ~v1)));
}

uint64_t sub_2321F1138()
{
  return sub_2321F10DC();
}

uint64_t sub_2321F115C()
{
  return sub_2321F10DC();
}

uint64_t sub_2321F1180()
{
  return sub_2321F10DC();
}

uint64_t sub_2321F11A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v1 = type metadata accessor for AFibBurdenSnidgetFeedItemModelProvider();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (id *)((char *)v3 + *(int *)(v1 + 20));
  v5 = type metadata accessor for SnidgetFeedItemGeneratorRequest(0);
  v6 = (char *)v4 + *(int *)(v5 + 28);
  v7 = sub_2321FE938();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  return swift_deallocObject();
}

uint64_t sub_2321F1274()
{
  return sub_2321F10DC();
}

void sub_2321F1294()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255FA1860)
  {
    v0 = sub_2321FEE0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255FA1860);
  }
}

void sub_2321F12E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255FA1868)
  {
    sub_2321F1340();
    v0 = sub_232201AA0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255FA1868);
  }
}

unint64_t sub_2321F1340()
{
  unint64_t result;

  result = qword_255FA1870;
  if (!qword_255FA1870)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A7E0, &type metadata for AFibHistoryVisualizationView.ViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1870);
  }
  return result;
}

ValueMetadata *type metadata accessor for AFibHistoryVisualizationView.ViewModel.CodingKeys()
{
  return &type metadata for AFibHistoryVisualizationView.ViewModel.CodingKeys;
}

ValueMetadata *type metadata accessor for AFibHistoryVisualizationView.ViewModel()
{
  return &type metadata for AFibHistoryVisualizationView.ViewModel;
}

ValueMetadata *type metadata accessor for AFibHistoryVisualizationView()
{
  return &type metadata for AFibHistoryVisualizationView;
}

uint64_t sub_2321F13B4()
{
  return MEMORY[0x24BDF5138];
}

unint64_t sub_2321F13C4()
{
  unint64_t result;

  result = qword_255FA1878;
  if (!qword_255FA1878)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A790, &type metadata for AFibHistoryVisualizationView.ViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1878);
  }
  return result;
}

unint64_t sub_2321F140C()
{
  unint64_t result;

  result = qword_255FA1880;
  if (!qword_255FA1880)
  {
    result = MEMORY[0x2348FF39C](&unk_23221A7B8, &type metadata for AFibHistoryVisualizationView.ViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1880);
  }
  return result;
}

uint64_t sub_2321F1450@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t result;

  MEMORY[0x2348FF39C](&protocol conformance descriptor for HKCodableSummaryTrendTileViewModel, a1);
  result = sub_2321FF1B4();
  *a2 = result;
  return result;
}

uint64_t sub_2321F14B8(uint64_t a1)
{
  MEMORY[0x2348FF39C](&protocol conformance descriptor for HKCodableSummaryTrendTileViewModel, a1);
  return sub_2321FF1A8();
}

uint64_t sub_2321F1504@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t *v33;
  void (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  void *v37;

  sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v34 - v5;
  v7 = sub_2321FFE44();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321FEF20();
  sub_232000590(&qword_2541B1200, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FA0], MEMORY[0x24BE42F98]);
  *a2 = sub_2322009A8();
  a2[1] = v10;
  sub_2321FEED8();
  sub_232000590(&qword_255FA18B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42EB0], MEMORY[0x24BE42EA8]);
  a2[2] = sub_2322009A8();
  a2[3] = v11;
  v12 = (int *)type metadata accessor for SummaryTrendView(0);
  v13 = (char *)a2 + v12[6];
  v14 = sub_2321FF664();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (uint64_t)a2 + v12[8];
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v34(v15, 1, 1, v7);
  v16 = v12[9];
  *(uint64_t *)((char *)a2 + v16) = 0;
  sub_2320057B8(0, &qword_255FA18C0, (uint64_t (*)(uint64_t))sub_2321F2A60, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE42880]);
  v18 = v17;
  v36 = a1;
  sub_2321FEDDC();
  v19 = v37;
  v20 = v12[7];
  *(uint64_t *)((char *)a2 + v20) = (uint64_t)v37;
  v21 = v19;
  HKCodableSummaryTrendTileViewModel.coreChartTrendModel.getter((uint64_t)v6);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2321F3F84((uint64_t)v6, (uint64_t)&qword_2541B2A80, (uint64_t)MEMORY[0x24BE4B488], (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_2320057B8);
  }
  else
  {
    v22 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v23 = v35;
    v22(v35, v6, v7);
    sub_2321F3F84(v15, (uint64_t)&qword_2541B2A80, (uint64_t)MEMORY[0x24BE4B488], (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_2320057B8);
    v22((char *)v15, v23, v7);
    v34(v15, 0, 1, v7);
  }
  v24 = v36;
  v25 = *(id *)((char *)a2 + v20);
  v26 = HKCodableSummaryTrendTileViewModel.dataTypeHeaderModel.getter();

  if (v26)
  {
    swift_release();
    *(uint64_t *)((char *)a2 + v16) = (uint64_t)v26;
  }
  v27 = objc_msgSend(v25, sel_pregnancyLabelValue);
  if (v27)
  {
    v28 = v27;
    v29 = sub_232200EC4();
    v31 = v30;

  }
  else
  {
    v29 = 0;
    v31 = 0;
  }
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v24, v18);
  v33 = (uint64_t *)((char *)a2 + v12[10]);
  *v33 = v29;
  v33[1] = v31;
  return result;
}

uint64_t sub_2321F1830@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v2 = v1;
  v4 = sub_2321FEDA0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SummaryTrendView(0);
  if (*v1)
  {
    swift_retain();
    sub_2321FEEFC();
    swift_release();
    v8 = HKCodableSummaryTrendTileViewModel.trendDescriptionText(presentation:)();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v8 = 0;
      v11 = 0xE000000000000000;
    }
    *(_QWORD *)a1 = sub_232200A5C();
    *(_QWORD *)(a1 + 8) = 0x401C000000000000;
    *(_BYTE *)(a1 + 16) = 0;
    sub_2321F3E7C();
    sub_2321F1984(v2, v8, v11, a1 + *(int *)(v12 + 44));
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2321FEF20();
    sub_232000590(&qword_2541B1200, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FA0], MEMORY[0x24BE42F98]);
    result = sub_23220099C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2321F1984@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  _QWORD *v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void (*v47)(char *, uint64_t);
  uint64_t (*v48)(void);
  uint64_t result;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;

  v58 = a2;
  v59 = a3;
  v64 = a4;
  v5 = MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v57 = (uint64_t)&v50 - v7;
  v63 = sub_2321FFE20();
  v61 = *(_QWORD *)(v63 - 8);
  v8 = MEMORY[0x24BDAC7A8](v63);
  v62 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v60 = (char *)&v50 - v10;
  v11 = sub_2321FEDA0();
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2321FF220();
  v52 = *(_QWORD *)(v14 - 8);
  v53 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320626CC(0, v17);
  v19 = v18;
  v20 = *(_QWORD *)(v18 - 8);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v50 - v24;
  v26 = (uint64_t (*)(uint64_t, uint64_t))v5;
  v27 = a1;
  sub_2320057B8(0, &qword_255FA18E0, v28, v26);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v56 = (uint64_t)&v50 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v50 - v32;
  v34 = type metadata accessor for SummaryTrendView(0);
  if (!*(_QWORD *)((char *)a1 + *(int *)(v34 + 36)))
  {
    v36 = 1;
    goto LABEL_5;
  }
  swift_retain_n();
  sub_2321FF214();
  v51 = a1;
  if (*a1)
  {
    swift_retain();
    sub_2321FEEFC();
    swift_release();
    sub_2321FF1F0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v55);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v16, v53);
    v35 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v35(v25, v23, v19);
    v35(v33, v25, v19);
    v36 = 0;
    v27 = v51;
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v33, v36, 1, v19);
    sub_232016080((uint64_t)v27 + *(int *)(v34 + 32), v57, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = v60;
    sub_2321FFE14();
    v38 = v56;
    sub_232016080((uint64_t)v33, v56, &qword_255FA18E0, (uint64_t (*)(uint64_t))sub_2320626CC);
    v65 = 0;
    v39 = v61;
    v40 = v62;
    v41 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
    v42 = v63;
    v41(v62, v37, v63);
    v43 = v64;
    sub_232016080(v38, v64, &qword_255FA18E0, (uint64_t (*)(uint64_t))sub_2320626CC);
    sub_2321F3EF8();
    v45 = v43 + *(int *)(v44 + 48);
    v46 = v65;
    *(_QWORD *)v45 = 0;
    *(_BYTE *)(v45 + 8) = v46;
    v41((char *)(v43 + *(int *)(v44 + 64)), v40, v42);
    v47 = *(void (**)(char *, uint64_t))(v39 + 8);
    v47(v37, v42);
    v48 = MEMORY[0x24BEE1C68];
    sub_2321F3F84((uint64_t)v33, (uint64_t)&qword_255FA18E0, (uint64_t)sub_2320626CC, (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_2320057B8);
    v47(v40, v42);
    return sub_2321F3F84(v38, (uint64_t)&qword_255FA18E0, (uint64_t)sub_2320626CC, (uint64_t)v48, (uint64_t (*)(_QWORD))sub_2320057B8);
  }
  sub_2321FEF20();
  sub_232000590(&qword_2541B1200, (uint64_t (*)(uint64_t))MEMORY[0x24BE42FA0], MEMORY[0x24BE42F98]);
  result = sub_23220099C();
  __break(1u);
  return result;
}

uint64_t sub_2321F1E1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_232016080(v2 + *(int *)(a1 + 24), a2, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980]);
}

uint64_t sub_2321F1E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2321F3E20(a1, v2 + *(int *)(a2 + 24));
}

uint64_t (*sub_2321F1E58())()
{
  return nullsub_1;
}

BOOL SummaryTrendViewActionHandler.isSelectable.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v0 = sub_2321FEDA0();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE42678];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x24BDAC7A8](v0);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v15 - v6;
  v8 = sub_2321FF664();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321FF484();
  sub_2321FF634();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2321FEEFC();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE42648], v0);
  sub_232000590(&qword_255FA1888, v1, MEMORY[0x24BE42688]);
  v12 = sub_232200E64();
  v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v5, v0);
  v13(v7, v0);
  return (v12 & 1) == 0;
}

Swift::Void __swiftcall SummaryTrendViewActionHandler.didSelect()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
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
  void (*v28)(char *, uint64_t);
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t (*v35)(void);
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  char *v46;
  char *v47;
  void *v48;
  void *v49;
  char *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  int v59;
  id v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  id v75;
  _QWORD v76[6];

  v1 = *v0;
  v64 = sub_23220039C();
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v65 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_2321FF40C();
  v71 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v69 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_2321FF244();
  v70 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v68 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_2321FED4C();
  MEMORY[0x24BDAC7A8](v66);
  v67 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v55 - v8;
  sub_2320057B8(0, &qword_2541B0ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42678], v6);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v55 - v11;
  v13 = sub_2321FF664();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v62 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v55 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v55 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v55 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v55 - v26;
  v74 = v0;
  sub_2321FF484();
  sub_2321FF658();
  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v28(v27, v13);
  if (v76[3])
  {
    sub_232016A8C(0, (unint64_t *)&unk_255FA1898);
    sub_2321F2A60();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v61 = v1;
      v29 = v75;
      if (objc_msgSend(v75, sel_hasObjectTypeIdentifier)
        && (v30 = (void *)objc_opt_self(),
            v31 = objc_msgSend(v29, sel_objectTypeIdentifier),
            v32 = objc_msgSend(v30, sel__typeWithIdentifier_, v31),
            v31,
            (v60 = v32) != 0))
      {
        v56 = v29;
        LODWORD(v58) = HKCodableSummaryTrendTileViewModel.coveredDateRange.getter();
        sub_2321FF484();
        sub_2321FF634();
        v28(v25, v13);
        v33 = (void *)sub_2321FEEF0();
        swift_release();
        v57 = objc_msgSend(v33, sel_profileIdentifier);

        sub_2321FF484();
        sub_2321FF634();
        v28(v22, v13);
        sub_2321FEEFC();
        swift_release();
        v34 = sub_2321FEDA0();
        v35 = MEMORY[0x24BE42678];
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v12, 0, 1, v34);
        v36 = v57;
        v59 = sub_2321FEE54();

        sub_2321F3F84((uint64_t)v12, (uint64_t)&qword_2541B0ED8, (uint64_t)v35, (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_2320057B8);
        v37 = sub_2321FDC6C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v9, 1, 1, v37);
        v38 = sub_23220021C();
        v40 = v39;
        if (v38 == sub_23220021C() && v40 == v41)
        {
          swift_bridgeObjectRelease_n();
          v42 = 1;
        }
        else
        {
          v43 = sub_232201ADC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v42 = 1;
          if ((v43 & 1) == 0)
            v42 = 2;
        }
        v58 = v42;
        sub_2321FED7C();
        v76[0] = MEMORY[0x24BEE4AF8];
        v44 = (uint64_t (*)(uint64_t))MEMORY[0x24BE42510];
        sub_232000590(&qword_2541B11F8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42510], MEMORY[0x24BE42520]);
        sub_2320057B8(0, &qword_2541B13C0, v44, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
        sub_23206285C();
        sub_232201770();
        v45 = (void *)sub_2321FED70();
        v46 = v68;
        sub_2321FF238();
        sub_2321FF484();
        sub_2321FF634();
        v28(v25, v13);
        sub_2321FEEE4();
        swift_release();
        sub_2321FF484();
        sub_2321FF634();
        v28(v22, v13);
        sub_2321FEEF0();
        swift_release();
        sub_2321FF484();
        sub_2321FF634();
        v28(v19, v13);
        sub_2321FEF08();
        swift_release();
        v67 = v45;
        v47 = v69;
        sub_2321FF3E8();
        v48 = v60;
        v49 = (void *)sub_2321FF22C();
        (*(void (**)(char *, uint64_t))(v71 + 8))(v47, v73);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v46, v72);
        v50 = v62;
        sub_2321FF484();
        v51 = (void *)sub_2321FF64C();
        v28(v50, v13);
        v52 = objc_msgSend(v51, sel_navigationController);

        v53 = v56;
        if (v52)
        {
          objc_msgSend(v52, sel_pushViewController_animated_, v49, 1);

        }
        v54 = v67;
        sub_2321F2A9C();

      }
      else
      {

      }
    }
  }
  else
  {
    sub_2321F3F84((uint64_t)v76, (uint64_t)&unk_255FA1890, (uint64_t)&unk_255FA1898, MEMORY[0x24BE42960], (uint64_t (*)(_QWORD))sub_2320254E8);
  }
}

unint64_t sub_2321F2A60()
{
  unint64_t result;

  result = qword_2541B56E0;
  if (!qword_2541B56E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2541B56E0);
  }
  return result;
}

uint64_t sub_2321F2A9C()
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
  void (*v10)(char *, uint64_t);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;

  v27 = sub_2321FED10();
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_2321FEDA0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2321FF664();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v0;
  sub_2321FF484();
  sub_2321FF634();
  v10 = *(void (**)(char *, uint64_t))(v7 + 8);
  v10(v9, v6);
  v23 = v10;
  v11 = (void *)sub_2321FEEF0();
  swift_release();
  v12 = objc_msgSend(v11, sel_profileIdentifier);

  objc_msgSend(v12, sel_type);
  v13 = (id)HKStringFromProfileType();
  v14 = sub_232200EC4();
  v16 = v15;

  sub_2321FF484();
  sub_2321FF634();
  v10(v9, v6);
  sub_2321FEEFC();
  swift_release();
  sub_2321FED88();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)&v28[0] = v14;
  *((_QWORD *)&v28[0] + 1) = v16;
  sub_232200F48();
  sub_232200F48();
  swift_bridgeObjectRelease();
  sub_2321FED28();
  v18 = v25;
  v17 = v26;
  v19 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v25 + 104))(v26, *MEMORY[0x24BE42088], v27);
  sub_2321FF484();
  v20 = (void *)sub_2321FF64C();
  v23(v9, v6);
  v29 = 0;
  memset(v28, 0, sizeof(v28));
  sub_2321FED1C();
  swift_bridgeObjectRelease();

  sub_2321F3F84((uint64_t)v28, (uint64_t)&qword_255FA14B0, (uint64_t)&qword_255FA14B8, MEMORY[0x24BE47F60], (uint64_t (*)(_QWORD))sub_2320254E8);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v17, v19);
}

uint64_t SummaryTrendViewActionHandler.__allocating_init(content:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_2321FF664();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = sub_2321FF490();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t SummaryTrendViewActionHandler.init(content:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_2321FF664();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = sub_2321FF490();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v5;
}

uint64_t SummaryTrendViewActionHandler.__deallocating_deinit()
{
  _s9Summaries29SummaryTrendViewActionHandlerCfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_2321F2EE8()
{
  return sub_232000590(&qword_2541B56D8, (uint64_t (*)(uint64_t))sub_2321F2A60, (uint64_t)&protocol conformance descriptor for HKCodableSummaryTrendTileViewModel);
}

uint64_t sub_2321F2F14()
{
  return sub_232000590(&qword_2541B7468, type metadata accessor for SummaryTrendViewActionHandler, (uint64_t)&protocol conformance descriptor for SummaryTrendViewActionHandler);
}

uint64_t type metadata accessor for SummaryTrendViewActionHandler(uint64_t a1)
{
  return sub_23201A14C(a1, (uint64_t *)&unk_2541B3FA8);
}

uint64_t sub_2321F2F54()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2321F2F90()
{
  return type metadata accessor for SummaryTrendViewActionHandler(0);
}

uint64_t *sub_2321F2F98(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    a1[3] = a2[3];
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_2321FF664();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_retain();
    swift_retain();
    if (v14(v11, 1, v12))
    {
      sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v16 = a3[7];
    v17 = a3[8];
    v18 = *(void **)((char *)a2 + v16);
    *(uint64_t *)((char *)v7 + v16) = (uint64_t)v18;
    v19 = (char *)v7 + v17;
    v20 = (char *)a2 + v17;
    v21 = sub_2321FFE44();
    v22 = *(_QWORD *)(v21 - 8);
    v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    v24 = v18;
    if (v23(v20, 1, v21))
    {
      sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    v26 = a3[10];
    *(uint64_t *)((char *)v7 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    v27 = (uint64_t *)((char *)v7 + v26);
    v28 = (uint64_t *)((char *)a2 + v26);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_2321F3194(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_release();
  swift_release();
  v4 = a1 + a2[6];
  v5 = sub_2321FF664();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);

  v7 = a1 + a2[8];
  v8 = sub_2321FFE44();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2321F3278(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2321FF664();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  swift_retain();
  if (v13(v10, 1, v11))
  {
    sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[7];
  v16 = a3[8];
  v17 = *(void **)((char *)a2 + v15);
  *(_QWORD *)((char *)a1 + v15) = v17;
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  v20 = sub_2321FFE44();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v17;
  if (v22(v19, 1, v20))
  {
    sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  v25 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2321F3444(_QWORD *a1, _QWORD *a2, int *a3)
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
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2321FF664();
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
    sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[7];
  v16 = *(void **)((char *)a2 + v15);
  v17 = *(void **)((char *)a1 + v15);
  *(_QWORD *)((char *)a1 + v15) = v16;
  v18 = v16;

  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = sub_2321FFE44();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
LABEL_13:
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  v28 = a3[10];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_2321F36E4(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2321FF664();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_2321FFE44();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v19 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  return a1;
}

_QWORD *sub_2321F3878(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  *a1 = *a2;
  swift_release();
  v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_release();
  a1[3] = a2[3];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2321FF664();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[7];
  v17 = *(void **)((char *)a1 + v16);
  *(_QWORD *)((char *)a1 + v16) = *(_QWORD *)((char *)a2 + v16);

  v18 = a3[8];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_2321FFE44();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v19, v20, v21);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_13:
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_release();
  v27 = a3[10];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2321F3AE4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321F3AF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v8 = v12;
    v7 = *(_QWORD *)(v12 - 8);
    v9 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[7]);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t sub_2321F3BC4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2321F3BD0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[6];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
      return;
    }
    sub_2320057B8(0, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v10 = v12;
    v9 = *(_QWORD *)(v12 - 8);
    v11 = a4[8];
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

uint64_t type metadata accessor for SummaryTrendView(uint64_t a1)
{
  return sub_23201A14C(a1, qword_2541B3170);
}

void sub_2321F3CB4()
{
  unint64_t v0;
  unint64_t v1;

  sub_2320057B8(319, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_2320057B8(319, &qword_2541B2A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE4B488], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2321F3D8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2321F3D9C()
{
  return sub_232000590(&qword_2541B3168, type metadata accessor for SummaryTrendView, (uint64_t)&unk_23221A998);
}

uint64_t sub_2321F3DC8()
{
  return sub_232000590(&qword_2541B3160, type metadata accessor for SummaryTrendView, (uint64_t)&unk_23221A9E8);
}

uint64_t sub_2321F3DF4()
{
  return sub_232000590(&qword_2541B3158, type metadata accessor for SummaryTrendView, (uint64_t)&unk_23221AA20);
}

uint64_t sub_2321F3E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2320057B8(0, &qword_2541B7630, (uint64_t (*)(uint64_t))MEMORY[0x24BE44980], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2321F3E7C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255FA18C8)
  {
    sub_2320057B8(255, &qword_255FA18D0, (uint64_t (*)(uint64_t))sub_2321F3EF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF53F0]);
    v0 = sub_2322008E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255FA18C8);
  }
}

void sub_2321F3EF8()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_255FA18D8)
  {
    sub_2320057B8(255, &qword_255FA18E0, (uint64_t (*)(uint64_t))sub_2320626CC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_2321FFE20();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_255FA18D8);
  }
}

uint64_t sub_2321F3F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v6;

  v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_2321F3FC0()
{
  return sub_232000590(&qword_255FA18E8, (uint64_t (*)(uint64_t))sub_2321F3FEC, MEMORY[0x24BDF4700]);
}

void sub_2321F3FEC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255FA18F0)
  {
    sub_2320057B8(255, &qword_255FA18D0, (uint64_t (*)(uint64_t))sub_2321F3EF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF53F0]);
    sub_2321F4064();
    v0 = sub_232200C54();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255FA18F0);
  }
}

unint64_t sub_2321F4064()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255FA18F8;
  if (!qword_255FA18F8)
  {
    sub_2320057B8(255, &qword_255FA18D0, (uint64_t (*)(uint64_t))sub_2321F3EF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF53F0]);
    result = MEMORY[0x2348FF39C](MEMORY[0x24BDF5428], v1);
    atomic_store(result, (unint64_t *)&qword_255FA18F8);
  }
  return result;
}

uint64_t sub_2321F40C4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  sub_23202EED8(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2321FDCC0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2321FDC6C();
  v26 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_endDate);
  v14 = (id)HKDecodeDateForValue();
  sub_2321FDC30();

  v15 = 0;
  v16 = 0;
  if (objc_msgSend(a1, sel_hasSampleUUID))
  {
    v17 = objc_msgSend(a1, sel_sampleUUID);
    if (v17)
    {
      v18 = v17;
      v15 = sub_232200EC4();
      v16 = v19;

    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
  }
  v20 = type metadata accessor for SummaryAlertContentState();
  sub_23200054C(v2 + *(int *)(v20 + 24), (uint64_t)v6, (uint64_t (*)(_QWORD))sub_23202EED8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    swift_bridgeObjectRelease();
    sub_232002CEC((uint64_t)v6, (uint64_t (*)(_QWORD))sub_23202EED8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    if (v16)
    {
      if (sub_2321FDC84() == v15 && v16 == v21)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v23 = sub_232201ADC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0)
        {
          sub_232000590((unint64_t *)&qword_2541AF160, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
          v22 = sub_232200E34() ^ 1;
          (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
          goto LABEL_20;
        }
      }
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
      v22 = *(_BYTE *)(v2 + *(int *)(v20 + 32)) ^ 1;
      return v22 & 1;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  if ((sub_2321FDC0C() & 1) == 0)
  {
    if (*(_BYTE *)(v2 + *(int *)(v20 + 32)) == 1)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
      v22 = 0;
      return v22 & 1;
    }
    v22 = sub_2321FDC24();
LABEL_20:
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
    return v22 & 1;
  }
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
  v22 = 1;
  return v22 & 1;
}

uint64_t type metadata accessor for SummaryAlertContentState()
{
  uint64_t result;

  result = qword_255FA1958;
  if (!qword_255FA1958)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_2321F4468(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

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
    v11 = sub_2321FDC6C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_2321FDCC0();
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      sub_23202EED8(0);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v20 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)v4 + v20) = *((_BYTE *)a2 + v20);
  }
  return v4;
}

uint64_t sub_2321F45A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2321FDC6C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_2321FDCC0();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

_QWORD *sub_2321F4648(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2321FDC6C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_2321FDCC0();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    sub_23202EED8(0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + v18) = *((_BYTE *)a2 + v18);
  return a1;
}

_QWORD *sub_2321F475C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2321FDC6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2321FDCC0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    sub_23202EED8(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  return a1;
}

_OWORD *sub_2321F48CC(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2321FDC6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2321FDCC0();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    sub_23202EED8(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  v16 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + v16) = *((_BYTE *)a2 + v16);
  return a1;
}

_QWORD *sub_2321F49D4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2321FDC6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2321FDCC0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v12, v13, v14);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    sub_23202EED8(0);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_7:
  v20 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
  return a1;
}

uint64_t sub_2321F4B30()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321F4B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2321FDC6C();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      sub_23202EED8(0);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_2321F4BDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321F4BE8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_2321FDC6C();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      sub_23202EED8(0);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_2321F4C84()
{
  unint64_t v0;
  unint64_t v1;

  sub_2321FDC6C();
  if (v0 <= 0x3F)
  {
    sub_23202EED8(319);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2321F4D20()
{
  return sub_232000590(&qword_255FA19A0, (uint64_t (*)(uint64_t))type metadata accessor for SummaryAlertContentState, (uint64_t)&unk_23221AB40);
}

uint64_t sub_2321F4D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = sub_2321FDCC0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23202EED8(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_232200F3C();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for SummaryAlertContentState();
  sub_2321FDC6C();
  sub_232000590(&qword_255FA19D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_232200E04();
  sub_23200054C(v0 + *(int *)(v8 + 24), (uint64_t)v7, (uint64_t (*)(_QWORD))sub_23202EED8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_232201B90();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_232201B90();
    sub_232000590(&qword_255FA19D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_232200E04();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  sub_232201B90();
  return sub_232201B90();
}

uint64_t sub_2321F4F34(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  sub_2321F5734(0, &qword_255FA19A8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v9[-v6];
  sub_232016AD8(a1, a1[3]);
  sub_2321F56F0();
  sub_232201BC0();
  v9[15] = 0;
  sub_232201A70();
  if (!v1)
  {
    type metadata accessor for SummaryAlertContentState();
    v9[14] = 1;
    sub_2321FDC6C();
    sub_232000590(&qword_2541AF158, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_232201A94();
    v9[13] = 2;
    sub_2321FDCC0();
    sub_232000590(&qword_255FA19B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_232201A64();
    v9[12] = 3;
    sub_232201A7C();
    v9[11] = 4;
    sub_232201A7C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2321F514C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD);
  _QWORD v31[2];
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;

  v32 = a2;
  sub_23202EED8(0);
  MEMORY[0x24BDAC7A8](v3);
  v33 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2321FDC6C();
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v34 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321F5734(0, &qword_255FA19C0, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE33E0]);
  v37 = v7;
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v31 - v9;
  v11 = (int *)type metadata accessor for SummaryAlertContentState();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (_QWORD *)((char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = (char *)v14 + *(int *)(v12 + 24);
  v16 = sub_2321FDCC0();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v40 = (uint64_t)v15;
  v17(v15, 1, 1, v16);
  v18 = a1[3];
  v39 = a1;
  sub_232016AD8(a1, v18);
  sub_2321F56F0();
  v38 = v10;
  v19 = v41;
  sub_232201BB4();
  if (v19)
  {
    v23 = v40;
    sub_232016AFC((uint64_t)v39);
    v30 = (uint64_t (*)(_QWORD))sub_23202EED8;
    v29 = v23;
  }
  else
  {
    v31[1] = v16;
    v41 = v8;
    v21 = v34;
    v20 = v35;
    v22 = v36;
    v46 = 0;
    *v14 = sub_232201A1C();
    v14[1] = v25;
    v45 = 1;
    sub_232000590(&qword_2541B5B98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_232201A40();
    v26 = v40;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))((char *)v14 + v11[5], v21, v22);
    v44 = 2;
    sub_232000590(&qword_255FA19C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v27 = (uint64_t)v33;
    v34 = 0;
    sub_232201A10();
    sub_23202EEF4(v27, v26);
    v43 = 3;
    *((_BYTE *)v14 + v11[7]) = sub_232201A28() & 1;
    v42 = 4;
    v28 = sub_232201A28();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v38, v37);
    *((_BYTE *)v14 + v11[8]) = v28 & 1;
    sub_23200054C((uint64_t)v14, v32, (uint64_t (*)(_QWORD))type metadata accessor for SummaryAlertContentState);
    sub_232016AFC((uint64_t)v39);
    v29 = (uint64_t)v14;
    v30 = (uint64_t (*)(_QWORD))type metadata accessor for SummaryAlertContentState;
  }
  return sub_232002CEC(v29, v30);
}

uint64_t sub_2321F5530()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2321F5564 + 4 * byte_23221AAA0[*v0]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_2321F5564()
{
  return 0x746144746E657665;
}

uint64_t sub_2321F5580()
{
  return 0x5555656C706D6173;
}

unint64_t sub_2321F559C()
{
  return 0xD000000000000013;
}

uint64_t sub_2321F55B8()
{
  return 0x73696D7369447369;
}

uint64_t sub_2321F55D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2321F5D24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2321F55FC()
{
  sub_2321F56F0();
  return sub_232201BD8();
}

uint64_t sub_2321F5624()
{
  sub_2321F56F0();
  return sub_232201BE4();
}

uint64_t sub_2321F564C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2321F514C(a1, a2);
}

uint64_t sub_2321F5660(_QWORD *a1)
{
  return sub_2321F4F34(a1);
}

uint64_t sub_2321F5678()
{
  sub_232201B78();
  sub_2321F4D4C();
  return sub_232201B9C();
}

uint64_t sub_2321F56B8()
{
  sub_232201B78();
  sub_2321F4D4C();
  return sub_232201B9C();
}

unint64_t sub_2321F56F0()
{
  unint64_t result;

  result = qword_255FA19B0;
  if (!qword_255FA19B0)
  {
    result = MEMORY[0x2348FF39C](&unk_23221AC7C, &type metadata for SummaryAlertContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA19B0);
  }
  return result;
}

void sub_2321F5734(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_2321F56F0();
    v7 = a3(a1, &type metadata for SummaryAlertContentState.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_2321F5790(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  char v21;
  char v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  _BYTE *v28;
  void (*v29)(_BYTE *, uint64_t);
  _BYTE v31[4];
  int v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;

  v4 = sub_2321FDCC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2321F5B20();
  v9 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v31[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23202EED8(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = &v31[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = &v31[-v17];
  MEMORY[0x24BDAC7A8](v16);
  v20 = &v31[-v19];
  if (*a1 == *a2 && a1[1] == a2[1] || (v21 = sub_232201ADC(), v22 = 0, (v21 & 1) != 0))
  {
    v35 = v15;
    v23 = (int *)type metadata accessor for SummaryAlertContentState();
    if ((sub_2321FDC24() & 1) != 0)
    {
      v34 = v7;
      v24 = v5;
      sub_23200054C((uint64_t)a1 + v23[6], (uint64_t)v20, (uint64_t (*)(_QWORD))sub_23202EED8);
      sub_23200054C((uint64_t)a2 + v23[6], (uint64_t)v18, (uint64_t (*)(_QWORD))sub_23202EED8);
      v25 = (uint64_t)&v11[*(int *)(v9 + 48)];
      sub_23200054C((uint64_t)v20, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_23202EED8);
      sub_23200054C((uint64_t)v18, v25, (uint64_t (*)(_QWORD))sub_23202EED8);
      v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
      if (v26((uint64_t)v11, 1, v4) == 1)
      {
        sub_232002CEC((uint64_t)v18, (uint64_t (*)(_QWORD))sub_23202EED8);
        sub_232002CEC((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23202EED8);
        if (v26(v25, 1, v4) == 1)
        {
          sub_232002CEC((uint64_t)v11, (uint64_t (*)(_QWORD))sub_23202EED8);
          goto LABEL_12;
        }
        goto LABEL_10;
      }
      v33 = v24;
      v27 = (uint64_t)v35;
      sub_23200054C((uint64_t)v11, (uint64_t)v35, (uint64_t (*)(_QWORD))sub_23202EED8);
      if (v26(v25, 1, v4) == 1)
      {
        sub_232002CEC((uint64_t)v18, (uint64_t (*)(_QWORD))sub_23202EED8);
        sub_232002CEC((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23202EED8);
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v27, v4);
LABEL_10:
        sub_232002CEC((uint64_t)v11, (uint64_t (*)(_QWORD))sub_2321F5B20);
        goto LABEL_13;
      }
      v28 = v34;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v33 + 32))(v34, v25, v4);
      sub_232000590(&qword_2541B58A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v32 = sub_232200E64();
      v29 = *(void (**)(_BYTE *, uint64_t))(v33 + 8);
      v29(v28, v4);
      sub_232002CEC((uint64_t)v18, (uint64_t (*)(_QWORD))sub_23202EED8);
      sub_232002CEC((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23202EED8);
      v29((_BYTE *)v27, v4);
      sub_232002CEC((uint64_t)v11, (uint64_t (*)(_QWORD))sub_23202EED8);
      if ((v32 & 1) != 0)
      {
LABEL_12:
        if (*((unsigned __int8 *)a1 + v23[7]) == *((unsigned __int8 *)a2 + v23[7]))
        {
          v22 = *((_BYTE *)a1 + v23[8]) ^ *((_BYTE *)a2 + v23[8]) ^ 1;
          return v22 & 1;
        }
      }
    }
LABEL_13:
    v22 = 0;
  }
  return v22 & 1;
}

void sub_2321F5B20()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_2541B69D0)
  {
    sub_23202EED8(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_2541B69D0);
  }
}

uint64_t storeEnumTagSinglePayload for SummaryAlertContentState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2321F5BCC + 4 * byte_23221AAAA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2321F5C00 + 4 * byte_23221AAA5[v4]))();
}

uint64_t sub_2321F5C00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2321F5C08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2321F5C10);
  return result;
}

uint64_t sub_2321F5C1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2321F5C24);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2321F5C28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2321F5C30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryAlertContentState.CodingKeys()
{
  return &type metadata for SummaryAlertContentState.CodingKeys;
}

unint64_t sub_2321F5C50()
{
  unint64_t result;

  result = qword_255FA19E0;
  if (!qword_255FA19E0)
  {
    result = MEMORY[0x2348FF39C](&unk_23221AC54, &type metadata for SummaryAlertContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA19E0);
  }
  return result;
}

unint64_t sub_2321F5C98()
{
  unint64_t result;

  result = qword_255FA19E8;
  if (!qword_255FA19E8)
  {
    result = MEMORY[0x2348FF39C](&unk_23221ABC4, &type metadata for SummaryAlertContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA19E8);
  }
  return result;
}

unint64_t sub_2321F5CE0()
{
  unint64_t result;

  result = qword_255FA19F0;
  if (!qword_255FA19F0)
  {
    result = MEMORY[0x2348FF39C](&unk_23221ABEC, &type metadata for SummaryAlertContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA19F0);
  }
  return result;
}

uint64_t sub_2321F5D24(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_232201ADC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746144746E657665 && a2 == 0xE900000000000065 || (sub_232201ADC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x5555656C706D6173 && a2 == 0xEA00000000004449 || (sub_232201ADC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023220B1D0 || (sub_232201ADC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73696D7369447369 && a2 == 0xEB00000000646573)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_232201ADC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_2321F5F74(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t inited;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void (*v21)(unint64_t, _QWORD, uint64_t);
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = *v2;
  v5 = sub_2321FE38C();
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2321FE3BC();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a2;
  v29 = (id)sub_2321FE3F8();
  sub_232027434();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_232210D20;
  v12 = type metadata accessor for SleepDurationValueSummarySharableModelGenerator.Request(0);
  *(_QWORD *)(inited + 32) = sub_2321FE464();
  v37 = inited;
  sub_232201050();
  v13 = *(_BYTE *)(a1 + *(int *)(v12 + 40));
  sub_2320057B8(0, &qword_2541B7530, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v14 = sub_2321FE194();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 72);
  v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  if ((v13 & 1) != 0)
  {
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_232210D40;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104))(v18 + v17, *MEMORY[0x24BE47410], v14);
  }
  else
  {
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_232210D30;
    v20 = v18 + v17;
    v21 = *(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104);
    v21(v20, *MEMORY[0x24BE47460], v14);
    v21(v20 + v16, *MEMORY[0x24BE47490], v14);
  }
  v19 = v29;
  sub_2321A492C(v18);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v22 = swift_bridgeObjectRetain();
  sub_2321A4950(v22);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v7, *MEMORY[0x24BE47918], v31);
  sub_2321FE3B0();

  swift_bridgeObjectRelease();
  v23 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v36 + OBJC_IVAR____TtC9Summaries47SleepDurationValueSummarySharableModelGenerator_domain, v10, v33);
  v24 = sub_232000590(&qword_2541B02B8, type metadata accessor for SleepDurationValueSummarySharableModelGenerator, (uint64_t)&unk_23221AD98);
  v25 = v35;
  v26 = static CurrentValueSummaryModelGenerating.makePublisher(generatorContext:request:)(v35, a1, v34, v24);
  v27 = sub_2321FE440();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v25, v27);
  sub_2321F714C(a1);
  *(_QWORD *)(v23 + 16) = v26;
  return v23;
}

uint64_t sub_2321F62C4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  id v6;

  v3 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_232201998();
    v4 = result;
    if (!result)
      goto LABEL_7;
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v4)
    {
LABEL_7:
      result = swift_bridgeObjectRelease();
      *a2 = v4;
      return result;
    }
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x2348FEA30](0, v3);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(id *)(v3 + 32);
LABEL_6:
    v4 = (uint64_t)v6;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_2321F6370(void *a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  id result;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  id v48;
  _OWORD v49[2];
  uint64_t v50;

  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v47 - v6;
  sub_2320057B8(0, (unint64_t *)&qword_2541B2A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0], v4);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v47 - v12;
  sub_2320057B8(0, &qword_2541B28D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70], v4);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v47 - v18;
  if (!a1)
  {
    sub_2321FE6B0();
    v41 = sub_2321FE6D4();
    v42 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v19, 0, 1, v41);
    sub_232003E9C(0, &qword_2541B0CD0);
    v43 = sub_2321FFD78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v13, 1, 1, v43);
    sub_232016080((uint64_t)v19, (uint64_t)v17, &qword_2541B28D0, v42);
    v40 = sub_2320151CC(0, 0xF000000000000000, 0xBu, (uint64_t)v13, (uint64_t)v17, 0, 0);
    sub_232016D88((uint64_t)v19, &qword_2541B28D0, v42);
    return v40;
  }
  v20 = a1;
  v21 = sub_2321F68E8(v20);
  if (!v21)
  {
    sub_2321FE6B0();
    v44 = sub_2321FE6D4();
    v45 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v19, 0, 1, v44);
    sub_232003E9C(0, &qword_2541B0CD0);
    v46 = sub_2321FFD78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v13, 1, 1, v46);
    sub_232016080((uint64_t)v19, (uint64_t)v17, &qword_2541B28D0, v45);
    v40 = sub_2320151CC(0, 0xF000000000000000, 0xBu, (uint64_t)v13, (uint64_t)v17, 0, 0);
    sub_232016D88((uint64_t)v19, &qword_2541B28D0, v45);

    return v40;
  }
  v22 = (void *)v21;
  v23 = a2 + *(int *)(type metadata accessor for SleepDurationValueSummarySharableModelGenerator.Request(0) + 32);
  v24 = sub_2321FFF40();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v11, v23, v24);
  v25 = *MEMORY[0x24BE4AD90];
  v26 = sub_2321FFD78();
  v27 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 104))(v11, v25, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v11, 0, 1, v26);
  v28 = objc_msgSend(v20, sel_dateInterval);
  sub_2321FD864();

  v29 = sub_2321FD8B8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v7, 0, 1, v29);
  v30 = objc_msgSend(v20, sel_periods);
  sub_232003E9C(0, &qword_2541B0C18);
  v31 = sub_232201038();

  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    v32 = sub_232201998();
    swift_bridgeObjectRelease();
  }
  else
  {
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v48 = v20;
  swift_bridgeObjectRelease();
  sub_232003E9C(0, &qword_2541B56C8);
  v33 = HKCodableSummarySupplementaryValue.init(dateInterval:dataCount:)((uint64_t)v7, v32, 0);
  result = objc_msgSend(v22, sel_data);
  if (result)
  {
    v35 = result;
    sub_232003E9C(0, &qword_2541B0CD0);
    v36 = sub_2321FDAD4();
    v38 = v37;

    v39 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0];
    sub_232016080((uint64_t)v11, (uint64_t)v13, (unint64_t *)&qword_2541B2A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0]);
    v50 = 0;
    memset(v49, 0, sizeof(v49));
    v40 = sub_232015828(v36, v38, 15, (uint64_t)v13, (uint64_t)v33, 0, (uint64_t)v49);

    sub_232003ED4(v36, v38);
    sub_232016D88((uint64_t)v11, (unint64_t *)&qword_2541B2A70, v39);

    return v40;
  }
  __break(1u);
  return result;
}

unint64_t sub_2321F68E8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t result;
  id v23;
  void *v24;
  id v25;
  char *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char *v33;
  unint64_t v34;
  id v35;
  void *v36;
  double v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v2 = sub_23220039C();
  v59 = *(_QWORD *)(v2 - 8);
  v60 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v55 = (char *)&v55 - v6;
  v7 = sub_2321FD8B8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320057B8(0, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v55 - v12;
  v14 = sub_2321FDC6C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v57 = (char *)&v55 - v18;
  v19 = objc_msgSend(a1, sel_periods);
  sub_232003E9C(0, &qword_2541B0C18);
  v20 = sub_232201038();

  if (!(v20 >> 62))
  {
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v21)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  v21 = sub_232201998();
  swift_bridgeObjectRelease();
  if (!v21)
    goto LABEL_17;
LABEL_3:
  result = v21 - 1;
  if (__OFSUB__(v21, 1))
  {
    __break(1u);
  }
  else if ((v20 & 0xC000000000000001) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v23 = *(id *)(v20 + 8 * result + 32);
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_27;
  }
  v23 = (id)MEMORY[0x2348FEA30](result, v20);
LABEL_8:
  v24 = v23;
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v24, sel_dateInterval);

  sub_2321FD864();
  sub_2321FD870();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
LABEL_18:
    sub_232016D88((uint64_t)v13, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    sub_232200354();
    v49 = sub_232200390();
    v50 = sub_2322012F0();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v61 = v52;
      *(_DWORD *)v51 = 136315138;
      v62 = v58;
      swift_getMetatypeMetadata();
      v53 = sub_232200F00();
      v62 = sub_232013174(v53, v54, &v61);
      sub_232201710();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231FFB000, v49, v50, "[%s]: Unexpected nil value for endOfSleepDate. SleepPublisher query should be configured with onlySleepAnalysis", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v52, -1, -1);
      MEMORY[0x2348FF468](v51, -1, -1);
    }

    v48 = v60;
    v46 = *(void (**)(char *, uint64_t))(v59 + 8);
    v47 = v5;
    goto LABEL_21;
  }
  v26 = v57;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v57, v13, v14);
  v27 = objc_msgSend(a1, sel_summaryFilteredToLastPeriod);
  if (!v27)
  {
    v39 = v55;
    sub_232200354();
    v40 = sub_232200390();
    v41 = sub_2322012F0();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v61 = v43;
      *(_DWORD *)v42 = 136315138;
      v62 = v58;
      swift_getMetatypeMetadata();
      v44 = sub_232200F00();
      v62 = sub_232013174(v44, v45, &v61);
      sub_232201710();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231FFB000, v40, v41, "[%s]: Unexpected nil value for sleepSummaryForDisplay", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v43, -1, -1);
      MEMORY[0x2348FF468](v42, -1, -1);

      (*(void (**)(char *, uint64_t))(v59 + 8))(v55, v60);
      v46 = *(void (**)(char *, uint64_t))(v15 + 8);
      v47 = v57;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v59 + 8))(v39, v60);
      v46 = *(void (**)(char *, uint64_t))(v15 + 8);
      v47 = v26;
    }
    v48 = v14;
LABEL_21:
    v46(v47, v48);
    return 0;
  }
  v28 = v27;
  objc_msgSend(v28, sel_inBedDuration);
  v30 = v29;
  objc_msgSend(v28, sel_sleepDuration);
  v32 = v31;
  v33 = v56;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v56, v26, v14);
  result = (unint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A4F8]), sel_init);
  if (result)
  {
    v34 = result;
    v35 = (id)result;
    objc_msgSend(v35, sel_setInBedDuration_, v30);
    objc_msgSend(v35, sel_setAsleepDuration_, v32);
    v36 = (void *)sub_2321FDBF4();
    v37 = MEMORY[0x2348FEDA8]();

    objc_msgSend(v35, sel_setEndOfSleepTimeIntervalSinceReferenceDate_, v37);
    v38 = *(void (**)(char *, uint64_t))(v15 + 8);
    v38(v33, v14);

    v38(v26, v14);
    return v34;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2321F6F98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC9Summaries47SleepDurationValueSummarySharableModelGenerator_domain;
  v2 = sub_2321FE3BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2321F6FF0()
{
  return type metadata accessor for SleepDurationValueSummarySharableModelGenerator(0);
}

uint64_t type metadata accessor for SleepDurationValueSummarySharableModelGenerator(uint64_t a1)
{
  return sub_23201A14C(a1, (uint64_t *)&unk_2541AF040);
}

id sub_2321F7010(void **a1, uint64_t a2)
{
  return sub_2321F6370(*a1, a2);
}

uint64_t sub_2321F7018@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC9Summaries47SleepDurationValueSummarySharableModelGenerator_domain;
  v4 = sub_2321FE3BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

_UNKNOWN **sub_2321F7060()
{
  return &off_250109360;
}

uint64_t sub_2321F706C(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B02B0, type metadata accessor for SleepDurationValueSummarySharableModelGenerator, (uint64_t)&unk_23221AD10);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_2321F70A8()
{
  return &off_2501093A8;
}

uint64_t sub_2321F70B4(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B02C0, type metadata accessor for SleepDurationValueSummarySharableModelGenerator, (uint64_t)&unk_23221AD40);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_2321F70F0()
{
  return &off_2501093C0;
}

uint64_t sub_2321F70FC(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B4B20, type metadata accessor for SleepDurationValueSummarySharableModelGenerator, (uint64_t)&unk_23221AD6C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for SleepDurationValueSummarySharableModelGenerator.Request(uint64_t a1)
{
  return sub_23201A14C(a1, (uint64_t *)&unk_2541AF030);
}

uint64_t sub_2321F714C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SleepDurationValueSummarySharableModelGenerator.Request(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2321F7188(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  _BYTE *v24;
  char *v25;
  void *v26;
  void *v27;
  _BYTE *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t inited;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  void (*v46)(unint64_t, _QWORD, uint64_t);
  unint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];

  v59 = a3;
  v58 = a2;
  v63 = sub_2321FE38C();
  v60 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v62 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_2321FE3BC();
  v66 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v65 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_232201230();
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321F7958();
  v57 = v7;
  v56 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321F7A64();
  v69 = *(_QWORD *)(v9 - 8);
  v70 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v67 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2321FDC6C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2321FDD14();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_2321FDDD4();
  v61 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BDCEF70], v15);
  sub_2321FDD20();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  sub_2321FD894();
  v21 = (void *)sub_2321FDBF4();
  v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v22(v14, v11);
  v23 = (void *)sub_2321FDD5C();
  v24 = objc_msgSend(v21, sel_hk_morningIndexWithCalendar_, v23);

  v25 = v20;
  sub_2321FD870();
  v26 = (void *)sub_2321FDBF4();
  v22(v14, v11);
  v27 = (void *)sub_2321FDD5C();
  v28 = objc_msgSend(v26, sel_hk_morningIndexWithCalendar_, v27);

  if (__OFSUB__(v28, v24))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (__OFADD__(v28 - v24, 1))
  {
LABEL_8:
    __break(1u);
    return;
  }
  sub_2321FE3D4();
  sub_232016AD8(v73, v73[3]);
  v29 = (void *)sub_2321FE314();
  v30 = type metadata accessor for SleepDurationValueSummarySharableModelGenerator.Request(0);
  v31 = v59;
  sub_2321FFF28();
  sub_232201254();

  sub_232016AFC((uint64_t)v73);
  sub_2321F79FC(0, &qword_2541B5620, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  sub_232000590(&qword_2541B55D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE45A98], MEMORY[0x24BE45A90]);
  v32 = v53;
  v33 = v55;
  sub_2322007A4();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v6, v33);
  sub_232000590(&qword_2541B2D20, (uint64_t (*)(uint64_t))sub_2321F7958, MEMORY[0x24BDB96C0]);
  v34 = v57;
  v35 = sub_232200774();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v34);
  v72 = v35;
  sub_2321FE434();
  v36 = (void *)sub_2321FE3F8();
  sub_232027434();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_232210D20;
  *(_QWORD *)(inited + 32) = sub_2321FE464();
  v71 = inited;
  sub_232201050();
  v38 = *(_BYTE *)(v31 + *(int *)(v30 + 40));
  sub_2320057B8(0, &qword_2541B7530, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v39 = sub_2321FE194();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(_QWORD *)(v40 + 72);
  v42 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  v43 = swift_allocObject();
  if ((v38 & 1) != 0)
  {
    *(_OWORD *)(v43 + 16) = xmmword_232210D40;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v40 + 104))(v43 + v42, *MEMORY[0x24BE47410], v39);
  }
  else
  {
    *(_OWORD *)(v43 + 16) = xmmword_232210D30;
    v45 = v43 + v42;
    v46 = *(void (**)(unint64_t, _QWORD, uint64_t))(v40 + 104);
    v46(v45, *MEMORY[0x24BE47460], v39);
    v46(v45 + v41, *MEMORY[0x24BE47490], v39);
  }
  v44 = v36;
  sub_2321A492C(v43);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v47 = swift_bridgeObjectRetain();
  sub_2321A4950(v47);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v62, *MEMORY[0x24BE47918], v63);
  v48 = v65;
  sub_2321FE3B0();

  swift_bridgeObjectRelease();
  sub_2321F7B08();
  sub_232000590(&qword_2541AF2E8, (uint64_t (*)(uint64_t))sub_2321F7B08, MEMORY[0x24BDB9AF8]);
  v49 = sub_232200738();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v48, v68);
  sub_232016AFC((uint64_t)v73);
  swift_release();
  v73[0] = v49;
  sub_2321F79FC(0, &qword_2541B3550, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
  v50 = v67;
  sub_2322007A4();
  swift_release();
  sub_232000590(&qword_2541AF1E8, (uint64_t (*)(uint64_t))sub_2321F7A64, MEMORY[0x24BDB96C0]);
  v51 = v70;
  sub_232200774();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v50, v51);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v25, v64);
}

void sub_2321F7958()
{
  uint64_t (*v0)(uint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_2541B2D28)
  {
    sub_232201230();
    v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE45A98];
    sub_2321F79FC(255, &qword_2541B5620, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_232000590(&qword_2541B55D0, v0, MEMORY[0x24BE45A90]);
    v1 = sub_232200540();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_2541B2D28);
  }
}

void sub_2321F79FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_232003E9C(255, (unint64_t *)&qword_2541AF090);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_2321F7A64()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541B2C60)
  {
    sub_2321F7B08();
    sub_2321F79FC(255, &qword_2541B3550, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
    sub_232000590(&qword_2541AF2E8, (uint64_t (*)(uint64_t))sub_2321F7B08, MEMORY[0x24BDB9AF8]);
    v0 = sub_232200540();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541B2C60);
  }
}

void sub_2321F7B08()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541B2FF8)
  {
    sub_2321F79FC(255, &qword_2541B5620, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_232002B9C();
    v0 = sub_232200624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541B2FF8);
  }
}

uint64_t *sub_2321F7B84(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2321FD8B8();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2321FE4A0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[8];
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    v22 = sub_2321FFF40();
    v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    v23(v20, v21, v22);
    v24 = a3[9];
    v25 = a3[10];
    v26 = *(void **)((char *)a2 + v24);
    *(uint64_t *)((char *)a1 + v24) = (uint64_t)v26;
    *((_BYTE *)a1 + v25) = *((_BYTE *)a2 + v25);
    v27 = v26;
  }
  return a1;
}

void sub_2321F7D14(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_2321FD8B8();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + a2[5];
  v7 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = a1 + a2[8];
  v9 = sub_2321FFF40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

}

char *sub_2321F7DD4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v6 = sub_2321FD8B8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = v16;
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_2321FFF40();
  v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  swift_bridgeObjectRetain();
  v21(v18, v19, v20);
  v22 = a3[9];
  v23 = a3[10];
  v24 = *(void **)&a2[v22];
  *(_QWORD *)&a1[v22] = v24;
  a1[v23] = a2[v23];
  v25 = v24;
  return a1;
}

char *sub_2321F7F38(char *a1, char *a2, int *a3)
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
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v6 = sub_2321FD8B8();
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
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  a1[a3[6]] = a2[a3[6]];
  v16 = a3[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[8];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = sub_2321FFF40();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  v23 = a3[9];
  v24 = *(void **)&a2[v23];
  v25 = *(void **)&a1[v23];
  *(_QWORD *)&a1[v23] = v24;
  v26 = v24;

  a1[a3[10]] = a2[a3[10]];
  return a1;
}

char *sub_2321F80FC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_2321FD8B8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_2321FFF40();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  a1[v18] = a2[v18];
  return a1;
}

char *sub_2321F8240(char *a1, char *a2, int *a3)
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
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = sub_2321FD8B8();
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
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2321FE4A0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = a3[8];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = sub_2321FFF40();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v25 = a3[9];
  v26 = *(void **)&a1[v25];
  *(_QWORD *)&a1[v25] = *(_QWORD *)&a2[v25];

  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_2321F83EC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321F83F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_2321FE4A0();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_2321FFF40();
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[8];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_2321F84E0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321F84EC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_2321FE4A0();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[7] + 8) = (a2 - 1);
        return result;
      }
      v10 = sub_2321FFF40();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2321F85D0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2320057B8(319, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_2321FE4A0();
    if (v1 <= 0x3F)
    {
      sub_2321FFF40();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

id sub_2321F86AC(void *a1, double a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  v6 = a1;
  v7 = objc_msgSend(v5, sel_canonicalUnit);
  if (!v7)
  {

LABEL_5:
    v10 = objc_msgSend(a1, sel_identifier);
    v11 = sub_232200EC4();
    v13 = v12;

    if (v11 != sub_232200EC4() || v13 != v14)
    {
      v16 = sub_232201ADC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_13;
      v17 = objc_msgSend(a1, sel_identifier);
      v18 = sub_232200EC4();
      v20 = v19;

      if (v18 != sub_232200EC4() || v20 != v21)
      {
        v24 = sub_232201ADC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) != 0)
          goto LABEL_13;
        v25 = objc_msgSend(a1, sel_identifier);
        v26 = sub_232200EC4();
        v28 = v27;

        if (v26 != sub_232200EC4() || v28 != v29)
        {
          v30 = sub_232201ADC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v30 & 1) != 0)
            goto LABEL_13;
          v31 = objc_msgSend(a1, sel_identifier);
          v32 = sub_232200EC4();
          v34 = v33;

          if (v32 != sub_232200EC4() || v34 != v35)
          {
            v36 = sub_232201ADC();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v36 & 1) == 0)
            {
              v8 = objc_msgSend((id)objc_opt_self(), sel_countUnit);
              v22 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v8, a2);
              goto LABEL_14;
            }
LABEL_13:
            v8 = objc_msgSend((id)objc_opt_self(), sel_secondUnit);
            v22 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v8, a2);
LABEL_14:
            v9 = v22;
            goto LABEL_15;
          }
        }
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  v8 = v7;
  v9 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v7, a2);

LABEL_15:
  return v9;
}

id sub_2321F8A04(void *a1, id a2)
{
  id v3;
  void *v4;
  id v5;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;

  v3 = objc_msgSend(a2, sel_unitForChartingDisplayType_, a1);
  if (!v3)
    return v13;
  v4 = v3;
  if (objc_msgSend(v13, sel_isCompatibleWithUnit_, v3) && !objc_msgSend(v4, sel_isNull))
  {
    objc_msgSend(v13, sel_doubleValueForUnit_, v4);
    v8 = v7;
    v9 = objc_msgSend(a1, sel_presentation);
    objc_msgSend(v9, sel_adjustedDoubleForDaemonDouble_, v8);
    v11 = v10;

    v5 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v4, v11);
  }
  else
  {
    v5 = v13;
  }
  v12 = v5;

  return v12;
}

uint64_t sub_2321F8B2C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t inited;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void (*v21)(unint64_t, _QWORD, uint64_t);
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = *v2;
  v5 = sub_2321FE38C();
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2321FE3BC();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a1;
  v29 = (id)sub_2321FE3F8();
  sub_232027434();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_232210D20;
  v12 = type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator.Request(0);
  *(_QWORD *)(inited + 32) = sub_2321FE464();
  v37 = inited;
  sub_232201050();
  v13 = *(_BYTE *)(a2 + *(int *)(v12 + 24));
  sub_2320057B8(0, &qword_2541B7530, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v14 = sub_2321FE194();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 72);
  v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  if ((v13 & 1) != 0)
  {
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_232210D40;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104))(v18 + v17, *MEMORY[0x24BE47410], v14);
  }
  else
  {
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_232210D30;
    v20 = v18 + v17;
    v21 = *(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104);
    v21(v20, *MEMORY[0x24BE47460], v14);
    v21(v20 + v16, *MEMORY[0x24BE47490], v14);
  }
  v19 = v29;
  sub_2321A492C(v18);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v22 = swift_bridgeObjectRetain();
  sub_2321A4950(v22);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v7, *MEMORY[0x24BE47918], v31);
  sub_2321FE3B0();

  swift_bridgeObjectRelease();
  v23 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v36 + OBJC_IVAR____TtC9Summaries56MostRecentRangeCurrentValueSummarySharableModelGenerator_domain, v10, v33);
  v24 = sub_232000590(&qword_2541B5008, type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator, (uint64_t)&unk_23221AED4);
  v25 = v35;
  v26 = static CurrentValueSummaryModelGenerating.makePublisher(generatorContext:request:)(v35, a2, v34, v24);
  sub_2321F902C(a2);
  v27 = sub_2321FE440();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v25, v27);
  *(_QWORD *)(v23 + 16) = v26;
  return v23;
}

uint64_t sub_2321F8E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC9Summaries56MostRecentRangeCurrentValueSummarySharableModelGenerator_domain;
  v2 = sub_2321FE3BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2321F8ED4()
{
  return type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator(0);
}

uint64_t type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator(uint64_t a1)
{
  return sub_23201A14C(a1, (uint64_t *)&unk_2541B5018);
}

uint64_t sub_2321F8EF8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC9Summaries56MostRecentRangeCurrentValueSummarySharableModelGenerator_domain;
  v4 = sub_2321FE3BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

_UNKNOWN **sub_2321F8F40()
{
  return &off_250109420;
}

uint64_t sub_2321F8F4C(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B4FF8, type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator, (uint64_t)&unk_23221AE4C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_2321F8F88()
{
  return &off_250109468;
}

uint64_t sub_2321F8F94(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B5010, type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator, (uint64_t)&unk_23221AE7C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_2321F8FD0()
{
  return &off_250109480;
}

uint64_t sub_2321F8FDC(uint64_t a1)
{
  uint64_t result;

  result = sub_232000590(&qword_2541B5000, type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator, (uint64_t)&unk_23221AEA8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator.Request(uint64_t a1)
{
  return sub_23201A14C(a1, qword_2541B4F58);
}

uint64_t sub_2321F902C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator.Request(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2321F9068(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
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
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t inited;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  void (*v35)(unint64_t, _QWORD, uint64_t);
  unint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v45[2];
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];

  v45[1] = a2;
  v50 = a1;
  v55 = sub_2321FE38C();
  v53 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v54 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_2321FE3BC();
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v57 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v45 - v8;
  sub_2320057B8(0, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], v6);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v45 - v11;
  v49 = sub_232201278();
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v14 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232069E90();
  v60 = v15;
  v58 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v56 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2321FFC4C();
  MEMORY[0x24BDAC7A8](v17);
  v52 = sub_232200024();
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v19 = (char *)v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23220012C();
  sub_232200144();
  sub_232200138();
  v46 = a3;
  sub_232200150();
  sub_23220000C();
  sub_2321FE3D4();
  sub_232016AD8(v63, v63[3]);
  v20 = (void *)sub_2321FE314();
  v21 = type metadata accessor for MostRecentRangeCurrentValueSummarySharableModelGenerator.Request(0);
  v22 = (void *)sub_2321FE464();
  v23 = sub_2321FDC6C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
  v24 = sub_2321FD8B8();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v9, v50, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  v47 = v14;
  v50 = v19;
  sub_23220129C();

  sub_232016D88((uint64_t)v9, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878]);
  sub_232016D88((uint64_t)v12, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
  sub_232016AFC((uint64_t)v63);
  sub_2321FE434();
  v26 = (void *)sub_2321FE3F8();
  sub_232027434();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_232210D20;
  *(_QWORD *)(inited + 32) = sub_2321FE464();
  v62 = inited;
  sub_232201050();
  LOBYTE(v25) = *(_BYTE *)(v46 + *(int *)(v21 + 24));
  sub_2320057B8(0, &qword_2541B7530, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v28 = sub_2321FE194();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(_QWORD *)(v29 + 72);
  v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v32 = swift_allocObject();
  if ((v25 & 1) != 0)
  {
    *(_OWORD *)(v32 + 16) = xmmword_232210D40;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v29 + 104))(v32 + v31, *MEMORY[0x24BE47410], v28);
  }
  else
  {
    *(_OWORD *)(v32 + 16) = xmmword_232210D30;
    v34 = v32 + v31;
    v35 = *(void (**)(unint64_t, _QWORD, uint64_t))(v29 + 104);
    v35(v34, *MEMORY[0x24BE47460], v28);
    v35(v34 + v30, *MEMORY[0x24BE47490], v28);
  }
  v33 = v26;
  sub_2321A492C(v32);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v36 = swift_bridgeObjectRetain();
  sub_2321A4950(v36);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v54, *MEMORY[0x24BE47918], v55);
  v37 = v57;
  sub_2321FE3B0();

  swift_bridgeObjectRelease();
  sub_232000590(&qword_2541B55E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE45AF0], MEMORY[0x24BE45AE8]);
  v38 = v49;
  v39 = v47;
  v40 = sub_232200738();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v37, v61);
  sub_232016AFC((uint64_t)v63);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v38);
  v63[0] = v40;
  sub_232069F3C();
  sub_2320057B8(0, &qword_2541B3560, (uint64_t (*)(uint64_t))MEMORY[0x24BE45AD8], (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
  sub_232000590(&qword_2541B2FE8, (uint64_t (*)(uint64_t))sub_232069F3C, MEMORY[0x24BDB9AF8]);
  v41 = v56;
  sub_2322007A4();
  swift_release();
  sub_232000590(&qword_2541B2C50, (uint64_t (*)(uint64_t))sub_232069E90, MEMORY[0x24BDB96C0]);
  v42 = v60;
  v43 = sub_232200774();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v42);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v52);
  return v43;
}

unint64_t sub_2321F97A0(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t))
{
  uint64_t (*v4)(uint64_t, uint64_t);
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  unint64_t *v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  unint64_t result;
  void *v54;
  void *v55;
  char *v56;
  char *v57;
  char *v58;
  void *v59;
  id v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, _QWORD, uint64_t);
  uint64_t v68;
  void *v69;
  void (*v70)(char *, uint64_t);
  char *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t (*v86)(uint64_t);
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t);
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  void (*v111)(char *, uint64_t);
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  _OWORD v118[2];
  uint64_t v119;

  v111 = a3;
  v104 = a2;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_2320057B8(0, (unint64_t *)&qword_2541B2A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v105 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v117 = (uint64_t)&v102 - v8;
  sub_2320057B8(0, &qword_2541B28D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70], v4);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v115 = (char *)&v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v116 = (char *)&v102 - v12;
  v13 = sub_2321FFC94();
  v106 = *(_QWORD *)(v13 - 8);
  v107 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v109 = (char *)&v102 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], v4);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v102 - v16;
  sub_2320057B8(0, &qword_2541B7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], v4);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v102 - v19;
  v112 = sub_2321FDC6C();
  v114 = *(_QWORD *)(v112 - 8);
  v21 = MEMORY[0x24BDAC7A8](v112);
  v103 = (char *)&v102 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v110 = (char *)&v102 - v23;
  v24 = (uint64_t (*)(uint64_t))MEMORY[0x24BE45AD8];
  sub_2320057B8(0, &qword_2541B3560, (uint64_t (*)(uint64_t))MEMORY[0x24BE45AD8], (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v102 - v26;
  sub_2320057B8(0, &qword_2541B55D8, v24, v4);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v102 - v29;
  v31 = sub_23220126C();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v108 = (char *)&v102 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v113 = (char *)&v102 - v35;
  sub_232026DE8(a1, (uint64_t)v27, &qword_2541B3560, v24, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for SummaryModelQueryOutput);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v37 = 1;
  if (v36(v27, 1, v31) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v30, v27, v31);
    v37 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v30, v37, 1, v31);
  if (v36(v30, 1, v31) == 1)
  {
    v38 = &qword_2541B55D8;
    v39 = (uint64_t (*)(uint64_t))MEMORY[0x24BE45AD8];
    v40 = (uint64_t)v30;
LABEL_9:
    sub_232016D88(v40, v38, v39);
LABEL_10:
    v46 = v116;
    sub_2321FE6B0();
    v47 = sub_2321FE6D4();
    v48 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v46, 0, 1, v47);
    sub_232003E9C(0, &qword_2541B0CD0);
    v49 = sub_2321FFD78();
    v50 = v117;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v117, 1, 1, v49);
    v51 = (uint64_t)v115;
    sub_232026DE8((uint64_t)v46, (uint64_t)v115, &qword_2541B28D0, v48, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v52 = sub_2320151CC(0, 0xF000000000000000, 0xBu, v50, v51, 0, 0);
    sub_232016D88((uint64_t)v46, &qword_2541B28D0, v48);
    return (unint64_t)v52;
  }
  v41 = v113;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v113, v30, v31);
  sub_232026DE8((uint64_t)v111, (uint64_t)v17, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v42 = sub_2321FD8B8();
  v43 = *(_QWORD *)(v42 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v17, 1, v42) == 1)
  {
    sub_232016D88((uint64_t)v17, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v114 + 56))(v20, 1, 1, v112);
LABEL_8:
    (*(void (**)(char *, uint64_t))(v32 + 8))(v41, v31);
    v38 = &qword_2541B7618;
    v39 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
    v40 = (uint64_t)v20;
    goto LABEL_9;
  }
  sub_2321FD870();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v42);
  v44 = v114;
  v45 = v112;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v114 + 56))(v20, 0, 1, v112);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v20, 1, v45) == 1)
    goto LABEL_8;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v110, v20, v45);
  v54 = (void *)sub_232201260();
  v55 = (void *)sub_2321FDBF4();
  v56 = (char *)objc_msgSend(v54, sel_statisticsForDate_, v55);

  v57 = v108;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v108, v41, v31);
  v58 = v109;
  if (v56)
    goto LABEL_21;
  v59 = (void *)sub_232201260();
  v60 = objc_msgSend(v59, sel_statistics);

  sub_232003E9C(0, (unint64_t *)&qword_2541B7EB8);
  v61 = sub_232201038();

  if (!(v61 >> 62))
  {
    v62 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v62)
      goto LABEL_15;
LABEL_29:
    swift_bridgeObjectRelease();
    v101 = *(void (**)(char *, uint64_t))(v32 + 8);
    v101(v57, v31);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v110, v45);
    v101(v41, v31);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v62 = sub_232201998();
  swift_bridgeObjectRelease();
  if (!v62)
    goto LABEL_29;
LABEL_15:
  result = v62 - 1;
  if (__OFSUB__(v62, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if ((v61 & 0xC000000000000001) != 0)
  {
LABEL_31:
    v63 = (char *)MEMORY[0x2348FEA30](result, v61);
    goto LABEL_20;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  if (result >= *(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v63 = (char *)*(id *)(v61 + 8 * result + 32);
LABEL_20:
  v56 = v63;
  swift_bridgeObjectRelease();
LABEL_21:
  v64 = *(void (**)(char *, uint64_t))(v32 + 8);
  v64(v57, v31);
  v66 = v106;
  v65 = v107;
  v67 = *(void (**)(char *, _QWORD, uint64_t))(v106 + 104);
  v67(v58, *MEMORY[0x24BE4ABB8], v107);
  v68 = v65;
  v69 = (void *)sub_2322011B8();
  v70 = *(void (**)(char *, uint64_t))(v66 + 8);
  v70(v58, v68);
  if (!v69)
  {
    v88 = v116;
    sub_2321FE6B0();
    v89 = sub_2321FE6D4();
    v90 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v88, 0, 1, v89);
    sub_232003E9C(0, &qword_2541B0CD0);
    v91 = sub_2321FFD78();
    v92 = v117;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56))(v117, 1, 1, v91);
    v93 = (uint64_t)v115;
    sub_232026DE8((uint64_t)v88, (uint64_t)v115, &qword_2541B28D0, v90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v52 = sub_2320151CC(0, 0xF000000000000000, 0xBu, v92, v93, 0, 0);
    sub_232016D88((uint64_t)v88, &qword_2541B28D0, v90);

    (*(void (**)(char *, uint64_t))(v114 + 8))(v110, v45);
    v64(v113, v31);
    return (unint64_t)v52;
  }
  v111 = v64;
  v67(v58, *MEMORY[0x24BE4ABB0], v68);
  v71 = v69;
  v72 = (void *)sub_2322011B8();
  v70(v58, v68);
  if (!v72)
  {

    v94 = v116;
    sub_2321FE6B0();
    v95 = sub_2321FE6D4();
    v96 = (uint64_t (*)(uint64_t))MEMORY[0x24BE47E70];
    (*(void (**)(id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 56))(v94, 0, 1, v95);
    sub_232003E9C(0, &qword_2541B0CD0);
    v97 = sub_2321FFD78();
    v98 = v71;
    v99 = v117;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v97 - 8) + 56))(v117, 1, 1, v97);
    v100 = (uint64_t)v115;
    sub_232026DE8((uint64_t)v94, (uint64_t)v115, &qword_2541B28D0, v96, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v52 = sub_2320151CC(0, 0xF000000000000000, 0xBu, v99, v100, 0, 0);
    sub_232016D88((uint64_t)v94, &qword_2541B28D0, v96);

    (*(void (**)(char *, uint64_t))(v114 + 8))(v110, v45);
    goto LABEL_27;
  }
  v116 = v56;
  sub_232003E9C(0, &qword_2541B56F0);
  v73 = v114;
  v74 = (uint64_t)v103;
  (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v103, v110, v45);
  v75 = v72;
  v115 = v71;
  v109 = v75;
  v76 = sub_232010E44(v71, v75, v74);
  v77 = sub_23220015C();
  v78 = (uint64_t)v105;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 16))(v105, v104, v77);
  v79 = *MEMORY[0x24BE4AD60];
  v80 = sub_2321FFD78();
  v81 = *(_QWORD *)(v80 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 104))(v78, v79, v80);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v81 + 56))(v78, 0, 1, v80);
  result = (unint64_t)objc_msgSend(v76, sel_data);
  if (result)
  {
    v82 = (void *)result;
    sub_232003E9C(0, &qword_2541B0CD0);
    v83 = sub_2321FDAD4();
    v85 = v84;

    v86 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0];
    v87 = v117;
    sub_232026DE8(v78, v117, (unint64_t *)&qword_2541B2A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE4ADA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v119 = 0;
    memset(v118, 0, sizeof(v118));
    v52 = sub_232015828(v83, v85, 10, v87, 0, 0, (uint64_t)v118);
    sub_232003ED4(v83, v85);

    sub_232016D88(v78, (unint64_t *)&qword_2541B2A70, v86);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v110, v112);
LABEL_27:
    v111(v113, v31);
    return (unint64_t)v52;
  }
LABEL_34:
  __break(1u);
  return result;
}

_QWORD *sub_2321FA398(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23220015C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2321FD8B8();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_2321FE4A0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = a3[9];
    *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2321FA510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_23220015C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_2321FD8B8();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + *(int *)(a2 + 28);
  v9 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2321FA5CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = sub_23220015C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2321FD8B8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  v17 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2321FA718(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;

  v6 = sub_23220015C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_2321FD8B8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v20 = a3[9];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2321FA8CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23220015C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2321FD8B8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  return a1;
}

uint64_t sub_2321FAA0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_23220015C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_2321FD8B8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_2321FE4A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v20 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v21 = (_QWORD *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2321FABA8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321FABB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v6 = sub_23220015C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_2321FE4A0();
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[7];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[9] + 8);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_2321FAC9C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2321FACA8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = sub_23220015C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  sub_2320057B8(0, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_2321FE4A0();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[7];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[9] + 8) = (a2 - 1);
  return result;
}

void sub_2321FAD8C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23220015C();
  if (v0 <= 0x3F)
  {
    sub_2320057B8(319, &qword_2541B7F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
    {
      sub_2321FE4A0();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

_QWORD *SnidgetStringBuilder.__allocating_init(healthStore:unitPreferenceController:)(void *a1, id a2)
{
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = (_QWORD *)swift_allocObject();
  v4[2] = a1;
  v5 = (void *)objc_opt_self();
  v6 = a1;
  v7 = objc_msgSend(v5, sel_sharedInstanceForHealthStore_, v6);
  v4[4] = v7;
  if (!a2)
  {
    v8 = v7;
    a2 = objc_msgSend(v8, sel_createHKUnitPreferenceController);

  }
  v4[3] = a2;
  return v4;
}

_QWORD *SnidgetStringBuilder.init(healthStore:unitPreferenceController:viewControllerFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

_QWORD *SnidgetStringBuilder.init(healthStore:unitPreferenceController:)(void *a1, id a2)
{
  _QWORD *v2;
  void *v5;
  id v6;
  id v7;
  id v8;

  v2[2] = a1;
  v5 = (void *)objc_opt_self();
  v6 = a1;
  v7 = objc_msgSend(v5, sel_sharedInstanceForHealthStore_, v6);
  v2[4] = v7;
  if (!a2)
  {
    v8 = v7;
    a2 = objc_msgSend(v8, sel_createHKUnitPreferenceController);

  }
  v2[3] = a2;
  return v2;
}

_QWORD *SnidgetStringBuilder.init(healthStore:)(void *a1)
{
  _QWORD *v1;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v1[2] = a1;
  v3 = (void *)objc_opt_self();
  v4 = a1;
  v5 = objc_msgSend(v3, sel_sharedInstanceForHealthStore_, v4);
  v1[4] = v5;
  v6 = v5;
  v7 = objc_msgSend(v6, sel_createHKUnitPreferenceController);

  v1[3] = v7;
  return v1;
}

id *SnidgetStringBuilder.deinit()
{
  id *v0;

  return v0;
}

id SnidgetStringBuilder.getPreferredUnit(displayType:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 24), sel_unitForChartingDisplayType_, a1);
}

uint64_t SnidgetStringBuilder.makeSafeDouble(displayType:quantity:preferredUnit:)(void *a1, void *a2, void *a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  os_log_t v37;
  uint64_t v38;
  os_log_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v7 = *v3;
  v8 = sub_23220039C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(a1, sel_objectType);
  objc_opt_self();
  v13 = swift_dynamicCastObjCClass();

  if (!v13)
  {
    objc_msgSend(a2, sel__value);
    return v16;
  }
  if (objc_msgSend(a2, sel_isCompatibleWithUnit_, a3))
  {
    v14 = objc_msgSend(a1, sel_behavior);
    v15 = objc_msgSend(v14, sel_chartsRelativeData);

    if (v15)
      objc_msgSend(a2, sel__baselineRelativeDoubleValueForUnit_, a3);
    else
      objc_msgSend(a2, sel_doubleValueForUnit_, a3);
    return v16;
  }
  sub_232200318();
  v17 = a3;
  v18 = a1;
  v19 = v17;
  v20 = v18;
  v21 = sub_232200390();
  v22 = sub_2322012E4();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc();
    v41 = v23;
    v25 = v24;
    v26 = swift_slowAlloc();
    v42 = v26;
    *(_DWORD *)v25 = 136446722;
    v43 = v8;
    v44 = v26;
    v45 = v7;
    swift_getMetatypeMetadata();
    v40 = v21;
    v27 = sub_232200F00();
    v45 = sub_232013174(v27, v28, &v44);
    sub_232201710();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    v29 = objc_msgSend(v19, sel_unitString);
    v30 = sub_232200EC4();
    v32 = v31;

    v45 = sub_232013174(v30, v32, &v44);
    sub_232201710();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 22) = 2080;
    v33 = objc_msgSend(v20, sel_displayTypeIdentifierString);
    v34 = sub_232200EC4();
    v36 = v35;

    v45 = sub_232013174(v34, v36, &v44);
    sub_232201710();

    swift_bridgeObjectRelease();
    v37 = v40;
    _os_log_impl(&dword_231FFB000, v40, (os_log_type_t)v41, "[%{public}s] Preferred Unit %s isn't compatible with asked for quantity type: %s", (uint8_t *)v25, 0x20u);
    v38 = v42;
    swift_arrayDestroy();
    MEMORY[0x2348FF468](v38, -1, -1);
    MEMORY[0x2348FF468](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v43);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return 0;
}

id SnidgetStringBuilder.makeFormattedNumber(displayType:value:)(void *a1, double a2)
{
  id v3;
  id v4;
  id v5;

  v3 = objc_msgSend(a1, sel_presentation);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, a2);
  v5 = objc_msgSend(v3, sel_adjustedValueForDaemonValue_, v4);

  return v5;
}

uint64_t SnidgetStringBuilder.makeQuantityFormattedDouble(displayType:quantity:)(void *a1, void *a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend(*(id *)(v2 + 24), sel_unitForChartingDisplayType_, a1);
  if (!v5)
    v5 = objc_msgSend(a2, sel__unit);
  v6 = SnidgetStringBuilder.makeSafeDouble(displayType:quantity:preferredUnit:)(a1, a2, v5);
  if ((v7 & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(a1, sel_presentation);
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v6);
    v10 = objc_msgSend(v8, sel_adjustedValueForDaemonValue_, v9);

    objc_msgSend(v10, sel_doubleValue);
    v12 = v11;

    return v12;
  }
  return v6;
}

uint64_t SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[3];
  id v9;

  v0 = sub_2321FDA38();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v8 - v5;
  sub_2321FDA2C();
  v8[2] = swift_getKeyPath();
  swift_getKeyPath();
  v9 = (id)sub_2321FF610();
  sub_232165D40();
  sub_2321FDA20();
  v8[0] = swift_getKeyPath();
  swift_getKeyPath();
  v9 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  sub_232165CBC();
  sub_2321FDA20();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  swift_bridgeObjectRetain();
  sub_2321FD9FC();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v6, v0);
}

uint64_t SnidgetStringBuilder.makeNoDataPrimaryAttributedString()()
{
  if (qword_2541B7488 != -1)
    swift_once();
  sub_2321FDA14();
  SnidgetStringBuilder.makePrimaryAttributedString(localizedString:)();
  return swift_bridgeObjectRelease();
}

void SnidgetStringBuilder.makeQuantityPrimaryAttributedString(displayType:quantity:)(void *a1@<X0>, void *a2@<X1>, id a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  uint64_t v43;
  int v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;

  v7 = *v3;
  v8 = sub_23220039C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)v3[3];
  v13 = objc_msgSend(v12, sel_unitForChartingDisplayType_, a1);
  if (!v13)
    v13 = objc_msgSend(a2, sel__unit);
  v14 = SnidgetStringBuilder.makeSafeDouble(displayType:quantity:preferredUnit:)(a1, a2, v13);
  if ((v15 & 1) != 0)
  {
    sub_232200318();
    v25 = a1;
    v26 = sub_232200390();
    v27 = sub_2322012E4();
    v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      v29 = swift_slowAlloc();
      v44 = v28;
      v30 = v29;
      v31 = swift_slowAlloc();
      v45 = v31;
      *(_DWORD *)v30 = 136446466;
      v46 = a3;
      v47 = v31;
      v48 = v7;
      swift_getMetatypeMetadata();
      v32 = sub_232200F00();
      v48 = sub_232013174(v32, v33, &v47);
      v43 = v8;
      sub_232201710();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      v42[1] = v30 + 14;
      v34 = objc_msgSend(v25, sel_displayTypeIdentifierString);
      v35 = sub_232200EC4();
      v37 = v36;

      v38 = v35;
      a3 = v46;
      v48 = sub_232013174(v38, v37, &v47);
      sub_232201710();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231FFB000, v26, (os_log_type_t)v44, "[%{public}s] Failed to create string for quantity type: %s", (uint8_t *)v30, 0x16u);
      v39 = v45;
      swift_arrayDestroy();
      MEMORY[0x2348FF468](v39, -1, -1);
      MEMORY[0x2348FF468](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v43);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    v40 = sub_2321FD9F0();
    (*(void (**)(id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(a3, 1, 1, v40);
  }
  else
  {
    v16 = *(double *)&v14;
    v17 = objc_msgSend(a1, sel_presentation);
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v16);
    v19 = objc_msgSend(v17, sel_adjustedValueForDaemonValue_, v18);

    v46 = objc_msgSend(a1, sel_hk_valueFormatterForUnit_, v13);
    v20 = v19;
    v21 = (void *)sub_2321FF604();
    v22 = (void *)sub_2321FF628();
    v23 = objc_msgSend(v46, sel_attributedStringFromValue_displayType_unitController_valueFont_unitFont_, v20, a1, v12, v21, v22);

    if (v23)
    {
      sub_2321FDA08();

      v24 = sub_2321FD9F0();
      (*(void (**)(id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(a3, 0, 1, v24);
    }
    else
    {
      v41 = sub_2321FD9F0();
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(a3, 1, 1, v41);

    }
  }
}

uint64_t SnidgetStringBuilder.makeSupplementaryAttributedString(supplementaryLabelConfiguration:statisticsOption:aggregationInterval:supplementaryLabelInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v11 = a4 & 1;
  sub_232087FDC();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v15 = a3;
  v15[8] = v11;
  v16 = (uint64_t)&v15[*(int *)(v13 + 48)];
  sub_2320004AC(a5, v16, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  sub_2321FCC3C(a1, a2, v16, a3, v11);
  if (v17)
  {
    SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();
    sub_232143924((uint64_t)v15);
    v18 = sub_2321FD9F0();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a6, 0, 1, v18);
  }
  else
  {
    sub_232143924((uint64_t)v15);
    v20 = sub_2321FD9F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a6, 1, 1, v20);
  }
}

uint64_t SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)()
{
  uint64_t v0;
  uint64_t KeyPath;

  v0 = sub_2321FDA38();
  MEMORY[0x24BDAC7A8](v0);
  swift_bridgeObjectRetain();
  sub_2321FDA2C();
  sub_2321FD9FC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2321FF61C();
  sub_232165D40();
  sub_2321FD9A8();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor, KeyPath);
  sub_232165CBC();
  return sub_2321FD9A8();
}

uint64_t SnidgetStringBuilder.makeDateRangeSupplementaryAttributedString(dateRange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(uint64_t);
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - v5;
  v7 = (void (*)(uint64_t))MEMORY[0x24BE4ABE8];
  sub_2320002B4(0, &qword_2541B2A30, (void (*)(uint64_t))MEMORY[0x24BE4ABE8]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - v9;
  v11 = sub_2322000D8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE4B910], v11);
  v15 = sub_2321FFC94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 1, 1, v15);
  v16 = sub_2321FD8B8();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v6, a1, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  sub_2321FCC3C((uint64_t)v14, (uint64_t)v10, (uint64_t)v6, 0, 1);
  v19 = v18;
  sub_23200040C((uint64_t)v6, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  sub_23200040C((uint64_t)v10, &qword_2541B2A30, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v19)
  {
    SnidgetStringBuilder.makeSupplementaryAttributedString(localizedString:)();
    swift_bridgeObjectRelease();
    v20 = sub_2321FD9F0();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a2, 0, 1, v20);
  }
  else
  {
    v22 = sub_2321FD9F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 1, 1, v22);
  }
}

uint64_t sub_2321FC124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321FC19C(a1, a2, a3, &qword_255FA1B18);
}

uint64_t sub_2321FC138(uint64_t a1, uint64_t a2)
{
  return sub_2321FC20C(a1, a2, &qword_255FA1B18);
}

void sub_2321FC14C()
{
  sub_232165CBC();
  sub_2321FDA44();
  __break(1u);
}

void sub_2321FC170()
{
  sub_2321FD96C();
  __break(1u);
}

uint64_t sub_2321FC188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321FC19C(a1, a2, a3, &qword_255FA1B20);
}

uint64_t sub_2321FC19C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  sub_2321FD74C(0, a4);
  return sub_232200E64() & 1;
}

uint64_t sub_2321FC1F8(uint64_t a1, uint64_t a2)
{
  return sub_2321FC20C(a1, a2, &qword_255FA1B20);
}

uint64_t sub_2321FC20C(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  sub_2321FD74C(0, a3);
  return sub_232200E10();
}

void sub_2321FC254()
{
  sub_232165D40();
  sub_2321FDA44();
  __break(1u);
}

void sub_2321FC278()
{
  sub_2321FD978();
  __break(1u);
}

uint64_t LocalizationOverride.valueOverrideLocalizedStringKey.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t LocalizationOverride.valueOverrideLocalizedStringTable.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

unint64_t sub_2321FC2F8()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000021;
  else
    return 0xD00000000000001FLL;
}

uint64_t sub_2321FC338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2321FD0B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2321FC35C()
{
  sub_2321FD06C();
  return sub_232201BD8();
}

uint64_t sub_2321FC384()
{
  sub_2321FD06C();
  return sub_232201BE4();
}

uint64_t LocalizationOverride.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];
  char v14;
  char v15;

  v13[0] = a4;
  v13[1] = a5;
  sub_2321FD6F0(0, &qword_255FA1AE8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE3520]);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v13 - v10;
  sub_232016AD8(a1, a1[3]);
  sub_2321FD06C();
  sub_232201BC0();
  v15 = 0;
  sub_232201A58();
  if (!v5)
  {
    v14 = 1;
    sub_232201A58();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t LocalizationOverride.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_2321FD198(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t sub_2321FC504@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_2321FD198(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_2321FC530(_QWORD *a1)
{
  uint64_t *v1;

  return LocalizationOverride.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_2321FC54C(uint64_t *a1, uint64_t *a2)
{
  return _s9Summaries20LocalizationOverrideV23__derived_struct_equalsySbAC_ACtFZ_0(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_2321FC568()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_2321FDDD4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2321FDDA4();
  v4 = objc_allocWithZone(MEMORY[0x24BE4A5A8]);
  v5 = (void *)sub_2321FDD5C();
  v6 = objc_msgSend(v4, sel_initWithCalendar_, v5);

  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_2541BF518 = (uint64_t)v6;
  return result;
}

_QWORD *SnidgetStringBuilder.__allocating_init(healthStore:unitPreferenceController:viewControllerFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

_QWORD *SnidgetStringBuilder.__allocating_init(healthStore:)(void *a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = (_QWORD *)swift_allocObject();
  v2[2] = a1;
  v3 = (void *)objc_opt_self();
  v4 = a1;
  v5 = objc_msgSend(v3, sel_sharedInstanceForHealthStore_, v4);
  v2[4] = v5;
  v6 = v5;
  v7 = objc_msgSend(v6, sel_createHKUnitPreferenceController);

  v2[3] = v7;
  return v2;
}

uint64_t SnidgetStringBuilder.__allocating_init(context:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];

  v2 = v1;
  v4 = sub_2321FE3EC();
  sub_2321FE3D4();
  sub_232016AD8(v12, v12[3]);
  v5 = sub_2321FE344();
  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_2321FE3EC();
  v8 = objc_msgSend(v6, sel_sharedInstanceForHealthStore_, v7);

  v9 = sub_2321FE440();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, id))(v2 + 104))(v4, v5, v8);
  sub_232016AFC((uint64_t)v12);
  return v10;
}

uint64_t SnidgetStringBuilder.__deallocating_deinit()
{
  id *v0;

  return swift_deallocClassInstance();
}

void sub_2321FC834()
{
  sub_2321FD978();
  __break(1u);
}

void sub_2321FC850()
{
  sub_232165D40();
  sub_2321FDA44();
  __break(1u);
}

uint64_t sub_2321FC874()
{
  return 8;
}

uint64_t sub_2321FC880()
{
  return swift_release();
}

uint64_t sub_2321FC888(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2321FC894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321FC19C(a1, a2, a3, &qword_255FA1B20) & 1;
}

uint64_t sub_2321FC8BC(uint64_t a1, uint64_t a2)
{
  return sub_2321FC20C(a1, a2, &qword_255FA1B20);
}

_QWORD *sub_2321FC8D0(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_2321FC8DC()
{
  sub_2321FD96C();
  __break(1u);
}

void sub_2321FC8F8()
{
  sub_232165CBC();
  sub_2321FDA44();
  __break(1u);
}

uint64_t sub_2321FC91C()
{
  return 8;
}

uint64_t sub_2321FC928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2321FC19C(a1, a2, a3, &qword_255FA1B18) & 1;
}

uint64_t sub_2321FC950(uint64_t a1, uint64_t a2)
{
  return sub_2321FC20C(a1, a2, &qword_255FA1B18);
}

uint64_t _s9Summaries20LocalizationOverrideV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v12;
  uint64_t result;

  if (!a2)
  {
    if (a6)
      return 0;
    goto LABEL_8;
  }
  if (!a6)
    return 0;
  if (a1 == a5 && a2 == a6 || (v12 = sub_232201ADC(), result = 0, (v12 & 1) != 0))
  {
LABEL_8:
    if (a4)
    {
      if (a8 && (a3 == a7 && a4 == a8 || (sub_232201ADC() & 1) != 0))
        return 1;
    }
    else if (!a8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_2321FCA14(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  unint64_t result;
  int v12;
  uint64_t v13;

  v6 = sub_2321FFC94();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x24BE4ABA8])
    goto LABEL_2;
  v12 = v10;
  if (v10 == *MEMORY[0x24BE4ABB8] || v10 == *MEMORY[0x24BE4ABB0])
    return 0xD000000000000028;
  if (v10 == *MEMORY[0x24BE4AB98])
    return 0xD000000000000026;
  if (v10 == *MEMORY[0x24BE4AB90])
    return 0xD000000000000027;
  if (v10 == *MEMORY[0x24BE4ABD0])
    return 0xD00000000000002FLL;
  if (v10 == *MEMORY[0x24BE4ABA0])
    goto LABEL_2;
  result = 0;
  if (v12 != *MEMORY[0x24BE4ABD8] && v12 != *MEMORY[0x24BE4ABC8])
  {
    if (v12 != *MEMORY[0x24BE4ABC0])
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return 0;
    }
LABEL_2:
    if ((a3 & 1) == 0 && a2 > 1)
      return 0xD000000000000028;
    else
      return 0;
  }
  return result;
}

uint64_t sub_2321FCC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  char *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v35 = a5;
  v36 = a4;
  v34 = a3;
  v38 = a2;
  sub_2320002B4(0, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - v7;
  v37 = sub_2321FD8B8();
  v9 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v33 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2320002B4(0, &qword_2541B2A30, (void (*)(uint64_t))MEMORY[0x24BE4ABE8]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - v12;
  v14 = sub_2321FFC94();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2322000D8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  v22 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v21, v18);
  if (v22 == *MEMORY[0x24BE4B908])
  {
    sub_2320004AC(v38, (uint64_t)v13, &qword_2541B2A30, (void (*)(uint64_t))MEMORY[0x24BE4ABE8]);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    {
      sub_23200040C((uint64_t)v13, &qword_2541B2A30, (void (*)(uint64_t))MEMORY[0x24BE4ABE8]);
      return 0;
    }
    v24 = v35 & 1;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    sub_2321FCA14((uint64_t)v17, v36, v24);
    if (!v25)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      return 0;
    }
    if (qword_2541B7488 != -1)
      swift_once();
    v26 = sub_2321FDA14();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {
    if (v22 != *MEMORY[0x24BE4B910])
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      return 0;
    }
    sub_2320004AC(v34, (uint64_t)v8, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
    v23 = v37;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v37) == 1)
    {
      sub_23200040C((uint64_t)v8, &qword_2541B7F60, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
      return 0;
    }
    v27 = v33;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v33, v8, v23);
    v28 = objc_msgSend((id)objc_opt_self(), sel_hk_mediumMonthDayDateIntervalFormatter);
    if (!v28)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v27, v23);
      return 0;
    }
    v29 = v28;
    v30 = (void *)sub_2321FD858();
    v31 = objc_msgSend(v29, sel_stringFromDateInterval_, v30);

    if (v31)
    {
      v26 = sub_232200EC4();

    }
    else
    {

      v26 = 0;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v27, v23);
  }
  return v26;
}

unint64_t sub_2321FD06C()
{
  unint64_t result;

  result = qword_255FA1AF0;
  if (!qword_255FA1AF0)
  {
    result = MEMORY[0x2348FF39C](&unk_23221B1B8, &type metadata for LocalizationOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1AF0);
  }
  return result;
}

uint64_t sub_2321FD0B0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001FLL && a2 == 0x800000023220B2D0 || (sub_232201ADC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x800000023220B2F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_232201ADC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2321FD198(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;

  sub_2321FD6F0(0, &qword_255FA1B10, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x24BEE33E0]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v10 - v6;
  v8 = a1[4];
  sub_232016AD8(a1, a1[3]);
  sub_2321FD06C();
  sub_232201BB4();
  if (v1)
  {
    sub_232016AFC((uint64_t)a1);
  }
  else
  {
    v12 = 0;
    v8 = sub_232201A04();
    v11 = 1;
    swift_bridgeObjectRetain();
    sub_232201A04();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRetain();
    sub_232016AFC((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t destroy for LocalizationOverride()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for LocalizationOverride(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LocalizationOverride(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LocalizationOverride(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for LocalizationOverride(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizationOverride(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalizationOverride(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizationOverride()
{
  return &type metadata for LocalizationOverride;
}

uint64_t type metadata accessor for SnidgetStringBuilder()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for LocalizationOverride.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2321FD598 + 4 * byte_23221AF45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2321FD5CC + 4 * byte_23221AF40[v4]))();
}

uint64_t sub_2321FD5CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2321FD5D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2321FD5DCLL);
  return result;
}

uint64_t sub_2321FD5E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2321FD5F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2321FD5F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2321FD5FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocalizationOverride.CodingKeys()
{
  return &type metadata for LocalizationOverride.CodingKeys;
}

unint64_t sub_2321FD61C()
{
  unint64_t result;

  result = qword_255FA1AF8;
  if (!qword_255FA1AF8)
  {
    result = MEMORY[0x2348FF39C](&unk_23221B190, &type metadata for LocalizationOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1AF8);
  }
  return result;
}

unint64_t sub_2321FD664()
{
  unint64_t result;

  result = qword_255FA1B00;
  if (!qword_255FA1B00)
  {
    result = MEMORY[0x2348FF39C](&unk_23221B100, &type metadata for LocalizationOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1B00);
  }
  return result;
}

unint64_t sub_2321FD6AC()
{
  unint64_t result;

  result = qword_255FA1B08;
  if (!qword_255FA1B08)
  {
    result = MEMORY[0x2348FF39C](&unk_23221B128, &type metadata for LocalizationOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255FA1B08);
  }
  return result;
}

void sub_2321FD6F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_2321FD06C();
    v7 = a3(a1, &type metadata for LocalizationOverride.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_2321FD74C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    sub_2321FD984();
    v3 = sub_232201BCC();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2321FD7D4()
{
  return MEMORY[0x24BDCB168]();
}

uint64_t sub_2321FD7E0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2321FD7EC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2321FD7F8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2321FD804()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2321FD810()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2321FD81C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2321FD828()
{
  return MEMORY[0x24BDCB5F0]();
}

uint64_t sub_2321FD834()
{
  return MEMORY[0x24BDCB7F8]();
}

uint64_t sub_2321FD840()
{
  return MEMORY[0x24BE40EF8]();
}

uint64_t sub_2321FD84C()
{
  return MEMORY[0x24BE40F00]();
}

uint64_t sub_2321FD858()
{
  return MEMORY[0x24BDCB810]();
}

uint64_t sub_2321FD864()
{
  return MEMORY[0x24BDCB828]();
}

uint64_t sub_2321FD870()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_2321FD87C()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_2321FD888()
{
  return MEMORY[0x24BDCB840]();
}

uint64_t sub_2321FD894()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_2321FD8A0()
{
  return MEMORY[0x24BDCB858]();
}

uint64_t sub_2321FD8AC()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_2321FD8B8()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_2321FD8C4()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_2321FD8D0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2321FD8DC()
{
  return MEMORY[0x24BDCBA10]();
}

uint64_t sub_2321FD8E8()
{
  return MEMORY[0x24BDCBA18]();
}

uint64_t sub_2321FD8F4()
{
  return MEMORY[0x24BDCBA20]();
}

uint64_t sub_2321FD900()
{
  return MEMORY[0x24BDCBA28]();
}

uint64_t sub_2321FD90C()
{
  return MEMORY[0x24BDCBC48]();
}

uint64_t sub_2321FD918()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_2321FD924()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_2321FD930()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_2321FD93C()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_2321FD948()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_2321FD954()
{
  return MEMORY[0x24BDCBDD0]();
}

uint64_t sub_2321FD960()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2321FD96C()
{
  return MEMORY[0x24BEBBE40]();
}

uint64_t sub_2321FD978()
{
  return MEMORY[0x24BEBBE48]();
}

uint64_t sub_2321FD984()
{
  return MEMORY[0x24BEBBE58]();
}

uint64_t sub_2321FD990()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_2321FD99C()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_2321FD9A8()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_2321FD9B4()
{
  return MEMORY[0x24BDCC368]();
}

uint64_t sub_2321FD9C0()
{
  return MEMORY[0x24BDCC370]();
}

uint64_t sub_2321FD9CC()
{
  return MEMORY[0x24BDCC518]();
}

uint64_t sub_2321FD9D8()
{
  return MEMORY[0x24BDCC558]();
}

uint64_t sub_2321FD9E4()
{
  return MEMORY[0x24BDCC5A0]();
}

uint64_t sub_2321FD9F0()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_2321FD9FC()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_2321FDA08()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_2321FDA14()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2321FDA20()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_2321FDA2C()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_2321FDA38()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_2321FDA44()
{
  return MEMORY[0x24BEBBE70]();
}

uint64_t sub_2321FDA50()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2321FDA5C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2321FDA68()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_2321FDA74()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_2321FDA80()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_2321FDA8C()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_2321FDA98()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2321FDAA4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2321FDAB0()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2321FDABC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2321FDAC8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2321FDAD4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2321FDAE0()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2321FDAEC()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2321FDAF8()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_2321FDB04()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_2321FDB10()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_2321FDB1C()
{
  return MEMORY[0x24BDCE028]();
}

uint64_t sub_2321FDB28()
{
  return MEMORY[0x24BDCE098]();
}

uint64_t sub_2321FDB34()
{
  return MEMORY[0x24BDCE0B0]();
}

uint64_t sub_2321FDB40()
{
  return MEMORY[0x24BDCE0C8]();
}

uint64_t sub_2321FDB4C()
{
  return MEMORY[0x24BDCE0D0]();
}

uint64_t sub_2321FDB58()
{
  return MEMORY[0x24BDCE0E0]();
}

uint64_t sub_2321FDB64()
{
  return MEMORY[0x24BDCE168]();
}

uint64_t sub_2321FDB70()
{
  return MEMORY[0x24BDCE178]();
}

uint64_t sub_2321FDB7C()
{
  return MEMORY[0x24BDCE230]();
}

uint64_t sub_2321FDB88()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_2321FDB94()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_2321FDBA0()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_2321FDBAC()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_2321FDBB8()
{
  return MEMORY[0x24BE40F10]();
}

uint64_t sub_2321FDBC4()
{
  return MEMORY[0x24BE40F30]();
}

uint64_t sub_2321FDBD0()
{
  return MEMORY[0x24BE40F50]();
}

uint64_t sub_2321FDBDC()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2321FDBE8()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2321FDBF4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2321FDC00()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_2321FDC0C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_2321FDC18()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_2321FDC24()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2321FDC30()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2321FDC3C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2321FDC48()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_2321FDC54()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_2321FDC60()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2321FDC6C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2321FDC78()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2321FDC84()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2321FDC90()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2321FDC9C()
{
  return MEMORY[0x24BDCE9D8]();
}

uint64_t sub_2321FDCA8()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2321FDCB4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2321FDCC0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2321FDCCC()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2321FDCD8()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2321FDCE4()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_2321FDCF0()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_2321FDCFC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2321FDD08()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2321FDD14()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2321FDD20()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2321FDD2C()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_2321FDD38()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_2321FDD44()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_2321FDD50()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_2321FDD5C()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_2321FDD68()
{
  return MEMORY[0x24BDCF128]();
}

uint64_t sub_2321FDD74()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_2321FDD80()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2321FDD8C()
{
  return MEMORY[0x24BDCF198]();
}

uint64_t sub_2321FDD98()
{
  return MEMORY[0x24BDCF1A0]();
}

uint64_t sub_2321FDDA4()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2321FDDB0()
{
  return MEMORY[0x24BDCF1C8]();
}

uint64_t sub_2321FDDBC()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_2321FDDC8()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2321FDDD4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2321FDDE0()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_2321FDDEC()
{
  return MEMORY[0x24BDCF4A0]();
}

uint64_t sub_2321FDDF8()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2321FDE04()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_2321FDE10()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_2321FDE1C()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2321FDE28()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2321FDE34()
{
  return MEMORY[0x24BE41ED8]();
}

uint64_t sub_2321FDE40()
{
  return MEMORY[0x24BE3FC08]();
}

uint64_t sub_2321FDE4C()
{
  return MEMORY[0x24BE3FC10]();
}

uint64_t sub_2321FDE58()
{
  return MEMORY[0x24BE3FD88]();
}

uint64_t sub_2321FDE64()
{
  return MEMORY[0x24BE3FDA0]();
}

uint64_t sub_2321FDE70()
{
  return MEMORY[0x24BE3FDA8]();
}

uint64_t sub_2321FDE7C()
{
  return MEMORY[0x24BE3FDB0]();
}

uint64_t sub_2321FDE88()
{
  return MEMORY[0x24BE40728]();
}

uint64_t sub_2321FDE94()
{
  return MEMORY[0x24BE3FDE0]();
}

uint64_t sub_2321FDEA0()
{
  return MEMORY[0x24BE3FDE8]();
}

uint64_t sub_2321FDEAC()
{
  return MEMORY[0x24BE3FDF0]();
}

uint64_t sub_2321FDEB8()
{
  return MEMORY[0x24BE3FDF8]();
}

uint64_t sub_2321FDEC4()
{
  return MEMORY[0x24BE3FE20]();
}

uint64_t sub_2321FDED0()
{
  return MEMORY[0x24BE3FE90]();
}

uint64_t sub_2321FDEDC()
{
  return MEMORY[0x24BE3FEA8]();
}

uint64_t sub_2321FDEE8()
{
  return MEMORY[0x24BE3FEB0]();
}

uint64_t sub_2321FDEF4()
{
  return MEMORY[0x24BE3FEC0]();
}

uint64_t sub_2321FDF00()
{
  return MEMORY[0x24BE3FEC8]();
}

uint64_t sub_2321FDF0C()
{
  return MEMORY[0x24BE3FED0]();
}

uint64_t sub_2321FDF18()
{
  return MEMORY[0x24BE3FEF8]();
}

uint64_t sub_2321FDF24()
{
  return MEMORY[0x24BE3FF00]();
}

uint64_t sub_2321FDF30()
{
  return MEMORY[0x24BE3FF08]();
}

uint64_t sub_2321FDF3C()
{
  return MEMORY[0x24BE3FF68]();
}

uint64_t sub_2321FDF48()
{
  return MEMORY[0x24BE3FF70]();
}

uint64_t sub_2321FDF54()
{
  return MEMORY[0x24BE3FF80]();
}

uint64_t sub_2321FDF60()
{
  return MEMORY[0x24BE3FFB0]();
}

uint64_t sub_2321FDF6C()
{
  return MEMORY[0x24BE40118]();
}

uint64_t sub_2321FDF78()
{
  return MEMORY[0x24BE40120]();
}

uint64_t sub_2321FDF84()
{
  return MEMORY[0x24BE40158]();
}

uint64_t sub_2321FDF90()
{
  return MEMORY[0x24BE40168]();
}

uint64_t sub_2321FDF9C()
{
  return MEMORY[0x24BE40178]();
}

uint64_t sub_2321FDFA8()
{
  return MEMORY[0x24BE40200]();
}

uint64_t sub_2321FDFB4()
{
  return MEMORY[0x24BE40218]();
}

uint64_t sub_2321FDFC0()
{
  return MEMORY[0x24BE40228]();
}

uint64_t sub_2321FDFCC()
{
  return MEMORY[0x24BE40230]();
}

uint64_t sub_2321FDFD8()
{
  return MEMORY[0x24BE40238]();
}

uint64_t sub_2321FDFE4()
{
  return MEMORY[0x24BE40340]();
}

uint64_t sub_2321FDFF0()
{
  return MEMORY[0x24BE40348]();
}

uint64_t sub_2321FDFFC()
{
  return MEMORY[0x24BE40380]();
}

uint64_t sub_2321FE008()
{
  return MEMORY[0x24BE40390]();
}

uint64_t sub_2321FE014()
{
  return MEMORY[0x24BE403A0]();
}

uint64_t sub_2321FE020()
{
  return MEMORY[0x24BE405A8]();
}

uint64_t sub_2321FE02C()
{
  return MEMORY[0x24BE405C8]();
}

uint64_t sub_2321FE038()
{
  return MEMORY[0x24BE405D0]();
}

uint64_t sub_2321FE044()
{
  return MEMORY[0x24BEAA350]();
}

uint64_t sub_2321FE050()
{
  return MEMORY[0x24BE47268]();
}

uint64_t sub_2321FE05C()
{
  return MEMORY[0x24BE47270]();
}

uint64_t sub_2321FE068()
{
  return MEMORY[0x24BE47278]();
}

uint64_t sub_2321FE074()
{
  return MEMORY[0x24BE47280]();
}

uint64_t sub_2321FE080()
{
  return MEMORY[0x24BE47288]();
}

uint64_t sub_2321FE08C()
{
  return MEMORY[0x24BE47290]();
}

uint64_t sub_2321FE098()
{
  return MEMORY[0x24BE472A8]();
}

uint64_t sub_2321FE0A4()
{
  return MEMORY[0x24BE472C0]();
}

uint64_t sub_2321FE0B0()
{
  return MEMORY[0x24BE472E0]();
}

uint64_t sub_2321FE0BC()
{
  return MEMORY[0x24BE472E8]();
}

uint64_t sub_2321FE0C8()
{
  return MEMORY[0x24BE47330]();
}

uint64_t sub_2321FE0D4()
{
  return MEMORY[0x24BE47338]();
}

uint64_t sub_2321FE0E0()
{
  return MEMORY[0x24BE47340]();
}

uint64_t sub_2321FE0EC()
{
  return MEMORY[0x24BE47348]();
}

uint64_t sub_2321FE0F8()
{
  return MEMORY[0x24BE47350]();
}

uint64_t sub_2321FE104()
{
  return MEMORY[0x24BE47360]();
}

uint64_t sub_2321FE110()
{
  return MEMORY[0x24BE47368]();
}

uint64_t sub_2321FE11C()
{
  return MEMORY[0x24BE47370]();
}

uint64_t sub_2321FE128()
{
  return MEMORY[0x24BE47380]();
}

uint64_t sub_2321FE134()
{
  return MEMORY[0x24BE473A0]();
}

uint64_t sub_2321FE140()
{
  return MEMORY[0x24BE473A8]();
}

uint64_t sub_2321FE14C()
{
  return MEMORY[0x24BE473B0]();
}

uint64_t sub_2321FE158()
{
  return MEMORY[0x24BE473B8]();
}

uint64_t sub_2321FE164()
{
  return MEMORY[0x24BE473E0]();
}

uint64_t sub_2321FE170()
{
  return MEMORY[0x24BE473E8]();
}

uint64_t sub_2321FE17C()
{
  return MEMORY[0x24BE473F0]();
}

uint64_t sub_2321FE188()
{
  return MEMORY[0x24BE473F8]();
}

uint64_t sub_2321FE194()
{
  return MEMORY[0x24BE474E8]();
}

uint64_t sub_2321FE1A0()
{
  return MEMORY[0x24BE47580]();
}

uint64_t sub_2321FE1AC()
{
  return MEMORY[0x24BE47588]();
}

uint64_t sub_2321FE1B8()
{
  return MEMORY[0x24BE47590]();
}

uint64_t sub_2321FE1C4()
{
  return MEMORY[0x24BE47598]();
}

uint64_t sub_2321FE1D0()
{
  return MEMORY[0x24BE475A0]();
}

uint64_t sub_2321FE1DC()
{
  return MEMORY[0x24BE475C8]();
}

uint64_t sub_2321FE1E8()
{
  return MEMORY[0x24BE47610]();
}

uint64_t sub_2321FE1F4()
{
  return MEMORY[0x24BE41F00]();
}

uint64_t sub_2321FE200()
{
  return MEMORY[0x24BE41F08]();
}

uint64_t sub_2321FE20C()
{
  return MEMORY[0x24BE47620]();
}

uint64_t sub_2321FE218()
{
  return MEMORY[0x24BE47658]();
}

uint64_t sub_2321FE224()
{
  return MEMORY[0x24BE47678]();
}

uint64_t sub_2321FE230()
{
  return MEMORY[0x24BE47688]();
}

uint64_t sub_2321FE23C()
{
  return MEMORY[0x24BE47698]();
}

uint64_t sub_2321FE248()
{
  return MEMORY[0x24BE476A0]();
}

uint64_t sub_2321FE254()
{
  return MEMORY[0x24BE476A8]();
}

uint64_t sub_2321FE260()
{
  return MEMORY[0x24BE476C0]();
}

uint64_t sub_2321FE26C()
{
  return MEMORY[0x24BE47718]();
}

uint64_t sub_2321FE278()
{
  return MEMORY[0x24BE47728]();
}

uint64_t sub_2321FE284()
{
  return MEMORY[0x24BE47740]();
}

uint64_t sub_2321FE290()
{
  return MEMORY[0x24BE47748]();
}

uint64_t sub_2321FE29C()
{
  return MEMORY[0x24BE47750]();
}

uint64_t sub_2321FE2A8()
{
  return MEMORY[0x24BE47758]();
}

uint64_t sub_2321FE2B4()
{
  return MEMORY[0x24BE47780]();
}

uint64_t sub_2321FE2C0()
{
  return MEMORY[0x24BE47790]();
}

uint64_t sub_2321FE2CC()
{
  return MEMORY[0x24BE47798]();
}

uint64_t sub_2321FE2D8()
{
  return MEMORY[0x24BE477A0]();
}

uint64_t sub_2321FE2E4()
{
  return MEMORY[0x24BE477A8]();
}

uint64_t sub_2321FE2F0()
{
  return MEMORY[0x24BE477C0]();
}

uint64_t sub_2321FE2FC()
{
  return MEMORY[0x24BE477C8]();
}

uint64_t sub_2321FE308()
{
  return MEMORY[0x24BE477D0]();
}

uint64_t sub_2321FE314()
{
  return MEMORY[0x24BE47840]();
}

uint64_t sub_2321FE320()
{
  return MEMORY[0x24BE47850]();
}

uint64_t sub_2321FE32C()
{
  return MEMORY[0x24BE47858]();
}

uint64_t sub_2321FE338()
{
  return MEMORY[0x24BE47860]();
}

uint64_t sub_2321FE344()
{
  return MEMORY[0x24BE47870]();
}

uint64_t sub_2321FE350()
{
  return MEMORY[0x24BE47890]();
}

uint64_t sub_2321FE35C()
{
  return MEMORY[0x24BE478A8]();
}

uint64_t sub_2321FE368()
{
  return MEMORY[0x24BE478C8]();
}

uint64_t sub_2321FE374()
{
  return MEMORY[0x24BE478D0]();
}

uint64_t sub_2321FE380()
{
  return MEMORY[0x24BE478D8]();
}

uint64_t sub_2321FE38C()
{
  return MEMORY[0x24BE47928]();
}

uint64_t sub_2321FE398()
{
  return MEMORY[0x24BE47938]();
}

uint64_t sub_2321FE3A4()
{
  return MEMORY[0x24BE47940]();
}

uint64_t sub_2321FE3B0()
{
  return MEMORY[0x24BE47948]();
}

uint64_t sub_2321FE3BC()
{
  return MEMORY[0x24BE47958]();
}

uint64_t sub_2321FE3C8()
{
  return MEMORY[0x24BE47968]();
}

uint64_t sub_2321FE3D4()
{
  return MEMORY[0x24BE47970]();
}

uint64_t sub_2321FE3E0()
{
  return MEMORY[0x24BE47978]();
}

uint64_t sub_2321FE3EC()
{
  return MEMORY[0x24BE47980]();
}

uint64_t sub_2321FE3F8()
{
  return MEMORY[0x24BE47988]();
}

uint64_t sub_2321FE404()
{
  return MEMORY[0x24BE47990]();
}

uint64_t sub_2321FE410()
{
  return MEMORY[0x24BE47998]();
}

uint64_t sub_2321FE41C()
{
  return MEMORY[0x24BE479A0]();
}

uint64_t sub_2321FE428()
{
  return MEMORY[0x24BE479A8]();
}

uint64_t sub_2321FE434()
{
  return MEMORY[0x24BE479B0]();
}

uint64_t sub_2321FE440()
{
  return MEMORY[0x24BE479B8]();
}

uint64_t sub_2321FE44C()
{
  return MEMORY[0x24BE479D0]();
}

uint64_t sub_2321FE458()
{
  return MEMORY[0x24BE479F0]();
}

uint64_t sub_2321FE464()
{
  return MEMORY[0x24BE47A00]();
}

uint64_t sub_2321FE470()
{
  return MEMORY[0x24BE47A08]();
}

uint64_t sub_2321FE47C()
{
  return MEMORY[0x24BE47A10]();
}

uint64_t sub_2321FE488()
{
  return MEMORY[0x24BE47A18]();
}

uint64_t sub_2321FE494()
{
  return MEMORY[0x24BE47A20]();
}

uint64_t sub_2321FE4A0()
{
  return MEMORY[0x24BE47A28]();
}

uint64_t sub_2321FE4AC()
{
  return MEMORY[0x24BE47A38]();
}

uint64_t sub_2321FE4B8()
{
  return MEMORY[0x24BE47A48]();
}

uint64_t sub_2321FE4C4()
{
  return MEMORY[0x24BE47A58]();
}

uint64_t sub_2321FE4D0()
{
  return MEMORY[0x24BE47A68]();
}

uint64_t sub_2321FE4DC()
{
  return MEMORY[0x24BE47A70]();
}

uint64_t sub_2321FE4E8()
{
  return MEMORY[0x24BE47AA8]();
}

uint64_t sub_2321FE4F4()
{
  return MEMORY[0x24BE47AC0]();
}

uint64_t sub_2321FE500()
{
  return MEMORY[0x24BE47BB8]();
}

uint64_t sub_2321FE50C()
{
  return MEMORY[0x24BE47BF8]();
}

uint64_t sub_2321FE518()
{
  return MEMORY[0x24BE47C00]();
}

uint64_t sub_2321FE524()
{
  return MEMORY[0x24BE47C18]();
}

uint64_t sub_2321FE530()
{
  return MEMORY[0x24BE47C58]();
}

uint64_t sub_2321FE53C()
{
  return MEMORY[0x24BE47C60]();
}

uint64_t sub_2321FE548()
{
  return MEMORY[0x24BE47C68]();
}

uint64_t sub_2321FE554()
{
  return MEMORY[0x24BE47C70]();
}

uint64_t sub_2321FE560()
{
  return MEMORY[0x24BE47CA8]();
}

uint64_t sub_2321FE56C()
{
  return MEMORY[0x24BE47CB0]();
}

uint64_t sub_2321FE578()
{
  return MEMORY[0x24BE47CC0]();
}

uint64_t sub_2321FE584()
{
  return MEMORY[0x24BE47CC8]();
}

uint64_t sub_2321FE590()
{
  return MEMORY[0x24BE47CF0]();
}

uint64_t sub_2321FE59C()
{
  return MEMORY[0x24BE47CF8]();
}

uint64_t sub_2321FE5A8()
{
  return MEMORY[0x24BE47D00]();
}

uint64_t sub_2321FE5B4()
{
  return MEMORY[0x24BE47D08]();
}

uint64_t sub_2321FE5C0()
{
  return MEMORY[0x24BE47D10]();
}

uint64_t sub_2321FE5CC()
{
  return MEMORY[0x24BE47D18]();
}

uint64_t sub_2321FE5D8()
{
  return MEMORY[0x24BE47D20]();
}

uint64_t sub_2321FE5E4()
{
  return MEMORY[0x24BE47D28]();
}

uint64_t sub_2321FE5F0()
{
  return MEMORY[0x24BE47D30]();
}

uint64_t sub_2321FE5FC()
{
  return MEMORY[0x24BE47D38]();
}

uint64_t sub_2321FE608()
{
  return MEMORY[0x24BE47D40]();
}

uint64_t sub_2321FE614()
{
  return MEMORY[0x24BE47D68]();
}

uint64_t sub_2321FE620()
{
  return MEMORY[0x24BE47D70]();
}

uint64_t sub_2321FE62C()
{
  return MEMORY[0x24BE47DD8]();
}

uint64_t sub_2321FE638()
{
  return MEMORY[0x24BE47DE0]();
}

uint64_t sub_2321FE644()
{
  return MEMORY[0x24BE47DE8]();
}

uint64_t sub_2321FE650()
{
  return MEMORY[0x24BE47DF0]();
}

uint64_t sub_2321FE65C()
{
  return MEMORY[0x24BE47DF8]();
}

uint64_t sub_2321FE668()
{
  return MEMORY[0x24BE47E18]();
}

uint64_t sub_2321FE674()
{
  return MEMORY[0x24BE47E30]();
}

uint64_t sub_2321FE680()
{
  return MEMORY[0x24BE47E38]();
}

uint64_t sub_2321FE68C()
{
  return MEMORY[0x24BE47E40]();
}

uint64_t sub_2321FE698()
{
  return MEMORY[0x24BE47E48]();
}

uint64_t sub_2321FE6A4()
{
  return MEMORY[0x24BE47E50]();
}

uint64_t sub_2321FE6B0()
{
  return MEMORY[0x24BE47E58]();
}

uint64_t sub_2321FE6BC()
{
  return MEMORY[0x24BE47E60]();
}

uint64_t sub_2321FE6C8()
{
  return MEMORY[0x24BE47E68]();
}

uint64_t sub_2321FE6D4()
{
  return MEMORY[0x24BE47E70]();
}

uint64_t sub_2321FE6E0()
{
  return MEMORY[0x24BE47EA8]();
}

uint64_t sub_2321FE6EC()
{
  return MEMORY[0x24BE47EB0]();
}

uint64_t sub_2321FE6F8()
{
  return MEMORY[0x24BE47EB8]();
}

uint64_t sub_2321FE704()
{
  return MEMORY[0x24BE47EC0]();
}

uint64_t sub_2321FE710()
{
  return MEMORY[0x24BE47EC8]();
}

uint64_t sub_2321FE71C()
{
  return MEMORY[0x24BE47F80]();
}

uint64_t sub_2321FE728()
{
  return MEMORY[0x24BE47FB8]();
}

uint64_t sub_2321FE734()
{
  return MEMORY[0x24BE47FD0]();
}

uint64_t sub_2321FE740()
{
  return MEMORY[0x24BE47FF8]();
}

uint64_t sub_2321FE74C()
{
  return MEMORY[0x24BE48000]();
}

uint64_t sub_2321FE758()
{
  return MEMORY[0x24BE48010]();
}

uint64_t sub_2321FE764()
{
  return MEMORY[0x24BE48018]();
}

uint64_t sub_2321FE770()
{
  return MEMORY[0x24BE48020]();
}

uint64_t sub_2321FE77C()
{
  return MEMORY[0x24BE48028]();
}

uint64_t sub_2321FE788()
{
  return MEMORY[0x24BE48030]();
}

uint64_t sub_2321FE794()
{
  return MEMORY[0x24BE48038]();
}

uint64_t sub_2321FE7A0()
{
  return MEMORY[0x24BE48040]();
}

uint64_t sub_2321FE7AC()
{
  return MEMORY[0x24BE48048]();
}

uint64_t sub_2321FE7B8()
{
  return MEMORY[0x24BE48050]();
}

uint64_t sub_2321FE7C4()
{
  return MEMORY[0x24BE48058]();
}

uint64_t sub_2321FE7D0()
{
  return MEMORY[0x24BE48060]();
}

uint64_t sub_2321FE7DC()
{
  return MEMORY[0x24BE48068]();
}

uint64_t sub_2321FE7E8()
{
  return MEMORY[0x24BE480D0]();
}

uint64_t sub_2321FE7F4()
{
  return MEMORY[0x24BE48110]();
}

uint64_t sub_2321FE800()
{
  return MEMORY[0x24BE48128]();
}

uint64_t sub_2321FE80C()
{
  return MEMORY[0x24BE48138]();
}

uint64_t sub_2321FE818()
{
  return MEMORY[0x24BE48148]();
}

uint64_t sub_2321FE824()
{
  return MEMORY[0x24BE48150]();
}

uint64_t sub_2321FE830()
{
  return MEMORY[0x24BE48158]();
}

uint64_t sub_2321FE83C()
{
  return MEMORY[0x24BE481D0]();
}

uint64_t sub_2321FE848()
{
  return MEMORY[0x24BE481D8]();
}

uint64_t sub_2321FE854()
{
  return MEMORY[0x24BE48200]();
}

uint64_t sub_2321FE860()
{
  return MEMORY[0x24BE48210]();
}

uint64_t sub_2321FE86C()
{
  return MEMORY[0x24BE48238]();
}

uint64_t sub_2321FE878()
{
  return MEMORY[0x24BE48240]();
}

uint64_t sub_2321FE884()
{
  return MEMORY[0x24BE48250]();
}

uint64_t sub_2321FE890()
{
  return MEMORY[0x24BE48258]();
}

uint64_t sub_2321FE89C()
{
  return MEMORY[0x24BE48260]();
}

uint64_t sub_2321FE8A8()
{
  return MEMORY[0x24BE48268]();
}

uint64_t sub_2321FE8B4()
{
  return MEMORY[0x24BE48270]();
}

uint64_t sub_2321FE8C0()
{
  return MEMORY[0x24BE48278]();
}

uint64_t sub_2321FE8CC()
{
  return MEMORY[0x24BE48280]();
}

uint64_t sub_2321FE8D8()
{
  return MEMORY[0x24BE48288]();
}

uint64_t sub_2321FE8E4()
{
  return MEMORY[0x24BE48290]();
}

uint64_t sub_2321FE8F0()
{
  return MEMORY[0x24BE482E0]();
}

uint64_t sub_2321FE8FC()
{
  return MEMORY[0x24BE482E8]();
}

uint64_t sub_2321FE908()
{
  return MEMORY[0x24BE482F8]();
}

uint64_t sub_2321FE914()
{
  return MEMORY[0x24BE48308]();
}

uint64_t sub_2321FE920()
{
  return MEMORY[0x24BE48310]();
}

uint64_t sub_2321FE92C()
{
  return MEMORY[0x24BE48318]();
}

uint64_t sub_2321FE938()
{
  return MEMORY[0x24BE48328]();
}

uint64_t sub_2321FE944()
{
  return MEMORY[0x24BE48338]();
}

uint64_t sub_2321FE950()
{
  return MEMORY[0x24BE48340]();
}

uint64_t sub_2321FE95C()
{
  return MEMORY[0x24BE48348]();
}

uint64_t sub_2321FE968()
{
  return MEMORY[0x24BE48358]();
}

uint64_t sub_2321FE974()
{
  return MEMORY[0x24BE48360]();
}

uint64_t sub_2321FE980()
{
  return MEMORY[0x24BE48368]();
}

uint64_t sub_2321FE98C()
{
  return MEMORY[0x24BE483A8]();
}

uint64_t sub_2321FE998()
{
  return MEMORY[0x24BE483B0]();
}

uint64_t sub_2321FE9A4()
{
  return MEMORY[0x24BE41F20]();
}

uint64_t sub_2321FE9B0()
{
  return MEMORY[0x24BE48660]();
}

uint64_t sub_2321FE9BC()
{
  return MEMORY[0x24BE48688]();
}

uint64_t sub_2321FE9C8()
{
  return MEMORY[0x24BE483F8]();
}

uint64_t sub_2321FE9D4()
{
  return MEMORY[0x24BE48400]();
}

uint64_t sub_2321FE9E0()
{
  return MEMORY[0x24BE48418]();
}

uint64_t sub_2321FE9EC()
{
  return MEMORY[0x24BE660B8]();
}

uint64_t sub_2321FE9F8()
{
  return MEMORY[0x24BE660C0]();
}

uint64_t sub_2321FEA04()
{
  return MEMORY[0x24BE660D8]();
}

uint64_t sub_2321FEA10()
{
  return MEMORY[0x24BE41070]();
}

uint64_t sub_2321FEA1C()
{
  return MEMORY[0x24BE410E8]();
}

uint64_t sub_2321FEA28()
{
  return MEMORY[0x24BE41230]();
}

uint64_t sub_2321FEA34()
{
  return MEMORY[0x24BE41238]();
}

uint64_t sub_2321FEA40()
{
  return MEMORY[0x24BE41300]();
}

uint64_t sub_2321FEA4C()
{
  return MEMORY[0x24BE41338]();
}

uint64_t sub_2321FEA58()
{
  return MEMORY[0x24BE41340]();
}

uint64_t sub_2321FEA64()
{
  return MEMORY[0x24BE41350]();
}

uint64_t sub_2321FEA70()
{
  return MEMORY[0x24BE41360]();
}

uint64_t sub_2321FEA7C()
{
  return MEMORY[0x24BE41368]();
}

uint64_t sub_2321FEA88()
{
  return MEMORY[0x24BE41388]();
}

uint64_t sub_2321FEA94()
{
  return MEMORY[0x24BE41390]();
}

uint64_t sub_2321FEAA0()
{
  return MEMORY[0x24BE413A8]();
}

uint64_t sub_2321FEAAC()
{
  return MEMORY[0x24BE413B0]();
}

uint64_t sub_2321FEAB8()
{
  return MEMORY[0x24BE41508]();
}

uint64_t sub_2321FEAC4()
{
  return MEMORY[0x24BE41510]();
}

uint64_t sub_2321FEAD0()
{
  return MEMORY[0x24BE416C8]();
}

uint64_t sub_2321FEADC()
{
  return MEMORY[0x24BE416D8]();
}

uint64_t sub_2321FEAE8()
{
  return MEMORY[0x24BE416E8]();
}

uint64_t sub_2321FEAF4()
{
  return MEMORY[0x24BE416F8]();
}

uint64_t sub_2321FEB00()
{
  return MEMORY[0x24BE41700]();
}

uint64_t sub_2321FEB0C()
{
  return MEMORY[0x24BE41708]();
}

uint64_t sub_2321FEB18()
{
  return MEMORY[0x24BE41748]();
}

uint64_t sub_2321FEB24()
{
  return MEMORY[0x24BE41750]();
}

uint64_t sub_2321FEB30()
{
  return MEMORY[0x24BE41758]();
}

uint64_t sub_2321FEB3C()
{
  return MEMORY[0x24BE41760]();
}

uint64_t sub_2321FEB48()
{
  return MEMORY[0x24BE41768]();
}

uint64_t sub_2321FEB54()
{
  return MEMORY[0x24BE417D0]();
}

uint64_t sub_2321FEB60()
{
  return MEMORY[0x24BE41828]();
}

uint64_t sub_2321FEB6C()
{
  return MEMORY[0x24BE41838]();
}

uint64_t sub_2321FEB78()
{
  return MEMORY[0x24BE41840]();
}

uint64_t sub_2321FEB84()
{
  return MEMORY[0x24BE41878]();
}

uint64_t sub_2321FEB90()
{
  return MEMORY[0x24BE41880]();
}

uint64_t sub_2321FEB9C()
{
  return MEMORY[0x24BE418A0]();
}

uint64_t sub_2321FEBA8()
{
  return MEMORY[0x24BE41960]();
}

uint64_t sub_2321FEBB4()
{
  return MEMORY[0x24BE41970]();
}

uint64_t sub_2321FEBC0()
{
  return MEMORY[0x24BE419F0]();
}

uint64_t sub_2321FEBCC()
{
  return MEMORY[0x24BE41A40]();
}

uint64_t sub_2321FEBD8()
{
  return MEMORY[0x24BE41A70]();
}

uint64_t sub_2321FEBE4()
{
  return MEMORY[0x24BE41A80]();
}

uint64_t sub_2321FEBF0()
{
  return MEMORY[0x24BE41A88]();
}

uint64_t sub_2321FEBFC()
{
  return MEMORY[0x24BE41A90]();
}

uint64_t sub_2321FEC08()
{
  return MEMORY[0x24BE41A98]();
}

uint64_t sub_2321FEC14()
{
  return MEMORY[0x24BE41AA0]();
}

uint64_t sub_2321FEC20()
{
  return MEMORY[0x24BE41B18]();
}

uint64_t sub_2321FEC2C()
{
  return MEMORY[0x24BE41C28]();
}

uint64_t sub_2321FEC38()
{
  return MEMORY[0x24BE41C40]();
}

uint64_t sub_2321FEC44()
{
  return MEMORY[0x24BE41C48]();
}

uint64_t sub_2321FEC50()
{
  return MEMORY[0x24BE41CD8]();
}

uint64_t sub_2321FEC5C()
{
  return MEMORY[0x24BE41CF8]();
}

uint64_t sub_2321FEC68()
{
  return MEMORY[0x24BE41D08]();
}

uint64_t sub_2321FEC74()
{
  return MEMORY[0x24BE3F770]();
}

uint64_t sub_2321FEC80()
{
  return MEMORY[0x24BE3F778]();
}

uint64_t sub_2321FEC8C()
{
  return MEMORY[0x24BE41F50]();
}

uint64_t sub_2321FEC98()
{
  return MEMORY[0x24BE41F58]();
}

uint64_t sub_2321FECA4()
{
  return MEMORY[0x24BE41F60]();
}

uint64_t sub_2321FECB0()
{
  return MEMORY[0x24BE41F68]();
}

uint64_t sub_2321FECBC()
{
  return MEMORY[0x24BE41FA8]();
}

uint64_t sub_2321FECC8()
{
  return MEMORY[0x24BE41FB0]();
}

uint64_t sub_2321FECD4()
{
  return MEMORY[0x24BE41FF0]();
}

uint64_t sub_2321FECE0()
{
  return MEMORY[0x24BE41FF8]();
}

uint64_t sub_2321FECEC()
{
  return MEMORY[0x24BE42008]();
}

uint64_t sub_2321FECF8()
{
  return MEMORY[0x24BE42010]();
}

uint64_t sub_2321FED04()
{
  return MEMORY[0x24BE42020]();
}

uint64_t sub_2321FED10()
{
  return MEMORY[0x24BE42098]();
}

uint64_t sub_2321FED1C()
{
  return MEMORY[0x24BE420B0]();
}

uint64_t sub_2321FED28()
{
  return MEMORY[0x24BE420B8]();
}

uint64_t sub_2321FED34()
{
  return MEMORY[0x24BE42140]();
}

uint64_t sub_2321FED40()
{
  return MEMORY[0x24BE42148]();
}

uint64_t sub_2321FED4C()
{
  return MEMORY[0x24BE42510]();
}

uint64_t sub_2321FED58()
{
  return MEMORY[0x24BE42538]();
}

uint64_t sub_2321FED64()
{
  return MEMORY[0x24BE42548]();
}

uint64_t sub_2321FED70()
{
  return MEMORY[0x24BE42550]();
}

uint64_t sub_2321FED7C()
{
  return MEMORY[0x24BE42558]();
}

uint64_t sub_2321FED88()
{
  return MEMORY[0x24BE425E0]();
}

uint64_t sub_2321FED94()
{
  return MEMORY[0x24BE42640]();
}

uint64_t sub_2321FEDA0()
{
  return MEMORY[0x24BE42678]();
}

uint64_t sub_2321FEDAC()
{
  return MEMORY[0x24BE426A0]();
}

uint64_t sub_2321FEDB8()
{
  return MEMORY[0x24BE426A8]();
}

uint64_t sub_2321FEDC4()
{
  return MEMORY[0x24BE426B0]();
}

uint64_t sub_2321FEDD0()
{
  return MEMORY[0x24BE426B8]();
}

uint64_t sub_2321FEDDC()
{
  return MEMORY[0x24BE42860]();
}

uint64_t sub_2321FEDE8()
{
  return MEMORY[0x24BE42868]();
}

uint64_t sub_2321FEDF4()
{
  return MEMORY[0x24BE42870]();
}

uint64_t sub_2321FEE00()
{
  return MEMORY[0x24BE42878]();
}

uint64_t sub_2321FEE0C()
{
  return MEMORY[0x24BE42880]();
}

uint64_t sub_2321FEE18()
{
  return MEMORY[0x24BE42968]();
}

uint64_t sub_2321FEE24()
{
  return MEMORY[0x24BE42970]();
}

uint64_t sub_2321FEE30()
{
  return MEMORY[0x24BE42978]();
}

uint64_t sub_2321FEE3C()
{
  return MEMORY[0x24BE42980]();
}

uint64_t sub_2321FEE48()
{
  return MEMORY[0x24BE42988]();
}

uint64_t sub_2321FEE54()
{
  return MEMORY[0x24BE42C28]();
}

uint64_t sub_2321FEE60()
{
  return MEMORY[0x24BE42C30]();
}

uint64_t sub_2321FEE6C()
{
  return MEMORY[0x24BE42C40]();
}

uint64_t sub_2321FEE78()
{
  return MEMORY[0x24BE42C80]();
}

uint64_t sub_2321FEE84()
{
  return MEMORY[0x24BE42C98]();
}

uint64_t sub_2321FEE90()
{
  return MEMORY[0x24BE42D80]();
}

uint64_t sub_2321FEE9C()
{
  return MEMORY[0x24BE42D90]();
}

uint64_t sub_2321FEEA8()
{
  return MEMORY[0x24BE42D98]();
}

uint64_t sub_2321FEEB4()
{
  return MEMORY[0x24BE42DF0]();
}

uint64_t sub_2321FEEC0()
{
  return MEMORY[0x24BE42E60]();
}

uint64_t sub_2321FEECC()
{
  return MEMORY[0x24BE42E90]();
}

uint64_t sub_2321FEED8()
{
  return MEMORY[0x24BE42EB0]();
}

uint64_t sub_2321FEEE4()
{
  return MEMORY[0x24BE42F68]();
}

uint64_t sub_2321FEEF0()
{
  return MEMORY[0x24BE42F78]();
}

uint64_t sub_2321FEEFC()
{
  return MEMORY[0x24BE42F80]();
}

uint64_t sub_2321FEF08()
{
  return MEMORY[0x24BE42F88]();
}

uint64_t sub_2321FEF14()
{
  return MEMORY[0x24BE42F90]();
}

uint64_t sub_2321FEF20()
{
  return MEMORY[0x24BE42FA0]();
}

uint64_t sub_2321FEF2C()
{
  return MEMORY[0x24BE42FB0]();
}

uint64_t sub_2321FEF38()
{
  return MEMORY[0x24BE42FB8]();
}

uint64_t sub_2321FEF44()
{
  return MEMORY[0x24BE42FC0]();
}

uint64_t sub_2321FEF50()
{
  return MEMORY[0x24BE42FC8]();
}

uint64_t sub_2321FEF5C()
{
  return MEMORY[0x24BE42FE0]();
}

uint64_t sub_2321FEF68()
{
  return MEMORY[0x24BE43100]();
}

uint64_t sub_2321FEF74()
{
  return MEMORY[0x24BE43128]();
}

uint64_t sub_2321FEF80()
{
  return MEMORY[0x24BE43140]();
}

uint64_t sub_2321FEF8C()
{
  return MEMORY[0x24BE43150]();
}

uint64_t sub_2321FEF98()
{
  return MEMORY[0x24BE43170]();
}

uint64_t sub_2321FEFA4()
{
  return MEMORY[0x24BE431A0]();
}

uint64_t sub_2321FEFB0()
{
  return MEMORY[0x24BE431A8]();
}

uint64_t sub_2321FEFBC()
{
  return MEMORY[0x24BE431B0]();
}

uint64_t sub_2321FEFC8()
{
  return MEMORY[0x24BE431B8]();
}

uint64_t sub_2321FEFD4()
{
  return MEMORY[0x24BE431C0]();
}

uint64_t sub_2321FEFE0()
{
  return MEMORY[0x24BE43218]();
}

uint64_t sub_2321FEFEC()
{
  return MEMORY[0x24BE43220]();
}

uint64_t sub_2321FEFF8()
{
  return MEMORY[0x24BE43228]();
}

uint64_t sub_2321FF004()
{
  return MEMORY[0x24BE432B8]();
}

uint64_t sub_2321FF010()
{
  return MEMORY[0x24BE432C8]();
}

uint64_t sub_2321FF01C()
{
  return MEMORY[0x24BE432D0]();
}

uint64_t sub_2321FF028()
{
  return MEMORY[0x24BE432D8]();
}

uint64_t sub_2321FF034()
{
  return MEMORY[0x24BE432E0]();
}

uint64_t sub_2321FF040()
{
  return MEMORY[0x24BE432E8]();
}

uint64_t sub_2321FF04C()
{
  return MEMORY[0x24BE432F0]();
}

uint64_t sub_2321FF058()
{
  return MEMORY[0x24BE432F8]();
}

uint64_t sub_2321FF064()
{
  return MEMORY[0x24BE43300]();
}

uint64_t sub_2321FF070()
{
  return MEMORY[0x24BE43308]();
}

uint64_t sub_2321FF07C()
{
  return MEMORY[0x24BE43310]();
}

uint64_t sub_2321FF088()
{
  return MEMORY[0x24BE43318]();
}

uint64_t sub_2321FF094()
{
  return MEMORY[0x24BE43328]();
}

uint64_t sub_2321FF0A0()
{
  return MEMORY[0x24BE43360]();
}

uint64_t sub_2321FF0AC()
{
  return MEMORY[0x24BE43368]();
}

uint64_t sub_2321FF0B8()
{
  return MEMORY[0x24BE433A0]();
}

uint64_t sub_2321FF0C4()
{
  return MEMORY[0x24BE433A8]();
}

uint64_t sub_2321FF0D0()
{
  return MEMORY[0x24BE434C0]();
}

uint64_t sub_2321FF0DC()
{
  return MEMORY[0x24BE43548]();
}

uint64_t sub_2321FF0E8()
{
  return MEMORY[0x24BE43550]();
}

uint64_t sub_2321FF0F4()
{
  return MEMORY[0x24BE43558]();
}

uint64_t sub_2321FF100()
{
  return MEMORY[0x24BE43560]();
}

uint64_t sub_2321FF10C()
{
  return MEMORY[0x24BE435C8]();
}

uint64_t sub_2321FF118()
{
  return MEMORY[0x24BE435D0]();
}

uint64_t sub_2321FF124()
{
  return MEMORY[0x24BE43608]();
}

uint64_t sub_2321FF130()
{
  return MEMORY[0x24BE43618]();
}

uint64_t sub_2321FF13C()
{
  return MEMORY[0x24BE43620]();
}

uint64_t sub_2321FF148()
{
  return MEMORY[0x24BE43628]();
}

uint64_t sub_2321FF154()
{
  return MEMORY[0x24BE43630]();
}

uint64_t sub_2321FF160()
{
  return MEMORY[0x24BE43638]();
}

uint64_t sub_2321FF16C()
{
  return MEMORY[0x24BE43658]();
}

uint64_t sub_2321FF178()
{
  return MEMORY[0x24BE43668]();
}

uint64_t sub_2321FF184()
{
  return MEMORY[0x24BE436B8]();
}

uint64_t sub_2321FF190()
{
  return MEMORY[0x24BE436F0]();
}

uint64_t sub_2321FF19C()
{
  return MEMORY[0x24BE436F8]();
}

uint64_t sub_2321FF1A8()
{
  return MEMORY[0x24BE43718]();
}

uint64_t sub_2321FF1B4()
{
  return MEMORY[0x24BE43720]();
}

uint64_t sub_2321FF1C0()
{
  return MEMORY[0x24BE43728]();
}

uint64_t sub_2321FF1CC()
{
  return MEMORY[0x24BE43730]();
}

uint64_t sub_2321FF1D8()
{
  return MEMORY[0x24BE438B8]();
}

uint64_t sub_2321FF1E4()
{
  return MEMORY[0x24BE438C0]();
}

uint64_t sub_2321FF1F0()
{
  return MEMORY[0x24BE438E0]();
}

uint64_t sub_2321FF1FC()
{
  return MEMORY[0x24BE438F8]();
}

uint64_t sub_2321FF208()
{
  return MEMORY[0x24BE43908]();
}

uint64_t sub_2321FF214()
{
  return MEMORY[0x24BE43918]();
}

uint64_t sub_2321FF220()
{
  return MEMORY[0x24BE43920]();
}

uint64_t sub_2321FF22C()
{
  return MEMORY[0x24BE43958]();
}

uint64_t sub_2321FF238()
{
  return MEMORY[0x24BE43960]();
}

uint64_t sub_2321FF244()
{
  return MEMORY[0x24BE43968]();
}

uint64_t sub_2321FF250()
{
  return MEMORY[0x24BE43A98]();
}

uint64_t sub_2321FF25C()
{
  return MEMORY[0x24BE43C10]();
}

uint64_t sub_2321FF268()
{
  return MEMORY[0x24BE43C18]();
}

uint64_t sub_2321FF274()
{
  return MEMORY[0x24BE43C20]();
}

uint64_t sub_2321FF280()
{
  return MEMORY[0x24BE43C28]();
}

uint64_t sub_2321FF28C()
{
  return MEMORY[0x24BE43C30]();
}

uint64_t sub_2321FF298()
{
  return MEMORY[0x24BE43C58]();
}

uint64_t sub_2321FF2A4()
{
  return MEMORY[0x24BE43C68]();
}

uint64_t sub_2321FF2B0()
{
  return MEMORY[0x24BE43C70]();
}

uint64_t sub_2321FF2BC()
{
  return MEMORY[0x24BE43C78]();
}

uint64_t sub_2321FF2C8()
{
  return MEMORY[0x24BE43C80]();
}

uint64_t sub_2321FF2D4()
{
  return MEMORY[0x24BE43C88]();
}

uint64_t sub_2321FF2E0()
{
  return MEMORY[0x24BE43CD8]();
}

uint64_t sub_2321FF2EC()
{
  return MEMORY[0x24BE43D88]();
}

uint64_t sub_2321FF2F8()
{
  return MEMORY[0x24BE43D90]();
}

uint64_t sub_2321FF304()
{
  return MEMORY[0x24BE43DA0]();
}

uint64_t sub_2321FF310()
{
  return MEMORY[0x24BE43DB0]();
}

uint64_t sub_2321FF31C()
{
  return MEMORY[0x24BE43DB8]();
}

uint64_t sub_2321FF328()
{
  return MEMORY[0x24BE43DC0]();
}

uint64_t sub_2321FF334()
{
  return MEMORY[0x24BE43DC8]();
}

uint64_t sub_2321FF340()
{
  return MEMORY[0x24BE43DD0]();
}

uint64_t sub_2321FF34C()
{
  return MEMORY[0x24BE43DF8]();
}

uint64_t sub_2321FF358()
{
  return MEMORY[0x24BE43E00]();
}

uint64_t sub_2321FF364()
{
  return MEMORY[0x24BE43E18]();
}

uint64_t sub_2321FF370()
{
  return MEMORY[0x24BE43E40]();
}

uint64_t sub_2321FF37C()
{
  return MEMORY[0x24BE43E50]();
}

uint64_t sub_2321FF388()
{
  return MEMORY[0x24BE43E60]();
}

uint64_t sub_2321FF394()
{
  return MEMORY[0x24BE43E90]();
}

uint64_t sub_2321FF3A0()
{
  return MEMORY[0x24BE43EF0]();
}

uint64_t sub_2321FF3AC()
{
  return MEMORY[0x24BE43EF8]();
}

uint64_t sub_2321FF3B8()
{
  return MEMORY[0x24BE43F18]();
}

uint64_t sub_2321FF3C4()
{
  return MEMORY[0x24BE43F30]();
}

uint64_t sub_2321FF3D0()
{
  return MEMORY[0x24BE43F40]();
}

uint64_t sub_2321FF3DC()
{
  return MEMORY[0x24BE44090]();
}

uint64_t sub_2321FF3E8()
{
  return MEMORY[0x24BE44098]();
}

uint64_t sub_2321FF3F4()
{
  return MEMORY[0x24BE440A0]();
}

uint64_t sub_2321FF400()
{
  return MEMORY[0x24BE440B8]();
}

uint64_t sub_2321FF40C()
{
  return MEMORY[0x24BE440C0]();
}

uint64_t sub_2321FF418()
{
  return MEMORY[0x24BE440D8]();
}

uint64_t sub_2321FF424()
{
  return MEMORY[0x24BE44230]();
}

uint64_t sub_2321FF430()
{
  return MEMORY[0x24BE44238]();
}

uint64_t sub_2321FF43C()
{
  return MEMORY[0x24BE44240]();
}

uint64_t sub_2321FF448()
{
  return MEMORY[0x24BE44248]();
}

uint64_t sub_2321FF454()
{
  return MEMORY[0x24BE44258]();
}

uint64_t sub_2321FF460()
{
  return MEMORY[0x24BE44270]();
}

uint64_t sub_2321FF46C()
{
  return MEMORY[0x24BE44280]();
}

uint64_t sub_2321FF478()
{
  return MEMORY[0x24BE442A0]();
}

uint64_t sub_2321FF484()
{
  return MEMORY[0x24BE44320]();
}

uint64_t sub_2321FF490()
{
  return MEMORY[0x24BE44328]();
}

uint64_t _s9Summaries29SummaryTrendViewActionHandlerCfd_0()
{
  return MEMORY[0x24BE44338]();
}

uint64_t sub_2321FF4A8()
{
  return MEMORY[0x24BE44348]();
}

uint64_t sub_2321FF4B4()
{
  return MEMORY[0x24BE44350]();
}

uint64_t sub_2321FF4C0()
{
  return MEMORY[0x24BE44370]();
}

uint64_t sub_2321FF4CC()
{
  return MEMORY[0x24BE44398]();
}

uint64_t sub_2321FF4D8()
{
  return MEMORY[0x24BE443D0]();
}

uint64_t sub_2321FF4E4()
{
  return MEMORY[0x24BE443D8]();
}

uint64_t sub_2321FF4F0()
{
  return MEMORY[0x24BE443E8]();
}

uint64_t sub_2321FF4FC()
{
  return MEMORY[0x24BE443F8]();
}

uint64_t sub_2321FF508()
{
  return MEMORY[0x24BE44440]();
}

uint64_t sub_2321FF514()
{
  return MEMORY[0x24BE44448]();
}

uint64_t sub_2321FF520()
{
  return MEMORY[0x24BE44458]();
}

uint64_t sub_2321FF52C()
{
  return MEMORY[0x24BE44498]();
}

uint64_t sub_2321FF538()
{
  return MEMORY[0x24BE444E8]();
}

uint64_t sub_2321FF544()
{
  return MEMORY[0x24BE444F0]();
}

uint64_t sub_2321FF550()
{
  return MEMORY[0x24BE44500]();
}

uint64_t sub_2321FF55C()
{
  return MEMORY[0x24BE44508]();
}

uint64_t sub_2321FF568()
{
  return MEMORY[0x24BE44520]();
}

uint64_t sub_2321FF574()
{
  return MEMORY[0x24BE44528]();
}

uint64_t sub_2321FF580()
{
  return MEMORY[0x24BE44538]();
}

uint64_t sub_2321FF58C()
{
  return MEMORY[0x24BE44598]();
}

uint64_t sub_2321FF598()
{
  return MEMORY[0x24BE445A0]();
}

uint64_t sub_2321FF5A4()
{
  return MEMORY[0x24BE445A8]();
}

uint64_t sub_2321FF5B0()
{
  return MEMORY[0x24BE44640]();
}

uint64_t sub_2321FF5BC()
{
  return MEMORY[0x24BE446C0]();
}

uint64_t sub_2321FF5C8()
{
  return MEMORY[0x24BE446C8]();
}

uint64_t sub_2321FF5D4()
{
  return MEMORY[0x24BE44830]();
}

uint64_t sub_2321FF5E0()
{
  return MEMORY[0x24BE44840]();
}

uint64_t sub_2321FF5EC()
{
  return MEMORY[0x24BE44850]();
}

uint64_t sub_2321FF5F8()
{
  return MEMORY[0x24BE44858]();
}

uint64_t sub_2321FF604()
{
  return MEMORY[0x24BE44860]();
}

uint64_t sub_2321FF610()
{
  return MEMORY[0x24BE44868]();
}

uint64_t sub_2321FF61C()
{
  return MEMORY[0x24BE44870]();
}

uint64_t sub_2321FF628()
{
  return MEMORY[0x24BE44878]();
}

uint64_t sub_2321FF634()
{
  return MEMORY[0x24BE44960]();
}

uint64_t sub_2321FF640()
{
  return MEMORY[0x24BE44968]();
}

uint64_t sub_2321FF64C()
{
  return MEMORY[0x24BE44970]();
}

uint64_t sub_2321FF658()
{
  return MEMORY[0x24BE44978]();
}

uint64_t sub_2321FF664()
{
  return MEMORY[0x24BE44980]();
}

uint64_t sub_2321FF670()
{
  return MEMORY[0x24BE44A78]();
}

uint64_t sub_2321FF67C()
{
  return MEMORY[0x24BE44A80]();
}

uint64_t sub_2321FF688()
{
  return MEMORY[0x24BE44A88]();
}

uint64_t sub_2321FF694()
{
  return MEMORY[0x24BE44AA0]();
}

uint64_t sub_2321FF6A0()
{
  return MEMORY[0x24BE44AA8]();
}

uint64_t sub_2321FF6AC()
{
  return MEMORY[0x24BE44B20]();
}

uint64_t sub_2321FF6B8()
{
  return MEMORY[0x24BE44BA8]();
}

uint64_t sub_2321FF6C4()
{
  return MEMORY[0x24BE44BB0]();
}

uint64_t sub_2321FF6D0()
{
  return MEMORY[0x24BE44BD0]();
}

uint64_t sub_2321FF6DC()
{
  return MEMORY[0x24BE44BE0]();
}

uint64_t sub_2321FF6E8()
{
  return MEMORY[0x24BE44BE8]();
}

uint64_t sub_2321FF6F4()
{
  return MEMORY[0x24BE44C38]();
}

uint64_t sub_2321FF700()
{
  return MEMORY[0x24BE44C40]();
}

uint64_t sub_2321FF70C()
{
  return MEMORY[0x24BE44C70]();
}

uint64_t sub_2321FF718()
{
  return MEMORY[0x24BE44C78]();
}

uint64_t sub_2321FF724()
{
  return MEMORY[0x24BE44C80]();
}

uint64_t sub_2321FF730()
{
  return MEMORY[0x24BE44C88]();
}

uint64_t sub_2321FF73C()
{
  return MEMORY[0x24BE44CA0]();
}

uint64_t sub_2321FF748()
{
  return MEMORY[0x24BE44CA8]();
}

uint64_t sub_2321FF754()
{
  return MEMORY[0x24BE44CF0]();
}

uint64_t sub_2321FF760()
{
  return MEMORY[0x24BE44E28]();
}

uint64_t sub_2321FF76C()
{
  return MEMORY[0x24BE44E30]();
}

uint64_t sub_2321FF778()
{
  return MEMORY[0x24BE44E38]();
}

uint64_t sub_2321FF784()
{
  return MEMORY[0x24BE44E40]();
}

uint64_t sub_2321FF790()
{
  return MEMORY[0x24BE44E48]();
}

uint64_t sub_2321FF79C()
{
  return MEMORY[0x24BE44E78]();
}

uint64_t sub_2321FF7A8()
{
  return MEMORY[0x24BE44EA8]();
}

uint64_t sub_2321FF7B4()
{
  return MEMORY[0x24BE44EB0]();
}

uint64_t sub_2321FF7C0()
{
  return MEMORY[0x24BE44EB8]();
}

uint64_t sub_2321FF7CC()
{
  return MEMORY[0x24BE44EC0]();
}

uint64_t sub_2321FF7D8()
{
  return MEMORY[0x24BE44ED8]();
}

uint64_t sub_2321FF7E4()
{
  return MEMORY[0x24BE44F30]();
}

uint64_t sub_2321FF7F0()
{
  return MEMORY[0x24BE45138]();
}

uint64_t sub_2321FF7FC()
{
  return MEMORY[0x24BE45140]();
}

uint64_t sub_2321FF808()
{
  return MEMORY[0x24BE45328]();
}

uint64_t sub_2321FF814()
{
  return MEMORY[0x24BE45330]();
}

uint64_t sub_2321FF820()
{
  return MEMORY[0x24BE45338]();
}

uint64_t sub_2321FF82C()
{
  return MEMORY[0x24BE45340]();
}

uint64_t sub_2321FF838()
{
  return MEMORY[0x24BE456C8]();
}

uint64_t sub_2321FF844()
{
  return MEMORY[0x24BE45750]();
}

uint64_t sub_2321FF850()
{
  return MEMORY[0x24BE45768]();
}

uint64_t sub_2321FF85C()
{
  return MEMORY[0x24BE45788]();
}

uint64_t sub_2321FF868()
{
  return MEMORY[0x24BE45798]();
}

uint64_t sub_2321FF874()
{
  return MEMORY[0x24BE457A0]();
}

uint64_t sub_2321FF880()
{
  return MEMORY[0x24BE457B0]();
}

uint64_t sub_2321FF88C()
{
  return MEMORY[0x24BE457B8]();
}

uint64_t sub_2321FF898()
{
  return MEMORY[0x24BE457F0]();
}

uint64_t sub_2321FF8A4()
{
  return MEMORY[0x24BE457F8]();
}

uint64_t sub_2321FF8B0()
{
  return MEMORY[0x24BE45838]();
}

uint64_t sub_2321FF8BC()
{
  return MEMORY[0x24BE45890]();
}

uint64_t sub_2321FF8C8()
{
  return MEMORY[0x24BE458A0]();
}

uint64_t sub_2321FF8D4()
{
  return MEMORY[0x24BE458F0]();
}

uint64_t sub_2321FF8E0()
{
  return MEMORY[0x24BE45940]();
}

uint64_t sub_2321FF8EC()
{
  return MEMORY[0x24BE486B8]();
}

uint64_t sub_2321FF8F8()
{
  return MEMORY[0x24BE48710]();
}

uint64_t sub_2321FF904()
{
  return MEMORY[0x24BE48718]();
}

uint64_t sub_2321FF910()
{
  return MEMORY[0x24BE46E98]();
}

uint64_t sub_2321FF91C()
{
  return MEMORY[0x24BE46EA0]();
}

uint64_t sub_2321FF928()
{
  return MEMORY[0x24BE46EA8]();
}

uint64_t sub_2321FF934()
{
  return MEMORY[0x24BE46EB0]();
}

uint64_t sub_2321FF940()
{
  return MEMORY[0x24BE46EB8]();
}

uint64_t sub_2321FF94C()
{
  return MEMORY[0x24BE46EC0]();
}

uint64_t sub_2321FF958()
{
  return MEMORY[0x24BE46EE0]();
}

uint64_t sub_2321FF964()
{
  return MEMORY[0x24BE46EF8]();
}

uint64_t sub_2321FF970()
{
  return MEMORY[0x24BE46F00]();
}

uint64_t sub_2321FF97C()
{
  return MEMORY[0x24BE46F10]();
}

uint64_t sub_2321FF988()
{
  return MEMORY[0x24BE46F20]();
}

uint64_t sub_2321FF994()
{
  return MEMORY[0x24BE46F28]();
}

uint64_t sub_2321FF9A0()
{
  return MEMORY[0x24BE46F30]();
}

uint64_t sub_2321FF9AC()
{
  return MEMORY[0x24BE46F38]();
}

uint64_t sub_2321FF9B8()
{
  return MEMORY[0x24BE48430]();
}

uint64_t sub_2321FF9C4()
{
  return MEMORY[0x24BE48438]();
}

uint64_t sub_2321FF9D0()
{
  return MEMORY[0x24BE48450]();
}

uint64_t sub_2321FF9DC()
{
  return MEMORY[0x24BE48458]();
}

uint64_t sub_2321FF9E8()
{
  return MEMORY[0x24BE48460]();
}

uint64_t sub_2321FF9F4()
{
  return MEMORY[0x24BE46F58]();
}

uint64_t sub_2321FFA00()
{
  return MEMORY[0x24BE46F60]();
}

uint64_t sub_2321FFA0C()
{
  return MEMORY[0x24BE46F70]();
}

uint64_t sub_2321FFA18()
{
  return MEMORY[0x24BE46FC8]();
}

uint64_t sub_2321FFA24()
{
  return MEMORY[0x24BE46FD0]();
}

uint64_t sub_2321FFA30()
{
  return MEMORY[0x24BE46FD8]();
}

uint64_t sub_2321FFA3C()
{
  return MEMORY[0x24BE46FE0]();
}

uint64_t sub_2321FFA48()
{
  return MEMORY[0x24BE46FF0]();
}

uint64_t sub_2321FFA54()
{
  return MEMORY[0x24BE47000]();
}

uint64_t sub_2321FFA60()
{
  return MEMORY[0x24BE47010]();
}

uint64_t sub_2321FFA6C()
{
  return MEMORY[0x24BE47018]();
}

uint64_t sub_2321FFA78()
{
  return MEMORY[0x24BE47020]();
}

uint64_t sub_2321FFA84()
{
  return MEMORY[0x24BE47030]();
}

uint64_t sub_2321FFA90()
{
  return MEMORY[0x24BE47038]();
}

uint64_t sub_2321FFA9C()
{
  return MEMORY[0x24BE47040]();
}

uint64_t sub_2321FFAA8()
{
  return MEMORY[0x24BE47068]();
}

uint64_t sub_2321FFAB4()
{
  return MEMORY[0x24BE47070]();
}

uint64_t sub_2321FFAC0()
{
  return MEMORY[0x24BE47078]();
}

uint64_t sub_2321FFACC()
{
  return MEMORY[0x24BE47080]();
}

uint64_t sub_2321FFAD8()
{
  return MEMORY[0x24BE470D8]();
}

uint64_t sub_2321FFAE4()
{
  return MEMORY[0x24BE470E0]();
}

uint64_t sub_2321FFAF0()
{
  return MEMORY[0x24BE470E8]();
}

uint64_t sub_2321FFAFC()
{
  return MEMORY[0x24BE470F0]();
}

uint64_t sub_2321FFB08()
{
  return MEMORY[0x24BE470F8]();
}

uint64_t sub_2321FFB14()
{
  return MEMORY[0x24BE47100]();
}

uint64_t sub_2321FFB20()
{
  return MEMORY[0x24BE47118]();
}

uint64_t sub_2321FFB2C()
{
  return MEMORY[0x24BE47120]();
}

uint64_t sub_2321FFB38()
{
  return MEMORY[0x24BE47128]();
}

uint64_t sub_2321FFB44()
{
  return MEMORY[0x24BE47138]();
}

uint64_t sub_2321FFB50()
{
  return MEMORY[0x24BE47148]();
}

uint64_t sub_2321FFB5C()
{
  return MEMORY[0x24BE47150]();
}

uint64_t sub_2321FFB68()
{
  return MEMORY[0x24BE47160]();
}

uint64_t sub_2321FFB74()
{
  return MEMORY[0x24BE47170]();
}

uint64_t sub_2321FFB80()
{
  return MEMORY[0x24BE47178]();
}

uint64_t sub_2321FFB8C()
{
  return MEMORY[0x24BE47180]();
}

uint64_t sub_2321FFB98()
{
  return MEMORY[0x24BE47190]();
}

uint64_t sub_2321FFBA4()
{
  return MEMORY[0x24BE47198]();
}

uint64_t sub_2321FFBB0()
{
  return MEMORY[0x24BE471A8]();
}

uint64_t sub_2321FFBBC()
{
  return MEMORY[0x24BE471B0]();
}

uint64_t sub_2321FFBC8()
{
  return MEMORY[0x24BE471B8]();
}

uint64_t sub_2321FFBD4()
{
  return MEMORY[0x24BE48468]();
}

uint64_t sub_2321FFBE0()
{
  return MEMORY[0x24BE471D0]();
}

uint64_t sub_2321FFBEC()
{
  return MEMORY[0x24BE471D8]();
}

uint64_t sub_2321FFBF8()
{
  return MEMORY[0x24BE471E0]();
}

uint64_t sub_2321FFC04()
{
  return MEMORY[0x24BE471E8]();
}

uint64_t sub_2321FFC10()
{
  return MEMORY[0x24BE4A980]();
}

uint64_t sub_2321FFC1C()
{
  return MEMORY[0x24BE4A988]();
}

uint64_t sub_2321FFC28()
{
  return MEMORY[0x24BE4A990]();
}

uint64_t sub_2321FFC34()
{
  return MEMORY[0x24BE4A998]();
}

uint64_t sub_2321FFC40()
{
  return MEMORY[0x24BE4AA00]();
}

uint64_t sub_2321FFC4C()
{
  return MEMORY[0x24BE4AA08]();
}

uint64_t sub_2321FFC58()
{
  return MEMORY[0x24BE4AAA0]();
}

uint64_t sub_2321FFC64()
{
  return MEMORY[0x24BE4AAB0]();
}

uint64_t sub_2321FFC70()
{
  return MEMORY[0x24BE4AB28]();
}

uint64_t sub_2321FFC7C()
{
  return MEMORY[0x24BE4AB30]();
}

uint64_t sub_2321FFC88()
{
  return MEMORY[0x24BE4ABE0]();
}

uint64_t sub_2321FFC94()
{
  return MEMORY[0x24BE4ABE8]();
}

uint64_t sub_2321FFCA0()
{
  return MEMORY[0x24BE4AC30]();
}

uint64_t sub_2321FFCAC()
{
  return MEMORY[0x24BE4AC38]();
}

uint64_t sub_2321FFCB8()
{
  return MEMORY[0x24BE4AC40]();
}

uint64_t sub_2321FFCC4()
{
  return MEMORY[0x24BE4AC48]();
}

uint64_t sub_2321FFCD0()
{
  return MEMORY[0x24BE4AC50]();
}

uint64_t sub_2321FFCDC()
{
  return MEMORY[0x24BE4AC58]();
}

uint64_t sub_2321FFCE8()
{
  return MEMORY[0x24BE4AC70]();
}

uint64_t sub_2321FFCF4()
{
  return MEMORY[0x24BE4AC78]();
}

uint64_t sub_2321FFD00()
{
  return MEMORY[0x24BE4AC80]();
}

uint64_t sub_2321FFD0C()
{
  return MEMORY[0x24BE4ACA0]();
}

uint64_t sub_2321FFD18()
{
  return MEMORY[0x24BE4ACA8]();
}

uint64_t sub_2321FFD24()
{
  return MEMORY[0x24BE4ACB0]();
}

uint64_t sub_2321FFD30()
{
  return MEMORY[0x24BE4ACB8]();
}

uint64_t sub_2321FFD3C()
{
  return MEMORY[0x24BE4ACC0]();
}

uint64_t sub_2321FFD48()
{
  return MEMORY[0x24BE4ACC8]();
}

uint64_t sub_2321FFD54()
{
  return MEMORY[0x24BE4ACD0]();
}

uint64_t sub_2321FFD60()
{
  return MEMORY[0x24BE4ACE8]();
}

uint64_t sub_2321FFD6C()
{
  return MEMORY[0x24BE4AD10]();
}

uint64_t sub_2321FFD78()
{
  return MEMORY[0x24BE4ADA0]();
}

uint64_t sub_2321FFD84()
{
  return MEMORY[0x24BE4ADC8]();
}

uint64_t sub_2321FFD90()
{
  return MEMORY[0x24BE4AE08]();
}

uint64_t sub_2321FFD9C()
{
  return MEMORY[0x24BE4AE10]();
}

uint64_t sub_2321FFDA8()
{
  return MEMORY[0x24BE4AE18]();
}

uint64_t sub_2321FFDB4()
{
  return MEMORY[0x24BE4AE20]();
}

uint64_t sub_2321FFDC0()
{
  return MEMORY[0x24BE4AE28]();
}

uint64_t sub_2321FFDCC()
{
  return MEMORY[0x24BE4AE30]();
}

uint64_t sub_2321FFDD8()
{
  return MEMORY[0x24BE4AE38]();
}

uint64_t sub_2321FFDE4()
{
  return MEMORY[0x24BE4AE40]();
}

uint64_t sub_2321FFDF0()
{
  return MEMORY[0x24BE4AE48]();
}

uint64_t sub_2321FFDFC()
{
  return MEMORY[0x24BE4AE50]();
}

uint64_t sub_2321FFE08()
{
  return MEMORY[0x24BE4AE58]();
}

uint64_t sub_2321FFE14()
{
  return MEMORY[0x24BE4B360]();
}

uint64_t sub_2321FFE20()
{
  return MEMORY[0x24BE4B368]();
}

uint64_t sub_2321FFE2C()
{
  return MEMORY[0x24BE4B448]();
}

uint64_t sub_2321FFE38()
{
  return MEMORY[0x24BE4B480]();
}

uint64_t sub_2321FFE44()
{
  return MEMORY[0x24BE4B488]();
}

uint64_t sub_2321FFE50()
{
  return MEMORY[0x24BE4B498]();
}

uint64_t sub_2321FFE5C()
{
  return MEMORY[0x24BE4B4A0]();
}

uint64_t sub_2321FFE68()
{
  return MEMORY[0x24BE4B4B0]();
}

uint64_t sub_2321FFE74()
{
  return MEMORY[0x24BE4B4B8]();
}

uint64_t sub_2321FFE80()
{
  return MEMORY[0x24BE4B4C0]();
}

uint64_t sub_2321FFE8C()
{
  return MEMORY[0x24BE4B4C8]();
}

uint64_t sub_2321FFE98()
{
  return MEMORY[0x24BE4B4D0]();
}

uint64_t sub_2321FFEA4()
{
  return MEMORY[0x24BE4B4D8]();
}

uint64_t sub_2321FFEB0()
{
  return MEMORY[0x24BE4B4E8]();
}

uint64_t sub_2321FFEBC()
{
  return MEMORY[0x24BE4B4F0]();
}

uint64_t sub_2321FFEC8()
{
  return MEMORY[0x24BE4B4F8]();
}

uint64_t sub_2321FFED4()
{
  return MEMORY[0x24BE4B500]();
}

uint64_t sub_2321FFEE0()
{
  return MEMORY[0x24BE4B510]();
}

uint64_t sub_2321FFEEC()
{
  return MEMORY[0x24BE4B518]();
}

uint64_t sub_2321FFEF8()
{
  return MEMORY[0x24BE4B520]();
}

uint64_t sub_2321FFF04()
{
  return MEMORY[0x24BE4B528]();
}

uint64_t sub_2321FFF10()
{
  return MEMORY[0x24BE4B548]();
}

uint64_t sub_2321FFF1C()
{
  return MEMORY[0x24BE4B550]();
}

uint64_t sub_2321FFF28()
{
  return MEMORY[0x24BE4B558]();
}

uint64_t sub_2321FFF34()
{
  return MEMORY[0x24BE4B560]();
}

uint64_t sub_2321FFF40()
{
  return MEMORY[0x24BE4B568]();
}

uint64_t sub_2321FFF4C()
{
  return MEMORY[0x24BE4B5C0]();
}

uint64_t sub_2321FFF58()
{
  return MEMORY[0x24BE4B5C8]();
}

uint64_t sub_2321FFF64()
{
  return MEMORY[0x24BE4B5E0]();
}

uint64_t sub_2321FFF70()
{
  return MEMORY[0x24BE4B5E8]();
}

uint64_t sub_2321FFF7C()
{
  return MEMORY[0x24BE4B5F0]();
}

uint64_t sub_2321FFF88()
{
  return MEMORY[0x24BE4B628]();
}

uint64_t sub_2321FFF94()
{
  return MEMORY[0x24BE4B630]();
}

uint64_t sub_2321FFFA0()
{
  return MEMORY[0x24BE4B688]();
}

uint64_t sub_2321FFFAC()
{
  return MEMORY[0x24BE4B690]();
}

uint64_t sub_2321FFFB8()
{
  return MEMORY[0x24BE4B698]();
}

uint64_t sub_2321FFFC4()
{
  return MEMORY[0x24BE4B6C8]();
}

uint64_t sub_2321FFFD0()
{
  return MEMORY[0x24BE4B6D0]();
}

uint64_t sub_2321FFFDC()
{
  return MEMORY[0x24BE4B6E0]();
}

uint64_t sub_2321FFFE8()
{
  return MEMORY[0x24BE4B710]();
}

uint64_t sub_2321FFFF4()
{
  return MEMORY[0x24BE4B718]();
}

uint64_t sub_232200000()
{
  return MEMORY[0x24BE4B720]();
}

uint64_t sub_23220000C()
{
  return MEMORY[0x24BE4B728]();
}

uint64_t sub_232200018()
{
  return MEMORY[0x24BE4B730]();
}

uint64_t sub_232200024()
{
  return MEMORY[0x24BE4B738]();
}

uint64_t sub_232200030()
{
  return MEMORY[0x24BE4B748]();
}

uint64_t sub_23220003C()
{
  return MEMORY[0x24BE4B760]();
}

uint64_t sub_232200048()
{
  return MEMORY[0x24BE4B808]();
}

uint64_t sub_232200054()
{
  return MEMORY[0x24BE4B810]();
}

uint64_t sub_232200060()
{
  return MEMORY[0x24BE4B818]();
}

uint64_t sub_23220006C()
{
  return MEMORY[0x24BE4B820]();
}

uint64_t sub_232200078()
{
  return MEMORY[0x24BE4B828]();
}

uint64_t sub_232200084()
{
  return MEMORY[0x24BE4B838]();
}

uint64_t sub_232200090()
{
  return MEMORY[0x24BE4B8B8]();
}

uint64_t sub_23220009C()
{
  return MEMORY[0x24BE4B8C0]();
}

uint64_t sub_2322000A8()
{
  return MEMORY[0x24BE4B8C8]();
}

uint64_t sub_2322000B4()
{
  return MEMORY[0x24BE4B8E8]();
}

uint64_t sub_2322000C0()
{
  return MEMORY[0x24BE4B8F0]();
}

uint64_t sub_2322000CC()
{
  return MEMORY[0x24BE4B8F8]();
}

uint64_t sub_2322000D8()
{
  return MEMORY[0x24BE4B918]();
}

uint64_t sub_2322000E4()
{
  return MEMORY[0x24BE4B940]();
}

uint64_t sub_2322000F0()
{
  return MEMORY[0x24BE4B948]();
}

uint64_t sub_2322000FC()
{
  return MEMORY[0x24BE4B950]();
}

uint64_t sub_232200108()
{
  return MEMORY[0x24BE4B958]();
}

uint64_t sub_232200114()
{
  return MEMORY[0x24BE4B960]();
}

uint64_t sub_232200120()
{
  return MEMORY[0x24BE4B970]();
}

uint64_t sub_23220012C()
{
  return MEMORY[0x24BE4B978]();
}

uint64_t sub_232200138()
{
  return MEMORY[0x24BE4B980]();
}

uint64_t sub_232200144()
{
  return MEMORY[0x24BE4B988]();
}

uint64_t sub_232200150()
{
  return MEMORY[0x24BE4B990]();
}

uint64_t sub_23220015C()
{
  return MEMORY[0x24BE4B998]();
}

uint64_t sub_232200168()
{
  return MEMORY[0x24BE4B9B8]();
}

uint64_t sub_232200174()
{
  return MEMORY[0x24BE4B9C0]();
}

uint64_t sub_232200180()
{
  return MEMORY[0x24BE4B9C8]();
}

uint64_t sub_23220018C()
{
  return MEMORY[0x24BE4BA58]();
}

uint64_t sub_232200198()
{
  return MEMORY[0x24BE4BA60]();
}

uint64_t sub_2322001A4()
{
  return MEMORY[0x24BE4BA68]();
}

uint64_t sub_2322001B0()
{
  return MEMORY[0x24BE4BA78]();
}

uint64_t sub_2322001BC()
{
  return MEMORY[0x24BE4BAC0]();
}

uint64_t sub_2322001C8()
{
  return MEMORY[0x24BE4BAC8]();
}

uint64_t sub_2322001D4()
{
  return MEMORY[0x24BE4BAD0]();
}

uint64_t sub_2322001E0()
{
  return MEMORY[0x24BE4BAD8]();
}

uint64_t sub_2322001EC()
{
  return MEMORY[0x24BE4BAE0]();
}

uint64_t sub_2322001F8()
{
  return MEMORY[0x24BE4BB70]();
}

uint64_t sub_232200204()
{
  return MEMORY[0x24BE4BB78]();
}

uint64_t sub_232200210()
{
  return MEMORY[0x24BE4BB80]();
}

uint64_t sub_23220021C()
{
  return MEMORY[0x24BE4BB88]();
}

uint64_t sub_232200228()
{
  return MEMORY[0x24BE4BBB0]();
}

uint64_t sub_232200234()
{
  return MEMORY[0x24BE4BBB8]();
}

uint64_t _s9Summaries21SnidgetLevelChartViewV0E5ModelC18fullCircleDiameter12CoreGraphics7CGFloatVvg_0()
{
  return MEMORY[0x24BE4BBC0]();
}

uint64_t sub_23220024C()
{
  return MEMORY[0x24BE4BBC8]();
}

uint64_t sub_232200258()
{
  return MEMORY[0x24BE4BBD0]();
}

uint64_t sub_232200264()
{
  return MEMORY[0x24BE4BBD8]();
}

uint64_t sub_232200270()
{
  return MEMORY[0x24BE4BBE0]();
}

uint64_t sub_23220027C()
{
  return MEMORY[0x24BE4BBE8]();
}

uint64_t sub_232200288()
{
  return MEMORY[0x24BE4BBF0]();
}

uint64_t sub_232200294()
{
  return MEMORY[0x24BE4BBF8]();
}

uint64_t sub_2322002A0()
{
  return MEMORY[0x24BE4BC00]();
}

uint64_t sub_2322002AC()
{
  return MEMORY[0x24BE4BC08]();
}

uint64_t sub_2322002B8()
{
  return MEMORY[0x24BE4BC10]();
}

uint64_t sub_2322002C4()
{
  return MEMORY[0x24BE4BC18]();
}

uint64_t sub_2322002D0()
{
  return MEMORY[0x24BE4BC28]();
}

uint64_t sub_2322002DC()
{
  return MEMORY[0x24BEE6260]();
}

uint64_t sub_2322002E8()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_2322002F4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_232200300()
{
  return MEMORY[0x24BE40688]();
}

uint64_t sub_23220030C()
{
  return MEMORY[0x24BE48470]();
}

uint64_t sub_232200318()
{
  return MEMORY[0x24BE48478]();
}

uint64_t sub_232200324()
{
  return MEMORY[0x24BE48498]();
}

uint64_t sub_232200330()
{
  return MEMORY[0x24BE484A8]();
}

uint64_t sub_23220033C()
{
  return MEMORY[0x24BE484B0]();
}

uint64_t sub_232200348()
{
  return MEMORY[0x24BE484C8]();
}

uint64_t sub_232200354()
{
  return MEMORY[0x24BE484D0]();
}

uint64_t sub_232200360()
{
  return MEMORY[0x24BE484D8]();
}

uint64_t sub_23220036C()
{
  return MEMORY[0x24BE459A0]();
}

uint64_t sub_232200378()
{
  return MEMORY[0x24BE4BC50]();
}

uint64_t sub_232200384()
{
  return MEMORY[0x24BE4BC58]();
}

uint64_t sub_232200390()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23220039C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2322003A8()
{
  return MEMORY[0x24BEBC060]();
}

uint64_t sub_2322003B4()
{
  return MEMORY[0x24BEBC088]();
}

uint64_t sub_2322003C0()
{
  return MEMORY[0x24BEBC098]();
}

uint64_t sub_2322003CC()
{
  return MEMORY[0x24BEBC0B0]();
}

uint64_t sub_2322003D8()
{
  return MEMORY[0x24BEBC0B8]();
}

uint64_t sub_2322003E4()
{
  return MEMORY[0x24BEBC0E0]();
}

uint64_t sub_2322003F0()
{
  return MEMORY[0x24BEBC3C0]();
}

uint64_t sub_2322003FC()
{
  return MEMORY[0x24BEBC3C8]();
}

uint64_t sub_232200408()
{
  return MEMORY[0x24BEBC408]();
}

uint64_t sub_232200414()
{
  return MEMORY[0x24BEBC5C0]();
}

uint64_t sub_232200420()
{
  return MEMORY[0x24BEBC5E8]();
}

uint64_t sub_23220042C()
{
  return MEMORY[0x24BEBC5F8]();
}

uint64_t sub_232200438()
{
  return MEMORY[0x24BDB7B68]();
}

uint64_t sub_232200444()
{
  return MEMORY[0x24BDB7BF0]();
}

uint64_t sub_232200450()
{
  return MEMORY[0x24BDB7C00]();
}

uint64_t sub_23220045C()
{
  return MEMORY[0x24BDB7C20]();
}

uint64_t sub_232200468()
{
  return MEMORY[0x24BDB7D50]();
}

uint64_t sub_232200474()
{
  return MEMORY[0x24BDB7D78]();
}

uint64_t sub_232200480()
{
  return MEMORY[0x24BDB7D88]();
}

uint64_t sub_23220048C()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_232200498()
{
  return MEMORY[0x24BDB8120]();
}

uint64_t sub_2322004A4()
{
  return MEMORY[0x24BDB8318]();
}

uint64_t sub_2322004B0()
{
  return MEMORY[0x24BDB8328]();
}

uint64_t sub_2322004BC()
{
  return MEMORY[0x24BE484F8]();
}

uint64_t sub_2322004C8()
{
  return MEMORY[0x24BDB9438]();
}

uint64_t sub_2322004D4()
{
  return MEMORY[0x24BDB9448]();
}

uint64_t sub_2322004E0()
{
  return MEMORY[0x24BDB94B0]();
}

uint64_t sub_2322004EC()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_2322004F8()
{
  return MEMORY[0x24BDB9500]();
}

uint64_t sub_232200504()
{
  return MEMORY[0x24BDB9520]();
}

uint64_t sub_232200510()
{
  return MEMORY[0x24BDB9558]();
}

uint64_t sub_23220051C()
{
  return MEMORY[0x24BDB95E8]();
}

uint64_t sub_232200528()
{
  return MEMORY[0x24BDB9600]();
}

uint64_t sub_232200534()
{
  return MEMORY[0x24BDB9648]();
}

uint64_t sub_232200540()
{
  return MEMORY[0x24BDB96B0]();
}

uint64_t sub_23220054C()
{
  return MEMORY[0x24BDB96C8]();
}

uint64_t sub_232200558()
{
  return MEMORY[0x24BDB96D8]();
}

uint64_t sub_232200564()
{
  return MEMORY[0x24BDB96E8]();
}

uint64_t sub_232200570()
{
  return MEMORY[0x24BDB9700]();
}

uint64_t sub_23220057C()
{
  return MEMORY[0x24BDB9730]();
}

uint64_t sub_232200588()
{
  return MEMORY[0x24BDB9760]();
}

uint64_t sub_232200594()
{
  return MEMORY[0x24BDB9780]();
}

uint64_t sub_2322005A0()
{
  return MEMORY[0x24BDB97D0]();
}

uint64_t sub_2322005AC()
{
  return MEMORY[0x24BDB97E8]();
}

uint64_t sub_2322005B8()
{
  return MEMORY[0x24BDB98B8]();
}

uint64_t sub_2322005C4()
{
  return MEMORY[0x24BDB98E0]();
}

uint64_t sub_2322005D0()
{
  return MEMORY[0x24BDB9960]();
}

uint64_t sub_2322005DC()
{
  return MEMORY[0x24BDB99B8]();
}

uint64_t sub_2322005E8()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_2322005F4()
{
  return MEMORY[0x24BDB99E0]();
}

uint64_t sub_232200600()
{
  return MEMORY[0x24BDB99F8]();
}

uint64_t sub_23220060C()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_232200618()
{
  return MEMORY[0x24BE453E0]();
}

uint64_t sub_232200624()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_232200630()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_23220063C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_232200648()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_232200654()
{
  return MEMORY[0x24BDB9D78]();
}

uint64_t sub_232200660()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_23220066C()
{
  return MEMORY[0x24BDB9D90]();
}

uint64_t sub_232200678()
{
  return MEMORY[0x24BDB9DA0]();
}

uint64_t sub_232200684()
{
  return MEMORY[0x24BDB9DC0]();
}

uint64_t sub_232200690()
{
  return MEMORY[0x24BDB9DD0]();
}

uint64_t sub_23220069C()
{
  return MEMORY[0x24BDB9DD8]();
}

uint64_t sub_2322006A8()
{
  return MEMORY[0x24BDB9DE0]();
}

uint64_t sub_2322006B4()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_2322006C0()
{
  return MEMORY[0x24BDB9E08]();
}

uint64_t sub_2322006CC()
{
  return MEMORY[0x24BDB9E10]();
}

uint64_t sub_2322006D8()
{
  return MEMORY[0x24BDB9E38]();
}

uint64_t sub_2322006E4()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_2322006F0()
{
  return MEMORY[0x24BDB9E78]();
}

uint64_t sub_2322006FC()
{
  return MEMORY[0x24BDB9E80]();
}

uint64_t sub_232200708()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_232200714()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_232200720()
{
  return MEMORY[0x24BE48548]();
}

uint64_t sub_23220072C()
{
  return MEMORY[0x24BE48558]();
}

uint64_t sub_232200738()
{
  return MEMORY[0x24BE48568]();
}

uint64_t sub_232200744()
{
  return MEMORY[0x24BE41D38]();
}

uint64_t sub_232200750()
{
  return MEMORY[0x24BE459A8]();
}

uint64_t sub_23220075C()
{
  return MEMORY[0x24BE459B0]();
}

uint64_t sub_232200768()
{
  return MEMORY[0x24BDB9F18]();
}

uint64_t sub_232200774()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_232200780()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_23220078C()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_232200798()
{
  return MEMORY[0x24BDB9F68]();
}

uint64_t sub_2322007A4()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_2322007B0()
{
  return MEMORY[0x24BDB9F98]();
}

uint64_t sub_2322007BC()
{
  return MEMORY[0x24BDB9FA8]();
}

uint64_t sub_2322007C8()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_2322007D4()
{
  return MEMORY[0x24BDB9FB8]();
}

uint64_t sub_2322007E0()
{
  return MEMORY[0x24BDB9FD0]();
}

uint64_t sub_2322007EC()
{
  return MEMORY[0x24BDB9FD8]();
}

uint64_t sub_2322007F8()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_232200804()
{
  return MEMORY[0x24BDBA048]();
}

uint64_t sub_232200810()
{
  return MEMORY[0x24BDBA058]();
}

uint64_t sub_23220081C()
{
  return MEMORY[0x24BDBA070]();
}

uint64_t sub_232200828()
{
  return MEMORY[0x24BDBA078]();
}

uint64_t sub_232200834()
{
  return MEMORY[0x24BDBA080]();
}

uint64_t sub_232200840()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_23220084C()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_232200858()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_232200864()
{
  return MEMORY[0x24BDBA100]();
}

uint64_t sub_232200870()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23220087C()
{
  return MEMORY[0x24BDBA130]();
}

uint64_t sub_232200888()
{
  return MEMORY[0x24BDBA138]();
}

uint64_t sub_232200894()
{
  return MEMORY[0x24BDEB338]();
}

uint64_t sub_2322008A0()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_2322008AC()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_2322008B8()
{
  return MEMORY[0x24BDEB618]();
}

uint64_t sub_2322008C4()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2322008D0()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_2322008DC()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_2322008E8()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_2322008F4()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_232200900()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_23220090C()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_232200918()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_232200924()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_232200930()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23220093C()
{
  return MEMORY[0x24BDEDA70]();
}

uint64_t sub_232200948()
{
  return MEMORY[0x24BDEDA90]();
}

uint64_t sub_232200954()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_232200960()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23220096C()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_232200978()
{
  return MEMORY[0x24BDEDD50]();
}

uint64_t sub_232200984()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_232200990()
{
  return MEMORY[0x24BDEDE40]();
}

uint64_t sub_23220099C()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_2322009A8()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_2322009B4()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2322009C0()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_2322009CC()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_2322009D8()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_2322009E4()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_2322009F0()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2322009FC()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_232200A08()
{
  return MEMORY[0x24BDEE6C8]();
}

uint64_t sub_232200A14()
{
  return MEMORY[0x24BDEE6D8]();
}

uint64_t sub_232200A20()
{
  return MEMORY[0x24BDEE6F8]();
}

uint64_t sub_232200A2C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_232200A38()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_232200A44()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_232200A50()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_232200A5C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_232200A68()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_232200A74()
{
  return MEMORY[0x24BDEF1F8]();
}

uint64_t sub_232200A80()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_232200A8C()
{
  return MEMORY[0x24BDEF818]();
}

uint64_t sub_232200A98()
{
  return MEMORY[0x24BDEFB28]();
}

uint64_t sub_232200AA4()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_232200AB0()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_232200ABC()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_232200AC8()
{
  return MEMORY[0x24BDF1A18]();
}

uint64_t sub_232200AD4()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_232200AE0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_232200AEC()
{
  return MEMORY[0x24BE453F0]();
}

uint64_t sub_232200AF8()
{
  return MEMORY[0x24BDB8368]();
}

uint64_t sub_232200B04()
{
  return MEMORY[0x24BDB8388]();
}

uint64_t sub_232200B10()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_232200B1C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_232200B28()
{
  return MEMORY[0x24BDF2450]();
}

uint64_t sub_232200B34()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_232200B40()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_232200B4C()
{
  return MEMORY[0x24BDF33C8]();
}

uint64_t sub_232200B58()
{
  return MEMORY[0x24BDF34B8]();
}

uint64_t sub_232200B64()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_232200B70()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_232200B7C()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_232200B88()
{
  return MEMORY[0x24BDF3978]();
}

uint64_t sub_232200B94()
{
  return MEMORY[0x24BE407C0]();
}

uint64_t sub_232200BA0()
{
  return MEMORY[0x24BE407C8]();
}

uint64_t sub_232200BAC()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_232200BB8()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_232200BC4()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_232200BD0()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_232200BDC()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_232200BE8()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_232200BF4()
{
  return MEMORY[0x24BDF4378]();
}

uint64_t sub_232200C00()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_232200C0C()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_232200C18()
{
  return MEMORY[0x24BDF44B0]();
}

uint64_t sub_232200C24()
{
  return MEMORY[0x24BDF4540]();
}

uint64_t sub_232200C30()
{
  return MEMORY[0x24BDF4558]();
}

uint64_t sub_232200C3C()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_232200C48()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_232200C54()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_232200C60()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_232200C6C()
{
  return MEMORY[0x24BDB8488]();
}

uint64_t sub_232200C78()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_232200C84()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_232200C90()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_232200C9C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_232200CA8()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_232200CB4()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_232200CC0()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_232200CCC()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_232200CD8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_232200CE4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_232200CF0()
{
  return MEMORY[0x24BE49E30]();
}

uint64_t sub_232200CFC()
{
  return MEMORY[0x24BE49EC8]();
}

uint64_t sub_232200D08()
{
  return MEMORY[0x24BE49ED0]();
}

uint64_t sub_232200D14()
{
  return MEMORY[0x24BE49ED8]();
}

uint64_t sub_232200D20()
{
  return MEMORY[0x24BE49EE0]();
}

uint64_t sub_232200D2C()
{
  return MEMORY[0x24BDD2030]();
}

uint64_t sub_232200D38()
{
  return MEMORY[0x24BDD2048]();
}

uint64_t sub_232200D44()
{
  return MEMORY[0x24BDD2058]();
}

uint64_t sub_232200D50()
{
  return MEMORY[0x24BDD2080]();
}

uint64_t sub_232200D5C()
{
  return MEMORY[0x24BDD2098]();
}

uint64_t sub_232200D68()
{
  return MEMORY[0x24BDD22D8]();
}

uint64_t sub_232200D74()
{
  return MEMORY[0x24BDD2420]();
}

uint64_t sub_232200D80()
{
  return MEMORY[0x24BDD2440]();
}

uint64_t sub_232200D8C()
{
  return MEMORY[0x24BDD2458]();
}

uint64_t sub_232200D98()
{
  return MEMORY[0x24BDD2460]();
}

uint64_t sub_232200DA4()
{
  return MEMORY[0x24BDD2468]();
}

uint64_t sub_232200DB0()
{
  return MEMORY[0x24BDD2488]();
}

uint64_t sub_232200DBC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_232200DC8()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_232200DD4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_232200DE0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_232200DEC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_232200DF8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_232200E04()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_232200E10()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_232200E1C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_232200E28()
{
  return MEMORY[0x24BE459C0]();
}

uint64_t sub_232200E34()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_232200E40()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_232200E4C()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_232200E58()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_232200E64()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_232200E70()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_232200E7C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_232200E88()
{
  return MEMORY[0x24BDCF990]();
}

uint64_t sub_232200E94()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_232200EA0()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_232200EAC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_232200EB8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_232200EC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_232200ED0()
{
  return MEMORY[0x24BDCFA58]();
}

uint64_t sub_232200EDC()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_232200EE8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_232200EF4()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_232200F00()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_232200F0C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_232200F18()
{
  return MEMORY[0x24BE48570]();
}

uint64_t sub_232200F24()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_232200F30()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_232200F3C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_232200F48()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_232200F54()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_232200F60()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_232200F6C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_232200F78()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_232200F84()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_232200F90()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_232200F9C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_232200FA8()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_232200FB4()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_232200FC0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_232200FCC()
{
  return MEMORY[0x24BDCFB78]();
}

uint64_t sub_232200FD8()
{
  return MEMORY[0x24BE48580]();
}

uint64_t sub_232200FE4()
{
  return MEMORY[0x24BDBA170]();
}

uint64_t sub_232200FF0()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_232200FFC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_232201008()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_232201014()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_232201020()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23220102C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_232201038()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_232201044()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_232201050()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23220105C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_232201068()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_232201074()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_232201080()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23220108C()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_232201098()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_2322010A4()
{
  return MEMORY[0x24BE41D80]();
}

uint64_t sub_2322010B0()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2322010BC()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2322010C8()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2322010D4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2322010E0()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_2322010EC()
{
  return MEMORY[0x24BEE1610]();
}

uint64_t sub_2322010F8()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_232201104()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_232201110()
{
  return MEMORY[0x24BE41D88]();
}

uint64_t sub_23220111C()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_232201128()
{
  return MEMORY[0x24BE45438]();
}

uint64_t sub_232201134()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_232201140()
{
  return MEMORY[0x24BE485A0]();
}

uint64_t sub_23220114C()
{
  return MEMORY[0x24BE41D98]();
}

uint64_t sub_232201158()
{
  return MEMORY[0x24BE45450]();
}

uint64_t sub_232201164()
{
  return MEMORY[0x24BE45458]();
}

uint64_t sub_232201170()
{
  return MEMORY[0x24BE45460]();
}

uint64_t sub_23220117C()
{
  return MEMORY[0x24BE459D0]();
}

uint64_t sub_232201188()
{
  return MEMORY[0x24BE4BCA0]();
}

uint64_t sub_232201194()
{
  return MEMORY[0x24BE4BCA8]();
}

uint64_t sub_2322011A0()
{
  return MEMORY[0x24BE4BCB0]();
}

uint64_t sub_2322011AC()
{
  return MEMORY[0x24BE4BCB8]();
}

uint64_t sub_2322011B8()
{
  return MEMORY[0x24BE4BCC0]();
}

uint64_t sub_2322011C4()
{
  return MEMORY[0x24BE485A8]();
}

uint64_t sub_2322011D0()
{
  return MEMORY[0x24BE459E0]();
}

uint64_t sub_2322011DC()
{
  return MEMORY[0x24BE459F8]();
}

uint64_t sub_2322011E8()
{
  return MEMORY[0x24BE45A00]();
}

uint64_t sub_2322011F4()
{
  return MEMORY[0x24BE45A10]();
}

uint64_t sub_232201200()
{
  return MEMORY[0x24BE45A18]();
}

uint64_t sub_23220120C()
{
  return MEMORY[0x24BE45A28]();
}

uint64_t sub_232201218()
{
  return MEMORY[0x24BE45A58]();
}

uint64_t sub_232201224()
{
  return MEMORY[0x24BE45A78]();
}

uint64_t sub_232201230()
{
  return MEMORY[0x24BE45A98]();
}

uint64_t sub_23220123C()
{
  return MEMORY[0x24BE45AA8]();
}

uint64_t sub_232201248()
{
  return MEMORY[0x24BE45AB8]();
}

uint64_t sub_232201254()
{
  return MEMORY[0x24BE45AC8]();
}

uint64_t sub_232201260()
{
  return MEMORY[0x24BE45AD0]();
}

uint64_t sub_23220126C()
{
  return MEMORY[0x24BE45AD8]();
}

uint64_t sub_232201278()
{
  return MEMORY[0x24BE45AF0]();
}

uint64_t sub_232201284()
{
  return MEMORY[0x24BE4BCC8]();
}

uint64_t sub_232201290()
{
  return MEMORY[0x24BE4BCD0]();
}

uint64_t sub_23220129C()
{
  return MEMORY[0x24BE4BCD8]();
}

uint64_t sub_2322012A8()
{
  return MEMORY[0x24BDD2500]();
}

uint64_t sub_2322012B4()
{
  return MEMORY[0x24BDD2510]();
}

uint64_t sub_2322012C0()
{
  return MEMORY[0x24BDD2518]();
}

uint64_t sub_2322012CC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2322012D8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2322012E4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2322012F0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2322012FC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_232201308()
{
  return MEMORY[0x24BE41DA8]();
}

uint64_t sub_232201314()
{
  return MEMORY[0x24BE41DB0]();
}

uint64_t sub_232201320()
{
  return MEMORY[0x24BE41DC0]();
}

uint64_t sub_23220132C()
{
  return MEMORY[0x24BDD2520]();
}

uint64_t sub_232201338()
{
  return MEMORY[0x24BDD2530]();
}

uint64_t sub_232201344()
{
  return MEMORY[0x24BE485B0]();
}

uint64_t sub_232201350()
{
  return MEMORY[0x24BE485B8]();
}

uint64_t sub_23220135C()
{
  return MEMORY[0x24BDD2538]();
}

uint64_t sub_232201368()
{
  return MEMORY[0x24BDD2548]();
}

uint64_t sub_232201374()
{
  return MEMORY[0x24BDD2550]();
}

uint64_t sub_232201380()
{
  return MEMORY[0x24BDD2558]();
}

uint64_t sub_23220138C()
{
  return MEMORY[0x24BE485D0]();
}

uint64_t sub_232201398()
{
  return MEMORY[0x24BE485D8]();
}

uint64_t sub_2322013A4()
{
  return MEMORY[0x24BE45B28]();
}

uint64_t sub_2322013B0()
{
  return MEMORY[0x24BE45B30]();
}

uint64_t sub_2322013BC()
{
  return MEMORY[0x24BE45B38]();
}

uint64_t sub_2322013C8()
{
  return MEMORY[0x24BDD25A0]();
}

uint64_t sub_2322013D4()
{
  return MEMORY[0x24BDCFF88]();
}

uint64_t sub_2322013E0()
{
  return MEMORY[0x24BE45478]();
}

uint64_t sub_2322013EC()
{
  return MEMORY[0x24BE45498]();
}

uint64_t sub_2322013F8()
{
  return MEMORY[0x24BE454A8]();
}

uint64_t sub_232201404()
{
  return MEMORY[0x24BE454B8]();
}

uint64_t sub_232201410()
{
  return MEMORY[0x24BE49F80]();
}

uint64_t sub_23220141C()
{
  return MEMORY[0x24BE4BCE8]();
}

uint64_t sub_232201428()
{
  return MEMORY[0x24BE4BCF0]();
}

uint64_t sub_232201434()
{
  return MEMORY[0x24BE4BCF8]();
}

uint64_t sub_232201440()
{
  return MEMORY[0x24BE4BD00]();
}

uint64_t sub_23220144C()
{
  return MEMORY[0x24BE4BD08]();
}

uint64_t sub_232201458()
{
  return MEMORY[0x24BE4BD10]();
}

uint64_t sub_232201464()
{
  return MEMORY[0x24BE4BD18]();
}

uint64_t sub_232201470()
{
  return MEMORY[0x24BE454C8]();
}

uint64_t sub_23220147C()
{
  return MEMORY[0x24BE454D0]();
}

uint64_t sub_232201488()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_232201494()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2322014A0()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_2322014AC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2322014B8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2322014C4()
{
  return MEMORY[0x24BE41DE0]();
}

uint64_t sub_2322014D0()
{
  return MEMORY[0x24BE41E30]();
}

uint64_t sub_2322014DC()
{
  return MEMORY[0x24BE4BD20]();
}

uint64_t sub_2322014E8()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_2322014F4()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_232201500()
{
  return MEMORY[0x24BE45530]();
}

uint64_t sub_23220150C()
{
  return MEMORY[0x24BE45538]();
}

uint64_t sub_232201518()
{
  return MEMORY[0x24BE45B70]();
}

uint64_t sub_232201524()
{
  return MEMORY[0x24BE45B78]();
}

uint64_t sub_232201530()
{
  return MEMORY[0x24BE45548]();
}

uint64_t sub_23220153C()
{
  return MEMORY[0x24BE45550]();
}

uint64_t sub_232201548()
{
  return MEMORY[0x24BDD2638]();
}

uint64_t sub_232201554()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_232201560()
{
  return MEMORY[0x24BE4BD28]();
}

uint64_t sub_23220156C()
{
  return MEMORY[0x24BE45568]();
}

uint64_t sub_232201578()
{
  return MEMORY[0x24BE45B88]();
}

uint64_t sub_232201584()
{
  return MEMORY[0x24BE49FA0]();
}

uint64_t sub_232201590()
{
  return MEMORY[0x24BDD2670]();
}

uint64_t sub_23220159C()
{
  return MEMORY[0x24BE45578]();
}

uint64_t sub_2322015A8()
{
  return MEMORY[0x24BE45580]();
}

uint64_t sub_2322015B4()
{
  return MEMORY[0x24BE41E78]();
}

uint64_t sub_2322015C0()
{
  return MEMORY[0x24BE45590]();
}

uint64_t sub_2322015CC()
{
  return MEMORY[0x24BE4BD30]();
}

uint64_t sub_2322015D8()
{
  return MEMORY[0x24BDD26E0]();
}

uint64_t sub_2322015E4()
{
  return MEMORY[0x24BE455B0]();
}

uint64_t sub_2322015F0()
{
  return MEMORY[0x24BE455B8]();
}

uint64_t sub_2322015FC()
{
  return MEMORY[0x24BDD2710]();
}

uint64_t sub_232201608()
{
  return MEMORY[0x24BDD2718]();
}

uint64_t sub_232201614()
{
  return MEMORY[0x24BDD2720]();
}

uint64_t sub_232201620()
{
  return MEMORY[0x24BDD2728]();
}

uint64_t sub_23220162C()
{
  return MEMORY[0x24BDD2740]();
}

uint64_t sub_232201638()
{
  return MEMORY[0x24BDD2748]();
}

uint64_t sub_232201644()
{
  return MEMORY[0x24BE41E88]();
}

uint64_t sub_232201650()
{
  return MEMORY[0x24BDD0158]();
}

uint64_t sub_23220165C()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_232201668()
{
  return MEMORY[0x24BE45610]();
}

uint64_t sub_232201674()
{
  return MEMORY[0x24BE41E90]();
}

uint64_t sub_232201680()
{
  return MEMORY[0x24BE45638]();
}

uint64_t sub_23220168C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_232201698()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2322016A4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2322016B0()
{
  return MEMORY[0x24BE41E98]();
}

uint64_t sub_2322016BC()
{
  return MEMORY[0x24BEE1C28]();
}

uint64_t sub_2322016C8()
{
  return MEMORY[0x24BE48638]();
}

uint64_t sub_2322016D4()
{
  return MEMORY[0x24BE48640]();
}

uint64_t sub_2322016E0()
{
  return MEMORY[0x24BE48648]();
}

uint64_t sub_2322016EC()
{
  return MEMORY[0x24BDBA178]();
}

uint64_t sub_2322016F8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_232201704()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_232201710()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23220171C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_232201728()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_232201734()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_232201740()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23220174C()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_232201758()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_232201764()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_232201770()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23220177C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_232201788()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_232201794()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_2322017A0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2322017AC()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_2322017B8()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_2322017C4()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_2322017D0()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_2322017DC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2322017E8()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2322017F4()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_232201800()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_23220180C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_232201818()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_232201824()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_232201830()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_23220183C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_232201848()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_232201854()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_232201860()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23220186C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_232201878()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_232201884()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_232201890()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23220189C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2322018A8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2322018B4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2322018C0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2322018CC()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_2322018D8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2322018E4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2322018F0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2322018FC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_232201908()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_232201914()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_232201920()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23220192C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_232201938()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_232201944()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_232201950()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_23220195C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_232201968()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_232201974()
{
  return MEMORY[0x24BEE2F50]();
}

uint64_t sub_232201980()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_23220198C()
{
  return MEMORY[0x24BEE3038]();
}

uint64_t sub_232201998()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2322019A4()
{
  return MEMORY[0x24BEE3078]();
}

uint64_t sub_2322019B0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2322019BC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2322019C8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2322019D4()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_2322019E0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2322019EC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2322019F8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_232201A04()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_232201A10()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_232201A1C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_232201A28()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_232201A34()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_232201A40()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_232201A4C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_232201A58()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_232201A64()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_232201A70()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_232201A7C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_232201A88()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_232201A94()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_232201AA0()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_232201AAC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_232201AB8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_232201AC4()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_232201AD0()
{
  return MEMORY[0x24BEE3948]();
}

uint64_t sub_232201ADC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_232201AE8()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_232201AF4()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_232201B00()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_232201B0C()
{
  return MEMORY[0x24BEE3D80]();
}

uint64_t sub_232201B18()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_232201B24()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_232201B30()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_232201B3C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_232201B48()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_232201B54()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_232201B60()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_232201B6C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_232201B78()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_232201B84()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_232201B90()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_232201B9C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_232201BA8()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_232201BB4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_232201BC0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_232201BCC()
{
  return MEMORY[0x24BEE4698]();
}

uint64_t sub_232201BD8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_232201BE4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_232201BF0()
{
  return MEMORY[0x24BEE4A98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t HKAFibBurdenClampedLowerBoundLocalizedString()
{
  return MEMORY[0x24BE49FD8]();
}

uint64_t HKAppleSleepingBreathingDisturbancesMinimumQuantityForClassification()
{
  return MEMORY[0x24BDD2800]();
}

uint64_t HKDecodeDateForValue()
{
  return MEMORY[0x24BE4A008]();
}

uint64_t HKEncodeValueForDate()
{
  return MEMORY[0x24BE4A038]();
}

uint64_t HKEndOfDayForDate()
{
  return MEMORY[0x24BE4A040]();
}

uint64_t HKHRAFibBurdenPreviousWeekDayIndexRange()
{
  return MEMORY[0x24BE4BFC0]();
}

uint64_t HKHealthUIFrameworkBundle()
{
  return MEMORY[0x24BE4A0C0]();
}

uint64_t HKQuantityRangeInclusive()
{
  return MEMORY[0x24BDD3338]();
}

uint64_t HKStringForHKTimeScope()
{
  return MEMORY[0x24BE4A130]();
}

uint64_t HKStringFromProfileType()
{
  return MEMORY[0x24BDD37F0]();
}

uint64_t HKTimePeriodStringWithFonts()
{
  return MEMORY[0x24BE4A158]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x24BE4A1C8]();
}

uint64_t HKUILocalizedString()
{
  return MEMORY[0x24BE4A1E0]();
}

uint64_t HKUILocalizedStringForGAD7Risk()
{
  return MEMORY[0x24BE4A1E8]();
}

uint64_t HKUILocalizedStringForPHQ9Risk()
{
  return MEMORY[0x24BE4A1F0]();
}

uint64_t HKUILocalizedStringForStateOfMind()
{
  return MEMORY[0x24BE4A1F8]();
}

uint64_t HKUILocalizedStringForStateOfMindDomain()
{
  return MEMORY[0x24BE4A200]();
}

uint64_t HKUILocalizedStringForStateOfMindLabel()
{
  return MEMORY[0x24BE4A208]();
}

uint64_t HKVisionLeftRightLongLocalizedString()
{
  return MEMORY[0x24BE4A270]();
}

uint64_t HKVisionPrescriptionImageOnlyLocalizedString()
{
  return MEMORY[0x24BE4A288]();
}

uint64_t HKVisionPrescriptionSupportedImageUTTypeIdentifiers()
{
  return MEMORY[0x24BE4A290]();
}

uint64_t HKVisionPrescriptionTypeDetailedLongLocalizedString()
{
  return MEMORY[0x24BE4A298]();
}

uint64_t HKVisionPrescriptionTypeLongLocalizedString()
{
  return MEMORY[0x24BE4A2A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _HKAllObjectTypes()
{
  return MEMORY[0x24BDD4280]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x24BEE4D50]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x24BEE4D58]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
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

