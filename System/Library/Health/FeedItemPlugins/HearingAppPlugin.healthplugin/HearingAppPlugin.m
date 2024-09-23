void sub_231287E54(void *a1)
{
  void *v1;
  NSObject *v3;
  char *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  os_log_t osloga;
  NSObject *oslog;
  void *v11;

  if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
  {
    v3 = objc_msgSend(a1, sel_resolvedHealthStore);
    if (v3)
    {
      osloga = v3;
      sub_231288034((uint64_t)v3, a1);

    }
    else
    {
      v4 = v1;
      oslog = sub_2312BBBAC();
      v5 = sub_2312BBEB8();
      if (os_log_type_enabled(oslog, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        v7 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v6 = 138412290;
        v11 = *(void **)&v4[OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_dataType];
        v8 = v11;
        sub_2312BBF9C();
        *v7 = v11;

        _os_log_impl(&dword_231285000, oslog, v5, "Unable to present debug menu for %@ without a resolvedHealthStore", v6, 0xCu);
        sub_23128AC18(0, (unint64_t *)&qword_254158F20, (uint64_t)&qword_254158F18, 0x24BEDCDF0, (void (*)(uint64_t, uint64_t, uint64_t))sub_23128AC6C);
        swift_arrayDestroy();
        MEMORY[0x2348D9AB4](v7, -1, -1);
        MEMORY[0x2348D9AB4](v6, -1, -1);

      }
      else
      {

      }
    }
  }
}

void sub_231288034(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_2312BBD2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (_QWORD *)((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
  *v9 = sub_2312BBF00();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5610], v6);
  v10 = sub_2312BBD38();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
    {
      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE45698]), sel_initWithHealthStore_, a1);
      v12 = (_QWORD *)swift_allocObject();
      v12[2] = v3;
      v12[3] = v11;
      v12[4] = a2;
      aBlock[4] = sub_23128A9E8;
      aBlock[5] = v12;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_231288B24;
      aBlock[3] = &unk_250016938;
      v13 = _Block_copy(aBlock);
      v14 = v3;
      v15 = v11;
      v16 = a2;
      swift_release();
      objc_msgSend(v15, sel_fetchDoseLimitInfoWithCompletion_, v13);
      _Block_release(v13);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_2312881EC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  void *v33;
  _QWORD *v34;

  swift_bridgeObjectRetain();
  v8 = (void *)sub_2312BBD68();
  v9 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v8, v9, 1);

  v11 = (void *)sub_2312BBD68();
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_actionWithTitle_style_handler_, v11, 1, 0);

  objc_msgSend(v10, sel_addAction_, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a3;
  v15 = a4;
  v16 = a5;
  v17 = a3;
  v18 = (void *)sub_2312BBD68();
  v33 = sub_23128AA98;
  v34 = v14;
  v19 = MEMORY[0x24BDAC760];
  v29 = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_231288F40;
  v32 = &unk_2500169D8;
  v20 = _Block_copy(&v29);
  swift_release();
  v21 = objc_msgSend(v12, (SEL)&selRef_frame + 4, v18, 2, v20);
  _Block_release(v20);

  objc_msgSend(v10, sel_addAction_, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v15;
  v22[3] = v16;
  v22[4] = v17;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v26 = (void *)sub_2312BBD68();
  v33 = sub_23128AADC;
  v34 = v22;
  v29 = v19;
  v30 = 1107296256;
  v31 = sub_231288F40;
  v32 = &unk_250016A28;
  v27 = _Block_copy(&v29);
  swift_release();
  v28 = objc_msgSend(v12, sel_actionWithTitle_style_handler_, v26, 0, v27);
  _Block_release(v27);

  objc_msgSend(v10, sel_addAction_, v28);
  objc_msgSend(v25, sel_presentViewController_animated_completion_, v10, 1, 0);

}

void sub_2312884F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD aBlock[6];

  v7 = sub_2312BBBC4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)a2 + OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_logger, v7);
    v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v12 = (v9 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = 0;
    *(_QWORD *)(v13 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v11, v10, v7);
    *(_QWORD *)(v13 + v12) = a2;
    *(_QWORD *)(v13 + ((v12 + 15) & 0xFFFFFFFFFFFFFFF8)) = a4;
    aBlock[4] = sub_23128A840;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_231289BB4;
    aBlock[3] = &unk_250016A78;
    v14 = _Block_copy(aBlock);
    v15 = a2;
    v16 = a4;
    swift_release();
    objc_msgSend(a3, sel_overrideDoseLimit_completion_, 0, v14);
    _Block_release(v14);
  }
}

void sub_231288680(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t aBlock[6];
  uint64_t v53;

  v50 = a6;
  v51 = a4;
  v49 = a1;
  v9 = sub_2312BBD08();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2312BBD20();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128A9F4();
  v17 = swift_allocError();
  v18 = (void *)v17;
  if (a3)
  {
    v19 = a3;

    v18 = a3;
  }
  else
  {
    v43 = v16;
    v44 = v12;
    v45 = v9;
    v46 = v14;
    v30 = v50;
    v47 = v13;
    v48 = v10;
    if (a2)
    {
      v31 = a2;
      swift_bridgeObjectRetain();

      sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
      v32 = v49;
      swift_bridgeObjectRetain();
      v33 = (void *)sub_2312BBF00();
      v34 = (_QWORD *)swift_allocObject();
      v35 = v51;
      v34[2] = v51;
      v34[3] = a5;
      v34[4] = v32;
      v34[5] = v31;
      v34[6] = v30;
      aBlock[4] = (uint64_t)sub_23128AA84;
      aBlock[5] = (uint64_t)v34;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2312A05E4;
      aBlock[3] = (uint64_t)&unk_250016988;
      v36 = _Block_copy(aBlock);
      v37 = v35;
      v38 = a5;
      v39 = v30;
      swift_release();
      v40 = v43;
      sub_2312BBD14();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_23128A728(&qword_255EC2FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      sub_23128A924();
      sub_23128A728(&qword_255EC3008, (uint64_t (*)(uint64_t))sub_23128A924, MEMORY[0x24BEE12C8]);
      v42 = v44;
      v41 = v45;
      sub_2312BBFCC();
      MEMORY[0x2348D92EC](0, v40, v42, v36);
      _Block_release(v36);

      sub_23128AA38(v32, v31, 0);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v42, v41);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v40, v47);
      return;
    }
    a3 = (void *)v17;
  }
  aBlock[0] = (uint64_t)v18;
  v20 = v18;
  sub_23128A7F0(0, &qword_255EC2FF0);
  swift_willThrowTypedImpl();
  v21 = v18;
  v22 = v18;
  v23 = sub_2312BBBAC();
  v24 = sub_2312BBED0();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    aBlock[0] = v26;
    *(_DWORD *)v25 = 136315138;
    v53 = (uint64_t)v18;
    v27 = v18;
    v28 = sub_2312BBDB0();
    v53 = sub_2312AE104(v28, v29, aBlock);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    sub_23128AA38(a3, 0, 1);
    sub_23128AA38(a3, 0, 1);
    _os_log_impl(&dword_231285000, v23, v24, "Unable to fetch doseLimitOverride: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v26, -1, -1);
    MEMORY[0x2348D9AB4](v25, -1, -1);
    sub_23128AA38(a3, 0, 1);
    sub_23128AA38(a3, 0, 1);

  }
  else
  {
    sub_23128AA38(a3, 0, 1);
    sub_23128AA38(a3, 0, 1);

    sub_23128AA38(a3, 0, 1);
    sub_23128AA38(a3, 0, 1);
  }
}

uint64_t sub_231288B24(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v5 = sub_2312BBD98();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_231288BA4(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t aBlock;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  void *v31;
  _QWORD *v32;

  v3 = v2;
  v6 = sub_2312BBD2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
  *v9 = sub_2312BBF00();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5610], v6);
  v10 = sub_2312BBD38();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
    {
      v11 = (void *)sub_2312BBD68();
      v12 = (void *)sub_2312BBD68();
      v13 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v11, v12, 1);

      v31 = sub_231288EF0;
      v32 = 0;
      v14 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v28 = 1107296256;
      v29 = sub_231288F40;
      v30 = &unk_250016870;
      v15 = _Block_copy(&aBlock);
      objc_msgSend(v13, sel_addTextFieldWithConfigurationHandler_, v15);
      _Block_release(v15);
      v16 = (void *)sub_2312BBD68();
      v17 = (void *)objc_opt_self();
      v18 = objc_msgSend(v17, sel_actionWithTitle_style_handler_, v16, 1, 0);

      objc_msgSend(v13, sel_addAction_, v18);
      v19 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = v19;
      v20[3] = v3;
      v20[4] = a1;
      v20[5] = a2;
      swift_retain();
      v21 = v3;
      v22 = a1;
      v23 = a2;
      v24 = (void *)sub_2312BBD68();
      v31 = sub_23128A9D8;
      v32 = v20;
      aBlock = v14;
      v28 = 1107296256;
      v29 = sub_231288F40;
      v30 = &unk_2500168E8;
      v25 = _Block_copy(&aBlock);
      swift_release();
      v26 = objc_msgSend(v17, sel_actionWithTitle_style_handler_, v24, 0, v25);
      _Block_release(v25);
      swift_release();

      objc_msgSend(v13, sel_addAction_, v26);
      objc_msgSend(v23, sel_presentViewController_animated_completion_, v13, 1, 0);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_231288EF0(void *a1)
{
  id v2;

  v2 = (id)sub_2312BBD68();
  objc_msgSend(a1, sel_setPlaceholder_, v2);

}

void sub_231288F40(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_231288F90(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a2 + 16;
  swift_beginAccess();
  v8 = (void *)MEMORY[0x2348D9B2C](v7);
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
    goto LABEL_15;
  }
  v10 = objc_msgSend(v8, sel_textFields);

  if (!v10)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  sub_23128AC6C(0, &qword_255EC3010);
  v11 = sub_2312BBE10();

  if (!(v11 >> 62))
  {
    v10 = *(id *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_5;
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v10 = (id)sub_2312BC08C();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_13;
LABEL_5:
  if ((v11 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x2348D9418](0, v11);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v12 = *(id *)(v11 + 32);
LABEL_8:
    v13 = v12;
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v13, sel_text);

    if (v14)
    {
      v10 = (id)sub_2312BBD98();
      v9 = v15;

LABEL_15:
      sub_231289134((uint64_t)v10, (uint64_t)v9, a4, a5);
      swift_bridgeObjectRelease();
      return;
    }
    v10 = 0;
    goto LABEL_14;
  }
  __break(1u);
}

id sub_231289134(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id result;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  void *v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t *v31;
  unsigned __int8 *v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  char *v36;
  uint64_t (*v37)(char *, char *, uint64_t);
  char *v38;
  id v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t aBlock;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, void *);
  void *v46;
  uint64_t (*v47)();
  uint64_t v48;

  v5 = v4;
  v10 = sub_2312BBBC4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v34 - v14;
  result = objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall);
  if ((_DWORD)result)
  {
    v37 = *(uint64_t (**)(char *, char *, uint64_t))(v11 + 16);
    v38 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = v37(v15, &v4[OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_logger], v10);
    v39 = a3;
    v40 = a1;
    if (!a2)
      goto LABEL_15;
    v35 = &v34;
    v42 = 0;
    MEMORY[0x24BDAC7A8](v17);
    *(&v34 - 2) = (uint64_t)&v42;
    if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
    {
      swift_bridgeObjectRetain();
      sub_2312BC014();
      swift_bridgeObjectRelease();
      if ((v41 & 1) != 0)
        goto LABEL_10;
      goto LABEL_15;
    }
    v34 = (uint64_t)&v34;
    if ((a2 & 0x2000000000000000) != 0)
    {
      aBlock = a1;
      v44 = a2 & 0xFFFFFFFFFFFFFFLL;
      if (a1 <= 0x20u && ((1 << a1) & 0x100003E01) != 0)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        swift_bridgeObjectRetain();
        v32 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
        if (v32)
        {
          v33 = *v32;
          swift_bridgeObjectRelease();
          if (!v33)
            goto LABEL_10;
          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    v18 = a1;
    v19 = v15;
    if ((v18 & 0x1000000000000000) != 0)
    {
      v20 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      swift_bridgeObjectRetain();
    }
    else
    {
      v20 = sub_2312BC050();
      swift_bridgeObjectRetain();
      if (!v20)
      {
        v21 = 0;
LABEL_9:
        sub_23128A85C(v21, (BOOL *)&aBlock);
        v22 = aBlock;
        swift_bridgeObjectRelease();
        v15 = v19;
        if ((v22 & 1) != 0)
        {
LABEL_10:
          v23 = a4;
          v35 = (uint64_t *)sub_2312BBE70();
LABEL_16:
          v36 = v15;
          v24 = v38;
          v37(v38, v15, v10);
          v25 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
          v26 = (v12 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
          v27 = swift_allocObject();
          *(_QWORD *)(v27 + 16) = v40;
          *(_QWORD *)(v27 + 24) = a2;
          (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v27 + v25, v24, v10);
          *(_QWORD *)(v27 + v26) = v5;
          *(_QWORD *)(v27 + ((v26 + 15) & 0xFFFFFFFFFFFFFFF8)) = v23;
          v47 = sub_23128A840;
          v48 = v27;
          aBlock = MEMORY[0x24BDAC760];
          v44 = 1107296256;
          v45 = sub_231289BB4;
          v46 = &unk_2500167F8;
          v28 = _Block_copy(&aBlock);
          swift_bridgeObjectRetain();
          v29 = v5;
          v30 = v23;
          swift_release();
          v31 = v35;
          objc_msgSend(v39, sel_overrideDoseLimit_completion_, v35, v28);
          _Block_release(v28);

          return (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v36, v10);
        }
LABEL_15:
        v23 = a4;
        v35 = 0;
        goto LABEL_16;
      }
    }
    v21 = (_BYTE *)v20;
    goto LABEL_9;
  }
  return result;
}

void sub_2312894FC(char a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  char *v48;
  uint8_t *v49;
  uint64_t v50;
  char *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t aBlock[6];

  v12 = sub_2312BBD08();
  v13 = *(NSObject **)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2312BBD20();
  v17 = MEMORY[0x24BDAC7A8](v16);
  if (a4)
    v20 = 0xE800000000000000;
  else
    v20 = 0xE500000000000000;
  if ((a1 & 1) == 0)
  {
    v50 = v12;
    v51 = v15;
    v52 = a7;
    v53 = v19;
    if (a4)
      v25 = 0x656469727265766FLL;
    else
      v25 = 0x7465736572;
    v54 = v17;
    v55 = v13;
    v26 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      v27 = a2;
      v28 = a2;
      swift_bridgeObjectRetain();
      v29 = a2;
      v30 = sub_2312BBBAC();
      v31 = sub_2312BBED0();
      if (!os_log_type_enabled(v30, v31))
      {

        swift_bridgeObjectRelease_n();
LABEL_22:
        sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
        v40 = (void *)sub_2312BBF00();
        v41 = (_QWORD *)swift_allocObject();
        v41[2] = a6;
        v41[3] = a2;
        v42 = v52;
        v41[4] = v52;
        aBlock[4] = (uint64_t)sub_23128A8FC;
        aBlock[5] = (uint64_t)v41;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_2312A05E4;
        aBlock[3] = (uint64_t)&unk_250016848;
        v43 = _Block_copy(aBlock);
        v44 = a2;
        v45 = a6;
        v46 = v42;
        swift_release();
        sub_2312BBD14();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_23128A728(&qword_255EC2FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        sub_23128A924();
        sub_23128A728(&qword_255EC3008, (uint64_t (*)(uint64_t))sub_23128A924, MEMORY[0x24BEE12C8]);
        v47 = v50;
        v48 = v51;
        sub_2312BBFCC();
        MEMORY[0x2348D92EC](0, v26, v48, v43);
        _Block_release(v43);

        ((void (*)(char *, uint64_t))v55[1].isa)(v48, v47);
        (*(void (**)(char *, uint64_t))(v53 + 8))(v26, v54);
        return;
      }
      v32 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      aBlock[0] = v33;
      *(_DWORD *)v32 = 136446466;
      swift_bridgeObjectRetain();
      v56 = sub_2312AE104(v25, v20, aBlock);
      sub_2312BBF9C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v32 + 12) = 2080;
      v56 = (uint64_t)a2;
      v34 = a2;
      sub_23128A7F0(0, &qword_255EC2FF0);
      v35 = sub_2312BBDB0();
      v56 = sub_2312AE104(v35, v36, aBlock);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_231285000, v30, v31, "Failed to %{public}s doseLimit with error: %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v33, -1, -1);
      MEMORY[0x2348D9AB4](v32, -1, -1);

    }
    else
    {
      swift_bridgeObjectRetain();
      v30 = sub_2312BBBAC();
      v37 = sub_2312BBED0();
      if (os_log_type_enabled(v30, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        v39 = swift_slowAlloc();
        aBlock[0] = v39;
        *(_DWORD *)v38 = 136446210;
        v49 = v38 + 4;
        swift_bridgeObjectRetain();
        v56 = sub_2312AE104(v25, v20, aBlock);
        sub_2312BBF9C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_231285000, v30, v37, "Failed to  %{public}s doseLimit with unknown error.", v38, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348D9AB4](v39, -1, -1);
        MEMORY[0x2348D9AB4](v38, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }

    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  v55 = sub_2312BBBAC();
  v21 = sub_2312BBED0();
  if (os_log_type_enabled(v55, v21))
  {
    if (a4)
      v22 = 0x65646F727265766FLL;
    else
      v22 = 0x7465736572;
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    aBlock[0] = v24;
    *(_DWORD *)v23 = 136446210;
    swift_bridgeObjectRetain();
    v56 = sub_2312AE104(v22, v20, aBlock);
    sub_2312BBF9C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_231285000, v55, v21, "Successfully %{public}s doseLimit.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v24, -1, -1);
    MEMORY[0x2348D9AB4](v23, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
}

void sub_231289BB4(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_231289C14(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;

  swift_getObjectType();
  v4 = sub_2312BBD2C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
  *v7 = sub_2312BBF00();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5610], v4);
  v8 = sub_2312BBD38();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    v9 = a1;
    v10 = a1;
    v11 = sub_2312BBBAC();
    v12 = sub_2312BBED0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v27 = v14;
      *(_DWORD *)v13 = 136446466;
      v15 = sub_2312BC1E8();
      v26 = sub_2312AE104(v15, v16, &v27);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      if (a1)
      {
        v26 = (uint64_t)a1;
        v17 = a1;
        sub_23128A7F0(0, &qword_255EC2FF0);
        v18 = sub_2312BBDB0();
        v20 = v19;
      }
      else
      {
        v20 = 0xE300000000000000;
        v18 = 7104878;
      }
      v26 = sub_2312AE104(v18, v20, &v27);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_231285000, v11, v12, "[%{public}s] presenting alert for error: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v14, -1, -1);
      MEMORY[0x2348D9AB4](v13, -1, -1);

    }
    else
    {

    }
    if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
    {
      if (a1)
      {
        swift_getErrorValue();
        sub_2312BC14C();
      }
      v21 = (void *)sub_2312BBD68();
      v22 = (void *)sub_2312BBD68();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v21, v22, 1);

      v24 = (void *)sub_2312BBD68();
      v25 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v24, 1, 0);

      objc_msgSend(v23, sel_addAction_, v25);
      objc_msgSend(a2, sel_presentViewController_animated_completion_, v23, 1, 0);

    }
  }
  else
  {
    __break(1u);
  }
}

id sub_23128A01C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23128A0A0()
{
  _OWORD v1[2];
  uint64_t v2;

  sub_2312BB93C();
  sub_2312BB930();
  sub_2312BB960();
  memset(v1, 0, sizeof(v1));
  v2 = 0;
  sub_2312BBAB0();
  swift_bridgeObjectRelease();
  return sub_23128A794((uint64_t)v1);
}

id sub_23128A13C()
{
  _QWORD *v0;

  return objc_retain(*(id *)(*v0
                           + OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_dataType));
}

void sub_23128A150(void *a1)
{
  sub_231287E54(a1);
}

uint64_t variable initialization expression of OnboardingTileActionHandler.logger@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255EC2F50 != -1)
    swift_once();
  v2 = sub_2312BBBC4();
  v3 = sub_23128A1E0(v2, (uint64_t)qword_255EC4110);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23128A1E0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t variable initialization expression of SoundLevelView.headerStackView()
{
  return 0;
}

uint64_t variable initialization expression of HorizontalMeterView.foregroundViewOffset()
{
  return 0;
}

uint64_t variable initialization expression of HorizontalMeterView.foregroundViewWidth()
{
  return 0;
}

uint64_t sub_23128A210()
{
  return type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider();
}

uint64_t type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider()
{
  uint64_t result;

  result = qword_255EC2F98;
  if (!qword_255EC2F98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23128A254()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BBBC4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for Key()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255EC2FA8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255EC2FA8);
  }
}

uint64_t sub_23128A320(uint64_t a1, uint64_t a2)
{
  return sub_23128A3E8(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23128A32C()
{
  sub_2312BBD98();
  sub_2312BBDC8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23128A36C()
{
  uint64_t v0;

  sub_2312BBD98();
  sub_2312BC188();
  sub_2312BBDC8();
  v0 = sub_2312BC1A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23128A3DC(uint64_t a1, uint64_t a2)
{
  return sub_23128A3E8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23128A3E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2312BBD98();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23128A424(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2312BBD80();
  *a2 = 0;
  return result;
}

uint64_t sub_23128A498(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2312BBD8C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23128A514@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2312BBD98();
  v2 = sub_2312BBD68();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23128A558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2312BBD98();
  v2 = v1;
  if (v0 == sub_2312BBD98() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2312BC128();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23128A5E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2312BBD68();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23128A624@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2312BBD98();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23128A64C()
{
  sub_23128A728((unint64_t *)&qword_255EC2FD8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2312BCB18);
  sub_23128A728(&qword_255EC2FE0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2312BC9F4);
  return sub_2312BC0E0();
}

uint64_t sub_23128A6D0()
{
  return sub_23128A728(&qword_255EC2FB0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2312BC9B8);
}

uint64_t sub_23128A6FC()
{
  return sub_23128A728(&qword_255EC2FB8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2312BC98C);
}

uint64_t sub_23128A728(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348D9A30](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23128A768()
{
  return sub_23128A728(&qword_255EC2FC0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2312BCA28);
}

uint64_t sub_23128A794(uint64_t a1)
{
  uint64_t v2;

  sub_23128AC18(0, &qword_255EC2FC8, (uint64_t)&qword_255EC2FD0, MEMORY[0x24BE43678], (void (*)(uint64_t, uint64_t, uint64_t))sub_23128A7F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23128A7F0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23128A844(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23128A854()
{
  return swift_release();
}

_BYTE *sub_23128A85C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_23128A8C8()
{
  id *v0;

  return swift_deallocObject();
}

void sub_23128A8FC()
{
  uint64_t v0;

  sub_231289C14(*(void **)(v0 + 24), *(void **)(v0 + 32));
}

void sub_23128A924()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3000)
  {
    sub_2312BBD08();
    v0 = sub_2312BBE58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3000);
  }
}

uint64_t sub_23128A978()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23128A99C()
{
  id *v0;

  swift_release();

  return swift_deallocObject();
}

void sub_23128A9D8(uint64_t a1)
{
  uint64_t v1;

  sub_231288F90(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

void sub_23128A9E8(void *a1, uint64_t a2, void *a3)
{
  void **v3;

  sub_231288680(a1, a2, a3, v3[2], v3[3], v3[4]);
}

unint64_t sub_23128A9F4()
{
  unint64_t result;

  result = qword_255EC3018;
  if (!qword_255EC3018)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BE858, &type metadata for ResultError);
    atomic_store(result, (unint64_t *)&qword_255EC3018);
  }
  return result;
}

void sub_23128AA38(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_23128AA48()
{
  id *v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23128AA84()
{
  uint64_t v0;

  sub_2312881EC(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(void **)(v0 + 16), *(void **)(v0 + 24));
}

void sub_23128AA98(uint64_t a1)
{
  void **v1;

  sub_2312884F4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23128AAA8()
{
  id *v0;

  return swift_deallocObject();
}

void sub_23128AADC()
{
  uint64_t v0;

  sub_231288BA4(*(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_23128AB08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2312BBBC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_23128ABA8(char a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(sub_2312BBBC4() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_2312894FC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v2 + v6, *(void **)(v2 + v7), *(void **)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFF8)));
}

void sub_23128AC18(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a5(255, a3, a4);
    v6 = sub_2312BBF90();
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_23128AC6C(uint64_t a1, unint64_t *a2)
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

id sub_23128ACE4()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25415A9E8 = (uint64_t)result;
  return result;
}

uint64_t sub_23128AD38(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  char *v40;
  char *v41;
  char *v42;
  id v43;
  id v44;
  char v45;
  char *v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  _QWORD *v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  id v65;
  char v66;
  ValueMetadata *v67;
  unint64_t v68;
  _OWORD v69[2];
  uint64_t v70;

  v62 = a2;
  v58 = sub_2312BBBC4();
  v57 = *(_QWORD *)(v58 - 8);
  v3 = MEMORY[0x24BDAC7A8](v58);
  v59 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v55 - v5;
  v6 = sub_2312BB954();
  v60 = *(_QWORD *)(v6 - 8);
  v61 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v55 - v10;
  v12 = sub_2312BB960();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v55 - v17;
  v19 = objc_msgSend(a1, sel_identifier);
  v20 = sub_2312BBD98();
  v22 = v21;

  if (v20 == 0xD00000000000002ALL && v22 == 0x80000002312BEB60 || (sub_2312BC128() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider()), sel_init);
    sub_2312BB93C();

    v24 = v62;
    sub_2312BB8B8();
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v11, v24, v61);
    v25 = objc_allocWithZone((Class)sub_2312BB978());
    v26 = a1;
    v27 = sub_2312BB96C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    return v27;
  }
  if (v20 == 0xD000000000000033 && v22 == 0x80000002312BEB90 || (sub_2312BC128() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return sub_231294690(a1, v62);
  }
  if (v20 == 0xD00000000000001DLL && v22 == 0x80000002312BEBD0 || (sub_2312BC128() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v30 = (void *)objc_opt_self();
    v31 = (void *)sub_2312BB948();
    v32 = objc_msgSend(v30, sel_sharedInstanceForHealthStore_, v31);

    v33 = objc_msgSend(v32, sel_createHKUnitPreferenceController);
    sub_2312BB90C();
    v34 = a1;
    sub_2312BB918();
    v67 = &type metadata for AudiogramDataManagementComponent;
    v68 = sub_23128B8AC();
    v65 = v34;
    v66 = 1;
    v35 = v34;
    sub_2312BBAB0();
    swift_bridgeObjectRelease();

    sub_23128B8F0((uint64_t)&v65, &qword_255EC2FC8, (unint64_t *)&qword_255EC2FD0);
    v36 = v62;
    sub_2312BB8B8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    v38 = v60;
    v37 = v61;
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
    v39(v11, v36, v61);
    v40 = (char *)objc_allocWithZone((Class)type metadata accessor for AudiogramDataTypeDetailViewController());
    v41 = &v40[qword_255EC33F0];
    *(_QWORD *)v41 = 0;
    *((_QWORD *)v41 + 1) = 0;
    v42 = v40;
    *(_QWORD *)&v42[qword_255EC33E0] = sub_2312BB948();
    *(_QWORD *)&v42[qword_255EC33E8] = v33;
    v43 = v33;

    v39(v9, (uint64_t)v11, v37);
    v44 = objc_msgSend((id)objc_opt_self(), sel_audiogramSampleType);
    v27 = sub_2312BB96C();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v37);

    return v27;
  }
  if (v20 == 0xD000000000000032 && v22 == 0x80000002312BEBF0
    || (sub_2312BC128() & 1) != 0
    || v20 == 0xD00000000000002ELL && v22 == 0x80000002312BEC30)
  {
    swift_bridgeObjectRelease();
    return sub_231293C44(a1, v62);
  }
  v45 = sub_2312BC128();
  swift_bridgeObjectRelease();
  if ((v45 & 1) != 0)
    return sub_231293C44(a1, v62);
  v70 = 0;
  memset(v69, 0, sizeof(v69));
  sub_23128B764((uint64_t)v69, (uint64_t)&v63);
  if (v64)
  {
    sub_23128B850(&v63, (uint64_t)&v65);
    sub_23128B868(&v65, (uint64_t)v67);
    sub_2312BBA8C();
    v53 = v62;
    sub_2312BB8B8();
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v11, v53, v61);
    objc_allocWithZone((Class)sub_2312BB978());
    v54 = a1;
    v27 = sub_2312BB96C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    sub_23128B8F0((uint64_t)v69, &qword_255EC3080, &qword_255EC3088);
    sub_23128B88C((uint64_t)&v65);
  }
  else
  {
    sub_23128B8F0((uint64_t)&v63, &qword_255EC3080, &qword_255EC3088);
    v46 = v56;
    sub_2312BBB94();
    v47 = a1;
    v48 = sub_2312BBBAC();
    v49 = sub_2312BBEB8();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      v51 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v50 = 138412290;
      v65 = v47;
      v52 = v47;
      sub_2312BBF9C();
      *v51 = v47;

      _os_log_impl(&dword_231285000, v48, v49, "[HearingAppPluginAppDelegate] No custom detail view controller or configuration provided for %@", v50, 0xCu);
      sub_23128B7C0();
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v51, -1, -1);
      MEMORY[0x2348D9AB4](v50, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v57 + 8))(v46, v58);
    sub_23128B8F0((uint64_t)v69, &qword_255EC3080, &qword_255EC3088);
    return 0;
  }
  return v27;
}

uint64_t sub_23128B744(void *a1, uint64_t a2)
{
  return sub_23128AD38(a1, a2);
}

uint64_t sub_23128B764(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128B92C(0, &qword_255EC3080, &qword_255EC3088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23128B7C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254158F20)
  {
    sub_23128B814();
    v0 = sub_2312BBF90();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254158F20);
  }
}

unint64_t sub_23128B814()
{
  unint64_t result;

  result = qword_254158F18;
  if (!qword_254158F18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254158F18);
  }
  return result;
}

uint64_t sub_23128B850(__int128 *a1, uint64_t a2)
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

_QWORD *sub_23128B868(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23128B88C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_23128B8AC()
{
  unint64_t result;

  result = qword_255EC3090;
  if (!qword_255EC3090)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BD9B4, &type metadata for AudiogramDataManagementComponent);
    atomic_store(result, (unint64_t *)&qword_255EC3090);
  }
  return result;
}

uint64_t sub_23128B8F0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_23128B92C(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_23128B92C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_23128A7F0(255, a3);
    v4 = sub_2312BBF90();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23128B980()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AudiogramDataTypeDetailConfigurationProvider()
{
  return objc_opt_self();
}

uint64_t sub_23128B9B0(void *a1)
{
  id v2;
  id v3;
  id v5;
  char v6;
  ValueMetadata *v7;
  unint64_t v8;

  sub_2312BB90C();
  v2 = a1;
  sub_2312BB918();
  v7 = &type metadata for AudiogramDataManagementComponent;
  v8 = sub_23128B8AC();
  v5 = v2;
  v6 = 1;
  sub_2312BB960();
  v3 = v2;
  sub_2312BBAB0();
  swift_bridgeObjectRelease();

  return sub_23128A794((uint64_t)&v5);
}

unint64_t sub_23128BA78()
{
  unint64_t result;

  result = qword_255EC2FD0;
  if (!qword_255EC2FD0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC2FD0);
  }
  return result;
}

uint64_t sub_23128BACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  void (*v21)(char *, uint64_t, uint64_t);
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t inited;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[3];
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v44 = a4;
  v7 = sub_2312BB6C0();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_2312BB3F0();
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v40 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128D554(0, &qword_254158F40, (uint64_t (*)(uint64_t))MEMORY[0x24BE418F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v38 - v11;
  v13 = type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_2312BB6FC();
  v16 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v18 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a1;
  v38[1] = sub_23128D3DC();
  v38[2] = v19;
  sub_23128BF6C(a2, a3, (uint64_t)v18);
  v20 = sub_2312BB600();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  v45 = a2;
  v21(v15, a2, v20);
  sub_2312BB318();
  swift_allocObject();
  sub_2312BB30C();
  sub_23128A728(&qword_2541591D0, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData, (uint64_t)&unk_2312BE668);
  v38[0] = sub_2312BB300();
  v23 = v22;
  sub_23128D478((uint64_t)v15);
  swift_release();
  sub_2312BBA38();
  type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandler(0);
  v39 = v16;
  v24 = v49;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v12, v18, v49);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v24);
  v25 = v40;
  v26 = v41;
  v27 = v43;
  (*(void (**)(char *, _QWORD, uint64_t))(v41 + 104))(v40, *MEMORY[0x24BE47420], v43);
  v28 = (void *)sub_2312BB4F8();
  sub_23128A728(&qword_254159138, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandler, (uint64_t)&unk_2312BE5B4);
  v29 = v38[0];
  sub_2312BB444();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
  sub_23128D4B4((uint64_t)v12, (uint64_t)&qword_254158F40, (uint64_t)MEMORY[0x24BE418F8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23128D554);
  sub_2312BB6F0();
  sub_2312BB468();
  sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BCBF0;
  *(_QWORD *)(inited + 32) = sub_2312BB6CC();
  *(_QWORD *)(inited + 40) = v31;
  sub_2312998AC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  sub_2312BB480();
  v33 = v46;
  v32 = v47;
  v34 = v48;
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v46, *MEMORY[0x24BE41670], v48);
  sub_2312BB6B4();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  sub_2312BB48C();
  v35 = sub_2312BB45C();
  v36 = sub_231297C1C(v35);
  sub_231297D78(v36);
  swift_bridgeObjectRelease();
  sub_2312BB474();
  sub_23128D4FC(v29, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v18, v49);
}

uint64_t sub_23128BF6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t (*v4)(uint64_t, uint64_t);
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
  char *v20;
  void *v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  char *v37;
  uint64_t v38;
  char *v39;
  _QWORD v40[6];
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v45 = a3;
  v46 = a2;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23128D554(0, &qword_254158F38, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)v40 - v6;
  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], v4);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v43 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v40 - v10;
  v12 = sub_2312BB390();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v42 = (char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2312BB600();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v41 = (char *)v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v40 - v19;
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_isHeadphoneExposureNotificationsEnabled);
  v23 = objc_msgSend(v21, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch);
  v24 = sub_2312AC16C();
  v46 = sub_23128C3E8(a1, v22, v23, v24 & 1);
  v25 = sub_2312BB690();
  v40[4] = v26;
  v40[5] = v25;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v27(v20, a1, v15);
  if ((*(unsigned int (**)(char *, uint64_t))(v16 + 88))(v20, v15) != *MEMORY[0x24BE41280])
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  v28 = sub_2312BB6A8();
  v30 = v29;
  sub_23128CB44((uint64_t)v11);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v40[2] = v30;
    v40[3] = v28;
    v32 = v42;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v42, v11, v12);
    if (qword_2541597F0 != -1)
      swift_once();
    v33 = (void *)qword_25415A9E8;
    v34 = sub_2312BB354();
    v40[0] = v35;
    v40[1] = v34;
    v27(v41, a1, v15);
    v36 = v33;
    v37 = v44;
    sub_2312BB624();
    v38 = sub_2312BB630();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 0, 1, v38);
    sub_2312BB66C();
    sub_2312BB69C();
    v39 = v43;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v43, v32, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v39, 0, 1, v12);
    sub_2312BB6E4();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v32, v12);
  }
  return result;
}

uint64_t sub_23128C3E8(uint64_t a1, char a2, char a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v8 = sub_2312BBBC4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2312BB600();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (v16 == *MEMORY[0x24BE41298])
  {
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v17 = swift_allocObject();
    v39 = xmmword_2312BCBF0;
    *(_OWORD *)(v17 + 16) = xmmword_2312BCBF0;
    if (qword_2541597F0 != -1)
      swift_once();
    *(_QWORD *)(v17 + 32) = sub_2312BB354();
    *(_QWORD *)(v17 + 40) = v18;
    if ((a2 & 1) != 0)
    {
      if ((a4 & 1) != 0 || (a3 & 1) == 0)
      {
        v31 = sub_2312BB354();
        v33 = v32;
        v19 = swift_allocObject();
        *(_OWORD *)(v19 + 16) = v39;
        *(_QWORD *)(v19 + 32) = v31;
        *(_QWORD *)(v19 + 40) = v33;
      }
      else
      {
        v19 = sub_23128CDDC();
      }
      goto LABEL_19;
    }
    if ((a4 & 1) != 0)
    {
      v19 = sub_23128D0F0();
LABEL_19:
      v41 = v19;
      sub_2312A79E4(v17);
      return v41;
    }
    sub_2312BBBA0();
    v34 = sub_2312BBBAC();
    v35 = sub_2312BBEB8();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v41 = v37;
      *(_DWORD *)v36 = 136446210;
      v40 = sub_2312AE104(0xD000000000000032, 0x80000002312BED80, &v41);
      sub_2312BBF9C();
      _os_log_impl(&dword_231285000, v34, v35, "[[%{public}s] Feature is active but no devices return active.", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v37, -1, -1);
      MEMORY[0x2348D9AB4](v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else if (v16 == *MEMORY[0x24BE412A0])
  {
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2312BCC00;
    if (qword_2541597F0 != -1)
      swift_once();
    *(_QWORD *)(v17 + 32) = sub_2312BB354();
    *(_QWORD *)(v17 + 40) = v20;
    *(_QWORD *)(v17 + 48) = sub_2312BB354();
    *(_QWORD *)(v17 + 56) = v21;
  }
  else if (v16 == *MEMORY[0x24BE41288])
  {
    v22 = sub_2312BB69C();
    v24 = v23;
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    v25 = MEMORY[0x24BEE0D00];
    v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v17 = swift_allocObject();
    v39 = xmmword_2312BCBF0;
    *(_OWORD *)(v17 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, v26);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = v39;
    *(_QWORD *)(v27 + 56) = v25;
    *(_QWORD *)(v27 + 64) = sub_23128D600();
    *(_QWORD *)(v27 + 32) = v22;
    *(_QWORD *)(v27 + 40) = v24;
    v28 = sub_2312BBD74();
    v30 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v17 + 32) = v28;
    *(_QWORD *)(v17 + 40) = v30;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return MEMORY[0x24BEE4AF8];
  }
  return v17;
}

uint64_t sub_23128CA0C()
{
  id v0;
  id v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_getActivePairedDevice);

  if (!v1)
  {
    v4 = 0u;
    v5 = 0u;
LABEL_11:
    sub_23128D4B4((uint64_t)&v4, (uint64_t)&qword_255EC3138, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23128D644);
    return 0;
  }
  if (objc_msgSend(v1, sel_valueForProperty_, *MEMORY[0x24BE6B398]))
  {
    sub_2312BBFC0();
    sub_2312BBA5C();

  }
  else
  {

    memset(v3, 0, sizeof(v3));
  }
  sub_23128D688((uint64_t)v3, (uint64_t)&v4);
  if (!*((_QWORD *)&v5 + 1))
    goto LABEL_11;
  if (swift_dynamicCast())
    return *(_QWORD *)&v3[0];
  else
    return 0;
}

uint64_t sub_23128CB44@<X0>(uint64_t a1@<X8>)
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
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = sub_2312BBBC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - v7;
  sub_2312BB384();
  v9 = sub_2312BB390();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23128D4B4((uint64_t)v8, (uint64_t)&qword_254158F28, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23128D554);
    sub_2312BBBA0();
    v11 = sub_2312BBBAC();
    v12 = sub_2312BBEC4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = a1;
      v15 = v14;
      v22 = v14;
      v19 = v2;
      *(_DWORD *)v13 = 136446210;
      v21 = sub_2312AE104(0xD000000000000032, 0x80000002312BED80, &v22);
      sub_2312BBF9C();
      _os_log_impl(&dword_231285000, v11, v12, "[%{public}s]: Invalid URL.", v13, 0xCu);
      v16 = 1;
      swift_arrayDestroy();
      v17 = v15;
      a1 = v20;
      MEMORY[0x2348D9AB4](v17, -1, -1);
      MEMORY[0x2348D9AB4](v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v19);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v16 = 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v8, v9);
    v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, v16, 1, v9);
}

uint64_t sub_23128CDDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v0 = sub_2312BBBC4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDeviceDisplayName);
  if (v4)
  {
    v5 = v4;
    v6 = sub_2312BBD98();
    v8 = v7;

    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    v9 = MEMORY[0x24BEE0D00];
    v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v11 = swift_allocObject();
    v21 = xmmword_2312BCBF0;
    *(_OWORD *)(v11 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, v10);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = v21;
    *(_QWORD *)(v12 + 56) = v9;
    *(_QWORD *)(v12 + 64) = sub_23128D600();
    *(_QWORD *)(v12 + 32) = v6;
    *(_QWORD *)(v12 + 40) = v8;
    v13 = sub_2312BBD74();
    v15 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v11 + 32) = v13;
    *(_QWORD *)(v11 + 40) = v15;
  }
  else
  {
    sub_2312BBBA0();
    v16 = sub_2312BBBAC();
    v17 = sub_2312BBEB8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v23 = v19;
      *(_DWORD *)v18 = 136446210;
      v22 = sub_2312AE104(0xD000000000000032, 0x80000002312BED80, &v23);
      sub_2312BBF9C();
      _os_log_impl(&dword_231285000, v16, v17, "[[%{public}s] Could not fetch device display name.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v19, -1, -1);
      MEMORY[0x2348D9AB4](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return MEMORY[0x24BEE4AF8];
  }
  return v11;
}

uint64_t sub_23128D0F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v0 = sub_2312BBBC4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23128CA0C();
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    v8 = MEMORY[0x24BEE0D00];
    v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v10 = swift_allocObject();
    v20 = xmmword_2312BCBF0;
    *(_OWORD *)(v10 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, v9);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = v20;
    *(_QWORD *)(v11 + 56) = v8;
    *(_QWORD *)(v11 + 64) = sub_23128D600();
    *(_QWORD *)(v11 + 32) = v6;
    *(_QWORD *)(v11 + 40) = v7;
    v12 = sub_2312BBD74();
    v14 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v10 + 32) = v12;
    *(_QWORD *)(v10 + 40) = v14;
  }
  else
  {
    sub_2312BBBA0();
    v15 = sub_2312BBBAC();
    v16 = sub_2312BBEB8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v22 = v18;
      *(_DWORD *)v17 = 136446210;
      v21 = sub_2312AE104(0xD000000000000032, 0x80000002312BED80, &v22);
      sub_2312BBF9C();
      _os_log_impl(&dword_231285000, v15, v16, "[[%{public}s] Could not fetch watch display name.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v18, -1, -1);
      MEMORY[0x2348D9AB4](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return MEMORY[0x24BEE4AF8];
  }
  return v10;
}

unint64_t sub_23128D3DC()
{
  void *v0;

  sub_2312BC020();
  swift_bridgeObjectRelease();
  v0 = (void *)sub_2312BB4F8();
  sub_2312BB408();

  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  return 0xD000000000000041;
}

uint64_t sub_23128D478(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23128D4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_23128D4FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23128D510(a1, a2);
  return a1;
}

uint64_t sub_23128D510(uint64_t a1, unint64_t a2)
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

void sub_23128D554(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_23128D5AC()
{
  unint64_t result;

  result = qword_254159730;
  if (!qword_254159730)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254159730);
  }
  return result;
}

unint64_t sub_23128D600()
{
  unint64_t result;

  result = qword_254159650;
  if (!qword_254159650)
  {
    result = MEMORY[0x2348D9A30](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254159650);
  }
  return result;
}

void sub_23128D644(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_23128D688(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128D644(0, &qword_255EC3138, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceConfigurationProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DeviceConfigurationProvider(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 24))
    result = sub_23128B88C(result);
  if (*(_QWORD *)(v1 + 64))
    return sub_23128B88C(v1 + 40);
  return result;
}

uint64_t initializeWithCopy for DeviceConfigurationProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = (_OWORD *)(a1 + 40);
  v8 = (_OWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 64);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 56);
    *v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  return a1;
}

uint64_t assignWithCopy for DeviceConfigurationProvider(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      sub_23128D8E0((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    sub_23128B88C(a1);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  v5 = *a2;
  v6 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  v7 = *((_QWORD *)a2 + 8);
  if (!*(_QWORD *)(a1 + 64))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 64) = v7;
      *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
      return a1;
    }
LABEL_14:
    v8 = *(__int128 *)((char *)a2 + 40);
    v9 = *(__int128 *)((char *)a2 + 56);
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = v9;
    return a1;
  }
  if (!v7)
  {
    sub_23128B88C(a1 + 40);
    goto LABEL_14;
  }
  sub_23128D8E0((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
  return a1;
}

uint64_t *sub_23128D8E0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for DeviceConfigurationProvider(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for DeviceConfigurationProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  if (*(_QWORD *)(a1 + 24))
    sub_23128B88C(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
    sub_23128B88C(a1 + 40);
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceConfigurationProvider(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceConfigurationProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceConfigurationProvider()
{
  return &type metadata for DeviceConfigurationProvider;
}

id sub_23128DBAC()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;

  v1 = sub_2312BB3C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(*v0, sel_getActivePairedDevice);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (id)HKNRDeviceCapabilityEnvironmentalDosimetry();
  sub_2312BB3B4();

  v8 = (void *)sub_2312BB3A8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v9 = objc_msgSend(v6, sel_supportsCapability_, v8);

  return v9;
}

id sub_23128DC94()
{
  return sub_23128DCA0((uint64_t)&unk_25415A950);
}

id sub_23128DCA0@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id result;
  _QWORD v5[3];
  ValueMetadata *v6;
  _UNKNOWN **v7;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  if (qword_254159760 != -1)
    swift_once();
  v2 = (void *)qword_25415A948;
  v6 = (ValueMetadata *)sub_23128DF88();
  v7 = &protocol witness table for HUNoiseSettings;
  v5[0] = v2;
  v3 = v2;
  sub_23128B8F0((uint64_t)v10, &qword_254158F58, &qword_254158F50);
  sub_23128DFC4((uint64_t)v5, (uint64_t)v10, &qword_254158F58, &qword_254158F50);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v6 = &type metadata for NanoRegistryCapabilityProvider;
    v7 = &off_250016C68;
    v5[0] = result;
    sub_23128B8F0((uint64_t)v8, &qword_254158F10, &qword_254158F08);
    sub_23128DFC4((uint64_t)v5, (uint64_t)v8, &qword_254158F10, &qword_254158F08);
    sub_23128DFC4((uint64_t)v8, a1, &qword_254158F10, &qword_254158F08);
    return (id)sub_23128DFC4((uint64_t)v10, a1 + 40, &qword_254158F58, &qword_254158F50);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23128DE30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  sub_23128E014(v0, (uint64_t)v4, &qword_254158F10, &qword_254158F08);
  v1 = v5;
  if (v5)
  {
    v2 = v6;
    sub_23128B868(v4, v5);
    LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
    sub_23128B88C((uint64_t)v4);
  }
  else
  {
    sub_23128B8F0((uint64_t)v4, &qword_254158F10, &qword_254158F08);
  }
  return v1 & 1;
}

uint64_t sub_23128DEDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  sub_23128E014(v0 + 40, (uint64_t)v4, &qword_254158F58, &qword_254158F50);
  v1 = v5;
  if (v5)
  {
    v2 = v6;
    sub_23128B868(v4, v5);
    LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
    sub_23128B88C((uint64_t)v4);
  }
  else
  {
    sub_23128B8F0((uint64_t)v4, &qword_254158F58, &qword_254158F50);
  }
  return v1 & 1;
}

unint64_t sub_23128DF88()
{
  unint64_t result;

  result = qword_2541596B8;
  if (!qword_2541596B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2541596B8);
  }
  return result;
}

uint64_t sub_23128DFC4(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v6;

  sub_23128B92C(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_23128E014(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v6;

  sub_23128B92C(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

ValueMetadata *type metadata accessor for NanoRegistryCapabilityProvider()
{
  return &type metadata for NanoRegistryCapabilityProvider;
}

uint64_t sub_23128E074()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  return swift_release();
}

id sub_23128E0D8()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  qword_25415A948 = (uint64_t)result;
  return result;
}

uint64_t sub_23128E110()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  swift_release();
  return v1;
}

id sub_23128E180(int a1)
{
  char *v1;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  objc_class *v21;
  id v22;
  id v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  int v30;
  id v31;
  objc_super v32;
  char v33;

  v30 = a1;
  sub_23128F078();
  v29 = v2;
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v29 - v9;
  sub_23128F05C(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  v17 = &v1[OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability__featureStatus];
  v18 = sub_2312BB600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  sub_23128F0CC((uint64_t)v16, (uint64_t)v14);
  v19 = v1;
  sub_2312BBC78();
  sub_23128F110((uint64_t)v16);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v17, v10, v7);
  v20 = &v19[OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability__promotionVisibility];
  v33 = 0;
  sub_2312BBC78();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v20, v5, v29);
  v19[OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability_promoteIfOnboarded] = v30;

  v21 = (objc_class *)type metadata accessor for NoiseAvailability();
  v32.receiver = v19;
  v32.super_class = v21;
  v22 = objc_msgSendSuper2(&v32, sel_init);
  sub_23128E608((uint64_t)v16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23128F0CC((uint64_t)v16, (uint64_t)v14);
  v23 = v22;
  sub_2312BBC9C();
  sub_23128F110((uint64_t)v16);
  sub_23128E73C();
  v24 = sub_23128F6BC();
  v31 = v23;
  sub_23128F7B4(v24, sub_23128F7AC);
  swift_bridgeObjectRelease();
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v26 = *MEMORY[0x24BE6B458];
  v27 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v25, sel_addObserver_selector_name_object_, v23, sel_pairedDevicesDidUpdate, v26, v27);

  return v23;
}

id sub_23128E48C()
{
  void *v0;
  __CFNotificationCenter *v1;
  objc_super v3;

  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v1, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for NoiseAvailability();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_23128E5C4()
{
  return type metadata accessor for NoiseAvailability();
}

uint64_t type metadata accessor for NoiseAvailability()
{
  uint64_t result;

  result = qword_254159378;
  if (!qword_254159378)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23128E608@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v3;
  void *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0xF8))() & 1) != 0)
  {
    if (((*(uint64_t (**)(void))((*v3 & *v1) + 0x108))() & 1) != 0)
    {
      if (qword_254159760 != -1)
        swift_once();
      v4 = (void *)qword_25415A948;
      if (objc_msgSend((id)qword_25415A948, sel_noiseEnabled)
        && (objc_msgSend(v4, sel_notificationsEnabled) & 1) != 0)
      {
        v5 = (unsigned int *)MEMORY[0x24BE41298];
      }
      else
      {
        v5 = (unsigned int *)MEMORY[0x24BE412A0];
      }
    }
    else
    {
      v5 = (unsigned int *)MEMORY[0x24BE41280];
    }
    v10 = *v5;
    v11 = sub_2312BB600();
    v12 = *(_QWORD *)(v11 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v8 = a1;
    v9 = 0;
    v6 = v11;
  }
  else
  {
    v6 = sub_2312BB600();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a1;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

uint64_t sub_23128E73C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;

  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability_promoteIfOnboarded) & 1) == 0)
  {
    if (qword_254159760 != -1)
      swift_once();
    objc_msgSend((id)qword_25415A948, sel_onboardingCompleted);
  }
  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))() & 1) != 0)
    (*(uint64_t (**)(void))((*v1 & *v0) + 0x108))();
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v0;
  return sub_2312BBC9C();
}

uint64_t sub_23128E838()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[80];

  if (qword_254159768 != -1)
    swift_once();
  sub_23128FA58((uint64_t)&unk_25415A950, (uint64_t)v6);
  sub_23128FA94((uint64_t)v6, (uint64_t)v3);
  v0 = v4;
  if (v4)
  {
    v1 = v5;
    sub_23128B868(v3, v4);
    LOBYTE(v0) = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v1);
    sub_23128B88C((uint64_t)v3);
  }
  else
  {
    sub_23128FAF8((uint64_t)v3);
  }
  sub_23128FB54((uint64_t)v6);
  return v0 & 1;
}

void sub_23128E8F4()
{
  strcpy((char *)&qword_254158EF8, "NoiseEnabled");
  unk_254158F05 = 0;
  unk_254158F06 = -5120;
}

unint64_t sub_23128E920(uint64_t a1)
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
  sub_23128FA08(0, &qword_2541596E0);
  v2 = (_QWORD *)sub_2312BC0BC();
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
    result = sub_23128F384(v5, v6);
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
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_23128EA3C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_23128FB88();
  v2 = (_QWORD *)sub_2312BC0BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    result = sub_23128F3E8((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_23128EB40(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  sub_23128FA08(0, (unint64_t *)&qword_255EC3140);
  v2 = (_QWORD *)sub_2312BC0BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_23128F384(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
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

void sub_23128EC5C(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  __CFNotificationCenter *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __CFString *name;

  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  sub_23128F93C(0, (unint64_t *)&qword_254159728, (unint64_t *)&qword_254159730, MEMORY[0x24BEE45D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2312BCC00;
  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  v10 = sub_23128D600();
  *(_QWORD *)(v8 + 32) = 0xD000000000000010;
  *(_QWORD *)(v8 + 40) = 0x80000002312BEF90;
  *(_QWORD *)(v8 + 96) = v9;
  *(_QWORD *)(v8 + 104) = v10;
  *(_QWORD *)(v8 + 64) = v10;
  *(_QWORD *)(v8 + 72) = a1;
  *(_QWORD *)(v8 + 80) = a2;
  swift_bridgeObjectRetain();
  sub_2312BBDA4();
  name = (__CFString *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  CFNotificationCenterAddObserver(v7, a4, (CFNotificationCallback)sub_23128ED7C, name, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

void sub_23128ED7C(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  sub_23128F05C(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - v13;
  if (a2)
  {
    v15 = a1;
    v16 = a3;
    v17 = a5;
    v18 = a2;
    sub_23128E608((uint64_t)v14);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23128F0CC((uint64_t)v14, (uint64_t)v12);
    v19 = v18;
    sub_2312BBC9C();
    sub_23128F110((uint64_t)v14);
    sub_23128E73C();

  }
}

void sub_23128EFB4()
{
  unint64_t v0;
  unint64_t v1;

  sub_23128D554(319, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_23128F078();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_23128F05C(uint64_t a1)
{
  sub_23128D554(a1, &qword_254159370, (uint64_t (*)(uint64_t))MEMORY[0x24BE412A8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_23128F078()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159648)
  {
    v0 = sub_2312BBCA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159648);
  }
}

uint64_t sub_23128F0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128F05C(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23128F110(uint64_t a1)
{
  uint64_t v2;

  sub_23128F05C(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23128F14C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  return swift_release();
}

uint64_t sub_23128F1B8(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v13;

  sub_23128F05C(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  sub_23128F0CC(a1, (uint64_t)&v13 - v8);
  v10 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23128F0CC((uint64_t)v9, (uint64_t)v7);
  v11 = v10;
  sub_2312BBC9C();
  return sub_23128F110((uint64_t)v9);
}

uint64_t sub_23128F29C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23128F318(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_2312BBC9C();
}

unint64_t sub_23128F384(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2312BC188();
  sub_2312BBDC8();
  v4 = sub_2312BC1A0();
  return sub_23128F468(a1, a2, v4);
}

unint64_t sub_23128F3E8(uint64_t a1)
{
  uint64_t v2;

  sub_2312BBD98();
  sub_2312BC188();
  sub_2312BBDC8();
  v2 = sub_2312BC1A0();
  swift_bridgeObjectRelease();
  return sub_23128F548(a1, v2);
}

unint64_t sub_23128F468(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2312BC128() & 1) == 0)
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
      while (!v14 && (sub_2312BC128() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23128F548(uint64_t a1, uint64_t a2)
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
    v6 = sub_2312BBD98();
    v8 = v7;
    if (v6 == sub_2312BBD98() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2312BC128();
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
          v13 = sub_2312BBD98();
          v15 = v14;
          if (v13 == sub_2312BBD98() && v15 == v16)
            break;
          v18 = sub_2312BC128();
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

unint64_t sub_23128F6BC()
{
  uint64_t inited;
  uint64_t v1;

  sub_23128D554(0, &qword_254159720, (uint64_t (*)(uint64_t))sub_23128F99C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BCCC0;
  *(_QWORD *)(inited + 32) = 0xD000000000000013;
  *(_QWORD *)(inited + 40) = 0x80000002312BEFB0;
  *(_QWORD *)(inited + 48) = sel_onboardingCompleted;
  if (qword_254158EC8 != -1)
    swift_once();
  v1 = unk_254158F00;
  *(_QWORD *)(inited + 56) = qword_254158EF8;
  *(_QWORD *)(inited + 64) = v1;
  *(_QWORD *)(inited + 72) = sel_noiseEnabled;
  *(_QWORD *)(inited + 80) = 0xD000000000000014;
  *(_QWORD *)(inited + 88) = 0x80000002312BEFD0;
  *(_QWORD *)(inited + 96) = sel_notificationsEnabled;
  swift_bridgeObjectRetain();
  return sub_23128E920(inited);
}

void sub_23128F7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23128EC5C(a1, a2, a3, *(const void **)(v3 + 16));
}

uint64_t sub_23128F7B4(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      v10 = v17 + 1;
      if (v17 + 1 >= v8)
        return swift_release();
      v18 = *(_QWORD *)(v4 + 8 * v10);
      if (!v18)
      {
        v10 = v17 + 2;
        if (v17 + 2 >= v8)
          return swift_release();
        v18 = *(_QWORD *)(v4 + 8 * v10);
        if (!v18)
        {
          v10 = v17 + 3;
          if (v17 + 3 >= v8)
            return swift_release();
          v18 = *(_QWORD *)(v4 + 8 * v10);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v18 - 1) & v18;
    v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    result = swift_bridgeObjectRelease();
  }
  v19 = v17 + 4;
  if (v19 >= v8)
    return swift_release();
  v18 = *(_QWORD *)(v4 + 8 * v19);
  if (v18)
  {
    v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_23128F93C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_23128A7F0(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_23128F99C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254159658)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254159658);
  }
}

void sub_23128FA08(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_2312BC0C8();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_23128FA58(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DeviceConfigurationProvider(a2, a1);
  return a2;
}

uint64_t sub_23128FA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128F93C(0, &qword_254158F10, &qword_254158F08, (uint64_t)&protocol descriptor for NoiseMonitoringCapabilityProviding, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23128FAF8(uint64_t a1)
{
  uint64_t v2;

  sub_23128F93C(0, &qword_254158F10, &qword_254158F08, (uint64_t)&protocol descriptor for NoiseMonitoringCapabilityProviding, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23128FB54(uint64_t a1)
{
  destroy for DeviceConfigurationProvider(a1);
  return a1;
}

void sub_23128FB88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3148)
  {
    type metadata accessor for Key();
    sub_23128FBF4();
    v0 = sub_2312BC0C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3148);
  }
}

unint64_t sub_23128FBF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EC2FD8;
  if (!qword_255EC2FD8)
  {
    type metadata accessor for Key();
    result = MEMORY[0x2348D9A30](&unk_2312BCB18, v1);
    atomic_store(result, (unint64_t *)&qword_255EC2FD8);
  }
  return result;
}

uint64_t type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler()
{
  uint64_t result;

  result = qword_255EC3160;
  if (!qword_255EC3160)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23128FC78()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BBBC4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_23128FCF8()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  void (*v16)(char *, uint64_t);
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  char *v27;
  id v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t ObjectType;
  _QWORD v36[4];

  ObjectType = swift_getObjectType();
  v0 = sub_2312BB774();
  v32 = *(_QWORD *)(v0 - 8);
  v33 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v34 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_2312BB7F8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v30 - v7;
  v9 = sub_2312BB9D8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v31 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - v13;
  sub_2312BBA98();
  sub_2312BB9B4();
  v15 = *(void (**)(char *, uint64_t))(v10 + 8);
  v15(v14, v9);
  sub_23128B868(v36, v36[3]);
  v16 = v15;
  sub_2312BB984();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BE42648], v2);
  sub_23128A728((unint64_t *)&qword_255EC31C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE42678], MEMORY[0x24BE42688]);
  v17 = sub_2312BBD5C();
  v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v6, v2);
  v18(v8, v2);
  v19 = v9;
  sub_23128B88C((uint64_t)v36);
  if ((v17 & 1) == 0)
  {
    type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler();
    sub_23128A728(&qword_255EC31C8, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler, (uint64_t)&unk_2312BCE04);
    v20 = sub_2312BBA68();
    if (v20)
    {
      v21 = (void *)v20;
      v22 = v31;
      sub_2312BBA98();
      v23 = (void *)sub_2312BB9C0();
      v16(v22, v9);
      v24 = objc_msgSend(v23, sel_navigationController);

      if (v24)
      {
        objc_msgSend(v24, sel_pushViewController_animated_, v21, 1);

      }
    }
  }
  v25 = (uint64_t)v34;
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v34, *MEMORY[0x24BE42168], v33);
  v26 = objc_allocWithZone((Class)type metadata accessor for HeadphoneNotificationsSettingsViewController(0));
  v27 = sub_2312A354C(v25);
  sub_2312BB99C();
  sub_2312B7A4C();
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A728]), sel_initWithRootViewController_, v27);
  sub_2312BBA98();
  v29 = (void *)sub_2312BB9C0();
  v16(v14, v19);
  objc_msgSend(v29, sel_presentViewController_animated_completion_, v28, 1, 0);

}

uint64_t sub_231290088(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = sub_2312BB9D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v1);
  v8 = qword_255EC3150;
  v9 = qword_255EC2F50;
  v10 = (char *)v7;
  if (v9 != -1)
    swift_once();
  v11 = sub_2312BBBC4();
  v12 = sub_23128A1E0(v11, (uint64_t)qword_255EC4110);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(&v10[v8], v12, v11);
  v13 = qword_255EC3158;
  sub_231290310();
  *(_QWORD *)&v10[v13] = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD35B0]);

  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v14 = sub_2312BBAA4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v14;
}

void sub_2312901D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_255EC3150;
  v2 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

}

id sub_231290220()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_231290254(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + qword_255EC3150;
  v3 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);

}

uint64_t sub_2312902A4()
{
  return type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler();
}

uint64_t sub_2312902AC()
{
  return sub_23128A728(&qword_255EC31B0, MEMORY[0x24BE42BF8], MEMORY[0x24BE42BE8]);
}

uint64_t sub_2312902D8()
{
  return sub_23128A728(&qword_255EC31B8, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler, (uint64_t)&unk_2312BCDD4);
}

unint64_t sub_231290310()
{
  unint64_t result;

  result = qword_2541596B0;
  if (!qword_2541596B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2541596B0);
  }
  return result;
}

uint64_t sub_23129034C(uint64_t a1, int a2)
{
  uint64_t *v2;
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
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;

  v47 = a2;
  v37 = a1;
  v46 = *v2;
  v3 = sub_2312BB504();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v43 = v3;
  v44 = v5;
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129198C();
  v8 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  v49 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_2312BB4C8();
  v10 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2312BB4E0();
  v39 = *(_QWORD *)(v13 - 8);
  v40 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (void *)sub_2312BB4F8();
  sub_23128D554(0, &qword_2541596E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v17 = sub_2312BB3F0();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2312BCBF0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v18 + 104))(v20 + v19, *MEMORY[0x24BE474E0], v17);
  v21 = v16;
  sub_231299A6C(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  v22 = swift_deallocClassInstance();
  v23 = sub_231297C1C(v22);
  sub_231297D78(v23);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BE47910], v38);
  sub_2312BB4D4();

  v24 = v42;
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v42 + OBJC_IVAR____TtC16HearingAppPlugin40HeadphoneNotificationsPromotionGenerator_domain, v15, v40);
  v25 = v41;
  v26 = v37;
  v27 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v41, v37, v43);
  v28 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v29 = v28 + v44;
  v30 = (v28 + v44) & 0xFFFFFFFFFFFFFFF8;
  v31 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v31 + v28, v25, v27);
  *(_BYTE *)(v31 + v29) = v47;
  *(_QWORD *)(v30 + v31 + 8) = v46;
  sub_231291A04();
  sub_23128A728(&qword_2541595B8, (uint64_t (*)(uint64_t))sub_231291A04, MEMORY[0x24BDB9AF8]);
  v32 = v45;
  sub_2312BBC60();
  sub_23128A728(&qword_254159600, (uint64_t (*)(uint64_t))sub_23129198C, MEMORY[0x24BDB9E90]);
  v33 = v48;
  v34 = sub_2312BBCC0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v32, v33);
  result = v24;
  *(_QWORD *)(v24 + OBJC_IVAR____TtC16HearingAppPlugin40HeadphoneNotificationsPromotionGenerator_publisher) = v34;
  return result;
}

uint64_t sub_2312906F0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _BYTE v33[12];
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  sub_231291CB8();
  v37 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_2312BB504();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_231290AA0(a1, a2);
  if (qword_2541597A8 != -1)
    swift_once();
  v14 = sub_2312BBBC4();
  sub_23128A1E0(v14, (uint64_t)qword_25415A9C0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  swift_bridgeObjectRetain_n();
  v15 = sub_2312BBBAC();
  v16 = sub_2312BBED0();
  v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    v18 = swift_slowAlloc();
    v36 = a3;
    v19 = v18;
    v35 = swift_slowAlloc();
    v40 = v35;
    *(_DWORD *)v19 = 136446722;
    v20 = sub_2312BC1E8();
    v39 = sub_2312AE104(v20, v21, &v40);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    v39 = sub_2312BB4F8();
    v34 = v17;
    v22 = sub_2312BBDBC();
    v39 = sub_2312AE104(v22, v23, &v40);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
    *(_WORD *)(v19 + 22) = 2082;
    v24 = swift_bridgeObjectRetain();
    v25 = MEMORY[0x2348D91FC](v24, MEMORY[0x24BE47F58]);
    v27 = v26;
    swift_bridgeObjectRelease();
    v39 = sub_2312AE104(v25, v27, &v40);
    sub_2312BBF9C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231285000, v15, (os_log_type_t)v34, "[%{public}s] Returning changes for profile %{public}s: %{public}s", (uint8_t *)v19, 0x20u);
    v28 = v35;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v28, -1, -1);
    v29 = v19;
    a3 = v36;
    MEMORY[0x2348D9AB4](v29, -1, -1);

  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);

    swift_bridgeObjectRelease_n();
  }
  v40 = v13;
  sub_23128D644(0, &qword_254159660, MEMORY[0x24BE47F58], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
  sub_2312BBC48();
  sub_23128A728(&qword_2541595D8, (uint64_t (*)(uint64_t))sub_231291CB8, MEMORY[0x24BDB9DF8]);
  v30 = v38;
  v31 = sub_2312BBCC0();
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v37 + 8))(v8, v30);
  *a3 = v31;
  return result;
}

uint64_t sub_231290AA0(uint64_t a1, int a2)
{
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v55;
  char *v56;
  char *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65[4];

  v58 = a2;
  v4 = sub_2312BB498();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v56 = (char *)&v55 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v55 - v10;
  sub_231291D24(0);
  v61 = v12;
  v59 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v60 = (uint64_t)&v55 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v63 = (uint64_t)&v55 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v55 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v55 - v23;
  v25 = sub_23128A728(&qword_254159478, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsPromotionGenerator, (uint64_t)&unk_2312BCE8C);
  v62 = v2;
  sub_231291A80(v2, v25);
  v55 = a1;
  sub_2312BB4EC();
  sub_23128B868(v65, v65[3]);
  sub_2312BB4A4();
  swift_bridgeObjectRelease();
  sub_231291D40((uint64_t)v24, (uint64_t)v22);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v26(v22, 1, v4) != 1)
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v27(v11, v22, v4);
    sub_23128D554(0, &qword_2541596F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v28 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_2312BCBF0;
    v27((char *)(v29 + v28), v11, v4);
  }
  sub_231291D84((uint64_t)v24);
  sub_23128B88C((uint64_t)v65);
  v30 = v63;
  if ((v58 & 1) != 0)
  {
    sub_231291328(v55, v63);
    v31 = 0;
  }
  else
  {
    v31 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v30, v31, 1, v4);
  sub_23128D554(0, &qword_2541596F8, (uint64_t (*)(uint64_t))sub_231291D24, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v32 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_2312BCBF0;
  v34 = v33 + v32;
  sub_231291D40(v30, v34);
  v35 = v60;
  sub_231291D40(v34, v60);
  sub_231291DC0(v35, (uint64_t)v15);
  if (v26(v15, 1, v4) == 1)
  {
    sub_231291D84((uint64_t)v15);
  }
  else
  {
    v36 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v37 = v56;
    v36(v56, v15, v4);
    v38 = v57;
    v36(v57, v37, v4);
    v39 = MEMORY[0x24BEE4AF8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v39 = sub_2312B33C4(0, *(_QWORD *)(v39 + 16) + 1, 1, v39);
    v41 = *(_QWORD *)(v39 + 16);
    v40 = *(_QWORD *)(v39 + 24);
    if (v41 >= v40 >> 1)
      v39 = sub_2312B33C4(v40 > 1, v41 + 1, 1, v39);
    *(_QWORD *)(v39 + 16) = v41 + 1;
    v36((char *)(v39+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v41), v38, v4);
  }
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v42 = sub_2312BBE34();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_2541597A8 != -1)
    swift_once();
  v43 = sub_2312BBBC4();
  sub_23128A1E0(v43, (uint64_t)qword_25415A9C0);
  swift_bridgeObjectRetain_n();
  v44 = sub_2312BBBAC();
  v45 = sub_2312BBED0();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = swift_slowAlloc();
    v47 = swift_slowAlloc();
    v65[0] = v47;
    *(_DWORD *)v46 = 136446466;
    v48 = sub_2312BC1E8();
    v64 = sub_2312AE104(v48, v49, v65);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2082;
    v50 = swift_bridgeObjectRetain();
    v51 = MEMORY[0x2348D91FC](v50, MEMORY[0x24BE47F58]);
    v53 = v52;
    swift_bridgeObjectRelease();
    v64 = sub_2312AE104(v51, v53, v65);
    sub_2312BBF9C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231285000, v44, v45, "[%{public}s] Computed needed PluginFeedItemChanges: %{public}s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v47, -1, -1);
    MEMORY[0x2348D9AB4](v46, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_231291D84(v63);
  return v42;
}

uint64_t sub_231291328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t inited;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;

  v3 = v2;
  v34 = a2;
  v30 = sub_2312BB540();
  v27 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v28 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_2312BB54C();
  v29 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v26 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2312BB630();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_2312BB720();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v35 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23128A728(&qword_254159478, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsPromotionGenerator, (uint64_t)&unk_2312BCE8C);
  v24 = v3;
  v25 = a1;
  v11 = sub_231291A80(v3, v10);
  v23[1] = v12;
  v23[2] = v11;
  if (qword_2541597F0 != -1)
    swift_once();
  v13 = (id)qword_25415A9E8;
  sub_2312BB624();
  sub_2312BB354();
  sub_2312BB354();
  sub_2312BB354();
  sub_2312BB714();
  sub_231291A80(v24, v10);
  v14 = (void *)sub_2312BB42C();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_2312BC08C())
    sub_2312B3898(MEMORY[0x24BEE4AF8]);
  type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler();
  sub_23128A728(&qword_255EC31C8, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsPromotionTileActionHandler, (uint64_t)&unk_2312BCE04);
  v15 = v35;
  sub_2312BB438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v28, *MEMORY[0x24BE47C88], v30);
  v16 = v26;
  sub_2312BB558();
  v17 = v31;
  sub_2312BB450();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v17);
  sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BCBF0;
  *(_QWORD *)(inited + 32) = sub_2312BB534();
  *(_QWORD *)(inited + 40) = v19;
  sub_2312998AC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v20 = sub_2312BB480();
  v21 = sub_231297C1C(v20);
  sub_231297D78(v21);
  swift_bridgeObjectRelease();
  sub_2312BB474();
  sub_2312BB45C();
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v15, v33);
}

uint64_t sub_231291814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin40HeadphoneNotificationsPromotionGenerator_domain;
  v2 = sub_2312BB4E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_231291874()
{
  return type metadata accessor for HeadphoneNotificationsPromotionGenerator();
}

uint64_t type metadata accessor for HeadphoneNotificationsPromotionGenerator()
{
  uint64_t result;

  result = qword_254159480;
  if (!qword_254159480)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2312918B8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BB4E0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_231291930()
{
  return swift_retain();
}

uint64_t sub_231291944@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC16HearingAppPlugin40HeadphoneNotificationsPromotionGenerator_domain;
  v4 = sub_2312BB4E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void sub_23129198C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159608)
  {
    sub_231291A04();
    sub_23128A728(&qword_2541595B8, (uint64_t (*)(uint64_t))sub_231291A04, MEMORY[0x24BDB9AF8]);
    v0 = sub_2312BBC6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159608);
  }
}

void sub_231291A04()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541595C0)
  {
    sub_23128D644(255, &qword_254159660, MEMORY[0x24BE47F58], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v0 = sub_2312BBC30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541595C0);
  }
}

uint64_t sub_231291A80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t MetatypeMetadata;
  uint64_t v15;

  v3 = sub_2312BB3C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&MetatypeMetadata - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MetatypeMetadata = swift_getMetatypeMetadata();
  v15 = a2;
  sub_231291E18(0, &qword_254159368, (void (*)(uint64_t))sub_231291E04);
  v7 = sub_2312BBDB0();
  v9 = v8;
  v10 = (void *)sub_2312BB4F8();
  v11 = (void *)sub_2312BB3FC();

  if (v11)
  {
    v12 = objc_msgSend(v11, sel_identifier);

    sub_2312BB3B4();
    sub_2312BB39C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  MetatypeMetadata = v7;
  v15 = v9;
  sub_2312BBDD4();
  sub_2312BBDD4();
  sub_2312BBDD4();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  return MetatypeMetadata;
}

uint64_t sub_231291BFC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2312BB504();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_231291C64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_2312BB504() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_2312906F0(v1 + v4, *(unsigned __int8 *)(v1 + v4 + *(_QWORD *)(v3 + 64)), a1);
}

void sub_231291CB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541595E0)
  {
    sub_23128D644(255, &qword_254159660, MEMORY[0x24BE47F58], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v0 = sub_2312BBC3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541595E0);
  }
}

void sub_231291D24(uint64_t a1)
{
  sub_23128D554(a1, &qword_254159348, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t sub_231291D40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231291D24(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_231291D84(uint64_t a1)
{
  uint64_t v2;

  sub_231291D24(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231291DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231291D24(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_231291E04(uint64_t a1)
{
  return sub_231291E18(a1, &qword_254159360, (void (*)(uint64_t))sub_231291E50);
}

uint64_t sub_231291E18(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    a3(255);
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_231291E50()
{
  unint64_t result;

  result = qword_254159358;
  if (!qword_254159358)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254159358);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ArticleIdentifiers(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleIdentifiers(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleIdentifiers(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_231291F90 + 4 * byte_2312BCEC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_231291FC4 + 4 * byte_2312BCEC0[v4]))();
}

uint64_t sub_231291FC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_231291FCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x231291FD4);
  return result;
}

uint64_t sub_231291FE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x231291FE8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_231291FEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_231291FF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_231292000(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23129200C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArticleIdentifiers()
{
  return &type metadata for ArticleIdentifiers;
}

unint64_t sub_231292028()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EC31D0;
  if (!qword_255EC31D0)
  {
    sub_231292070();
    result = MEMORY[0x2348D9A30](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255EC31D0);
  }
  return result;
}

void sub_231292070()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC31D8)
  {
    v0 = sub_2312BBE58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC31D8);
  }
}

unint64_t sub_2312920C4(char a1)
{
  if (!a1)
    return 0xD000000000000028;
  if (a1 == 1)
    return 0xD000000000000024;
  return 0xD00000000000002DLL;
}

uint64_t sub_231292120(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23129212C(*a1, *a2);
}

uint64_t sub_23129212C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD000000000000028;
  v3 = 0x80000002312BE940;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000024;
    else
      v5 = 0xD00000000000002DLL;
    if (v4 == 1)
      v6 = 0x80000002312BE970;
    else
      v6 = 0x80000002312BE9A0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD000000000000028;
  v6 = 0x80000002312BE940;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0xD000000000000024;
    else
      v2 = 0xD00000000000002DLL;
    if (v7 == 1)
      v3 = 0x80000002312BE970;
    else
      v3 = 0x80000002312BE9A0;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_2312BC128();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_231292220()
{
  return sub_231292228();
}

uint64_t sub_231292228()
{
  sub_2312BC188();
  sub_2312BBDC8();
  swift_bridgeObjectRelease();
  return sub_2312BC1A0();
}

uint64_t sub_2312922CC()
{
  return sub_2312922D4();
}

uint64_t sub_2312922D4()
{
  sub_2312BBDC8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_231292350()
{
  return sub_231292358();
}

uint64_t sub_231292358()
{
  sub_2312BC188();
  sub_2312BBDC8();
  swift_bridgeObjectRelease();
  return sub_2312BC1A0();
}

uint64_t sub_2312923F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_231292968();
  *a1 = result;
  return result;
}

unint64_t sub_231292424@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = sub_2312920C4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_23129244C(_QWORD *a1@<X8>)
{
  *a1 = &unk_250016600;
}

unint64_t sub_231292460()
{
  unint64_t result;

  result = qword_255EC31E0;
  if (!qword_255EC31E0)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BCF94, &type metadata for ArticleIdentifiers);
    atomic_store(result, (unint64_t *)&qword_255EC31E0);
  }
  return result;
}

uint64_t sub_2312924A4(char a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  ValueMetadata *v7;
  unint64_t v8;
  __int128 v10[2];
  uint64_t v11;
  _QWORD v12[3];
  ValueMetadata *v13;
  _UNKNOWN **v14;
  _UNKNOWN **v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  if (a1)
  {
    if (a1 == 1)
    {
      v13 = &type metadata for AudiogramArticleDataProvider;
      v14 = (_UNKNOWN **)sub_231292B78();
      v2 = sub_231292BBC();
    }
    else
    {
      v13 = &type metadata for HeadphoneListeningArticleDataProvider;
      v14 = (_UNKNOWN **)sub_2312929B0();
      v2 = sub_2312929F4();
    }
  }
  else
  {
    v13 = &type metadata for HearingHealthArticleDataProvider;
    v14 = (_UNKNOWN **)sub_231292C00();
    v2 = sub_231292C44();
  }
  v15 = (_UNKNOWN **)v2;
  sub_231292A38();
  sub_231292A94();
  if (swift_dynamicCast())
  {
    sub_23128B850(v10, (uint64_t)v16);
    v3 = v17;
    v4 = v18;
    sub_23128B868(v16, v17);
    if (qword_254159768 != -1)
      swift_once();
    v13 = &type metadata for DeviceConfigurationProvider;
    v14 = &off_250016C30;
    v15 = &off_250016C20;
    v12[0] = swift_allocObject();
    sub_23128FA58((uint64_t)&unk_25415A950, v12[0] + 16);
    v5 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v4 + 8))(v12, v3, v4);
    sub_23128B88C((uint64_t)v12);
    v6 = v16;
  }
  else
  {
    v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_231292AE8((uint64_t)v10);
    if (a1)
    {
      if (a1 == 1)
      {
        v7 = &type metadata for AudiogramArticleDataProvider;
        v13 = &type metadata for AudiogramArticleDataProvider;
        v14 = (_UNKNOWN **)sub_231292B78();
        v8 = sub_231292BBC();
      }
      else
      {
        v7 = &type metadata for HeadphoneListeningArticleDataProvider;
        v13 = &type metadata for HeadphoneListeningArticleDataProvider;
        v14 = (_UNKNOWN **)sub_2312929B0();
        v8 = sub_2312929F4();
      }
    }
    else
    {
      v7 = &type metadata for HearingHealthArticleDataProvider;
      v13 = &type metadata for HearingHealthArticleDataProvider;
      v14 = (_UNKNOWN **)sub_231292C00();
      v8 = sub_231292C44();
    }
    v15 = (_UNKNOWN **)v8;
    sub_23128B868(v12, (uint64_t)v7);
    v5 = sub_2312BB594();
    v6 = v12;
  }
  sub_23128B88C((uint64_t)v6);
  return v5;
}

double sub_2312926CC@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  double result;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRetain();
  v6 = sub_2312BC0EC();
  swift_bridgeObjectRelease();
  if (v6 == 2)
  {
    *(_QWORD *)(a3 + 24) = &type metadata for HeadphoneListeningArticleDataProvider;
    *(_QWORD *)(a3 + 32) = sub_2312929B0();
    *(_QWORD *)(a3 + 40) = sub_2312929F4();
  }
  else if (v6 == 1)
  {
    *(_QWORD *)(a3 + 24) = &type metadata for AudiogramArticleDataProvider;
    *(_QWORD *)(a3 + 32) = sub_231292B78();
    *(_QWORD *)(a3 + 40) = sub_231292BBC();
  }
  else if (v6)
  {
    if (qword_255EC2F50 != -1)
      swift_once();
    v8 = sub_2312BBBC4();
    sub_23128A1E0(v8, (uint64_t)qword_255EC4110);
    swift_bridgeObjectRetain_n();
    v9 = sub_2312BBBAC();
    v10 = sub_2312BBEB8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v13 = v12;
      *(_DWORD *)v11 = 136446466;
      sub_2312AE104(0xD000000000000022, 0x80000002312BCFA0, &v13);
      sub_2312BBF9C();
      *(_WORD *)(v11 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_2312AE104(a1, a2, &v13);
      sub_2312BBF9C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231285000, v9, v10, "[%{public}s] Article identifier %{public}s could not be found", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v12, -1, -1);
      MEMORY[0x2348D9AB4](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    result = 0.0;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
  }
  else
  {
    *(_QWORD *)(a3 + 24) = &type metadata for HearingHealthArticleDataProvider;
    *(_QWORD *)(a3 + 32) = sub_231292C00();
    *(_QWORD *)(a3 + 40) = sub_231292C44();
  }
  return result;
}

uint64_t sub_231292968()
{
  unint64_t v0;

  v0 = sub_2312BC0EC();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_2312929B0()
{
  unint64_t result;

  result = qword_254159788;
  if (!qword_254159788)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BDD20, &type metadata for HeadphoneListeningArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254159788);
  }
  return result;
}

unint64_t sub_2312929F4()
{
  unint64_t result;

  result = qword_254159790;
  if (!qword_254159790)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BDCB8, &type metadata for HeadphoneListeningArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254159790);
  }
  return result;
}

unint64_t sub_231292A38()
{
  unint64_t result;

  result = qword_254159770;
  if (!qword_254159770)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254159770);
  }
  return result;
}

unint64_t sub_231292A94()
{
  unint64_t result;

  result = qword_255EC31E8;
  if (!qword_255EC31E8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC31E8);
  }
  return result;
}

uint64_t sub_231292AE8(uint64_t a1)
{
  uint64_t v2;

  sub_231292B24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_231292B24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC31F0)
  {
    sub_231292A94();
    v0 = sub_2312BBF90();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC31F0);
  }
}

unint64_t sub_231292B78()
{
  unint64_t result;

  result = qword_254159778;
  if (!qword_254159778)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BDC38, &type metadata for AudiogramArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254159778);
  }
  return result;
}

unint64_t sub_231292BBC()
{
  unint64_t result;

  result = qword_254159780;
  if (!qword_254159780)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BDBD0, &type metadata for AudiogramArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254159780);
  }
  return result;
}

unint64_t sub_231292C00()
{
  unint64_t result;

  result = qword_2541597B8;
  if (!qword_2541597B8)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BDFEC, &type metadata for HearingHealthArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_2541597B8);
  }
  return result;
}

unint64_t sub_231292C44()
{
  unint64_t result;

  result = qword_2541597C0;
  if (!qword_2541597C0)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BDF84, &type metadata for HearingHealthArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_2541597C0);
  }
  return result;
}

uint64_t sub_231292C88()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    sub_23128B88C(v0 + 16);
  if (*(_QWORD *)(v0 + 80))
    sub_23128B88C(v0 + 56);
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for EducationArticleTileDataController()
{
  return &type metadata for EducationArticleTileDataController;
}

uint64_t sub_231292CD4(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRetain();
  v4 = sub_2312BC0EC();
  swift_bridgeObjectRelease();
  if (v4 <= 2)
    return sub_2312924A4(v4);
  if (qword_255EC2F50 != -1)
    swift_once();
  v6 = sub_2312BBBC4();
  sub_23128A1E0(v6, (uint64_t)qword_255EC4110);
  swift_bridgeObjectRetain_n();
  v7 = sub_2312BBBAC();
  v8 = sub_2312BBEB8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136446466;
    sub_2312AE104(0xD000000000000022, 0x80000002312BCFA0, &v11);
    sub_2312BBF9C();
    *(_WORD *)(v9 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_2312AE104(a1, a2, &v11);
    sub_2312BBF9C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_231285000, v7, v8, "[%{public}s] Article identifier %{public}s could not be found", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v10, -1, -1);
    MEMORY[0x2348D9AB4](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_231292EF0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v1 = *(_QWORD **)(v0
                  + OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate____lazy_storage___articleIdentifiersByUrl);
  if (v1)
  {
    swift_bridgeObjectRetain();
    return (uint64_t)v1;
  }
  v22 = OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate____lazy_storage___articleIdentifiersByUrl;
  v1 = (_QWORD *)sub_23128EB40(MEMORY[0x24BEE4AF8]);
  v2 = 0;
  while (1)
  {
    v3 = byte_250016628[v2++ + 32];
    v4 = 0xD000000000000018;
    if (v3 != 1)
      v4 = 0xD000000000000016;
    v5 = 0x80000002312BF250;
    if (v3 != 1)
      v5 = 0x80000002312BF230;
    v6 = v3 ? v4 : 0xD000000000000017;
    v7 = v3 ? v5 : 0x80000002312BF270;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = sub_23128F384(v6, v7);
    v11 = v1[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
      break;
    v14 = v9;
    if (v1[3] >= v13)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v9 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_2312944EC();
        if ((v14 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_2312941E8(v13, isUniquelyReferenced_nonNull_native);
      v15 = sub_23128F384(v6, v7);
      if ((v14 & 1) != (v16 & 1))
        goto LABEL_31;
      v10 = v15;
      if ((v14 & 1) != 0)
      {
LABEL_4:
        *(_BYTE *)(v1[7] + v10) = v3;
        goto LABEL_5;
      }
    }
    v1[(v10 >> 6) + 8] |= 1 << v10;
    v17 = (uint64_t *)(v1[6] + 16 * v10);
    *v17 = v6;
    v17[1] = v7;
    *(_BYTE *)(v1[7] + v10) = v3;
    v18 = v1[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_30;
    v1[2] = v20;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v2 == 3)
    {
      *(_QWORD *)(v0 + v22) = v1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  result = sub_2312BC140();
  __break(1u);
  return result;
}

uint64_t sub_2312931E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  _QWORD *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unsigned int v43;
  ValueMetadata *v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  char v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  unint64_t v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[3];
  ValueMetadata *v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;

  v80 = a2;
  v88 = a3;
  ObjectType = swift_getObjectType();
  v6 = sub_2312BB954();
  v78 = *(_QWORD *)(v6 - 8);
  v79 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v77 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231294890(0, &qword_255EC3250, (void (*)(uint64_t))MEMORY[0x24BDCBB78]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v75 - v9;
  v11 = sub_2312BB348();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2312BB390();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = v3;
  v18 = v3 + OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate_logger;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v86 = a1;
  v19(v17, a1, v14);
  v82 = v18;
  v20 = sub_2312BBBAC();
  v21 = sub_2312BBED0();
  v22 = os_log_type_enabled(v20, v21);
  v85 = v11;
  v87 = v12;
  v83 = ObjectType;
  if (v22)
  {
    v23 = swift_slowAlloc();
    v76 = swift_slowAlloc();
    v89[0] = v76;
    *(_DWORD *)v23 = 136446466;
    v24 = sub_2312BC1E8();
    v93 = sub_2312AE104(v24, v25, v89);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2082;
    sub_23128A728(&qword_255EC3260, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v26 = sub_2312BC110();
    v93 = sub_2312AE104(v26, v27, v89);
    v11 = v85;
    v28 = v88;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    _os_log_impl(&dword_231285000, v20, v21, "[%{public}s] Received request to open URL: %{public}s", (uint8_t *)v23, 0x16u);
    v29 = v76;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v29, -1, -1);
    v30 = v23;
    v12 = v87;
    MEMORY[0x2348D9AB4](v30, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v28 = v88;
  }
  sub_2312BB330();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23129483C((uint64_t)v10, &qword_255EC3250, (void (*)(uint64_t))MEMORY[0x24BDCBB78]);
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v84, v10, v11);
  v31 = sub_2312BB33C();
  v33 = v32;
  v34 = (void *)sub_2312BBD68();
  v35 = objc_msgSend(v34, sel_pathComponents);

  v36 = (_QWORD *)sub_2312BBE10();
  if (v36[2] == 2)
  {
    v37 = v36[4] == 47 && v36[5] == 0xE100000000000000;
    if (v37 || (sub_2312BC128() & 1) != 0)
    {
      v39 = v36[6];
      v38 = v36[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v40 = sub_231292EF0();
      if (*(_QWORD *)(v40 + 16))
      {
        v41 = sub_23128F384(v39, v38);
        if ((v42 & 1) != 0)
        {
          v43 = *(unsigned __int8 *)(*(_QWORD *)(v40 + 56) + v41);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v43)
          {
            if (v43 == 1)
            {
              v44 = &type metadata for AudiogramArticleDataProvider;
              v90 = &type metadata for AudiogramArticleDataProvider;
              v91 = sub_231292B78();
              v45 = sub_231292BBC();
            }
            else
            {
              v44 = &type metadata for HeadphoneListeningArticleDataProvider;
              v90 = &type metadata for HeadphoneListeningArticleDataProvider;
              v91 = sub_2312929B0();
              v45 = sub_2312929F4();
            }
            v54 = v45;
          }
          else
          {
            v44 = &type metadata for HearingHealthArticleDataProvider;
            v90 = &type metadata for HearingHealthArticleDataProvider;
            v91 = sub_231292C00();
            v54 = sub_231292C44();
          }
          v92 = v54;
          sub_23128B868(v89, (uint64_t)v44);
          sub_2312BB5A0();
          sub_23128B88C((uint64_t)v89);
          sub_2312924A4(v43);
          v55 = objc_allocWithZone((Class)sub_2312BB588());
          v56 = (void *)sub_2312BB57C();
          v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A718]), sel_initWithRootViewController_, v56);
          v58 = (void *)sub_2312BB8A0();
          v59 = objc_msgSend(v58, sel_navigationController);

          if (!v59)
          {
            v61 = (void *)sub_2312BB8A0();
            objc_msgSend(v61, sel_presentViewController_animated_completion_, v57, 0, 0);
            v59 = v57;
            v57 = v61;
            v60 = v87;
LABEL_51:

            (*(void (**)(char *, uint64_t))(v60 + 8))(v84, v85);
            v28 = v88;
            goto LABEL_23;
          }
          v60 = v87;
          if (v43 > 1)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v62 = sub_2312BC128();
            swift_bridgeObjectRelease();
            if ((v62 & 1) == 0)
              goto LABEL_50;
          }
          sub_23128AC6C(0, (unint64_t *)&qword_2541596B0);
          v63 = (void *)MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD35B0]);
          v64 = (uint64_t)v77;
          sub_2312BB894();
          v65 = (void *)sub_23128AD38(v63, v64);
          (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v64, v79);
          v66 = objc_msgSend(v59, sel_viewControllers);
          sub_23128AC6C(0, &qword_255EC3258);
          v67 = sub_2312BBE10();

          if (v67 >> 62)
          {
            swift_bridgeObjectRetain();
            v68 = (id)sub_2312BC08C();
            swift_bridgeObjectRelease();
            if (v68)
            {
LABEL_36:
              if ((v67 & 0xC000000000000001) != 0)
              {
                v69 = (id)MEMORY[0x2348D9418](0, v67);
              }
              else
              {
                if (!*(_QWORD *)((v67 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
                  __break(1u);
                  goto LABEL_54;
                }
                v69 = *(id *)(v67 + 32);
              }
              v70 = v69;
              swift_bridgeObjectRelease();
              v89[0] = MEMORY[0x24BEE4AF8];
              if (v70)
              {
                v71 = v65;
                v68 = v70;
                MEMORY[0x2348D91D8]();
                if (*(_QWORD *)((v89[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v89[0] & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
                  sub_2312BBE40();
                sub_2312BBE4C();
                sub_2312BBE28();
LABEL_46:
                if (!v65)
                {
LABEL_49:

                  v74 = (void *)sub_2312BBE04();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v59, sel_setViewControllers_animated_, v74, 0);

                  v60 = v87;
LABEL_50:
                  objc_msgSend(v59, sel_presentViewController_animated_completion_, v57, 0, 0);
                  goto LABEL_51;
                }
                v73 = v65;
                MEMORY[0x2348D91D8]();
                if (*(_QWORD *)((v89[0] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v89[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
                {
LABEL_48:
                  sub_2312BBE4C();
                  sub_2312BBE28();
                  goto LABEL_49;
                }
LABEL_54:
                sub_2312BBE40();
                goto LABEL_48;
              }
LABEL_45:
              v72 = v65;
              v68 = 0;
              goto LABEL_46;
            }
          }
          else
          {
            v68 = *(id *)((v67 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v68)
              goto LABEL_36;
          }
          swift_bridgeObjectRelease();
          v89[0] = MEMORY[0x24BEE4AF8];
          goto LABEL_45;
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v46 = sub_2312BBBAC();
  v47 = sub_2312BBEB8();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = swift_slowAlloc();
    v49 = swift_slowAlloc();
    v89[0] = v49;
    *(_DWORD *)v48 = 136446466;
    v50 = sub_2312BC1E8();
    v93 = sub_2312AE104(v50, v51, v89);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2082;
    swift_bridgeObjectRetain();
    v93 = sub_2312AE104(v31, v33, v89);
    sub_2312BBF9C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_231285000, v46, v47, "[[%{public}s] Received request for invalid article: %{public}s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v49, -1, -1);
    MEMORY[0x2348D9AB4](v48, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v87 + 8))(v84, v85);
LABEL_23:
  v52 = sub_2312BB9E4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v28, 1, 1, v52);
}

uint64_t sub_231293C44(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char *v21;
  uint64_t v22;
  char *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _OWORD v28[3];

  sub_231294890(0, &qword_255EC3240, (void (*)(uint64_t))MEMORY[0x24BE44F78]);
  MEMORY[0x24BDAC7A8](v4);
  v24 = (char *)&v24 - v5;
  v6 = sub_2312BB954();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2312BB960();
  v10 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312BB90C();
  sub_2312BB8B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v13 = objc_allocWithZone((Class)sub_2312BBB04());
  v14 = a1;
  v15 = sub_2312BBAF8();
  objc_opt_self();
  v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    v17 = (void *)v16;
    v18 = v14;
    sub_231293ED0(v17, (uint64_t)&v26);
    if (!v27)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);

      sub_23129483C((uint64_t)&v26, &qword_255EC3248, (void (*)(uint64_t))sub_231292A38);
      return v15;
    }
    sub_231294878(&v26, v28);
    v19 = objc_msgSend(v18, sel_identifier);
    sub_2312BBD98();

    v20 = (void *)sub_2312BB948();
    v21 = v24;
    sub_2312BBAD4();
    swift_bridgeObjectRelease();

    v22 = sub_2312BBAE0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 0, 1, v22);
    sub_2312BBAEC();

    sub_23128B88C((uint64_t)v28);
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  return v15;
}

unint64_t sub_231293ED0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  unint64_t result;

  v3 = objc_msgSend(a1, sel_identifier);
  if (!v3)
  {
    sub_2312BBD98();
    v3 = (id)sub_2312BBD68();
    swift_bridgeObjectRelease();
  }
  v4 = sub_2312BBD98();
  v6 = v5;
  if (v4 == sub_2312BBD98() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  v9 = sub_2312BC128();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_15:

    *(_QWORD *)(a2 + 24) = &type metadata for HearingHealthArticleDataProvider;
    *(_QWORD *)(a2 + 32) = sub_231292C00();
    result = sub_231292C44();
    goto LABEL_16;
  }
  v10 = sub_2312BBD98();
  v12 = v11;
  if (v10 == sub_2312BBD98() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = sub_2312BC128();

    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      return result;
    }
  }
  *(_QWORD *)(a2 + 24) = &type metadata for HeadphoneListeningArticleDataProvider;
  *(_QWORD *)(a2 + 32) = sub_2312929B0();
  result = sub_2312929F4();
LABEL_16:
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

id sub_23129405C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingAppPluginAppDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2312940E0()
{
  return type metadata accessor for HearingAppPluginAppDelegate();
}

uint64_t type metadata accessor for HearingAppPluginAppDelegate()
{
  uint64_t result;

  result = qword_255EC3228;
  if (!qword_255EC3228)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231294124()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BBBC4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_231294198()
{
  return sub_23128A728(&qword_255EC3238, (uint64_t (*)(uint64_t))type metadata accessor for HearingAppPluginAppDelegate, (uint64_t)&unk_2312BD098);
}

id sub_2312941C4()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_2312941E8(uint64_t a1, char a2)
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
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  sub_2312948DC();
  v37 = a2;
  v6 = sub_2312BC0B0();
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
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_2312BC188();
    sub_2312BBDC8();
    result = sub_2312BC1A0();
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
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
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

void *sub_2312944EC()
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
  sub_2312948DC();
  v2 = *v0;
  v3 = sub_2312BC0A4();
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
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
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

uint64_t sub_231294690(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  id v16;
  _OWORD v17[2];
  uint64_t v18;

  v16 = a1;
  v3 = sub_2312BB954();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2312BB960();
  v15 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider()), sel_init);
  sub_2312BB93C();
  sub_2312BB930();
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_2312BBAB0();
  swift_bridgeObjectRelease();
  sub_23129483C((uint64_t)v17, &qword_255EC2FC8, (void (*)(uint64_t))sub_23128BA78);

  sub_2312BB8B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  v11 = objc_allocWithZone((Class)sub_2312BB978());
  v12 = v16;
  v13 = sub_2312BB96C();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v7);
  return v13;
}

uint64_t sub_23129483C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_231294890(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

_OWORD *sub_231294878(__int128 *a1, _OWORD *a2)
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

void sub_231294890(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2312BBF90();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_2312948DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3140)
  {
    v0 = sub_2312BC0C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3140);
  }
}

uint64_t type metadata accessor for NoiseNotificationsFeatureStatusActionHandler(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3270);
}

uint64_t sub_231294954()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2312949A0()
{
  return 1;
}

uint64_t sub_2312949A8()
{
  sub_2312BC188();
  sub_2312BC194();
  return sub_2312BC1A0();
}

uint64_t sub_2312949E8()
{
  return sub_2312BC194();
}

uint64_t sub_231294A0C()
{
  sub_2312BC188();
  sub_2312BC194();
  return sub_2312BC1A0();
}

unint64_t sub_231294A48()
{
  return 0xD000000000000011;
}

uint64_t sub_231294A64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2312962E4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_231294A8C()
{
  return 0;
}

void sub_231294A98(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_231294AA4()
{
  sub_231296074();
  return sub_2312BC1D0();
}

uint64_t sub_231294ACC()
{
  sub_231296074();
  return sub_2312BC1DC();
}

uint64_t sub_231294AF4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;

  v18 = a2;
  v20 = sub_2312BB600();
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v21 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312960B8(0, &qword_255EC3380, MEMORY[0x24BEE33E0]);
  v19 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - v8;
  v10 = type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128B868(a1, a1[3]);
  sub_231296074();
  sub_2312BC1B8();
  if (!v2)
  {
    v13 = (uint64_t)v12;
    sub_23128A728(&qword_255EC3388, (uint64_t (*)(uint64_t))MEMORY[0x24BE412A8], MEMORY[0x24BE412C8]);
    v15 = v19;
    v14 = v20;
    sub_2312BC0F8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v15);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v13, v21, v14);
    sub_231295D34(v13, v18);
  }
  return sub_23128B88C((uint64_t)a1);
}

uint64_t sub_231294CD4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_231294AF4(a1, a2);
}

uint64_t sub_231294CE8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_2312960B8(0, &qword_255EC3370, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - v5;
  sub_23128B868(a1, a1[3]);
  sub_231296074();
  sub_2312BC1C4();
  sub_2312BB600();
  sub_23128A728(&qword_254158F30, (uint64_t (*)(uint64_t))MEMORY[0x24BE412A8], MEMORY[0x24BE412B8]);
  sub_2312BC104();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_231294E00()
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  char *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  NSObject *v96;
  os_log_type_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  void (*v105)(char *, uint64_t);
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  char *v125;
  uint64_t ObjectType;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133[2];

  ObjectType = swift_getObjectType();
  v1 = sub_2312BB5F4();
  v113 = *(_QWORD *)(v1 - 8);
  v114 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v112 = (char *)&v107 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231294890(0, &qword_254158F28, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  MEMORY[0x24BDAC7A8](v3);
  v109 = (uint64_t)&v107 - v4;
  v5 = sub_2312BB774();
  v121 = *(_QWORD *)(v5 - 8);
  v122 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v117 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v124 = (char *)&v107 - v8;
  v123 = sub_2312BB600();
  v129 = *(_QWORD *)(v123 - 8);
  v9 = MEMORY[0x24BDAC7A8](v123);
  v110 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v125 = (char *)&v107 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v130 = (char *)&v107 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v116 = (char *)&v107 - v15;
  v131 = sub_2312BBBC4();
  v128 = *(_QWORD *)(v131 - 8);
  v16 = MEMORY[0x24BDAC7A8](v131);
  v118 = (char *)&v107 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v111 = (char *)&v107 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v119 = (char *)&v107 - v20;
  v21 = sub_2312BB9D8();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v107 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231294890(0, &qword_255EC32C8, (void (*)(uint64_t))type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v107 - v26;
  v28 = type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(0);
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v107 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v107 - v33;
  v127 = v0;
  sub_2312BBA98();
  sub_23128A728(&qword_255EC32D0, type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData, (uint64_t)&unk_2312BD1B4);
  sub_23128A728(qword_255EC32D8, type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData, (uint64_t)&unk_2312BD1DC);
  sub_2312BB9CC();
  v35 = *(void (**)(char *, uint64_t))(v22 + 8);
  v120 = v21;
  v35(v24, v21);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
    sub_23129483C((uint64_t)v27, &qword_255EC32C8, (void (*)(uint64_t))type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData);
    v36 = v118;
    sub_2312BBB94();
    v37 = sub_2312BBBAC();
    v38 = sub_2312BBEC4();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v133[0] = v40;
      *(_DWORD *)v39 = 136315138;
      v41 = sub_2312BC1E8();
      v132 = sub_2312AE104(v41, v42, v133);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v37, v38, "%s Could not access action handler user data!", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v40, -1, -1);
      MEMORY[0x2348D9AB4](v39, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v128 + 8))(v36, v131);
  }
  v118 = (char *)v35;
  sub_231295D34((uint64_t)v27, (uint64_t)v34);
  v44 = v119;
  sub_2312BBBA0();
  sub_231295D78((uint64_t)v34, (uint64_t)v32);
  v45 = sub_2312BBBAC();
  v46 = sub_2312BBED0();
  v47 = os_log_type_enabled(v45, v46);
  v115 = v34;
  if (v47)
  {
    v48 = swift_slowAlloc();
    v108 = swift_slowAlloc();
    v133[0] = v108;
    *(_DWORD *)v48 = 136315394;
    v49 = sub_2312BC1E8();
    v132 = sub_2312AE104(v49, v50, v133);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    v107 = v48 + 14;
    v51 = *(void (**)(char *, char *, uint64_t))(v129 + 16);
    v52 = v123;
    v51(v116, v32, v123);
    v53 = sub_2312BBDB0();
    v132 = sub_2312AE104(v53, v54, v133);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    sub_231295DBC((uint64_t)v32);
    _os_log_impl(&dword_231285000, v45, v46, "%s Did select cell with feature status %s", (uint8_t *)v48, 0x16u);
    v55 = v108;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v55, -1, -1);
    v56 = v48;
    v34 = v115;
    MEMORY[0x2348D9AB4](v56, -1, -1);

    v128 = *(_QWORD *)(v128 + 8);
    ((void (*)(char *, uint64_t))v128)(v44, v131);
  }
  else
  {
    sub_231295DBC((uint64_t)v32);

    v128 = *(_QWORD *)(v128 + 8);
    ((void (*)(char *, uint64_t))v128)(v44, v131);
    v51 = *(void (**)(char *, char *, uint64_t))(v129 + 16);
    v52 = v123;
  }
  v57 = v130;
  v58 = v127;
  v51(v130, v34, v52);
  sub_2312BBA98();
  v59 = (void *)sub_2312BB9C0();
  v60 = v120;
  v61 = (void (*)(char *, uint64_t))v118;
  ((void (*)(char *, uint64_t))v118)(v24, v120);
  v62 = v58;
  sub_2312BBA98();
  v63 = v124;
  sub_2312BB654();
  v64 = v60;
  v65 = v51;
  v61(v24, v64);
  v66 = v125;
  v51(v125, v57, v52);
  v67 = v129;
  v68 = (*(uint64_t (**)(char *, uint64_t))(v129 + 88))(v66, v52);
  if (v68 == *MEMORY[0x24BE41298])
  {
    v69 = v52;
    v70 = *(void **)(v62 + qword_255EC3268);
    v72 = v121;
    v71 = v122;
    v73 = (uint64_t)v117;
    (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v117, v63, v122);
    v74 = objc_allocWithZone((Class)type metadata accessor for NoiseNotificationsSettingsViewController(0));
    v75 = sub_2312A9A08(v70, v73);
    v76 = objc_msgSend(v59, sel_navigationController);
    if (v76)
    {
      v77 = v76;
      objc_msgSend(v76, sel_pushViewController_animated_, v75, 1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v63, v71);
    goto LABEL_18;
  }
  v78 = v63;
  if (v68 == *MEMORY[0x24BE412A0])
  {
    v79 = *(void **)(v127 + qword_255EC3268);
    v69 = v52;
    v81 = v121;
    v80 = v122;
    v82 = (uint64_t)v117;
    (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v117, v78, v122);
    v83 = objc_allocWithZone((Class)type metadata accessor for NoiseNotificationsSettingsViewController(0));
    v84 = v79;
    v85 = sub_2312A9A08(v84, v82);
    sub_2312BB99C();
    objc_msgSend(v84, sel_setOnboardingCompleted_, 1);
    objc_msgSend(v84, sel_setNoiseEnabled_, 1);
    objc_msgSend(v84, sel_setNotificationsEnabled_, 1);
    objc_msgSend(v84, sel_setNotificationThreshold_, 90);
    v86 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A728]), sel_initWithRootViewController_, v85);
    objc_msgSend(v59, sel_presentViewController_animated_completion_, v86, 1, 0);

    (*(void (**)(char *, uint64_t))(v81 + 8))(v78, v80);
LABEL_18:
    (*(void (**)(char *, uint64_t))(v67 + 8))(v130, v69);
    return sub_231295DBC((uint64_t)v115);
  }
  if (v68 == *MEMORY[0x24BE41288])
  {
    v88 = v113;
    v87 = v114;
    v89 = v112;
    (*(void (**)(char *, _QWORD, uint64_t))(v113 + 104))(v112, *MEMORY[0x24BE411F8], v114);
    sub_2312BB5E8();

    (*(void (**)(char *, uint64_t))(v88 + 8))(v89, v87);
    (*(void (**)(char *, uint64_t))(v121 + 8))(v63, v122);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v130, v52);
    return sub_231295DBC((uint64_t)v115);
  }
  if (v68 == *MEMORY[0x24BE41280])
  {
    v90 = v109;
    sub_23129BA68(v109);
    v91 = sub_2312BB390();
    v92 = *(_QWORD *)(v91 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v92 + 48))(v90, 1, v91) == 1)
    {

      (*(void (**)(char *, uint64_t))(v121 + 8))(v63, v122);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v130, v52);
      sub_231295DBC((uint64_t)v115);
      return sub_23129483C(v90, &qword_254158F28, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    }
    else
    {
      sub_2312BB36C();

      (*(void (**)(char *, uint64_t))(v121 + 8))(v63, v122);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v130, v52);
      sub_231295DBC((uint64_t)v115);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v92 + 8))(v90, v91);
    }
  }
  else
  {
    v93 = v111;
    sub_2312BBBA0();
    v94 = v110;
    v95 = v130;
    v65(v110, v130, v52);
    v96 = sub_2312BBBAC();
    v97 = sub_2312BBEB8();
    v98 = v97;
    if (os_log_type_enabled(v96, v97))
    {
      v99 = swift_slowAlloc();
      v100 = swift_slowAlloc();
      v133[0] = v100;
      *(_DWORD *)v99 = 136315650;
      v101 = sub_2312BC1E8();
      v132 = sub_2312AE104(v101, v102, v133);
      LODWORD(v127) = v98;
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v99 + 12) = 2080;
      v132 = sub_2312AE104(0x63656C6553646964, 0xEB00000000292874, v133);
      sub_2312BBF9C();
      *(_WORD *)(v99 + 22) = 2080;
      v65(v116, v94, v52);
      v103 = sub_2312BBDB0();
      v132 = sub_2312AE104(v103, v104, v133);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      v105 = *(void (**)(char *, uint64_t))(v129 + 8);
      v105(v94, v52);
      _os_log_impl(&dword_231285000, v96, (os_log_type_t)v127, "%s.%s Unhandled feature status %s", (uint8_t *)v99, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v100, -1, -1);
      MEMORY[0x2348D9AB4](v99, -1, -1);

      ((void (*)(char *, uint64_t))v128)(v111, v131);
      (*(void (**)(char *, uint64_t))(v121 + 8))(v124, v122);
      v106 = v130;
    }
    else
    {

      v105 = *(void (**)(char *, uint64_t))(v67 + 8);
      v105(v94, v52);
      ((void (*)(char *, uint64_t))v128)(v93, v131);
      (*(void (**)(char *, uint64_t))(v121 + 8))(v78, v122);
      v106 = v95;
    }
    v105(v106, v52);
    sub_231295DBC((uint64_t)v115);
    return ((uint64_t (*)(char *, uint64_t))v105)(v125, v52);
  }
}

uint64_t sub_231295B34(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  v4 = sub_2312BB9D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(v2);
  v9 = qword_255EC3268;
  v10 = qword_254159760;
  v11 = (char *)v8;
  if (v10 != -1)
    swift_once();
  v12 = (void *)qword_25415A948;
  *(_QWORD *)&v11[v9] = qword_25415A948;
  v13 = v12;

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v14 = sub_2312BBAA4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v14;
}

void sub_231295C34()
{
  uint64_t v0;

}

id sub_231295C44()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoiseNotificationsFeatureStatusActionHandler(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_231295C78(uint64_t a1)
{

}

uint64_t sub_231295C88()
{
  return type metadata accessor for NoiseNotificationsFeatureStatusActionHandler(0);
}

uint64_t sub_231295C90()
{
  return sub_23128A728(&qword_254159240, (uint64_t (*)(uint64_t))MEMORY[0x24BE448E0], MEMORY[0x24BE448D8]);
}

uint64_t sub_231295CBC()
{
  return sub_23128A728(&qword_255EC32C0, type metadata accessor for NoiseNotificationsFeatureStatusActionHandler, (uint64_t)&unk_2312BD110);
}

uint64_t type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3338);
}

uint64_t sub_231295D00(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231295D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_231295D78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_231295DBC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_231295DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_231295E34(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2312BB600();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_231295E68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_231295EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_231295EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_231295F34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_231295F78()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_231295F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_231295FC0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_231295FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23129600C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BB600();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_231296074()
{
  unint64_t result;

  result = qword_255EC3378;
  if (!qword_255EC3378)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BD2C8, &type metadata for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255EC3378);
  }
  return result;
}

void sub_2312960B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_231296074();
    v7 = a3(a1, &type metadata for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t getEnumTagSinglePayload for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2312961A8 + 4 * byte_2312BD0D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2312961C8 + 4 * byte_2312BD0D5[v4]))();
}

_BYTE *sub_2312961A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2312961C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2312961D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2312961D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2312961E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2312961E8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2312961F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys()
{
  return &type metadata for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys;
}

unint64_t sub_231296210()
{
  unint64_t result;

  result = qword_255EC3390;
  if (!qword_255EC3390)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BD2A0, &type metadata for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255EC3390);
  }
  return result;
}

unint64_t sub_231296258()
{
  unint64_t result;

  result = qword_255EC3398;
  if (!qword_255EC3398)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BD210, &type metadata for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255EC3398);
  }
  return result;
}

unint64_t sub_2312962A0()
{
  unint64_t result;

  result = qword_255EC33A0;
  if (!qword_255EC33A0)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BD238, &type metadata for NoiseNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255EC33A0);
  }
  return result;
}

uint64_t sub_2312962E4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x80000002312BF2F0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_2312BC128();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

double PDFHStackWithEqualWidth.Config.minimumColumnWidth.getter(double a1, double a2)
{
  return a2;
}

double PDFHStackWithEqualWidth.numberOfColumns.getter(uint64_t a1)
{
  return (double)*(uint64_t *)(a1 + 16);
}

double PDFHStackWithEqualWidth.init(config:_:)(void (*a1)(void), double a2)
{
  a1();
  return a2;
}

uint64_t PDFHStackWithEqualWidth.render(context:document:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double Height;
  uint64_t v18;
  __int128 v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v5 = sub_2312BB780();
  swift_bridgeObjectRetain();
  v18 = a3;
  if ((v5 & 1) != 0)
    v18 = sub_2312966C8(a3);
  sub_2312BB78C();
  CGRectGetWidth(v26);
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = sub_231296EDC(a3);
  swift_bridgeObjectRelease();
  swift_release();
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = *(double *)(v6 + 32);
    v9 = v7 - 1;
    if (v9)
    {
      v10 = (double *)(v6 + 40);
      do
      {
        v11 = *v10++;
        v12 = v11;
        if (v8 < v11)
          v8 = v12;
        --v9;
      }
      while (v9);
    }
  }
  swift_bridgeObjectRelease();
  PDFHStackWithEqualWidth.boundingRectForContent(in:)(a2, a3);
  result = sub_2312BB7E0();
  v14 = 0;
  v15 = *(_QWORD *)(v18 + 16);
  v16 = 0.0;
  if (v15)
    goto LABEL_11;
LABEL_10:
  v21 = 0u;
  v22 = 0u;
  v14 = v15;
  v20 = 0u;
  while (1)
  {
    sub_23129703C((uint64_t)&v20, (uint64_t)&v23);
    if (!v25)
    {
      swift_bridgeObjectRelease();
      return sub_2312BB7D4();
    }
    sub_23128B850(&v24, (uint64_t)&v20);
    sub_2312BB7EC();
    sub_2312BB78C();
    CGRectGetMinX(v27);
    sub_2312BB78C();
    CGRectGetMinY(v28);
    sub_2312BB78C();
    CGRectGetHeight(v29);
    sub_2312BB798();
    sub_23128B868(&v20, *((uint64_t *)&v21 + 1));
    sub_2312BB81C();
    sub_23128B868(&v20, *((uint64_t *)&v21 + 1));
    sub_2312BB810();
    Height = CGRectGetHeight(v30);
    swift_release();
    if (v16 < Height)
      v16 = Height;
    result = sub_23128B88C((uint64_t)&v20);
    if (v14 == v15)
      goto LABEL_10;
LABEL_11:
    if (v14 >= *(_QWORD *)(v18 + 16))
      break;
    sub_231296FF8(v18 + 32 + 40 * v14, (uint64_t)v19);
    *(_QWORD *)&v20 = v14;
    sub_23128B850(v19, (uint64_t)&v20 + 8);
    ++v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2312966C8(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  __int128 v9[2];
  __int128 v10[2];

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 < 2)
    return (uint64_t)v1;
  v3 = 0;
  v4 = v2 >> 1;
  v5 = v2 - 1;
  v6 = 40 * v2 - 8;
  for (i = 4; ; i += 5)
  {
    if (v3 == v5)
      goto LABEL_4;
    v8 = v1[2];
    if (v3 >= v8)
      break;
    result = sub_231296FF8((uint64_t)&v1[i], (uint64_t)v10);
    if (v5 >= v8)
      goto LABEL_14;
    sub_231296FF8((uint64_t)v1 + v6, (uint64_t)v9);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_231296D54(v1);
      v1 = (_QWORD *)result;
    }
    if (v3 >= v1[2])
      goto LABEL_15;
    sub_23128B88C((uint64_t)&v1[i]);
    result = sub_23128B850(v9, (uint64_t)&v1[i]);
    if (v5 >= v1[2])
      goto LABEL_16;
    sub_23128B88C((uint64_t)v1 + v6);
    result = sub_23128B850(v10, (uint64_t)v1 + v6);
LABEL_4:
    ++v3;
    --v5;
    v6 -= 40;
    if (v4 == v3)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

double PDFHStackWithEqualWidth.maximumColumnWidth(in:)(double a1, double a2, uint64_t a3, uint64_t a4)
{
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  CGRect v18;

  sub_2312BB78C();
  v7 = (CGRectGetWidth(v18) - ((double)*(uint64_t *)(a4 + 16) + -1.0) * a1) / (double)*(uint64_t *)(a4 + 16);
  swift_retain();
  v8 = swift_bridgeObjectRetain();
  v9 = sub_231296EDC(v8);
  swift_bridgeObjectRelease();
  swift_release();
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v11 = *(double *)(v9 + 32);
    v12 = v10 - 1;
    if (v12)
    {
      v13 = (double *)(v9 + 40);
      do
      {
        v14 = *v13++;
        v15 = v14;
        if (v11 < v14)
          v11 = v15;
        --v12;
      }
      while (v12);
    }
    swift_bridgeObjectRelease();
    if (v11 > a2)
      v16 = v11;
    else
      v16 = a2;
    if (v16 < v7)
      return v16;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t PDFHStackWithEqualWidth.boundingRectForContent(in:)(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double Height;
  uint64_t v16;
  __int128 v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = sub_2312BB780();
  swift_bridgeObjectRetain();
  v16 = a2;
  if ((v3 & 1) != 0)
    v16 = sub_2312966C8(a2);
  sub_2312BB78C();
  CGRectGetWidth(v24);
  swift_bridgeObjectRetain();
  swift_retain();
  v4 = sub_231296C34(a2);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = *(double *)(v4 + 32);
    v7 = v5 - 1;
    if (v7)
    {
      v8 = (double *)(v4 + 40);
      do
      {
        v9 = *v8++;
        v10 = v9;
        if (v6 < v9)
          v6 = v10;
        --v7;
      }
      while (v7);
    }
  }
  result = swift_bridgeObjectRelease();
  v12 = 0;
  v13 = *(_QWORD *)(v16 + 16);
  v14 = 0.0;
  if (v13)
    goto LABEL_11;
LABEL_10:
  v19 = 0u;
  v20 = 0u;
  v12 = v13;
  v18 = 0u;
  while (1)
  {
    sub_23129703C((uint64_t)&v18, (uint64_t)&v21);
    if (!v23)
    {
      swift_bridgeObjectRelease();
      return sub_2312BB78C();
    }
    sub_23128B850(&v22, (uint64_t)&v18);
    sub_2312BB7EC();
    sub_2312BB78C();
    CGRectGetMinX(v25);
    sub_2312BB78C();
    CGRectGetMinY(v26);
    sub_2312BB78C();
    CGRectGetHeight(v27);
    sub_2312BB798();
    sub_23128B868(&v18, *((uint64_t *)&v19 + 1));
    sub_2312BB804();
    Height = CGRectGetHeight(v28);
    swift_release();
    if (v14 < Height)
      v14 = Height;
    result = sub_23128B88C((uint64_t)&v18);
    if (v12 == v13)
      goto LABEL_10;
LABEL_11:
    if (v12 >= *(_QWORD *)(v16 + 16))
      break;
    sub_231296FF8(v16 + 32 + 40 * v12, (uint64_t)v17);
    *(_QWORD *)&v18 = v12;
    sub_23128B850(v17, (uint64_t)&v18 + 8);
    ++v12;
  }
  __break(1u);
  return result;
}

uint64_t PDFHStackWithEqualWidth.documentForColumn(_:columnWidth:in:)()
{
  uint64_t v0;
  CGRect v2;
  CGRect v3;
  CGRect v4;

  v0 = sub_2312BB7EC();
  sub_2312BB78C();
  CGRectGetMinX(v2);
  sub_2312BB78C();
  CGRectGetMinY(v3);
  sub_2312BB78C();
  CGRectGetHeight(v4);
  sub_2312BB798();
  return v0;
}

uint64_t sub_231296C34(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_231296EDC(a1);
  swift_release();
  return v1;
}

uint64_t sub_231296C84(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return PDFHStackWithEqualWidth.render(context:document:)(a1, a2, *v2);
}

uint64_t sub_231296C90(uint64_t a1)
{
  uint64_t *v1;

  return PDFHStackWithEqualWidth.boundingRectForContent(in:)(a1, *v1);
}

uint64_t sub_231296C9C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2312973B4();
  *v1 = v0;
  v1[1] = sub_231296D00;
  return sub_2312BB888();
}

uint64_t sub_231296D00(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

_QWORD *sub_231296D54(_QWORD *a1)
{
  return sub_2312B3608(0, a1[2], 0, a1);
}

uint64_t sub_231296D68(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_231296D84(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_231296D84(char a1, int64_t a2, char a3, char *a4)
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
    sub_2312973F8();
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

uint64_t sub_231296EDC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v10 = MEMORY[0x24BEE4AF8];
    sub_231296D68(0, v1, 0);
    v2 = v10;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      sub_23128B868(v4, v4[3]);
      sub_2312BB810();
      v6 = v5;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_231296D68(0, *(_QWORD *)(v10 + 16) + 1, 1);
      v8 = *(_QWORD *)(v10 + 16);
      v7 = *(_QWORD *)(v10 + 24);
      if (v8 >= v7 >> 1)
        sub_231296D68(v7 > 1, v8 + 1, 1);
      *(_QWORD *)(v10 + 16) = v8 + 1;
      *(_QWORD *)(v10 + 8 * v8 + 32) = v6;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_231296FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23129703C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_231297080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_231297080()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC33A8)
  {
    sub_2312970D4();
    v0 = sub_2312BBF90();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC33A8);
  }
}

void sub_2312970D4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255EC33B0)
  {
    sub_23129713C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255EC33B0);
  }
}

unint64_t sub_23129713C()
{
  unint64_t result;

  result = qword_255EC33B8;
  if (!qword_255EC33B8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC33B8);
  }
  return result;
}

unint64_t sub_231297194()
{
  unint64_t result;

  result = qword_255EC33C0;
  if (!qword_255EC33C0)
  {
    result = MEMORY[0x2348D9A30](&protocol conformance descriptor for PDFHStackWithEqualWidth, &type metadata for PDFHStackWithEqualWidth);
    atomic_store(result, (unint64_t *)&qword_255EC33C0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PDFHStackWithEqualWidth(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PDFHStackWithEqualWidth()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for PDFHStackWithEqualWidth(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for PDFHStackWithEqualWidth(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PDFHStackWithEqualWidth(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PDFHStackWithEqualWidth(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PDFHStackWithEqualWidth(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PDFHStackWithEqualWidth()
{
  return &type metadata for PDFHStackWithEqualWidth;
}

__n128 initializeBufferWithCopyOfBuffer for PDFHStackWithEqualWidth.Config(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PDFHStackWithEqualWidth.Config(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PDFHStackWithEqualWidth.Config(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PDFHStackWithEqualWidth.Config()
{
  return &type metadata for PDFHStackWithEqualWidth.Config;
}

unint64_t sub_2312973B4()
{
  unint64_t result;

  result = qword_255EC33D0;
  if (!qword_255EC33D0)
  {
    result = MEMORY[0x2348D9A30](&protocol conformance descriptor for PDFHStackWithEqualWidth, &type metadata for PDFHStackWithEqualWidth);
    atomic_store(result, (unint64_t *)&qword_255EC33D0);
  }
  return result;
}

void sub_2312973F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC33D8)
  {
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC33D8);
  }
}

uint64_t type metadata accessor for AudiogramDataTypeDetailViewController()
{
  uint64_t result;

  result = qword_255EC33F8;
  if (!qword_255EC33F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231297490()
{
  return swift_initClassMetadata2();
}

void sub_2312974F0(char *a1, uint64_t a2, void *a3)
{
  char *v4;
  id v5;

  v4 = &a1[qword_255EC33F0];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  sub_2312BC068();
  __break(1u);
}

id sub_231297568(void *a1)
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for AudiogramDataTypeDetailViewController();
  return objc_msgSendSuper2(&v2, sel_viewDidLoad);
}

void sub_2312975A8(char a1)
{
  char *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0AAD0]), sel_initWithDelegate_, v1);
  objc_msgSend(v3, sel_setAnalyticsClient_, 2);
  objc_msgSend(v3, sel_setHealthStore_unitPreferenceController_initialDate_, *(_QWORD *)&v1[qword_255EC33E0], *(_QWORD *)&v1[qword_255EC33E8], 0);
  objc_msgSend(v1, sel_presentViewController_animated_completion_, v3, a1 & 1, 0);

}

void sub_231297648()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_231297674()
{
  uint64_t v0;

  return sub_2312977E8(*(_QWORD *)(v0 + qword_255EC33F0));
}

id sub_2312976B4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudiogramDataTypeDetailViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2312976E8(uint64_t a1)
{

  return sub_2312977E8(*(_QWORD *)(a1 + qword_255EC33F0));
}

uint64_t sub_231297734()
{
  return type metadata accessor for AudiogramDataTypeDetailViewController();
}

void sub_23129773C(char *a1, uint64_t a2, void *a3)
{
  uint64_t *v4;
  void (*v5)(uint64_t);
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (uint64_t *)&a1[qword_255EC33F0];
  v5 = *(void (**)(uint64_t))&a1[qword_255EC33F0];
  v6 = a3;
  v7 = a1;
  if (v5)
  {
    v8 = sub_2312977D8((uint64_t)v5);
    v5(v8);
    sub_2312977E8((uint64_t)v5);
    v9 = *v4;
  }
  else
  {
    v9 = 0;
  }
  *v4 = 0;
  v4[1] = 0;
  sub_2312977E8(v9);

}

uint64_t sub_2312977D8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2312977E8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for HearingAdvertisableFeatureSourceProvider()
{
  return objc_opt_self();
}

uint64_t sub_231297818@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for HearingAdvertisableFeatureSourceProvider();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

BOOL sub_23129784C()
{
  void *v0;
  void *v1;

  sub_23129C350();
  v1 = v0;
  if (v0)

  return v1 != 0;
}

uint64_t sub_231297888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin36AdvertisableFeatureNoiseAvailability_activeDeviceSource;
  v2 = sub_2312BB750();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

id sub_2312978C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AdvertisableFeatureNoiseAvailability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_231297934()
{
  return type metadata accessor for AdvertisableFeatureNoiseAvailability();
}

uint64_t type metadata accessor for AdvertisableFeatureNoiseAvailability()
{
  uint64_t result;

  result = qword_255EC3578;
  if (!qword_255EC3578)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231297978()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BB750();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2312979E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v11;

  v0 = sub_2312BB750();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231297B20();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2312BCBF0;
  sub_2312BB744();
  v5 = (char *)objc_allocWithZone((Class)type metadata accessor for AdvertisableFeatureNoiseAvailability());
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(&v5[OBJC_IVAR____TtC16HearingAppPlugin36AdvertisableFeatureNoiseAvailability_activeDeviceSource], v3, v0);
  v6 = sub_23128E180(1);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = sub_2312BB75C();
  type metadata accessor for HearingEnvironmentNotificationAdvertisableFeatureSource();
  v8 = (_QWORD *)swift_allocObject();
  v8[8] = 0;
  v8[5] = 0;
  v8[6] = 0;
  swift_unknownObjectWeakInit();
  v8[2] = v6;
  v8[3] = &off_250017660;
  v8[4] = v7;
  v9 = sub_231297B88();
  *(_QWORD *)(v4 + 32) = v8;
  *(_QWORD *)(v4 + 40) = v9;
  return v4;
}

void sub_231297B20()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3588)
  {
    sub_231297BD0(255, &qword_255EC3590);
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3588);
  }
}

unint64_t sub_231297B88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EC3598;
  if (!qword_255EC3598)
  {
    v1 = type metadata accessor for HearingEnvironmentNotificationAdvertisableFeatureSource();
    result = MEMORY[0x2348D9A30](&unk_2312BD888, v1);
    atomic_store(result, (unint64_t *)&qword_255EC3598);
  }
  return result;
}

uint64_t sub_231297BD0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_231297C20()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23128D644(0, (unint64_t *)&qword_254159270, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BD4E0;
  sub_23128AC6C(0, (unint64_t *)&qword_2541596A0);
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D92BC]((id)*MEMORY[0x24BDD2918]);
  sub_23128AC6C(0, (unint64_t *)&qword_2541596B0);
  *(_QWORD *)(inited + 40) = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD35B0]);
  sub_2312BBE28();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
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
  sub_23129AB30(inited, &qword_2541596D8, &qword_254159688, 0x24BDD3F08, (unint64_t *)&unk_254159690);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_231297D78(uint64_t a1)
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
    if (sub_2312BBFE4())
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
    swift_bridgeObjectRetain();
    result = swift_retain();
    v6 = 0;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  sub_23129A4AC(0, (unint64_t *)&qword_2541596D0, &qword_254159678, 0x24BDD3DC0, (unint64_t *)&qword_254159680);
  v3 = sub_2312BBFFC();
  if (!v2)
    goto LABEL_7;
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2312BBFD8();
  sub_23128AC6C(0, &qword_254159688);
  sub_23129A534((unint64_t *)&unk_254159690, &qword_254159688);
  result = sub_2312BBE94();
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
    if (!sub_2312BBFF0())
      goto LABEL_45;
    sub_23128AC6C(0, &qword_254159688);
    swift_dynamicCast();
    v16 = v30;
LABEL_36:
    result = sub_2312BBF6C();
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
              sub_23129AAE8();
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

uint64_t sub_23129814C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD v15[2];

  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDB99B8];
  sub_23129A1B8(0, &qword_254159590, (uint64_t (*)(uint64_t))sub_23129A0B0, sub_23129A0C4, MEMORY[0x24BDB99B8]);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v15 - v10;
  sub_23128D554(0, &qword_254159710, (uint64_t (*)(uint64_t))sub_23129A0B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2312BCC00;
  *(_QWORD *)(v12 + 32) = sub_231298300(a1, a2);
  *(_QWORD *)(v12 + 40) = sub_2312985E4(a1);
  v15[1] = v12;
  sub_2312BBE28();
  sub_23129A0B0(0);
  sub_23128D554(0, &qword_254159668, (uint64_t (*)(uint64_t))sub_23129A0B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23129A0C4();
  sub_23129A228();
  sub_2312BBC18();
  sub_23129A288(&qword_254159588, &qword_254159590, v6, MEMORY[0x24BDB99D8]);
  v13 = sub_2312BBCC0();
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *a3 = v13;
  return result;
}

uint64_t sub_231298300(uint64_t a1, uint64_t a2)
{
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v25 = a1;
  v24 = a2;
  v2 = sub_2312BB504();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_23128D554(0, &qword_254159620, (uint64_t (*)(uint64_t))sub_23128F05C, MEMORY[0x24BDB9ED8]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  sub_23129A5D0(0, &qword_254159570, sub_23129A64C, (void (*)(void))sub_23129A6BC);
  v11 = *(_QWORD *)(v10 - 8);
  v27 = v10;
  v28 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - v12;
  swift_beginAccess();
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  sub_2312BBC84();
  swift_endAccess();
  sub_23129A6D8((unint64_t *)&unk_254159610, (uint64_t)&qword_254159620, (uint64_t)sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_23128D554);
  v14 = v25;
  v15 = sub_2312BBCB4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v29 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v2);
  v16 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v17 = (v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  v19 = v26;
  *(_QWORD *)(v18 + 16) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v18 + v16, (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  *(_QWORD *)(v18 + v17) = v24;
  *(_QWORD *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8)) = v19;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_23129A7A0;
  *(_QWORD *)(v20 + 24) = v18;
  sub_23129A64C(0);
  sub_231291E50();
  sub_23129A6BC();
  swift_retain();
  sub_2312BBCCC();
  swift_release();
  swift_release();
  sub_23129A854();
  v21 = v27;
  v22 = sub_2312BBCC0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v21);
  return v22;
}

uint64_t sub_2312985E4(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a1;
  v1 = sub_2312BB504();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = MEMORY[0x24BEE1328];
  sub_23128D644(0, (unint64_t *)&unk_254159630, MEMORY[0x24BEE1328], MEMORY[0x24BDB9ED8]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v21 - v8;
  sub_23129A5D0(0, &qword_254159580, (void (*)(uint64_t))sub_23129A2DC, (void (*)(void))sub_23129A340);
  v23 = v10;
  v25 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - v11;
  swift_beginAccess();
  sub_23128D644(0, (unint64_t *)&qword_254159648, v4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  sub_2312BBC84();
  swift_endAccess();
  sub_23129A6D8(&qword_254159628, (uint64_t)&unk_254159630, v4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_23128D644);
  v13 = v22;
  v14 = sub_2312BBCB4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v26 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v1);
  v15 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v16 + v15, (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  *(_QWORD *)(v16 + ((v3 + v15 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_23129A3C8;
  *(_QWORD *)(v17 + 24) = v16;
  sub_23129A2DC();
  sub_231291E50();
  sub_23129A340();
  sub_2312BBCCC();
  swift_release();
  swift_release();
  sub_23129A44C();
  v18 = v23;
  v19 = sub_2312BBCC0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v18);
  return v19;
}

uint64_t sub_2312988AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v39 = a5;
  sub_23128F05C(0);
  v40 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - v15;
  v17 = sub_2312BBBC4();
  v41 = *(_QWORD *)(v17 - 8);
  v42 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312BBBA0();
  sub_23128F0CC(a1, (uint64_t)v16);
  v20 = sub_2312BBBAC();
  v21 = sub_2312BBED0();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v38 = a4;
    v23 = v22;
    v24 = swift_slowAlloc();
    v37 = a2;
    v35 = v24;
    v44 = v24;
    *(_DWORD *)v23 = 136315395;
    v25 = sub_2312BC1E8();
    v39 = a3;
    v43 = sub_2312AE104(v25, v26, &v44);
    v36 = a6;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2081;
    sub_23128F0CC((uint64_t)v16, (uint64_t)v14);
    v27 = sub_2312BBDB0();
    v43 = sub_2312AE104(v27, v28, &v44);
    a6 = v36;
    a3 = v39;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    sub_23128F110((uint64_t)v16);
    _os_log_impl(&dword_231285000, v20, v21, "%s Received featureStatus %{private}s", (uint8_t *)v23, 0x16u);
    v29 = v35;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v29, -1, -1);
    v30 = v23;
    a4 = v38;
    MEMORY[0x2348D9AB4](v30, -1, -1);
  }
  else
  {
    sub_23128F110((uint64_t)v16);
  }

  (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v42);
  v31 = sub_2312BB51C();
  v32 = MEMORY[0x24BE47A60];
  a6[3] = v31;
  a6[4] = v32;
  v33 = sub_23129A8B4(a6);
  return sub_231298B6C(a3, a1, a4, (uint64_t)v33);
}

uint64_t sub_231298B6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;

  v60 = a3;
  v59 = a2;
  v62 = a4;
  sub_23128F05C(0);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  v57 = *(_QWORD *)(v5 - 8);
  v58 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v56 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2312BB4C8();
  v53 = *(_QWORD *)(v8 - 8);
  v54 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2312BB4E0();
  MEMORY[0x24BDAC7A8](v10);
  v63 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2312BB504();
  v13 = *(_QWORD *)(v12 - 8);
  v48 = v12;
  v14 = *(_QWORD *)(v13 + 64);
  v15 = v13;
  v50 = v13;
  v16 = MEMORY[0x24BDAC7A8](v12);
  v52 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v45 - v17;
  v55 = (char *)&v45 - v17;
  v19 = sub_23128D3DC();
  v45 = v20;
  v46 = v19;
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v49(v18, a1, v12);
  v21 = (void *)sub_2312BB4F8();
  sub_23128D554(0, &qword_2541596E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v22 = sub_2312BB3F0();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_2312BCBF0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v23 + 104))(v25 + v24, *MEMORY[0x24BE47420], v22);
  v26 = v21;
  sub_231299A6C(v25);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v27 = sub_231297C20();
  sub_231297D78(v27);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v51, *MEMORY[0x24BE47910], v54);
  sub_2312BB4D4();

  v28 = sub_2312BB528();
  v53 = v29;
  v54 = v28;
  v51 = v30;
  v47 = v31;
  v32 = v56;
  sub_23128F0CC(v59, v56);
  v33 = v52;
  v34 = v48;
  v49(v52, a1, v48);
  v35 = (*(unsigned __int8 *)(v57 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  v36 = (v58 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  v37 = v50;
  v38 = (*(unsigned __int8 *)(v50 + 80) + v36 + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  v39 = (v14 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = swift_allocObject();
  sub_23129AA10(v32, v40 + v35);
  v41 = (unint64_t *)(v40 + v36);
  v42 = v45;
  *v41 = v46;
  v41[1] = v42;
  (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v40 + v38, v33, v34);
  v43 = v61;
  *(_QWORD *)(v40 + v39) = v60;
  *(_QWORD *)(v40 + ((v39 + 15) & 0xFFFFFFFFFFFFFFF8)) = v43;
  swift_retain();
  return sub_2312BB510();
}

uint64_t sub_231298F24(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_231298F44(uint64_t a1, uint64_t a2, unint64_t a3, NSObject *a4, uint64_t a5, uint64_t a6)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v52;
  uint64_t v53;
  os_log_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v55 = a5;
  v56 = a6;
  v53 = a2;
  v54 = a4;
  v8 = sub_2312BB498();
  v57 = *(_QWORD *)(v8 - 8);
  v58 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2312BBBC4();
  v60 = *(_QWORD *)(v11 - 8);
  v61 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v59 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v52 - v14;
  sub_23128F05C(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_2312BB600();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v52 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v52 - v27;
  sub_23128F0CC(a1, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_23128F110((uint64_t)v18);
    sub_2312BBBA0();
    swift_bridgeObjectRetain_n();
    v29 = sub_2312BBBAC();
    v30 = sub_2312BBED0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      v63 = v32;
      *(_DWORD *)v31 = 136315394;
      v33 = sub_2312BC1E8();
      v62 = sub_2312AE104(v33, v34, &v63);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain();
      v62 = sub_2312AE104(v53, a3, &v63);
      sub_2312BBF9C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231285000, v29, v30, "%s Creating no feed items with identifier %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v32, -1, -1);
      MEMORY[0x2348D9AB4](v31, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v60 + 8))(v15, v61);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v28, v18, v19);
    sub_23128BACC((uint64_t)v54, (uint64_t)v28, v55, (uint64_t)v10);
    sub_2312BBBA0();
    v35 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    v35(v26, v28, v19);
    v36 = sub_2312BBBAC();
    v37 = sub_2312BBED0();
    v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      v39 = swift_slowAlloc();
      v54 = v36;
      v40 = v39;
      v55 = swift_slowAlloc();
      v63 = v55;
      *(_DWORD *)v40 = 136315395;
      v53 = v40 + 4;
      v41 = sub_2312BC1E8();
      v62 = sub_2312AE104(v41, v42, &v63);
      LODWORD(v56) = v38;
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2081;
      v53 = v40 + 14;
      v35(v23, v26, v19);
      v43 = sub_2312BBDB0();
      v62 = sub_2312AE104(v43, v44, &v63);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      v45 = *(void (**)(char *, uint64_t))(v20 + 8);
      v45(v26, v19);
      v46 = v54;
      _os_log_impl(&dword_231285000, v54, (os_log_type_t)v56, "%s Creating feed item generator for featureStatus %{private}s", (uint8_t *)v40, 0x16u);
      v47 = v55;
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v47, -1, -1);
      MEMORY[0x2348D9AB4](v40, -1, -1);

    }
    else
    {
      v45 = *(void (**)(char *, uint64_t))(v20 + 8);
      v45(v26, v19);

    }
    (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
    sub_23128D554(0, &qword_2541596F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v49 = v57;
    v50 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
    v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_2312BCBF0;
    (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v48 + v50, v10, v58);
    v45(v28, v19);
  }
  return v48;
}

uint64_t sub_2312994D0@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v27 = a3;
  v7 = sub_2312BB504();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2312BBBC4();
  v28 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312BBBA0();
  v14 = sub_2312BBBAC();
  v15 = sub_2312BBED0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v26 = v11;
    v17 = v16;
    v25 = swift_slowAlloc();
    v30 = v25;
    *(_DWORD *)v17 = 136315394;
    v24[1] = v17 + 4;
    v18 = sub_2312BC1E8();
    v27 = v8;
    v29 = sub_2312AE104(v18, v19, &v30);
    sub_2312BBF9C();
    v8 = v27;
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 1024;
    LODWORD(v29) = a1 & 1;
    sub_2312BBF9C();
    _os_log_impl(&dword_231285000, v14, v15, "%s Creating feed item generator for promotion isPromotionVisible: %{BOOL}d", (uint8_t *)v17, 0x12u);
    v20 = v25;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v20, -1, -1);
    MEMORY[0x2348D9AB4](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v11);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  v21 = type metadata accessor for HeadphoneNotificationsPromotionGenerator();
  swift_allocObject();
  v22 = sub_23129034C((uint64_t)v10, a1 & 1);
  a4[3] = v21;
  result = sub_23128A728(&qword_254159478, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsPromotionGenerator, (uint64_t)&unk_2312BCE8C);
  a4[4] = result;
  *a4 = v22;
  return result;
}

uint64_t sub_231299788(unsigned __int8 *a1, uint64_t (*a2)(_QWORD))
{
  return a2(*a1);
}

uint64_t sub_2312997AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin39HeadphoneNotificationsGeneratorPipeline_domain;
  v2 = sub_2312BB4E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23129980C()
{
  return type metadata accessor for HeadphoneNotificationsGeneratorPipeline();
}

uint64_t type metadata accessor for HeadphoneNotificationsGeneratorPipeline()
{
  uint64_t result;

  result = qword_2541593C0;
  if (!qword_2541593C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_231299850()
{
  return swift_retain();
}

uint64_t sub_231299864@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC16HearingAppPlugin39HeadphoneNotificationsGeneratorPipeline_domain;
  v4 = sub_2312BB4E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2312998AC(uint64_t a1)
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
    sub_23129A574();
    v3 = sub_2312BBFFC();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_2312BC188();
      swift_bridgeObjectRetain();
      sub_2312BBDC8();
      result = sub_2312BC1A0();
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
        if (v17 || (result = sub_2312BC128(), (result & 1) != 0))
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
            result = sub_2312BC128();
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

void sub_231299A48(unint64_t a1)
{
  sub_23129AB30(a1, &qword_2541596D8, &qword_254159688, 0x24BDD3F08, (unint64_t *)&unk_254159690);
}

uint64_t sub_231299A6C(uint64_t a1)
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
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t result;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;

  v2 = sub_2312BB3F0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v28 - v7;
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    sub_23129A1B8(0, &qword_2541596C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], sub_23129AAF0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE24D8]);
    v9 = sub_2312BBFFC();
    v10 = 0;
    v32 = v9 + 56;
    v11 = *(unsigned __int8 *)(v3 + 80);
    v29 = v8;
    v30 = a1 + ((v11 + 32) & ~v11);
    v12 = *(_QWORD *)(v3 + 72);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    while (1)
    {
      v31 = v10;
      v13(v33, v30 + v12 * v10, v2);
      sub_23129AAF0();
      v14 = sub_2312BBD50();
      v15 = ~(-1 << *(_BYTE *)(v9 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v13(v6, *(_QWORD *)(v9 + 48) + v16 * v12, v2);
          sub_23128A728(&qword_254158CC0, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], MEMORY[0x24BE47500]);
          v20 = sub_2312BBD5C();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v33, v2);
            v3 = v21;
            v8 = v29;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v8 = v29;
      }
      v23 = v33;
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v16 * v12, v23, v2);
      v25 = *(_QWORD *)(v9 + 16);
      v26 = __OFADD__(v25, 1);
      v27 = v25 + 1;
      if (v26)
        break;
      *(_QWORD *)(v9 + 16) = v27;
LABEL_4:
      v10 = v31 + 1;
      if (v31 + 1 == v8)
        return v9;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_231299CD4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
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
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(unint64_t, _QWORD, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v38 = a1;
  v47 = *v2;
  v48 = a2;
  v3 = sub_2312BB504();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v44 = v3;
  v45 = v5;
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129A1B8(0, &qword_2541595F8, (uint64_t (*)(uint64_t))sub_23129A0B0, sub_23129A0C4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDB9E80]);
  v8 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  v50 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v37 - v9;
  v39 = sub_2312BB4C8();
  v37 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2312BB4E0();
  v40 = *(_QWORD *)(v12 - 8);
  v41 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (void *)sub_2312BB4F8();
  sub_23128D554(0, &qword_2541596E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v16 = sub_2312BB3F0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 72);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2312BCC00;
  v21 = v20 + v19;
  v22 = *(void (**)(unint64_t, _QWORD, uint64_t))(v17 + 104);
  v22(v21, *MEMORY[0x24BE47420], v16);
  v22(v21 + v18, *MEMORY[0x24BE474E0], v16);
  v23 = v15;
  sub_231299A6C(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v24 = sub_231297C20();
  sub_231297D78(v24);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v11, *MEMORY[0x24BE47910], v39);
  sub_2312BB4D4();

  v25 = v43;
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v43 + OBJC_IVAR____TtC16HearingAppPlugin39HeadphoneNotificationsGeneratorPipeline_domain, v14, v41);
  v26 = v42;
  v27 = v38;
  v28 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v42, v38, v44);
  v29 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v30 = (v45 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v31 + v29, v26, v28);
  v32 = v47;
  *(_QWORD *)(v31 + v30) = v48;
  *(_QWORD *)(v31 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = v32;
  sub_23129A0B0(0);
  sub_23129A0C4();
  swift_retain();
  v33 = v46;
  sub_2312BBC60();
  sub_23129A288(&qword_2541595F0, &qword_2541595F8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDB9E80], MEMORY[0x24BDB9E90]);
  v34 = v49;
  v35 = sub_2312BBCC0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v33, v34);
  result = v25;
  *(_QWORD *)(v25 + OBJC_IVAR____TtC16HearingAppPlugin39HeadphoneNotificationsGeneratorPipeline_publisher) = v35;
  return result;
}

void sub_23129A0B0(uint64_t a1)
{
  sub_23129A660(a1, &qword_2541595A0, (void (*)(uint64_t))sub_231291E50);
}

uint64_t sub_23129A0C4()
{
  return sub_23128A728(&qword_254159598, (uint64_t (*)(uint64_t))sub_23129A0B0, MEMORY[0x24BDB9AF8]);
}

uint64_t sub_23129A0E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2312BB504();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23129A15C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_2312BB504() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_23129814C(v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)), a1);
}

void sub_23129A1B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

unint64_t sub_23129A228()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254159670;
  if (!qword_254159670)
  {
    sub_23128D554(255, &qword_254159668, (uint64_t (*)(uint64_t))sub_23129A0B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254159670);
  }
  return result;
}

uint64_t sub_23129A288(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_23129A1B8(255, a2, (uint64_t (*)(uint64_t))sub_23129A0B0, sub_23129A0C4, a3);
    result = MEMORY[0x2348D9A30](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23129A2DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541595D0)
  {
    v0 = sub_2312BBC30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541595D0);
  }
}

uint64_t sub_23129A340()
{
  return sub_23128A728(&qword_2541595C8, (uint64_t (*)(uint64_t))sub_23129A2DC, MEMORY[0x24BDB9AF8]);
}

uint64_t sub_23129A35C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2312BB504();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23129A3C8@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_2312BB504() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_2312994D0(a1, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_23129A428(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

unint64_t sub_23129A44C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254159578;
  if (!qword_254159578)
  {
    sub_23129A5D0(255, &qword_254159580, (void (*)(uint64_t))sub_23129A2DC, (void (*)(void))sub_23129A340);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BDB94C8], v1);
    atomic_store(result, (unint64_t *)&qword_254159578);
  }
  return result;
}

void sub_23129A4AC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    sub_23128AC6C(255, a3);
    sub_23129A534(a5, a3);
    v8 = sub_2312BC008();
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_23129A534(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_23128AC6C(255, a2);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23129A574()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541596C8)
  {
    v0 = sub_2312BC008();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541596C8);
  }
}

void sub_23129A5D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a3(255);
    sub_231291E50();
    a4();
    v6 = sub_2312BBBDC();
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_23129A64C(uint64_t a1)
{
  sub_23129A660(a1, &qword_2541595B0, sub_23128F05C);
}

void sub_23129A660(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2312BBC30();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23129A6BC()
{
  return sub_23128A728(&qword_2541595A8, (uint64_t (*)(uint64_t))sub_23129A64C, MEMORY[0x24BDB9AF8]);
}

uint64_t sub_23129A6D8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a4(255, a2, a3, MEMORY[0x24BDB9ED8]);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BDB9EE8], v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23129A724()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2312BB504();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23129A7A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(sub_2312BB504() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_2312988AC(a1, *(_QWORD *)(v2 + 16), v2 + v6, *(_QWORD *)(v2 + v7), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_23129A810()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23129A834()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_23129A854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254159568;
  if (!qword_254159568)
  {
    sub_23129A5D0(255, &qword_254159570, sub_23129A64C, (void (*)(void))sub_23129A6BC);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BDB94C8], v1);
    atomic_store(result, (unint64_t *)&qword_254159568);
  }
  return result;
}

uint64_t *sub_23129A8B4(uint64_t *a1)
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

uint64_t sub_23129A8F0()
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

  sub_23128F05C(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = *(_QWORD *)(v2 + 64);
  v4 = sub_2312BB504();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = sub_2312BB600();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v3, 1, v7))
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v3, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((((v10 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6), v4);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23129AA10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128F05C(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23129AA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  sub_23128F05C(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(sub_2312BB504() - 8);
  v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_231298F44(v0 + v3, *(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8), (v0 + v6), *(_QWORD *)(v0 + v7), *(_QWORD *)(v0 + ((v7 + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23129AAE8()
{
  return swift_release();
}

uint64_t sub_23129AAF0()
{
  return sub_23128A728(&qword_254159340, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], MEMORY[0x24BE474F8]);
}

void sub_23129AB0C(unint64_t a1)
{
  sub_23129AB30(a1, (unint64_t *)&qword_2541596D0, &qword_254159678, 0x24BDD3DC0, (unint64_t *)&qword_254159680);
}

void sub_23129AB30(unint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
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
    swift_bridgeObjectRetain();
    v11 = sub_2312BC08C();
    swift_bridgeObjectRelease();
    if (v11)
    {
LABEL_3:
      sub_23129A4AC(0, a2, a3, a4, a5);
      v9 = sub_2312BBFFC();
      if (!v8)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v10 = sub_2312BC08C();
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
      v14 = MEMORY[0x2348D9418](v13, v7);
      v15 = __OFADD__(v13++, 1);
      if (v15)
      {
        __break(1u);
        goto LABEL_37;
      }
      v16 = v14;
      v17 = sub_2312BBF6C();
      v18 = -1 << *(_BYTE *)(v9 + 32);
      v19 = v17 & ~v18;
      v20 = v19 >> 6;
      v21 = *(_QWORD *)(v12 + 8 * (v19 >> 6));
      v22 = 1 << v19;
      if (((1 << v19) & v21) != 0)
      {
        sub_23128AC6C(0, a3);
        v23 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v19);
        v24 = sub_2312BBF78();

        if ((v24 & 1) != 0)
        {
LABEL_11:
          sub_2312BBA5C();
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
          v27 = sub_2312BBF78();

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
    v32 = sub_2312BBF6C();
    v33 = -1 << *(_BYTE *)(v9 + 32);
    v34 = v32 & ~v33;
    v35 = v34 >> 6;
    v36 = *(_QWORD *)(v12 + 8 * (v34 >> 6));
    v37 = 1 << v34;
    if (((1 << v34) & v36) != 0)
    {
      sub_23128AC6C(0, a3);
      v38 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v34);
      v39 = sub_2312BBF78();

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
          v42 = sub_2312BBF78();

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

uint64_t sub_23129AEA8()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    v1 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    sub_23128D554(0, (unint64_t *)&unk_254159798, (uint64_t (*)(uint64_t))sub_231292A38, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_2312BCCC0;
    *(_QWORD *)(v1 + 56) = &type metadata for HearingHealthArticleDataProvider;
    *(_QWORD *)(v1 + 64) = sub_231292C00();
    *(_QWORD *)(v1 + 72) = sub_231292C44();
    *(_QWORD *)(v1 + 104) = &type metadata for AudiogramArticleDataProvider;
    *(_QWORD *)(v1 + 112) = sub_231292B78();
    *(_QWORD *)(v1 + 120) = sub_231292BBC();
    *(_QWORD *)(v1 + 152) = &type metadata for HeadphoneListeningArticleDataProvider;
    *(_QWORD *)(v1 + 160) = sub_2312929B0();
    *(_QWORD *)(v1 + 168) = sub_2312929F4();
    *(_QWORD *)(v0 + 16) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *sub_23129AF7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  unint64_t v21;
  unint64_t v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  int v36;
  os_log_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = sub_2312BB504();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v35 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v35 - v7, a1, v2);
  v10 = sub_2312BBBAC();
  v11 = sub_2312BBED0();
  v12 = v11;
  if (os_log_type_enabled(v10, v11))
  {
    v13 = swift_slowAlloc();
    v39 = v6;
    v14 = v13;
    v38 = swift_slowAlloc();
    v42 = v38;
    *(_DWORD *)v14 = 136446466;
    v37 = v10;
    v15 = sub_2312BC1E8();
    v17 = sub_2312AE104(v15, v16, &v42);
    v40 = a1;
    v41 = v17;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    v35 = v14 + 14;
    v18 = (void *)sub_2312BB4F8();
    v19 = sub_2312BB414();
    v36 = v12;
    v20 = v9;
    v22 = v21;

    v41 = sub_2312AE104(v19, v22, &v42);
    a1 = v40;
    sub_2312BBF9C();
    v9 = v20;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    v23 = v37;
    _os_log_impl(&dword_231285000, v37, (os_log_type_t)v36, "[%{public}s] Creating generator pipelines for %{public}s profile", (uint8_t *)v14, 0x16u);
    v24 = v38;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v24, -1, -1);
    v25 = v14;
    v6 = v39;
    MEMORY[0x2348D9AB4](v25, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  v26 = sub_2312BB4F8();
  if (v26)
  {
    v27 = (void *)v26;
    v28 = (void *)sub_2312BB42C();
    v29 = sub_2312BB420();

    if ((v29 & 1) != 0)
      return sub_23129B4C4(a1);
    else
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    sub_23128D554(0, &qword_254159700, (uint64_t (*)(uint64_t))sub_23129B86C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_2312BCBF0;
    v9(v6, a1, v2);
    sub_23129AEA8();
    sub_23129B8C0();
    v32 = v31;
    swift_allocObject();
    v33 = sub_2312BBB64();
    *(_QWORD *)(v30 + 56) = v32;
    *(_QWORD *)(v30 + 64) = sub_23128A728(&qword_254159248, (uint64_t (*)(uint64_t))sub_23129B8C0, MEMORY[0x24BE3F870]);
    *(_QWORD *)(v30 + 32) = v33;
  }
  return (_QWORD *)v30;
}

uint64_t sub_23129B2E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin24HearingAppPluginDelegate_logger;
  v2 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23129B33C()
{
  return type metadata accessor for HearingAppPluginDelegate();
}

uint64_t type metadata accessor for HearingAppPluginDelegate()
{
  uint64_t result;

  result = qword_254159280;
  if (!qword_254159280)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23129B380()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BBBC4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23129B3F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for HearingAppPluginDelegate();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  v3 = OBJC_IVAR____TtC16HearingAppPlugin24HearingAppPluginDelegate_logger;
  if (qword_2541597A8 != -1)
    swift_once();
  v4 = sub_2312BBBC4();
  v5 = sub_23128A1E0(v4, (uint64_t)qword_25415A9C0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v2 + v3, v5, v4);
  *a1 = v2;
  return result;
}

_QWORD *sub_23129B4A0(uint64_t a1)
{
  return sub_23129AF7C(a1);
}

_QWORD *sub_23129B4C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  char v8;
  void (*v9)(char *, uint64_t, uint64_t);
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v23;
  uint64_t v24;
  __int128 v25[2];
  _BYTE v26[40];
  __int128 v27;
  _QWORD v28[5];
  _QWORD v29[6];

  v2 = sub_2312BB504();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)sub_2312BB4F8();
  v7 = (void *)sub_2312BB42C();
  v8 = sub_2312BB420();

  if ((v8 & 1) == 0)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v27 = xmmword_2312BCC00;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9(v5, a1, v2);
  v10 = objc_allocWithZone((Class)type metadata accessor for NoiseAvailability());
  v11 = sub_23128E180(0);
  v12 = type metadata accessor for NoiseNotificationsGeneratorPipeline();
  swift_allocObject();
  v13 = sub_2312B00A8((uint64_t)v5, v11);

  v28[3] = v12;
  v28[4] = sub_23128A728(&qword_254158F68, (uint64_t (*)(uint64_t))type metadata accessor for NoiseNotificationsGeneratorPipeline, (uint64_t)&unk_2312BE334);
  v28[0] = v13;
  v9(v5, a1, v2);
  type metadata accessor for HeadphoneNotificationsAvailability();
  swift_allocObject();
  v14 = sub_2312ABB14();
  v15 = type metadata accessor for HeadphoneNotificationsGeneratorPipeline();
  swift_allocObject();
  v16 = sub_231299CD4((uint64_t)v5, v14);
  swift_release();
  v29[3] = v15;
  v29[4] = sub_23128A728(&qword_2541593B8, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsGeneratorPipeline, (uint64_t)&unk_2312BD538);
  v29[0] = v16;
  sub_23129B95C((uint64_t)v28, (uint64_t)v26);
  sub_23129B9B8((uint64_t)v26, (uint64_t)&v23);
  if (v24)
  {
    sub_23128B850(&v23, (uint64_t)v25);
    sub_23128B850(v25, (uint64_t)&v23);
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v17 = sub_2312B3624(0, v17[2] + 1, 1, v17);
    v19 = v17[2];
    v18 = v17[3];
    if (v19 >= v18 >> 1)
      v17 = sub_2312B3624((_QWORD *)(v18 > 1), v19 + 1, 1, v17);
    v17[2] = v19 + 1;
    sub_23128B850(&v23, (uint64_t)&v17[5 * v19 + 4]);
  }
  else
  {
    sub_23129BA14((uint64_t)&v23);
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  sub_23129B95C((uint64_t)v29, (uint64_t)v26);
  sub_23129B9B8((uint64_t)v26, (uint64_t)&v23);
  if (v24)
  {
    sub_23128B850(&v23, (uint64_t)v25);
    sub_23128B850(v25, (uint64_t)&v23);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v17 = sub_2312B3624(0, v17[2] + 1, 1, v17);
    v21 = v17[2];
    v20 = v17[3];
    if (v21 >= v20 >> 1)
      v17 = sub_2312B3624((_QWORD *)(v20 > 1), v21 + 1, 1, v17);
    v17[2] = v21 + 1;
    sub_23128B850(&v23, (uint64_t)&v17[5 * v21 + 4]);
  }
  else
  {
    sub_23129BA14((uint64_t)&v23);
  }
  sub_23128D554(0, &qword_254159278, (uint64_t (*)(uint64_t))sub_23129B86C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  swift_arrayDestroy();
  return v17;
}

unint64_t sub_23129B86C()
{
  unint64_t result;

  result = qword_254159350;
  if (!qword_254159350)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254159350);
  }
  return result;
}

void sub_23129B8C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159250)
  {
    sub_23129B918();
    v0 = sub_2312BBB70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159250);
  }
}

unint64_t sub_23129B918()
{
  unint64_t result;

  result = qword_254158F60;
  if (!qword_254158F60)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BCFE4, &type metadata for EducationArticleTileDataController);
    atomic_store(result, (unint64_t *)&qword_254158F60);
  }
  return result;
}

uint64_t sub_23129B95C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128D554(0, &qword_254159278, (uint64_t (*)(uint64_t))sub_23129B86C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23129B9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128D554(0, &qword_254159278, (uint64_t (*)(uint64_t))sub_23129B86C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23129BA14(uint64_t a1)
{
  uint64_t v2;

  sub_23128D554(0, &qword_254159278, (uint64_t (*)(uint64_t))sub_23129B86C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23129BA68@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;

  if (qword_254159760 != -1)
    swift_once();
  v2 = objc_msgSend((id)qword_25415A948, sel_noiseThresholdFooterLinkURL);
  sub_2312BB378();

  v3 = sub_2312BB390();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a1, 0, 1, v3);
}

uint64_t sub_23129BAF8()
{
  if (qword_2541597F0 != -1)
    swift_once();
  return sub_2312BB354();
}

unint64_t sub_23129BB8C()
{
  return 0xD000000000000013;
}

uint64_t sub_23129BBA8()
{
  id v0;

  if (qword_2541597F0 != -1)
    swift_once();
  v0 = (id)qword_25415A9E8;
  return sub_2312BB624();
}

uint64_t sub_23129BC18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
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
  char v34;
  uint64_t v35;
  __int128 v37;

  v2 = sub_2312BB600();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE41298])
  {
    if (qword_254159760 != -1)
      swift_once();
    v7 = (void *)qword_25415A948;
    v8 = objc_msgSend((id)qword_25415A948, sel_localizedNoiseThresholdValue_, objc_msgSend((id)qword_25415A948, sel_noiseThresholdCurrentValue));
    v9 = sub_2312BBD98();
    v11 = v10;

    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    sub_23129C2FC();
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_2312BCBF0;
    *(_QWORD *)(v12 + 56) = MEMORY[0x24BEE0D00];
    v13 = sub_23128D600();
    *(_QWORD *)(v12 + 64) = v13;
    *(_QWORD *)(v12 + 32) = v9;
    *(_QWORD *)(v12 + 40) = v11;
    swift_bridgeObjectRetain();
    v14 = sub_2312BBD74();
    v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v7, sel_noiseThresholdMinutesThreshold);
    sub_2312BB354();
    v18 = swift_allocObject();
    v37 = xmmword_2312BCC00;
    *(_OWORD *)(v18 + 16) = xmmword_2312BCC00;
    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v18 + 64) = v13;
    v19 = MEMORY[0x24BEE1768];
    *(_QWORD *)(v18 + 32) = v9;
    *(_QWORD *)(v18 + 40) = v11;
    v20 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v18 + 96) = v19;
    *(_QWORD *)(v18 + 104) = v20;
    *(_QWORD *)(v18 + 72) = v17;
    v21 = sub_2312BBD74();
    v23 = v22;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23129C2A8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v37;
    *(_QWORD *)(v24 + 32) = v14;
    *(_QWORD *)(v24 + 40) = v16;
    *(_QWORD *)(v24 + 48) = v21;
    *(_QWORD *)(v24 + 56) = v23;
  }
  else if (v6 == *MEMORY[0x24BE412A0])
  {
    sub_23129C2A8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_2312BCC00;
    if (qword_2541597F0 != -1)
      swift_once();
    *(_QWORD *)(v24 + 32) = sub_2312BB354();
    *(_QWORD *)(v24 + 40) = v25;
    *(_QWORD *)(v24 + 48) = sub_2312BB354();
    *(_QWORD *)(v24 + 56) = v26;
  }
  else if (v6 == *MEMORY[0x24BE41288])
  {
    v27 = sub_2312BB69C();
    v29 = v28;
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    sub_23129C2A8();
    v24 = swift_allocObject();
    v37 = xmmword_2312BCBF0;
    *(_OWORD *)(v24 + 16) = xmmword_2312BCBF0;
    sub_23129C2FC();
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = v37;
    *(_QWORD *)(v30 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v30 + 64) = sub_23128D600();
    *(_QWORD *)(v30 + 32) = v27;
    *(_QWORD *)(v30 + 40) = v29;
    v31 = sub_2312BBD74();
    v33 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v24 + 32) = v31;
    *(_QWORD *)(v24 + 40) = v33;
  }
  else if (v6 == *MEMORY[0x24BE41280])
  {
    v34 = sub_2312BB678();
    sub_23129C2A8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_2312BCBF0;
    if ((v34 & 1) != 0)
    {
      if (qword_2541597F0 != -1)
        swift_once();
    }
    else if (qword_2541597F0 != -1)
    {
      swift_once();
    }
    *(_QWORD *)(v24 + 32) = sub_2312BB354();
    *(_QWORD *)(v24 + 40) = v35;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return MEMORY[0x24BEE4AF8];
  }
  return v24;
}

void sub_23129C2A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159718)
  {
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159718);
  }
}

void sub_23129C2FC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159728)
  {
    sub_23128D5AC();
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159728);
  }
}

void sub_23129C350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t aBlock;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  uint64_t (*v29)();
  uint64_t v30;

  v1 = v0;
  v2 = sub_2312BB750();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE41CB8])
  {
    v7 = (void *)objc_opt_self();
    v8 = objc_msgSend(v7, sel_sharedInstance);
    if (!v8)
    {
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v9 = v8;
    v10 = (uint64_t (*)())objc_msgSend(v7, sel_activePairedDeviceSelectorBlock);
    if (v10)
    {
      v11 = swift_allocObject();
      *(_QWORD *)(v11 + 16) = v10;
      v12 = swift_allocObject();
      v10 = sub_23129C7E0;
      *(_QWORD *)(v12 + 16) = sub_23129C7E0;
      *(_QWORD *)(v12 + 24) = v11;
      v29 = sub_23129C810;
      v30 = v12;
      aBlock = MEMORY[0x24BDAC760];
      v26 = 1107296256;
      v27 = sub_23129C834;
      v28 = &unk_250017370;
      v13 = _Block_copy(&aBlock);
      swift_release();
    }
    else
    {
      v13 = 0;
    }
    v20 = objc_msgSend(v9, sel_getAllDevicesWithArchivedDevicesMatching_, v13);
    sub_2312977E8((uint64_t)v10);
    _Block_release(v13);

    if (!v20)
      goto LABEL_32;
    sub_23129C780();
    v16 = sub_2312BBE10();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      v23 = sub_2312BC08C();
      swift_bridgeObjectRelease();
      if (!v23)
        goto LABEL_24;
    }
    else if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_24;
    }
    if ((v16 & 0xC000000000000001) != 0)
      goto LABEL_27;
    if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_23:
      v22 = *(id *)(v16 + 32);
      goto LABEL_24;
    }
    __break(1u);
  }
  else
  {
    if (v6 != *MEMORY[0x24BE41CC0])
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return;
    }
    v14 = (void *)objc_opt_self();
    v15 = (id *)objc_msgSend(v14, sel_sharedInstance);
    if (!v15)
      goto LABEL_33;
    v16 = (unint64_t)v15;
    v10 = (uint64_t (*)())objc_msgSend(v14, sel_activeDeviceSelectorBlock);
    if (v10)
    {
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = v10;
      v18 = swift_allocObject();
      v10 = sub_23129C8B0;
      *(_QWORD *)(v18 + 16) = sub_23129C8B0;
      *(_QWORD *)(v18 + 24) = v17;
      v29 = sub_23129C8AC;
      v30 = v18;
      aBlock = MEMORY[0x24BDAC760];
      v26 = 1107296256;
      v27 = sub_23129C834;
      v28 = &unk_2500173E8;
      v19 = _Block_copy(&aBlock);
      swift_release();
      goto LABEL_18;
    }
  }
  v19 = 0;
LABEL_18:
  v21 = objc_msgSend((id)v16, sel_getAllDevicesWithArchivedDevicesMatching_, v19);
  sub_2312977E8((uint64_t)v10);
  _Block_release(v19);

  if (v21)
  {
    sub_23129C780();
    v16 = sub_2312BBE10();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_2312BC08C();
      swift_bridgeObjectRelease();
      if (!v24)
        goto LABEL_24;
LABEL_21:
      if ((v16 & 0xC000000000000001) == 0)
      {
        if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_23;
        __break(1u);
        goto LABEL_31;
      }
LABEL_27:
      MEMORY[0x2348D9418](0, v16);
      goto LABEL_24;
    }
    if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_21;
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_34:
  __break(1u);
}

unint64_t sub_23129C780()
{
  unint64_t result;

  result = qword_255EC35A0;
  if (!qword_255EC35A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC35A0);
  }
  return result;
}

uint64_t sub_23129C7BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23129C7E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23129C800()
{
  return swift_deallocObject();
}

uint64_t sub_23129C810()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_23129C834(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t (*v3)(void *);
  id v4;

  v2 = a2;
  v3 = *(uint64_t (**)(void *))(a1 + 32);
  v4 = a2;
  LOBYTE(v2) = v3(v2);

  return v2 & 1;
}

uint64_t sub_23129C878(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23129C888()
{
  return swift_release();
}

uint64_t sub_23129C890()
{
  return swift_deallocObject();
}

uint64_t PDFVStackWithMinimumWidth.allowsMultiplePages.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

double PDFVStackWithMinimumWidth.init(spacing:allowsMultiplePages:_:)(double a1, uint64_t a2, void (*a3)(void))
{
  a3();
  return a1;
}

uint64_t PDFVStackWithMinimumWidth.init(spacing:allowsMultiplePages:_:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

void PDFVStackWithMinimumWidth.render(context:document:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a3 + 16);
  if (v4)
  {
    v7 = a3 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      if (v5 == v4)
      {
        v11 = 0u;
        v12 = 0u;
        v5 = v4;
        v10 = 0u;
      }
      else
      {
        if (v5 >= v4)
        {
          __break(1u);
          return;
        }
        sub_231296FF8(v7 + 40 * v5, (uint64_t)v9);
        *(_QWORD *)&v10 = v5;
        sub_23128B850(v9, (uint64_t)&v10 + 8);
        ++v5;
      }
      sub_23129703C((uint64_t)&v10, (uint64_t)&v13);
      if (!v15)
      {
        swift_bridgeObjectRelease();
        return;
      }
      v6 = v13;
      sub_23128B850(&v14, (uint64_t)&v10);
      if ((a4 & 1) != 0)
      {
        sub_23128B868(&v10, *((uint64_t *)&v11 + 1));
        sub_2312BB810();
        if ((sub_2312BB7B0() & 1) == 0 && (sub_2312BB7A4() & 1) != 0)
          sub_2312BB7C8();
      }
      sub_23128B868(&v10, *((uint64_t *)&v11 + 1));
      sub_2312BB81C();
      if (v6 < (uint64_t)(v4 - 1))
        sub_2312BB7D4();
      sub_23128B88C((uint64_t)&v10);
    }
  }
}

double PDFVStackWithMinimumWidth.boundingRectForContent(in:)(uint64_t a1, uint64_t a2, char a3, double a4)
{
  _QWORD *v5;
  double v6;
  double v7;
  double v8;

  if ((a3 & 1) == 0)
    return PDFVStackWithMinimumWidth.minimumBoundingRectForAllContent(in:)(a4, a1, a2);
  if (*(_QWORD *)(a2 + 16))
  {
    v5 = (_QWORD *)(a2 + 32);
    sub_2312BB7EC();
    sub_23128B868(v5, *(_QWORD *)(a2 + 56));
    sub_2312BB810();
    sub_2312BB78C();
    v7 = v6;
    swift_release();
  }
  else
  {
    sub_2312BB78C();
    return v8;
  }
  return v7;
}

double PDFVStackWithMinimumWidth.minimumBoundingRectForContent(in:)(uint64_t a1, uint64_t a2, char a3, double a4)
{
  _QWORD *v5;
  double v6;
  double v7;
  double v8;

  if ((a3 & 1) == 0)
    return PDFVStackWithMinimumWidth.minimumBoundingRectForAllContent(in:)(a4, a1, a2);
  if (*(_QWORD *)(a2 + 16))
  {
    v5 = (_QWORD *)(a2 + 32);
    sub_2312BB7EC();
    sub_23128B868(v5, *(_QWORD *)(a2 + 56));
    sub_2312BB810();
    sub_2312BB78C();
    v7 = v6;
    swift_release();
  }
  else
  {
    sub_2312BB78C();
    return v8;
  }
  return v7;
}

double sub_23129CCA0(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  double v4;
  double v5;
  double v6;

  if (a2[2])
  {
    v3 = a2 + 4;
    sub_2312BB7EC();
    sub_23128B868(v3, a2[7]);
    sub_2312BB810();
    sub_2312BB78C();
    v5 = v4;
    swift_release();
  }
  else
  {
    sub_2312BB78C();
    return v6;
  }
  return v5;
}

double PDFVStackWithMinimumWidth.minimumBoundingRectForAllContent(in:)(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  double v8;
  BOOL v9;
  double v10;
  uint64_t v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  _QWORD v26[4];
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    sub_2312BB7EC();
    v6 = *(_QWORD *)(a3 + 16);
    v7 = (v6 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0.0;
    v9 = v6 < 2 || v7 == 0;
    v10 = 0.0;
    if (!v9)
    {
      swift_bridgeObjectRetain();
      v11 = a3 + 32;
      do
      {
        sub_231296FF8(v11, (uint64_t)v26);
        sub_23128B868(v26, v26[3]);
        sub_2312BB810();
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        v16 = v10 + CGRectGetHeight(v27);
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        CGRectGetHeight(v28);
        sub_2312BB7D4();
        sub_2312BB7D4();
        v10 = v16 + a1;
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        v17 = CGRectGetWidth(v29);
        if (v8 <= v17)
          v8 = v17;
        sub_23128B88C((uint64_t)v26);
        v11 += 40;
        --v7;
      }
      while (v7);
      sub_2312BBA5C();
    }
    sub_23128B868((_QWORD *)(a3 + 32 + 40 * v3 - 40), *(_QWORD *)(a3 + 32 + 40 * v3 - 16));
    sub_2312BB810();
    v18 = v30.origin.x;
    v19 = v30.origin.y;
    v20 = v30.size.width;
    v21 = v30.size.height;
    CGRectGetHeight(v30);
    v31.origin.x = v18;
    v31.origin.y = v19;
    v31.size.width = v20;
    v31.size.height = v21;
    CGRectGetWidth(v31);
    sub_2312BB78C();
    CGRectGetWidth(v32);
    sub_2312BB78C();
    v23 = v22;
    swift_release();
  }
  else
  {
    sub_2312BB78C();
    return v24;
  }
  return v23;
}

unint64_t sub_23129CF80()
{
  unint64_t result;

  result = qword_255EC35A8;
  if (!qword_255EC35A8)
  {
    result = MEMORY[0x2348D9A30](&protocol conformance descriptor for PDFVStackWithMinimumWidth, &type metadata for PDFVStackWithMinimumWidth);
    atomic_store(result, (unint64_t *)&qword_255EC35A8);
  }
  return result;
}

void sub_23129CFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  PDFVStackWithMinimumWidth.render(context:document:)(a1, a2, *(_QWORD *)v2, *(_BYTE *)(v2 + 16));
}

double sub_23129CFD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  if (*(_BYTE *)(v1 + 16) == 1)
    return sub_23129CCA0(a1, v2);
  else
    return PDFVStackWithMinimumWidth.minimumBoundingRectForAllContent(in:)(*(double *)(v1 + 8), a1, (uint64_t)v2);
}

uint64_t sub_23129D010()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23129D1F0();
  *v1 = v0;
  v1[1] = sub_231296D00;
  return sub_2312BB888();
}

uint64_t sub_23129D078(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PDFVStackWithMinimumWidth(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for PDFVStackWithMinimumWidth(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PDFVStackWithMinimumWidth(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PDFVStackWithMinimumWidth(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PDFVStackWithMinimumWidth(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PDFVStackWithMinimumWidth()
{
  return &type metadata for PDFVStackWithMinimumWidth;
}

unint64_t sub_23129D1F0()
{
  unint64_t result;

  result = qword_255EC35B8;
  if (!qword_255EC35B8)
  {
    result = MEMORY[0x2348D9A30](&protocol conformance descriptor for PDFVStackWithMinimumWidth, &type metadata for PDFVStackWithMinimumWidth);
    atomic_store(result, (unint64_t *)&qword_255EC35B8);
  }
  return result;
}

double PDFVStackWithReducedWidth.subtractingWidth.getter(double a1, double a2)
{
  return a2;
}

double PDFVStackWithReducedWidth.init(subtractingWidth:spacing:_:)(void (*a1)(void), double a2, double a3)
{
  a1();
  return a3;
}

uint64_t PDFVStackWithReducedWidth.render(context:document:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, uint64_t);
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v0 = sub_2312BBB58();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312BB7EC();
  sub_2312BB78C();
  CGRectGetWidth(v15);
  sub_2312BB7BC();
  swift_bridgeObjectRetain();
  sub_2312BBB4C();
  sub_2312BBB40();
  v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_2312BB7EC();
  sub_2312BB78C();
  CGRectGetWidth(v16);
  sub_2312BB7BC();
  swift_bridgeObjectRetain();
  sub_2312BBB4C();
  sub_2312BBB34();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_release();
  v4(v3, v0);
  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  CGRectGetHeight(v17);
  sub_2312BB7D4();
  return swift_release();
}

double PDFVStackWithReducedWidth.boundingRectForContent(in:)(uint64_t a1, uint64_t a2)
{
  return sub_23129D440(a1, a2, (double (*)(uint64_t))MEMORY[0x24BE45398]);
}

double PDFVStackWithReducedWidth.minimumBoundingRectForContent(in:)(uint64_t a1, uint64_t a2)
{
  return sub_23129D440(a1, a2, MEMORY[0x24BE453A0]);
}

double sub_23129D440(uint64_t a1, uint64_t a2, double (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  uint64_t v11;
  CGRect v12;

  v4 = sub_2312BBB58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2312BB7EC();
  sub_2312BB78C();
  CGRectGetWidth(v12);
  sub_2312BB7BC();
  swift_bridgeObjectRetain();
  sub_2312BBB4C();
  v9 = a3(v8);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

unint64_t sub_23129D568()
{
  unint64_t result;

  result = qword_255EC35C0;
  if (!qword_255EC35C0)
  {
    result = MEMORY[0x2348D9A30](&protocol conformance descriptor for PDFVStackWithReducedWidth, &type metadata for PDFVStackWithReducedWidth);
    atomic_store(result, (unint64_t *)&qword_255EC35C0);
  }
  return result;
}

uint64_t sub_23129D5AC()
{
  return PDFVStackWithReducedWidth.render(context:document:)();
}

double sub_23129D5B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23129D5D0(a1, a2, a3, (double (*)(uint64_t))MEMORY[0x24BE45398]);
}

double sub_23129D5C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23129D5D0(a1, a2, a3, MEMORY[0x24BE453A0]);
}

double sub_23129D5D0(uint64_t a1, uint64_t a2, uint64_t a3, double (*a4)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  double v10;
  uint64_t v12;
  CGRect v13;

  v5 = sub_2312BBB58();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2312BB7EC();
  sub_2312BB78C();
  CGRectGetWidth(v13);
  sub_2312BB7BC();
  swift_bridgeObjectRetain();
  sub_2312BBB4C();
  v10 = a4(v9);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

uint64_t sub_23129D6F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23129D768();
  *v1 = v0;
  v1[1] = sub_231296D00;
  return sub_2312BB888();
}

ValueMetadata *type metadata accessor for PDFVStackWithReducedWidth()
{
  return &type metadata for PDFVStackWithReducedWidth;
}

unint64_t sub_23129D768()
{
  unint64_t result;

  result = qword_255EC35D0;
  if (!qword_255EC35D0)
  {
    result = MEMORY[0x2348D9A30](&protocol conformance descriptor for PDFVStackWithReducedWidth, &type metadata for PDFVStackWithReducedWidth);
    atomic_store(result, (unint64_t *)&qword_255EC35D0);
  }
  return result;
}

id sub_23129D830()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider()
{
  return objc_opt_self();
}

uint64_t sub_23129D890()
{
  return sub_2312BB93C();
}

id sub_23129D8C4()
{
  _QWORD *v0;

  return objc_retain(*(id *)(*v0
                           + OBJC_IVAR____TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider_dataType));
}

id sub_23129D8D8()
{
  void *v0;

  if (qword_254159760 != -1)
    swift_once();
  v0 = (void *)qword_25415A948;
  objc_msgSend((id)qword_25415A948, sel_setNoiseEnabled_, 0);
  objc_msgSend(v0, sel_setNotificationsEnabled_, 0);
  return objc_msgSend(v0, sel_setOnboardingCompleted_, 0);
}

void sub_23129D95C(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[10];

  if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
  {
    v2 = (void *)sub_2312BBD68();
    v3 = (void *)sub_2312BBD68();
    v4 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v2, v3, 1);

    v5 = (void *)sub_2312BBD68();
    v6 = (void *)objc_opt_self();
    v7 = objc_msgSend(v6, sel_actionWithTitle_style_handler_, v5, 1, 0);

    objc_msgSend(v4, sel_addAction_, v7);
    v8 = (void *)sub_2312BBD68();
    objc_msgSend(v4, sel_setMessage_, v8);

    if ((sub_2312BB660() & 1) != 0)
    {
      if (qword_254159768 != -1)
        swift_once();
      sub_23128FA58((uint64_t)&unk_25415A950, (uint64_t)aBlock);
      sub_23128FA94((uint64_t)aBlock, (uint64_t)v16);
      v9 = v17;
      if (v17)
      {
        v10 = v18;
        sub_23128B868(v16, v17);
        v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
        sub_23128B88C((uint64_t)v16);
        sub_23128FB54((uint64_t)aBlock);
        if ((v11 & 1) != 0)
        {
          v12 = (void *)sub_2312BBD68();
          objc_msgSend(v4, sel_setMessage_, v12);

          v13 = (void *)sub_2312BBD68();
          aBlock[4] = sub_23129D8D8;
          aBlock[5] = 0;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_231288F40;
          aBlock[3] = &unk_250017590;
          v14 = _Block_copy(aBlock);
          swift_release();
          v15 = objc_msgSend(v6, sel_actionWithTitle_style_handler_, v13, 2, v14);
          _Block_release(v14);

          objc_msgSend(v4, sel_addAction_, v15);
        }
      }
      else
      {
        sub_23128FAF8((uint64_t)v16);
        sub_23128FB54((uint64_t)aBlock);
      }
    }
    objc_msgSend(a1, sel_presentViewController_animated_completion_, v4, 1, 0);

  }
}

uint64_t sub_23129DC64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23129DC74()
{
  return swift_release();
}

unint64_t sub_23129DC7C()
{
  unint64_t result;

  result = qword_2541596A0;
  if (!qword_2541596A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2541596A0);
  }
  return result;
}

uint64_t sub_23129DCB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[2];

  v17[1] = a1;
  v2 = sub_2312BB630();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129DF50();
  v6 = *(void **)(v1 + 40);
  if (v6)
  {
    v7 = *(id *)(v1 + 40);
  }
  else
  {
    if (qword_2541597F0 != -1)
      swift_once();
    v7 = (id)qword_25415A9E8;
    v6 = 0;
  }
  v8 = v6;
  sub_2312BB354();

  v9 = *(void **)(v1 + 40);
  if (v9)
  {
    v10 = *(id *)(v1 + 40);
  }
  else
  {
    if (qword_2541597F0 != -1)
      swift_once();
    v10 = (id)qword_25415A9E8;
    v9 = 0;
  }
  v11 = v9;
  sub_2312BB354();

  v12 = *(void **)(v1 + 40);
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    if (qword_2541597F0 != -1)
      swift_once();
    v13 = (id)qword_25415A9E8;
    v12 = 0;
  }
  v14 = v13;
  v15 = v12;
  sub_2312BB624();
  if (!sub_2312BB618())
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_2312BB72C();
}

uint64_t sub_23129DF50()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t ObjectType;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v1 = v0;
  sub_23129EEC4(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EEE0(0);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EEFC();
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EF78();
  result = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v1[6])
  {
    v27 = v12;
    v28 = result;
    v20 = v1[3];
    v29 = v17;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(ObjectType, v20);
    sub_23129F0EC((unint64_t *)&unk_254159610, 255, (uint64_t (*)(uint64_t))sub_23129EEE0, MEMORY[0x24BDB9EE8]);
    sub_2312BBCF0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v30 = (id)v1[4];
    v22 = v30;
    v23 = sub_2312BBEF4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v4, 1, 1, v23);
    sub_23129F048();
    sub_23129F0EC((unint64_t *)&unk_255EC39B0, 255, (uint64_t (*)(uint64_t))sub_23129EEFC, MEMORY[0x24BDB96F8]);
    sub_23129F0EC((unint64_t *)&qword_255EC37A0, 255, (uint64_t (*)(uint64_t))sub_23129F048, MEMORY[0x24BEE5670]);
    v24 = v22;
    sub_2312BBCE4();
    sub_23129F084((uint64_t)v4, (uint64_t (*)(_QWORD))sub_23129EEC4);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v11);
    swift_allocObject();
    swift_weakInit();
    sub_23129F0EC(qword_255EC37A8, 255, (uint64_t (*)(uint64_t))sub_23129EF78, MEMORY[0x24BDB9A08]);
    v25 = v28;
    v26 = sub_2312BBCFC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v25);
    v1[6] = v26;
    return swift_release();
  }
  return result;
}

uint64_t sub_23129E248()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result + 56;
    swift_beginAccess();
    if (MEMORY[0x2348D9B2C](v1))
    {
      swift_getObjectType();
      sub_23129F0EC((unint64_t *)&qword_255EC3598, v2, (uint64_t (*)(uint64_t))type metadata accessor for HearingEnvironmentNotificationAdvertisableFeatureSource, (uint64_t)&unk_2312BD888);
      sub_23129E334();
      sub_2312BB738();
      swift_release();
      return sub_2312BBA5C();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_23129E334()
{
  uint64_t *v0;
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
  char *v22;
  uint64_t v23;
  uint64_t ObjectType;
  int v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  int v28;
  uint64_t v29;
  char *v30;
  char *v31;
  int v32;
  void (*v33)(char *, uint64_t);
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;

  v49 = *v0;
  v1 = sub_2312BBBC4();
  v51 = *(_QWORD *)(v1 - 8);
  v52 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v54 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2312BB600();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v47 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EE64();
  v7 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128F05C(0);
  v50 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v48 = (uint64_t)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v53 = (char *)&v47 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v47 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v47 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v47 - v21;
  v23 = v0[3];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(ObjectType, v23);
  v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 24))(ObjectType, v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v20, *MEMORY[0x24BE412A0], v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v20, 0, 1, v3);
  v26 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_23128F0CC((uint64_t)v22, (uint64_t)v9);
  sub_23128F0CC((uint64_t)v20, v26);
  v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v27((uint64_t)v9, 1, v3) == 1)
  {
    sub_23129F084((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23128F05C);
    v28 = v27(v26, 1, v3);
    v29 = (uint64_t)v53;
    if (v28 == 1)
    {
      sub_23129F084((uint64_t)v9, (uint64_t (*)(_QWORD))sub_23128F05C);
      v30 = v54;
      if ((v25 & 1) == 0)
        goto LABEL_10;
LABEL_9:
      sub_23129F084((uint64_t)v22, (uint64_t (*)(_QWORD))sub_23128F05C);
      return 1;
    }
    goto LABEL_7;
  }
  sub_23128F0CC((uint64_t)v9, (uint64_t)v17);
  if (v27(v26, 1, v3) == 1)
  {
    sub_23129F084((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23128F05C);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v17, v3);
    v29 = (uint64_t)v53;
LABEL_7:
    sub_23129F084((uint64_t)v9, (uint64_t (*)(_QWORD))sub_23129EE64);
    v30 = v54;
    goto LABEL_10;
  }
  v31 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v47, v26, v3);
  sub_23129F0EC(&qword_255EC3790, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE412A8], MEMORY[0x24BE412C0]);
  v32 = sub_2312BBD5C();
  v33 = *(void (**)(char *, uint64_t))(v4 + 8);
  v33(v31, v3);
  sub_23129F084((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23128F05C);
  v33(v17, v3);
  sub_23129F084((uint64_t)v9, (uint64_t (*)(_QWORD))sub_23128F05C);
  v29 = (uint64_t)v53;
  v30 = v54;
  if ((v32 & v25 & 1) != 0)
    goto LABEL_9;
LABEL_10:
  sub_2312BBB7C();
  sub_23128F0CC((uint64_t)v22, v29);
  v35 = sub_2312BBBAC();
  v36 = sub_2312BBED0();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc();
    LODWORD(v53) = v25;
    v38 = v37;
    v39 = swift_slowAlloc();
    v56 = v39;
    *(_DWORD *)v38 = 136315906;
    v40 = sub_2312BC1E8();
    v54 = v22;
    v55 = sub_2312AE104(v40, v41, &v56);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    v55 = sub_2312AE104(0xD000000000000011, 0x80000002312BF9C0, &v56);
    sub_2312BBF9C();
    *(_WORD *)(v38 + 22) = 2080;
    sub_23128F0CC(v29, v48);
    v42 = sub_2312BBDB0();
    v55 = sub_2312AE104(v42, v43, &v56);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    sub_23129F084(v29, (uint64_t (*)(_QWORD))sub_23128F05C);
    *(_WORD *)(v38 + 32) = 2080;
    if ((v53 & 1) != 0)
      v44 = 1702195828;
    else
      v44 = 0x65736C6166;
    if ((v53 & 1) != 0)
      v45 = 0xE400000000000000;
    else
      v45 = 0xE500000000000000;
    v55 = sub_2312AE104(v44, v45, &v56);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231285000, v35, v36, "[%s] %s -> false: featureStatus (%s), promotion visiblity (%s)", (uint8_t *)v38, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v39, -1, -1);
    MEMORY[0x2348D9AB4](v38, -1, -1);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v30, v52);
    v46 = (uint64_t)v54;
  }
  else
  {

    sub_23129F084(v29, (uint64_t (*)(_QWORD))sub_23128F05C);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v30, v52);
    v46 = (uint64_t)v22;
  }
  sub_23129F084(v46, (uint64_t (*)(_QWORD))sub_23128F05C);
  return 0;
}

uint64_t sub_23129E95C()
{
  uint64_t v0;

  sub_2312BBA5C();

  swift_release();
  sub_23129F12C(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HearingEnvironmentNotificationAdvertisableFeatureSource()
{
  return objc_opt_self();
}

uint64_t sub_23129E9C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE412F8];
  v3 = sub_2312BB60C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_23129EA04()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x2348D9B2C](v0 + 56);
}

uint64_t sub_23129EA48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 64) = a2;
  swift_unknownObjectWeakAssign();
  return sub_2312BBA5C();
}

void (*sub_23129EAA8(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x2348D9B2C](v1 + 56);
  v5 = *(_QWORD *)(v1 + 64);
  v3[3] = v4;
  v3[4] = v5;
  return sub_23129EB14;
}

void sub_23129EB14(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 64) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    sub_2312BBA5C();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_2312BBA5C();
  }
  free(v3);
}

uint64_t sub_23129EB88(void (*a1)(_BYTE *))
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v6;

  sub_23129EDCC(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129DF50();
  *v4 = sub_23129E334() & 1;
  swift_storeEnumTagMultiPayload();
  a1(v4);
  return sub_23129F084((uint64_t)v4, (uint64_t (*)(_QWORD))sub_23129EDCC);
}

uint64_t sub_23129EC34(void (*a1)(char *))
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  sub_23129EDB4(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  a1(v4);
  return sub_23129F084((uint64_t)v4, (uint64_t (*)(_QWORD))sub_23129EDB4);
}

uint64_t sub_23129ECC0(uint64_t a1, void (*a2)(char *))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v11;

  sub_23129EDB4(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129DF50();
  v8 = *(_QWORD *)(v2 + 24);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v8 + 88))(ObjectType, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, ObjectType, v8);
  swift_storeEnumTagMultiPayload();
  a2(v7);
  return sub_23129F084((uint64_t)v7, (uint64_t (*)(_QWORD))sub_23129EDB4);
}

uint64_t sub_23129EDA8()
{
  return MEMORY[0x24BEE4AF8];
}

void sub_23129EDB4(uint64_t a1)
{
  sub_23129EDE0(a1, &qword_255EC3770);
}

void sub_23129EDCC(uint64_t a1)
{
  sub_23129EDE0(a1, &qword_255EC3780);
}

void sub_23129EDE0(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    sub_2312BB6D8();
    sub_23129F0EC(&qword_255EC3778, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE417D0], MEMORY[0x24BE417E0]);
    v3 = sub_2312BC1AC();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_23129EE64()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255EC3788)
  {
    sub_23128F05C(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255EC3788);
  }
}

void sub_23129EEC4(uint64_t a1)
{
  sub_23128D554(a1, &qword_255EC3798, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_23129EEE0(uint64_t a1)
{
  sub_23128D554(a1, &qword_254159620, (uint64_t (*)(uint64_t))sub_23128F05C, MEMORY[0x24BDB9ED8]);
}

void sub_23129EEFC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3990)
  {
    sub_23129EEE0(255);
    sub_23129F0EC((unint64_t *)&unk_254159610, 255, (uint64_t (*)(uint64_t))sub_23129EEE0, MEMORY[0x24BDB9EE8]);
    v0 = sub_2312BBBE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3990);
  }
}

void sub_23129EF78()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC39A0)
  {
    sub_23129EEFC();
    sub_23129F048();
    sub_23129F0EC((unint64_t *)&unk_255EC39B0, 255, (uint64_t (*)(uint64_t))sub_23129EEFC, MEMORY[0x24BDB96F8]);
    sub_23129F0EC((unint64_t *)&qword_255EC37A0, 255, (uint64_t (*)(uint64_t))sub_23129F048, MEMORY[0x24BEE5670]);
    v0 = sub_2312BBC24();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC39A0);
  }
}

unint64_t sub_23129F048()
{
  unint64_t result;

  result = qword_255EC2FE8;
  if (!qword_255EC2FE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC2FE8);
  }
  return result;
}

uint64_t sub_23129F084(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23129F0C0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23129F0E4()
{
  return sub_23129E248();
}

uint64_t sub_23129F0EC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2348D9A30](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23129F12C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_23129F150()
{
  swift_beginAccess();
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  sub_2312BBC84();
  return swift_endAccess();
}

id sub_23129F1C4(char a1)
{
  if (qword_254159760 != -1)
    swift_once();
  return objc_msgSend((id)qword_25415A948, sel_setNoiseEnabled_, a1 & 1);
}

id sub_23129F21C()
{
  void *v0;

  if (qword_254159760 != -1)
    swift_once();
  v0 = (void *)qword_25415A948;
  objc_msgSend((id)qword_25415A948, sel_setOnboardingCompleted_, 1);
  objc_msgSend(v0, sel_setNoiseEnabled_, 1);
  objc_msgSend(v0, sel_setNotificationsEnabled_, 1);
  return objc_msgSend(v0, sel_setNotificationThreshold_, 90);
}

uint64_t sub_23129F2B0()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2312A02C8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BD4E0;
  sub_23128AC6C(0, (unint64_t *)&qword_2541596B0);
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD3578]);
  sub_23128AC6C(0, (unint64_t *)&qword_2541596A0);
  *(_QWORD *)(inited + 40) = MEMORY[0x2348D92BC]((id)*MEMORY[0x24BDD28D8]);
  sub_2312BBE28();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
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
  sub_23129AB0C(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_23129F3CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;

  v1 = sub_2312BB630();
  MEMORY[0x24BDAC7A8](v1);
  if (qword_2541597F0 != -1)
    swift_once();
  v2 = (id)qword_25415A9E8;
  sub_2312BB624();
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = sub_2312BB354();

  v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata, v9, a1);
  sub_2312BB354();

  v7 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2312BB354();

  return sub_2312BB714();
}

void sub_23129F658(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  _QWORD v44[3];
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52[6];

  v2 = sub_2312BBBC4();
  v47 = *(_QWORD *)(v2 - 8);
  v48 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2312BB774();
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2312BB7F8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v44 - v12;
  v14 = sub_2312BB9D8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v45 = (char *)v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v44 - v18;
  swift_unknownObjectRetain();
  swift_getObjectType();
  v20 = swift_conformsToProtocol2();
  if (v20)
    v21 = v20;
  else
    v21 = 0;
  if (v20)
    v22 = a1;
  else
    v22 = 0;
  if (v22)
  {
    v44[2] = v21;
    sub_23128AC6C(0, (unint64_t *)&qword_2541596B0);
    v46 = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD3578]);
    v44[1] = swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2312BBA98();
    sub_2312BBA5C();
    sub_2312BB9B4();
    v47 = *(_QWORD *)(v15 + 8);
    v48 = v14;
    ((void (*)(char *, uint64_t))v47)(v19, v14);
    sub_23128B868(v52, v52[3]);
    sub_2312BB984();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BE42648], v7);
    sub_2312A0280();
    v23 = sub_2312BBD5C();
    v24 = *(void (**)(char *, uint64_t))(v8 + 8);
    v25 = v11;
    v26 = (void *)v46;
    v24(v25, v7);
    v24(v13, v7);
    sub_23128B88C((uint64_t)v52);
    if ((v23 & 1) == 0)
    {
      v27 = sub_2312BBA68();
      if (v27)
      {
        v28 = (void *)v27;
        swift_unknownObjectRetain();
        v29 = v45;
        sub_2312BBA98();
        sub_2312BBA5C();
        v30 = (void *)sub_2312BB9C0();
        ((void (*)(char *, uint64_t))v47)(v29, v48);
        v31 = objc_msgSend(v30, sel_navigationController);

        if (v31)
        {
          objc_msgSend(v31, sel_pushViewController_animated_, v28, 1);

        }
      }
    }
    if (qword_254159760 != -1)
      swift_once();
    v32 = (void *)qword_25415A948;
    objc_msgSend((id)qword_25415A948, sel_setOnboardingCompleted_, 1);
    objc_msgSend(v32, sel_setNoiseEnabled_, 1);
    objc_msgSend(v32, sel_setNotificationsEnabled_, 1);
    objc_msgSend(v32, sel_setNotificationThreshold_, 90);
    v33 = (uint64_t)v51;
    (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v51, *MEMORY[0x24BE42168], v50);
    v34 = objc_allocWithZone((Class)type metadata accessor for NoiseNotificationsSettingsViewController(0));
    v35 = sub_2312A9A08(v32, v33);
    sub_2312BB99C();
    v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A728]), sel_initWithRootViewController_, v35);
    swift_unknownObjectRetain();
    sub_2312BBA98();
    sub_2312BBA5C();
    v37 = (void *)sub_2312BB9C0();
    ((void (*)(char *, uint64_t))v47)(v19, v48);
    objc_msgSend(v37, sel_presentViewController_animated_completion_, v36, 1, 0);

    sub_2312BBA5C();
  }
  else
  {
    sub_2312BBA5C();
    v38 = v47;
    v39 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v4, v46, v48);
    v40 = sub_2312BBBAC();
    v41 = sub_2312BBEB8();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v52[0] = v43;
      *(_DWORD *)v42 = 136446210;
      v52[5] = sub_2312AE104(0xD000000000000032, 0x80000002312BD8F0, v52);
      sub_2312BBF9C();
      _os_log_impl(&dword_231285000, v40, v41, "[%{public}s] Could not perform onboarding action; invalid sender",
        v42,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v43, -1, -1);
      MEMORY[0x2348D9AB4](v42, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v38 + 8))(v4, v39);
  }
}

uint64_t sub_23129FC14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20[3];
  uint64_t v21;
  uint64_t v22;

  v3 = sub_2312BBBC4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128E014(a1, (uint64_t)v20, &qword_254158F10, &qword_254158F08);
  v7 = v21;
  if (v21)
  {
    v8 = v22;
    sub_23128B868(v20, v21);
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
    sub_23128B88C((uint64_t)v20);
  }
  else
  {
    sub_23128B8F0((uint64_t)v20, &qword_254158F10, &qword_254158F08);
  }
  sub_23128E014(a1 + 40, (uint64_t)v20, &qword_254158F58, &qword_254158F50);
  v9 = v21;
  if (v21)
  {
    v10 = v22;
    sub_23128B868(v20, v21);
    LODWORD(v9) = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    sub_23128B88C((uint64_t)v20);
  }
  else
  {
    sub_23128B8F0((uint64_t)v20, &qword_254158F58, &qword_254158F50);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  v11 = sub_2312BBBAC();
  v12 = sub_2312BBEAC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18 = v3;
    v15 = v14;
    v20[0] = v14;
    *(_DWORD *)v13 = 136446978;
    v19 = sub_2312AE104(0xD000000000000032, 0x80000002312BD8F0, v20);
    sub_2312BBF9C();
    *(_WORD *)(v13 + 12) = 2080;
    v19 = sub_2312AE104(0xD00000000000004BLL, 0x80000002312BE9D0, v20);
    sub_2312BBF9C();
    *(_WORD *)(v13 + 22) = 1026;
    LODWORD(v19) = v7 & 1;
    sub_2312BBF9C();
    *(_WORD *)(v13 + 28) = 1026;
    LODWORD(v19) = v9 & 1;
    sub_2312BBF9C();
    _os_log_impl(&dword_231285000, v11, v12, "[%{public}s] %s: Feature supported: %{BOOL,public}d. Feature onboarded: %{BOOL,public}d.", (uint8_t *)v13, 0x22u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v15, -1, -1);
    MEMORY[0x2348D9AB4](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7 & ~(_DWORD)v9 & 1;
}

unint64_t sub_23129FF64()
{
  return 0xD00000000000004BLL;
}

uint64_t sub_23129FF80()
{
  return sub_23129F2B0();
}

uint64_t sub_23129FF94@<X0>(uint64_t a1@<X8>)
{
  return sub_23129F3CC(a1);
}

unint64_t sub_23129FFA8()
{
  return 0xD000000000000017;
}

uint64_t sub_23129FFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2312A0004(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2312BBBC4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2312A0038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2312A007C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2312A00C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2312A0104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2312A0148()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2312A0154(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2312A0190()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2312A019C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BBBC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for EnvironmentAudioNotificationOnboardingDataProvider()
{
  uint64_t result;

  result = qword_254159150;
  if (!qword_254159150)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2312A0218()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BBBC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2312A0280()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EC31C0;
  if (!qword_255EC31C0)
  {
    v1 = sub_2312BB7F8();
    result = MEMORY[0x2348D9A30](MEMORY[0x24BE42688], v1);
    atomic_store(result, (unint64_t *)&qword_255EC31C0);
  }
  return result;
}

void sub_2312A02C8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159270)
  {
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159270);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AudiogramDataManagementComponent(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for AudiogramDataManagementComponent(id *a1)
{

}

uint64_t assignWithCopy for AudiogramDataManagementComponent(uint64_t a1, uint64_t a2)
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

uint64_t initializeWithTake for AudiogramDataManagementComponent(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for AudiogramDataManagementComponent(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudiogramDataManagementComponent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AudiogramDataManagementComponent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AudiogramDataManagementComponent()
{
  return &type metadata for AudiogramDataManagementComponent;
}

uint64_t sub_2312A0490()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_2312BB8DC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_2312BB8C4();
  v6 = sub_2312BB8D0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t type metadata accessor for HeadphoneNotificationsSpecifierDataSource(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3830);
}

uint64_t sub_2312A0564()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2312A05E4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2312A0610(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;

  swift_getObjectType();
  sub_23128D554(0, (unint64_t *)&unk_255EC38E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42170], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - v4;
  v6 = &v1[qword_255EC37E0];
  *(_QWORD *)v6 = 0xD000000000000014;
  *((_QWORD *)v6 + 1) = 0x80000002312BFD10;
  v7 = &v1[qword_255EC37E8];
  *(_QWORD *)v7 = 0xD000000000000015;
  *((_QWORD *)v7 + 1) = 0x80000002312BFD30;
  v8 = &v1[qword_255EC37F0];
  *(_QWORD *)v8 = 0xD000000000000013;
  *((_QWORD *)v8 + 1) = 0x80000002312BFD50;
  v9 = &v1[qword_255EC37F8];
  *(_QWORD *)v9 = 0xD000000000000014;
  *((_QWORD *)v9 + 1) = 0x80000002312BFD70;
  v10 = &v1[qword_255EC3800];
  *(_QWORD *)v10 = 0xD000000000000016;
  *((_QWORD *)v10 + 1) = 0x80000002312BFD90;
  *(_QWORD *)&v1[qword_255EC3808] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[qword_255EC3810 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[qword_255EC3818 + 8] = 0;
  swift_unknownObjectWeakInit();
  v11 = qword_255EC3820;
  type metadata accessor for HeadphoneNotificationsAvailability();
  swift_allocObject();
  v12 = v1;
  *(_QWORD *)&v1[v11] = sub_2312ABB14();
  *(_QWORD *)&v12[qword_255EC3828] = 0;

  sub_2312B79C0();
  v13 = sub_2312BB774();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, a1, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  v15 = (id)sub_2312BB768();
  sub_2312A2D14();

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v15;
}

uint64_t sub_2312A086C@<X0>(uint64_t a1@<X8>)
{
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;

  if ((objc_msgSend((id)objc_opt_self(), sel_isHeadphoneExposureNotificationsEnabled) & 1) != 0
    || (sub_2312A3B98() & 1) != 0)
  {
    v2 = (unsigned int *)MEMORY[0x24BE41298];
  }
  else
  {
    v2 = (unsigned int *)MEMORY[0x24BE412A0];
  }
  v3 = *v2;
  v4 = sub_2312BB600();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a1, v3, v4);
}

uint64_t sub_2312A08E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  ObjectType = swift_getObjectType();
  v3 = sub_2312BB600();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2312BB630();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312B79DC();
  v11 = sub_2312BB618();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v11)
  {
    v22 = a1;
    v12 = (void *)objc_opt_self();
    v13 = objc_msgSend(v12, sel_isHeadphoneExposureNotificationsEnabled);
    v14 = objc_msgSend(v12, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch);
    v15 = sub_2312A3B98();
    if ((objc_msgSend(v12, sel_isHeadphoneExposureNotificationsEnabled) & 1) != 0
      || (sub_2312A3B98() & 1) != 0)
    {
      v16 = (unsigned int *)MEMORY[0x24BE41298];
    }
    else
    {
      v16 = (unsigned int *)MEMORY[0x24BE412A0];
    }
    v19 = v22;
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *v16, v3);
    sub_2312B72D0((uint64_t)v6, (char)v13, (int)v14, v15 & 1, ObjectType, (uint64_t)&off_2500177E0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    MEMORY[0x2348D8A1C](1, v13, v14, v15 & 1);
    sub_2312BBA20();
    v20 = sub_2312BBA2C();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    v17 = sub_2312BBA2C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 1, 1, v17);
  }
}

uint64_t sub_2312A0B08()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;

  v9 = MEMORY[0x24BEE4AF8];
  sub_2312A0C40();
  sub_2312A7CAC(v1);
  if (objc_msgSend((id)objc_opt_self(), sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch))
  {
    *(_QWORD *)(v0 + qword_255EC3808) = sub_2312A13A8();
    swift_bridgeObjectRelease();
    v2 = swift_bridgeObjectRetain();
    sub_2312A7CAC(v2);
  }
  v3 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_2312BC080();
    swift_bridgeObjectRelease_n();
    return v8;
  }
  else
  {
    v4 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    sub_2312BC134();
    if (swift_dynamicCastMetatype() || (v6 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) == 0)
    {
LABEL_5:
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = (_QWORD *)(v4 + 32);
      while (*v7)
      {
        ++v7;
        if (!--v6)
          goto LABEL_5;
      }
      swift_bridgeObjectRelease();
      return v4 | 1;
    }
    return v3;
  }
}

void sub_2312A0C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char **v18;
  char *v19;
  id v20;
  char v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  char v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[3];
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_2312BBBC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = MEMORY[0x24BEE4AF8];
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentDeviceDisplayName);
  if (v6)
  {
    v7 = v6;
    v49 = v1;
    v8 = sub_2312BBD98();
    v10 = v9;

    v11 = (void *)objc_opt_self();
    v12 = objc_msgSend(v11, sel_areHeadphoneExposureNotificationsMandatory);
    v48 = objc_msgSend(v11, sel_isHeadphoneExposureNotificationsEnabled);
    v13 = objc_msgSend(v11, sel_isHeadphoneExposureMeasureLevelsEnabled);
    v14 = sub_2312B86B0(v12, v13 ^ 1);
    v16 = v15;
    v17 = sub_2312B87E0(v13 ^ 1);
    v18 = &selRef_openDevicePrivacySettings;
    if (v13)
      v18 = &selRef_openLearnMoreLink;
    v19 = *v18;
    if ((v12 & 1) != 0)
    {
      v20 = sub_2312A19E8(*(_QWORD *)(v49 + qword_255EC37E0), *(_QWORD *)(v49 + qword_255EC37E0 + 8), v8, v10, v14, v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = v48;
      if (v20)
      {
        v22 = v20;
        MEMORY[0x2348D91D8]();
        if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2312BBE40();
        sub_2312BBE4C();
        sub_2312BBE28();

      }
      v23 = sub_2312A1DB4(*(_QWORD *)(v49 + qword_255EC37E8), *(_QWORD *)(v49 + qword_255EC37E8 + 8), 1, v21, 1, sel_headphoneNotificationsDeviceEnabled, (uint64_t)sel_setHeadphoneNotificationsDeviceEnabledWithValue_);
      if (!v23)
        return;
LABEL_31:
      v46 = v23;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

      return;
    }
    v47[0] = v8;
    v47[2] = v19;
    v30 = (void *)objc_opt_self();
    v31 = (void *)sub_2312BBD68();
    v32 = objc_msgSend(v30, sel_modelSpecificLocalizedStringKeyForKey_, v31);

    if (!v32)
    {
      __break(1u);
      return;
    }
    v47[1] = v17;
    sub_2312BBD98();

    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    swift_bridgeObjectRelease();
    v33 = v49;
    v34 = (void *)objc_opt_self();
    v35 = (void *)sub_2312BBD68();
    v36 = objc_msgSend(v34, sel_groupSpecifierWithID_, v35);

    if (v36)
    {
      v37 = (void *)sub_2312BBD68();
      objc_msgSend(v36, sel_setName_, v37);

      v38 = (void *)sub_2312BBD68();
      objc_msgSend(v36, sel_setProperty_forKey_, v38, *MEMORY[0x24BE75A68]);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v39 = v36;
      MEMORY[0x2348D91D8]();
      v40 = v14;
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

      v41 = v48;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v41 = v48;
      v40 = v14;
    }
    v42 = sub_2312A1BF4(*(_QWORD *)(v33 + qword_255EC3800), *(_QWORD *)(v33 + qword_255EC3800 + 8), (uint64_t)sel_isHeadphoneMeasureAudioLevelEnabled, (uint64_t)sel_setHeadphoneMeasureAudioLevelsEnabledWithValue_);
    if (v42)
    {
      v43 = v42;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

    }
    v44 = sub_2312A19E8(0xD000000000000012, 0x80000002312C0070, 0, 0, v40, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v44)
    {
      v45 = v44;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

    }
    v23 = sub_2312A1DB4(*(_QWORD *)(v33 + qword_255EC37E8), *(_QWORD *)(v33 + qword_255EC37E8 + 8), 0, v41, 1, sel_headphoneNotificationsDeviceEnabled, (uint64_t)sel_setHeadphoneNotificationsDeviceEnabledWithValue_);
    if (v23)
      goto LABEL_31;
  }
  else
  {
    sub_2312BBBA0();
    v24 = sub_2312BBBAC();
    v25 = sub_2312BBEB8();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v51 = v27;
      *(_DWORD *)v26 = 136446210;
      v28 = sub_2312BC1E8();
      v50 = sub_2312AE104(v28, v29, &v51);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v24, v25, "[%{public}s] Could not get device display name", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v27, -1, -1);
      MEMORY[0x2348D9AB4](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_2312A13A8()
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
  uint64_t v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_2312BBBC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BEE4AF8];
  v6 = sub_23128CA0C();
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = sub_2312A1748((SEL *)&selRef_areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError_, "[%{public}s] Could not access areHeadphoneExposureNotificationsMandatoryOnActiveWatch. Error: %{public}s");
    v28 = sub_2312A3B98();
    v11 = sub_2312A1748((SEL *)&selRef_isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError_, "[%{public}s] Could not access isHeadphoneExposureMeasureLevelsEnabledOnActiveWatch. Error: %{public}s");
    v12 = (v11 & 1) == 0;
    v27 = v10 & 1;
    v13 = sub_2312B887C(v10 & 1, v12);
    v15 = v14;
    sub_2312B87E0(v12);
    v16 = sub_2312A19E8(*(_QWORD *)(v0 + qword_255EC37F0), *(_QWORD *)(v0 + qword_255EC37F0 + 8), v8, v9, v13, v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v16)
    {
      v17 = v16;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

    }
    v18 = sub_2312A1DB4(*(_QWORD *)(v1 + qword_255EC37F8), *(_QWORD *)(v1 + qword_255EC37F8 + 8), v27, v28 & 1, v11 & 1, sel_headphoneNotificationsWatchEnabled, (uint64_t)sel_setHeadphoneNotificationsWatchEnabledWithValue_);
    if (v18)
    {
      v19 = v18;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

    }
  }
  else
  {
    sub_2312BBBA0();
    v20 = sub_2312BBBAC();
    v21 = sub_2312BBEB8();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v30 = v23;
      *(_DWORD *)v22 = 136446210;
      v24 = sub_2312BC1E8();
      v29 = sub_2312AE104(v24, v25, &v30);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v20, v21, "[%{public}s] Could not get watch display name", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v23, -1, -1);
      MEMORY[0x2348D9AB4](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v31;
}

id sub_2312A1748(SEL *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id result;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24[2];

  v24[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  v4 = sub_2312BBBC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_2312BB660() & 1) == 0)
    return 0;
  v8 = (void *)objc_opt_self();
  result = objc_msgSend(v8, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch);
  if ((_DWORD)result)
  {
    v24[0] = 0;
    result = objc_msgSend(v8, *a1, v24);
    if (v24[0])
    {
      v10 = v24[0];
      swift_willThrow();
      sub_2312BBBA0();
      v11 = v10;
      v12 = sub_2312BBBAC();
      v13 = sub_2312BBEC4();
      v14 = v13;
      if (os_log_type_enabled(v12, v13))
      {
        v15 = swift_slowAlloc();
        v22 = (void *)swift_slowAlloc();
        v24[0] = v22;
        *(_DWORD *)v15 = 136446466;
        HIDWORD(v21) = v14;
        v16 = sub_2312BC1E8();
        v23 = sub_2312AE104(v16, v17, (uint64_t *)v24);
        sub_2312BBF9C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2082;
        swift_getErrorValue();
        v18 = sub_2312BC14C();
        v23 = sub_2312AE104(v18, v19, (uint64_t *)v24);
        sub_2312BBF9C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231285000, v12, BYTE4(v21), a2, (uint8_t *)v15, 0x16u);
        v20 = v22;
        swift_arrayDestroy();
        MEMORY[0x2348D9AB4](v20, -1, -1);
        MEMORY[0x2348D9AB4](v15, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return 0;
    }
  }
  return result;
}

id sub_2312A19E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSUInteger v14;
  NSUInteger v15;
  NSString *v16;
  id v17;
  void *v18;
  NSRange v20;

  v7 = (void *)a4;
  v8 = sub_2312A3C9C(a1, a2, a5, a6, a3, a4, 1);
  if (v8)
  {
    if (v7)
      v7 = (void *)sub_2312BBD68();
    objc_msgSend(v8, sel_setName_, v7);

    v9 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
    swift_bridgeObjectRetain();
    v10 = (void *)sub_2312BBD68();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v9, sel_initWithString_, v10);

    v12 = (void *)sub_2312BBD68();
    v13 = objc_msgSend(v11, sel_localizedStandardRangeOfString_, v12);
    v15 = v14;

    sub_2312BB3D8();
    v20.location = (NSUInteger)v13;
    v20.length = v15;
    v16 = NSStringFromRange(v20);
    if (!v16)
    {
      sub_2312BBD98();
      v16 = (NSString *)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v8, sel_setProperty_forKey_, v16, *MEMORY[0x24BE75A40]);

    v17 = objc_msgSend((id)objc_opt_self(), sel_valueWithNonretainedObject_, v6);
    objc_msgSend(v8, sel_setProperty_forKey_, v17, *MEMORY[0x24BE75A50]);
    v18 = (void *)sub_2312BBD68();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setProperty_forKey_, v18, *MEMORY[0x24BE75A38]);

  }
  return v8;
}

id sub_2312A1BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (qword_2541597F0 != -1)
    swift_once();
  sub_2312BB354();
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v8, v4, a4, a3, 0, 6, 0);

  if (v9)
  {
    v10 = (void *)sub_2312BBD68();
    objc_msgSend(v9, sel_setIdentifier_, v10);

    v11 = (void *)sub_2312BBE64();
    objc_msgSend(v9, sel_setProperty_forKey_, v11, *MEMORY[0x24BE75A18]);

    v12 = (void *)sub_2312BBE64();
    objc_msgSend(v9, sel_setProperty_forKey_, v12, *MEMORY[0x24BE75868]);

  }
  return v9;
}

id sub_2312A1DB4(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, char *a6, uint64_t a7)
{
  uint64_t v7;
  char **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  if (qword_2541597F0 != -1)
    swift_once();
  sub_2312BB354();
  if ((a3 & 1) != 0)
  {
    a7 = 0;
    v12 = &selRef_headphoneNotificationsIsHeadphoneNotificationsMandatoryDisabledValueText;
    if ((a4 & 1) != 0)
      v12 = &selRef_headphoneNotificationsIsHeadphoneNotificationsMandatoryEnabledValueText;
    a6 = *v12;
    v13 = 4;
  }
  else
  {
    v13 = 6;
  }
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v15, v7, a7, a6, 0, v13, 0);

  if (v16)
  {
    v17 = (void *)sub_2312BBD68();
    objc_msgSend(v16, sel_setIdentifier_, v17);

    v18 = (void *)sub_2312BBE64();
    objc_msgSend(v16, sel_setProperty_forKey_, v18, *MEMORY[0x24BE75A18]);

    v19 = (void *)sub_2312BBE64();
    objc_msgSend(v16, sel_setProperty_forKey_, v19, *MEMORY[0x24BE75868]);

  }
  return v16;
}

id sub_2312A1FBC(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = qword_2541597F0;
  v2 = a1;
  if (v1 != -1)
    swift_once();
  sub_2312BB354();

  v3 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  return v3;
}

id sub_2312A2090(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = qword_2541597F0;
  v2 = a1;
  if (v1 != -1)
    swift_once();
  sub_2312BB354();

  v3 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  return v3;
}

void sub_2312A2164()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v1 = v0;
  sub_2312A02C8();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2312BD4E0;
  *(_QWORD *)(v2 + 32) = sub_2312A3E0C();
  *(_QWORD *)(v2 + 40) = sub_2312A3850();
  sub_2312BBE28();
  v3 = objc_allocWithZone(MEMORY[0x24BE4A6A0]);
  sub_2312A4590();
  v4 = (void *)sub_2312BBE04();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithItems_, v4);

  v6 = qword_2541597F0;
  v7 = v5;
  if (v6 != -1)
    swift_once();
  sub_2312BB354();
  v8 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setTitle_, v8, 0xE000000000000000);

  v9 = *(void **)&v1[qword_255EC3888];
  *(_QWORD *)&v1[qword_255EC3888] = v7;
  v10 = v7;

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A718]), sel_initWithRootViewController_, v10);
  objc_msgSend(v1, sel_presentViewController_animated_completion_, v11, 1, 0);

}

void sub_2312A2334(char *a1)
{
  uint64_t v2;
  char *v3;
  id v4;

  v2 = MEMORY[0x2348D9B2C](&a1[qword_255EC3818]);
  if (v2)
  {
    v4 = (id)v2;
    v3 = a1;
    sub_2312A2164();

  }
}

id sub_2312A2398(void *a1, uint64_t a2)
{
  return sub_2312A2740(a1, a2, (SEL *)&selRef_isHeadphoneExposureNotificationsEnabled);
}

id sub_2312A23A4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24[2];

  v24[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  v2 = sub_2312BBBC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  if ((objc_msgSend(v6, sel_isHeadphoneExposureMeasureLevelsEnabled) & 1) == 0
    && objc_msgSend(a1, sel_BOOLValue))
  {
    sub_2312A27B8(a1);
  }
  v7 = objc_msgSend(a1, sel_BOOLValue);
  v24[0] = 0;
  if (objc_msgSend(v6, sel__setHeadphoneExposureNotificationsEnabled_error_, v7, v24))
    return v24[0];
  v22 = v24[0];
  v9 = v24[0];
  v10 = (void *)sub_2312BB360();

  swift_willThrow();
  sub_2312BBBA0();
  v11 = v10;
  v12 = v10;
  v13 = sub_2312BBBAC();
  v14 = sub_2312BBEC4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v22 = (id)swift_slowAlloc();
    v24[0] = v22;
    *(_DWORD *)v15 = 136446466;
    v16 = sub_2312BC1E8();
    v23 = sub_2312AE104(v16, v17, (uint64_t *)v24);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    swift_getErrorValue();
    v18 = sub_2312BC14C();
    v23 = sub_2312AE104(v18, v19, (uint64_t *)v24);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_231285000, v13, v14, "[%{public}s] Could not set device headphone notifications. %{public}s", (uint8_t *)v15, 0x16u);
    v20 = v22;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v20, -1, -1);
    MEMORY[0x2348D9AB4](v15, -1, -1);

  }
  else
  {

  }
  return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_2312A26D4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2312A23A4(v4);

}

void sub_2312A2728(void *a1, uint64_t a2)
{
  sub_2312A2C5C(a1, a2, (void (*)(uint64_t, _UNKNOWN **))sub_2312B7910);
}

id sub_2312A2734(void *a1, uint64_t a2)
{
  return sub_2312A2740(a1, a2, (SEL *)&selRef_isHeadphoneExposureMeasureLevelsEnabled);
}

id sub_2312A2740(void *a1, uint64_t a2, SEL *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)objc_opt_self();
  v6 = a1;
  v7 = objc_msgSend(v5, *a3);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v7);

  return v8;
}

id sub_2312A27B8(void *a1)
{
  return sub_2312A28F4(a1, (SEL *)&selRef__setHeadphoneExposureMeasureLevelsEnabled_error_);
}

void sub_2312A2804(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2312A27B8(v4);

}

id sub_2312A2858(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, (unint64_t)sub_2312A3B98() & 1);

  return v2;
}

id sub_2312A28A8(void *a1)
{
  return sub_2312A28F4(a1, (SEL *)&selRef__setHeadphoneExposureNotificationsEnabledOnActiveWatch_error_);
}

id sub_2312A28F4(void *a1, SEL *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26[2];

  v26[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  v4 = sub_2312BBBC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(a1, sel_BOOLValue);
  v26[0] = 0;
  if (objc_msgSend(v8, *a2, v9, v26))
    return v26[0];
  v24 = v26[0];
  v11 = v26[0];
  v12 = (void *)sub_2312BB360();

  swift_willThrow();
  sub_2312BBBA0();
  v13 = v12;
  v14 = v12;
  v15 = sub_2312BBBAC();
  v16 = sub_2312BBEC4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v24 = (id)swift_slowAlloc();
    v26[0] = v24;
    *(_DWORD *)v17 = 136446466;
    v18 = sub_2312BC1E8();
    v25 = sub_2312AE104(v18, v19, (uint64_t *)v26);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    swift_getErrorValue();
    v20 = sub_2312BC14C();
    v25 = sub_2312AE104(v20, v21, (uint64_t *)v26);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_231285000, v15, v16, "[%{public}s] Could not set watch headphone notifications. %{public}s", (uint8_t *)v17, 0x16u);
    v22 = v24;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v22, -1, -1);
    MEMORY[0x2348D9AB4](v17, -1, -1);

  }
  else
  {

  }
  return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_2312A2BFC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2312A28A8(v4);

}

void sub_2312A2C50(void *a1, uint64_t a2)
{
  sub_2312A2C5C(a1, a2, (void (*)(uint64_t, _UNKNOWN **))sub_2312B89AC);
}

void sub_2312A2C5C(void *a1, uint64_t a2, void (*a3)(uint64_t, _UNKNOWN **))
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;

  ObjectType = swift_getObjectType();
  v6 = sub_2312BB390();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1;
  a3(ObjectType, &off_2500177E0);
  sub_2312BB36C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

uint64_t sub_2312A2D14()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  sub_23129EEC4(0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EEE0(0);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EEFC();
  v9 = v8;
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EF78();
  v13 = *(_QWORD *)(v12 - 8);
  v23 = v12;
  v24 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  swift_retain();
  sub_2312BBC84();
  swift_endAccess();
  swift_release();
  sub_23128A728((unint64_t *)&unk_254159610, (uint64_t (*)(uint64_t))sub_23129EEE0, MEMORY[0x24BDB9EE8]);
  sub_2312BBCF0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
  v25 = (id)sub_2312BBF00();
  v16 = sub_2312BBEF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 1, 1, v16);
  sub_23128A728((unint64_t *)&unk_255EC39B0, (uint64_t (*)(uint64_t))sub_23129EEFC, MEMORY[0x24BDB96F8]);
  sub_2312A46E4();
  sub_2312BBCE4();
  sub_23129F084((uint64_t)v2, (uint64_t (*)(_QWORD))sub_23129EEC4);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v9);
  swift_allocObject();
  v17 = v21[1];
  swift_unknownObjectWeakInit();
  sub_23128A728(qword_255EC37A8, (uint64_t (*)(uint64_t))sub_23129EF78, MEMORY[0x24BDB9A08]);
  v18 = v23;
  v19 = sub_2312BBCFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v18);
  *(_QWORD *)(v17 + qword_255EC3828) = v19;
  return swift_release();
}

void sub_2312A3044(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2348D9B2C](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v3 + qword_255EC3810;
    swift_beginAccess();
    v6 = MEMORY[0x2348D9B2C](v5);

    if (v6)
    {
      swift_getObjectType();
      sub_2312BBA14();
      sub_2312BBA5C();
    }
  }
}

void sub_2312A30E4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2312A3110()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23129F12C(v0 + qword_255EC3810);
  sub_23129F12C(v0 + qword_255EC3818);
  swift_release();
  return swift_release();
}

id sub_2312A31D0()
{
  return sub_2312A37D8(type metadata accessor for HeadphoneNotificationsSpecifierDataSource);
}

uint64_t sub_2312A31DC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23129F12C(a1 + qword_255EC3810);
  sub_23129F12C(a1 + qword_255EC3818);
  swift_release();
  return swift_release();
}

uint64_t sub_2312A32A8()
{
  return type metadata accessor for HeadphoneNotificationsSpecifierDataSource(0);
}

uint64_t type metadata accessor for HeadphoneNotificationsSettingsViewController(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3890);
}

uint64_t sub_2312A32C4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2312A3318()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_255EC3810;
  swift_beginAccess();
  return MEMORY[0x2348D9B2C](v1);
}

uint64_t sub_2312A3364(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_255EC3810;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return sub_2312BBA5C();
}

void (*sub_2312A33CC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_255EC3810;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2348D9B2C](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_2312A3440;
}

void sub_2312A3440(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    sub_2312BBA5C();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_2312BBA5C();
  }
  free(v3);
}

void (*sub_2312A34BC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2312BBA44();
  return sub_2312A3518;
}

void sub_2312A3518(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

char *sub_2312A354C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v17;

  swift_getObjectType();
  v3 = sub_2312BB774();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[qword_255EC3888] = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v7 = objc_allocWithZone((Class)type metadata accessor for HeadphoneNotificationsSpecifierDataSource(0));
  v8 = v1;
  v9 = sub_2312A0610((uint64_t)v6);
  v10 = qword_255EC3880;
  *(_QWORD *)&v8[qword_255EC3880] = v9;

  v11 = *(void **)&v8[v10];
  sub_23128A728(&qword_255EC38E0, type metadata accessor for HeadphoneNotificationsSpecifierDataSource, (uint64_t)&unk_2312BDB10);
  v12 = v11;
  v13 = (char *)sub_2312BB9A8();
  *(_QWORD *)(*(_QWORD *)&v13[qword_255EC3880] + qword_255EC3818 + 8) = &off_2500177C8;
  swift_unknownObjectWeakAssign();
  v14 = v13;
  sub_2312B792C();
  v15 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setTitle_, v15);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v14;
}

void sub_2312A3700(char *a1, uint64_t a2, void *a3)
{
  id v4;

  *(_QWORD *)&a1[qword_255EC3888] = 0;
  v4 = a3;

  sub_2312BC068();
  __break(1u);
}

void sub_2312A3774()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2312A37A0()
{
  uint64_t v0;

}

id sub_2312A37CC()
{
  return sub_2312A37D8(type metadata accessor for HeadphoneNotificationsSettingsViewController);
}

id sub_2312A37D8(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_2312A3810(uint64_t a1)
{

}

uint64_t sub_2312A3848()
{
  return type metadata accessor for HeadphoneNotificationsSettingsViewController(0);
}

id sub_2312A3850()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD aBlock[6];

  if (qword_2541597F0 != -1)
    swift_once();
  sub_2312BB354();
  v0 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v1 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1, 0xE000000000000000);

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = objc_allocWithZone(MEMORY[0x24BE4A688]);
  aBlock[4] = sub_2312A4608;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2312A05E4;
  aBlock[3] = &unk_250017810;
  v5 = _Block_copy(aBlock);
  swift_retain();
  v6 = objc_msgSend(v4, sel_initWithDescription_didTapLinkedText_, v2, v5);

  _Block_release(v5);
  swift_release();
  swift_release();
  return v6;
}

void sub_2312A3A08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2348D9B2C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_2312A3A58();

  }
}

void sub_2312A3A58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v1 = v0;
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2312BB354();

  sub_2312924A4(2);
  v4 = objc_allocWithZone((Class)sub_2312BB588());
  v5 = (void *)sub_2312BB57C();
  v6 = *(void **)(v1 + qword_255EC3888);
  if (v6)
  {
    v9 = v5;
    v7 = objc_msgSend(v6, sel_navigationController, 0xE000000000000000);
    v5 = v9;
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_pushViewController_animated_, v9, 1);

      v5 = v9;
    }
  }

}

id sub_2312A3B98()
{
  void *v0;
  id result;
  id v2;
  uint64_t v3;
  id v4[2];

  v4[1] = *(id *)MEMORY[0x24BDAC8D0];
  if ((sub_2312BB660() & 1) == 0)
    return 0;
  v0 = (void *)objc_opt_self();
  result = objc_msgSend(v0, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch);
  if ((_DWORD)result)
  {
    v4[0] = 0;
    result = objc_msgSend(v0, sel_isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError_, v4);
    if (v4[0])
    {
      v2 = v4[0];
      swift_willThrow();
      type metadata accessor for HeadphoneNotificationsAvailability();
      if (qword_255EC2F50 != -1)
        swift_once();
      v3 = sub_2312BBBC4();
      sub_23128A1E0(v3, (uint64_t)qword_255EC4110);
      sub_2312AB5A4(v2);

      return 0;
    }
  }
  return result;
}

id sub_2312A3C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *ObjCClassFromMetadata;
  NSString *v14;
  _QWORD *v15;
  void *v16;

  v9 = (void *)objc_opt_self();
  v10 = (void *)sub_2312BBD68();
  v11 = objc_msgSend(v9, sel_groupSpecifierWithID_, v10);

  if (v11)
  {
    if (a6)
    {
      v12 = (void *)sub_2312BBD68();
      objc_msgSend(v11, sel_setName_, v12);

    }
    if ((a7 & 1) != 0)
    {
      sub_23128AC6C(0, (unint64_t *)&unk_255EC39C0);
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      v14 = NSStringFromClass(ObjCClassFromMetadata);
      if (!v14)
      {
        sub_2312BBD98();
        v14 = (NSString *)sub_2312BBD68();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v11, sel_setProperty_forKey_, v14, *MEMORY[0x24BE75A30]);

      v15 = (_QWORD *)MEMORY[0x24BE75A58];
    }
    else
    {
      v15 = (_QWORD *)MEMORY[0x24BE75A68];
    }
    v16 = (void *)sub_2312BBD68();
    objc_msgSend(v11, sel_setProperty_forKey_, v16, *v15);

  }
  return v11;
}

id sub_2312A3E0C()
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
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  double v62;
  id v63;
  id v64;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  sub_2312A4628(0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2541597F0 != -1)
    swift_once();
  v3 = sub_2312BB354();
  v5 = v4;
  v6 = sub_2312BB354();
  v8 = v7;
  sub_2312BB354();
  sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2312BCC00;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
  v11 = sub_23128D600();
  *(_QWORD *)(v9 + 32) = v3;
  *(_QWORD *)(v9 + 40) = v5;
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = v11;
  *(_QWORD *)(v9 + 64) = v11;
  *(_QWORD *)(v9 + 72) = v6;
  v68 = v6;
  *(_QWORD *)(v9 + 80) = v8;
  swift_bridgeObjectRetain();
  v69 = v8;
  swift_bridgeObjectRetain();
  sub_2312BBD74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v13 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithString_, v13);

  v15 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v16 = v14;
  v17 = objc_msgSend(v15, sel_initWithAttributedString_, v16);
  v18 = objc_msgSend(v17, sel_string);
  v19 = sub_2312BBD98();
  v21 = v20;

  v72 = v19;
  v73 = v21;
  v70 = v3;
  v71 = v5;
  v22 = sub_2312BB3CC();
  v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v67(v2, 1, 1, v22);
  sub_2312A4644();
  v23 = sub_2312BBFB4();
  v25 = v24;
  LOBYTE(v3) = v26;
  sub_23129F084((uint64_t)v2, (uint64_t (*)(_QWORD))sub_2312A4628);
  swift_bridgeObjectRelease();
  v27 = v16;
  if ((v3 & 1) == 0)
  {
    v28 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x24BEBE240]);
    v29 = objc_msgSend(v28, sel_fontDescriptorWithSymbolicTraits_, 2);

    v27 = v16;
    if (v29)
    {
      v72 = v23;
      v73 = v25;
      v30 = objc_msgSend(v17, sel_string);
      v31 = sub_2312BBD98();
      v33 = v32;

      v70 = v31;
      v71 = v33;
      sub_2312A4688();
      sub_23128A728((unint64_t *)&unk_255EC3980, (uint64_t (*)(uint64_t))sub_2312A4688, MEMORY[0x24BEE1BC0]);
      v66 = sub_2312BBF84();
      v35 = v34;
      v36 = *MEMORY[0x24BEBB360];
      v27 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v29, 0.0);
      objc_msgSend(v17, sel_addAttribute_value_range_, v36, v27, v66, v35);

    }
  }

  swift_bridgeObjectRelease();
  v37 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v38 = v17;
  v39 = objc_msgSend(v37, sel_initWithAttributedString_, v38);
  v40 = objc_msgSend(v39, sel_string);
  v41 = sub_2312BBD98();
  v43 = v42;

  v72 = v41;
  v73 = v43;
  v70 = v68;
  v71 = v69;
  v67(v2, 1, 1, v22);
  v44 = sub_2312BBFB4();
  v46 = v45;
  LOBYTE(v41) = v47;
  sub_23129F084((uint64_t)v2, (uint64_t (*)(_QWORD))sub_2312A4628);
  swift_bridgeObjectRelease();
  v48 = v38;
  if ((v41 & 1) == 0)
  {
    v49 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x24BEBE1D0]);
    v50 = objc_msgSend(v49, sel_fontDescriptorWithSymbolicTraits_, 2);

    v48 = v38;
    if (v50)
    {
      v72 = v44;
      v73 = v46;
      v51 = objc_msgSend(v39, byte_250019448);
      v52 = sub_2312BBD98();
      v54 = v53;

      v70 = v52;
      v71 = v54;
      sub_2312A4688();
      sub_23128A728((unint64_t *)&unk_255EC3980, (uint64_t (*)(uint64_t))sub_2312A4688, MEMORY[0x24BEE1BC0]);
      v55 = sub_2312BBF84();
      v57 = v56;
      v58 = *MEMORY[0x24BEBB360];
      v48 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v50, 0.0);
      objc_msgSend(v39, sel_addAttribute_value_range_, v58, v48, v55, v57);

    }
  }

  swift_bridgeObjectRelease();
  v59 = objc_allocWithZone(MEMORY[0x24BEBB490]);
  v60 = v39;
  v61 = objc_msgSend(v59, sel_init);
  LODWORD(v62) = 1008981770;
  objc_msgSend(v61, sel_setHyphenationFactor_, v62);
  v63 = objc_msgSend(v60, sel_length);
  objc_msgSend(v60, sel_addAttribute_value_range_, *MEMORY[0x24BEBB3A8], v61, 0, v63);
  v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A690]), sel_initWithDescription_, v60);

  return v64;
}

unint64_t sub_2312A4590()
{
  unint64_t result;

  result = qword_255EC38F8;
  if (!qword_255EC38F8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC38F8);
  }
  return result;
}

uint64_t sub_2312A45E4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2312A4608()
{
  uint64_t v0;

  sub_2312A3A08(v0);
}

uint64_t sub_2312A4610(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2312A4620()
{
  return swift_release();
}

void sub_2312A4628(uint64_t a1)
{
  sub_23128D554(a1, (unint64_t *)&unk_255EC3960, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

unint64_t sub_2312A4644()
{
  unint64_t result;

  result = qword_255EC3970;
  if (!qword_255EC3970)
  {
    result = MEMORY[0x2348D9A30](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255EC3970);
  }
  return result;
}

void sub_2312A4688()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3978)
  {
    v0 = sub_2312BBEA0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3978);
  }
}

unint64_t sub_2312A46E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EC37A0;
  if (!qword_255EC37A0)
  {
    v1 = sub_23128AC6C(255, (unint64_t *)&qword_255EC2FE8);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_255EC37A0);
  }
  return result;
}

void sub_2312A473C(uint64_t a1)
{
  uint64_t v1;

  sub_2312A3044(a1, v1);
}

ValueMetadata *type metadata accessor for AudiogramArticleDataProvider()
{
  return &type metadata for AudiogramArticleDataProvider;
}

uint64_t sub_2312A4758(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  void (*v12)(unint64_t);
  uint64_t v13;
  uint64_t *v14;
  uint64_t ObjCClassFromMetadata;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  id v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;

  v1 = a1[3];
  v2 = a1[4];
  sub_23128B868(a1, v1);
  v64 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  v68 = MEMORY[0x24BEE4AF8];
  sub_23128D554(0, (unint64_t *)&qword_255EC39D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v3 = sub_2312BB570();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2312BDB70;
  v65 = v7;
  v8 = v7 + v6;
  if (qword_2541597F0 != -1)
    swift_once();
  v9 = (id)qword_25415A9E8;
  v10 = (void *)sub_2312BBD68();
  v63 = (id)objc_opt_self();
  v11 = objc_msgSend(v63, sel_imageNamed_inBundle_, v10, v9);

  if (!v11)
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  *(_QWORD *)v8 = v11;
  *(_BYTE *)(v8 + 8) = 0;
  v12 = *(void (**)(unint64_t))(v4 + 104);
  v13 = v3;
  v66 = v3;
  v12(v8);
  v14 = (uint64_t *)(v8 + v5);
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v67 = (id)objc_opt_self();
  v16 = objc_msgSend(v67, sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = sub_2312BB354();
  v19 = v18;

  *v14 = v17;
  v14[1] = v19;
  ((void (*)(unint64_t, _QWORD, uint64_t))v12)(v8 + v5, *MEMORY[0x24BE3F910], v13);
  v20 = v8 + 2 * v5;
  v21 = objc_msgSend(v67, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v22 = sub_2312BB354();
  v24 = v23;

  *(_QWORD *)v20 = v22;
  *(_QWORD *)(v20 + 8) = v24;
  *(_BYTE *)(v20 + 16) = 0;
  v25 = *MEMORY[0x24BE3F930];
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v20, v25, v66);
  v26 = v8 + 3 * v5;
  v62 = ObjCClassFromMetadata;
  v27 = objc_msgSend(v67, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v28 = sub_2312BB354();
  v30 = v29;

  *(_QWORD *)v26 = v28;
  *(_QWORD *)(v26 + 8) = v30;
  *(_BYTE *)(v26 + 16) = 0;
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v26, v25, v66);
  sub_2312A4FE4(v64 & 1, (uint64_t *)(v8 + 4 * v5));
  v31 = (id)qword_25415A9E8;
  v32 = (void *)sub_2312BBD68();
  v33 = objc_msgSend(v63, sel_imageNamed_inBundle_, v32, v31, 0xE000000000000000);

  if (!v33)
    v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v34 = v8 + 5 * v5;
  *(_QWORD *)v34 = v33;
  *(_BYTE *)(v34 + 8) = 1;
  ((void (*)(void))v12)();
  v35 = v8 + 6 * v5;
  v36 = objc_msgSend(v67, sel_bundleForClass_, v62);
  v37 = sub_2312BB354();
  v39 = v38;

  *(_QWORD *)v35 = v37;
  *(_QWORD *)(v35 + 8) = v39;
  *(_BYTE *)(v35 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v12)(v35, v25, v66);
  v40 = v8 + 7 * v5;
  v41 = objc_msgSend(v67, sel_bundleForClass_, v62, 0xE000000000000000);
  v42 = sub_2312BB354();
  v44 = v43;

  *(_QWORD *)v40 = v42;
  *(_QWORD *)(v40 + 8) = v44;
  *(_BYTE *)(v40 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v12)(v40, v25, v66);
  v45 = (uint64_t *)(v8 + 8 * v5);
  v46 = objc_msgSend(v67, sel_bundleForClass_, v62, 0xE000000000000000);
  v47 = sub_2312BB354();
  v49 = v48;

  *v45 = v47;
  v45[1] = v49;
  v45[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v12)(v45, *MEMORY[0x24BE3F8D0], v66);
  v50 = v8 + 9 * v5;
  *(_QWORD *)v50 = sub_2312A5864(1, 0.0, 0.25);
  *(_BYTE *)(v50 + 8) = 1;
  v51 = *MEMORY[0x24BE3F8A0];
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v50, v51, v66);
  v52 = v8 + 10 * v5;
  *(_QWORD *)v52 = sub_2312A5864(2, 0.25, 0.15);
  *(_BYTE *)(v52 + 8) = 1;
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v52, v51, v66);
  v53 = v8 + 11 * v5;
  *(_QWORD *)v53 = sub_2312A5864(3, 0.4, 0.2);
  *(_BYTE *)(v53 + 8) = 1;
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v53, v51, v66);
  v54 = v8 + 12 * v5;
  *(_QWORD *)v54 = sub_2312A5864(4, 0.6, 0.2);
  *(_BYTE *)(v54 + 8) = 1;
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v54, v51, v66);
  v55 = v8 + 13 * v5;
  *(_QWORD *)v55 = sub_2312A5864(5, 0.8, 0.2);
  *(_BYTE *)(v55 + 8) = 1;
  ((void (*)(unint64_t, uint64_t, uint64_t))v12)(v55, v51, v66);
  v56 = (uint64_t *)(v8 + 14 * v5);
  v57 = objc_msgSend(v67, sel_bundleForClass_, v62, 0xE000000000000000);
  v58 = sub_2312BB354();
  v60 = v59;

  *v56 = v58;
  v56[1] = v60;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v12)(v56, *MEMORY[0x24BE3F920], v66);
  sub_2312A7B38(v65);
  return v68;
}

uint64_t sub_2312A4FE4@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v33 - v5;
  if ((a1 & 1) != 0)
  {
    type metadata accessor for HearingAppPluginDelegate();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
    v10 = sub_2312BB354();
    v12 = v11;

    *a2 = v10;
    a2[1] = v12;
    v33[0] = 0;
    v33[1] = 0xE000000000000000;
    sub_2312BC020();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
    v14 = sub_2312BB354();
    v16 = v15;

    a2[2] = v14;
    a2[3] = v16;
    sub_2312BB384();
    v17 = sub_2312BB390();
    v18 = *(_QWORD *)(v17 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v6, 1, v17);
    if ((_DWORD)result == 1)
    {
      __break(1u);
    }
    else
    {
      sub_2312A5D6C();
      v21 = (char *)a2 + *(int *)(v20 + 64);
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v6, v17);
      v22 = *MEMORY[0x24BE3F8B8];
      v23 = sub_2312BB564();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v21, v22, v23);
      v24 = *MEMORY[0x24BE3F8E8];
      v25 = sub_2312BB570();
      return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(a2, v24, v25);
    }
  }
  else
  {
    type metadata accessor for HearingAppPluginDelegate();
    v26 = swift_getObjCClassFromMetadata();
    v27 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v26);
    v28 = sub_2312BB354();
    v30 = v29;

    *a2 = v28;
    a2[1] = v30;
    *((_BYTE *)a2 + 16) = 0;
    v31 = *MEMORY[0x24BE3F930];
    v32 = sub_2312BB570();
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(a2, v31, v32);
  }
  return result;
}

unint64_t sub_2312A5354()
{
  return 0xD000000000000024;
}

uint64_t sub_2312A5394(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      type metadata accessor for HearingAppPluginDelegate();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      v1 = sub_2312BB354();

      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

uint64_t sub_2312A55FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      type metadata accessor for HearingAppPluginDelegate();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      v1 = sub_2312BB354();

      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

char *sub_2312A5864(uint64_t a1, float a2, float a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  float v15;
  float v16;
  id v17;
  _QWORD v19[6];
  char v20;
  float v21;
  float v22;
  id v23;
  id v24;
  uint64_t v25;

  v6 = sub_2312A5394(a1);
  v8 = v7;
  v9 = sub_2312A55FC(a1);
  v11 = v10;
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_hk_hearingHealthKeyColor);
  v14 = objc_msgSend(v12, sel_secondarySystemBackgroundColor);
  v15 = 0.0;
  if (a2 > 0.0)
    v16 = a2;
  else
    v16 = 0.0;
  if (v16 > 1.0)
    v16 = 1.0;
  if (a3 > 0.0)
    v15 = a3;
  if (v15 > 1.0)
    v15 = 1.0;
  v19[0] = v6;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v11;
  v19[4] = 0;
  v19[5] = 0;
  v20 = 1;
  if ((float)(1.0 - v16) < v15)
    v15 = 1.0 - v16;
  v21 = v16;
  v22 = v15;
  v23 = v13;
  v24 = v14;
  v25 = 0x4010000000000000;
  v17 = objc_allocWithZone((Class)type metadata accessor for SoundLevelView());
  return SoundLevelView.init(model:)((uint64_t)v19);
}

uint64_t sub_2312A5974()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

uint64_t sub_2312A5A34()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

uint64_t sub_2312A5AFC()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

id sub_2312A5BC0()
{
  id v0;
  void *v1;
  id v2;

  if (qword_2541597F0 != -1)
    swift_once();
  v0 = (id)qword_25415A9E8;
  v1 = (void *)sub_2312BBD68();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v1, v0);

  if (v2)
    return v2;
  else
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
}

uint64_t sub_2312A5C94()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2312A02C8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BDB80;
  *(_QWORD *)(inited + 32) = objc_msgSend((id)objc_opt_self(), sel_audiogramSampleType);
  sub_2312BBE28();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
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
  sub_23129AB0C(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

void sub_2312A5D6C()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_255EC39D8)
  {
    sub_2312BB564();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_255EC39D8);
  }
}

void sub_2312A5DD8(void *a1)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2312BB354();

  sub_2312924A4(1);
  v4 = objc_allocWithZone((Class)sub_2312BB588());
  v7 = (id)sub_2312BB57C();
  v5 = objc_msgSend(a1, sel_navigationController, 0xE000000000000000);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_pushViewController_animated_, v7, 1);

  }
}

unint64_t sub_2312A5F08()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_2312A5F38()
{
  return sub_2312A64BC();
}

uint64_t sub_2312A5F54(uint64_t a1, uint64_t a2)
{
  uint64_t ObjCClassFromMetadata;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v6 = sub_2312BB354();
  v8 = v7;

  v9 = v6 == a1 && v8 == a2;
  if (v9 || (sub_2312BC128() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v6;
}

char *sub_2312A604C(float a1, float a2)
{
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  float v18;
  float v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  char v26;
  float v27;
  float v28;
  id v29;
  id v30;
  uint64_t v31;

  sub_2312BC020();
  swift_bridgeObjectRelease();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = sub_2312BB354();
  v23 = v8;
  v24 = v7;
  swift_bridgeObjectRelease();

  sub_2312BC020();
  swift_bridgeObjectRelease();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  v9 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v22 = sub_2312BB354();
  v11 = v10;
  swift_bridgeObjectRelease();

  sub_2312BC020();
  swift_bridgeObjectRelease();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  v12 = sub_2312A5F54(0x4E4F4954434553, 0xE700000000000000);
  v14 = v13;
  swift_bridgeObjectRelease();
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_hk_hearingHealthKeyColor, 0xE000000000000000);
  v17 = objc_msgSend(v15, sel_secondarySystemBackgroundColor);
  v18 = 0.0;
  if (a1 > 0.0)
    v19 = a1;
  else
    v19 = 0.0;
  if (v19 > 1.0)
    v19 = 1.0;
  if (a2 > 0.0)
    v18 = a2;
  if (v18 > 1.0)
    v18 = 1.0;
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v11;
  v25[4] = v12;
  v25[5] = v14;
  v26 = 1;
  if ((float)(1.0 - v19) < v18)
    v18 = 1.0 - v19;
  v27 = v19;
  v28 = v18;
  v29 = v16;
  v30 = v17;
  v31 = 0x4010000000000000;
  v20 = objc_allocWithZone((Class)type metadata accessor for SoundLevelView());
  return SoundLevelView.init(model:)((uint64_t)v25);
}

uint64_t sub_2312A64BC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t, uint64_t);
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char **v17;
  char *v18;
  char *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  uint64_t ObjCClassFromMetadata;
  uint64_t v29;

  sub_23128D554(0, (unint64_t *)&qword_255EC39D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v0 = sub_2312BB570();
  v26 = *(_QWORD *)(v0 - 8);
  v1 = *(_QWORD *)(v26 + 72);
  v2 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_2312BDC60;
  v3 = (uint64_t *)(v29 + v2);
  sub_2312BC020();
  swift_bridgeObjectRelease();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v27 = (void *)objc_opt_self();
  v4 = objc_msgSend(v27, sel_bundleForClass_, ObjCClassFromMetadata);
  v5 = sub_2312BB354();
  v7 = v6;
  swift_bridgeObjectRelease();

  *v3 = v5;
  v3[1] = v7;
  v3[2] = 0;
  v8 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v26 + 104);
  v8(v3, *MEMORY[0x24BE3F8D0], v0);
  v9 = (char *)v3 + v1;
  *(_QWORD *)v9 = sub_2312A604C(0.0, 0.1);
  v9[8] = 1;
  v10 = *MEMORY[0x24BE3F8A0];
  v8((uint64_t *)((char *)v3 + v1), v10, v0);
  v11 = (char *)v3 + 2 * v1;
  *(_QWORD *)v11 = sub_2312A604C(0.1, 0.1);
  v11[8] = 1;
  v8((uint64_t *)v11, v10, v0);
  v12 = (char *)v3 + 3 * v1;
  *(_QWORD *)v12 = sub_2312A604C(0.2, 0.1);
  v12[8] = 1;
  v8((uint64_t *)v12, v10, v0);
  v13 = (char *)v3 + 4 * v1;
  *(_QWORD *)v13 = sub_2312A604C(0.3, 0.1);
  v13[8] = 1;
  v8((uint64_t *)v13, v10, v0);
  v14 = (char *)v3 + 5 * v1;
  *(_QWORD *)v14 = sub_2312A604C(0.4, 0.1);
  v14[8] = 1;
  v8((uint64_t *)v14, v10, v0);
  v15 = (char *)v3 + 6 * v1;
  *(_QWORD *)v15 = sub_2312A604C(0.5, 0.1);
  v15[8] = 1;
  v8((uint64_t *)v15, v10, v0);
  v16 = (char *)v3 + 7 * v1;
  *(_QWORD *)v16 = sub_2312A604C(0.6, 0.1);
  v16[8] = 1;
  v8((uint64_t *)v16, v10, v0);
  v17 = (char **)&v3[v1];
  *v17 = sub_2312A604C(0.7, 0.1);
  *((_BYTE *)v17 + 8) = 1;
  v8((uint64_t *)v17, v10, v0);
  v18 = (char *)v3 + 9 * v1;
  *(_QWORD *)v18 = sub_2312A604C(0.8, 0.1);
  v18[8] = 1;
  v8((uint64_t *)v18, v10, v0);
  v19 = (char *)v3 + 10 * v1;
  *(_QWORD *)v19 = sub_2312A604C(0.9, 0.1);
  v19[8] = 1;
  v8((uint64_t *)v19, v10, v0);
  sub_2312BC020();
  swift_bridgeObjectRelease();
  sub_2312BC110();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  v20 = (uint64_t *)((char *)v3 + 11 * v1);
  sub_2312BBDD4();
  v21 = objc_msgSend(v27, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v22 = sub_2312BB354();
  v24 = v23;
  swift_bridgeObjectRelease();

  *v20 = v22;
  v20[1] = v24;
  v8(v20, *MEMORY[0x24BE3F920], v0);
  return v29;
}

uint64_t sub_2312A6A80()
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
  id v11;
  void *v12;
  id v13;
  void (*v14)(_QWORD);
  void (*v15)(uint64_t *, uint64_t, uint64_t);
  uint64_t *v16;
  uint64_t ObjCClassFromMetadata;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t *, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void (**v68)(void *);
  id v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, _QWORD, unint64_t);
  uint64_t *v86;
  uint64_t v87;
  void (*v88)(uint64_t *, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t *v111;
  uint64_t v112;
  void (*v113)(uint64_t *, uint64_t, uint64_t);
  char *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v120;
  unsigned int v121;
  void (*v122)(char *, _QWORD, unint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  unint64_t v130;
  id v131;
  unsigned int v132;
  uint64_t v133;
  unsigned int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  void (*v139)(uint64_t *, uint64_t, uint64_t);
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v129 = (char *)&v120 - v1;
  sub_23128D554(0, (unint64_t *)&qword_255EC39D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v3 = v2;
  v4 = sub_2312BB570();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 72);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = (v7 + 32) & ~v7;
  v127 = v7 | 7;
  v128 = v3;
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2312BDC70;
  v133 = v9;
  v10 = v9 + v8;
  if (qword_2541597F0 != -1)
    swift_once();
  v11 = (id)qword_25415A9E8;
  v126 = 0xD00000000000001ELL;
  v12 = (void *)sub_2312BBD68();
  v13 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v12, v11);

  if (!v13)
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  *(_QWORD *)(v133 + v8) = v13;
  *(_BYTE *)(v10 + 8) = 0;
  v14 = *(void (**)(_QWORD))(v5 + 104);
  ((void (*)(uint64_t, _QWORD, uint64_t))v14)(v10, *MEMORY[0x24BE3F908], v4);
  v15 = (void (*)(uint64_t *, uint64_t, uint64_t))v14;
  v16 = (uint64_t *)(v10 + v6);
  v137 = v10;
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v136 = ObjCClassFromMetadata;
  v18 = (void *)objc_opt_self();
  v131 = v18;
  v19 = v4;
  v20 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  v130 = 0x80000002312BFEC0;
  v21 = sub_2312BB354();
  v22 = v6;
  v140 = v6;
  v23 = v21;
  v125 = v8;
  v25 = v24;

  *v16 = v23;
  v16[1] = v25;
  v26 = *MEMORY[0x24BE3F910];
  v135 = v19;
  v15(v16, v26, v19);
  v27 = v15;
  v28 = 2 * v22;
  v29 = v10 + 2 * v22;
  v30 = v136;
  v31 = objc_msgSend(v18, sel_bundleForClass_, v136);
  v138 = 0xD000000000000013;
  v32 = sub_2312BB354();
  v34 = v33;

  *(_QWORD *)v29 = v32;
  *(_QWORD *)(v29 + 8) = v34;
  *(_BYTE *)(v29 + 16) = 0;
  v134 = *MEMORY[0x24BE3F930];
  v139 = v27;
  ((void (*)(uint64_t))v27)(v29);
  v35 = v140;
  v123 = v28;
  v124 = v28 + v140;
  v36 = v137;
  v37 = (uint64_t *)(v137 + v28 + v140);
  v38 = v131;
  v39 = objc_msgSend(v131, sel_bundleForClass_, v30);
  v40 = sub_2312BB354();
  v42 = v41;

  *v37 = v40;
  v37[1] = v42;
  v37[2] = 0;
  v132 = *MEMORY[0x24BE3F8D0];
  v43 = v135;
  ((void (*)(uint64_t *))v27)(v37);
  v44 = v36 + 4 * v35;
  v45 = v38;
  v46 = v136;
  v47 = objc_msgSend(v38, sel_bundleForClass_, v136);
  v48 = sub_2312BB354();
  v50 = v49;

  *(_QWORD *)v44 = v48;
  *(_QWORD *)(v44 + 8) = v50;
  *(_BYTE *)(v44 + 16) = 0;
  v51 = v43;
  v139((uint64_t *)v44, v134, v43);
  v52 = v140;
  v53 = (uint64_t *)(v137 + 4 * v35 + v140);
  v54 = objc_msgSend(v45, sel_bundleForClass_, v46);
  v55 = sub_2312BB354();
  v57 = v56;

  *v53 = v55;
  v53[1] = v57;
  v53[2] = 0;
  v58 = v139;
  v139(v53, v132, v51);
  v59 = v137;
  v60 = v137 + 6 * v52;
  v61 = v131;
  v62 = objc_msgSend(v131, sel_bundleForClass_, v46);
  v63 = sub_2312BB354();
  v65 = v64;

  *(_QWORD *)v60 = v63;
  *(_QWORD *)(v60 + 8) = v65;
  *(_BYTE *)(v60 + 16) = 0;
  v58((uint64_t *)v60, v134, v51);
  v66 = (uint64_t *)(v59 - v140 + 8 * v140);
  sub_2312A5D6C();
  v137 = v67;
  v68 = (void (**)(void *))((char *)v66 + *(int *)(v67 + 64));
  v69 = v61;
  v70 = v61;
  v71 = v136;
  v72 = objc_msgSend(v70, sel_bundleForClass_, v136);
  v73 = sub_2312BB354();
  v75 = v74;

  *v66 = v73;
  v66[1] = v75;
  v76 = v69;
  v77 = v69;
  v78 = v71;
  v79 = objc_msgSend(v76, sel_bundleForClass_, v71);
  v80 = sub_2312BB354();
  v82 = v81;

  v66[2] = v80;
  v66[3] = v82;
  *v68 = sub_2312A5DD8;
  v68[1] = 0;
  v83 = *MEMORY[0x24BE3F8B0];
  v84 = sub_2312BB564();
  v85 = *(void (**)(char *, _QWORD, unint64_t))(*(_QWORD *)(v84 - 8) + 104);
  v126 = v84;
  v122 = v85;
  ((void (*)(void (**)(void *), uint64_t))v85)(v68, v83);
  v86 = v66;
  v121 = *MEMORY[0x24BE3F8E8];
  v87 = v135;
  v88 = v139;
  ((void (*)(uint64_t *))v139)(v86);
  v89 = sub_2312A64BC();
  v141 = v133;
  sub_2312A7B38(v89);
  v133 = v141;
  v90 = v125;
  v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = xmmword_2312BCCC0;
  v128 = v91;
  v92 = (uint64_t *)(v91 + v90);
  v93 = v78;
  v94 = objc_msgSend(v77, sel_bundleForClass_, v78);
  v95 = sub_2312BB354();
  v97 = v96;

  *v92 = v95;
  v92[1] = v97;
  v92[2] = 0;
  v88(v92, v132, v87);
  v98 = (uint64_t *)((char *)v92 + v140);
  v99 = objc_msgSend(v77, sel_bundleForClass_, v93);
  v100 = sub_2312BB354();
  v102 = v101;

  *v98 = v100;
  v98[1] = v102;
  v103 = objc_msgSend(v77, sel_bundleForClass_, v93);
  v104 = sub_2312BB354();
  v106 = v105;

  v98[2] = v104;
  v98[3] = v106;
  v107 = v129;
  sub_2312BB384();
  v108 = sub_2312BB390();
  v109 = *(_QWORD *)(v108 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v109 + 48))(v107, 1, v108) == 1)
    __break(1u);
  v110 = (char *)v98 + *(int *)(v137 + 64);
  (*(void (**)(char *, char *, uint64_t))(v109 + 32))(v110, v107, v108);
  v122(v110, *MEMORY[0x24BE3F8B8], v126);
  v111 = v98;
  v112 = v135;
  v113 = v139;
  v139(v111, v121, v135);
  v114 = (char *)v92 + v123;
  v115 = objc_msgSend(v77, sel_bundleForClass_, v93);
  v116 = sub_2312BB354();
  v118 = v117;

  *(_QWORD *)v114 = v116;
  *((_QWORD *)v114 + 1) = v118;
  v114[16] = 0;
  v113((uint64_t *)v114, v134, v112);
  v141 = v133;
  sub_2312A7B38(v128);
  return v141;
}

uint64_t sub_2312A753C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

ValueMetadata *type metadata accessor for HeadphoneListeningArticleDataProvider()
{
  return &type metadata for HeadphoneListeningArticleDataProvider;
}

uint64_t sub_2312A760C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

uint64_t sub_2312A76D4()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

id sub_2312A7798()
{
  id v0;
  void *v1;
  id v2;

  if (qword_2541597F0 != -1)
    swift_once();
  v0 = (id)qword_25415A9E8;
  v1 = (void *)sub_2312BBD68();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v1, v0);

  if (v2)
    return v2;
  else
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
}

uint64_t sub_2312A786C()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2312A02C8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BDB80;
  sub_231290310();
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD35B0]);
  sub_2312BBE28();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
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
  sub_23129AB0C(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for NoiseNotificationsSpecifierDataSource(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3A48);
}

uint64_t sub_2312A7958()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2312A79E4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_2312B32A4(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

uint64_t sub_2312A7B38(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_2312B33D8(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = sub_2312BB570();
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

uint64_t sub_2312A7CAC(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2312BC08C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x2348D9424](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2312A9FA4(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2312BC08C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_2312BBE28();
  }
  __break(1u);
  return result;
}

uint64_t sub_2312A7E64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;

  v3 = qword_254159760;
  v4 = *(id *)(v1 + qword_255EC3A08);
  if (v3 != -1)
    swift_once();
  v5 = objc_msgSend((id)qword_25415A948, sel_noiseEnabled);

  v6 = objc_msgSend((id)qword_25415A948, sel_notificationsEnabled);
  v7 = sub_2312BB600();
  v8 = (unsigned int *)MEMORY[0x24BE41298];
  if ((v5 & v6) == 0)
    v8 = (unsigned int *)MEMORY[0x24BE412A0];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(a1, *v8, v7);
}

uint64_t sub_2312A7F28@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unsigned int v17;
  unsigned int v18;
  void (*v19)(char *, uint64_t, uint64_t);
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  v32 = a1;
  swift_getObjectType();
  v3 = sub_2312BB600();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v31 - v8;
  v10 = sub_2312BB630();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129BBA8();
  v14 = sub_2312BB618();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    v31 = v14;
    v15 = qword_254159760;
    v16 = *(id *)(v2 + qword_255EC3A08);
    if (v15 != -1)
      swift_once();
    v17 = objc_msgSend((id)qword_25415A948, sel_noiseEnabled);

    v18 = objc_msgSend((id)qword_25415A948, sel_notificationsEnabled);
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
    v20 = *MEMORY[0x24BE41298];
    v21 = *MEMORY[0x24BE412A0];
    if ((v17 & v18) != 0)
      v22 = v20;
    else
      v22 = v21;
    v19(v9, v22, v3);
    sub_23129BC18((uint64_t)v9);
    v23 = *(void (**)(char *, uint64_t))(v4 + 8);
    v23(v9, v3);
    v24 = (void *)qword_25415A948;
    v25 = objc_msgSend((id)qword_25415A948, sel_noiseEnabled);
    if ((v25 & objc_msgSend(v24, sel_notificationsEnabled)) != 0)
      v26 = v20;
    else
      v26 = v21;
    v19(v7, v26, v3);
    sub_2312BB660();
    sub_2312BB648();
    v23(v7, v3);
    v27 = v32;
    sub_2312BBA20();
    v28 = sub_2312BBA2C();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 0, 1, v28);
  }
  else
  {
    v30 = sub_2312BBA2C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v32, 1, 1, v30);
  }
}

uint64_t sub_2312A81D4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;

  v1 = v0;
  v13 = MEMORY[0x24BEE4AF8];
  v2 = sub_2312A8354();
  sub_2312A7CAC(v2);
  v3 = qword_254159760;
  v4 = *(id *)(v0 + qword_255EC3A08);
  if (v3 != -1)
    swift_once();
  v5 = objc_msgSend((id)qword_25415A948, sel_noiseEnabled);

  if (v5)
  {
    *(_QWORD *)(v1 + qword_255EC3A20) = sub_2312A85F8();
    swift_bridgeObjectRelease();
    v6 = swift_bridgeObjectRetain();
    sub_2312A7CAC(v6);
  }
  v7 = v13;
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_2312BC080();
    swift_bridgeObjectRelease_n();
    return v12;
  }
  else
  {
    v8 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    sub_2312BC134();
    if (swift_dynamicCastMetatype() || (v10 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) == 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = (_QWORD *)(v8 + 32);
      while (*v11)
      {
        ++v11;
        if (!--v10)
          goto LABEL_7;
      }
      swift_bridgeObjectRelease();
      return v8 | 1;
    }
    return v7;
  }
}

uint64_t sub_2312A8354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v1 = v0;
  v2 = MEMORY[0x24BEE4AF8];
  v15 = MEMORY[0x24BEE4AF8];
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_2312BBD68();
  v5 = objc_msgSend(v3, sel_groupSpecifierWithID_, v4);

  if (v5)
  {
    v6 = qword_255EC3A00;
    v7 = objc_msgSend(*(id *)(v1 + qword_255EC3A00), sel_environmentalMeasurementsFooterDescription);
    if (!v7)
    {
      sub_2312BBD98();
      v7 = (id)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v5, sel_setProperty_forKey_, v7, *MEMORY[0x24BE75A68]);

    v8 = v5;
    MEMORY[0x2348D91D8]();
    if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2312BBE40();
    sub_2312BBE4C();
    sub_2312BBE28();
    v9 = objc_msgSend(*(id *)(v1 + v6), sel_environmentalMeasurementsTitleDescription);
    if (!v9)
    {
      sub_2312BBD98();
      v9 = (id)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    v10 = objc_msgSend(v3, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v9, v1, sel_setEnvironmentalSoundMeasurementsWithValue_, sel_environmentalSoundMeasurements, 0, 6, 0);

    if (v10)
    {
      v11 = (void *)sub_2312BBD68();
      objc_msgSend(v10, sel_setIdentifier_, v11);

      v12 = (void *)sub_2312BBE64();
      objc_msgSend(v10, sel_setProperty_forKey_, v12, *MEMORY[0x24BE75868]);

      v13 = v10;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

      return v15;
    }
    else
    {
      v2 = v15;

    }
  }
  return v2;
}

uint64_t sub_2312A85F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  NSString *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v26;
  NSRange v27;

  v1 = v0;
  v2 = MEMORY[0x24BEE4AF8];
  v26 = MEMORY[0x24BEE4AF8];
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_2312BBD68();
  v5 = objc_msgSend(v3, sel_groupSpecifierWithID_, v4);

  if (v5)
  {
    v6 = qword_255EC3A00;
    v7 = objc_msgSend(*(id *)(v1 + qword_255EC3A00), sel_noiseThresholdSectionTitle);
    if (!v7)
    {
      sub_2312BBD98();
      v7 = (id)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v5, sel_setName_, v7);

    v8 = objc_msgSend(*(id *)(v1 + v6), sel_noiseThresholdFooterDescription);
    if (!v8)
    {
      sub_2312BBD98();
      v8 = (id)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    sub_2312BBD98();
    v9 = objc_msgSend(*(id *)(v1 + v6), sel_noiseThresholdFooterLinkTitle);
    if (!v9)
    {
      sub_2312BBD98();
      v9 = (id)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    v10 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
    v11 = (void *)sub_2312BBD68();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, sel_initWithString_, v11);

    v13 = objc_msgSend(v12, sel_localizedStandardRangeOfString_, v9);
    v15 = v14;

    sub_2312BB3D8();
    v16 = (void *)sub_2312BBD68();
    objc_msgSend(v5, sel_setProperty_forKey_, v16, *MEMORY[0x24BE75A30]);

    objc_msgSend(v5, sel_setProperty_forKey_, v8, *MEMORY[0x24BE75A58]);
    v27.location = (NSUInteger)v13;
    v27.length = v15;
    v17 = NSStringFromRange(v27);
    if (!v17)
    {
      sub_2312BBD98();
      v17 = (NSString *)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v5, sel_setProperty_forKey_, v17, *MEMORY[0x24BE75A40]);

    v18 = objc_msgSend((id)objc_opt_self(), sel_valueWithNonretainedObject_, v1);
    objc_msgSend(v5, sel_setProperty_forKey_, v18, *MEMORY[0x24BE75A50]);
    v19 = (void *)sub_2312BBD68();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setProperty_forKey_, v19, *MEMORY[0x24BE75A38]);

    v20 = v5;
    MEMORY[0x2348D91D8]();
    if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2312BBE40();
    sub_2312BBE4C();
    sub_2312BBE28();
    v21 = objc_msgSend(*(id *)(v1 + v6), sel_noiseThresholdTitleDescription);
    if (!v21)
    {
      sub_2312BBD98();
      v21 = (id)sub_2312BBD68();
      swift_bridgeObjectRelease();
    }
    type metadata accessor for NoiseThresholdSpecifierViewController(0);
    v22 = objc_msgSend(v3, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v21, v1, 0, sel_getNoiseThresholdValue, swift_getObjCClassFromMetadata(), 2, 0);

    if (v22)
    {
      v23 = (void *)sub_2312BBD68();
      objc_msgSend(v22, sel_setIdentifier_, v23);

      objc_msgSend(v22, sel_setButtonAction_, sel_didSelectNoiseThreshold);
      v24 = v22;
      MEMORY[0x2348D91D8]();
      if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2312BBE40();
      sub_2312BBE4C();
      sub_2312BBE28();

      return v26;
    }
    else
    {
      v2 = v26;

    }
  }
  return v2;
}

uint64_t sub_2312A8AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  sub_23128D554(0, &qword_255EC3798, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v30 - v2;
  sub_23129EEE0(0);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EEFC();
  v10 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  v32 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EF78();
  v14 = *(_QWORD *)(v13 - 8);
  v33 = v13;
  v34 = v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312A9DF4();
  v18 = *(_QWORD *)(v17 - 8);
  v35 = v17;
  v36 = v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(void **)(v0 + qword_255EC3A08);
  swift_beginAccess();
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  v22 = v21;
  sub_2312BBC84();
  swift_endAccess();

  sub_23128A728((unint64_t *)&unk_254159610, (uint64_t (*)(uint64_t))sub_23129EEE0, MEMORY[0x24BDB9EE8]);
  sub_2312BBCF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
  v37 = (id)sub_2312BBF00();
  v23 = sub_2312BBEF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v3, 1, 1, v23);
  sub_23128A728((unint64_t *)&unk_255EC39B0, (uint64_t (*)(uint64_t))sub_23129EEFC, MEMORY[0x24BDB96F8]);
  sub_2312A46E4();
  v24 = v31;
  sub_2312BBCE4();
  sub_2312A9E6C((uint64_t)v3, &qword_255EC3798, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0]);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v24);
  swift_allocObject();
  v25 = v30;
  swift_unknownObjectWeakInit();
  sub_23128A728(qword_255EC37A8, (uint64_t (*)(uint64_t))sub_23129EF78, MEMORY[0x24BDB9A08]);
  v26 = v33;
  sub_2312BBCD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v16, v26);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_23128A728(&qword_255EC3B00, (uint64_t (*)(uint64_t))sub_2312A9DF4, MEMORY[0x24BDB97F8]);
  v27 = v35;
  v28 = sub_2312BBCFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v20, v27);
  *(_QWORD *)(v25 + qword_255EC3A10) = v28;
  return swift_release();
}

uint64_t sub_2312A8ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  char v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (_BYTE *)MEMORY[0x2348D9B2C](v2);
  if (v3)
  {
    v4 = v3[qword_255EC3A18] ^ 1;
    v3[qword_255EC3A18] = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

void sub_2312A8F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2348D9B2C](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v3 + qword_255EC3A28;
    swift_beginAccess();
    v6 = MEMORY[0x2348D9B2C](v5);

    if (v6)
    {
      swift_getObjectType();
      sub_2312BBA14();
      sub_2312BBA5C();
    }
  }
}

void sub_2312A8FE0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_getObjectType();
  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - v3;
  v5 = a1;
  sub_23129BA68((uint64_t)v4);
  v6 = sub_2312BB390();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
  {
    sub_2312A9E6C((uint64_t)v4, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  }
  else
  {
    sub_2312BB36C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }

}

id sub_2312A90E0(char *a1)
{
  void *v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  id v6;

  v1 = *(void **)&a1[qword_255EC3A08];
  v2 = qword_254159760;
  v3 = a1;
  v4 = v1;
  if (v2 != -1)
    swift_once();
  v5 = objc_msgSend((id)qword_25415A948, sel_noiseEnabled);

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v5);
  return v6;
}

uint64_t sub_2312A9188(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;

  v2 = v1;
  *(_BYTE *)(v2 + qword_255EC3A18) = 1;
  v4 = *(id *)(v2 + qword_255EC3A00);
  objc_msgSend(v4, sel_setNoiseEnabled_, objc_msgSend(a1, sel_BOOLValue));

  if (objc_msgSend(a1, sel_BOOLValue))
  {
    v5 = v2 + qword_255EC3A28;
    swift_beginAccess();
    if (MEMORY[0x2348D9B2C](v5))
    {
      swift_getObjectType();
      sub_2312BB9FC();
      sub_2312BBA5C();
    }
    v6 = sub_2312A85F8();
    v7 = qword_255EC3A20;
    *(_QWORD *)(v2 + qword_255EC3A20) = v6;
    swift_bridgeObjectRelease();
    result = MEMORY[0x2348D9B2C](v5);
    if (result)
    {
      v9 = *(_QWORD *)(v2 + v7);
      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_2312BC080();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain_n();
        sub_2312BC134();
        if (!swift_dynamicCastMetatype())
        {
          v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v12)
          {
            v13 = (_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
            do
            {
              if (!*v13)
                break;
              ++v13;
              --v12;
            }
            while (v12);
          }
        }
        swift_bridgeObjectRelease();
      }
      swift_getObjectType();
      sub_2312BB9F0();
      swift_bridgeObjectRelease();
      return sub_2312BBA5C();
    }
  }
  else
  {
    v10 = *(_QWORD *)(v2 + qword_255EC3A20);
    *(_QWORD *)(v2 + qword_255EC3A20) = MEMORY[0x24BEE4AF8];
    v11 = v2 + qword_255EC3A28;
    swift_beginAccess();
    if (MEMORY[0x2348D9B2C](v11))
    {
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_2312BC080();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_2312BC134();
        if (!swift_dynamicCastMetatype())
        {
          v14 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v14)
          {
            v15 = (_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
            do
            {
              if (!*v15)
                break;
              ++v15;
              --v14;
            }
            while (v14);
          }
        }
        swift_bridgeObjectRelease();
      }
      swift_getObjectType();
      sub_2312BBA08();
      swift_bridgeObjectRelease();
      sub_2312BBA5C();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    result = MEMORY[0x2348D9B2C](v11);
    if (result)
    {
      swift_getObjectType();
      sub_2312BB9FC();
      return sub_2312BBA5C();
    }
  }
  return result;
}

void sub_2312A94D4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2312A9188(v4);

}

id sub_2312A9528(char *a1)
{
  uint64_t v2;
  void *v3;
  char *v4;
  id v5;
  void *v6;

  v2 = qword_255EC3A00;
  v3 = *(void **)&a1[qword_255EC3A00];
  v4 = a1;
  v5 = objc_msgSend(*(id *)&a1[v2], sel_localizedNoiseThresholdValue_, objc_msgSend(v3, sel_noiseThresholdCurrentValue));
  sub_2312BBD98();

  v6 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_2312A95C0(char *a1)
{
  _QWORD *v2;
  void (*v3)(void);
  char *v4;
  id v5;

  v2 = (_QWORD *)MEMORY[0x2348D9B2C](&a1[qword_255EC3A30]);
  if (v2)
  {
    v3 = *(void (**)(void))(qword_255EC4100 + (*MEMORY[0x24BEE4EA0] & *v2) + 72);
    v5 = v2;
    v4 = a1;
    v3();

  }
}

void sub_2312A9654()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2312A9680()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  sub_23129F12C(v0 + qword_255EC3A28);
  return sub_23129F12C(v0 + qword_255EC3A30);
}

id sub_2312A973C()
{
  return sub_2312A37D8(type metadata accessor for NoiseNotificationsSpecifierDataSource);
}

uint64_t sub_2312A9748(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  sub_23129F12C(a1 + qword_255EC3A28);
  return sub_23129F12C(a1 + qword_255EC3A30);
}

uint64_t sub_2312A9810()
{
  return type metadata accessor for NoiseNotificationsSpecifierDataSource(0);
}

uint64_t type metadata accessor for NoiseNotificationsSettingsViewController(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3AA8);
}

uint64_t sub_2312A982C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2312A9878()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_255EC3A28;
  swift_beginAccess();
  return MEMORY[0x2348D9B2C](v1);
}

uint64_t sub_2312A98C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_255EC3A28;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return sub_2312BBA5C();
}

void (*sub_2312A992C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_255EC3A28;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2348D9B2C](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_2312A3440;
}

uint64_t (*sub_2312A99A0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2312BBA44();
  return sub_2312A99FC;
}

id sub_2312A9A08(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[2];

  v3 = v2;
  v22[0] = a2;
  v22[1] = swift_getObjectType();
  v6 = sub_2312BB774();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = qword_255EC3AA0;
  v11 = objc_allocWithZone((Class)type metadata accessor for NoiseAvailability());
  v12 = v2;
  v13 = sub_23128E180(0);
  *(_QWORD *)&v3[v10] = v13;
  *(_QWORD *)&v12[qword_255EC3A98] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  objc_allocWithZone((Class)type metadata accessor for NoiseNotificationsSpecifierDataSource(0));
  v14 = a1;
  v15 = v13;
  v16 = sub_2312AA224(v14, v15, (uint64_t)v9);

  sub_23128A728(&qword_255EC3B20, type metadata accessor for NoiseNotificationsSpecifierDataSource, (uint64_t)&unk_2312BDE9C);
  v17 = (char *)v16;
  v18 = (void *)sub_2312BB9A8();
  *(_QWORD *)&v17[qword_255EC3A30 + 8] = &off_250017A28;
  swift_unknownObjectWeakAssign();
  v19 = v18;
  sub_23129BAF8();
  v20 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setTitle_, v20);

  (*(void (**)(_QWORD, uint64_t))(v7 + 8))(v22[0], v6);
  return v19;
}

void sub_2312A9C08(char *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = qword_255EC3AA0;
  v6 = objc_allocWithZone((Class)type metadata accessor for NoiseAvailability());
  v7 = a3;
  *(_QWORD *)&a1[v5] = sub_23128E180(0);

  sub_2312BC068();
  __break(1u);
}

void sub_2312A9C9C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  sub_2312BB99C();
  v1 = *(void **)&v0[qword_255EC3A98];
  v2 = *(void **)&v0[qword_255EC3AA0];
  v3 = objc_allocWithZone((Class)type metadata accessor for NoiseThresholdSpecifierViewController(0));
  v6 = sub_2312B16B8(v1, v2);
  v4 = objc_msgSend(v0, sel_navigationController);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_pushViewController_animated_, v6, 1);

  }
}

void sub_2312A9D50()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2312A9D7C()
{
  uint64_t v0;

}

id sub_2312A9DA8()
{
  return sub_2312A37D8(type metadata accessor for NoiseNotificationsSettingsViewController);
}

void sub_2312A9DB4(uint64_t a1)
{

}

uint64_t sub_2312A9DEC()
{
  return type metadata accessor for NoiseNotificationsSettingsViewController(0);
}

void sub_2312A9DF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3AF8)
  {
    sub_23129EF78();
    sub_23128A728(qword_255EC37A8, (uint64_t (*)(uint64_t))sub_23129EF78, MEMORY[0x24BDB9A08]);
    v0 = sub_2312BBC0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3AF8);
  }
}

uint64_t sub_2312A9E6C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23128D554(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2312A9EB0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2312A9ED4(uint64_t a1)
{
  uint64_t v1;

  return sub_2312A8ED4(a1, v1);
}

void sub_2312A9EDC(uint64_t a1)
{
  uint64_t v1;

  sub_2312A8F40(a1, v1);
}

uint64_t (*sub_2312A9EE4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2312A9F38(v6, a2, a3);
  return sub_2312A99FC;
}

void (*sub_2312A9F38(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2348D9418](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for AudiogramDataManagementComponent;
  }
  __break(1u);
  return result;
}

uint64_t sub_2312A9FA4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2312BC08C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2312BC08C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2312AA1C0();
        sub_23128A728(&qword_255EC3B18, (uint64_t (*)(uint64_t))sub_2312AA1C0, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_2312A9EE4(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_23128AC6C(0, &qword_255EC3B08);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

void sub_2312AA1C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3B10)
  {
    sub_23128AC6C(255, &qword_255EC3B08);
    v0 = sub_2312BBE58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3B10);
  }
}

id sub_2312AA224(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;

  swift_getObjectType();
  sub_23128D554(0, (unint64_t *)&unk_255EC38E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42170], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - v8;
  v10 = (_QWORD *)(v3 + qword_255EC39E0);
  *v10 = 0xD000000000000029;
  v10[1] = 0x80000002312C0810;
  v11 = (_QWORD *)(v3 + qword_255EC39E8);
  *v11 = 0xD00000000000002ALL;
  v11[1] = 0x80000002312C0840;
  v12 = (_QWORD *)(v3 + qword_255EC39F0);
  *v12 = 0xD000000000000018;
  v12[1] = 0x80000002312C0870;
  v13 = (_QWORD *)(v3 + qword_255EC39F8);
  *v13 = 0xD00000000000001CLL;
  v13[1] = 0x80000002312C0890;
  *(_QWORD *)(v3 + qword_255EC3A10) = 0;
  *(_BYTE *)(v3 + qword_255EC3A18) = 0;
  *(_QWORD *)(v3 + qword_255EC3A20) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + qword_255EC3A28 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v3 + qword_255EC3A30 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v3 + qword_255EC3A00) = a1;
  *(_QWORD *)(v3 + qword_255EC3A08) = a2;
  sub_23129BB8C();
  v14 = sub_2312BB774();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v9, a3, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
  v16 = a1;
  v17 = a2;
  v18 = (id)sub_2312BB768();
  sub_2312A8AD4();

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v18;
}

double sub_2312AA464@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t (*v8)();
  id v9;
  unint64_t *v10;
  void *v11;
  double result;
  char v13;
  objc_class *v14;

  v3 = objc_msgSend(a1, sel_identifier);
  v4 = sub_2312BBD98();
  v6 = v5;

  if (v4 == 0xD00000000000002ALL && v6 == 0x80000002312BEB60 || (sub_2312BC128() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v7 = (objc_class *)type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider();
    v8 = type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider;
    v9 = objc_msgSend(objc_allocWithZone(v7), sel_init);
    *(_QWORD *)(a2 + 24) = v7;
    v10 = (unint64_t *)&unk_255EC3B30;
    v11 = &unk_2312BD768;
LABEL_5:
    *(_QWORD *)(a2 + 32) = sub_23128A728(v10, (uint64_t (*)(uint64_t))v8, (uint64_t)v11);
    *(_QWORD *)a2 = v9;
    return result;
  }
  if (v4 == 0xD000000000000033 && v6 == 0x80000002312BEB90)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    v14 = (objc_class *)type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider();
    v8 = type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider;
    v9 = objc_msgSend(objc_allocWithZone(v14), sel_init);
    *(_QWORD *)(a2 + 24) = v14;
    v10 = (unint64_t *)&unk_255EC3B28;
    v11 = &unk_2312BCAA0;
    goto LABEL_5;
  }
  v13 = sub_2312BC128();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
    goto LABEL_10;
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_2312AA600@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2312AA464(a1, a2);
}

ValueMetadata *type metadata accessor for HearingHealthArticleDataProvider()
{
  return &type metadata for HearingHealthArticleDataProvider;
}

unint64_t sub_2312AA624()
{
  return 0xD000000000000028;
}

uint64_t sub_2312AA658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  void (*v9)(unint64_t);
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t ObjCClassFromMetadata;
  unsigned int v76;
  uint64_t v77;
  unsigned int v78;
  unint64_t v79;

  sub_2312AB368();
  v0 = sub_2312BB570();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2312BDF30;
  v74 = v3;
  v73 = v4;
  v5 = v4 + v3;
  if (qword_2541597F0 != -1)
    swift_once();
  v6 = (id)qword_25415A9E8;
  v7 = (void *)sub_2312BBD68();
  v72 = (id)objc_opt_self();
  v8 = objc_msgSend(v72, sel_imageNamed_inBundle_, v7, v6);

  if (!v8)
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  *(_QWORD *)v5 = v8;
  *(_BYTE *)(v5 + 8) = 0;
  v9 = *(void (**)(unint64_t))(v1 + 104);
  v9(v5);
  v10 = (uint64_t *)(v5 + v2);
  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  v79 = v5;
  v13 = sub_2312BB354();
  v77 = v0;
  v14 = v2;
  v16 = v15;

  *v10 = v13;
  v10[1] = v16;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v9)(v10, *MEMORY[0x24BE3F910], v0);
  v17 = (uint64_t *)(v5 + 2 * v14);
  v18 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v19 = sub_2312BB354();
  v21 = v20;

  *v17 = v19;
  v17[1] = v21;
  v17[2] = 0;
  v76 = *MEMORY[0x24BE3F8D0];
  v22 = v0;
  v9((unint64_t)v17);
  v23 = v5 + 3 * v14;
  v24 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v25 = sub_2312BB354();
  v27 = v26;

  *(_QWORD *)v23 = v25;
  *(_QWORD *)(v23 + 8) = v27;
  *(_BYTE *)(v23 + 16) = 0;
  v28 = *MEMORY[0x24BE3F930];
  v78 = *MEMORY[0x24BE3F930];
  v29 = v22;
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v23, v28, v22);
  v30 = v79 + 4 * v14;
  v31 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v32 = sub_2312BB354();
  v34 = v33;

  *(_QWORD *)v30 = v32;
  *(_QWORD *)(v30 + 8) = v34;
  *(_BYTE *)(v30 + 16) = 0;
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v30, v28, v29);
  v35 = (uint64_t *)(v79 + 5 * v14);
  v36 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v37 = sub_2312BB354();
  v39 = v38;

  *v35 = v37;
  v35[1] = v39;
  v35[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v9)(v35, v76, v77);
  v40 = v79 + 6 * v14;
  v41 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v42 = sub_2312BB354();
  v44 = v43;

  *(_QWORD *)v40 = v42;
  *(_QWORD *)(v40 + 8) = v44;
  *(_BYTE *)(v40 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v9)(v40, v78, v77);
  v45 = v79 - v14 + 8 * v14;
  v46 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v47 = sub_2312BB354();
  v49 = v48;

  *(_QWORD *)v45 = v47;
  *(_QWORD *)(v45 + 8) = v49;
  *(_BYTE *)(v45 + 16) = 0;
  ((void (*)(uint64_t, _QWORD, uint64_t))v9)(v45, v78, v77);
  v50 = (id)qword_25415A9E8;
  v51 = (void *)sub_2312BBD68();
  v52 = objc_msgSend(v72, sel_imageNamed_inBundle_, v51, v50, 0xE000000000000000);

  if (!v52)
    v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v53 = v79 + 8 * v14;
  *(_QWORD *)v53 = v52;
  *(_BYTE *)(v53 + 8) = 1;
  ((void (*)(void))v9)();
  v54 = v79 + 9 * v14;
  v55 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  v56 = sub_2312BB354();
  v58 = v57;

  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v58;
  *(_BYTE *)(v54 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v9)(v54, v78, v77);
  v59 = sub_2312A5F38();
  sub_2312A7B38(v59);
  v60 = swift_allocObject();
  *(_OWORD *)(v60 + 16) = xmmword_2312BCC00;
  v61 = (uint64_t *)(v60 + v74);
  v62 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v63 = sub_2312BB354();
  v65 = v64;

  *v61 = v63;
  v61[1] = v65;
  v61[2] = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v9)(v60 + v74, v76, v77);
  v66 = v60 + v74 + v14;
  v67 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v68 = sub_2312BB354();
  v70 = v69;

  *(_QWORD *)v66 = v68;
  *(_QWORD *)(v66 + 8) = v70;
  *(_BYTE *)(v66 + 16) = 0;
  ((void (*)(uint64_t, _QWORD, uint64_t))v9)(v66, v78, v77);
  sub_2312A7B38(v60);
  return v73;
}

uint64_t sub_2312AAF70()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

uint64_t sub_2312AB030()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

uint64_t sub_2312AB0F8()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HearingAppPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_2312BB354();

  return v2;
}

id sub_2312AB1BC()
{
  id v0;
  void *v1;
  id v2;

  if (qword_2541597F0 != -1)
    swift_once();
  v0 = (id)qword_25415A9E8;
  v1 = (void *)sub_2312BBD68();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v1, v0);

  if (v2)
    return v2;
  else
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
}

uint64_t sub_2312AB290()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2312A02C8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BDB80;
  sub_231290310();
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD3578]);
  sub_2312BBE28();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
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
  sub_23129AB0C(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

void sub_2312AB368()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC39D0)
  {
    sub_2312BB570();
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC39D0);
  }
}

Swift::String *onboardingFeedItemIdentifierPrefix.unsafeMutableAddressor()
{
  return &onboardingFeedItemIdentifierPrefix;
}

Swift::Void __swiftcall HUNoiseSettings.setUpNoiseNotifications()()
{
  void *v0;

  objc_msgSend(v0, sel_setOnboardingCompleted_, 1);
  objc_msgSend(v0, sel_setNoiseEnabled_, 1);
  objc_msgSend(v0, sel_setNotificationsEnabled_, 1);
  objc_msgSend(v0, sel_setNotificationThreshold_, 90);
}

id HUNoiseSettings.isNoiseOnboardingCompleted.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_onboardingCompleted);
}

id sub_2312AB444()
{
  id *v0;

  return objc_msgSend(*v0, sel_onboardingCompleted);
}

uint64_t sub_2312AB464()
{
  uint64_t result;
  uint64_t v1;

  result = sub_2312BBDE0();
  qword_25415A9D8 = result;
  unk_25415A9E0 = v1;
  return result;
}

uint64_t sub_2312AB490(uint64_t a1)
{
  return sub_2312AB4F8(a1, qword_25415A9C0);
}

uint64_t *sub_2312AB4A4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_2312AB4E4(uint64_t a1)
{
  return sub_2312AB4F8(a1, qword_255EC4110);
}

uint64_t sub_2312AB4F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2312BBBC4();
  sub_2312AB4A4(v3, a2);
  sub_23128A1E0(v3, (uint64_t)a2);
  if (qword_2541597B0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_2312BBDE0();
  return sub_2312BBBB8();
}

void sub_2312AB5A4(void *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _OWORD v27[2];
  uint64_t v28[4];

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_getActivePairedDevice);

    if (v4)
    {
      if (objc_msgSend(v4, sel_valueForProperty_, *MEMORY[0x24BE6B3E0]))
      {
        sub_2312BBFC0();
        sub_2312BBA5C();
      }
      else
      {
        memset(v27, 0, sizeof(v27));
      }
      sub_23128D688((uint64_t)v27, (uint64_t)v28);
      if (v28[3])
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v5 = a1;
          v6 = a1;
          swift_bridgeObjectRetain();
          v7 = sub_2312BBBAC();
          v8 = sub_2312BBEC4();
          if (os_log_type_enabled(v7, v8))
          {
            v9 = swift_slowAlloc();
            v10 = swift_slowAlloc();
            v28[0] = v10;
            *(_DWORD *)v9 = 136446722;
            v11 = sub_2312BC1E8();
            *(_QWORD *)&v27[0] = sub_2312AE104(v11, v12, v28);
            sub_2312BBF9C();
            swift_bridgeObjectRelease();
            *(_WORD *)(v9 + 12) = 2082;
            swift_getErrorValue();
            v13 = sub_2312BC14C();
            *(_QWORD *)&v27[0] = sub_2312AE104(v13, v14, v28);
            sub_2312BBF9C();
            swift_bridgeObjectRelease();

            *(_WORD *)(v9 + 22) = 2082;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v27[0] = sub_2312AE104(v25, v26, v28);
            sub_2312BBF9C();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_231285000, v7, v8, "[%{public}s] Could not access isHeadphoneExposureNotificationsEnabledOnActiveWatch. Error: %{public}s Watch Software %{public}s", (uint8_t *)v9, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x2348D9AB4](v10, -1, -1);
            MEMORY[0x2348D9AB4](v9, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          return;
        }

      }
      else
      {

        sub_2312ACEB0((uint64_t)v28);
      }
    }
  }
  v15 = a1;
  v16 = a1;
  v17 = sub_2312BBBAC();
  v18 = sub_2312BBEC4();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v28[0] = v20;
    *(_DWORD *)v19 = 136446466;
    v21 = sub_2312BC1E8();
    *(_QWORD *)&v27[0] = sub_2312AE104(v21, v22, v28);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    swift_getErrorValue();
    v23 = sub_2312BC14C();
    *(_QWORD *)&v27[0] = sub_2312AE104(v23, v24, v28);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_231285000, v17, v18, "[%{public}s] Could not access isHeadphoneExposureNotificationsEnabledOnActiveWatch. Error: %{public}s Could not access active device properties.", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v20, -1, -1);
    MEMORY[0x2348D9AB4](v19, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_2312ABA40()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2312ABAB0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  return swift_release();
}

uint64_t sub_2312ABB14()
{
  uint64_t v0;
  uint64_t (*v1)(void);
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  char v28;

  v1 = MEMORY[0x24BDB9EF0];
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  v25 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - v3;
  sub_23128F05C(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v24 - v9;
  sub_23128D644(0, (unint64_t *)&qword_254159648, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))v1);
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  v16 = v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability__promotionVisibility;
  v28 = 0;
  sub_2312BBC78();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  v17 = v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability__featureStatus;
  v18 = sub_2312BB600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  sub_23128F0CC((uint64_t)v10, (uint64_t)v8);
  sub_2312BBC78();
  sub_23128F110((uint64_t)v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v17, v4, v26);
  v19 = OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability_logger;
  if (qword_2541597A8 != -1)
    swift_once();
  v20 = sub_2312BBBC4();
  v21 = sub_23128A1E0(v20, (uint64_t)qword_25415A9C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v0 + v19, v21, v20);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability_notificationsCancellable) = 0;
  sub_2312ABDA8();
  v22 = sub_2312ABF24();
  swift_getKeyPath();
  swift_getKeyPath();
  v27 = v22;
  swift_retain();
  sub_2312BBC9C();
  sub_2312AC5E8();
  return v0;
}

uint64_t sub_2312ABDA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  char v7;
  unsigned int *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_23128F05C(0);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v13 - v4;
  if (!sub_2312AC268())
  {
    v8 = (unsigned int *)MEMORY[0x24BE41288];
    goto LABEL_11;
  }
  v6 = objc_msgSend((id)objc_opt_self(), sel_isHeadphoneExposureNotificationsEnabled);
  v7 = sub_2312AC16C();
  if (v7 != 2)
  {
    if (v7)
      v9 = 1;
    else
      v9 = v6;
    if ((v9 & 1) == 0)
      goto LABEL_4;
LABEL_10:
    v8 = (unsigned int *)MEMORY[0x24BE41298];
    goto LABEL_11;
  }
  if (v6)
    goto LABEL_10;
LABEL_4:
  v8 = (unsigned int *)MEMORY[0x24BE412A0];
LABEL_11:
  v10 = *v8;
  v11 = sub_2312BB600();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v5, v10, v11);
  sub_2312BB600();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 0, 1, v11);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23128F0CC((uint64_t)v5, (uint64_t)v3);
  swift_retain();
  sub_2312BBC9C();
  return sub_23128F110((uint64_t)v5);
}

BOOL sub_2312ABF24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unsigned int v5;
  char v6;
  _BOOL4 v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_2312BBBC4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_isHeadphoneExposureNotificationsEnabled);
  v6 = sub_2312AC16C();
  if (v6 == 2)
  {
    if (!v5)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = v6 != 0;
    if ((v5 & 1) == 0)
      goto LABEL_6;
  }
  v7 = 1;
LABEL_6:
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability_logger, v1);
  v8 = sub_2312BBBAC();
  v9 = sub_2312BBED0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v20 = v11;
    *(_DWORD *)v10 = 136446722;
    v12 = sub_2312BC1E8();
    v14 = sub_2312AE104(v12, v13, &v20);
    v18 = v1;
    v19 = v14;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 1024;
    LODWORD(v19) = v7;
    sub_2312BBF9C();
    *(_WORD *)(v10 + 18) = 1024;
    v15 = !v7;
    LODWORD(v19) = !v7;
    sub_2312BBF9C();
    _os_log_impl(&dword_231285000, v8, v9, "[%{public}s] Feature Enabled %{BOOL}d. Promotion Visble: %{BOOL}d", (uint8_t *)v10, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v11, -1, -1);
    MEMORY[0x2348D9AB4](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return !v7;
  }
  return v15;
}

uint64_t sub_2312AC16C()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;
  id v4[2];

  v4[1] = *(id *)MEMORY[0x24BDAC8D0];
  if ((sub_2312BB660() & 1) != 0)
  {
    v0 = (void *)objc_opt_self();
    if (objc_msgSend(v0, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch))
    {
      v4[0] = 0;
      result = (uint64_t)objc_msgSend(v0, sel_isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError_, v4);
      if (!v4[0])
        return result;
      v2 = v4[0];
      swift_willThrow();
      if (qword_2541597A8 != -1)
        swift_once();
      v3 = sub_2312BBBC4();
      sub_23128A1E0(v3, (uint64_t)qword_25415A9C0);
      sub_2312AB5A4(v2);

    }
  }
  return 2;
}

BOOL sub_2312AC268()
{
  void *v0;
  unsigned __int8 v1;
  char v2;
  char v3;
  char v4;
  _BOOL4 v5;

  v0 = (void *)objc_opt_self();
  if (!objc_msgSend(v0, sel_isHeadphoneExposureNotificationsEnabled))
  {
    if (sub_2312AC16C() != 2)
      sub_2312AC320();
    goto LABEL_8;
  }
  v1 = objc_msgSend(v0, sel_isHeadphoneExposureMeasureLevelsEnabled);
  v2 = sub_2312AC16C();
  if (v2 == 2 || (v3 = v2, v4 = sub_2312AC320(), v4 == 2))
  {
    if ((v1 & 1) == 0)
    {
      v5 = 1;
      return !v5;
    }
LABEL_8:
    v5 = 0;
    return !v5;
  }
  if (!v3)
    goto LABEL_8;
  v5 = v4 == 0;
  if ((v1 & 1) != 0)
    goto LABEL_8;
  return !v5;
}

uint64_t sub_2312AC320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_2312BBBC4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_2312BB660() & 1) == 0)
    return 2;
  v5 = (void *)objc_opt_self();
  if (!objc_msgSend(v5, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch))
    return 2;
  v22[0] = 0;
  v6 = objc_msgSend(v5, sel_isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError_, v22);
  if (!v22[0])
    return (uint64_t)v6;
  v7 = v22[0];
  swift_willThrow();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability_logger, v1);
  v8 = v7;
  v9 = sub_2312BBBAC();
  v10 = sub_2312BBEC4();
  if (!os_log_type_enabled(v9, v10))
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 2;
  }
  v11 = swift_slowAlloc();
  v20 = (void *)swift_slowAlloc();
  v22[0] = v20;
  *(_DWORD *)v11 = 136446466;
  v12 = sub_2312BC1E8();
  v21 = sub_2312AE104(v12, v13, (uint64_t *)v22);
  sub_2312BBF9C();
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 12) = 2082;
  swift_getErrorValue();
  v14 = sub_2312BC14C();
  v21 = sub_2312AE104(v14, v15, (uint64_t *)v22);
  sub_2312BBF9C();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_231285000, v9, v10, "[%{public}s] Could not access isHeadphoneExposureMeasureLevelsEnabledOnActiveWatch. Error: %{public}s", (uint8_t *)v11, 0x16u);
  v16 = 2;
  v17 = v20;
  swift_arrayDestroy();
  MEMORY[0x2348D9AB4](v17, -1, -1);
  MEMORY[0x2348D9AB4](v11, -1, -1);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v16;
}

uint64_t sub_2312AC5E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  sub_2312ACC0C();
  v3 = *(_QWORD *)(v2 - 8);
  v20 = v2;
  v21 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2312BBF24();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDD0078];
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  sub_23128A728(&qword_254158CE8, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneNotificationsAvailability, (uint64_t)&unk_2312BE0F0);
  v14 = sub_2312BB708();
  objc_msgSend((id)objc_opt_self(), sel_startObservingForChanges);
  v15 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_2312BBF30();

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v6);
  v22 = v14;
  sub_2312ACCD4();
  sub_23128A728(&qword_254158EC0, v7, MEMORY[0x24BDD0070]);
  sub_23128A728(&qword_254158EB0, (uint64_t (*)(uint64_t))sub_2312ACCD4, MEMORY[0x24BDB9AF8]);
  swift_retain();
  sub_2312BBC00();
  swift_allocObject();
  swift_weakInit();
  sub_23128A728(&qword_254158EA0, (uint64_t (*)(uint64_t))sub_2312ACC0C, MEMORY[0x24BDB9798]);
  v16 = v20;
  v17 = sub_2312BBCFC();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v6);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability_notificationsCancellable) = v17;
  return swift_release();
}

uint64_t sub_2312AC880()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2312ABDA8();
    sub_2312ABF24();
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_2312BBC9C();
  }
  return result;
}

uint64_t sub_2312AC914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability__promotionVisibility;
  v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0];
  sub_23128D644(0, (unint64_t *)&qword_254159648, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v1, v3);
  v4 = v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability__featureStatus;
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v0 + OBJC_IVAR____TtC16HearingAppPlugin34HeadphoneNotificationsAvailability_logger;
  v7 = sub_2312BBBC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2312AC9FC()
{
  return type metadata accessor for HeadphoneNotificationsAvailability();
}

uint64_t type metadata accessor for HeadphoneNotificationsAvailability()
{
  uint64_t result;

  result = qword_254159398;
  if (!qword_254159398)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2312ACA40()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23128D644(319, (unint64_t *)&qword_254159648, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_23128D554(319, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
    if (v1 <= 0x3F)
    {
      sub_2312BBBC4();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_2312ACB18@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2312ACB98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2312BBC9C();
}

void sub_2312ACC0C()
{
  uint64_t (*v0)(uint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_254158EA8)
  {
    sub_2312BBF24();
    v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDD0078];
    sub_2312ACCD4();
    sub_23128A728(&qword_254158EC0, v0, MEMORY[0x24BDD0070]);
    sub_23128A728(&qword_254158EB0, (uint64_t (*)(uint64_t))sub_2312ACCD4, MEMORY[0x24BDB9AF8]);
    v1 = sub_2312BBBF4();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_254158EA8);
  }
}

void sub_2312ACCD4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254158EB8)
  {
    sub_2312BB324();
    v0 = sub_2312BBC30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254158EB8);
  }
}

uint64_t sub_2312ACD38()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2312ACD5C()
{
  return sub_2312AC880();
}

uint64_t sub_2312ACD64()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2312BBC90();
  swift_release();
  return swift_release();
}

uint64_t sub_2312ACDCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  sub_23128F05C(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_23128F0CC(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23128F0CC((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_2312BBC9C();
  return sub_23128F110((uint64_t)v7);
}

uint64_t sub_2312ACEB0(uint64_t a1)
{
  uint64_t v2;

  sub_23128D644(0, &qword_255EC3138, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id DataTypeDetailConfiguration.InlineChartComponent.hkType.getter()
{
  id *v0;

  return *v0;
}

void DataTypeDetailConfiguration.InlineChartComponent.hkType.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*DataTypeDetailConfiguration.InlineChartComponent.hkType.modify())()
{
  return nullsub_1;
}

uint64_t DataTypeDetailConfiguration.InlineChartComponent.init(hkType:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;

  *a2 = a1;
  type metadata accessor for DataTypeDetailConfiguration.InlineChartComponent();
  v3 = a1;
  return sub_2312BB8E8();
}

uint64_t type metadata accessor for DataTypeDetailConfiguration.InlineChartComponent()
{
  uint64_t result;

  result = qword_255EC3B90;
  if (!qword_255EC3B90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DataTypeDetailConfiguration.InlineChartComponent.makeDataSource(context:)()
{
  uint64_t v0;

  type metadata accessor for DataTypeDetailConfiguration.InlineChartComponent();
  if (!sub_2312BB8F4())
    return 0;
  swift_getObjectType();
  v0 = sub_2312AD048();
  sub_2312BBA5C();
  return v0;
}

uint64_t sub_2312AD048()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_2312AD520();
  v1 = sub_2312BB870();
  MEMORY[0x2348D9A30](MEMORY[0x24BE43020], v1);
  return v0;
}

uint64_t sub_2312AD0BC()
{
  uint64_t v0;

  if (!sub_2312BB8F4())
    return 0;
  swift_getObjectType();
  v0 = sub_2312AD048();
  sub_2312BBA5C();
  return v0;
}

void **_s20InlineChartComponentVwCP(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_2312BB900();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t _s20InlineChartComponentVwxx(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_2312BB900();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void **_s20InlineChartComponentVwcp(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  id v10;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2312BB900();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **_s20InlineChartComponentVwca(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2312BB900();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *_s20InlineChartComponentVwtk(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2312BB900();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **_s20InlineChartComponentVwta(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2312BB900();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t _s20InlineChartComponentVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2312AD3AC(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_2312BB900();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t _s20InlineChartComponentVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2312AD434(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_2312BB900();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_2312AD4A8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BB900();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2312AD520()
{
  sub_2312BB870();
  swift_unknownObjectRetain();
  return sub_2312BB87C();
}

uint64_t sub_2312AD56C()
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
  void (*v9)(_BYTE *, uint64_t);
  void (*v10)(_BYTE *, _QWORD);
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[32];

  v0 = sub_2312BB864();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v14[-v5];
  sub_2312BB8AC();
  sub_2312BB84C();
  sub_2312BBA5C();
  sub_2312BB858();
  sub_2312BB834();
  v8 = v7;
  v9 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v9(v4, v0);
  v10 = (void (*)(_BYTE *, _QWORD))sub_2312BB840();
  *(_QWORD *)(v11 + 16) = v8;
  v10(v14, 0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v1 + 16))(v4, v6, v0);
  v12 = sub_2312BB828();
  v9(v4, v0);
  v9(v6, v0);
  return v12;
}

double sub_2312AD6A8@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  double result;
  uint64_t v18;

  swift_bridgeObjectRetain();
  v6 = sub_2312BC0EC();
  swift_bridgeObjectRelease();
  if (v6)
  {
    if (qword_255EC2F50 != -1)
      swift_once();
    v7 = sub_2312BBBC4();
    sub_23128A1E0(v7, (uint64_t)qword_255EC4110);
    swift_bridgeObjectRetain_n();
    v8 = sub_2312BBBAC();
    v9 = sub_2312BBEB8();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v18 = v11;
      *(_DWORD *)v10 = 136446466;
      v12 = sub_2312BC1E8();
      sub_2312AE104(v12, v13, &v18);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_2312AE104(a1, a2, &v18);
      sub_2312BBF9C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231285000, v8, v9, "[%{public}s] Onboarding identifier %{public}s could not be found", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v11, -1, -1);
      MEMORY[0x2348D9AB4](v10, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a3 + 24) = type metadata accessor for EnvironmentAudioNotificationOnboardingDataProvider();
    *(_QWORD *)(a3 + 32) = &off_2500176E8;
    v14 = sub_23129A8B4((uint64_t *)a3);
    if (qword_2541597A8 != -1)
      swift_once();
    v15 = sub_2312BBBC4();
    v16 = sub_23128A1E0(v15, (uint64_t)qword_25415A9C0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v14, v16, v15);
  }
  return result;
}

Swift::Void __swiftcall OnboardingTileActionHandler.didTap()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
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
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31[3];
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_2312BB9D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v0 + qword_255EC3BC8;
  v7 = sub_2312BBBAC();
  v8 = sub_2312BBED0();
  if (os_log_type_enabled(v7, v8))
  {
    v27 = v2;
    v9 = swift_slowAlloc();
    v28 = v6;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    v31[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_2312BC1E8();
    v26 = v1;
    *(_QWORD *)&v29 = sub_2312AE104(v12, v13, v31);
    v2 = v27;
    sub_2312BBF9C();
    v1 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231285000, v7, v8, "[%{public}s] Did begin onboarding...", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v11, -1, -1);
    MEMORY[0x2348D9AB4](v10, -1, -1);
  }

  sub_2312BBA98();
  sub_2312BB9B4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23128B868(v31, v32);
  v14 = sub_2312BB990();
  v16 = v15;
  sub_23128B88C((uint64_t)v31);
  sub_2312AD6A8(v14, v16, (uint64_t)&v29);
  if (v30)
  {
    swift_bridgeObjectRelease();
    sub_23128B850(&v29, (uint64_t)v31);
    v17 = v32;
    v18 = v33;
    sub_23128B868(v31, v32);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 40))(v1, v17, v18);
    sub_23128B88C((uint64_t)v31);
  }
  else
  {
    sub_2312ADD34((uint64_t)&v29);
    swift_bridgeObjectRetain();
    v19 = sub_2312BBBAC();
    v20 = sub_2312BBEB8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v31[0] = v22;
      *(_DWORD *)v21 = 136446466;
      v23 = sub_2312BC1E8();
      *(_QWORD *)&v29 = sub_2312AE104(v23, v24, v31);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v29 = sub_2312AE104(v14, v16, v31);
      sub_2312BBF9C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231285000, v19, v20, "[%{public}s] Could not get onboarding experience for identifier: %{public}s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v22, -1, -1);
      MEMORY[0x2348D9AB4](v21, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
}

uint64_t sub_2312ADD34(uint64_t a1)
{
  uint64_t v2;

  sub_2312ADD70();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2312ADD70()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3BD0)
  {
    sub_2312ADDC4();
    v0 = sub_2312BBF90();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3BD0);
  }
}

unint64_t sub_2312ADDC4()
{
  unint64_t result;

  result = qword_254159388;
  if (!qword_254159388)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254159388);
  }
  return result;
}

uint64_t OnboardingTileActionHandler.__allocating_init(context:)(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  v4 = sub_2312BB9D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(v2);
  v9 = qword_255EC3BC8;
  v10 = qword_255EC2F50;
  v11 = (char *)v8;
  if (v10 != -1)
    swift_once();
  v12 = sub_2312BBBC4();
  v13 = sub_23128A1E0(v12, (uint64_t)qword_255EC4110);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(&v11[v9], v13, v12);

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v14 = sub_2312BBAA4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v14;
}

uint64_t OnboardingTileActionHandler.init(context:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v3 = sub_2312BB9D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = qword_255EC3BC8;
  v8 = qword_255EC2F50;
  v9 = v1;
  if (v8 != -1)
    swift_once();
  v10 = &v9[v7];
  v11 = sub_2312BBBC4();
  v12 = sub_23128A1E0(v11, (uint64_t)qword_255EC4110);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, v12, v11);

  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v13 = sub_2312BBAA4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v13;
}

uint64_t sub_2312AE054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_255EC3BC8;
  v2 = sub_2312BBBC4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

id OnboardingTileActionHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnboardingTileActionHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2312AE0C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + qword_255EC3BC8;
  v2 = sub_2312BBBC4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_2312AE104(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2312AE1D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2312AE820((uint64_t)v12, *a3);
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
      sub_2312AE820((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23128B88C((uint64_t)v12);
  return v7;
}

uint64_t sub_2312AE1D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2312BBFA8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2312AE38C(a5, a6);
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
  v8 = sub_2312BC050();
  if (!v8)
  {
    sub_2312BC05C();
    __break(1u);
LABEL_17:
    result = sub_2312BC0D4();
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

uint64_t sub_2312AE38C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2312AE420(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2312AE5F4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2312AE5F4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2312AE420(uint64_t a1, unint64_t a2)
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
      v3 = sub_2312AE594(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2312BC02C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2312BC05C();
      __break(1u);
LABEL_10:
      v2 = sub_2312BBDEC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2312BC0D4();
    __break(1u);
LABEL_14:
    result = sub_2312BC05C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2312AE594(uint64_t a1, uint64_t a2)
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
  sub_2312AE85C();
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2312AE5F4(char a1, int64_t a2, char a3, char *a4)
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
    sub_2312AE85C();
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
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for OnboardingTileActionHandler()
{
  uint64_t result;

  result = qword_255EC3BE0;
  if (!qword_255EC3BE0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2312AE778()
{
  return sub_23128A728(&qword_255EC3BD8, (uint64_t (*)(uint64_t))type metadata accessor for OnboardingTileActionHandler, (uint64_t)&protocol conformance descriptor for OnboardingTileActionHandler);
}

uint64_t sub_2312AE7A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BBBC4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2312AE818()
{
  return type metadata accessor for OnboardingTileActionHandler();
}

uint64_t sub_2312AE820(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2312AE85C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254159260)
  {
    v0 = sub_2312BC11C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254159260);
  }
}

uint64_t sub_2312AE8B4()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23128D644(0, (unint64_t *)&qword_254159270, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BD4E0;
  sub_23128AC6C(0, (unint64_t *)&qword_2541596B0);
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D92C8]((id)*MEMORY[0x24BDD3578]);
  sub_23128AC6C(0, (unint64_t *)&qword_2541596A0);
  *(_QWORD *)(inited + 40) = MEMORY[0x2348D92BC]((id)*MEMORY[0x24BDD28D8]);
  sub_2312BBE28();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2312BC08C();
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
  sub_231299A48(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2312AE9EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD v13[2];

  v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDB99B8];
  sub_2312B05A0(0, &qword_254159590, MEMORY[0x24BDB99B8]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v13 - v8;
  sub_23128D554(0, &qword_254159710, (uint64_t (*)(uint64_t))sub_23129A0B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2312BCC00;
  *(_QWORD *)(v10 + 32) = sub_2312AEBA8(a1);
  *(_QWORD *)(v10 + 40) = sub_2312AEE74(a1);
  v13[1] = v10;
  sub_2312BBE28();
  sub_23129A0B0(0);
  sub_23128D554(0, &qword_254159668, (uint64_t (*)(uint64_t))sub_23129A0B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23128A728(&qword_254159598, (uint64_t (*)(uint64_t))sub_23129A0B0, MEMORY[0x24BDB9AF8]);
  sub_23129A228();
  sub_2312BBC18();
  sub_2312B0560(&qword_254159588, &qword_254159590, v4, MEMORY[0x24BDB99D8]);
  v11 = sub_2312BBCC0();
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *a2 = v11;
  return result;
}

uint64_t sub_2312AEBA8(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a1;
  v1 = sub_2312BB504();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_23128D554(0, &qword_254159620, (uint64_t (*)(uint64_t))sub_23128F05C, MEMORY[0x24BDB9ED8]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v21 - v7;
  sub_23129A5D0(0, &qword_254159570, sub_23129A64C, (void (*)(void))sub_23129A6BC);
  v23 = v9;
  v25 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - v10;
  swift_beginAccess();
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  sub_2312BBC84();
  swift_endAccess();
  sub_23129A6D8((unint64_t *)&unk_254159610, (uint64_t)&qword_254159620, (uint64_t)sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_23128D554);
  v12 = v22;
  v13 = sub_2312BBCB4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v26 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v1);
  v14 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v15 = swift_allocObject();
  v16 = v24;
  *(_QWORD *)(v15 + 16) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v15 + v14, (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  *(_QWORD *)(v15 + ((v3 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v16;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_2312B075C;
  *(_QWORD *)(v17 + 24) = v15;
  sub_23129A64C(0);
  sub_231291E50();
  sub_23129A6BC();
  sub_2312BBCCC();
  swift_release();
  swift_release();
  sub_23129A854();
  v18 = v23;
  v19 = sub_2312BBCC0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v18);
  return v19;
}

uint64_t sub_2312AEE74(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a1;
  v1 = sub_2312BB504();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = MEMORY[0x24BEE1328];
  sub_23128D644(0, (unint64_t *)&unk_254159630, MEMORY[0x24BEE1328], MEMORY[0x24BDB9ED8]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v21 - v8;
  sub_23129A5D0(0, &qword_254159580, (void (*)(uint64_t))sub_23129A2DC, (void (*)(void))sub_23129A340);
  v23 = v10;
  v25 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - v11;
  swift_beginAccess();
  sub_23128D644(0, (unint64_t *)&qword_254159648, v4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  sub_2312BBC84();
  swift_endAccess();
  sub_23129A6D8(&qword_254159628, (uint64_t)&unk_254159630, v4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_23128D644);
  v13 = v22;
  v14 = sub_2312BBCB4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v26 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v1);
  v15 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v16 + v15, (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  *(_QWORD *)(v16 + ((v3 + v15 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_2312B0688;
  *(_QWORD *)(v17 + 24) = v16;
  sub_23129A2DC();
  sub_231291E50();
  sub_23129A340();
  sub_2312BBCCC();
  swift_release();
  swift_release();
  sub_23129A44C();
  v18 = v23;
  v19 = sub_2312BBCC0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v18);
  return v19;
}

uint64_t sub_2312AF13C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a4;
  sub_23128F05C(0);
  v39 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v33 - v13;
  v15 = sub_2312BBBC4();
  v40 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312BBBA0();
  sub_23128F0CC(a1, (uint64_t)v14);
  v18 = sub_2312BBBAC();
  v19 = sub_2312BBED0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v37 = a2;
    v21 = v20;
    v22 = swift_slowAlloc();
    v36 = a3;
    v23 = v22;
    v42 = v22;
    *(_DWORD *)v21 = 136315395;
    v35 = a5;
    v24 = sub_2312BC1E8();
    v38 = a1;
    v41 = sub_2312AE104(v24, v25, &v42);
    v34 = v15;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2081;
    sub_23128F0CC((uint64_t)v14, (uint64_t)v12);
    v26 = sub_2312BBDB0();
    v41 = sub_2312AE104(v26, v27, &v42);
    a1 = v38;
    sub_2312BBF9C();
    a5 = v35;
    swift_bridgeObjectRelease();
    sub_23128F110((uint64_t)v14);
    _os_log_impl(&dword_231285000, v18, v19, "%s Received featureStatus %{private}s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    v28 = v23;
    a3 = v36;
    MEMORY[0x2348D9AB4](v28, -1, -1);
    MEMORY[0x2348D9AB4](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v34);
  }
  else
  {
    sub_23128F110((uint64_t)v14);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v15);
  }
  v29 = sub_2312BB51C();
  v30 = MEMORY[0x24BE47A60];
  a5[3] = v29;
  a5[4] = v30;
  v31 = sub_23129A8B4(a5);
  return sub_2312AF408(a3, a1, (uint64_t)v31);
}

uint64_t sub_2312AF408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;

  v58 = a2;
  v60 = a3;
  sub_23128F05C(0);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v55 = (uint64_t)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2312BB4C8();
  v52 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2312BB4E0();
  MEMORY[0x24BDAC7A8](v10);
  v61 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2312BB504();
  v13 = *(_QWORD *)(v12 - 8);
  v48 = v12;
  v14 = *(_QWORD *)(v13 + 64);
  v15 = v13;
  v50 = v13;
  v16 = MEMORY[0x24BDAC7A8](v12);
  v51 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v44 - v17;
  v54 = (char *)&v44 - v17;
  v47 = sub_2312BB1E8();
  v44 = v19;
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v49(v18, a1, v12);
  v20 = (void *)sub_2312BB4F8();
  sub_23128D554(0, &qword_2541596E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v21 = sub_2312BB3F0();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2312BCBF0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v22 + 104))(v24 + v23, *MEMORY[0x24BE47420], v21);
  v25 = v20;
  sub_231299A6C(v24);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v26 = sub_2312AE8B4();
  sub_231297D78(v26);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v52 + 104))(v9, *MEMORY[0x24BE47910], v53);
  sub_2312BB4D4();

  v27 = v47;
  v28 = sub_2312BB528();
  v52 = v29;
  v53 = v28;
  v46 = v30;
  v45 = v31;
  v32 = v55;
  sub_23128F0CC(v58, v55);
  v33 = v51;
  v34 = v48;
  v49(v51, a1, v48);
  v35 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  v36 = (v57 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  v37 = v50;
  v38 = (*(unsigned __int8 *)(v50 + 80) + v36 + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  v39 = (v14 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = swift_allocObject();
  sub_23129AA10(v32, v40 + v35);
  v41 = (unint64_t *)(v40 + v36);
  v42 = v44;
  *v41 = v27;
  v41[1] = v42;
  (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v40 + v38, v33, v34);
  *(_QWORD *)(v40 + v39) = v59;
  return sub_2312BB510();
}

uint64_t sub_2312AF7A4(uint64_t a1, NSObject *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD v52[2];
  os_log_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v54 = a4;
  v55 = a5;
  v53 = a2;
  v7 = sub_2312BB498();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2312BBBC4();
  v59 = *(_QWORD *)(v10 - 8);
  v60 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v52 - v13;
  sub_23128F05C(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2312BB600();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)v52 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)v52 - v26;
  sub_23128F0CC(a1, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_23128F110((uint64_t)v17);
    sub_2312BBBA0();
    v28 = a3;
    swift_bridgeObjectRetain_n();
    v29 = sub_2312BBBAC();
    v30 = sub_2312BBED0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      v62 = v32;
      *(_DWORD *)v31 = 136315394;
      v33 = sub_2312BC1E8();
      v61 = sub_2312AE104(v33, v34, &v62);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain();
      v61 = sub_2312AE104((uint64_t)v53, v28, &v62);
      sub_2312BBF9C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231285000, v29, v30, "%s Creating no feed items with identifier %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v32, -1, -1);
      MEMORY[0x2348D9AB4](v31, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v14, v60);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v27, v17, v18);
    sub_2312BA8B0(v54, (uint64_t)v27, (uint64_t)v9);
    sub_2312BBBA0();
    v35 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
    v35(v25, v27, v18);
    v36 = sub_2312BBBAC();
    v37 = sub_2312BBED0();
    v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      v39 = swift_slowAlloc();
      v53 = v36;
      v40 = v39;
      v54 = swift_slowAlloc();
      v62 = v54;
      *(_DWORD *)v40 = 136315395;
      v52[1] = v40 + 4;
      v41 = sub_2312BC1E8();
      v61 = sub_2312AE104(v41, v42, &v62);
      LODWORD(v55) = v38;
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2081;
      v35(v22, v25, v18);
      v43 = sub_2312BBDB0();
      v61 = sub_2312AE104(v43, v44, &v62);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      v45 = *(void (**)(char *, uint64_t))(v19 + 8);
      v45(v25, v18);
      v46 = v53;
      _os_log_impl(&dword_231285000, v53, (os_log_type_t)v55, "%s Creating feed item generator for featureStatus %{private}s", (uint8_t *)v40, 0x16u);
      v47 = v54;
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v47, -1, -1);
      MEMORY[0x2348D9AB4](v40, -1, -1);

    }
    else
    {
      v45 = *(void (**)(char *, uint64_t))(v19 + 8);
      v45(v25, v18);

    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v60);
    sub_23128D554(0, &qword_2541596F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v49 = v56;
    v50 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_2312BCBF0;
    (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v48 + v50, v9, v57);
    v45(v27, v18);
  }
  return v48;
}

uint64_t sub_2312AFD30@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a2;
  v5 = sub_2312BB504();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2312BBBC4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312BBBA0();
  v13 = sub_2312BBBAC();
  v14 = sub_2312BBED0();
  if (os_log_type_enabled(v13, v14))
  {
    v29 = a1;
    v15 = swift_slowAlloc();
    v26 = v9;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v28 = v5;
    v18 = v17;
    v32 = v17;
    v25 = v10;
    *(_DWORD *)v16 = 136315138;
    v27 = v8;
    v19 = sub_2312BC1E8();
    v31 = sub_2312AE104(v19, v20, &v32);
    v8 = v27;
    sub_2312BBF9C();
    a1 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231285000, v13, v14, "%s Creating feed item generator for promotion", v16, 0xCu);
    swift_arrayDestroy();
    v21 = v18;
    v5 = v28;
    MEMORY[0x2348D9AB4](v21, -1, -1);
    MEMORY[0x2348D9AB4](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v22 = type metadata accessor for NoiseNotificationsPromotionGenerator();
  swift_allocObject();
  v23 = sub_2312B2AB8((uint64_t)v8);
  a3[3] = v22;
  result = sub_23128A728(&qword_254159030, (uint64_t (*)(uint64_t))type metadata accessor for NoiseNotificationsPromotionGenerator, (uint64_t)&unk_2312BE540);
  a3[4] = result;
  *a3 = v23;
  return result;
}

uint64_t sub_2312AFFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin35NoiseNotificationsGeneratorPipeline_domain;
  v2 = sub_2312BB4E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2312B0008()
{
  return type metadata accessor for NoiseNotificationsGeneratorPipeline();
}

uint64_t type metadata accessor for NoiseNotificationsGeneratorPipeline()
{
  uint64_t result;

  result = qword_254158F70;
  if (!qword_254158F70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2312B004C()
{
  return swift_retain();
}

uint64_t sub_2312B0060@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC16HearingAppPlugin35NoiseNotificationsGeneratorPipeline_domain;
  v4 = sub_2312BB4E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2312B00A8(uint64_t a1, void *a2)
{
  uint64_t *v2;
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
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(unint64_t, _QWORD, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;

  v40 = a1;
  v49 = *v2;
  v50 = a2;
  v3 = sub_2312BB504();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v46 = v3;
  v47 = v5;
  MEMORY[0x24BDAC7A8](v3);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312B05A0(0, &qword_2541595F8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDB9E80]);
  v8 = *(_QWORD *)(v7 - 8);
  v51 = v7;
  v52 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v39 - v9;
  v41 = sub_2312BB4C8();
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2312BB4E0();
  v42 = *(_QWORD *)(v12 - 8);
  v43 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (void *)sub_2312BB4F8();
  sub_23128D554(0, &qword_2541596E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v16 = sub_2312BB3F0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 72);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2312BCC00;
  v21 = v20 + v19;
  v22 = *(void (**)(unint64_t, _QWORD, uint64_t))(v17 + 104);
  v22(v21, *MEMORY[0x24BE47420], v16);
  v22(v21 + v18, *MEMORY[0x24BE474E0], v16);
  v23 = v15;
  sub_231299A6C(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v24 = sub_2312AE8B4();
  sub_231297D78(v24);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v11, *MEMORY[0x24BE47910], v41);
  sub_2312BB4D4();

  v25 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v45 + OBJC_IVAR____TtC16HearingAppPlugin35NoiseNotificationsGeneratorPipeline_domain, v14, v43);
  v26 = v44;
  v27 = v40;
  v28 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v44, v40, v46);
  v29 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v30 = (v47 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v31 + v29, v26, v28);
  v32 = v49;
  v33 = v50;
  *(_QWORD *)(v31 + v30) = v50;
  *(_QWORD *)(v31 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = v32;
  sub_23129A0B0(0);
  sub_23128A728(&qword_254159598, (uint64_t (*)(uint64_t))sub_23129A0B0, MEMORY[0x24BDB9AF8]);
  v34 = v33;
  v35 = v48;
  sub_2312BBC60();
  sub_2312B0560(&qword_2541595F0, &qword_2541595F8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDB9E80], MEMORY[0x24BDB9E90]);
  v36 = v51;
  v37 = sub_2312BBCC0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v36);
  result = v25;
  *(_QWORD *)(v25 + OBJC_IVAR____TtC16HearingAppPlugin35NoiseNotificationsGeneratorPipeline_publisher) = v37;
  return result;
}

uint64_t sub_2312B0488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2312BB504();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_2312B0504@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2312BB504();
  return sub_2312AE9EC(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), a1);
}

uint64_t sub_2312B0560(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_2312B05A0(255, a2, a3);
    result = MEMORY[0x2348D9A30](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2312B05A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_23129A0B0(255);
    v7 = v6;
    v8 = sub_23128A728(&qword_254159598, (uint64_t (*)(uint64_t))sub_23129A0B0, MEMORY[0x24BDB9AF8]);
    v9 = a3(a1, v7, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_2312B061C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2312BB504();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2312B0688@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_2312BB504() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_2312AFD30(v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_2312B06E8(unsigned __int8 *a1)
{
  uint64_t v1;

  return sub_231299788(a1, *(uint64_t (**)(_QWORD))(v1 + 16));
}

uint64_t sub_2312B06F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2312BB504();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2312B075C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_2312BB504() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_2312AF13C(a1, *(_QWORD *)(v2 + 16), v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_2312B07C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2312B07E4(uint64_t a1)
{
  uint64_t v1;

  return sub_231298F24(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_2312B07EC()
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

  sub_23128F05C(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = *(_QWORD *)(v2 + 64);
  v4 = sub_2312BB504();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = sub_2312BB600();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v3, 1, v7))
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v3, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((((v10 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6), v4);
  return swift_deallocObject();
}

uint64_t sub_2312B08FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  sub_23128F05C(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(sub_2312BB504() - 8);
  v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_2312AF7A4(v0 + v3, *(NSObject **)(v0 + v4), *(_QWORD *)(v0 + v4 + 8), v0 + v6, *(_QWORD *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_2312B0988(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2312BCC00;
  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  v7 = sub_23128D600();
  *(_QWORD *)(v3 + 64) = v7;
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v4;
  swift_bridgeObjectRetain();
  objc_msgSend(a1, sel__value);
  v8 = sub_2312BBE7C();
  *(_QWORD *)(v3 + 96) = v6;
  *(_QWORD *)(v3 + 104) = v7;
  *(_QWORD *)(v3 + 72) = v8;
  *(_QWORD *)(v3 + 80) = v9;
  return sub_2312BBDA4();
}

id sub_2312B0A44(void *a1)
{
  uint64_t v1;
  void *v2;
  id result;
  double v4;
  id v5;
  uint64_t v6;

  v2 = *(void **)(v1 + 32);
  result = objc_msgSend(a1, sel__value);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v4 < 9.22337204e18)
  {
    v5 = objc_msgSend(v2, sel_localizedNoiseThresholdValue_, (uint64_t)v4);
    v6 = sub_2312BBD98();

    return (id)v6;
  }
LABEL_7:
  __break(1u);
  return result;
}

id sub_2312B0AEC(void *a1)
{
  uint64_t v1;
  void *v2;
  id result;
  double v4;
  id v5;
  uint64_t v6;

  v2 = *(void **)(v1 + 32);
  result = objc_msgSend(a1, sel__value);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v4 < 9.22337204e18)
  {
    v5 = objc_msgSend(v2, sel_localizedNoiseThresholdDetailValue_, (uint64_t)v4);
    v6 = sub_2312BBD98();

    return (id)v6;
  }
LABEL_7:
  __break(1u);
  return result;
}

id sub_2312B0B94(void *a1)
{
  uint64_t v1;
  void *v2;
  id result;
  double v4;

  v2 = *(void **)(v1 + 32);
  result = objc_msgSend(a1, sel__value);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v4 < 9.22337204e18)
  {
    objc_msgSend(v2, sel_setNotificationThreshold_, (uint64_t)v4);
    return objc_msgSend(v2, sel_setNotificationsEnabled_, 1);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2312B0C20()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NoiseThresholdSpecifierConfiguration()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for NoiseThresholdSettingsDataSource(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3D88);
}

uint64_t sub_2312B0C90()
{
  return sub_2312B166C();
}

uint64_t sub_2312B0CA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;
  uint64_t v4;
  unsigned int *v5;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)v1 + 32), sel_notificationsEnabled);
  v4 = sub_2312BB600();
  v5 = (unsigned int *)MEMORY[0x24BE41298];
  if (!v3)
    v5 = (unsigned int *)MEMORY[0x24BE412A0];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a1, *v5, v4);
}

uint64_t sub_2312B0D0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_2312BBA2C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_2312B0D48()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2312B0D78()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 32), sel_localizedNoiseThresholdValue_, 0);
  v2 = sub_2312BBD98();

  return v2;
}

uint64_t sub_2312B0DD4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 32), sel_noiseThresholdValueFooterDescription);
  v2 = sub_2312BBD98();

  return v2;
}

uint64_t sub_2312B0E2C()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 32), sel_noiseThresholdOptions);
  sub_23128AC6C(0, &qword_255EC3E38);
  v2 = sub_2312BBE10();

  swift_retain();
  v3 = sub_2312B1924(v2);
  swift_bridgeObjectRelease();
  swift_release();
  return v3;
}

id sub_2312B0ECC()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 32), sel_noiseThresholdCurrentValue);
  v2 = objc_msgSend((id)objc_opt_self(), sel_decibelHearingLevelUnit);
  v3 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v2, (double)(uint64_t)v1);

  return v3;
}

uint64_t sub_2312B0F60(void *a1)
{
  return sub_2312B0988(a1);
}

id sub_2312B0F80(void *a1)
{
  return sub_2312B0A44(a1);
}

id sub_2312B0FA0(void *a1)
{
  return sub_2312B0AEC(a1);
}

id sub_2312B0FC0(void *a1)
{
  return sub_2312B0B94(a1);
}

id sub_2312B0FE0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 32);
  objc_msgSend(v1, sel_setNotificationThreshold_, 0);
  return objc_msgSend(v1, sel_setNotificationsEnabled_, 0);
}

id sub_2312B1024(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v16[6];

  sub_23128D554(0, (unint64_t *)&unk_255EC38E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42170], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v16 - v6;
  *(_QWORD *)(v2 + qword_255EC3D70) = 0;
  *(_QWORD *)(v2 + qword_255EC3D68) = a2;
  v8 = type metadata accessor for NoiseThresholdSpecifierConfiguration();
  v9 = swift_allocObject();
  strcpy((char *)(v9 + 16), "THRESHOLD_ID_");
  *(_WORD *)(v9 + 30) = -4864;
  *(_QWORD *)(v9 + 56) = 0;
  *(_QWORD *)(v9 + 64) = 0;
  *(_QWORD *)(v9 + 40) = a2;
  *(_QWORD *)(v9 + 48) = 0;
  *(_QWORD *)(v9 + 32) = a1;
  v10 = a2;
  v11 = a1;
  v12 = objc_msgSend(v11, sel_noiseThresholdTitleDescription);
  sub_2312BBD98();

  v13 = sub_2312BB774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  v16[4] = v8;
  v16[5] = sub_23128A728(&qword_255EC3E40, (uint64_t (*)(uint64_t))type metadata accessor for NoiseThresholdSpecifierConfiguration, (uint64_t)&unk_2312BE438);
  v16[1] = v9;
  swift_retain();
  v14 = (id)sub_2312BBB10();
  sub_2312B11E4();
  swift_release();

  return v14;
}

uint64_t sub_2312B11E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  sub_23128D554(0, &qword_255EC3798, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v24 - v2;
  sub_23129EEE0(0);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EEFC();
  v10 = v9;
  v25 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23129EF78();
  v14 = *(_QWORD *)(v13 - 8);
  v26 = v13;
  v27 = v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void **)(v0 + qword_255EC3D68);
  swift_beginAccess();
  sub_23128D554(0, &qword_254159640, (uint64_t (*)(uint64_t))sub_23128F05C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  v18 = v17;
  sub_2312BBC84();
  swift_endAccess();

  sub_23128A728((unint64_t *)&unk_254159610, (uint64_t (*)(uint64_t))sub_23129EEE0, MEMORY[0x24BDB9EE8]);
  sub_2312BBCF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23128AC6C(0, (unint64_t *)&qword_255EC2FE8);
  v28 = (id)sub_2312BBF00();
  v19 = sub_2312BBEF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v3, 1, 1, v19);
  sub_23128A728((unint64_t *)&unk_255EC39B0, (uint64_t (*)(uint64_t))sub_23129EEFC, MEMORY[0x24BDB96F8]);
  sub_2312A46E4();
  sub_2312BBCE4();
  sub_2312B1B00((uint64_t)v3);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  swift_allocObject();
  v20 = v24[1];
  swift_unknownObjectWeakInit();
  sub_23128A728(qword_255EC37A8, (uint64_t (*)(uint64_t))sub_23129EF78, MEMORY[0x24BDB9A08]);
  v21 = v26;
  v22 = sub_2312BBCFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v21);
  *(_QWORD *)(v20 + qword_255EC3D70) = v22;
  return swift_release();
}

void sub_2312B151C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2348D9B2C](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = sub_2312BBB1C();

    if (v5)
    {
      swift_getObjectType();
      sub_2312BBA14();
      sub_2312BBA5C();
    }
  }
}

void sub_2312B159C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2312B15C8()
{
  uint64_t v0;

  return swift_release();
}

id sub_2312B15F4()
{
  return sub_2312A37D8(type metadata accessor for NoiseThresholdSettingsDataSource);
}

uint64_t sub_2312B1600(uint64_t a1)
{

  return swift_release();
}

uint64_t sub_2312B1638()
{
  return type metadata accessor for NoiseThresholdSettingsDataSource(0);
}

uint64_t type metadata accessor for NoiseThresholdSpecifierViewController(uint64_t a1)
{
  return sub_231295D00(a1, qword_255EC3DE8);
}

uint64_t sub_2312B1654()
{
  return sub_2312B166C();
}

uint64_t sub_2312B166C()
{
  return swift_initClassMetadata2();
}

id sub_2312B16B8(void *a1, void *a2)
{
  void *v2;
  char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  objc_allocWithZone((Class)type metadata accessor for NoiseThresholdSettingsDataSource(0));
  v5 = v2;
  v6 = a1;
  v7 = a2;
  v8 = sub_2312B1024(v6, v7);
  v9 = qword_255EC3DD8;
  *(_QWORD *)&v5[qword_255EC3DD8] = v8;
  v10 = v8;
  sub_2312BBB28();

  sub_2312BBAC8();
  swift_allocObject();
  *(_QWORD *)&v5[qword_255EC3DE0] = sub_2312BBABC();
  swift_retain();

  v11 = *(void **)&v5[v9];
  swift_retain();
  v12 = v11;
  v13 = (id)sub_2312BB9A8();
  v14 = objc_msgSend(v6, sel_noiseThresholdTitleDescription);
  if (!v14)
  {
    sub_2312BBD98();
    v14 = (id)sub_2312BBD68();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v13, sel_setTitle_, v14);
  swift_release();

  return v13;
}

void sub_2312B1828()
{
  sub_2312BC068();
  __break(1u);
}

void sub_2312B1880()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2312B18AC()
{
  uint64_t v0;

  return swift_release();
}

id sub_2312B18D8()
{
  return sub_2312A37D8(type metadata accessor for NoiseThresholdSpecifierViewController);
}

uint64_t sub_2312B18E4(uint64_t a1)
{

  return swift_release();
}

uint64_t sub_2312B191C()
{
  return type metadata accessor for NoiseThresholdSpecifierViewController(0);
}

uint64_t sub_2312B1924(unint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;

  v13 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_2312BC08C())
  {
    v3 = (void *)objc_opt_self();
    v4 = (void *)objc_opt_self();
    for (i = 4; ; ++i)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2348D9418](i - 4, a1) : *(id *)(a1 + 8 * i);
      v7 = v6;
      v8 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v9 = objc_msgSend(v6, sel_integerValue);
      v10 = objc_msgSend(v3, sel_decibelHearingLevelUnit);
      v11 = objc_msgSend(v4, sel_quantityWithUnit_doubleValue_, v10, (double)(uint64_t)v9);

      if (v11)
      {
        MEMORY[0x2348D91D8]();
        if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2312BBE40();
        sub_2312BBE4C();
        sub_2312BBE28();
      }
      if (v8 == v2)
      {
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2312B1B00(uint64_t a1)
{
  uint64_t v2;

  sub_23128D554(0, &qword_255EC3798, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2312B1B54()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2312B1B78(uint64_t a1)
{
  uint64_t v1;

  sub_2312B151C(a1, v1);
}

unint64_t sub_2312B1B80(void (*a1)(_QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v23[2];
  void (*v24)(_QWORD);
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  v28 = a2;
  sub_23128D554(0, &qword_254159348, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v23 - v7;
  v26 = sub_2312BB498();
  v9 = *(_QWORD *)(v26 - 8);
  v10 = MEMORY[0x24BDAC7A8](v26);
  v27 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v25 = (char *)v23 - v12;
  v13 = *(_QWORD *)(a3 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v14 = a3 + 32;
  v23[1] = a3;
  swift_bridgeObjectRetain();
  v15 = MEMORY[0x24BEE4AF8];
  v24 = a1;
  v16 = v26;
  do
  {
    a1(v14);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v15;
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v16) == 1)
    {
      sub_231291D84((uint64_t)v8);
    }
    else
    {
      v17 = v9;
      v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v19 = v25;
      v18(v25, v8, v16);
      v18(v27, v19, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v15 = sub_2312B33EC(0, *(_QWORD *)(v15 + 16) + 1, 1, v15, &qword_2541596F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0]);
      v21 = *(_QWORD *)(v15 + 16);
      v20 = *(_QWORD *)(v15 + 24);
      if (v21 >= v20 >> 1)
        v15 = sub_2312B33EC(v20 > 1, v21 + 1, 1, v15, &qword_2541596F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0]);
      *(_QWORD *)(v15 + 16) = v21 + 1;
      v16 = v26;
      v18((char *)(v15+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(_QWORD *)(v17 + 72) * v21), v27, v26);
      v9 = v17;
      a1 = v24;
    }
    v14 += 40;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2312B1DF8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v0 = sub_2312B2030();
  if (qword_2541597A8 != -1)
    swift_once();
  v1 = sub_2312BBBC4();
  sub_23128A1E0(v1, (uint64_t)qword_25415A9C0);
  swift_bridgeObjectRetain_n();
  v2 = sub_2312BBBAC();
  v3 = sub_2312BBEAC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc();
    v5 = swift_slowAlloc();
    v11 = v5;
    *(_DWORD *)v4 = 136446722;
    sub_2312AE104(0xD000000000000024, 0x80000002312BE4A0, &v11);
    sub_2312BBF9C();
    *(_WORD *)(v4 + 12) = 2050;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 22) = 2082;
    v6 = swift_bridgeObjectRetain();
    v7 = MEMORY[0x2348D91FC](v6, MEMORY[0x24BE47F58]);
    v9 = v8;
    swift_bridgeObjectRelease();
    sub_2312AE104(v7, v9, &v11);
    sub_2312BBF9C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231285000, v2, v3, "[%{public}s] Computed %{public}ld changes: %{public}s", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v5, -1, -1);
    MEMORY[0x2348D9AB4](v4, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v0;
}

uint64_t sub_2312B2030()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_managedOnboardingExperiences);
  v6[2] = &v7;
  swift_bridgeObjectRetain();
  sub_2312B1B80((void (*)(_QWORD))sub_2312B378C, (uint64_t)v6, v1);
  swift_bridgeObjectRelease();
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_context);
  sub_23128B868(v2, v2[3]);
  sub_23128B868(v2, v2[3]);
  v3 = (void *)sub_2312BB4BC();
  sub_2312BB4B0();

  v4 = sub_2312BBE34();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2312B235C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[80];
  __int128 v32[2];
  uint64_t v33;
  _QWORD v34[8];

  v7 = sub_2312BB720();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231296FF8((uint64_t)a1, (uint64_t)v31);
  sub_23128A7F0(0, (unint64_t *)&qword_254159388);
  sub_23128A7F0(0, &qword_2541593A8);
  if (swift_dynamicCast())
  {
    sub_23128B850(v32, (uint64_t)v34);
    sub_23128B868(v34, v34[3]);
    sub_23128FA58(a2 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_deviceConfigurationProvider, (uint64_t)v31);
    v11 = sub_23129FC14((uint64_t)v31);
    sub_23128FB54((uint64_t)v31);
    if ((v11 & 1) == 0)
    {
      v26 = sub_2312BB498();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(a3, 1, 1, v26);
      return sub_23128B88C((uint64_t)v34);
    }
    v27 = v8;
    v28 = v7;
    v29 = a3;
    v30 = v3;
    sub_23128B88C((uint64_t)v34);
  }
  else
  {
    v27 = v8;
    v28 = v7;
    v29 = a3;
    v30 = v3;
    v33 = 0;
    memset(v32, 0, sizeof(v32));
    sub_2312B3BEC((uint64_t)v32);
  }
  v12 = a1[3];
  v13 = a1[4];
  sub_23128B868(a1, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v12, v13);
  v14 = a1[3];
  v15 = a1[4];
  sub_23128B868(a1, v14);
  v34[7] = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  v16 = (void *)sub_2312BB42C();
  v17 = a1[3];
  v18 = a1[4];
  sub_23128B868(a1, v17);
  (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
  {
    if (sub_2312BC08C())
      sub_2312B3898(MEMORY[0x24BEE4AF8]);
  }
  type metadata accessor for OnboardingTileActionHandler();
  sub_23128A728(&qword_255EC3E50, (uint64_t (*)(uint64_t))type metadata accessor for OnboardingTileActionHandler, (uint64_t)&protocol conformance descriptor for OnboardingTileActionHandler);
  v19 = v29;
  sub_2312BB438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v20 = a1[3];
  v21 = a1[4];
  sub_23128B868(a1, v20);
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
  sub_2312BB474();
  v22 = a1[3];
  v23 = a1[4];
  sub_23128B868(a1, v22);
  (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
  sub_23128AC6C(0, &qword_254159678);
  sub_2312BBE88();
  swift_bridgeObjectRelease();
  sub_2312BB480();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
  v24 = sub_2312BB498();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v19, 0, 1, v24);
}

uint64_t sub_2312B2754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v11;

  v1 = v0;
  sub_23129198C();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator____lazy_storage___publisher;
  if (*(_QWORD *)(v1
                 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator____lazy_storage___publisher))
  {
    v8 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator____lazy_storage___publisher);
  }
  else
  {
    swift_allocObject();
    swift_weakInit();
    v9 = MEMORY[0x24BDB9AE0];
    sub_2312B303C(0, (unint64_t *)&qword_2541595C0, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BDB9AE0]);
    sub_2312B2FD0(&qword_2541595B8, (unint64_t *)&qword_2541595C0, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v9, MEMORY[0x24BDB9AF8]);
    sub_2312BBC60();
    sub_23128A728(&qword_254159600, (uint64_t (*)(uint64_t))sub_23129198C, MEMORY[0x24BDB9E90]);
    v8 = sub_2312BBCC0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    *(_QWORD *)(v1 + v7) = v8;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v8;
}

uint64_t sub_2312B28C4@<X0>(uint64_t *a1@<X8>)
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
  uint64_t result;
  uint64_t v14;

  sub_231291CB8();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312B303C(0, &qword_2541595E8, MEMORY[0x24BDB9E10]);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v14 - v10;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v14 = sub_2312B1DF8();
    sub_23128D644(0, &qword_254159660, MEMORY[0x24BE47F58], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_2312BBC48();
    sub_23128A728(&qword_2541595D8, (uint64_t (*)(uint64_t))sub_231291CB8, MEMORY[0x24BDB9DF8]);
    v12 = sub_2312BBCC0();
    swift_release();
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    sub_23128D644(0, &qword_254159660, MEMORY[0x24BE47F58], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_2312BBC54();
    sub_2312B2FD0(&qword_255EC3E48, &qword_2541595E8, MEMORY[0x24BDB9E10], MEMORY[0x24BDB9E20]);
    v12 = sub_2312BBCC0();
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  *a1 = v12;
  return result;
}

uint64_t sub_2312B2AB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;

  v2 = v1;
  v4 = sub_2312BB4C8();
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2312BB4E0();
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v2 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_deviceConfigurationProvider;
  if (qword_254159768 != -1)
    swift_once();
  sub_23128FA58((uint64_t)&unk_25415A950, v10);
  v11 = OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_managedOnboardingExperiences;
  sub_23128F93C(0, &qword_254159708, (unint64_t *)&qword_254159388, (uint64_t)&protocol descriptor for OnboardingExperienceDataProviding, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v12 = swift_allocObject();
  v26 = xmmword_2312BCBF0;
  *(_OWORD *)(v12 + 16) = xmmword_2312BCBF0;
  *(_QWORD *)(v12 + 56) = type metadata accessor for EnvironmentAudioNotificationOnboardingDataProvider();
  *(_QWORD *)(v12 + 64) = &off_2500176E8;
  v13 = sub_23129A8B4((uint64_t *)(v12 + 32));
  if (qword_2541597A8 != -1)
    swift_once();
  v14 = sub_2312BBBC4();
  v15 = sub_23128A1E0(v14, (uint64_t)qword_25415A9C0);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v13, v15, v14);
  *(_QWORD *)(v2 + v11) = v12;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator____lazy_storage___publisher) = 0;
  sub_2312BB4EC();
  sub_23128B850(&v31, v2 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_context);
  v16 = (void *)sub_2312BB4F8();
  sub_23128D554(0, &qword_2541596E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v17 = sub_2312BB3F0();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v26;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v18 + 104))(v20 + v19, *MEMORY[0x24BE474E0], v17);
  v21 = v16;
  sub_231299A6C(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  v22 = swift_deallocClassInstance();
  v23 = sub_2312AE8B0(v22);
  sub_231297D78(v23);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v6, *MEMORY[0x24BE47910], v28);
  sub_2312BB4D4();

  v24 = sub_2312BB504();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a1, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v2 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_domain, v9, v30);
  return v2;
}

uint64_t sub_2312B2DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_domain;
  v2 = sub_2312BB4E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_23128FB54(v0 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_deviceConfigurationProvider);
  sub_23128B88C(v0 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_context);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2312B2E8C()
{
  return type metadata accessor for NoiseNotificationsPromotionGenerator();
}

uint64_t type metadata accessor for NoiseNotificationsPromotionGenerator()
{
  uint64_t result;

  result = qword_254159038;
  if (!qword_254159038)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2312B2ED0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2312BB4E0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2312B2F68()
{
  return sub_2312B2754();
}

uint64_t sub_2312B2F88@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC16HearingAppPlugin36NoiseNotificationsPromotionGenerator_domain;
  v4 = sub_2312BB4E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2312B2FD0(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_2312B303C(255, a2, a3);
    result = MEMORY[0x2348D9A30](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2312B3010()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2312B3034@<X0>(uint64_t *a1@<X8>)
{
  return sub_2312B28C4(a1);
}

void sub_2312B303C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_23128D644(255, &qword_254159660, MEMORY[0x24BE47F58], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v7 = a3(a1, v6, MEMORY[0x24BEE4078], MEMORY[0x24BEE40A8]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_2312B30BC(unint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  sub_23128AC6C(0, &qword_254159678);
  if (a2 >> 62)
  {
    v4 = sub_2312BC098();
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      return v4;
  }
  else
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) > a1)
    {
      v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
      swift_unknownObjectRetain();
      objc_opt_self();
      if (!swift_dynamicCastObjCClass())
        goto LABEL_10;
      return v4;
    }
    __break(1u);
  }
LABEL_10:
  sub_2312BC020();
  sub_2312BBDD4();
  sub_2312BC1E8();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  sub_2312BBDD4();
  swift_getObjectType();
  sub_2312BBA5C();
  sub_2312BC1E8();
  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  result = sub_2312BC074();
  __break(1u);
  return result;
}

_QWORD *sub_2312B32A4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_2312B37A8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2312B33C4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2312B33EC(a1, a2, a3, a4, &qword_2541596F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0]);
}

uint64_t sub_2312B33D8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2312B33EC(a1, a2, a3, a4, (unint64_t *)&qword_255EC39D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3F938]);
}

uint64_t sub_2312B33EC(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23128D554(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = j__malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_2312BC05C();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2312B3D10(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_2312B3608(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_2312B3640(a1, a2, a3, a4, (unint64_t *)&unk_255EC3E58, (unint64_t *)&qword_255EC33B8, MEMORY[0x24BE42740]);
}

_QWORD *sub_2312B3624(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_2312B3640(a1, a2, a3, a4, &qword_254159700, (unint64_t *)&qword_254159350, MEMORY[0x24BE47AB0]);
}

_QWORD *sub_2312B3640(_QWORD *result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, unint64_t *a6, uint64_t a7)
{
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  _QWORD *v16;

  v9 = (char)result;
  if ((a3 & 1) == 0)
  {
    v11 = a2;
    goto LABEL_8;
  }
  v10 = a4[3];
  v11 = v10 >> 1;
  if ((uint64_t)(v10 >> 1) >= a2)
    goto LABEL_8;
  if (v11 + 0x4000000000000000 >= 0)
  {
    v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v11 = a2;
LABEL_8:
    v12 = a4[2];
    if (v11 <= v12)
      v13 = a4[2];
    else
      v13 = v11;
    if (v13)
    {
      sub_23128F93C(0, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v14 = (_QWORD *)swift_allocObject();
      v15 = j__malloc_size(v14);
      v14[2] = v12;
      v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
      v16 = v14 + 4;
      if ((v9 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[5 * v12 + 4])
          memmove(v16, a4 + 4, 40 * v12);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v16 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2312B3E28(0, v12, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2312B378C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2312B235C(a1, **(_QWORD **)(v2 + 16), a2);
}

uint64_t sub_2312B37A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

void sub_2312B3898(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2312BC08C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      sub_2312B3C48();
      v3 = sub_2312BBFFC();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_2312BC08C();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    while (1)
    {
      v8 = sub_2312B30BC(v7, a1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_2312BBF6C();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        sub_23128AC6C(0, &qword_254159678);
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_2312BBF78();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          sub_2312BBA5C();
          v4 = v41;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_2312BBF78();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v4 = v41;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v4)
        return;
    }
  }
  v24 = 0;
  v39 = a1 + 32;
  v40 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_2312BBF6C();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_23128AC6C(0, &qword_254159678);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_2312BBF78();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_2312BBF78();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v41)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_2312B3BEC(uint64_t a1)
{
  uint64_t v2;

  sub_23128F93C(0, &qword_2541593B0, &qword_2541593A8, (uint64_t)&protocol descriptor for DeviceConfigurableOnboardingProviding, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2312B3C48()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2541596D0)
  {
    sub_23128AC6C(255, &qword_254159678);
    sub_2312B3CB8();
    v0 = sub_2312BC008();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2541596D0);
  }
}

unint64_t sub_2312B3CB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254159680;
  if (!qword_254159680)
  {
    v1 = sub_23128AC6C(255, &qword_254159678);
    result = MEMORY[0x2348D9A30](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254159680);
  }
  return result;
}

uint64_t sub_2312B3D10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

uint64_t sub_2312B3E28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 40 * a1 + 32;
    v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_23128A7F0(0, a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_2312BC0D4();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandler(uint64_t a1)
{
  return sub_231295D00(a1, (uint64_t *)&unk_254159140);
}

uint64_t sub_2312B3F4C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2312B3F88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;

  v18 = a2;
  v20 = sub_2312BB600();
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v21 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312B5480(0, &qword_255EC3EB0, MEMORY[0x24BEE33E0]);
  v19 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - v8;
  v10 = type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128B868(a1, a1[3]);
  sub_2312B543C();
  sub_2312BC1B8();
  if (!v2)
  {
    v13 = (uint64_t)v12;
    sub_23128A728(&qword_255EC3388, (uint64_t (*)(uint64_t))MEMORY[0x24BE412A8], MEMORY[0x24BE412C8]);
    v15 = v19;
    v14 = v20;
    sub_2312BC0F8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v15);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v13, v21, v14);
    sub_2312B5320(v13, v18);
  }
  return sub_23128B88C((uint64_t)a1);
}

uint64_t sub_2312B4168()
{
  sub_2312B543C();
  return sub_2312BC1D0();
}

uint64_t sub_2312B4190()
{
  sub_2312B543C();
  return sub_2312BC1DC();
}

uint64_t sub_2312B41B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2312B3F88(a1, a2);
}

uint64_t sub_2312B41CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_2312B5480(0, &qword_254159258, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - v5;
  sub_23128B868(a1, a1[3]);
  sub_2312B543C();
  sub_2312BC1C4();
  sub_2312BB600();
  sub_23128A728(&qword_254158F30, (uint64_t (*)(uint64_t))MEMORY[0x24BE412A8], MEMORY[0x24BE412B8]);
  sub_2312BC104();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_2312B42E4()
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  char *v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  char *v70;
  id v71;
  void *v72;
  id v73;
  unsigned int v74;
  id v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  char *v81;
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  void (*v92)(char *, char *, uint64_t);
  NSObject *v93;
  os_log_type_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  void (*v103)(char *, uint64_t);
  char *v104;
  char *v105;
  char *v106;
  NSObject *v107;
  os_log_type_t v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  id v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t ObjectType;
  char *v140;
  void (**v141)(_QWORD, _QWORD);
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146[2];

  ObjectType = swift_getObjectType();
  v125 = sub_2312BB390();
  v124 = *(_QWORD *)(v125 - 8);
  MEMORY[0x24BDAC7A8](v125);
  v123 = (uint64_t)&v120 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = sub_2312BB774();
  v133 = *(_QWORD *)(v136 - 8);
  v2 = MEMORY[0x24BDAC7A8](v136);
  v130 = (char *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v137 = (char *)&v120 - v4;
  v134 = sub_2312BB600();
  v143 = *(_QWORD *)(v134 - 8);
  v5 = MEMORY[0x24BDAC7A8](v134);
  v126 = (char *)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v135 = (char *)&v120 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v142 = (char *)&v120 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v129 = (char *)&v120 - v11;
  v144 = sub_2312BBBC4();
  v141 = *(void (***)(_QWORD, _QWORD))(v144 - 8);
  v12 = MEMORY[0x24BDAC7A8](v144);
  v131 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v128 = (char *)&v120 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v122 = (char *)&v120 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v140 = (char *)&v120 - v18;
  v19 = sub_2312BB9D8();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2312B52B8();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v120 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(0);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v120 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v120 - v31;
  v138 = v0;
  sub_2312BBA98();
  sub_23128A728(qword_255EC3E80, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData, (uint64_t)&unk_2312BE690);
  sub_23128A728(&qword_2541591D0, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData, (uint64_t)&unk_2312BE668);
  sub_2312BB9CC();
  v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  v132 = v19;
  v33(v22, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_23129F084((uint64_t)v25, (uint64_t (*)(_QWORD))sub_2312B52B8);
    v34 = v131;
    sub_2312BBBA0();
    v35 = sub_2312BBBAC();
    v36 = sub_2312BBEC4();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v146[0] = v38;
      *(_DWORD *)v37 = 136315138;
      v39 = sub_2312BC1E8();
      v145 = sub_2312AE104(v39, v40, v146);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v35, v36, "%s Could not access action handler user data!", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v38, -1, -1);
      MEMORY[0x2348D9AB4](v37, -1, -1);
    }

    ((void (**)(char *, uint64_t))v141)[1](v34, v144);
    return;
  }
  v131 = (char *)v33;
  sub_2312B5320((uint64_t)v25, (uint64_t)v32);
  sub_2312BBBA0();
  sub_2312B5364((uint64_t)v32, (uint64_t)v30);
  v41 = sub_2312BBBAC();
  v42 = sub_2312BBED0();
  v43 = os_log_type_enabled(v41, v42);
  v127 = v32;
  if (v43)
  {
    v44 = swift_slowAlloc();
    v121 = swift_slowAlloc();
    v146[0] = v121;
    *(_DWORD *)v44 = 136315394;
    v45 = sub_2312BC1E8();
    v145 = sub_2312AE104(v45, v46, v146);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    v47 = *(void (**)(char *, char *, uint64_t))(v143 + 16);
    v48 = v134;
    v47(v129, v30, v134);
    v49 = sub_2312BBDB0();
    v145 = sub_2312AE104(v49, v50, v146);
    v51 = (uint64_t)v127;
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    sub_23129F084((uint64_t)v30, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData);
    _os_log_impl(&dword_231285000, v41, v42, "%s Did select cell with feature status %s", (uint8_t *)v44, 0x16u);
    v52 = v121;
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v52, -1, -1);
    MEMORY[0x2348D9AB4](v44, -1, -1);

    v53 = v140;
    v140 = (char *)v141[1];
    ((void (*)(char *, uint64_t))v140)(v53, v144);
  }
  else
  {
    v51 = (uint64_t)v32;
    sub_23129F084((uint64_t)v30, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData);

    v54 = v140;
    v140 = (char *)v141[1];
    ((void (*)(char *, uint64_t))v140)(v54, v144);
    v47 = *(void (**)(char *, char *, uint64_t))(v143 + 16);
    v48 = v134;
  }
  v55 = v142;
  v56 = v137;
  v47(v142, (char *)v51, v48);
  sub_2312BBA98();
  v141 = (void (**)(_QWORD, _QWORD))sub_2312BB9C0();
  v57 = v51;
  v58 = (void (*)(char *, uint64_t))v131;
  v59 = v132;
  ((void (*)(char *, uint64_t))v131)(v22, v132);
  sub_2312BBA98();
  sub_2312BB654();
  v58(v22, v59);
  v60 = v135;
  v61 = v47;
  v47(v135, v55, v48);
  v62 = v143;
  v63 = (*(uint64_t (**)(char *, uint64_t))(v143 + 88))(v60, v48);
  v64 = v48;
  if (v63 == *MEMORY[0x24BE41298])
  {
    v65 = v48;
    v66 = v133;
    v67 = (uint64_t)v130;
    v68 = v136;
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v130, v56, v136);
    v69 = objc_allocWithZone((Class)type metadata accessor for HeadphoneNotificationsSettingsViewController(0));
    v70 = sub_2312A354C(v67);
    v71 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v71)
    {
      v72 = v71;
      v73 = objc_msgSend(v71, sel_features);

      if (v73)
      {
        v74 = objc_msgSend(v73, sel_stanley);

        if (v74)
        {
          v75 = v141;
          objc_msgSend(v141, sel_showAdaptively_sender_, v70, v138);

          (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v68);
          v76 = *(void (**)(char *, uint64_t))(v62 + 8);
        }
        else
        {
          v85 = v141;
          v86 = objc_msgSend(v141, sel_navigationController);
          v87 = (uint64_t)v127;
          if (v86)
          {
            v88 = v86;
            objc_msgSend(v86, sel_pushViewController_animated_, v70, 1);

            (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v68);
            (*(void (**)(char *, uint64_t))(v62 + 8))(v142, v65);
            sub_23129F084(v87, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData);
            return;
          }
          v105 = v122;
          sub_2312BBB88();
          v106 = v70;
          v107 = sub_2312BBBAC();
          v108 = sub_2312BBEB8();
          v109 = v108;
          if (os_log_type_enabled(v107, v108))
          {
            v110 = swift_slowAlloc();
            LODWORD(v135) = v109;
            v111 = v110;
            v138 = swift_slowAlloc();
            v146[0] = v138;
            *(_DWORD *)v111 = 136315394;
            v112 = sub_2312BC1E8();
            v145 = sub_2312AE104(v112, v113, v146);
            sub_2312BBF9C();
            swift_bridgeObjectRelease();
            *(_WORD *)(v111 + 12) = 2080;
            v114 = v106;
            v115 = objc_msgSend(v114, sel_description);
            v116 = sub_2312BBD98();
            v118 = v117;

            v145 = sub_2312AE104(v116, v118, v146);
            sub_2312BBF9C();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_231285000, v107, (os_log_type_t)v135, "[%s]: Unable to handle tap of detail item: %s", (uint8_t *)v111, 0x16u);
            v119 = v138;
            swift_arrayDestroy();
            MEMORY[0x2348D9AB4](v119, -1, -1);
            MEMORY[0x2348D9AB4](v111, -1, -1);

            ((void (*)(char *, uint64_t))v140)(v105, v144);
            (*(void (**)(char *, uint64_t))(v133 + 8))(v137, v68);
            (*(void (**)(char *, uint64_t))(v143 + 8))(v142, v134);
            goto LABEL_14;
          }

          ((void (*)(char *, uint64_t))v140)(v105, v144);
          (*(void (**)(char *, uint64_t))(v66 + 8))(v137, v68);
          v76 = *(void (**)(char *, uint64_t))(v62 + 8);
        }
        v76(v142, v65);
LABEL_14:
        sub_23129F084((uint64_t)v127, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  v77 = v133;
  v78 = v136;
  if (v63 == *MEMORY[0x24BE412A0])
  {
    v79 = (uint64_t)v130;
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v130, v56, v136);
    v80 = objc_allocWithZone((Class)type metadata accessor for HeadphoneNotificationsSettingsViewController(0));
    v81 = sub_2312A354C(v79);
    sub_2312BB99C();
    sub_2312B7A4C();
    v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A728]), sel_initWithRootViewController_, v81);
    v83 = v141;
    objc_msgSend(v141, sel_presentViewController_animated_completion_, v82, 1, 0);

LABEL_19:
    (*(void (**)(char *, uint64_t))(v77 + 8))(v56, v78);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v142, v64);
    sub_23129F084(v57, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData);
    return;
  }
  if (v63 == *MEMORY[0x24BE41288])
  {
    v84 = v123;
    sub_2312B7910(v123);
    sub_2312BB36C();

    (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v84, v125);
    goto LABEL_19;
  }
  sub_2312BBBA0();
  v89 = v48;
  v90 = v126;
  v91 = v142;
  v92 = v61;
  v61(v126, v142, v48);
  v93 = sub_2312BBBAC();
  v94 = sub_2312BBEB8();
  v95 = v94;
  if (os_log_type_enabled(v93, v94))
  {
    v96 = swift_slowAlloc();
    LODWORD(v138) = v95;
    v97 = v96;
    v98 = swift_slowAlloc();
    v146[0] = v98;
    *(_DWORD *)v97 = 136315650;
    v99 = sub_2312BC1E8();
    v145 = sub_2312AE104(v99, v100, v146);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v97 + 12) = 2080;
    v145 = sub_2312AE104(0x63656C6553646964, 0xEB00000000292874, v146);
    sub_2312BBF9C();
    *(_WORD *)(v97 + 22) = 2080;
    v92(v129, v90, v89);
    v101 = sub_2312BBDB0();
    v145 = sub_2312AE104(v101, v102, v146);
    sub_2312BBF9C();
    swift_bridgeObjectRelease();
    v103 = *(void (**)(char *, uint64_t))(v143 + 8);
    v103(v90, v89);
    _os_log_impl(&dword_231285000, v93, (os_log_type_t)v138, "%s.%s Unhandled feature status %s", (uint8_t *)v97, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2348D9AB4](v98, -1, -1);
    MEMORY[0x2348D9AB4](v97, -1, -1);

    ((void (*)(char *, uint64_t))v140)(v128, v144);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v137, v136);
    v104 = v142;
  }
  else
  {

    v103 = *(void (**)(char *, uint64_t))(v62 + 8);
    v103(v90, v89);
    ((void (*)(char *, uint64_t))v140)(v128, v144);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v137, v136);
    v104 = v91;
  }
  v103(v104, v89);
  sub_23129F084((uint64_t)v127, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData);
  v103(v135, v89);
}

uint64_t sub_2312B51A4(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v3 = sub_2312BB9D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v8 = sub_2312BBAA4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id sub_2312B524C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandler(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2312B5280()
{
  return type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandler(0);
}

uint64_t sub_2312B5288()
{
  return sub_23128A728(&qword_254159138, type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandler, (uint64_t)&unk_2312BE5B4);
}

void sub_2312B52B8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3E78)
  {
    type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(255);
    v0 = sub_2312BBF90();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3E78);
  }
}

uint64_t type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(uint64_t a1)
{
  return sub_231295D00(a1, qword_2541591D8);
}

uint64_t sub_2312B5320(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2312B5364(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2312B53A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2312B53B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2312B53F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2312B53FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2312BB600();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

unint64_t sub_2312B543C()
{
  unint64_t result;

  result = qword_2541591B8;
  if (!qword_2541591B8)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BE77C, &type metadata for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2541591B8);
  }
  return result;
}

void sub_2312B5480(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_2312B543C();
    v7 = a3(a1, &type metadata for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t storeEnumTagSinglePayload for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2312B551C + 4 * byte_2312BE570[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2312B553C + 4 * byte_2312BE575[v4]))();
}

_BYTE *sub_2312B551C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2312B553C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2312B5544(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2312B554C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2312B5554(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2312B555C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys()
{
  return &type metadata for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys;
}

unint64_t sub_2312B557C()
{
  unint64_t result;

  result = qword_255EC3EB8;
  if (!qword_255EC3EB8)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BE754, &type metadata for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255EC3EB8);
  }
  return result;
}

unint64_t sub_2312B55C4()
{
  unint64_t result;

  result = qword_2541591C8;
  if (!qword_2541591C8)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BE6C4, &type metadata for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2541591C8);
  }
  return result;
}

unint64_t sub_2312B560C()
{
  unint64_t result;

  result = qword_2541591C0;
  if (!qword_2541591C0)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BE6EC, &type metadata for HeadphoneNotificationsFeatureStatusActionHandlerData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2541591C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ResultError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2312B5690 + 4 * byte_2312BE7D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2312B56B0 + 4 * byte_2312BE7D5[v4]))();
}

_BYTE *sub_2312B5690(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2312B56B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2312B56B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2312B56C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2312B56C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2312B56D0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ResultError()
{
  return &type metadata for ResultError;
}

unint64_t sub_2312B56F0()
{
  unint64_t result;

  result = qword_255EC3EC0;
  if (!qword_255EC3EC0)
  {
    result = MEMORY[0x2348D9A30](&unk_2312BE830, &type metadata for ResultError);
    atomic_store(result, (unint64_t *)&qword_255EC3EC0);
  }
  return result;
}

uint64_t SoundLevelModel.init(title:description:warningDescription:valueOffsetPercentage:valueWidthPercentage:showBottomHairline:chartForegroundColor:chartBackgroundColor:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, float a10@<S0>, float a11@<S1>, uint64_t a12)
{
  if (a10 <= 0.0)
    a10 = 0.0;
  if (a10 > 1.0)
    a10 = 1.0;
  if (a11 <= 0.0)
    a11 = 0.0;
  if (a11 > 1.0)
    a11 = 1.0;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_BYTE *)(a9 + 48) = a7;
  if ((float)(1.0 - a10) < a11)
    a11 = 1.0 - a10;
  *(float *)(a9 + 56) = a10;
  *(float *)(a9 + 60) = a11;
  *(_QWORD *)(a9 + 64) = a8;
  *(_QWORD *)(a9 + 72) = a12;
  *(_QWORD *)(a9 + 80) = 0x4010000000000000;
  return result;
}

char *SoundLevelView.__allocating_init(model:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SoundLevelView.init(model:)(a1);
}

void sub_2312B57D0()
{
  uint64_t v0;

  sub_2312B6FCC(1);
  qword_255EC3EC8 = v0;
}

void sub_2312B57F0()
{
  id v0;
  uint64_t inited;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE220]);
  sub_2312B714C(0, &qword_255EC3F30, (void (*)(uint64_t))sub_2312B6EE4);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BCC00;
  v2 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 40) = v0;
  v3 = (void *)*MEMORY[0x24BEBB368];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BEBB368];
  v4 = (void *)objc_opt_self();
  v5 = v2;
  v6 = v0;
  v7 = v3;
  *(_QWORD *)(inited + 56) = objc_msgSend(v4, sel_labelColor);
  v8 = sub_23128EA3C(inited);

  qword_255EC3ED0 = v8;
}

unint64_t sub_2312B58F4()
{
  uint64_t inited;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t result;

  sub_2312B714C(0, &qword_255EC3F30, (void (*)(uint64_t))sub_2312B6EE4);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BCC00;
  v1 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  v2 = (void *)objc_opt_self();
  v3 = *MEMORY[0x24BEBE1E0];
  v4 = v1;
  v5 = objc_msgSend(v2, sel_preferredFontForTextStyle_, v3);
  v6 = (void *)*MEMORY[0x24BEBB368];
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 48) = v6;
  v7 = (void *)objc_opt_self();
  v8 = v6;
  *(_QWORD *)(inited + 56) = objc_msgSend(v7, sel_secondaryLabelColor);
  result = sub_23128EA3C(inited);
  qword_255EC3ED8 = result;
  return result;
}

char *SoundLevelView.init(model:)(uint64_t a1)
{
  char *v1;
  __int128 v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  id v81;
  id v82;
  id v83;
  char *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  objc_super v90;
  _OWORD v91[2];

  *(_QWORD *)&v1[OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_headerStackView] = 0;
  v3 = *(_OWORD *)(a1 + 72);
  v91[0] = *(_OWORD *)(a1 + 56);
  v91[1] = v3;
  v4 = (void *)v3;
  objc_allocWithZone((Class)type metadata accessor for HorizontalMeterView());
  v5 = v1;
  v6 = *((id *)&v91[0] + 1);
  v7 = v4;
  HorizontalMeterView.init(model:)((uint64_t)v91);
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_meterLevelView] = v8;
  v9 = v8;
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v90.receiver = v5;
  v90.super_class = (Class)type metadata accessor for SoundLevelView();
  v84 = (char *)objc_msgSendSuper2(&v90, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2312B6634();
  v10 = qword_255EC2F58;
  swift_bridgeObjectRetain();
  if (v10 != -1)
    swift_once();
  v11 = qword_255EC3EC8;
  sub_23128AC6C(0, &qword_255EC3EF0);
  v12 = (void *)sub_2312BBF54();
  LODWORD(v13) = 1132068864;
  objc_msgSend(v12, sel_setContentCompressionResistancePriority_forAxis_, 0, v13);
  LODWORD(v14) = 1132068864;
  objc_msgSend(v12, sel_setContentHuggingPriority_forAxis_, 0, v14);
  objc_msgSend(v12, sel_setNumberOfLines_, 0);
  swift_bridgeObjectRetain();
  sub_2312B67D8(v11);
  v15 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v16 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  type metadata accessor for Key();
  v17 = sub_23128FBF4();
  v18 = (void *)sub_2312BBD44();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v15, sel_initWithString_attributes_, v16, v18);

  objc_msgSend(v12, sel_setAttributedText_, v19);
  objc_msgSend(v12, sel_setAdjustsFontForContentSizeCategory_, 1);
  swift_bridgeObjectRelease();
  if (qword_255EC2F60 != -1)
    swift_once();
  v20 = qword_255EC3ED0;
  v21 = (void *)sub_2312BBF54();
  LODWORD(v22) = 1144750080;
  objc_msgSend(v21, sel_setContentCompressionResistancePriority_forAxis_, 0, v22);
  LODWORD(v23) = 1144750080;
  objc_msgSend(v21, sel_setContentHuggingPriority_forAxis_, 0, v23);
  swift_bridgeObjectRetain();
  sub_2312B67D8(v20);
  v24 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v25 = (void *)sub_2312BBD68();
  swift_bridgeObjectRelease();
  v81 = (id)v17;
  v26 = (void *)sub_2312BBD44();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  objc_msgSend(v21, sel_setAttributedText_, v27);
  objc_msgSend(v21, sel_setAdjustsFontForContentSizeCategory_, 1);
  sub_2312A02C8();
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_2312BD4E0;
  *(_QWORD *)(v28 + 32) = v12;
  *(_QWORD *)(v28 + 40) = v21;
  sub_2312BBE28();
  v29 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  sub_23128AC6C(0, &qword_255EC3EF8);
  v87 = v12;
  v86 = v21;
  v30 = (void *)sub_2312BBE04();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v29, sel_initWithArrangedSubviews_, v30);

  objc_msgSend(v31, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v32 = objc_msgSend(v84, sel_traitCollection);
  v33 = objc_msgSend(v32, sel_preferredContentSizeCategory);

  LOBYTE(v32) = sub_2312BBF3C();
  objc_msgSend(v31, sel_setAxis_, v32 & 1);
  objc_msgSend(v31, sel_setSpacing_, 16.0);
  v34 = *(void **)&v84[OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_headerStackView];
  *(_QWORD *)&v84[OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_headerStackView] = v31;
  v35 = v31;

  v36 = *(_QWORD *)(a1 + 40);
  v37 = a1;
  if (qword_255EC2F68 != -1)
    swift_once();
  v38 = qword_255EC3ED8;
  v39 = (void *)sub_2312BBF54();
  LODWORD(v40) = 1132068864;
  objc_msgSend(v39, sel_setContentCompressionResistancePriority_forAxis_, 0, v40);
  LODWORD(v41) = 1132068864;
  objc_msgSend(v39, sel_setContentHuggingPriority_forAxis_, 0, v41);
  objc_msgSend(v39, sel_setNumberOfLines_, 0);
  v89 = a1;
  if (v36)
  {
    swift_bridgeObjectRetain();
    sub_2312B67D8(v38);
    v42 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v43 = (void *)sub_2312BBD68();
    swift_bridgeObjectRelease();
    v44 = (void *)sub_2312BBD44();
    swift_bridgeObjectRelease();
    v45 = objc_msgSend(v42, sel_initWithString_attributes_, v43, v44);

    objc_msgSend(v39, sel_setAttributedText_, v45);
  }
  else
  {
    objc_msgSend(v39, sel_setHidden_, 1);
  }
  objc_msgSend(v39, sel_setAdjustsFontForContentSizeCategory_, 1, v81);
  v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v46, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v47 = objc_msgSend((id)objc_opt_self(), sel_opaqueSeparatorColor);
  objc_msgSend(v46, sel_setBackgroundColor_, v47);

  objc_msgSend(v46, sel_setHidden_, (*(_BYTE *)(v37 + 48) & 1) == 0);
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_2312BE8A0;
  *(_QWORD *)(v48 + 32) = v35;
  v49 = OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_meterLevelView;
  v50 = *(void **)&v84[OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_meterLevelView];
  *(_QWORD *)(v48 + 40) = v50;
  *(_QWORD *)(v48 + 48) = v39;
  *(_QWORD *)(v48 + 56) = v46;
  sub_2312BBE28();
  v51 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v85 = v35;
  v52 = v50;
  v88 = v39;
  v82 = v46;
  v53 = (void *)sub_2312BBE04();
  swift_bridgeObjectRelease();
  v54 = objc_msgSend(v51, sel_initWithArrangedSubviews_, v53);

  objc_msgSend(v54, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v54, sel_setAxis_, 1);
  objc_msgSend(v54, sel_setSpacing_, 5.0);
  objc_msgSend(v54, sel_setCustomSpacing_afterView_, v85, 6.0);
  objc_msgSend(v54, sel_setCustomSpacing_afterView_, *(_QWORD *)&v84[v49], 10.0);
  objc_msgSend(v84, sel_addSubview_, v54);
  v83 = (id)objc_opt_self();
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_2312BE8B0;
  v56 = objc_msgSend(v54, sel_topAnchor);
  v57 = objc_msgSend(v84, sel_layoutMarginsGuide);
  v58 = objc_msgSend(v57, sel_topAnchor);

  v59 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v58);
  *(_QWORD *)(v55 + 32) = v59;
  v60 = objc_msgSend(v54, sel_bottomAnchor);
  v61 = objc_msgSend(v84, sel_bottomAnchor);
  v62 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v61);

  *(_QWORD *)(v55 + 40) = v62;
  v63 = objc_msgSend(v54, sel_leadingAnchor);
  v64 = objc_msgSend(v84, sel_leadingAnchor);
  v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_, v64);

  *(_QWORD *)(v55 + 48) = v65;
  v66 = objc_msgSend(v54, sel_trailingAnchor);
  v67 = objc_msgSend(v84, sel_trailingAnchor);
  v68 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v67);

  *(_QWORD *)(v55 + 56) = v68;
  v69 = objc_msgSend(*(id *)&v84[v49], sel_heightAnchor);
  v70 = objc_msgSend(v69, sel_constraintEqualToConstant_, 8.0);

  *(_QWORD *)(v55 + 64) = v70;
  v71 = objc_msgSend(v82, sel_heightAnchor);
  v72 = objc_msgSend(v71, sel_constraintEqualToConstant_, 0.5);

  *(_QWORD *)(v55 + 72) = v72;
  v73 = objc_msgSend(v82, sel_leadingAnchor);
  v74 = objc_msgSend(v54, sel_leadingAnchor);
  v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_, v74);

  *(_QWORD *)(v55 + 80) = v75;
  v76 = objc_msgSend(v82, sel_trailingAnchor);
  v77 = objc_msgSend(v54, sel_trailingAnchor);
  v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v77);

  *(_QWORD *)(v55 + 88) = v78;
  sub_2312BBE28();
  sub_23128AC6C(0, &qword_255EC3F00);
  v79 = (void *)sub_2312BBE04();
  swift_bridgeObjectRelease();
  objc_msgSend(v83, sel_activateConstraints_, v79);
  sub_2312B6B98(v89);

  return v84;
}

uint64_t sub_2312B6634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_getObjectType();
  sub_2312B714C(0, &qword_255EC3F48, (void (*)(uint64_t))sub_2312B7198);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2312BCBF0;
  v1 = sub_2312BBBD0();
  v2 = MEMORY[0x24BEBCB18];
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v2;
  sub_2312BBF60();
  sub_2312BBA5C();
  return swift_bridgeObjectRelease();
}

id SoundLevelView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void SoundLevelView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SoundLevelView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SoundLevelView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2312B67D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
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
  int64_t v28;
  _OWORD v29[4];
  _OWORD v30[2];
  _OWORD v31[3];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_2312B6F4C();
    v2 = sub_2312BC0BC();
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
  v28 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v28 << 6);
      goto LABEL_28;
    }
    v11 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v26)
      goto LABEL_37;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    v13 = v28 + 1;
    if (!v12)
    {
      v13 = v28 + 2;
      if (v28 + 2 >= v26)
        goto LABEL_37;
      v12 = *(_QWORD *)(v27 + 8 * v13);
      if (!v12)
      {
        v13 = v28 + 3;
        if (v28 + 3 >= v26)
          goto LABEL_37;
        v12 = *(_QWORD *)(v27 + 8 * v13);
        if (!v12)
        {
          v13 = v28 + 4;
          if (v28 + 4 >= v26)
            goto LABEL_37;
          v12 = *(_QWORD *)(v27 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v28 = v13;
LABEL_28:
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v31[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    *(_QWORD *)&v30[0] = v15;
    v16 = *(id *)&v31[0];
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v17 = *(_QWORD *)&v31[0];
    sub_2312B6FB8((_OWORD *)((char *)v31 + 8), v29);
    sub_2312B6FB8(v29, v31);
    sub_2312B6FB8(v31, v30);
    sub_2312BBD98();
    sub_2312BC188();
    sub_2312BBDC8();
    v18 = sub_2312BC1A0();
    result = swift_bridgeObjectRelease();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = v18 & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
      v8 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v17;
    result = (uint64_t)sub_2312B6FB8(v30, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v8));
    ++*(_QWORD *)(v2 + 16);
  }
  v14 = v28 + 5;
  if (v28 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_23129AAE8();
    return v2;
  }
  v12 = *(_QWORD *)(v27 + 8 * v14);
  if (v12)
  {
    v13 = v28 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v26)
      goto LABEL_37;
    v12 = *(_QWORD *)(v27 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SoundLevelView()
{
  return objc_opt_self();
}

uint64_t sub_2312B6B98(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void destroy for SoundLevelModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for SoundLevelModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v6 = *(void **)(a2 + 64);
  v7 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v6;
  v9 = v7;
  return a1;
}

uint64_t assignWithCopy for SoundLevelModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  v4 = *(void **)(a2 + 64);
  v5 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 72);
  v8 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

__n128 initializeWithTake for SoundLevelModel(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SoundLevelModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  v7 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for SoundLevelModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SoundLevelModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SoundLevelModel()
{
  return &type metadata for SoundLevelModel;
}

void sub_2312B6EE4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255EC3F38)
  {
    type metadata accessor for Key();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255EC3F38);
  }
}

void sub_2312B6F4C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EC3F40)
  {
    type metadata accessor for Key();
    sub_23128FBF4();
    v0 = sub_2312BC0C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EC3F40);
  }
}

_OWORD *sub_2312B6FB8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_2312B6FCC(char a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t inited;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE220]);
  v4 = v3;
  if ((a1 & 1) == 0)
    goto LABEL_4;
  v5 = objc_msgSend(v3, sel_fontDescriptor);
  v6 = objc_msgSend(v5, sel_fontDescriptorWithSymbolicTraits_, 2);

  if (v6)
  {
    v7 = objc_msgSend(v2, sel_fontWithDescriptor_size_, v6, 0.0);

    v4 = v7;
LABEL_4:
    sub_2312B714C(0, &qword_255EC3F30, (void (*)(uint64_t))sub_2312B6EE4);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2312BCC00;
    v9 = (void *)*MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 40) = v4;
    v10 = (void *)*MEMORY[0x24BEBB368];
    *(_QWORD *)(inited + 48) = *MEMORY[0x24BEBB368];
    v11 = (void *)objc_opt_self();
    v12 = v9;
    v13 = v4;
    v14 = v10;
    *(_QWORD *)(inited + 56) = objc_msgSend(v11, sel_labelColor);
    sub_23128EA3C(inited);

    return;
  }
  __break(1u);
}

void sub_2312B714C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2312BC11C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_2312B7198()
{
  unint64_t result;

  result = qword_255EC3F50;
  if (!qword_255EC3F50)
  {
    sub_2312B71D0();
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC3F50);
  }
  return result;
}

unint64_t sub_2312B71D0()
{
  unint64_t result;

  result = qword_255EC3F58;
  if (!qword_255EC3F58)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EC3F58);
  }
  return result;
}

void sub_2312B7224(char *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;

  v1 = *(void **)&a1[OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_headerStackView];
  if (v1)
  {
    v5 = v1;
    v3 = objc_msgSend(a1, sel_traitCollection);
    v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

    LOBYTE(v3) = sub_2312BBF3C();
    objc_msgSend(v5, sel_setAxis_, v3 & 1);

  }
}

uint64_t sub_2312B72D0(uint64_t a1, char a2, int a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __int128 v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;

  v46 = a6;
  v45 = a3;
  v10 = sub_2312BBBC4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2312BB600();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == *MEMORY[0x24BE41298])
  {
    v44 = a5;
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v19 = swift_allocObject();
    v43 = xmmword_2312BCBF0;
    *(_OWORD *)(v19 + 16) = xmmword_2312BCBF0;
    if (qword_2541597F0 != -1)
      swift_once();
    *(_QWORD *)(v19 + 32) = sub_2312BB354();
    *(_QWORD *)(v19 + 40) = v20;
    if ((a2 & 1) != 0)
    {
      if ((a4 & 1) != 0 || (v45 & 1) == 0)
      {
        v33 = sub_2312BB354();
        v35 = v34;
        v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = v43;
        *(_QWORD *)(v21 + 32) = v33;
        *(_QWORD *)(v21 + 40) = v35;
      }
      else
      {
        v21 = sub_2312B8D54();
      }
      goto LABEL_19;
    }
    if ((a4 & 1) != 0)
    {
      v21 = sub_2312B9068();
LABEL_19:
      v49 = v21;
      sub_2312A79E4(v19);
      return v49;
    }
    sub_2312BBBA0();
    v36 = sub_2312BBBAC();
    v37 = sub_2312BBEB8();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v49 = v39;
      *(_DWORD *)v38 = 136446210;
      *(_QWORD *)&v47 = v38 + 4;
      v40 = sub_2312BC1E8();
      v48 = sub_2312AE104(v40, v41, &v49);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v36, v37, "[[%{public}s] Feature is active but no devices return active.", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v39, -1, -1);
      MEMORY[0x2348D9AB4](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else if (v18 == *MEMORY[0x24BE412A0])
  {
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2312BCC00;
    if (qword_2541597F0 != -1)
      swift_once();
    *(_QWORD *)(v19 + 32) = sub_2312BB354();
    *(_QWORD *)(v19 + 40) = v22;
    *(_QWORD *)(v19 + 48) = sub_2312BB354();
    *(_QWORD *)(v19 + 56) = v23;
  }
  else if (v18 == *MEMORY[0x24BE41288])
  {
    v24 = sub_2312BB69C();
    v26 = v25;
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    v27 = MEMORY[0x24BEE0D00];
    v28 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v19 = swift_allocObject();
    v47 = xmmword_2312BCBF0;
    *(_OWORD *)(v19 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, v28);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = v47;
    *(_QWORD *)(v29 + 56) = v27;
    *(_QWORD *)(v29 + 64) = sub_23128D600();
    *(_QWORD *)(v29 + 32) = v24;
    *(_QWORD *)(v29 + 40) = v26;
    v30 = sub_2312BBD74();
    v32 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 32) = v30;
    *(_QWORD *)(v19 + 40) = v32;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    return MEMORY[0x24BEE4AF8];
  }
  return v19;
}

uint64_t sub_2312B7910@<X0>(uint64_t a1@<X8>)
{
  return sub_2312B89C8(a1);
}

uint64_t sub_2312B792C()
{
  if (qword_2541597F0 != -1)
    swift_once();
  return sub_2312BB354();
}

unint64_t sub_2312B79C0()
{
  return 0xD000000000000017;
}

uint64_t sub_2312B79DC()
{
  id v0;

  if (qword_2541597F0 != -1)
    swift_once();
  v0 = (id)qword_25415A9E8;
  return sub_2312BB624();
}

uint64_t sub_2312B7A4C()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  void *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t result;
  id v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  id v76;
  void *v77;
  char *v78;
  id v79;
  id v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97[2];

  v97[1] = *(id *)MEMORY[0x24BDAC8D0];
  v94 = sub_2312BBBC4();
  v95 = *(_QWORD *)(v94 - 8);
  v0 = MEMORY[0x24BDAC7A8](v94);
  v91 = (char *)&v87 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v87 - v3;
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v87 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v87 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v87 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v93 = (char *)&v87 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v87 - v16;
  v18 = (char *)objc_opt_self();
  v97[0] = 0;
  if (objc_msgSend(v18, sel__setHeadphoneExposureMeasureLevelsEnabled_error_, 1, v97))
  {
    v19 = v97[0];
  }
  else
  {
    v92 = v10;
    v20 = v97[0];
    v21 = (void *)sub_2312BB360();

    swift_willThrow();
    sub_2312BBBA0();
    v22 = v21;
    v23 = v21;
    v24 = sub_2312BBBAC();
    v25 = sub_2312BBED0();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v89 = v4;
      v27 = (uint8_t *)v26;
      v28 = (void *)swift_slowAlloc();
      v88 = v17;
      v29 = v28;
      v97[0] = v28;
      *(_DWORD *)v27 = 136446210;
      v90 = v7;
      v30 = v18;
      swift_getErrorValue();
      v31 = sub_2312BC14C();
      v96 = sub_2312AE104(v31, v32, (uint64_t *)v97);
      v33 = v94;
      sub_2312BBF9C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_231285000, v24, v25, "Could not enable measure levels on phone. %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      v34 = v29;
      v17 = v88;
      MEMORY[0x2348D9AB4](v34, -1, -1);
      v35 = v27;
      v4 = v89;
      MEMORY[0x2348D9AB4](v35, -1, -1);

      v36 = v33;
      v18 = v30;
      v7 = v90;
      (*(void (**)(char *, uint64_t))(v95 + 8))(v13, v36);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v95 + 8))(v13, v94);
    }
    v10 = v92;
  }
  v97[0] = 0;
  if (objc_msgSend(v18, sel__setHeadphoneExposureNotificationsEnabled_error_, 1, v97))
  {
    v37 = v97[0];
    if ((sub_2312BB660() & 1) == 0)
    {
LABEL_9:
      v38 = v93;
      sub_2312BBBA0();
      v39 = sub_2312BBBAC();
      v40 = sub_2312BBED0();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_231285000, v39, v40, "Enabled phone settings for HAEN.", v41, 2u);
        MEMORY[0x2348D9AB4](v41, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v38, v94);
    }
  }
  else
  {
    v43 = v97[0];
    v44 = (void *)sub_2312BB360();

    swift_willThrow();
    sub_2312BBBA0();
    v45 = v44;
    v46 = v44;
    v47 = sub_2312BBBAC();
    v48 = sub_2312BBEC4();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = (void *)swift_slowAlloc();
      v92 = v10;
      v51 = v50;
      v97[0] = v50;
      v90 = v7;
      v89 = v18;
      *(_DWORD *)v49 = 136446210;
      swift_getErrorValue();
      v52 = sub_2312BC14C();
      v96 = sub_2312AE104(v52, v53, (uint64_t *)v97);
      v18 = v89;
      v7 = v90;
      sub_2312BBF9C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_231285000, v47, v48, "Could not enable notifications on phone. %{public}s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v51, -1, -1);
      MEMORY[0x2348D9AB4](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v95 + 8))(v92, v94);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v95 + 8))(v10, v94);
    }
    if ((sub_2312BB660() & 1) == 0)
      goto LABEL_9;
  }
  if (objc_msgSend(v18, sel_isHeadphoneExposureNotificationsSupportedOnActiveWatch))
  {
    v97[0] = 0;
    result = (uint64_t)objc_msgSend(v18, sel_isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError_, v97);
    if (v97[0])
    {
      v54 = v97[0];
      swift_willThrow();
      sub_2312BBBA0();
      v55 = v54;
      v56 = sub_2312BBBAC();
      v57 = sub_2312BBEC4();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        v59 = (void *)swift_slowAlloc();
        v97[0] = v59;
        *(_DWORD *)v58 = 136446210;
        swift_getErrorValue();
        v60 = sub_2312BC14C();
        v96 = sub_2312AE104(v60, v61, (uint64_t *)v97);
        sub_2312BBF9C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_231285000, v56, v57, "Could not enable determine if notifications enabled on watch. %{public}s", v58, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348D9AB4](v59, -1, -1);
        MEMORY[0x2348D9AB4](v58, -1, -1);

      }
      else
      {

      }
      return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v7, v94);
    }
    else if ((result & 1) == 0)
    {
      v97[0] = 0;
      if (objc_msgSend(v18, sel__setHeadphoneExposureMeasureLevelsEnabledOnActiveWatch_error_, 1, v97))
      {
        v65 = v97[0];
      }
      else
      {
        v66 = v97[0];
        v67 = (void *)sub_2312BB360();

        swift_willThrow();
        sub_2312BBBA0();
        v68 = v67;
        v69 = v67;
        v70 = sub_2312BBBAC();
        v71 = sub_2312BBED0();
        if (os_log_type_enabled(v70, v71))
        {
          v72 = (uint8_t *)swift_slowAlloc();
          v73 = (void *)swift_slowAlloc();
          v97[0] = v73;
          *(_DWORD *)v72 = 136446210;
          swift_getErrorValue();
          v74 = sub_2312BC14C();
          v96 = sub_2312AE104(v74, v75, (uint64_t *)v97);
          sub_2312BBF9C();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_231285000, v70, v71, "Could not enable measure levels on watch. %{public}s", v72, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2348D9AB4](v73, -1, -1);
          MEMORY[0x2348D9AB4](v72, -1, -1);

        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v95 + 8))(v4, v94);
      }
      v97[0] = 0;
      if (objc_msgSend(v18, sel__setHeadphoneExposureNotificationsEnabledOnActiveWatch_error_, 1, v97))
      {
        return (uint64_t)v97[0];
      }
      else
      {
        v93 = (char *)v97[0];
        v76 = v97[0];
        v77 = (void *)sub_2312BB360();

        swift_willThrow();
        v78 = v91;
        sub_2312BBBA0();
        v79 = v77;
        v80 = v77;
        v81 = sub_2312BBBAC();
        v82 = sub_2312BBEC4();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)swift_slowAlloc();
          v84 = (void *)swift_slowAlloc();
          v97[0] = v84;
          *(_DWORD *)v83 = 136446210;
          swift_getErrorValue();
          v85 = sub_2312BC14C();
          v96 = sub_2312AE104(v85, v86, (uint64_t *)v97);
          sub_2312BBF9C();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_231285000, v81, v82, "Could not enable notifications on watch. %{public}s", v83, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2348D9AB4](v84, -1, -1);
          MEMORY[0x2348D9AB4](v83, -1, -1);

        }
        else
        {

        }
        return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v78, v94);
      }
    }
  }
  else
  {
    sub_2312BBBA0();
    v62 = sub_2312BBBAC();
    v63 = sub_2312BBED0();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_231285000, v62, v63, "Omitting enabling HAEN for unsupported watch.", v64, 2u);
      MEMORY[0x2348D9AB4](v64, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v17, v94);
  }
  return result;
}

uint64_t sub_2312B86B0(char a1, char a2)
{
  uint64_t v3;

  if ((a1 & 1) != 0)
  {
    if (qword_2541597F0 != -1)
      swift_once();
  }
  else if (qword_2541597F0 != -1)
  {
    swift_once();
  }
  sub_2312BB354();
  v3 = sub_2312B9354(a2 & 1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2312B87E0(char a1)
{
  if ((a1 & 1) != 0)
    return sub_2312BB69C();
  if (qword_2541597F0 != -1)
    swift_once();
  return sub_2312BB354();
}

uint64_t sub_2312B887C(char a1, char a2)
{
  uint64_t v3;

  if ((a1 & 1) != 0)
  {
    if (qword_2541597F0 != -1)
      swift_once();
  }
  else if (qword_2541597F0 != -1)
  {
    swift_once();
  }
  sub_2312BB354();
  v3 = sub_2312B9354(a2 & 1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2312B89AC@<X0>(uint64_t a1@<X8>)
{
  return sub_2312B89C8(a1);
}

uint64_t sub_2312B89C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - v3;
  sub_2312B8AB4((uint64_t)&v8 - v3);
  v5 = sub_2312BB390();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  __break(1u);
  return result;
}

uint64_t sub_2312B8AB4@<X0>(uint64_t a1@<X8>)
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
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = sub_2312BBBC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - v7;
  sub_2312BB384();
  v9 = sub_2312BB390();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23128D4B4((uint64_t)v8, (uint64_t)&qword_254158F28, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23128D554);
    sub_2312BBBA0();
    v11 = sub_2312BBBAC();
    v12 = sub_2312BBEC4();
    if (os_log_type_enabled(v11, v12))
    {
      v23 = a1;
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v22 = v3;
      v15 = v14;
      v25 = v14;
      *(_DWORD *)v13 = 136446210;
      v21 = v2;
      v16 = sub_2312BC1E8();
      v24 = sub_2312AE104(v16, v17, &v25);
      sub_2312BBF9C();
      a1 = v23;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v11, v12, "[%{public}s]: Invalid URL.", v13, 0xCu);
      v18 = 1;
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v15, -1, -1);
      MEMORY[0x2348D9AB4](v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v21);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v18 = 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v8, v9);
    v18 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, v18, 1, v9);
}

uint64_t sub_2312B8D54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v0 = sub_2312BBBC4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDeviceDisplayName);
  if (v4)
  {
    v5 = v4;
    v6 = sub_2312BBD98();
    v8 = v7;

    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    v9 = MEMORY[0x24BEE0D00];
    v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v11 = swift_allocObject();
    v23 = xmmword_2312BCBF0;
    *(_OWORD *)(v11 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, v10);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = v23;
    *(_QWORD *)(v12 + 56) = v9;
    *(_QWORD *)(v12 + 64) = sub_23128D600();
    *(_QWORD *)(v12 + 32) = v6;
    *(_QWORD *)(v12 + 40) = v8;
    v13 = sub_2312BBD74();
    v15 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v11 + 32) = v13;
    *(_QWORD *)(v11 + 40) = v15;
  }
  else
  {
    sub_2312BBBA0();
    v16 = sub_2312BBBAC();
    v17 = sub_2312BBEB8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v25 = v19;
      *(_DWORD *)v18 = 136446210;
      v20 = sub_2312BC1E8();
      v24 = sub_2312AE104(v20, v21, &v25);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v16, v17, "[[%{public}s] Could not fetch device display name.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v19, -1, -1);
      MEMORY[0x2348D9AB4](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return MEMORY[0x24BEE4AF8];
  }
  return v11;
}

uint64_t sub_2312B9068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v0 = sub_2312BBBC4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23128CA0C();
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    v8 = MEMORY[0x24BEE0D00];
    v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
    sub_23128D644(0, (unint64_t *)&qword_254159718, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v10 = swift_allocObject();
    v22 = xmmword_2312BCBF0;
    *(_OWORD *)(v10 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, v9);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = v22;
    *(_QWORD *)(v11 + 56) = v8;
    *(_QWORD *)(v11 + 64) = sub_23128D600();
    *(_QWORD *)(v11 + 32) = v6;
    *(_QWORD *)(v11 + 40) = v7;
    v12 = sub_2312BBD74();
    v14 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v10 + 32) = v12;
    *(_QWORD *)(v10 + 40) = v14;
  }
  else
  {
    sub_2312BBBA0();
    v15 = sub_2312BBBAC();
    v16 = sub_2312BBEB8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v24 = v18;
      *(_DWORD *)v17 = 136446210;
      v19 = sub_2312BC1E8();
      v23 = sub_2312AE104(v19, v20, &v24);
      sub_2312BBF9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_231285000, v15, v16, "[[%{public}s] Could not fetch watch display name.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348D9AB4](v18, -1, -1);
      MEMORY[0x2348D9AB4](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return MEMORY[0x24BEE4AF8];
  }
  return v10;
}

uint64_t sub_2312B9354(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((a1 & 1) != 0)
  {
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v2 = sub_2312B87E0(a1 & 1);
  v4 = v3;
  sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2312BCBF0;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 64) = sub_23128D600();
  *(_QWORD *)(v5 + 32) = v2;
  *(_QWORD *)(v5 + 40) = v4;
  v6 = sub_2312BBD74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

void HorizontalMeterView.__allocating_init(model:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  HorizontalMeterView.init(model:)(a1);
}

void HorizontalMeterView.init(model:)(uint64_t a1)
{
  char *v1;
  void *v3;
  void *v4;
  char *v5;
  __int128 v6;
  id v7;
  id v8;
  id v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  char *v40;
  id v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  *(_QWORD *)&v1[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth] = 0;
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  v5 = &v1[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model];
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a1;
  *((_OWORD *)v5 + 1) = v6;
  v58.receiver = v1;
  v58.super_class = (Class)type metadata accessor for HorizontalMeterView();
  v7 = v3;
  v8 = v4;
  v9 = objc_msgSendSuper2(&v58, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v10 = *(double *)(a1 + 24);
  sub_23128AC6C(0, &qword_255EC3EF8);
  v11 = v9;
  v12 = (void *)sub_2312BBF54();
  v56 = v8;
  objc_msgSend(v12, sel_setBackgroundColor_, v8);
  v13 = objc_msgSend(v12, sel_layer);
  objc_msgSend(v13, sel_setCornerRadius_, v10);

  v14 = (void *)sub_2312BBF54();
  v57 = v7;
  objc_msgSend(v14, sel_setBackgroundColor_, v7);
  v15 = objc_msgSend(v14, sel_layer);
  objc_msgSend(v15, sel_setCornerRadius_, v10);

  sub_2312A02C8();
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2312BD4E0;
  *(_QWORD *)(v16 + 32) = v12;
  *(_QWORD *)(v16 + 40) = v14;
  sub_2312BBE28();
  v17 = (char *)v11;
  v18 = v12;
  v19 = v14;
  sub_2312BBF48();

  swift_bridgeObjectRelease();
  if (*(float *)(a1 + 4) < 1.1755e-38)
    objc_msgSend(v19, sel_setHidden_, 1);
  v20 = objc_msgSend(v19, sel_leadingAnchor);
  v21 = objc_msgSend(v18, sel_leadingAnchor);
  v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

  v23 = OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset;
  v24 = *(void **)&v17[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset];
  *(_QWORD *)&v17[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset] = v22;

  v25 = objc_msgSend(v19, sel_widthAnchor);
  v26 = objc_msgSend(v25, sel_constraintEqualToConstant_, 0.0);

  v27 = OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth;
  v28 = *(void **)&v17[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth];
  *(_QWORD *)&v17[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth] = v26;

  v29 = objc_msgSend(v19, sel_leadingAnchor);
  v30 = objc_msgSend(v18, sel_leadingAnchor);
  v31 = objc_msgSend(v29, sel_constraintGreaterThanOrEqualToAnchor_, v30);

  v32 = objc_msgSend(v19, sel_trailingAnchor);
  v33 = objc_msgSend(v18, sel_trailingAnchor);
  v34 = objc_msgSend(v32, sel_constraintLessThanOrEqualToAnchor_, v33);

  v55 = v19;
  v35 = objc_msgSend(v19, sel_heightAnchor);
  v36 = objc_msgSend(v18, sel_heightAnchor);
  v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  v38 = *(void **)&v17[v23];
  if (!v38)
  {
    __break(1u);
    goto LABEL_22;
  }
  v39 = *(void **)&v17[v27];
  if (!v39)
  {
LABEL_22:
    __break(1u);
    return;
  }
  sub_23128AC6C(0, &qword_255EC3F00);
  v40 = v17;
  v41 = v38;
  v42 = v39;
  v54 = v18;
  v43 = sub_2312BBF18();

  if (!(v43 >> 62))
  {
    v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v45 = v44 + 5;
    if (!__OFADD__(v44, 5))
      goto LABEL_7;
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v52 = sub_2312BC08C();
  v53 = __OFADD__(v52, 5);
  v45 = v52 + 5;
  if (v53)
    goto LABEL_19;
LABEL_7:
  sub_2312B9F70(v45, 1);
  sub_2312BBE28();
  v31 = v31;
  MEMORY[0x2348D91D8]();
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_20:
    sub_2312BBE40();
  sub_2312BBE4C();
  sub_2312BBE28();
  v46 = v34;
  MEMORY[0x2348D91D8]();
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2312BBE40();
  sub_2312BBE4C();
  sub_2312BBE28();
  v47 = v37;
  MEMORY[0x2348D91D8]();
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2312BBE40();
  sub_2312BBE4C();
  sub_2312BBE28();
  v48 = v41;
  MEMORY[0x2348D91D8]();
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2312BBE40();
  sub_2312BBE4C();
  sub_2312BBE28();
  v49 = v42;
  MEMORY[0x2348D91D8]();
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2312BBE40();
  v50 = (void *)objc_opt_self();
  sub_2312BBE4C();
  sub_2312BBE28();
  swift_bridgeObjectRelease();

  v51 = (void *)sub_2312BBE04();
  swift_bridgeObjectRelease();
  objc_msgSend(v50, sel_activateConstraints_, v51);

}

uint64_t type metadata accessor for HorizontalMeterView()
{
  return objc_opt_self();
}

id HorizontalMeterView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void HorizontalMeterView.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth] = 0;

  sub_2312BC068();
  __break(1u);
}

Swift::Void __swiftcall HorizontalMeterView.layoutSubviews()()
{
  char *v0;
  double Width;
  void *v2;
  double v3;
  float *v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for HorizontalMeterView();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  objc_msgSend(v0, sel_frame);
  Width = CGRectGetWidth(v7);
  v2 = *(void **)&v0[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth];
  if (v2)
  {
    v3 = Width;
    v4 = (float *)&v0[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model];
    objc_msgSend(v2, sel_setConstant_, Width * *(float *)&v0[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model + 4]);
    v5 = *(void **)&v0[OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset];
    if (v5)
    {
      objc_msgSend(v5, sel_setConstant_, v3 * *v4);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id HorizontalMeterView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void HorizontalMeterView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HorizontalMeterView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HorizontalMeterView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2312B9F70(uint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_2312BC08C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = MEMORY[0x2348D9424](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

void destroy for HorizontalMeterViewModel(uint64_t a1)
{

}

_QWORD *initializeWithCopy for HorizontalMeterViewModel(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a2[2];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = a2[3];
  v5 = v3;
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for HorizontalMeterViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 16);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for HorizontalMeterViewModel(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for HorizontalMeterViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;

  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for HorizontalMeterViewModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HorizontalMeterViewModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HorizontalMeterViewModel()
{
  return &type metadata for HorizontalMeterViewModel;
}

uint64_t sub_2312BA1F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
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
  char v34;
  uint64_t v35;
  __int128 v37;

  v2 = sub_2312BB600();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE41298])
  {
    if (qword_254159760 != -1)
      swift_once();
    v7 = (void *)qword_25415A948;
    v8 = objc_msgSend((id)qword_25415A948, sel_localizedNoiseThresholdValue_, objc_msgSend((id)qword_25415A948, sel_noiseThresholdCurrentValue));
    v9 = sub_2312BBD98();
    v11 = v10;

    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_2312BCBF0;
    *(_QWORD *)(v12 + 56) = MEMORY[0x24BEE0D00];
    v13 = sub_23128D600();
    *(_QWORD *)(v12 + 64) = v13;
    *(_QWORD *)(v12 + 32) = v9;
    *(_QWORD *)(v12 + 40) = v11;
    swift_bridgeObjectRetain();
    v14 = sub_2312BBD74();
    v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v7, sel_noiseThresholdMinutesThreshold);
    sub_2312BB354();
    v18 = swift_allocObject();
    v37 = xmmword_2312BCC00;
    *(_OWORD *)(v18 + 16) = xmmword_2312BCC00;
    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v18 + 64) = v13;
    v19 = MEMORY[0x24BEE1768];
    *(_QWORD *)(v18 + 32) = v9;
    *(_QWORD *)(v18 + 40) = v11;
    v20 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v18 + 96) = v19;
    *(_QWORD *)(v18 + 104) = v20;
    *(_QWORD *)(v18 + 72) = v17;
    v21 = sub_2312BBD74();
    v23 = v22;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23129C2A8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v37;
    *(_QWORD *)(v24 + 32) = v14;
    *(_QWORD *)(v24 + 40) = v16;
    *(_QWORD *)(v24 + 48) = v21;
    *(_QWORD *)(v24 + 56) = v23;
  }
  else if (v6 == *MEMORY[0x24BE412A0])
  {
    sub_23129C2A8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_2312BCC00;
    if (qword_2541597F0 != -1)
      swift_once();
    *(_QWORD *)(v24 + 32) = sub_2312BB354();
    *(_QWORD *)(v24 + 40) = v25;
    *(_QWORD *)(v24 + 48) = sub_2312BB354();
    *(_QWORD *)(v24 + 56) = v26;
  }
  else if (v6 == *MEMORY[0x24BE41288])
  {
    v27 = sub_2312BB69C();
    v29 = v28;
    if (qword_2541597F0 != -1)
      swift_once();
    sub_2312BB354();
    sub_23129C2A8();
    v24 = swift_allocObject();
    v37 = xmmword_2312BCBF0;
    *(_OWORD *)(v24 + 16) = xmmword_2312BCBF0;
    sub_23128D554(0, (unint64_t *)&qword_254159728, (uint64_t (*)(uint64_t))sub_23128D5AC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = v37;
    *(_QWORD *)(v30 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v30 + 64) = sub_23128D600();
    *(_QWORD *)(v30 + 32) = v27;
    *(_QWORD *)(v30 + 40) = v29;
    v31 = sub_2312BBD74();
    v33 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v24 + 32) = v31;
    *(_QWORD *)(v24 + 40) = v33;
  }
  else if (v6 == *MEMORY[0x24BE41280])
  {
    v34 = sub_2312BB678();
    sub_23129C2A8();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_2312BCBF0;
    if ((v34 & 1) != 0)
    {
      if (qword_2541597F0 != -1)
        swift_once();
    }
    else if (qword_2541597F0 != -1)
    {
      swift_once();
    }
    *(_QWORD *)(v24 + 32) = sub_2312BB354();
    *(_QWORD *)(v24 + 40) = v35;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return MEMORY[0x24BEE4AF8];
  }
  return v24;
}

uint64_t sub_2312BA8B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t inited;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v43 = a3;
  v5 = sub_2312BB6C0();
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v45 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_2312BB3F0();
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v39 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23128D554(0, &qword_254158F40, (uint64_t (*)(uint64_t))MEMORY[0x24BE418F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v36 - v9;
  v11 = type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2312BB6FC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  v36[1] = sub_2312BB1E8();
  v36[2] = v18;
  sub_2312BAD20(a2, (uint64_t)v17);
  v19 = sub_2312BB600();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  v44 = a2;
  v20(v13, a2, v19);
  sub_2312BB318();
  swift_allocObject();
  sub_2312BB30C();
  sub_23128A728(qword_255EC32D8, type metadata accessor for NoiseNotificationsFeatureStatusActionHandlerData, (uint64_t)&unk_2312BD1DC);
  v36[0] = sub_2312BB300();
  v22 = v21;
  sub_231295DBC((uint64_t)v13);
  swift_release();
  sub_2312BBA38();
  type metadata accessor for NoiseNotificationsFeatureStatusActionHandler(0);
  v37 = v14;
  v38 = v15;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v10, v17, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  v23 = v39;
  v24 = v40;
  v25 = v42;
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v39, *MEMORY[0x24BE47420], v42);
  v26 = (void *)sub_2312BB4F8();
  sub_23128A728(&qword_255EC32C0, type metadata accessor for NoiseNotificationsFeatureStatusActionHandler, (uint64_t)&unk_2312BD110);
  v27 = v36[0];
  sub_2312BB444();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v25);
  sub_2312A9E6C((uint64_t)v10, &qword_254158F40, (uint64_t (*)(uint64_t))MEMORY[0x24BE418F8]);
  sub_2312BB6F0();
  sub_2312BB468();
  sub_23129C2A8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2312BCBF0;
  *(_QWORD *)(inited + 32) = sub_2312BB6CC();
  *(_QWORD *)(inited + 40) = v29;
  sub_2312998AC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  sub_2312BB480();
  v31 = v45;
  v30 = v46;
  v32 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v45, *MEMORY[0x24BE41668], v47);
  sub_2312BB6B4();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  v33 = sub_2312BB48C();
  v34 = sub_2312AE8B0(v33);
  sub_231297D78(v34);
  swift_bridgeObjectRelease();
  sub_2312BB474();
  sub_2312BB45C();
  sub_23128D4FC(v27, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v37);
}

uint64_t sub_2312BAD20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;

  v49 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23128D554(0, &qword_254158F38, (uint64_t (*)(uint64_t))MEMORY[0x24BE413B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v48 = (char *)&v40 - v5;
  v6 = sub_2312BB5F4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2312BB600();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v40 - v15;
  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], v3);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v47 = (uint64_t)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v40 - v20;
  v22 = sub_2312BA1F0(a1);
  v23 = sub_2312BB690();
  v44 = v24;
  v45 = v23;
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v43(v16, a1, v10);
  v25 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v16, v10);
  v26 = *MEMORY[0x24BE41288];
  v46 = v21;
  if (v25 == v26)
  {
    v27 = sub_2312BB69C();
    v41 = v28;
    v42 = v27;
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE411F8], v6);
    sub_2312BB5DC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else if (v25 == *MEMORY[0x24BE41280])
  {
    v29 = sub_2312BB684();
    v41 = v30;
    v42 = v29;
    if (qword_254159760 != -1)
      swift_once();
    v31 = objc_msgSend((id)qword_25415A948, sel_noiseThresholdFooterLinkURL);
    sub_2312BB378();

    v32 = sub_2312BB390();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v21, 0, 1, v32);
  }
  else
  {
    v33 = sub_2312BB390();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v21, 1, 1, v33);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    v41 = 0;
    v42 = 0;
  }
  sub_2312BB6A8();
  v40 = v22;
  if (qword_2541597F0 != -1)
    swift_once();
  v34 = (void *)qword_25415A9E8;
  sub_2312BB354();
  v43(v14, a1, v10);
  v35 = v34;
  v36 = v48;
  sub_2312BB624();
  v37 = sub_2312BB630();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v36, 0, 1, v37);
  sub_2312BB66C();
  v38 = (uint64_t)v46;
  sub_2312BB284((uint64_t)v46, v47);
  sub_2312BB6E4();
  return sub_2312A9E6C(v38, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
}

unint64_t sub_2312BB1E8()
{
  void *v0;

  sub_2312BC020();
  swift_bridgeObjectRelease();
  v0 = (void *)sub_2312BB4F8();
  sub_2312BB408();

  sub_2312BBDD4();
  swift_bridgeObjectRelease();
  return 0xD00000000000003DLL;
}

uint64_t sub_2312BB284(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23128D554(0, &qword_254158F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2312BB300()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2312BB30C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2312BB318()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2312BB324()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2312BB330()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_2312BB33C()
{
  return MEMORY[0x24BDCBAE0]();
}

uint64_t sub_2312BB348()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2312BB354()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2312BB360()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2312BB36C()
{
  return MEMORY[0x24BE40F08]();
}

uint64_t sub_2312BB378()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2312BB384()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2312BB390()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2312BB39C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2312BB3A8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2312BB3B4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2312BB3C0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2312BB3CC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2312BB3D8()
{
  return MEMORY[0x24BEE5B90]();
}

uint64_t sub_2312BB3E4()
{
  return MEMORY[0x24BE47298]();
}

uint64_t sub_2312BB3F0()
{
  return MEMORY[0x24BE474E8]();
}

uint64_t sub_2312BB3FC()
{
  return MEMORY[0x24BE47580]();
}

uint64_t sub_2312BB408()
{
  return MEMORY[0x24BE47588]();
}

uint64_t sub_2312BB414()
{
  return MEMORY[0x24BE47590]();
}

uint64_t sub_2312BB420()
{
  return MEMORY[0x24BE47598]();
}

uint64_t sub_2312BB42C()
{
  return MEMORY[0x24BE475A0]();
}

uint64_t sub_2312BB438()
{
  return MEMORY[0x24BE41F00]();
}

uint64_t sub_2312BB444()
{
  return MEMORY[0x24BE41F10]();
}

uint64_t sub_2312BB450()
{
  return MEMORY[0x24BE47658]();
}

uint64_t sub_2312BB45C()
{
  return MEMORY[0x24BE47688]();
}

uint64_t sub_2312BB468()
{
  return MEMORY[0x24BE47698]();
}

uint64_t sub_2312BB474()
{
  return MEMORY[0x24BE476C0]();
}

uint64_t sub_2312BB480()
{
  return MEMORY[0x24BE477A8]();
}

uint64_t sub_2312BB48C()
{
  return MEMORY[0x24BE477C0]();
}

uint64_t sub_2312BB498()
{
  return MEMORY[0x24BE477D0]();
}

uint64_t sub_2312BB4A4()
{
  return MEMORY[0x24BE47890]();
}

uint64_t sub_2312BB4B0()
{
  return MEMORY[0x24BE478A8]();
}

uint64_t sub_2312BB4BC()
{
  return MEMORY[0x24BE478B8]();
}

uint64_t sub_2312BB4C8()
{
  return MEMORY[0x24BE47928]();
}

uint64_t sub_2312BB4D4()
{
  return MEMORY[0x24BE47948]();
}

uint64_t sub_2312BB4E0()
{
  return MEMORY[0x24BE47958]();
}

uint64_t sub_2312BB4EC()
{
  return MEMORY[0x24BE47970]();
}

uint64_t sub_2312BB4F8()
{
  return MEMORY[0x24BE47988]();
}

uint64_t sub_2312BB504()
{
  return MEMORY[0x24BE479B8]();
}

uint64_t sub_2312BB510()
{
  return MEMORY[0x24BE47A50]();
}

uint64_t sub_2312BB51C()
{
  return MEMORY[0x24BE47A68]();
}

uint64_t sub_2312BB528()
{
  return MEMORY[0x24BE47A70]();
}

uint64_t sub_2312BB534()
{
  return MEMORY[0x24BE47B28]();
}

uint64_t sub_2312BB540()
{
  return MEMORY[0x24BE47C90]();
}

uint64_t sub_2312BB54C()
{
  return MEMORY[0x24BE47DA8]();
}

uint64_t sub_2312BB558()
{
  return MEMORY[0x24BE47DB0]();
}

uint64_t sub_2312BB564()
{
  return MEMORY[0x24BE3F8C0]();
}

uint64_t sub_2312BB570()
{
  return MEMORY[0x24BE3F938]();
}

uint64_t sub_2312BB57C()
{
  return MEMORY[0x24BE3F948]();
}

uint64_t sub_2312BB588()
{
  return MEMORY[0x24BE3F950]();
}

uint64_t sub_2312BB594()
{
  return MEMORY[0x24BE3F988]();
}

uint64_t sub_2312BB5A0()
{
  return MEMORY[0x24BE3F9A8]();
}

uint64_t sub_2312BB5AC()
{
  return MEMORY[0x24BE3F9B0]();
}

uint64_t sub_2312BB5B8()
{
  return MEMORY[0x24BE3F9B8]();
}

uint64_t sub_2312BB5C4()
{
  return MEMORY[0x24BE3F9C0]();
}

uint64_t sub_2312BB5D0()
{
  return MEMORY[0x24BE3F9E0]();
}

uint64_t sub_2312BB5DC()
{
  return MEMORY[0x24BE41210]();
}

uint64_t sub_2312BB5E8()
{
  return MEMORY[0x24BE41218]();
}

uint64_t sub_2312BB5F4()
{
  return MEMORY[0x24BE41220]();
}

uint64_t sub_2312BB600()
{
  return MEMORY[0x24BE412A8]();
}

uint64_t sub_2312BB60C()
{
  return MEMORY[0x24BE41300]();
}

uint64_t sub_2312BB618()
{
  return MEMORY[0x24BE41388]();
}

uint64_t sub_2312BB624()
{
  return MEMORY[0x24BE413A8]();
}

uint64_t sub_2312BB630()
{
  return MEMORY[0x24BE413B0]();
}

uint64_t sub_2312BB63C()
{
  return MEMORY[0x24BE41518]();
}

uint64_t sub_2312BB648()
{
  return MEMORY[0x24BE41520]();
}

uint64_t sub_2312BB654()
{
  return MEMORY[0x24BE41F40]();
}

uint64_t sub_2312BB660()
{
  return MEMORY[0x24BE41578]();
}

uint64_t sub_2312BB66C()
{
  return MEMORY[0x24BE41588]();
}

uint64_t sub_2312BB678()
{
  return MEMORY[0x24BE41590]();
}

uint64_t sub_2312BB684()
{
  return MEMORY[0x24BE41598]();
}

uint64_t sub_2312BB690()
{
  return MEMORY[0x24BE415A8]();
}

uint64_t sub_2312BB69C()
{
  return MEMORY[0x24BE415C8]();
}

uint64_t sub_2312BB6A8()
{
  return MEMORY[0x24BE415D8]();
}

uint64_t sub_2312BB6B4()
{
  return MEMORY[0x24BE41660]();
}

uint64_t sub_2312BB6C0()
{
  return MEMORY[0x24BE41678]();
}

uint64_t sub_2312BB6CC()
{
  return MEMORY[0x24BE41680]();
}

uint64_t sub_2312BB6D8()
{
  return MEMORY[0x24BE417D0]();
}

uint64_t sub_2312BB6E4()
{
  return MEMORY[0x24BE418E0]();
}

uint64_t sub_2312BB6F0()
{
  return MEMORY[0x24BE418F0]();
}

uint64_t sub_2312BB6FC()
{
  return MEMORY[0x24BE418F8]();
}

uint64_t sub_2312BB708()
{
  return MEMORY[0x24BE41918]();
}

uint64_t sub_2312BB714()
{
  return MEMORY[0x24BE41A40]();
}

uint64_t sub_2312BB720()
{
  return MEMORY[0x24BE41A70]();
}

uint64_t sub_2312BB72C()
{
  return MEMORY[0x24BE41C28]();
}

uint64_t sub_2312BB738()
{
  return MEMORY[0x24BE41C40]();
}

uint64_t sub_2312BB744()
{
  return MEMORY[0x24BE41CB0]();
}

uint64_t sub_2312BB750()
{
  return MEMORY[0x24BE41CC8]();
}

uint64_t sub_2312BB75C()
{
  return MEMORY[0x24BE41CF8]();
}

uint64_t sub_2312BB768()
{
  return MEMORY[0x24BE420C0]();
}

uint64_t sub_2312BB774()
{
  return MEMORY[0x24BE42170]();
}

uint64_t sub_2312BB780()
{
  return MEMORY[0x24BE42290]();
}

uint64_t sub_2312BB78C()
{
  return MEMORY[0x24BE42298]();
}

uint64_t sub_2312BB798()
{
  return MEMORY[0x24BE422A0]();
}

uint64_t sub_2312BB7A4()
{
  return MEMORY[0x24BE422B8]();
}

uint64_t sub_2312BB7B0()
{
  return MEMORY[0x24BE422C0]();
}

uint64_t sub_2312BB7BC()
{
  return MEMORY[0x24BE422C8]();
}

uint64_t sub_2312BB7C8()
{
  return MEMORY[0x24BE422D0]();
}

uint64_t sub_2312BB7D4()
{
  return MEMORY[0x24BE422D8]();
}

uint64_t sub_2312BB7E0()
{
  return MEMORY[0x24BE422E0]();
}

uint64_t sub_2312BB7EC()
{
  return MEMORY[0x24BE422E8]();
}

uint64_t sub_2312BB7F8()
{
  return MEMORY[0x24BE42678]();
}

uint64_t sub_2312BB804()
{
  return MEMORY[0x24BE42748]();
}

uint64_t sub_2312BB810()
{
  return MEMORY[0x24BE42750]();
}

uint64_t sub_2312BB81C()
{
  return MEMORY[0x24BE42758]();
}

uint64_t sub_2312BB828()
{
  return MEMORY[0x24BE42DF0]();
}

uint64_t sub_2312BB834()
{
  return MEMORY[0x24BE42E08]();
}

uint64_t sub_2312BB840()
{
  return MEMORY[0x24BE42E18]();
}

uint64_t sub_2312BB84C()
{
  return MEMORY[0x24BE42E60]();
}

uint64_t sub_2312BB858()
{
  return MEMORY[0x24BE42E80]();
}

uint64_t sub_2312BB864()
{
  return MEMORY[0x24BE42E90]();
}

uint64_t sub_2312BB870()
{
  return MEMORY[0x24BE42FF0]();
}

uint64_t sub_2312BB87C()
{
  return MEMORY[0x24BE43000]();
}

uint64_t sub_2312BB888()
{
  return MEMORY[0x24BE43280]();
}

uint64_t sub_2312BB894()
{
  return MEMORY[0x24BE439B8]();
}

uint64_t sub_2312BB8A0()
{
  return MEMORY[0x24BE439E0]();
}

uint64_t sub_2312BB8AC()
{
  return MEMORY[0x24BE43CD8]();
}

uint64_t sub_2312BB8B8()
{
  return MEMORY[0x24BE43DF8]();
}

uint64_t sub_2312BB8C4()
{
  return MEMORY[0x24BE43E00]();
}

uint64_t sub_2312BB8D0()
{
  return MEMORY[0x24BE43E08]();
}

uint64_t sub_2312BB8DC()
{
  return MEMORY[0x24BE43E18]();
}

uint64_t sub_2312BB8E8()
{
  return MEMORY[0x24BE43E50]();
}

uint64_t sub_2312BB8F4()
{
  return MEMORY[0x24BE43E58]();
}

uint64_t sub_2312BB900()
{
  return MEMORY[0x24BE43E60]();
}

uint64_t sub_2312BB90C()
{
  return MEMORY[0x24BE43EF8]();
}

uint64_t sub_2312BB918()
{
  return MEMORY[0x24BE43F30]();
}

uint64_t _s18HealthExperienceUI27DataTypeDetailConfigurationV16HearingAppPluginE20InlineChartComponentV10identifierSSvg_0()
{
  return MEMORY[0x24BE43F40]();
}

uint64_t sub_2312BB930()
{
  return MEMORY[0x24BE43F68]();
}

uint64_t sub_2312BB93C()
{
  return MEMORY[0x24BE44018]();
}

uint64_t sub_2312BB948()
{
  return MEMORY[0x24BE440A0]();
}

uint64_t sub_2312BB954()
{
  return MEMORY[0x24BE440C0]();
}

uint64_t sub_2312BB960()
{
  return MEMORY[0x24BE440D8]();
}

uint64_t sub_2312BB96C()
{
  return MEMORY[0x24BE44270]();
}

uint64_t sub_2312BB978()
{
  return MEMORY[0x24BE442A0]();
}

uint64_t sub_2312BB984()
{
  return MEMORY[0x24BE443D8]();
}

uint64_t sub_2312BB990()
{
  return MEMORY[0x24BE443E0]();
}

uint64_t sub_2312BB99C()
{
  return MEMORY[0x24BE44408]();
}

uint64_t sub_2312BB9A8()
{
  return MEMORY[0x24BE44410]();
}

uint64_t sub_2312BB9B4()
{
  return MEMORY[0x24BE44440]();
}

uint64_t sub_2312BB9C0()
{
  return MEMORY[0x24BE44448]();
}

uint64_t sub_2312BB9CC()
{
  return MEMORY[0x24BE44450]();
}

uint64_t sub_2312BB9D8()
{
  return MEMORY[0x24BE44458]();
}

uint64_t sub_2312BB9E4()
{
  return MEMORY[0x24BE44720]();
}

uint64_t sub_2312BB9F0()
{
  return MEMORY[0x24BE44740]();
}

uint64_t sub_2312BB9FC()
{
  return MEMORY[0x24BE44750]();
}

uint64_t sub_2312BBA08()
{
  return MEMORY[0x24BE44758]();
}

uint64_t sub_2312BBA14()
{
  return MEMORY[0x24BE44768]();
}

uint64_t sub_2312BBA20()
{
  return MEMORY[0x24BE44888]();
}

uint64_t sub_2312BBA2C()
{
  return MEMORY[0x24BE44890]();
}

uint64_t sub_2312BBA38()
{
  return MEMORY[0x24BE448E0]();
}

uint64_t sub_2312BBA44()
{
  return MEMORY[0x24BE44910]();
}

uint64_t sub_2312BBA50()
{
  return MEMORY[0x24BE44918]();
}

uint64_t sub_2312BBA5C()
{
  return MEMORY[0x24BE44920]();
}

uint64_t sub_2312BBA68()
{
  return MEMORY[0x24BE44A98]();
}

uint64_t sub_2312BBA74()
{
  return MEMORY[0x24BE44AA0]();
}

uint64_t sub_2312BBA80()
{
  return MEMORY[0x24BE44AA8]();
}

uint64_t sub_2312BBA8C()
{
  return MEMORY[0x24BE44B20]();
}

uint64_t sub_2312BBA98()
{
  return MEMORY[0x24BE44BE0]();
}

uint64_t sub_2312BBAA4()
{
  return MEMORY[0x24BE44BE8]();
}

uint64_t sub_2312BBAB0()
{
  return MEMORY[0x24BE44C40]();
}

uint64_t sub_2312BBABC()
{
  return MEMORY[0x24BE44E88]();
}

uint64_t sub_2312BBAC8()
{
  return MEMORY[0x24BE44E98]();
}

uint64_t sub_2312BBAD4()
{
  return MEMORY[0x24BE3F838]();
}

uint64_t sub_2312BBAE0()
{
  return MEMORY[0x24BE44F78]();
}

uint64_t sub_2312BBAEC()
{
  return MEMORY[0x24BE44F90]();
}

uint64_t sub_2312BBAF8()
{
  return MEMORY[0x24BE44FA8]();
}

uint64_t sub_2312BBB04()
{
  return MEMORY[0x24BE44FB0]();
}

uint64_t sub_2312BBB10()
{
  return MEMORY[0x24BE45088]();
}

uint64_t sub_2312BBB1C()
{
  return MEMORY[0x24BE45090]();
}

uint64_t sub_2312BBB28()
{
  return MEMORY[0x24BE450A0]();
}

uint64_t sub_2312BBB34()
{
  return MEMORY[0x24BE45398]();
}

uint64_t sub_2312BBB40()
{
  return MEMORY[0x24BE453A8]();
}

uint64_t sub_2312BBB4C()
{
  return MEMORY[0x24BE453C0]();
}

uint64_t sub_2312BBB58()
{
  return MEMORY[0x24BE453D8]();
}

uint64_t sub_2312BBB64()
{
  return MEMORY[0x24BE3F840]();
}

uint64_t sub_2312BBB70()
{
  return MEMORY[0x24BE3F858]();
}

uint64_t sub_2312BBB7C()
{
  return MEMORY[0x24BE484A8]();
}

uint64_t sub_2312BBB88()
{
  return MEMORY[0x24BE484B0]();
}

uint64_t sub_2312BBB94()
{
  return MEMORY[0x24BE484D0]();
}

uint64_t sub_2312BBBA0()
{
  return MEMORY[0x24BE484D8]();
}

uint64_t sub_2312BBBAC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2312BBBB8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2312BBBC4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2312BBBD0()
{
  return MEMORY[0x24BEBCB20]();
}

uint64_t sub_2312BBBDC()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_2312BBBE8()
{
  return MEMORY[0x24BDB96E8]();
}

uint64_t sub_2312BBBF4()
{
  return MEMORY[0x24BDB9780]();
}

uint64_t sub_2312BBC00()
{
  return MEMORY[0x24BDB9790]();
}

uint64_t sub_2312BBC0C()
{
  return MEMORY[0x24BDB97E8]();
}

uint64_t sub_2312BBC18()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_2312BBC24()
{
  return MEMORY[0x24BDB99F8]();
}

uint64_t sub_2312BBC30()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_2312BBC3C()
{
  return MEMORY[0x24BDB9DE0]();
}

uint64_t sub_2312BBC48()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_2312BBC54()
{
  return MEMORY[0x24BDB9E08]();
}

uint64_t sub_2312BBC60()
{
  return MEMORY[0x24BDB9E78]();
}

uint64_t sub_2312BBC6C()
{
  return MEMORY[0x24BDB9E80]();
}

uint64_t sub_2312BBC78()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2312BBC84()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2312BBC90()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2312BBC9C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2312BBCA8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2312BBCB4()
{
  return MEMORY[0x24BE48548]();
}

uint64_t sub_2312BBCC0()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2312BBCCC()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_2312BBCD8()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_2312BBCE4()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2312BBCF0()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_2312BBCFC()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2312BBD08()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2312BBD14()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2312BBD20()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2312BBD2C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_2312BBD38()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_2312BBD44()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2312BBD50()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2312BBD5C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2312BBD68()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2312BBD74()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_2312BBD80()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2312BBD8C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2312BBD98()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2312BBDA4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2312BBDB0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2312BBDBC()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_2312BBDC8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2312BBDD4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2312BBDE0()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2312BBDEC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2312BBDF8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2312BBE04()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2312BBE10()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2312BBE1C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2312BBE28()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2312BBE34()
{
  return MEMORY[0x24BE48588]();
}

uint64_t sub_2312BBE40()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2312BBE4C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2312BBE58()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2312BBE64()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2312BBE70()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2312BBE7C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_2312BBE88()
{
  return MEMORY[0x24BE48788]();
}

uint64_t sub_2312BBE94()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2312BBEA0()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2312BBEAC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2312BBEB8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2312BBEC4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2312BBED0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2312BBEDC()
{
  return MEMORY[0x24BDD2520]();
}

uint64_t sub_2312BBEE8()
{
  return MEMORY[0x24BDD2530]();
}

uint64_t sub_2312BBEF4()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_2312BBF00()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2312BBF0C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2312BBF18()
{
  return MEMORY[0x24BE3F9E8]();
}

uint64_t sub_2312BBF24()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_2312BBF30()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_2312BBF3C()
{
  return MEMORY[0x24BEBCD48]();
}

uint64_t sub_2312BBF48()
{
  return MEMORY[0x24BE3F9F0]();
}

uint64_t sub_2312BBF54()
{
  return MEMORY[0x24BE3F9F8]();
}

uint64_t sub_2312BBF60()
{
  return MEMORY[0x24BEBCFC0]();
}

uint64_t sub_2312BBF6C()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2312BBF78()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2312BBF84()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_2312BBF90()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2312BBF9C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2312BBFA8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2312BBFB4()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_2312BBFC0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2312BBFCC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2312BBFD8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2312BBFE4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2312BBFF0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2312BBFFC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2312BC008()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_2312BC014()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2312BC020()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2312BC02C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2312BC038()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2312BC044()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2312BC050()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2312BC05C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2312BC068()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2312BC074()
{
  return MEMORY[0x24BEE2F50]();
}

uint64_t sub_2312BC080()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_2312BC08C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2312BC098()
{
  return MEMORY[0x24BEE3078]();
}

uint64_t sub_2312BC0A4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2312BC0B0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2312BC0BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2312BC0C8()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_2312BC0D4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2312BC0E0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2312BC0EC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2312BC0F8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2312BC104()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2312BC110()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2312BC11C()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2312BC128()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2312BC134()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_2312BC140()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2312BC14C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2312BC158()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2312BC164()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2312BC170()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2312BC17C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2312BC188()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2312BC194()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2312BC1A0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2312BC1AC()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2312BC1B8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2312BC1C4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2312BC1D0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2312BC1DC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2312BC1E8()
{
  return MEMORY[0x24BEE4A98]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t HKNRDeviceCapabilityEnvironmentalDosimetry()
{
  return MEMORY[0x24BE45690]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

