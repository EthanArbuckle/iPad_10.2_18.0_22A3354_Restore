uint64_t sub_211A23818(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t *, void *))
{
  uint64_t v5;
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
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v25;

  if (a1)
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v5 = sub_211A47748();
    sub_21194F3E0(v5, (uint64_t)qword_254ADC7E8);
    swift_retain();
    v6 = a1;
    swift_retain();
    v7 = a1;
    v8 = sub_211A47724();
    v9 = sub_211A47D24();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      *(_DWORD *)v10 = 136315394;
      v25 = v11;
      sub_211958C38(&qword_254ACEAD8);
      v12 = sub_211A47928();
      sub_211950A9C(v12, v13, &v25);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      sub_211958C38(&qword_254ACDE90);
      v14 = sub_211A47E08();
      sub_211950A9C(v14, v15, &v25);
      sub_211A47E2C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21190D000, v8, v9, "%s: error when removing location alert: %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v11, -1, -1);
      MEMORY[0x212BE48A0](v10, -1, -1);
    }
    else
    {
      swift_release_n();

    }
    LOBYTE(v25) = 0;
    v23 = a1;
  }
  else
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v16 = sub_211A47748();
    sub_21194F3E0(v16, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v17 = sub_211A47724();
    v18 = sub_211A47D30();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      *(_DWORD *)v19 = 136315138;
      v25 = v20;
      sub_211958C38(&qword_254ACEAD8);
      v21 = sub_211A47928();
      sub_211950A9C(v21, v22, &v25);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v17, v18, "%s: Location alert removed.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v20, -1, -1);
      MEMORY[0x212BE48A0](v19, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v25) = 2;
    v23 = 0;
  }
  return a3(&v25, v23);
}

uint64_t sub_211A23C14(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t *, void *), uint64_t a5, const char *a6, uint64_t (*a7)(void), const char *a8)
{
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v33;

  if (a2)
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v12 = sub_211A47748();
    sub_21194F3E0(v12, (uint64_t)qword_254ADC7E8);
    swift_retain();
    v13 = a2;
    swift_retain();
    v14 = a2;
    v15 = sub_211A47724();
    v16 = a7();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      *(_DWORD *)v17 = 136315394;
      v33 = v18;
      sub_211958C38(&qword_254ACEAD8);
      v19 = sub_211A47928();
      sub_211950A9C(v19, v20, &v33);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      sub_211958C38(&qword_254ACDE90);
      v21 = sub_211A47E08();
      sub_211950A9C(v21, v22, &v33);
      sub_211A47E2C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21190D000, v15, v16, a8, (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v18, -1, -1);
      MEMORY[0x212BE48A0](v17, -1, -1);
    }
    else
    {
      swift_release_n();

    }
    LOBYTE(v33) = 0;
    v31 = a2;
  }
  else
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v24 = sub_211A47748();
    sub_21194F3E0(v24, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v25 = sub_211A47724();
    v26 = sub_211A47D30();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      *(_DWORD *)v27 = 136315138;
      v33 = v28;
      sub_211958C38(&qword_254ACEAD8);
      v29 = sub_211A47928();
      sub_211950A9C(v29, v30, &v33);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v25, v26, a6, v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v28, -1, -1);
      MEMORY[0x212BE48A0](v27, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v33) = 2;
    v31 = 0;
  }
  return a4(&v33, v31);
}

void sub_211A24010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t aBlock[6];
  uint64_t v29;

  v4 = v3;
  v8 = sub_211958C38(qword_254AC8A78);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 32))
  {
    swift_bridgeObjectRetain();
    v12 = (void *)sub_211A478EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend((id)objc_opt_self(), sel_handleWithId_, v12);

  if (v13)
  {
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2FED0]), sel_init);
    sub_21192C6B8(a1 + OBJC_IVAR____TtC7FMFCore19FMFMuteFencesAction_muteEndDate, (uint64_t)v11, qword_254AC8A78);
    v15 = sub_211A47208();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) != 1)
    {
      v17 = (void *)sub_211A471A8();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
    }
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v4;
    v18[3] = a2;
    v18[4] = a3;
    aBlock[4] = (uint64_t)sub_211A2BFF4;
    aBlock[5] = (uint64_t)v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_211A1BAB4;
    aBlock[3] = (uint64_t)&unk_24CCCED10;
    v19 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_muteFencesForHandle_untilDate_completion_, v13, v17, v19);
    _Block_release(v19);

  }
  else
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v20 = sub_211A47748();
    sub_21194F3E0(v20, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v21 = sub_211A47724();
    v22 = sub_211A47D30();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v29 = *v4;
      sub_211958C38(&qword_254ACEAD8);
      v25 = sub_211A47928();
      v29 = sub_211950A9C(v25, v26, aBlock);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v21, v22, "%s: Error when muting fences- no friend handle", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v24, -1, -1);
      MEMORY[0x212BE48A0](v23, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
}

uint64_t sub_211A243A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t))
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;

  if (a1)
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v5 = sub_211A47748();
    sub_21194F3E0(v5, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v6 = sub_211A47724();
    v7 = sub_211A47D30();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      *(_DWORD *)v8 = 136315138;
      v21 = v9;
      sub_211958C38(&qword_254ACEAD8);
      v10 = sub_211A47928();
      sub_211950A9C(v10, v11, &v21);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v6, v7, "%s: Error when muting fences", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v9, -1, -1);
      MEMORY[0x212BE48A0](v8, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v21) = 0;
    v19 = a1;
  }
  else
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v12 = sub_211A47748();
    sub_21194F3E0(v12, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v13 = sub_211A47724();
    v14 = sub_211A47D30();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      *(_DWORD *)v15 = 136315138;
      v21 = v16;
      sub_211958C38(&qword_254ACEAD8);
      v17 = sub_211A47928();
      sub_211950A9C(v17, v18, &v21);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v13, v14, "%s: Fences muted", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v16, -1, -1);
      MEMORY[0x212BE48A0](v15, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v21) = 2;
    v19 = 0;
  }
  return a3(&v21, v19);
}

uint64_t sub_211A2470C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void (*v31)(_QWORD *, void (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = v3;
  v8 = sub_211A4713C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254AC7B80 != -1)
    swift_once();
  v13 = sub_211A47748();
  sub_21194F3E0(v13, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v14 = sub_211A47724();
  v15 = sub_211A47D30();
  if (os_log_type_enabled(v14, v15))
  {
    v34 = a1;
    v16 = swift_slowAlloc();
    v35 = v9;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v37 = a3;
    v19 = v18;
    *(_DWORD *)v17 = 136315138;
    v36 = a2;
    v38 = *v4;
    v39 = v18;
    sub_211958C38(&qword_254ACEAD8);
    v20 = sub_211A47928();
    v38 = sub_211950A9C(v20, v21, &v39);
    a2 = v36;
    sub_211A47E2C();
    swift_release_n();
    a1 = v34;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v14, v15, "%s: removing labels action initiated", v17, 0xCu);
    swift_arrayDestroy();
    v22 = v19;
    a3 = v37;
    MEMORY[0x212BE48A0](v22, -1, -1);
    v23 = v17;
    v9 = v35;
    MEMORY[0x212BE48A0](v23, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v24 = a1 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v25(v12, v24, v8);
  type metadata accessor for FMFGetURLInfoRequest();
  v26 = swift_allocObject();
  v25((char *)(v26 + qword_254ADC720), (uint64_t)v12, v8);
  v27 = sub_21193BD18();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v28 = v4[11];
  v29 = v4[12];
  sub_211931DB4(v4 + 8, v28);
  v30 = (_QWORD *)swift_allocObject();
  v30[2] = v4;
  v30[3] = a2;
  v30[4] = a3;
  v31 = *(void (**)(_QWORD *, void (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v29 + 64);
  refreshed = type metadata accessor for FMFInitRefreshClientResponse();
  swift_retain();
  swift_retain();
  v31(v27, sub_211A2BFDC, v30, refreshed, v28, v29);
  swift_release();
  return swift_release();
}

void sub_211A24A38(uint64_t a1, void *a2, uint64_t *a3, void (*a4)(uint64_t *, void *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t *, void *);
  uint64_t v53;
  uint64_t v54;

  v52 = a4;
  v7 = sub_211958C38(&qword_254AC8360);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (uint64_t *)((char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (uint64_t *)((char *)&v51 - v13);
  if (a2)
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v15 = sub_211A47748();
    sub_21194F3E0(v15, (uint64_t)qword_254ADC7E8);
    swift_retain();
    v16 = a2;
    swift_retain();
    v17 = a2;
    v18 = sub_211A47724();
    v19 = sub_211A47D30();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315394;
      v53 = *a3;
      v54 = v21;
      sub_211958C38(&qword_254ACEAD8);
      v22 = sub_211A47928();
      v53 = sub_211950A9C(v22, v23, &v54);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      v53 = (uint64_t)a2;
      sub_211958C38(&qword_254ACDE90);
      v24 = sub_211A47E08();
      v53 = sub_211950A9C(v24, v25, &v54);
      sub_211A47E2C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21190D000, v18, v19, "%s: error when getting info for URL: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v21, -1, -1);
      MEMORY[0x212BE48A0](v20, -1, -1);
    }
    else
    {
      swift_release_n();

    }
    LOBYTE(v54) = 0;
    v52(&v54, a2);
    return;
  }
  if (a1)
  {
    sub_21192C6B8(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)&v51 - v13, &qword_254AC8360);
    v26 = type metadata accessor for FMFCommandResponseFragment();
    v27 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 48);
    if (v27(v14, 1, v26) == 1)
    {
      sub_211923EE8((uint64_t)v14, &qword_254AC8360);
    }
    else
    {
      v28 = *v14;
      sub_211934758((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for FMFCommandResponseFragment);
      if (v28 == 500)
      {
        if (qword_254AC7B80 != -1)
          swift_once();
        v29 = sub_211A47748();
        sub_21194F3E0(v29, (uint64_t)qword_254ADC7E8);
        v30 = sub_211A47724();
        v31 = sub_211A47D30();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_21190D000, v30, v31, "%%@: The command response was invalid", v32, 2u);
          MEMORY[0x212BE48A0](v32, -1, -1);
        }

        LOBYTE(v54) = 0;
        sub_211A2BF8C();
        v34 = (void *)swift_allocError();
        v35 = 1;
        goto LABEL_32;
      }
    }
    sub_21192C6B8(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v10, &qword_254AC8360);
    if (v27(v10, 1, v26) == 1)
    {
      sub_211923EE8((uint64_t)v10, &qword_254AC8360);
      goto LABEL_24;
    }
    v36 = *v10;
    sub_211934758((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for FMFCommandResponseFragment);
    if (v36 != 516)
      goto LABEL_24;
    if (qword_254AC7B80 != -1)
      swift_once();
    v37 = sub_211A47748();
    sub_21194F3E0(v37, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v38 = sub_211A47724();
    v39 = sub_211A47D30();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      *(_DWORD *)v40 = 136315138;
      v53 = *a3;
      v54 = v41;
      sub_211958C38(&qword_254ACEAD8);
      v42 = sub_211A47928();
      v53 = sub_211950A9C(v42, v43, &v54);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v38, v39, "%s: The request was to add friend to self", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v41, -1, -1);
      MEMORY[0x212BE48A0](v40, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v54) = 0;
    sub_211A2BF8C();
    v34 = (void *)swift_allocError();
    v35 = 4;
LABEL_32:
    *(_QWORD *)v33 = v35;
    *(_WORD *)(v33 + 8) = 256;
    v52(&v54, v34);

    return;
  }
LABEL_24:
  if (qword_254AC7B80 != -1)
    swift_once();
  v44 = sub_211A47748();
  sub_21194F3E0(v44, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v45 = sub_211A47724();
  v46 = sub_211A47D18();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    *(_DWORD *)v47 = 136315138;
    v53 = *a3;
    v54 = v48;
    sub_211958C38(&qword_254ACEAD8);
    v49 = sub_211A47928();
    v53 = sub_211950A9C(v49, v50, &v54);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v45, v46, "%s: Got info for url.", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v48, -1, -1);
    MEMORY[0x212BE48A0](v47, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  LOBYTE(v54) = 2;
  v52(&v54, 0);
  sub_211A25210(a1, a3);
}

void sub_211A25210(uint64_t a1, uint64_t *a2)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  char *v25;
  int *v26;
  unsigned int (*v27)(char *, uint64_t, int *);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ObjectType;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70[3];
  uint64_t v71;

  v4 = sub_211958C38(&qword_254ACEAE8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_211958C38(&qword_254AC8360);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v62 - v14;
  v16 = sub_211958C38(&qword_254AC8C98);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_211A4713C();
  v21 = *(_QWORD *)(v20 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20, v22);
  v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    goto LABEL_4;
  v69 = v7;
  sub_21192C6B8(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v15, &qword_254AC8360);
  v26 = (int *)type metadata accessor for FMFCommandResponseFragment();
  v27 = *(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v26 - 1) + 48);
  if (v27(v15, 1, v26) == 1)
  {
    sub_211923EE8((uint64_t)v15, &qword_254AC8360);
LABEL_4:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v21 + 56))(v19, 1, 1, v20, v23);
LABEL_5:
    sub_211923EE8((uint64_t)v19, &qword_254AC8C98);
    if (qword_254AC7B80 != -1)
      swift_once();
    v28 = sub_211A47748();
    sub_21194F3E0(v28, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v29 = sub_211A47724();
    v30 = sub_211A47D30();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v70[0] = v32;
      *(_DWORD *)v31 = 136315138;
      v71 = *a2;
      sub_211958C38(&qword_254ACEAD8);
      v33 = sub_211A47928();
      v71 = sub_211950A9C(v33, v34, v70);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v29, v30, "%s: Got info but there is no url.", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v32, -1, -1);
      MEMORY[0x212BE48A0](v31, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return;
  }
  sub_21192C6B8((uint64_t)&v15[v26[6]], (uint64_t)v19, &qword_254AC8C98);
  sub_211934758((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for FMFCommandResponseFragment);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
    goto LABEL_5;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v25, v19, v20);
  v35 = MEMORY[0x212BE496C](a2 + 4);
  if (v35)
  {
    v36 = v35;
    sub_21192C6B8(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v11, &qword_254AC8360);
    if (v27(v11, 1, v26) == 1)
    {
      sub_211923EE8((uint64_t)v11, &qword_254AC8360);
      v37 = type metadata accessor for FMFActionURLInfo();
      v38 = (uint64_t)v69;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v69, 1, 1, v37);
    }
    else
    {
      v38 = (uint64_t)v69;
      sub_21192C6B8((uint64_t)&v11[v26[6]], (uint64_t)v69, &qword_254AC8C98);
      v39 = &v11[v26[7]];
      v40 = *(_QWORD *)v39;
      v41 = *((_QWORD *)v39 + 1);
      v42 = &v11[v26[8]];
      v44 = *(_QWORD *)v42;
      v43 = *((_QWORD *)v42 + 1);
      v68 = v44;
      v66 = v40;
      v67 = v43;
      v45 = v26[10];
      v46 = &v11[v26[9]];
      v47 = *(_QWORD *)v46;
      v64 = *((_QWORD *)v46 + 1);
      v65 = v47;
      v48 = (uint64_t)&v11[v45];
      v49 = (int *)type metadata accessor for FMFActionURLInfo();
      sub_21192C6B8(v48, v38 + v49[8], qword_254AC8A78);
      v50 = v26[12];
      v51 = &v11[v26[11]];
      v52 = *(_QWORD *)v51;
      v62 = *((_QWORD *)v51 + 1);
      v63 = v52;
      sub_21192C6B8((uint64_t)&v11[v50], v38 + v49[10], (uint64_t *)&unk_254ACC2D0);
      v53 = (_QWORD *)(v38 + v49[5]);
      *v53 = v66;
      v53[1] = v41;
      v54 = (_QWORD *)(v38 + v49[6]);
      v55 = v67;
      *v54 = v68;
      v54[1] = v55;
      v56 = (_QWORD *)(v38 + v49[7]);
      v57 = v64;
      *v56 = v65;
      v56[1] = v57;
      v58 = (_QWORD *)(v38 + v49[9]);
      v59 = v62;
      *v58 = v63;
      v58[1] = v59;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_211934758((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for FMFCommandResponseFragment);
      (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v49 - 1) + 56))(v38, 0, 1, v49);
    }
    swift_beginAccess();
    if (MEMORY[0x212BE496C](v36 + 32))
    {
      v60 = *(_QWORD *)(v36 + 40);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v60 + 112))(v36, v38, v25, ObjectType, v60);
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    sub_211923EE8(v38, &qword_254ACEAE8);
  }
  (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v20);
}

void sub_211A257D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t aBlock[3];
  void *v23;
  uint64_t v24;
  _QWORD *v25;

  v4 = v3;
  v8 = sub_211A46F08();
  v23 = (void *)v8;
  v24 = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
  v9 = sub_211969B08(aBlock);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v9, *MEMORY[0x24BE319C0], v8);
  LOBYTE(v8) = MEMORY[0x212BE2D10](aBlock);
  sub_211931C34((uint64_t)aBlock);
  if ((v8 & 1) != 0)
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v10 = sub_211A47748();
    sub_21194F3E0(v10, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v11 = sub_211A47724();
    v12 = sub_211A47D30();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      aBlock[0] = v14;
      sub_211958C38(&qword_254ACEAD8);
      v15 = sub_211A47928();
      sub_211950A9C(v15, v16, aBlock);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v11, v12, "%s: Updating Stewie location...", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v14, -1, -1);
      MEMORY[0x212BE48A0](v13, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v17 = *(void **)(v4 + 56);
    v18 = *(_QWORD *)(a1 + 24);
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v4;
    v19[3] = a2;
    v19[4] = a3;
    v24 = (uint64_t)sub_211A2BF34;
    v25 = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_211A2400C;
    v23 = &unk_24CCCEC48;
    v20 = _Block_copy(aBlock);
    swift_retain();
    v21 = v17;
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_publishCurrentLocationToStewieWithReason_completion_, v18, v20);
    _Block_release(v20);

  }
}

uint64_t sub_211A25AC0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v10 = sub_211A4779C();
  v27 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_211A477D8();
  v25 = *(_QWORD *)(v14 - 8);
  v26 = v14;
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211911824(0, (unint64_t *)&qword_254ACC300);
  v18 = (void *)sub_211A47D9C();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a1;
  v19[3] = a2;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  aBlock[4] = sub_211A2BF7C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21192382C;
  aBlock[3] = &unk_24CCCEC98;
  v20 = _Block_copy(aBlock);
  v21 = a1;
  v22 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  sub_211A477B4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_211910908((unint64_t *)&qword_254ACC340, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_211958C38((uint64_t *)&unk_254ACC1D0);
  sub_211969B94();
  sub_211A47EA4();
  MEMORY[0x212BE3BC8](0, v17, v13, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v17, v26);
}

void sub_211A25CE8(id a1, void *a2, uint64_t a3, void (*a4)(void **, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;

  if (a1)
  {
    objc_msgSend(a1, sel_nextAllowedPublish);
    v8 = v7;
    if (a2)
      goto LABEL_3;
  }
  else
  {
    v8 = 0;
    if (a2)
    {
LABEL_3:
      v49 = a2;
      v9 = a2;
      v10 = a2;
      sub_211958C38(&qword_254ACC360);
      type metadata accessor for SecureLocationsStewieError(0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_211910908(&qword_254AC7E80, (uint64_t (*)(uint64_t))type metadata accessor for SecureLocationsStewieError, (uint64_t)&unk_211A498D4);
        sub_211A470AC();
        if (v49 == (void *)1 && a1)
        {
          if (qword_254AC7B80 != -1)
            swift_once();
          v11 = sub_211A47748();
          sub_21194F3E0(v11, (uint64_t)qword_254ADC7E8);
          swift_retain_n();
          v12 = v48;
          v13 = sub_211A47724();
          v14 = sub_211A47D30();
          if (os_log_type_enabled(v13, v14))
          {
            v15 = swift_slowAlloc();
            v46 = swift_slowAlloc();
            *(_DWORD *)v15 = 136315650;
            v49 = (void *)v46;
            sub_211958C38(&qword_254ACEAD8);
            v16 = sub_211A47928();
            sub_211950A9C(v16, v17, (uint64_t *)&v49);
            sub_211A47E2C();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v15 + 12) = 2080;
            sub_211910908(&qword_254AC7E40, (uint64_t (*)(uint64_t))type metadata accessor for SecureLocationsStewieError, (uint64_t)&unk_211A49890);
            v18 = sub_211A482DC();
            sub_211950A9C(v18, v19, (uint64_t *)&v49);
            sub_211A47E2C();

            swift_bridgeObjectRelease();
            *(_WORD *)(v15 + 22) = 2080;
            v20 = sub_211A47C1C();
            sub_211950A9C(v20, v21, (uint64_t *)&v49);
            sub_211A47E2C();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21190D000, v13, v14, "%s: Updated Stewie location failed %s (next allowed publish: %s", (uint8_t *)v15, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x212BE48A0](v46, -1, -1);
            MEMORY[0x212BE48A0](v15, -1, -1);

          }
          else
          {

            swift_release_n();
          }
          LOBYTE(v49) = 0;
          sub_211A2BF8C();
          v44 = swift_allocError();
          *(_QWORD *)v45 = v8;
          *(_WORD *)(v45 + 8) = 0;
          a4(&v49, v44);

          v43 = (void *)v44;
LABEL_23:

          return;
        }

      }
      if (qword_254AC7B80 != -1)
        swift_once();
      v32 = sub_211A47748();
      sub_21194F3E0(v32, (uint64_t)qword_254ADC7E8);
      swift_retain();
      v33 = a2;
      swift_retain();
      v34 = a2;
      v35 = sub_211A47724();
      v36 = sub_211A47D30();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = swift_slowAlloc();
        v47 = swift_slowAlloc();
        *(_DWORD *)v37 = 136315394;
        v49 = (void *)v47;
        sub_211958C38(&qword_254ACEAD8);
        v38 = sub_211A47928();
        sub_211950A9C(v38, v39, (uint64_t *)&v49);
        sub_211A47E2C();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        swift_getErrorValue();
        v40 = sub_211A482DC();
        sub_211950A9C(v40, v41, (uint64_t *)&v49);
        sub_211A47E2C();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21190D000, v35, v36, "%s: Updated Stewie location failed %s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x212BE48A0](v47, -1, -1);
        MEMORY[0x212BE48A0](v37, -1, -1);
      }
      else
      {
        swift_release_n();

      }
      LOBYTE(v49) = 0;
      v42 = a2;
      a4(&v49, (uint64_t)a2);

      v43 = a2;
      goto LABEL_23;
    }
  }
  if (qword_254AC7B80 != -1)
    swift_once();
  v22 = sub_211A47748();
  sub_21194F3E0(v22, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v23 = sub_211A47724();
  v24 = sub_211A47D30();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    *(_DWORD *)v25 = 136315394;
    v49 = (void *)v26;
    sub_211958C38(&qword_254ACEAD8);
    v27 = sub_211A47928();
    sub_211950A9C(v27, v28, (uint64_t *)&v49);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    if (a1)
    {
      v29 = sub_211A47C1C();
      v31 = v30;
    }
    else
    {
      v31 = 0xE300000000000000;
      v29 = 7104878;
    }
    sub_211950A9C(v29, v31, (uint64_t *)&v49);
    sub_211A47E2C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v23, v24, "%s: Updated Stewie location succeeded (next allowed publish: %s)", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v26, -1, -1);
    MEMORY[0x212BE48A0](v25, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  LOBYTE(v49) = 2;
  a4(&v49, 0);
}

unint64_t sub_211A264C0(uint64_t a1)
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
  sub_211958C38(&qword_254ACEB08);
  v2 = (_QWORD *)sub_211A480CC();
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
    result = sub_211A265D0(v5, v6);
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

unint64_t sub_211A265D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_211A48318();
  sub_211A4797C();
  v4 = sub_211A48348();
  return sub_211A26634(a1, a2, v4);
}

unint64_t sub_211A26634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_211A48258() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_211A48258() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_211A48258() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_211A26778(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2119417C0(a1, a2, a3, *v3, &qword_254ACEB60);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_211A267A4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21194B0D8(a1, a2, a3, (_QWORD *)*v3, &qword_254ACA9A0, (uint64_t (*)(_QWORD))type metadata accessor for FMFIntermediateFriend);
  *v3 = result;
  return result;
}

uint64_t sub_211A267D0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_211A268BC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_211A267EC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_211A26A44(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_211A26808(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2119417C0(a1, a2, a3, *v3, &qword_254ACA980);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_211A26834(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21194B0D8(a1, a2, a3, (_QWORD *)*v3, &qword_254ACA988, (uint64_t (*)(_QWORD))type metadata accessor for FMFLocationAlert);
  *v3 = result;
  return result;
}

uint64_t sub_211A26860(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_211A26D5C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_211A2687C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2119417C0(a1, a2, a3, *v3, &qword_254ACA960);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_211A268A8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21194B0D8(a1, a2, a3, a4, &qword_254ACA3C0, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
}

uint64_t sub_211A268BC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_211958C38(&qword_254ACEB58);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 408);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[408 * v8])
      memmove(v12, v13, 408 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[408 * v8] || v12 >= &v13[408 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_211A480D8();
  __break(1u);
  return result;
}

uint64_t sub_211A26A44(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
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
    sub_211958C38(&qword_254ACEB48);
    v10 = (_QWORD *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 4;
  v13 = a4 + 4;
  v14 = 5 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v10 + 4, a4 + 4, v14 * 8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    sub_211958C38(&qword_254ACEB50);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_211A480D8();
  __break(1u);
  return result;
}

uint64_t sub_211A26BD8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_211958C38(&qword_254ACA9B0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_211A480D8();
  __break(1u);
  return result;
}

uint64_t sub_211A26D5C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_211958C38(&qword_254ACA3B8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_211958C38(&qword_254AC7C58);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_211A480D8();
  __break(1u);
  return result;
}

uint64_t sub_211A26EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t result;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v31;

  v6 = v5;
  v10 = *v5;
  sub_211A48318();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_211A4797C();
  swift_bridgeObjectRelease();
  v11 = sub_211A48348();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = *(_QWORD *)(v10 + 48);
    v15 = 32 * v13;
    v16 = (_QWORD *)(v14 + 32 * v13);
    v17 = *v16 == a2 && v16[1] == a3;
    if (v17 || (sub_211A48258() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = *(_QWORD *)(*v6 + 48) + v15;
      v20 = *(_QWORD *)v18;
      v19 = *(_QWORD *)(v18 + 8);
      v21 = *(_QWORD *)(v18 + 16);
      v22 = *(_BYTE *)(v18 + 24);
      v23 = *(_BYTE *)(v18 + 25);
      LOBYTE(v18) = *(_BYTE *)(v18 + 26);
      *(_QWORD *)a1 = v20;
      *(_QWORD *)(a1 + 8) = v19;
      *(_QWORD *)(a1 + 16) = v21;
      *(_BYTE *)(a1 + 24) = v22;
      *(_BYTE *)(a1 + 25) = v23;
      *(_BYTE *)(a1 + 26) = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return 0;
    }
    v25 = ~v12;
    while (1)
    {
      v13 = (v13 + 1) & v25;
      if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
        break;
      v15 = 32 * v13;
      v26 = (_QWORD *)(v14 + 32 * v13);
      v27 = *v26 == a2 && v26[1] == a3;
      if (v27 || (sub_211A48258() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v31 = *v6;
  *v6 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_211A28FA4(a2, a3, a4, a5 & 0x10101, v13, isUniquelyReferenced_nonNull_native);
  *v6 = v31;
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = a4;
  *(_BYTE *)(a1 + 24) = a5 & 1;
  *(_BYTE *)(a1 + 25) = BYTE1(a5) & 1;
  result = 1;
  *(_BYTE *)(a1 + 26) = BYTE2(a5) & 1;
  return result;
}

uint64_t sub_211A2712C(_QWORD *a1, void *a2)
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
    v9 = sub_211A47EE0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_211911824(0, (unint64_t *)&qword_254AC8CC0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_211A47ED4();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_211A27AB0(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_211A282C0();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_211A28F24((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_211A47DD8();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_211911824(0, (unint64_t *)&qword_254AC8CC0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_211A47DE4();

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
        v18 = sub_211A47DE4();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_211A29178((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_211A273C8(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_211A474D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, MEMORY[0x24BE32118]);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_211910908(&qword_254ACE760, v11, MEMORY[0x24BE32128]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_211A478A4();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_211910908(&qword_254ACEB78, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32130]);
      v21 = sub_211A478E0();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_211A292FC((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_211A27624(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD *v4;
  _QWORD *v5;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  int v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  int v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v5 = v4;
  v10 = a4 & 1;
  v38 = a4 & 0x10000;
  v39 = a4 & 0x100;
  v11 = *v5;
  sub_211A48318();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_211A4797C();
  v41 = a3;
  swift_bridgeObjectRelease();
  v40 = v10;
  sub_211A48330();
  sub_211A48330();
  sub_211A48330();
  v12 = sub_211A48348();
  v13 = -1 << *(_BYTE *)(v11 + 32);
  v14 = v12 & ~v13;
  v15 = v11 + 56;
  v36 = v5;
  v37 = a1;
  v35 = a4;
  if (((*(_QWORD *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v16 = ~v13;
    v17 = *(_QWORD *)(v11 + 48);
    v19 = a2;
    v18 = v41;
    while (1)
    {
      v21 = v17 + 24 * v14;
      v22 = *(unsigned __int8 *)(v21 + 16);
      v23 = *(unsigned __int8 *)(v21 + 17);
      v24 = (v38 != 0) ^ *(unsigned __int8 *)(v21 + 18);
      if (*(_QWORD *)v21 == v19 && *(_QWORD *)(v21 + 8) == v18)
      {
        if ((((v10 != 0) ^ v22 | (v39 != 0) ^ v23 | v24) & 1) == 0)
        {
LABEL_11:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v26 = *(_QWORD *)(*v36 + 48) + 24 * v14;
          v28 = *(_QWORD *)v26;
          v27 = *(_QWORD *)(v26 + 8);
          v29 = *(_BYTE *)(v26 + 16);
          v30 = *(_BYTE *)(v26 + 17);
          LOBYTE(v26) = *(_BYTE *)(v26 + 18);
          *(_QWORD *)v37 = v28;
          *(_QWORD *)(v37 + 8) = v27;
          *(_BYTE *)(v37 + 16) = v29;
          *(_BYTE *)(v37 + 17) = v30;
          *(_BYTE *)(v37 + 18) = v26;
          swift_bridgeObjectRetain();
          return 0;
        }
      }
      else
      {
        v20 = sub_211A48258();
        v19 = a2;
        v18 = v41;
        if (!(((v10 != 0) ^ v22) & 1 | ((v20 & 1) == 0) | (((v39 != 0) ^ v23) | v24) & 1))
          goto LABEL_11;
      }
      v14 = (v14 + 1) & v16;
      if (((*(_QWORD *)(v15 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
        goto LABEL_13;
    }
  }
  v19 = a2;
  v18 = v41;
LABEL_13:
  v32 = v18;
  v33 = v19;
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v42 = *v36;
  *v36 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_211A29500(v33, v32, v35 & 0x10101, v14, isUniquelyReferenced_nonNull_native);
  *v36 = v42;
  swift_bridgeObjectRelease();
  *(_QWORD *)v37 = v33;
  *(_QWORD *)(v37 + 8) = v32;
  *(_BYTE *)(v37 + 16) = v40;
  *(_BYTE *)(v37 + 17) = BYTE1(v39);
  result = 1;
  *(_BYTE *)(v37 + 18) = BYTE2(v38);
  return result;
}

uint64_t sub_211A278E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t *v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;

  v7 = *v3;
  sub_211A48318();
  sub_211A48330();
  swift_bridgeObjectRetain();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_211A4797C();
    swift_bridgeObjectRelease();
  }
  v8 = sub_211A48348();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v3;
    *v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_211A29798(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *v3 = v20;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  v11 = ~v9;
  v12 = *(_QWORD *)(v7 + 48);
  while (1)
  {
    v13 = (_QWORD *)(v12 + 16 * v10);
    v14 = v13[1];
    if (v14)
      break;
    if (!a3)
      goto LABEL_15;
LABEL_6:
    v10 = (v10 + 1) & v11;
    if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      goto LABEL_16;
  }
  if (!a3)
    goto LABEL_6;
  v15 = *v13 == a2 && v14 == a3;
  if (!v15 && (sub_211A48258() & 1) == 0)
    goto LABEL_6;
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
  v16 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
  v17 = v16[1];
  *a1 = *v16;
  a1[1] = v17;
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_211A27AB0(uint64_t a1, uint64_t a2)
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
    sub_211958C38(&qword_254ACEB10);
    v2 = sub_211A47F40();
    v14 = v2;
    sub_211A47EC8();
    if (sub_211A47EEC())
    {
      sub_211911824(0, (unint64_t *)&qword_254AC8CC0);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_211A282C0();
          v2 = v14;
        }
        result = sub_211A47DD8();
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
      while (sub_211A47EEC());
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

uint64_t sub_211A27CA4()
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
  sub_211958C38(&qword_254ACCB38);
  v3 = sub_211A47F34();
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
      sub_211A48318();
      sub_211A4797C();
      result = sub_211A48348();
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

uint64_t sub_211A27F80()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  __int128 v34;

  v1 = v0;
  v2 = *v0;
  sub_211958C38(&qword_254ACEB40);
  v3 = sub_211A47F34();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32)
          goto LABEL_33;
        v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v32)
            goto LABEL_33;
          v16 = v33[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v32)
              goto LABEL_33;
            v16 = v33[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v31 = 1 << *(_BYTE *)(v2 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v32)
                    goto LABEL_33;
                  v16 = v33[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = v2;
      v19 = *(_QWORD *)(v2 + 48) + 32 * v14;
      v20 = *(_QWORD *)v19;
      v34 = *(_OWORD *)(v19 + 8);
      v21 = *(_BYTE *)(v19 + 24);
      v22 = *(_BYTE *)(v19 + 25);
      v23 = *(_BYTE *)(v19 + 26);
      sub_211A48318();
      swift_bridgeObjectRetain();
      sub_211A4797C();
      swift_bridgeObjectRelease();
      result = sub_211A48348();
      v24 = -1 << *(_BYTE *)(v4 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 32 * v11;
      *(_QWORD *)v12 = v20;
      *(_OWORD *)(v12 + 8) = v34;
      *(_BYTE *)(v12 + 24) = v21;
      *(_BYTE *)(v12 + 25) = v22;
      *(_BYTE *)(v12 + 26) = v23;
      ++*(_QWORD *)(v4 + 16);
      v2 = v18;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_211A282C0()
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
  sub_211958C38(&qword_254ACEB10);
  v3 = sub_211A47F34();
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
      result = sub_211A47DD8();
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

uint64_t sub_211A2855C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
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
  _QWORD *v36;
  uint64_t v37;

  v1 = v0;
  v2 = sub_211A474D8();
  v37 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  sub_211958C38(&qword_254ACEB80);
  v7 = sub_211A47F34();
  v8 = v7;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = 1 << *(_BYTE *)(v6 + 32);
    v10 = *(_QWORD *)(v6 + 56);
    v36 = (_QWORD *)(v6 + 56);
    if (v9 < 64)
      v11 = ~(-1 << v9);
    else
      v11 = -1;
    v12 = v11 & v10;
    v34 = v0;
    v35 = (unint64_t)(v9 + 63) >> 6;
    v13 = v7 + 56;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v15 << 6);
      }
      else
      {
        v19 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v35)
          goto LABEL_33;
        v20 = v36[v19];
        ++v15;
        if (!v20)
        {
          v15 = v19 + 1;
          if (v19 + 1 >= v35)
            goto LABEL_33;
          v20 = v36[v15];
          if (!v20)
          {
            v15 = v19 + 2;
            if (v19 + 2 >= v35)
              goto LABEL_33;
            v20 = v36[v15];
            if (!v20)
            {
              v21 = v19 + 3;
              if (v21 >= v35)
              {
LABEL_33:
                swift_release();
                v1 = v34;
                v33 = 1 << *(_BYTE *)(v6 + 32);
                if (v33 > 63)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v6 + 16) = 0;
                break;
              }
              v20 = v36[v21];
              if (!v20)
              {
                while (1)
                {
                  v15 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_39;
                  if (v15 >= v35)
                    goto LABEL_33;
                  v20 = v36[v15];
                  ++v21;
                  if (v20)
                    goto LABEL_23;
                }
              }
              v15 = v21;
            }
          }
        }
LABEL_23:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v15 << 6);
      }
      v22 = v6;
      v23 = *(_QWORD *)(v6 + 48);
      v24 = *(_QWORD *)(v37 + 72);
      v25 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 32);
      v25(v5, v23 + v24 * v18, v2);
      sub_211910908(&qword_254ACE760, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32128]);
      result = sub_211A478A4();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v13 + 8 * v28);
        }
        while (v32 == -1);
        v16 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(_QWORD *)(v8 + 48) + v16 * v24, v5, v2);
      ++*(_QWORD *)(v8 + 16);
      v6 = v22;
    }
  }
  result = swift_release();
  *v1 = v8;
  return result;
}

uint64_t sub_211A288C8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t i;

  v1 = v0;
  v2 = *v0;
  sub_211958C38(&qword_254ACEB28);
  v3 = sub_211A47F34();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    for (i = v2; ; v2 = i)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32)
          goto LABEL_33;
        v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v32)
            goto LABEL_33;
          v16 = v33[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v32)
              goto LABEL_33;
            v16 = v33[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v31 = 1 << *(_BYTE *)(v2 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v32)
                    goto LABEL_33;
                  v16 = v33[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = *(_QWORD *)(v2 + 48) + 24 * v14;
      v19 = *(_QWORD *)v18;
      v20 = *(_QWORD *)(v18 + 8);
      v21 = *(_BYTE *)(v18 + 16);
      v22 = *(_BYTE *)(v18 + 17);
      v23 = *(_BYTE *)(v18 + 18);
      sub_211A48318();
      swift_bridgeObjectRetain();
      sub_211A4797C();
      swift_bridgeObjectRelease();
      sub_211A48330();
      sub_211A48330();
      sub_211A48330();
      result = sub_211A48348();
      v24 = -1 << *(_BYTE *)(v4 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 24 * v11;
      *(_QWORD *)v12 = v19;
      *(_QWORD *)(v12 + 8) = v20;
      *(_BYTE *)(v12 + 16) = v21;
      *(_BYTE *)(v12 + 17) = v22;
      *(_BYTE *)(v12 + 18) = v23;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_211A28C1C()
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
  sub_211958C38(&qword_254ACEBD0);
  v3 = sub_211A47F34();
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
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_35;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_35;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_35;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_35:
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
                    goto LABEL_41;
                  if (v11 >= v8)
                    goto LABEL_35;
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
      v21 = *v19;
      v20 = v19[1];
      sub_211A48318();
      sub_211A48330();
      if (v20)
      {
        swift_bridgeObjectRetain();
        sub_211A4797C();
        swift_bridgeObjectRelease();
      }
      result = sub_211A48348();
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
            goto LABEL_40;
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
      *v13 = v21;
      v13[1] = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_211A28F24(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_211A47DD8();
  result = sub_211A47EBC();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_211A28FA4(uint64_t result, uint64_t a2, uint64_t a3, int a4, unint64_t a5, char a6)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  BOOL v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v7 = v6;
  v12 = result;
  v13 = *(_QWORD *)(*v6 + 16);
  v14 = *(_QWORD *)(*v6 + 24);
  if (v14 > v13 && (a6 & 1) != 0)
    goto LABEL_22;
  if ((a6 & 1) != 0)
  {
    sub_211A27F80();
  }
  else
  {
    if (v14 > v13)
    {
      result = (uint64_t)sub_211A29AFC();
      goto LABEL_22;
    }
    sub_211A2A418();
  }
  v15 = *v6;
  sub_211A48318();
  swift_bridgeObjectRetain();
  sub_211A4797C();
  swift_bridgeObjectRelease();
  result = sub_211A48348();
  v16 = -1 << *(_BYTE *)(v15 + 32);
  a5 = result & ~v16;
  v17 = v15 + 56;
  if (((*(_QWORD *)(v15 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
  {
    v18 = *(_QWORD *)(v15 + 48);
    v19 = (_QWORD *)(v18 + 32 * a5);
    v20 = *v19 == v12 && v19[1] == a2;
    if (v20 || (result = sub_211A48258(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_211A48288();
      __break(1u);
    }
    else
    {
      v21 = ~v16;
      while (1)
      {
        a5 = (a5 + 1) & v21;
        if (((*(_QWORD *)(v17 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) == 0)
          break;
        v22 = (_QWORD *)(v18 + 32 * a5);
        if (*v22 != v12 || v22[1] != a2)
        {
          result = sub_211A48258();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v24 = *v7;
  *(_QWORD *)(*v7 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  v25 = *(_QWORD *)(v24 + 48) + 32 * a5;
  *(_QWORD *)v25 = v12;
  *(_QWORD *)(v25 + 8) = a2;
  *(_QWORD *)(v25 + 16) = a3;
  *(_BYTE *)(v25 + 24) = a4 & 1;
  *(_BYTE *)(v25 + 25) = BYTE1(a4) & 1;
  *(_BYTE *)(v25 + 26) = BYTE2(a4) & 1;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
  return result;
}

void sub_211A29178(uint64_t a1, unint64_t a2, char a3)
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
    sub_211A282C0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_211A29CD4();
      goto LABEL_14;
    }
    sub_211A2A724();
  }
  v8 = *v3;
  v9 = sub_211A47DD8();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_211911824(0, (unint64_t *)&qword_254AC8CC0);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_211A47DE4();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_211A48288();
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
        v15 = sub_211A47DE4();

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

uint64_t sub_211A292FC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = a1;
  v6 = sub_211A474D8();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6, v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(*v3 + 16);
  v13 = *(_QWORD *)(*v3 + 24);
  v27 = v3;
  if (v13 > v12 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_211A2855C();
  }
  else
  {
    if (v13 > v12)
    {
      sub_211A29E7C();
      goto LABEL_12;
    }
    sub_211A2A99C();
  }
  v14 = *v3;
  sub_211910908(&qword_254ACE760, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32128]);
  v15 = sub_211A478A4();
  v16 = -1 << *(_BYTE *)(v14 + 32);
  a2 = v15 & ~v16;
  if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v17 = ~v16;
    v18 = *(_QWORD *)(v7 + 72);
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v19(v11, *(_QWORD *)(v14 + 48) + v18 * a2, v6);
      sub_211910908(&qword_254ACEB78, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32130]);
      v20 = sub_211A478E0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
      if ((v20 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v17;
    }
    while (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v21 = v28;
  v22 = *v27;
  *(_QWORD *)(*v27 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __n128))(v7 + 32))(*(_QWORD *)(v22 + 48) + *(_QWORD *)(v7 + 72) * a2, v21, v6, v9);
  v24 = *(_QWORD *)(v22 + 16);
  v25 = __OFADD__(v24, 1);
  v26 = v24 + 1;
  if (!v25)
  {
    *(_QWORD *)(v22 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_211A48288();
  __break(1u);
  return result;
}

uint64_t sub_211A29500(uint64_t result, uint64_t a2, int a3, unint64_t a4, char a5)
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  _BOOL4 v37;

  v7 = a2;
  v8 = result;
  v9 = a3 & 1;
  v10 = a3 & 0x100;
  v11 = a3 & 0x10000;
  v12 = *(_QWORD *)(*v5 + 16);
  v13 = *(_QWORD *)(*v5 + 24);
  v33 = (a3 & 0x10000u) >> 16;
  v34 = v10 >> 8;
  if (v13 <= v12 || (a5 & 1) == 0)
  {
    v36 = result;
    if ((a5 & 1) != 0)
    {
      sub_211A288C8();
    }
    else
    {
      if (v13 > v12)
      {
        result = (uint64_t)sub_211A2A0A0();
        goto LABEL_18;
      }
      sub_211A2ACC4();
    }
    v14 = *v5;
    sub_211A48318();
    swift_bridgeObjectRetain();
    sub_211A4797C();
    swift_bridgeObjectRelease();
    sub_211A48330();
    sub_211A48330();
    sub_211A48330();
    result = sub_211A48348();
    v15 = -1 << *(_BYTE *)(v14 + 32);
    a4 = result & ~v15;
    v16 = v14 + 56;
    if (((*(_QWORD *)(v14 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) != 0)
    {
      v17 = ~v15;
      v18 = *(_QWORD *)(v14 + 48);
      v8 = v36;
      v7 = a2;
      v19 = v11;
      v35 = v10;
      while (1)
      {
        v20 = v18 + 24 * a4;
        result = *(_QWORD *)v20;
        v21 = *(unsigned __int8 *)(v20 + 16);
        v22 = *(unsigned __int8 *)(v20 + 17);
        v23 = (v19 != 0) ^ *(unsigned __int8 *)(v20 + 18);
        if (*(_QWORD *)v20 == v8 && *(_QWORD *)(v20 + 8) == v7)
        {
          if ((((v9 != 0) ^ v21 | (v10 != 0) ^ v22 | v23) & 1) == 0)
            goto LABEL_17;
        }
        else
        {
          v37 = v10 != 0;
          v25 = v16;
          v26 = v18;
          result = sub_211A48258();
          v18 = v26;
          v16 = v25;
          v7 = a2;
          v8 = v36;
          v10 = v35;
          if (!(((v9 != 0) ^ v21) & 1 | ((result & 1) == 0) | (v37 ^ v22 | v23) & 1))
          {
LABEL_17:
            result = sub_211A48288();
            __break(1u);
            break;
          }
        }
        a4 = (a4 + 1) & v17;
        if (((*(_QWORD *)(v16 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) == 0)
          goto LABEL_19;
      }
    }
LABEL_18:
    v8 = v36;
    v7 = a2;
  }
LABEL_19:
  v27 = *v32;
  *(_QWORD *)(*v32 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  v28 = *(_QWORD *)(v27 + 48) + 24 * a4;
  *(_QWORD *)v28 = v8;
  *(_QWORD *)(v28 + 8) = v7;
  *(_BYTE *)(v28 + 16) = v9;
  *(_BYTE *)(v28 + 17) = v34;
  *(_BYTE *)(v28 + 18) = v33;
  v29 = *(_QWORD *)(v27 + 16);
  v30 = __OFADD__(v29, 1);
  v31 = v29 + 1;
  if (v30)
    __break(1u);
  else
    *(_QWORD *)(v27 + 16) = v31;
  return result;
}

uint64_t sub_211A29798(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_211A28C1C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_211A2A26C();
      goto LABEL_22;
    }
    sub_211A2AFE4();
  }
  v11 = *v4;
  sub_211A48318();
  sub_211A48330();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_211A4797C();
    swift_bridgeObjectRelease();
  }
  result = sub_211A48348();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v11 + 48);
    do
    {
      v16 = (_QWORD *)(v15 + 16 * a3);
      v17 = v16[1];
      if (v17)
      {
        if (a2)
        {
          v18 = *v16 == v8 && v17 == a2;
          if (v18 || (result = sub_211A48258(), (result & 1) != 0))
          {
LABEL_21:
            sub_211958C38(&qword_254AC7C58);
            result = sub_211A48288();
            __break(1u);
            break;
          }
        }
      }
      else if (!a2)
      {
        goto LABEL_21;
      }
      a3 = (a3 + 1) & v14;
    }
    while (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_22:
  v19 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v20 = (uint64_t *)(*(_QWORD *)(v19 + 48) + 16 * a3);
  *v20 = v8;
  v20[1] = a2;
  v21 = *(_QWORD *)(v19 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v23;
  return result;
}

void *sub_211A2994C()
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
  sub_211958C38(&qword_254ACCB38);
  v2 = *v0;
  v3 = sub_211A47F28();
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

void *sub_211A29AFC()
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
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  sub_211958C38(&qword_254ACEB40);
  v2 = *v0;
  v3 = sub_211A47F28();
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v13)
      goto LABEL_28;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_28;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
      {
        v9 = v24 + 2;
        if (v24 + 2 >= v13)
          goto LABEL_28;
        v25 = *(_QWORD *)(v6 + 8 * v9);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = *(_BYTE *)(v17 + 24);
    v22 = *(_BYTE *)(v17 + 25);
    LOBYTE(v17) = *(_BYTE *)(v17 + 26);
    v23 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v23 = v19;
    *(_QWORD *)(v23 + 8) = v18;
    *(_QWORD *)(v23 + 16) = v20;
    *(_BYTE *)(v23 + 24) = v21;
    *(_BYTE *)(v23 + 25) = v22;
    *(_BYTE *)(v23 + 26) = v17;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 3;
  if (v26 >= v13)
    goto LABEL_28;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_211A29CD4()
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
  sub_211958C38(&qword_254ACEB10);
  v2 = *v0;
  v3 = sub_211A47F28();
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

void *sub_211A29E7C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  uint64_t v11;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = sub_211A474D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211958C38(&qword_254ACEB80);
  v7 = *v0;
  v8 = sub_211A47F28();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v9;
    return result;
  }
  v26 = v1;
  result = (void *)(v8 + 56);
  v11 = v7 + 56;
  v12 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 56 + 8 * v12)
    result = memmove(result, (const void *)(v7 + 56), 8 * v12);
  v14 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v15 = 1 << *(_BYTE *)(v7 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v7 + 56);
  v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v18)
      goto LABEL_28;
    v23 = *(_QWORD *)(v11 + 8 * v22);
    ++v14;
    if (!v23)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v18)
        goto LABEL_28;
      v23 = *(_QWORD *)(v11 + 8 * v14);
      if (!v23)
      {
        v14 = v22 + 2;
        if (v22 + 2 >= v18)
          goto LABEL_28;
        v23 = *(_QWORD *)(v11 + 8 * v14);
        if (!v23)
          break;
      }
    }
LABEL_27:
    v17 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_12:
    v21 = *(_QWORD *)(v3 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v21, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v21, v6, v2);
  }
  v24 = v22 + 3;
  if (v24 >= v18)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_30;
  }
  v23 = *(_QWORD *)(v11 + 8 * v24);
  if (v23)
  {
    v14 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v14 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v14 >= v18)
      goto LABEL_28;
    v23 = *(_QWORD *)(v11 + 8 * v14);
    ++v24;
    if (v23)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_211A2A0A0()
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
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_211958C38(&qword_254ACEB28);
  v2 = *v0;
  v3 = sub_211A47F28();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v13)
      goto LABEL_28;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_28;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
      {
        v9 = v23 + 2;
        if (v23 + 2 >= v13)
          goto LABEL_28;
        v24 = *(_QWORD *)(v6 + 8 * v9);
        if (!v24)
          break;
      }
    }
LABEL_27:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(_BYTE *)(v17 + 16);
    v21 = *(_BYTE *)(v17 + 17);
    LOBYTE(v17) = *(_BYTE *)(v17 + 18);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v22 = v19;
    *(_QWORD *)(v22 + 8) = v18;
    *(_BYTE *)(v22 + 16) = v20;
    *(_BYTE *)(v22 + 17) = v21;
    *(_BYTE *)(v22 + 18) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 3;
  if (v25 >= v13)
    goto LABEL_28;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_211A2A26C()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_211958C38(&qword_254ACEBD0);
  v2 = *v0;
  v3 = sub_211A47F28();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_211A2A418()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;

  v1 = v0;
  v2 = *v0;
  sub_211958C38(&qword_254ACEB40);
  v3 = sub_211A47F34();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v33 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v34 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  v35 = v2;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v36 = v10;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v34)
      goto LABEL_33;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    v17 = v10 + 1;
    if (!v16)
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v34)
        goto LABEL_33;
      v16 = *(_QWORD *)(v33 + 8 * v17);
      if (!v16)
      {
        v17 = v10 + 3;
        if (v10 + 3 >= v34)
          goto LABEL_33;
        v16 = *(_QWORD *)(v33 + 8 * v17);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v36 = v17;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    v19 = *(_QWORD *)(v2 + 48) + 32 * v14;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 16);
    v23 = *(_BYTE *)(v19 + 24);
    v24 = *(_BYTE *)(v19 + 25);
    v25 = *(_BYTE *)(v19 + 26);
    sub_211A48318();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_211A4797C();
    swift_bridgeObjectRelease();
    result = sub_211A48348();
    v26 = -1 << *(_BYTE *)(v4 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v8 + 8 * v28);
      }
      while (v32 == -1);
      v11 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 32 * v11;
    *(_QWORD *)v12 = v20;
    *(_QWORD *)(v12 + 8) = v21;
    *(_QWORD *)(v12 + 16) = v22;
    *(_BYTE *)(v12 + 24) = v23;
    *(_BYTE *)(v12 + 25) = v24;
    *(_BYTE *)(v12 + 26) = v25;
    ++*(_QWORD *)(v4 + 16);
    v2 = v35;
    v10 = v36;
  }
  v18 = v10 + 4;
  if (v10 + 4 >= v34)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v33 + 8 * v18);
  if (v16)
  {
    v17 = v10 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v34)
      goto LABEL_33;
    v16 = *(_QWORD *)(v33 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_211A2A724()
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
  sub_211958C38(&qword_254ACEB10);
  v3 = sub_211A47F34();
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
    result = sub_211A47DD8();
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

uint64_t sub_211A2A99C()
{
  uint64_t *v0;
  uint64_t *v1;
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
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int64_t v34;

  v1 = v0;
  v2 = sub_211A474D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v0;
  sub_211958C38(&qword_254ACEB80);
  v8 = sub_211A47F34();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v9;
    return result;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v32 = v0;
  v33 = v7 + 56;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v34 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  result = swift_retain();
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v34)
      goto LABEL_33;
    v21 = *(_QWORD *)(v33 + 8 * v20);
    ++v16;
    if (!v21)
    {
      v16 = v20 + 1;
      if (v20 + 1 >= v34)
        goto LABEL_33;
      v21 = *(_QWORD *)(v33 + 8 * v16);
      if (!v21)
      {
        v16 = v20 + 2;
        if (v20 + 2 >= v34)
          goto LABEL_33;
        v21 = *(_QWORD *)(v33 + 8 * v16);
        if (!v21)
          break;
      }
    }
LABEL_23:
    v13 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    v23 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v23 * v19, v2);
    sub_211910908(&qword_254ACE760, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32128]);
    result = sub_211A478A4();
    v24 = -1 << *(_BYTE *)(v9 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v14 + 8 * (v25 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v14 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v14 + 8 * v26);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v17 * v23, v6, v2);
    ++*(_QWORD *)(v9 + 16);
  }
  v22 = v20 + 3;
  if (v22 >= v34)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v32;
    goto LABEL_35;
  }
  v21 = *(_QWORD *)(v33 + 8 * v22);
  if (v21)
  {
    v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    v16 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v16 >= v34)
      goto LABEL_33;
    v21 = *(_QWORD *)(v33 + 8 * v16);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_211A2ACC4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t i;

  v1 = v0;
  v2 = *v0;
  sub_211958C38(&qword_254ACEB28);
  v3 = sub_211A47F34();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v31 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v32 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  for (i = v2; ; v2 = i)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v32)
      goto LABEL_33;
    v16 = *(_QWORD *)(v31 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v32)
        goto LABEL_33;
      v16 = *(_QWORD *)(v31 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v32)
          goto LABEL_33;
        v16 = *(_QWORD *)(v31 + 8 * v10);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    v18 = *(_QWORD *)(v2 + 48) + 24 * v14;
    v19 = *(_QWORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v21 = *(_BYTE *)(v18 + 16);
    v22 = *(_BYTE *)(v18 + 17);
    v23 = *(_BYTE *)(v18 + 18);
    sub_211A48318();
    swift_bridgeObjectRetain_n();
    sub_211A4797C();
    swift_bridgeObjectRelease();
    sub_211A48330();
    sub_211A48330();
    sub_211A48330();
    result = sub_211A48348();
    v24 = -1 << *(_BYTE *)(v4 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v8 + 8 * v26);
      }
      while (v30 == -1);
      v11 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 24 * v11;
    *(_QWORD *)v12 = v19;
    *(_QWORD *)(v12 + 8) = v20;
    *(_BYTE *)(v12 + 16) = v21;
    *(_BYTE *)(v12 + 17) = v22;
    *(_BYTE *)(v12 + 18) = v23;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v32)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v31 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v32)
      goto LABEL_33;
    v16 = *(_QWORD *)(v31 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_211A2AFE4()
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
  sub_211958C38(&qword_254ACEBD0);
  v3 = sub_211A47F34();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_37:
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
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v29)
      goto LABEL_35;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_35;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_35;
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
    v21 = *v19;
    v20 = v19[1];
    sub_211A48318();
    sub_211A48330();
    if (v20)
    {
      swift_bridgeObjectRetain_n();
      sub_211A4797C();
      swift_bridgeObjectRelease();
    }
    result = sub_211A48348();
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
    *v13 = v21;
    v13[1] = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_35:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_37;
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
      goto LABEL_35;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_211A2B2B8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  unint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *__dst;

  v3 = a1[1];
  result = sub_211A48204();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v88 = 0;
      v89 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v91 = *(_QWORD *)(v89 + 24 * i + 16);
        v92 = v88;
        do
        {
          v93 = v89 + v92;
          if (v91 >= *(_QWORD *)(v89 + v92 + 16))
            break;
          if (!v89)
            goto LABEL_140;
          v94 = *(_QWORD *)(v93 + 24);
          v95 = (_QWORD *)(v89 + v92);
          v96 = *(_QWORD *)(v89 + v92 + 32);
          *(_OWORD *)(v93 + 24) = *(_OWORD *)v93;
          result = *(_QWORD *)(v93 + 16);
          *(_QWORD *)(v93 + 40) = result;
          *v95 = v94;
          v95[1] = v96;
          *(_QWORD *)(v93 + 16) = v91;
          v92 -= 24;
        }
        while (v92 != -24);
        v88 += 24;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v6 = result;
  v105 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v97 = v12;
      v107 = v9;
      if (v13 >= 2)
      {
        v98 = *v105;
        do
        {
          v99 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v98)
            goto LABEL_144;
          v100 = v97;
          v101 = *(_QWORD *)&v97[16 * v99 + 32];
          v102 = *(_QWORD *)&v97[16 * v13 + 24];
          sub_211A2B9C0((char *)(v98 + 24 * v101), (char *)(v98 + 24 * *(_QWORD *)&v97[16 * v13 + 16]), v98 + 24 * v102, __dst);
          if (v1)
            break;
          if (v102 < v101)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v100 = sub_2119BA434((uint64_t)v100);
          if (v99 >= *((_QWORD *)v100 + 2))
            goto LABEL_133;
          v103 = &v100[16 * v99 + 32];
          *(_QWORD *)v103 = v101;
          *((_QWORD *)v103 + 1) = v102;
          v104 = *((_QWORD *)v100 + 2);
          if (v13 > v104)
            goto LABEL_134;
          memmove(&v100[16 * v13 + 16], &v100[16 * v13 + 32], 16 * (v104 - v13));
          v97 = v100;
          *((_QWORD *)v100 + 2) = v104 - 1;
          v13 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v107 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v107 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    v8 = sub_211A47AFC();
    *(_QWORD *)(v8 + 16) = v7;
    v107 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v106 = *a1 + 64;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v108 = v6;
  v109 = v3;
  v110 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 24 * v10 + 16);
      v16 = *(_QWORD *)(v11 + 24 * v14 + 16);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (uint64_t *)(v106 + 24 * v14);
        v18 = v15;
        while (1)
        {
          v20 = *v17;
          v17 += 3;
          v19 = v20;
          if (v15 < v16 == v20 >= v18)
            break;
          ++v10;
          v18 = v19;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v21 = 24 * v10;
          v22 = 24 * v14;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = v11 + v22;
              v26 = v11 + v21;
              v27 = *(_OWORD *)(v11 + v22);
              v28 = *(_QWORD *)(v11 + v22 + 16);
              v29 = *(_QWORD *)(v11 + v21 - 8);
              *(_OWORD *)v25 = *(_OWORD *)(v11 + v21 - 24);
              *(_QWORD *)(v25 + 16) = v29;
              *(_OWORD *)(v26 - 24) = v27;
              *(_QWORD *)(v26 - 8) = v28;
            }
            ++v24;
            v21 -= 24;
            v22 += 24;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v30 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v30 >= v3)
      v30 = v3;
    if (v30 < v14)
      break;
    if (v10 != v30)
    {
      v31 = (uint64_t *)(v11 + 24 * v10);
      do
      {
        v32 = *(_QWORD *)(v11 + 24 * v10 + 16);
        v33 = v14;
        v34 = v31;
        do
        {
          if (v32 >= *(v34 - 1))
            break;
          if (!v11)
            goto LABEL_141;
          v35 = *v34;
          v36 = v34[1];
          *(_OWORD *)v34 = *(_OWORD *)(v34 - 3);
          v34[2] = *(v34 - 1);
          *(v34 - 2) = v36;
          *(v34 - 1) = v32;
          *(v34 - 3) = v35;
          v34 -= 3;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 3;
      }
      while (v10 != v30);
      v10 = v30;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_2119BA0CC(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v38 = *((_QWORD *)v12 + 2);
    v37 = *((_QWORD *)v12 + 3);
    v13 = v38 + 1;
    v11 = v110;
    if (v38 >= v37 >> 1)
    {
      v87 = sub_2119BA0CC((char *)(v37 > 1), v38 + 1, 1, v12);
      v11 = v110;
      v12 = v87;
    }
    *((_QWORD *)v12 + 2) = v13;
    v39 = v12 + 32;
    v40 = &v12[16 * v38 + 32];
    *(_QWORD *)v40 = v14;
    *((_QWORD *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        v41 = v13 - 1;
        if (v13 >= 4)
        {
          v46 = &v39[16 * v13];
          v47 = *((_QWORD *)v46 - 8);
          v48 = *((_QWORD *)v46 - 7);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_119;
          v51 = *((_QWORD *)v46 - 6);
          v50 = *((_QWORD *)v46 - 5);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_120;
          v53 = v13 - 2;
          v54 = &v39[16 * v13 - 32];
          v56 = *(_QWORD *)v54;
          v55 = *((_QWORD *)v54 + 1);
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_122;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_125;
          if (v58 >= v49)
          {
            v76 = &v39[16 * v41];
            v78 = *(_QWORD *)v76;
            v77 = *((_QWORD *)v76 + 1);
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_129;
            v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v70 = *((_QWORD *)v12 + 4);
            v71 = *((_QWORD *)v12 + 5);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_77;
          }
          v43 = *((_QWORD *)v12 + 4);
          v42 = *((_QWORD *)v12 + 5);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_121;
        v53 = v13 - 2;
        v59 = &v39[16 * v13 - 32];
        v61 = *(_QWORD *)v59;
        v60 = *((_QWORD *)v59 + 1);
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_124;
        v65 = &v39[16 * v41];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_127;
        if (__OFADD__(v63, v68))
          goto LABEL_128;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_83:
          if (v69)
            v41 = v53;
          goto LABEL_85;
        }
LABEL_77:
        if ((v64 & 1) != 0)
          goto LABEL_123;
        v72 = &v39[16 * v41];
        v74 = *(_QWORD *)v72;
        v73 = *((_QWORD *)v72 + 1);
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_126;
        if (v75 < v63)
          goto LABEL_15;
LABEL_85:
        v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
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
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_142;
        v81 = v12;
        v82 = &v39[16 * v80];
        v83 = *(_QWORD *)v82;
        v84 = &v39[16 * v41];
        v85 = *((_QWORD *)v84 + 1);
        sub_211A2B9C0((char *)(v11 + 24 * *(_QWORD *)v82), (char *)(v11 + 24 * *(_QWORD *)v84), v11 + 24 * v85, __dst);
        if (v1)
          goto LABEL_93;
        if (v85 < v83)
          goto LABEL_116;
        if (v41 > *((_QWORD *)v81 + 2))
          goto LABEL_117;
        *(_QWORD *)v82 = v83;
        *(_QWORD *)&v39[16 * v80 + 8] = v85;
        v86 = *((_QWORD *)v81 + 2);
        if (v41 >= v86)
          goto LABEL_118;
        v12 = v81;
        v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((_QWORD *)v81 + 2) = v86 - 1;
        v11 = v110;
        if (v86 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v108;
    v3 = v109;
    if (v10 >= v109)
    {
      v9 = v107;
      goto LABEL_102;
    }
  }
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
LABEL_144:
  __break(1u);
LABEL_145:
  result = sub_211A48090();
  __break(1u);
  return result;
}

uint64_t sub_211A2B9C0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  unint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  uint64_t result;
  char *v24;
  const void *v25;
  char *v26;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  v26 = __src;
  v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst)
        memmove(__dst, a2, 24 * v11);
      v17 = &v4[24 * v11];
      v24 = v17;
      v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        v18 = a3 - 24;
        do
        {
          v19 = (char *)(v18 + 24);
          if (*((_QWORD *)v17 - 1) >= *((_QWORD *)v6 - 1))
          {
            v24 = v17 - 24;
            if (v19 < v17 || v18 >= (unint64_t)v17 || v19 != v17)
            {
              v22 = *(_OWORD *)(v17 - 24);
              *(_QWORD *)(v18 + 16) = *((_QWORD *)v17 - 1);
              *(_OWORD *)v18 = v22;
            }
            v20 = v6;
            v17 -= 24;
            if (v6 <= v7)
              break;
          }
          else
          {
            v20 = v6 - 24;
            if (v19 != v6 || v18 >= (unint64_t)v6)
            {
              v21 = *(_OWORD *)v20;
              *(_QWORD *)(v18 + 16) = *((_QWORD *)v6 - 1);
              *(_OWORD *)v18 = v21;
            }
            v26 = v6 - 24;
            if (v20 <= v7)
              break;
          }
          v18 -= 24;
          v6 = v20;
        }
        while (v17 > v4);
      }
LABEL_40:
      sub_2119BA378((void **)&v26, &v25, &v24);
      return 1;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst)
      memmove(__dst, __src, 24 * v9);
    v12 = &v4[24 * v9];
    v24 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      v13 = v4;
      while (1)
      {
        if (*((_QWORD *)v6 + 2) >= *((_QWORD *)v13 + 2))
        {
          v4 = v13 + 24;
          v15 = v13;
          v14 = v6;
          if (v7 == v13)
          {
            v13 += 24;
            if (v7 < v4)
              goto LABEL_18;
          }
          else
          {
            v13 += 24;
          }
        }
        else
        {
          v14 = v6 + 24;
          v15 = v6;
          if (v7 == v6 && v7 < v14)
            goto LABEL_18;
        }
        v16 = *(_OWORD *)v15;
        *((_QWORD *)v7 + 2) = *((_QWORD *)v15 + 2);
        *(_OWORD *)v7 = v16;
LABEL_18:
        v7 += 24;
        if (v13 < v12)
        {
          v6 = v14;
          if ((unint64_t)v14 < a3)
            continue;
        }
        v25 = v4;
        v26 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  result = sub_211A480D8();
  __break(1u);
  return result;
}

uint64_t _s7FMFCore15FMFActionsErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2;
  char v3;
  char v5;
  char v6;
  char v7;

  v2 = *(double *)a1;
  v3 = *(_BYTE *)(a2 + 8);
  if (*(_BYTE *)(a1 + 9) == 1)
    return ((uint64_t (*)(void))((char *)&loc_211A2BCB0 + 4 * byte_211A51584[*(_QWORD *)&v2]))();
  if ((*(_BYTE *)(a2 + 9) & 1) != 0)
    return 0;
  v5 = *(_BYTE *)(a1 + 8);
  v6 = v5 | v3;
  v7 = v5 & v3;
  if ((v6 & 1) == 0)
    v7 = v2 == *(double *)a2;
  return v7 & 1;
}

void sub_211A2BD44(unint64_t a1@<X8>)
{
  unint64_t v1;
  int v2;

  if (v2)
  {
    if (__PAIR128__(a1, v1) >= 7)
      JUMPOUT(0x211A2BD54);
  }
  JUMPOUT(0x211A2BD3CLL);
}

unint64_t sub_211A2BD64()
{
  unint64_t result;

  result = qword_254ACE930;
  if (!qword_254ACE930)
  {
    result = MEMORY[0x212BE47C8](&protocol conformance descriptor for FMFActionStatus, &type metadata for FMFActionStatus);
    atomic_store(result, (unint64_t *)&qword_254ACE930);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FMFActionStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_211A2BDF4 + 4 * byte_211A51591[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_211A2BE28 + 4 * byte_211A5158C[v4]))();
}

uint64_t sub_211A2BE28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A2BE30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x211A2BE38);
  return result;
}

uint64_t sub_211A2BE44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x211A2BE4CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_211A2BE50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A2BE58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMFActionStatus()
{
  return &type metadata for FMFActionStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for FMFActionsError(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMFActionsError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 10))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FMFActionsError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_WORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 10) = v3;
  return result;
}

uint64_t sub_211A2BED8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_211A2BEF4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    *(_BYTE *)(result + 9) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMFActionsError()
{
  return &type metadata for FMFActionsError;
}

uint64_t sub_211A2BF28()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A2BF34(void *a1, void *a2)
{
  uint64_t *v2;

  return sub_211A25AC0(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_211A2BF40()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_211A2BF7C()
{
  uint64_t v0;

  sub_211A25CE8(*(id *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(void **, uint64_t))(v0 + 40));
}

unint64_t sub_211A2BF8C()
{
  unint64_t result;

  result = qword_254ACEAE0;
  if (!qword_254ACEAE0)
  {
    result = MEMORY[0x212BE47C8](&protocol conformance descriptor for FMFActionsError, &type metadata for FMFActionsError);
    atomic_store(result, (unint64_t *)&qword_254ACEAE0);
  }
  return result;
}

uint64_t sub_211A2BFD0()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

void sub_211A2BFDC(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_211A24A38(a1, a2, *(uint64_t **)(v2 + 16), *(void (**)(uint64_t *, void *))(v2 + 24));
}

uint64_t sub_211A2BFE8()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A2BFF4(uint64_t a1)
{
  uint64_t v1;

  return sub_211A243A8(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t *, uint64_t))(v1 + 24));
}

uint64_t sub_211A2C000()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A2C00C(void *a1)
{
  uint64_t v1;

  return sub_211A23818(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t *, void *))(v1 + 24));
}

uint64_t sub_211A2C018()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A2C024(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A23C14(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t *, void *))(v2 + 24), *(_QWORD *)(v2 + 32), "%s: Removed labels.", MEMORY[0x24BEE7928], "%s: error when removing labels: %s");
}

uint64_t sub_211A2C058(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_211958C38(&qword_254AC8CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_211A2C0A0()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

void sub_211A2C0AC(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_211A22CB4(a1, a2, *(uint64_t **)(v2 + 16), *(void (**)(uint64_t *, void *))(v2 + 24), *(void (**)(uint64_t *, void *))(v2 + 32));
}

uint64_t sub_211A2C0B8()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

void sub_211A2C0C4()
{
  uint64_t v0;

  sub_2119F7D98(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_211A2C0D4(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A1D880(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32));
}

uint64_t sub_211A2C0E4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_211963DB0;
  return sub_211A1CD30(a1, v4, v5, v6, v7, v8, v9, v10);
}

unint64_t sub_211A2C178()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254ACEB20;
  if (!qword_254ACEB20)
  {
    v1 = sub_211911824(255, (unint64_t *)&qword_254AC8CC0);
    result = MEMORY[0x212BE47C8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254ACEB20);
  }
  return result;
}

void sub_211A2C1D0(int64_t a1, uint64_t *p_type, void *a3)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  int64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  int64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  _QWORD *v66;
  void *v67;
  uint64_t v68;
  char *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t *v76;
  int64_t v77;
  __int128 aBlock;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  char v85;

  v6 = sub_211958C38(&qword_254AC9FD0);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (uint64_t)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_211958C38((uint64_t *)&unk_254AC8CB0);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_211958C38(&qword_254ACA278);
  MEMORY[0x24BDAC7A8](v14, v15);
  v76 = (uint64_t *)((char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = sub_211958C38(&qword_254AC8870);
  MEMORY[0x24BDAC7A8](v17, v18);
  v75 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for FMFFriend();
  v73 = *(_QWORD *)(v20 - 8);
  v74 = v20;
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = (uint64_t *)((char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = a3;
  v25 = qword_254AC7B80;
  v26 = a3;
  if (v25 == -1)
    goto LABEL_2;
LABEL_38:
  swift_once();
LABEL_2:
  v27 = sub_211A47748();
  v28 = sub_21194F3E0(v27, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v72 = v28;
  v29 = sub_211A47724();
  v30 = sub_211A47D30();
  v31 = os_log_type_enabled(v29, v30);
  v77 = a1;
  if (v31)
  {
    v69 = v13;
    v32 = swift_slowAlloc();
    v71 = v24;
    v33 = (uint8_t *)v32;
    v34 = swift_slowAlloc();
    v70 = v23;
    v35 = v34;
    *(_QWORD *)&aBlock = v34;
    *(_DWORD *)v33 = 136315138;
    v84 = *p_type;
    sub_211958C38(&qword_254ACEAD8);
    v36 = sub_211A47928();
    v84 = sub_211950A9C(v36, v37, (uint64_t *)&aBlock);
    v13 = v69;
    a1 = v77;
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v29, v30, "%s: stop sharing action initiated", v33, 0xCu);
    swift_arrayDestroy();
    v38 = v35;
    v23 = v70;
    MEMORY[0x212BE48A0](v38, -1, -1);
    v39 = v33;
    v24 = v71;
    MEMORY[0x212BE48A0](v39, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(p_type[13] + 40) == 1)
  {
    v40 = sub_211A47724();
    v41 = sub_211A47D24();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_21190D000, v40, v41, "Action is restricted. Returning with error", v42, 2u);
      MEMORY[0x212BE48A0](v42, -1, -1);
    }

    dispatch_group_leave((dispatch_group_t)v26);
    goto LABEL_36;
  }
  v43 = a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend;
  v44 = a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend;
  v45 = v75;
  sub_211934794(v44, (uint64_t)v75, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  (*(void (**)(id, _QWORD, uint64_t, uint64_t))(v73 + 56))(v45, 0, 1, v74);
  v46 = type metadata accessor for FMFIntermediateFriend();
  v47 = (uint64_t)v76;
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v76, 1, 1, v46);
  v84 = 0;
  v85 = 1;
  v82 = 1;
  v83 = 0;
  v48 = type metadata accessor for FMFLocation();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v13, 1, 1, v48);
  v81 = 0;
  v79 = 0u;
  v80 = 0u;
  aBlock = 0u;
  sub_211956D54((uint64_t)v45, v47, (unint64_t)&v84, (uint64_t)&v82, (uint64_t)v13, 0, 1, (uint64_t *)&aBlock, v23, 0, 0, 2u, 2u, 2);
  LOBYTE(aBlock) = 3;
  sub_2119F8570((uint64_t)v23, &aBlock);
  v49 = sub_211A46F08();
  *((_QWORD *)&v79 + 1) = v49;
  *(_QWORD *)&v80 = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
  v50 = sub_211969B08((uint64_t *)&aBlock);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v50, *MEMORY[0x24BE319C8], v49);
  LOBYTE(v49) = MEMORY[0x212BE2D10](&aBlock);
  sub_211931C34((uint64_t)&aBlock);
  if ((v49 & 1) != 0)
  {
    v51 = swift_bridgeObjectRetain();
    v52 = sub_211A1B898(v51);
    swift_bridgeObjectRelease();
    v53 = sub_211A1A794(v52);
    swift_bridgeObjectRelease();
    v54 = sub_211A47B8C();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v9, 1, 1, v54);
    v55 = (_QWORD *)swift_allocObject();
    v55[2] = 0;
    v55[3] = 0;
    v55[4] = v53;
    v55[5] = p_type;
    v55[6] = v77;
    v55[7] = sub_211A334A4;
    v55[8] = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2119E2088(v9, (uint64_t)&unk_254ACEB70, (uint64_t)v55);
    swift_release();
LABEL_35:
    sub_211934758((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
LABEL_36:
    swift_release();
    return;
  }
  v84 = MEMORY[0x24BEE4B08];
  v13 = *(char **)(v43 + 32);
  v56 = v77;
  if (!*((_QWORD *)v13 + 2))
  {
LABEL_34:
    v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2FED0]), sel_init);
    sub_211A1D45C(v84);
    swift_bridgeObjectRelease();
    v65 = (void *)sub_211A47C34();
    swift_bridgeObjectRelease();
    v66 = (_QWORD *)swift_allocObject();
    v66[2] = p_type;
    v66[3] = v56;
    v66[4] = sub_211A334A4;
    v66[5] = v24;
    *(_QWORD *)&v80 = sub_211A334B0;
    *((_QWORD *)&v80 + 1) = v66;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v79 = sub_211A1E82C;
    *((_QWORD *)&v79 + 1) = &unk_24CCCF058;
    v67 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v64, sel_stopSharingMyLocationWithHandles_groupId_callerId_completion_, v65, 0, 0, v67);
    _Block_release(v67);

    goto LABEL_35;
  }
  v75 = (char *)v26;
  v76 = p_type;
  v70 = v23;
  v71 = v24;
  v24 = (uint64_t)(v13 + 56);
  v57 = 1 << v13[32];
  v58 = -1;
  if (v57 < 64)
    v58 = ~(-1 << v57);
  v9 = v58 & *((_QWORD *)v13 + 7);
  a1 = (unint64_t)(v57 + 63) >> 6;
  swift_bridgeObjectRetain();
  v26 = 0;
  v23 = (_QWORD *)0x24BE2F000;
  p_type = (uint64_t *)&stru_24CCDDFF0.type;
  if (v9)
  {
LABEL_15:
    v9 &= v9 - 1;
    goto LABEL_30;
  }
  while (1)
  {
    v59 = v26 + 1;
    if (__OFADD__(v26, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v59 >= a1)
      goto LABEL_33;
    v60 = *(_QWORD *)(v24 + 8 * v59);
    ++v26;
    if (!v60)
    {
      v26 = v59 + 1;
      if (v59 + 1 >= a1)
        goto LABEL_33;
      v60 = *(_QWORD *)(v24 + 8 * v26);
      if (!v60)
      {
        v26 = v59 + 2;
        if (v59 + 2 >= a1)
          goto LABEL_33;
        v60 = *(_QWORD *)(v24 + 8 * v26);
        if (!v60)
          break;
      }
    }
LABEL_29:
    v9 = (v60 - 1) & v60;
LABEL_30:
    swift_bridgeObjectRetain();
    v62 = (void *)sub_211A478EC();
    swift_bridgeObjectRelease();
    v63 = objc_msgSend((id)objc_opt_self(), sel_handleWithId_, v62);

    if (!v63)
      goto LABEL_40;
    sub_211A2712C(&aBlock, v63);

    if (v9)
      goto LABEL_15;
  }
  v61 = v59 + 3;
  if (v61 >= a1)
  {
LABEL_33:
    swift_release();
    v23 = v70;
    v24 = v71;
    p_type = v76;
    v56 = v77;
    goto LABEL_34;
  }
  v60 = *(_QWORD *)(v24 + 8 * v61);
  if (v60)
  {
    v26 = v61;
    goto LABEL_29;
  }
  while (1)
  {
    v26 = v61 + 1;
    if (__OFADD__(v61, 1))
      break;
    if (v26 >= a1)
      goto LABEL_33;
    v60 = *(_QWORD *)(v24 + 8 * v26);
    ++v61;
    if (v60)
      goto LABEL_29;
  }
  __break(1u);
LABEL_40:

  __break(1u);
}

uint64_t sub_211A2CAB0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  NSObject *v42;
  dispatch_group_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  NSObject *v53;
  uint64_t v54;
  int64_t v55;
  dispatch_group_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(NSObject *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  NSObject *v65;
  dispatch_group_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(NSObject *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  NSObject *v75;
  dispatch_group_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(_QWORD *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  NSObject *v87;
  _QWORD *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  dispatch_group_t v97;
  uint64_t *v98;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  dispatch_group_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t aBlock[7];

  v112 = a1;
  v11 = sub_211A4779C();
  v107 = *(_QWORD *)(v11 - 8);
  v108 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v106 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_211A477D8();
  v104 = *(_QWORD *)(v14 - 8);
  v105 = v14;
  MEMORY[0x24BDAC7A8](v14, v15);
  v103 = (char *)&v100 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for FMFFriend();
  MEMORY[0x24BDAC7A8](v17, v18);
  v101 = (uint64_t)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v113 = v20;
  v21 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v21 != -1)
    swift_once();
  v22 = sub_211A47748();
  v23 = sub_21194F3E0(v22, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v111 = v23;
  v24 = sub_211A47724();
  v25 = sub_211A47D30();
  if (os_log_type_enabled(v24, v25))
  {
    v102 = (uint64_t)a5;
    v26 = swift_slowAlloc();
    v110 = a6;
    v27 = (uint8_t *)v26;
    v28 = swift_slowAlloc();
    v109 = a4;
    v29 = v28;
    *(_DWORD *)v27 = 136315138;
    v114 = *a2;
    aBlock[0] = v28;
    sub_211958C38(&qword_254ACEAD8);
    v30 = sub_211A47928();
    v114 = sub_211950A9C(v30, v31, aBlock);
    a5 = (uint64_t (*)(uint64_t *, void *))v102;
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v24, v25, "%s: removeFriend action initiated", v27, 0xCu);
    swift_arrayDestroy();
    v32 = v29;
    a4 = v109;
    MEMORY[0x212BE48A0](v32, -1, -1);
    v33 = v27;
    a6 = v110;
    MEMORY[0x212BE48A0](v33, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v34 = sub_211A47724();
    v35 = sub_211A47D24();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_21190D000, v34, v35, "Action is restricted. Returning with error", v36, 2u);
      MEMORY[0x212BE48A0](v36, -1, -1);
    }

    LOBYTE(aBlock[0]) = 0;
    sub_211A2BF8C();
    v37 = (void *)swift_allocError();
    *(_QWORD *)v38 = 5;
    *(_WORD *)(v38 + 8) = 256;
    sub_2119E6188((char *)aBlock, v37, a3, a4, a5, (uint64_t)a6);

  }
  else
  {
    v39 = a2[6];
    v40 = (uint64_t *)(v112 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
    sub_2119F8ECC(v112 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
    v111 = dispatch_group_create();
    v102 = swift_allocObject();
    *(_QWORD *)(v102 + 16) = 0;
    v41 = *(int *)(v17 + 36);
    v110 = v40;
    v42 = *(NSObject **)((char *)v40 + v41);
    v109 = (uint64_t)v42;
    if ((v42 & 1) != 0)
    {
      v43 = v111;
      dispatch_group_enter(v111);
      v45 = *v110;
      v44 = v110[1];
      type metadata accessor for FMFRemoveFriendRequest();
      v46 = (uint64_t *)(swift_allocObject() + qword_254ADC8D0);
      *v46 = v45;
      v46[1] = v44;
      swift_bridgeObjectRetain();
      v47 = sub_21193BD18();
      v100 = v39;
      v48 = a2[11];
      v49 = a2[12];
      sub_211931DB4(a2 + 8, v48);
      v50 = swift_allocObject();
      *(_QWORD *)(v50 + 16) = v102;
      *(_QWORD *)(v50 + 24) = v43;
      v51 = *(void (**)(_QWORD *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 64);
      refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      v53 = v43;
      v51(v47, sub_211A34084, v50, refreshed, v48, v49);
      swift_release();
      swift_release();
      dispatch_group_enter(v53);
      v54 = v101;
      sub_211934794((uint64_t)v110, v101, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      type metadata accessor for FMFStopSharingAction();
      v55 = swift_allocObject();
      sub_211942810(v54, v55 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      *(_BYTE *)(v55 + 16) = 1;
      v42 = v53;
      sub_211A2C1D0(v55, a2, v42);
      swift_release();

      LOBYTE(v42) = v109;
    }
    v100 = swift_allocObject();
    *(_QWORD *)(v100 + 16) = 0;
    if ((v42 & 2) != 0)
    {
      v56 = v111;
      dispatch_group_enter(v111);
      v57 = *v110;
      v58 = v110[1];
      sub_2119F587C(*v110, v58);
      type metadata accessor for FMFRemoveFriendRequest();
      v59 = (uint64_t *)(swift_allocObject() + qword_254ADC8D0);
      *v59 = v57;
      v59[1] = v58;
      swift_bridgeObjectRetain();
      v42 = sub_21193BD18();
      v60 = a2[11];
      v61 = a2[12];
      v101 = (uint64_t)sub_211931DB4(a2 + 8, v60);
      v62 = swift_allocObject();
      *(_QWORD *)(v62 + 16) = v100;
      *(_QWORD *)(v62 + 24) = v56;
      v63 = *(void (**)(NSObject *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 64);
      v64 = type metadata accessor for FMFInitRefreshClientResponse();
      v65 = v56;
      swift_retain();
      v63(v42, sub_211A33464, v62, v64, v60, v61);
      LOBYTE(v42) = v109;
      swift_release();
      swift_release();
    }
    v101 = swift_allocObject();
    *(_QWORD *)(v101 + 16) = 0;
    if ((v42 & 4) != 0)
    {
      v66 = v111;
      dispatch_group_enter(v111);
      v68 = *v110;
      v67 = v110[1];
      type metadata accessor for FMFRemoveFriendRequest();
      v69 = (uint64_t *)(swift_allocObject() + qword_254ADC8D0);
      *v69 = v68;
      v69[1] = v67;
      swift_bridgeObjectRetain();
      v42 = sub_21193BD18();
      v70 = a2[11];
      v71 = a2[12];
      sub_211931DB4(a2 + 8, v70);
      v72 = swift_allocObject();
      *(_QWORD *)(v72 + 16) = v101;
      *(_QWORD *)(v72 + 24) = v66;
      v73 = *(void (**)(NSObject *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 64);
      v74 = type metadata accessor for FMFInitRefreshClientResponse();
      v75 = v66;
      swift_retain();
      v73(v42, sub_211A34084, v72, v74, v70, v71);
      LOBYTE(v42) = v109;
      swift_release();
      swift_release();
    }
    v109 = swift_allocObject();
    *(_QWORD *)(v109 + 16) = 0;
    if ((v42 & 8) != 0)
    {
      v76 = v111;
      dispatch_group_enter(v111);
      v78 = *v110;
      v77 = v110[1];
      type metadata accessor for FMFRespondToInviteRequest();
      v79 = swift_allocObject();
      v80 = (uint64_t *)(v79 + qword_254ADC770);
      *v80 = v78;
      v80[1] = v77;
      *(_BYTE *)(v79 + qword_254ADC778) = 0;
      swift_bridgeObjectRetain();
      v81 = sub_21193BD18();
      v82 = a2[11];
      v83 = a2[12];
      sub_211931DB4(a2 + 8, v82);
      v84 = swift_allocObject();
      *(_QWORD *)(v84 + 16) = v109;
      *(_QWORD *)(v84 + 24) = v76;
      v85 = *(void (**)(_QWORD *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t))(v83 + 64);
      v86 = type metadata accessor for FMFInitRefreshClientResponse();
      v87 = v76;
      swift_retain();
      v85(v81, sub_211A34084, v84, v86, v82, v83);
      swift_release();
      swift_release();
    }
    sub_211911824(0, (unint64_t *)&qword_254ACC300);
    v110 = (uint64_t *)sub_211A47D9C();
    v88 = (_QWORD *)swift_allocObject();
    v89 = v101;
    v88[2] = v102;
    v88[3] = a2;
    v90 = v113;
    v88[4] = v112;
    v88[5] = sub_211A34060;
    v91 = v100;
    v88[6] = v90;
    v88[7] = v91;
    v92 = v109;
    v88[8] = v89;
    v88[9] = v92;
    aBlock[4] = (uint64_t)sub_211A33444;
    aBlock[5] = (uint64_t)v88;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21192382C;
    aBlock[3] = (uint64_t)&unk_24CCCEF40;
    v93 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v94 = v103;
    sub_211A477B4();
    v114 = MEMORY[0x24BEE4AF8];
    sub_211910908((unint64_t *)&qword_254ACC340, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    sub_211958C38((uint64_t *)&unk_254ACC1D0);
    sub_211969B94();
    v95 = v106;
    v96 = v108;
    sub_211A47EA4();
    v98 = v110;
    v97 = v111;
    sub_211A47D48();
    _Block_release(v93);

    (*(void (**)(char *, uint64_t))(v107 + 8))(v95, v96);
    (*(void (**)(char *, uint64_t))(v104 + 8))(v94, v105);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_211A2D570(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  void (*v52)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  void *v54;
  uint64_t v55;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  v12 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  v61 = a6;
  swift_retain();
  if (v12 != -1)
    swift_once();
  v13 = sub_211A47748();
  sub_21194F3E0(v13, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v14 = sub_211A47724();
  v15 = sub_211A47D30();
  v60 = a3;
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v62 = v17;
    *(_DWORD *)v16 = 136315138;
    sub_211958C38(&qword_254ACEAD8);
    v18 = sub_211A47928();
    sub_211950A9C(v18, v19, &v62);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v14, v15, "%s: ShowHideLocation: action initiated", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v17, -1, -1);
    MEMORY[0x212BE48A0](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v20 = sub_211A47724();
    v21 = sub_211A47D24();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21190D000, v20, v21, "Action is restricted. Returning with error", v22, 2u);
      MEMORY[0x212BE48A0](v22, -1, -1);
    }

    LOBYTE(v62) = 0;
    sub_211A2BF8C();
    v24 = (void *)swift_allocError();
    v25 = 5;
    goto LABEL_21;
  }
  sub_211958C38(&qword_254AC97A0);
  sub_211A47DA8();
  v26 = v64;
  if (!v64)
  {
    swift_retain_n();
    v37 = sub_211A47724();
    v38 = sub_211A47D30();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v62 = v40;
      *(_DWORD *)v39 = 136315138;
      sub_211958C38(&qword_254ACEAD8);
      v41 = sub_211A47928();
      sub_211950A9C(v41, v42, &v62);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v37, v38, "%s: ShowHideLocation: Operation cannot be completed if no prefs exist in store.", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v40, -1, -1);
      MEMORY[0x212BE48A0](v39, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v62) = 0;
    sub_211A2BF8C();
    v24 = (void *)swift_allocError();
    v25 = 2;
LABEL_21:
    *(_QWORD *)v23 = v25;
    *(_WORD *)(v23 + 8) = 256;
    v54 = v24;
    v55 = a3;
LABEL_22:
    sub_2119E6188((char *)&v62, v54, v55, a4, a5, v61);

    return swift_release();
  }
  v58 = a2;
  v27 = v62;
  v28 = v63;
  v29 = v65;
  v30 = *(unsigned __int8 *)(a1 + 17);
  if (((((v62 & 0x100) == 0) ^ v30) & 1) != 0)
  {
    sub_21195A23C(v62, v63, v64);
    swift_retain_n();
    v31 = sub_211A47724();
    v32 = sub_211A47D30();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v62 = v34;
      *(_DWORD *)v33 = 136315138;
      sub_211958C38(&qword_254ACEAD8);
      v35 = sub_211A47928();
      sub_211950A9C(v35, v36, &v62);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v31, v32, "%s: ShowHideLocation: Existing value of hideLocation is not different. Skipping action.", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v34, -1, -1);
      MEMORY[0x212BE48A0](v33, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v62) = 0;
    sub_211A2BF8C();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v57 = 2;
    *(_WORD *)(v57 + 8) = 256;
    v54 = v24;
    v55 = v60;
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21195A23C(v27, v28, v26);
  v43 = 256;
  if (!v30)
    v43 = 0;
  v44 = v43 | v27 & 0xFF010001;
  type metadata accessor for FMFSavePrefsRequest();
  v45 = swift_allocObject();
  *(_BYTE *)(v45 + qword_254AC9740) = 1;
  v46 = (uint64_t *)(v45 + qword_254AC9738);
  *v46 = v44;
  v46[1] = v28;
  v46[2] = v26;
  v46[3] = v29;
  v47 = (_QWORD *)(v45 + qword_254AC9748);
  *v47 = 0;
  v47[1] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v48 = sub_21193BD18();
  v62 = v44;
  v63 = v28;
  v64 = v26;
  v65 = v29;
  sub_2119F986C(&v62, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v49 = v58[11];
  v50 = v58[12];
  sub_211931DB4(v58 + 8, v49);
  v51 = (_QWORD *)swift_allocObject();
  v51[2] = v58;
  v51[3] = sub_211A34060;
  v51[4] = v11;
  v52 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v50 + 64);
  refreshed = type metadata accessor for FMFInitRefreshClientResponse();
  swift_retain();
  swift_retain();
  v52(v48, sub_211A33564, v51, refreshed, v49, v50);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_211A2DD88(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  void (*v56)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t (*v61)(uint64_t *, void *);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  char *v67;
  _QWORD *v68;
  uint64_t v69;
  _OWORD v70[3];
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  char v75;

  v69 = a1;
  v11 = sub_211958C38((uint64_t *)&unk_254AC8CB0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_211958C38(&qword_254ACA278);
  MEMORY[0x24BDAC7A8](v15, v16);
  v67 = (char *)v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_211958C38(&qword_254AC8870);
  MEMORY[0x24BDAC7A8](v18, v19);
  v65 = (uint64_t)v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for FMFFriend();
  v63 = *(_QWORD *)(v21 - 8);
  v64 = v21;
  MEMORY[0x24BDAC7A8](v21, v22);
  v68 = (_QWORD *)((char *)v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = a3;
  v24[3] = a4;
  v24[4] = a5;
  v24[5] = a6;
  v25 = qword_254AC7B80;
  v66 = a3;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v25 != -1)
    swift_once();
  v26 = sub_211A47748();
  v27 = sub_21194F3E0(v26, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v28 = sub_211A47724();
  v29 = sub_211A47D30();
  if (os_log_type_enabled(v28, v29))
  {
    v59[1] = v27;
    v30 = swift_slowAlloc();
    v60 = a4;
    v31 = (uint8_t *)v30;
    v32 = swift_slowAlloc();
    v61 = a5;
    v33 = v32;
    *(_QWORD *)&v70[0] = v32;
    v62 = a6;
    *(_DWORD *)v31 = 136315138;
    v74 = *a2;
    sub_211958C38(&qword_254ACEAD8);
    v34 = sub_211A47928();
    v74 = sub_211950A9C(v34, v35, (uint64_t *)v70);
    a6 = v62;
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v28, v29, "%s: stop following action initiated", v31, 0xCu);
    swift_arrayDestroy();
    v36 = v33;
    a5 = v61;
    MEMORY[0x212BE48A0](v36, -1, -1);
    v37 = v31;
    a4 = v60;
    MEMORY[0x212BE48A0](v37, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v38 = sub_211A47724();
    v39 = sub_211A47D24();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_21190D000, v38, v39, "Action is restricted. Returning with error", v40, 2u);
      MEMORY[0x212BE48A0](v40, -1, -1);
    }

    LOBYTE(v70[0]) = 0;
    sub_211A2BF8C();
    v41 = (void *)swift_allocError();
    *(_QWORD *)v42 = 5;
    *(_WORD *)(v42 + 8) = 256;
    sub_2119E6188((char *)v70, v41, (uint64_t)v66, a4, a5, a6);

  }
  else
  {
    v43 = v69;
    v44 = v69 + OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend;
    v46 = *(_QWORD *)(v69 + OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend);
    v45 = *(_QWORD *)(v69 + OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend + 8);
    type metadata accessor for FMFRemoveFriendRequest();
    v47 = (uint64_t *)(swift_allocObject() + qword_254ADC8D0);
    *v47 = v46;
    v47[1] = v45;
    swift_bridgeObjectRetain();
    v66 = sub_21193BD18();
    v48 = v65;
    sub_211934794(v44, v65, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v63 + 56))(v48, 0, 1, v64);
    v49 = type metadata accessor for FMFIntermediateFriend();
    v50 = (uint64_t)v67;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v67, 1, 1, v49);
    v74 = 0;
    v75 = 1;
    v72 = 2;
    v73 = 0;
    v51 = type metadata accessor for FMFLocation();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v14, 1, 1, v51);
    v71 = 0;
    memset(v70, 0, sizeof(v70));
    v52 = v68;
    sub_211956D54(v48, v50, (unint64_t)&v74, (uint64_t)&v72, (uint64_t)v14, 0, 1, (uint64_t *)v70, v68, 0, 0, 2u, 2u, 2);
    LOBYTE(v70[0]) = 5;
    sub_2119F8570((uint64_t)v52, v70);
    sub_2119F587C(v46, v45);
    v53 = a2[11];
    v54 = a2[12];
    sub_211931DB4(a2 + 8, v53);
    v55 = (_QWORD *)swift_allocObject();
    v55[2] = a2;
    v55[3] = v43;
    v55[4] = sub_211A34060;
    v55[5] = v24;
    v56 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v54 + 64);
    refreshed = type metadata accessor for FMFInitRefreshClientResponse();
    swift_retain();
    swift_retain();
    swift_retain();
    v56(v66, sub_211A33578, v55, refreshed, v53, v54);
    swift_release();
    swift_release();
    sub_211934758((uint64_t)v52, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  }
  return swift_release();
}

uint64_t sub_211A2E3BC(uint64_t (*a1)(uint64_t *, void *), uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
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
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  _QWORD *v70;
  void *v71;
  uint64_t result;
  uint64_t v73;
  char *v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t *v80;
  uint64_t (*v81)(uint64_t *, void *);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 aBlock;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  char v92;

  v12 = sub_211958C38(&qword_254AC9FD0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v74 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_211958C38((uint64_t *)&unk_254AC8CB0);
  MEMORY[0x24BDAC7A8](v15, v16);
  v80 = (uint64_t *)((char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = sub_211958C38(&qword_254ACA278);
  MEMORY[0x24BDAC7A8](v18, v19);
  v79 = (char *)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_211958C38(&qword_254AC8870);
  MEMORY[0x24BDAC7A8](v21, v22);
  v78 = (uint64_t)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = type metadata accessor for FMFFriend();
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77, v24);
  v26 = (uint64_t)&v73 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = a3;
  v27[3] = a4;
  v81 = a5;
  v27[4] = a5;
  v27[5] = a6;
  v28 = qword_254AC7B80;
  v84 = a3;
  swift_retain();
  v83 = a4;
  swift_retain();
  v82 = a6;
  swift_retain();
  if (v28 == -1)
    goto LABEL_2;
LABEL_38:
  swift_once();
LABEL_2:
  v29 = sub_211A47748();
  v30 = sub_21194F3E0(v29, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v31 = sub_211A47724();
  v32 = sub_211A47D30();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc();
    v73 = v30;
    v34 = (uint8_t *)v33;
    v35 = swift_slowAlloc();
    v75 = v27;
    v36 = v35;
    *(_QWORD *)&aBlock = v35;
    *(_DWORD *)v34 = 136315138;
    v91 = *a2;
    sub_211958C38(&qword_254ACEAD8);
    v37 = sub_211A47928();
    v91 = sub_211950A9C(v37, v38, (uint64_t *)&aBlock);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v31, v32, "%s: stop sharing action initiated", v34, 0xCu);
    swift_arrayDestroy();
    v39 = v36;
    v27 = v75;
    MEMORY[0x212BE48A0](v39, -1, -1);
    MEMORY[0x212BE48A0](v34, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v40 = sub_211A47724();
    v41 = sub_211A47D24();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_21190D000, v40, v41, "Action is restricted. Returning with error", v42, 2u);
      MEMORY[0x212BE48A0](v42, -1, -1);
    }

    LOBYTE(aBlock) = 0;
    sub_211A2BF8C();
    v43 = (void *)swift_allocError();
    *(_QWORD *)v44 = 5;
    *(_WORD *)(v44 + 8) = 256;
    sub_2119E6188((char *)&aBlock, v43, v84, v83, v81, v82);

    return swift_release();
  }
  v45 = (char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend;
  v46 = v78;
  sub_211934794((uint64_t)a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend, v78, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v76 + 56))(v46, 0, 1, v77);
  v47 = type metadata accessor for FMFIntermediateFriend();
  v48 = (uint64_t)v79;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v79, 1, 1, v47);
  v91 = 0;
  v92 = 1;
  v89 = 1;
  v90 = 0;
  v49 = type metadata accessor for FMFLocation();
  v50 = (uint64_t)v80;
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v80, 1, 1, v49);
  v88 = 0;
  v86 = 0u;
  v87 = 0u;
  aBlock = 0u;
  sub_211956D54(v46, v48, (unint64_t)&v91, (uint64_t)&v89, v50, 0, 1, (uint64_t *)&aBlock, (_QWORD *)v26, 0, 0, 2u, 2u, 2);
  LOBYTE(aBlock) = 3;
  sub_2119F8570(v26, &aBlock);
  v51 = sub_211A46F08();
  *((_QWORD *)&v86 + 1) = v51;
  *(_QWORD *)&v87 = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
  v52 = sub_211969B08((uint64_t *)&aBlock);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v52, *MEMORY[0x24BE319C8], v51);
  LOBYTE(v51) = MEMORY[0x212BE2D10](&aBlock);
  sub_211931C34((uint64_t)&aBlock);
  if ((v51 & 1) != 0)
  {
    v53 = swift_bridgeObjectRetain();
    v54 = sub_211A1B898(v53);
    swift_bridgeObjectRelease();
    v55 = sub_211A1A794(v54);
    swift_bridgeObjectRelease();
    v56 = sub_211A47B8C();
    v57 = (uint64_t)v74;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v74, 1, 1, v56);
    v58 = (_QWORD *)swift_allocObject();
    v58[2] = 0;
    v58[3] = 0;
    v58[4] = v55;
    v58[5] = a2;
    v58[6] = a1;
    v58[7] = sub_211A34060;
    v58[8] = v27;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2119E2088(v57, (uint64_t)&unk_254ACEB88, (uint64_t)v58);
    swift_release();
LABEL_35:
    sub_211934758(v26, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    return swift_release();
  }
  v91 = MEMORY[0x24BEE4B08];
  v59 = *((_QWORD *)v45 + 4);
  if (!*(_QWORD *)(v59 + 16))
  {
LABEL_34:
    v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2FED0]), sel_init);
    sub_211A1D45C(v91);
    swift_bridgeObjectRelease();
    v69 = (void *)sub_211A47C34();
    swift_bridgeObjectRelease();
    v70 = (_QWORD *)swift_allocObject();
    v70[2] = a2;
    v70[3] = a1;
    v70[4] = sub_211A34060;
    v70[5] = v27;
    *(_QWORD *)&v87 = sub_211A3403C;
    *((_QWORD *)&v87 + 1) = v70;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v86 = sub_211A1E82C;
    *((_QWORD *)&v86 + 1) = &unk_24CCCF198;
    v71 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v68, sel_stopSharingMyLocationWithHandles_groupId_callerId_completion_, v69, 0, 0, v71);
    _Block_release(v71);

    goto LABEL_35;
  }
  v79 = (char *)v26;
  v80 = a2;
  v81 = a1;
  v75 = v27;
  v27 = (_QWORD *)(v59 + 56);
  v60 = 1 << *(_BYTE *)(v59 + 32);
  v61 = -1;
  if (v60 < 64)
    v61 = ~(-1 << v60);
  v62 = v61 & *(_QWORD *)(v59 + 56);
  a1 = (uint64_t (*)(uint64_t *, void *))((unint64_t)(v60 + 63) >> 6);
  swift_bridgeObjectRetain();
  v26 = 0;
  a2 = (uint64_t *)0x24BE2F000;
  if (v62)
  {
LABEL_15:
    v62 &= v62 - 1;
    goto LABEL_30;
  }
  while (1)
  {
    v63 = v26 + 1;
    if (__OFADD__(v26, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v63 >= (uint64_t)a1)
      goto LABEL_33;
    v64 = v27[v63];
    ++v26;
    if (!v64)
    {
      v26 = v63 + 1;
      if (v63 + 1 >= (uint64_t)a1)
        goto LABEL_33;
      v64 = v27[v26];
      if (!v64)
      {
        v26 = v63 + 2;
        if (v63 + 2 >= (uint64_t)a1)
          goto LABEL_33;
        v64 = v27[v26];
        if (!v64)
          break;
      }
    }
LABEL_29:
    v62 = (v64 - 1) & v64;
LABEL_30:
    swift_bridgeObjectRetain();
    v66 = (void *)sub_211A478EC();
    swift_bridgeObjectRelease();
    v67 = objc_msgSend((id)objc_opt_self(), sel_handleWithId_, v66);

    if (!v67)
      goto LABEL_40;
    sub_211A2712C(&aBlock, v67);

    if (v62)
      goto LABEL_15;
  }
  v65 = v63 + 3;
  if (v65 >= (uint64_t)a1)
  {
LABEL_33:
    swift_release();
    v27 = v75;
    a2 = v80;
    a1 = v81;
    v26 = (uint64_t)v79;
    goto LABEL_34;
  }
  v64 = v27[v65];
  if (v64)
  {
    v26 = v65;
    goto LABEL_29;
  }
  while (1)
  {
    v26 = v65 + 1;
    if (__OFADD__(v65, 1))
      break;
    if (v26 >= (uint64_t)a1)
      goto LABEL_33;
    v64 = v27[v26];
    ++v65;
    if (v64)
      goto LABEL_29;
  }
  __break(1u);
LABEL_40:
  swift_release();
  swift_release();
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_211A2ED44(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), _QWORD *a6)
{
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
  _QWORD *v34;
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
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  int v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t *v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  void *v99;
  uint64_t v100;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  _QWORD *v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  void (*v133)(_QWORD *, uint64_t (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t *, void *);
  _QWORD *v155;
  uint64_t v156;
  _QWORD *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;

  v12 = sub_211958C38(&qword_254AC9FD0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v140 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_211958C38((uint64_t *)&unk_254AC8CB0);
  MEMORY[0x24BDAC7A8](v15, v16);
  v141 = (char *)&v135 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_211958C38(&qword_254ACA278);
  MEMORY[0x24BDAC7A8](v18, v19);
  v144 = (char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_211958C38(&qword_254AC8870);
  MEMORY[0x24BDAC7A8](v21, v22);
  v24 = (char *)&v135 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25, v26);
  v147 = (uint64_t)&v135 - v27;
  v148 = type metadata accessor for FMFFriend();
  v156 = *(_QWORD *)(v148 - 8);
  MEMORY[0x24BDAC7A8](v148, v28);
  v30 = (char *)&v135 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31, v32);
  v34 = (uint64_t *)((char *)&v135 - v33);
  MEMORY[0x24BDAC7A8](v35, v36);
  v143 = (uint64_t)&v135 - v37;
  MEMORY[0x24BDAC7A8](v38, v39);
  v146 = (uint64_t *)((char *)&v135 - v40);
  MEMORY[0x24BDAC7A8](v41, v42);
  v145 = (uint64_t)&v135 - v43;
  v142 = v44;
  MEMORY[0x24BDAC7A8](v45, v46);
  v150 = (uint64_t *)((char *)&v135 - v47);
  v48 = (_QWORD *)swift_allocObject();
  v48[2] = a3;
  v48[3] = a4;
  v154 = a5;
  v48[4] = a5;
  v48[5] = a6;
  v49 = qword_254AC7B80;
  v152 = a3;
  swift_retain();
  v153 = a4;
  swift_retain();
  v155 = a6;
  swift_retain();
  if (v49 != -1)
    swift_once();
  v50 = sub_211A47748();
  v51 = sub_21194F3E0(v50, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  swift_retain_n();
  v151 = v51;
  v52 = sub_211A47724();
  v53 = sub_211A47D30();
  v54 = v53;
  v55 = os_log_type_enabled(v52, v53);
  v157 = a2;
  v149 = v24;
  if (v55)
  {
    v56 = swift_slowAlloc();
    LODWORD(v139) = v54;
    v57 = v56;
    v138 = swift_slowAlloc();
    *(_QWORD *)&v158 = v138;
    *(_DWORD *)v57 = 136315394;
    v164 = *a2;
    sub_211958C38(&qword_254ACEAD8);
    v58 = sub_211A47928();
    v164 = sub_211950A9C(v58, v59, (uint64_t *)&v158);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 12) = 2080;
    v60 = v48;
    v61 = *(_QWORD *)(a1 + 24);
    v62 = *(_QWORD *)(a1 + 32);
    swift_bridgeObjectRetain();
    v164 = sub_211950A9C(v61, v62, (uint64_t *)&v158);
    sub_211A47E2C();
    swift_release_n();
    v48 = v60;
    a2 = v157;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v52, (os_log_type_t)v139, "%s: respond to invite action initiated for friend ID: %s", (uint8_t *)v57, 0x16u);
    v63 = v138;
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v63, -1, -1);
    MEMORY[0x212BE48A0](v57, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v64 = sub_211A47724();
    v65 = sub_211A47D24();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v66 = 0;
      _os_log_impl(&dword_21190D000, v64, v65, "Action is restricted. Returning with error", v66, 2u);
      MEMORY[0x212BE48A0](v66, -1, -1);
    }

    LOBYTE(v158) = 0;
    sub_211A2BF8C();
    v68 = (void *)swift_allocError();
    v69 = 5;
    goto LABEL_29;
  }
  v70 = a2[6];
  sub_211958C38(&qword_254ACABB8);
  v139 = v70;
  sub_211A47DA8();
  v138 = 0;
  v71 = *(_QWORD *)(v158 + 16);
  if (v71)
  {
    v137 = v48;
    v72 = v158 + ((*(unsigned __int8 *)(v156 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80));
    v74 = *(_QWORD *)(a1 + 24);
    v73 = *(_QWORD *)(a1 + 32);
    v136 = a1;
    v75 = *(_QWORD *)(v156 + 72);
    v135 = v158;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_211934794(v72, (uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      v76 = v34[1];
      *(_QWORD *)&v158 = *v34;
      *((_QWORD *)&v158 + 1) = v76;
      v164 = v74;
      v165 = v73;
      sub_21194FDB4();
      v77 = sub_211A47E80();
      sub_211934794((uint64_t)v34, (uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      if ((v77 & 1) != 0)
        break;
      v78 = *((_QWORD *)v30 + 4);
      swift_bridgeObjectRetain();
      LOBYTE(v78) = sub_211A09628(v74, v73, v78);
      swift_bridgeObjectRelease();
      sub_211934758((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      if ((v78 & 1) != 0)
        goto LABEL_18;
      sub_211934758((uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      v72 += v75;
      if (!--v71)
      {
        swift_bridgeObjectRelease();
        v48 = v137;
        a2 = v157;
        a1 = v136;
        goto LABEL_16;
      }
    }
    sub_211934758((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
LABEL_18:
    swift_bridgeObjectRelease();
    v81 = v147;
    sub_211942810((uint64_t)v34, v147, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    v79 = v156;
    v80 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v156 + 56);
    v82 = v148;
    v80(v81, 0, 1, v148);
    v48 = v137;
    a2 = v157;
    a1 = v136;
  }
  else
  {
LABEL_16:
    v79 = v156;
    v80 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v156 + 56);
    v81 = v147;
    v82 = v148;
    v80(v147, 1, 1, v148);
  }
  swift_bridgeObjectRelease();
  v83 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 48))(v81, 1, v82);
  v84 = v150;
  v85 = (uint64_t)v149;
  if (v83 == 1)
  {
    sub_211923EE8(v81, &qword_254AC8870);
    swift_retain_n();
    v86 = sub_211A47724();
    v87 = sub_211A47D24();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc();
      v89 = a2;
      v90 = swift_slowAlloc();
      *(_QWORD *)&v158 = v90;
      *(_DWORD *)v88 = 136315138;
      v164 = *v89;
      sub_211958C38(&qword_254ACEAD8);
      v91 = sub_211A47928();
      v164 = sub_211950A9C(v91, v92, (uint64_t *)&v158);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v86, v87, "%s: Friend not present right now. Action may be triggered from notification", v88, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v90, -1, -1);
      MEMORY[0x212BE48A0](v88, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v158) = 0;
    sub_211A2BF8C();
    v68 = (void *)swift_allocError();
    v69 = 1;
LABEL_29:
    *(_QWORD *)v67 = v69;
    *(_WORD *)(v67 + 8) = 256;
    sub_2119E6188((char *)&v158, v68, v152, v153, v154, (uint64_t)v155);

    return swift_release();
  }
  sub_211942810(v81, (uint64_t)v150, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  v93 = *(uint64_t *)((char *)v84 + *(int *)(v82 + 36));
  v94 = v145;
  sub_211934794((uint64_t)v84, v145, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  if ((v93 & 8) != 0)
  {
    sub_211934758(v94, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    goto LABEL_32;
  }
  v95 = *(_QWORD *)(v94 + *(int *)(v82 + 36));
  sub_211934758(v94, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  if ((v95 & 2) != 0)
  {
LABEL_32:
    v102 = *(unsigned __int8 *)(a1 + 40);
    sub_211934794((uint64_t)v84, v85, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    v80(v85, 0, 1, v82);
    v103 = type metadata accessor for FMFIntermediateFriend();
    v104 = (uint64_t)v144;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v103 - 8) + 56))(v144, 1, 1, v103);
    if (v102 == 1)
    {
      v164 = 1;
      LOBYTE(v165) = 0;
      v162 = 0;
      v163 = 1;
    }
    else
    {
      v164 = 0;
      LOBYTE(v165) = 1;
      v162 = 8;
      v163 = 0;
    }
    v105 = type metadata accessor for FMFLocation();
    v106 = (uint64_t)v141;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56))(v141, 1, 1, v105);
    v161 = 0;
    v159 = 0u;
    v160 = 0u;
    v158 = 0u;
    v107 = v146;
    sub_211956D54(v85, v104, (unint64_t)&v164, (uint64_t)&v162, v106, 0, 1, (uint64_t *)&v158, v146, 0, 0, 2u, 2u, 2);
    LOBYTE(v158) = v102;
    sub_2119F8570((uint64_t)v107, &v158);
    v108 = swift_bridgeObjectRetain();
    v109 = sub_211A1B898(v108);
    v110 = sub_211A1A794(v109);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v111 = sub_211A46F08();
    *((_QWORD *)&v159 + 1) = v111;
    *(_QWORD *)&v160 = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
    v112 = sub_211969B08((uint64_t *)&v158);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v111 - 8) + 104))(v112, *MEMORY[0x24BE319C8], v111);
    LOBYTE(v111) = MEMORY[0x212BE2D10](&v158);
    sub_211931C34((uint64_t)&v158);
    if ((v111 & 1) != 0)
    {
      v113 = sub_211A47B8C();
      v114 = (uint64_t)v140;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v113 - 8) + 56))(v140, 1, 1, v113);
      v115 = v143;
      sub_211934794((uint64_t)v84, v143, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      v116 = (*(unsigned __int8 *)(v156 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80);
      v117 = (v142 + v116 + 7) & 0xFFFFFFFFFFFFFFF8;
      v118 = (_QWORD *)swift_allocObject();
      v118[2] = 0;
      v118[3] = 0;
      v118[4] = a1;
      v118[5] = v110;
      v118[6] = v157;
      sub_211942810(v115, (uint64_t)v118 + v116, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      v119 = (_QWORD *)((char *)v118 + v117);
      *v119 = sub_211A34060;
      v119[1] = v48;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_2119E2088(v114, (uint64_t)&unk_254ACEB98, (uint64_t)v118);
      swift_release();
      sub_211934758((uint64_t)v146, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      sub_211934758((uint64_t)v84, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    }
    else
    {
      swift_bridgeObjectRelease();
      v121 = *v84;
      v120 = v84[1];
      type metadata accessor for FMFRespondToInviteRequest();
      v122 = swift_allocObject();
      v123 = (_QWORD *)(v122 + qword_254ADC770);
      *v123 = v121;
      v123[1] = v120;
      *(_BYTE *)(v122 + qword_254ADC778) = v102;
      swift_bridgeObjectRetain();
      v124 = sub_21193BD18();
      v125 = v157;
      v126 = v157[11];
      v127 = v157[12];
      v155 = sub_211931DB4(v157 + 8, v126);
      v128 = v143;
      sub_211934794((uint64_t)v84, v143, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      v129 = (*(unsigned __int8 *)(v156 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80);
      v130 = (v142 + v129 + 7) & 0xFFFFFFFFFFFFFFF8;
      v131 = swift_allocObject();
      *(_QWORD *)(v131 + 16) = v125;
      sub_211942810(v128, v131 + v129, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      v132 = (_QWORD *)(v131 + v130);
      *v132 = sub_211A34060;
      v132[1] = v48;
      v133 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, uint64_t))(v127 + 64);
      refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v133(v124, sub_211A33880, v131, refreshed, v126, v127);
      swift_release();
      swift_release();
      sub_211934758((uint64_t)v146, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
      sub_211934758((uint64_t)v150, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
    }
    return swift_release();
  }
  v96 = sub_211A47724();
  v97 = sub_211A47D30();
  if (os_log_type_enabled(v96, v97))
  {
    v98 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v98 = 0;
    _os_log_impl(&dword_21190D000, v96, v97, "%%@: Cannot respond to invite from someone who has not sent the invite", v98, 2u);
    MEMORY[0x212BE48A0](v98, -1, -1);
  }

  LOBYTE(v158) = 0;
  sub_211A2BF8C();
  v99 = (void *)swift_allocError();
  *(_QWORD *)v100 = 1;
  *(_WORD *)(v100 + 8) = 256;
  sub_2119E6188((char *)&v158, v99, v152, v153, v154, (uint64_t)v155);

  sub_211934758((uint64_t)v84, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  return swift_release();
}

uint64_t sub_211A2FC2C(_QWORD **a1, _QWORD **a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), unint64_t a6)
{
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t *, void *);
  uint64_t v30;
  _QWORD *p_isa;
  Class isa;
  Class v33;
  char *v34;
  _QWORD *v35;
  NSObject *v36;
  Class v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  NSObject *v52;
  _QWORD *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  char v59;
  unint64_t v60;
  char v61;
  uint64_t *v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  void (*v76)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  uint64_t result;
  _QWORD *v79;
  uint64_t (*v80)(uint64_t *, void *);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t *, void *);
  NSObject *v90;

  isUniquelyReferenced_nonNull_native = swift_allocObject();
  *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = a3;
  *(_QWORD *)(isUniquelyReferenced_nonNull_native + 24) = a4;
  *(_QWORD *)(isUniquelyReferenced_nonNull_native + 32) = a5;
  *(_QWORD *)(isUniquelyReferenced_nonNull_native + 40) = a6;
  v12 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v12 != -1)
LABEL_61:
    swift_once();
  v13 = sub_211A47748();
  sub_21194F3E0(v13, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v14 = sub_211A47724();
  v15 = sub_211A47D30();
  v82 = a4;
  v83 = isUniquelyReferenced_nonNull_native;
  v80 = a5;
  v81 = a6;
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v86 = v17;
    *(_DWORD *)v16 = 136315138;
    v90 = *a2;
    sub_211958C38(&qword_254ACEAD8);
    v18 = sub_211A47928();
    v90 = sub_211950A9C(v18, v19, &v86);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v14, v15, "%s: set favorite action initiated", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v17, -1, -1);
    MEMORY[0x212BE48A0](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v20 = (char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_friend;
  if ((v20[*(int *)(type metadata accessor for FMFFriend() + 36)] & 2) == 0)
  {
    swift_retain_n();
    v21 = sub_211A47724();
    v22 = sub_211A47D30();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v86 = v24;
      *(_DWORD *)v23 = 136315138;
      v90 = *a2;
      sub_211958C38(&qword_254ACEAD8);
      v25 = sub_211A47928();
      v90 = sub_211950A9C(v25, v26, &v86);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v21, v22, "%s: SaveFavorites: Error saving favorite. Friend needs to be sharing location with me.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v24, -1, -1);
      MEMORY[0x212BE48A0](v23, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v86) = 0;
    sub_211A2BF8C();
    v48 = (void *)swift_allocError();
    *(_QWORD *)v49 = 1;
    *(_WORD *)(v49 + 8) = 256;
    sub_2119E6188((char *)&v86, v48, (uint64_t)a3, v82, v80, v81);

    return swift_release();
  }
  sub_211958C38(&qword_254AC97A0);
  v27 = 0;
  sub_211A47DA8();
  v28 = v88;
  if (!v88
    || (v29 = v89, v30 = v86, v14 = v87, swift_bridgeObjectRetain(), sub_21195A23C(v30, (uint64_t)v14, v28), !v29))
  {
    swift_bridgeObjectRelease();
    v29 = (uint64_t (*)(uint64_t *, void *))MEMORY[0x24BEE4AF8];
  }
  v79 = a2;
  v90 = v29;
  sub_211A1BEB0((_QWORD **)&v90);
  p_isa = (_QWORD *)MEMORY[0x24BEE4AF8];
  v85 = (_QWORD *)MEMORY[0x24BEE4AF8];
  isa = v90[2].isa;
  if (isa)
  {
    v14 = *(NSObject **)v20;
    v33 = (Class)*((_QWORD *)v20 + 1);
    v34 = (char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_order;
    v27 = v90 + 5;
    do
    {
      v36 = v27[-1].isa;
      v37 = v27->isa;
      v38 = v14 == v36 && v33 == v37;
      if (!v38 && (sub_211A48258() & 1) == 0 || v34[8] != 1)
      {
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          p_isa = sub_2119B02DC(0, p_isa[2] + 1, 1, p_isa);
        v40 = p_isa[2];
        v39 = p_isa[3];
        v41 = p_isa;
        if (v40 >= v39 >> 1)
          v41 = sub_2119B02DC((_QWORD *)(v39 > 1), v40 + 1, 1, p_isa);
        v41[2] = v40 + 1;
        p_isa = v41;
        v35 = &v41[2 * v40];
        v35[4] = v36;
        v35[5] = v37;
        v85 = v41;
      }
      v27 += 3;
      isa = (Class)((char *)isa - 1);
    }
    while (isa);
  }
  swift_bridgeObjectRelease();
  v42 = (uint64_t *)((char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_order);
  if ((*((_BYTE *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_order + 8) & 1) != 0)
    goto LABEL_35;
  v43 = p_isa;
  v44 = *v42;
  v45 = (uint64_t)v43[2].isa;
  if (*v42 >= v45)
  {
    v27 = *(NSObject **)v20;
    v44 = *((_QWORD *)v20 + 1);
    swift_bridgeObjectRetain();
    v14 = v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
LABEL_32:
      v51 = (unint64_t)v14[2].isa;
      v50 = (unint64_t)v14[3].isa;
      if (v51 >= v50 >> 1)
        v14 = sub_2119B02DC((_QWORD *)(v50 > 1), v51 + 1, 1, v14);
      v14[2].isa = (Class)(v51 + 1);
      v52 = &v14[2 * v51];
      v52[4].isa = (Class)v27;
      v52[5].isa = (Class)v44;
      p_isa = &v14->isa;
      goto LABEL_35;
    }
LABEL_63:
    v14 = sub_2119B02DC(0, v45 + 1, 1, v14);
    goto LABEL_32;
  }
  if (v44 < 0)
  {
    __break(1u);
    goto LABEL_63;
  }
  v47 = *(_QWORD *)v20;
  v46 = *((_QWORD *)v20 + 1);
  swift_bridgeObjectRetain();
  sub_2119FAC78(v44, v44, v47, v46);
  p_isa = v85;
LABEL_35:
  a1 = (_QWORD **)p_isa[2];
  if (!a1)
  {
    a5 = (uint64_t (*)(uint64_t *, void *))MEMORY[0x24BEE4AF8];
    v53 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_55:
    swift_bridgeObjectRelease();
    sub_211A47DA8();
    v69 = v88;
    if (v88)
    {
      v71 = v86;
      v70 = (uint64_t)v87;
      swift_bridgeObjectRetain();
      sub_21195A23C(v71, v70, v69);
      v86 = v71 & 0xFF010101;
      v87 = v70;
      v88 = v69;
      v89 = a5;
      sub_2119F986C(&v86, 0);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    type metadata accessor for FMFSaveFavoritesRequest();
    *(_QWORD *)(swift_allocObject() + qword_254ADC570) = v53;
    v72 = sub_21193BD18();
    v73 = v79[11];
    v74 = v79[12];
    sub_211931DB4(v79 + 8, v73);
    v75 = (_QWORD *)swift_allocObject();
    v75[2] = v79;
    v75[3] = sub_211A34060;
    v75[4] = v83;
    v76 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v74 + 64);
    refreshed = type metadata accessor for FMFInitRefreshClientResponse();
    swift_retain();
    swift_retain();
    v76(v72, sub_211A33C54, v75, refreshed, v73, v74);
    swift_release();
    swift_release();
    return swift_release();
  }
  a2 = 0;
  a3 = p_isa + 5;
  a5 = (uint64_t (*)(uint64_t *, void *))MEMORY[0x24BEE4AF8];
  v53 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    a4 = *(a3 - 1);
    v54 = *a3;
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v86 = (uint64_t)v53;
    a6 = sub_21195BB68(a4, v54);
    v56 = v53[2];
    v57 = (v55 & 1) == 0;
    v58 = v56 + v57;
    if (__OFADD__(v56, v57))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    v59 = v55;
    if (v53[3] < v58)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v53 = (_QWORD *)v86;
      if ((v55 & 1) != 0)
        goto LABEL_44;
    }
    else
    {
      sub_211A45730();
      v53 = (_QWORD *)v86;
      if ((v59 & 1) != 0)
      {
LABEL_44:
        *(_QWORD *)(v53[7] + 8 * a6) = a2;
        goto LABEL_48;
      }
    }
LABEL_46:
    v53[(a6 >> 6) + 8] |= 1 << a6;
    v62 = (uint64_t *)(v53[6] + 16 * a6);
    *v62 = a4;
    v62[1] = v54;
    *(_QWORD *)(v53[7] + 8 * a6) = a2;
    v63 = v53[2];
    v64 = __OFADD__(v63, 1);
    v65 = v63 + 1;
    if (v64)
      goto LABEL_60;
    v53[2] = v65;
    swift_bridgeObjectRetain();
LABEL_48:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      a5 = (uint64_t (*)(uint64_t *, void *))sub_2119B0AC4(0, *((_QWORD *)a5 + 2) + 1, 1, a5);
    v67 = *((_QWORD *)a5 + 2);
    v66 = *((_QWORD *)a5 + 3);
    if (v67 >= v66 >> 1)
      a5 = (uint64_t (*)(uint64_t *, void *))sub_2119B0AC4((_QWORD *)(v66 > 1), v67 + 1, 1, a5);
    *((_QWORD *)a5 + 2) = v67 + 1;
    v68 = (_QWORD *)((char *)a5 + 24 * v67);
    v68[5] = v54;
    v68[6] = a2;
    a3 += 2;
    v68[4] = a4;
    a2 = (_QWORD **)((char *)a2 + 1);
    if (a1 == a2)
      goto LABEL_55;
  }
  sub_211A41B70(v58, isUniquelyReferenced_nonNull_native);
  v60 = sub_21195BB68(a4, v54);
  if ((v59 & 1) == (v61 & 1))
  {
    a6 = v60;
    v53 = (_QWORD *)v86;
    if ((v59 & 1) != 0)
      goto LABEL_44;
    goto LABEL_46;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = sub_211A48294();
  __break(1u);
  return result;
}

uint64_t sub_211A30610(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  void (*v56)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t *, void *);
  uint64_t v70;
  _QWORD v71[5];
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;

  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v69 = a5;
  v12[4] = a5;
  v12[5] = a6;
  v13 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = sub_211A47748();
  sub_21194F3E0(v14, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v15 = sub_211A47724();
  v16 = sub_211A47D30();
  v70 = a6;
  v67 = a3;
  v68 = a4;
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v72 = v18;
    *(_DWORD *)v17 = 136315138;
    sub_211958C38(&qword_254ACEAD8);
    v19 = sub_211A47928();
    v71[0] = sub_211950A9C(v19, v20, (uint64_t *)&v72);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v15, v16, "%s: updating prefs action initiated", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v18, -1, -1);
    MEMORY[0x212BE48A0](v17, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  sub_211958C38(&qword_254AC97A0);
  sub_211A47DA8();
  v21 = v74;
  if (v74)
  {
    v65 = a2;
    v66 = v12;
    v23 = v72;
    v22 = v73;
    v24 = v72 >> 24;
    LOWORD(v72) = v72 & 0x101;
    BYTE2(v72) = BYTE2(v23) & 1;
    BYTE3(v72) = v24;
    v25 = *(unsigned __int8 *)(a1 + 24);
    v26 = *(unsigned __int8 *)(a1 + 25);
    v27 = *(unsigned __int8 *)(a1 + 26);
    v28 = *(unsigned __int8 *)(a1 + 27);
    v30 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    LOBYTE(v71[0]) = v25;
    BYTE1(v71[0]) = v26;
    BYTE2(v71[0]) = v27;
    BYTE3(v71[0]) = v28;
    v63 = v30;
    v64 = v29;
    v71[1] = v30;
    v71[2] = v29;
    v71[3] = v31;
    v32 = _s7FMFCore14FMFPreferencesV2eeoiySbAC_ACtFZ_0((unsigned __int8 *)&v72, (unsigned __int8 *)v71);
    sub_21195A23C(v23, v22, v21);
    if ((v32 & 1) != 0)
    {
      swift_retain_n();
      v33 = sub_211A47724();
      v34 = sub_211A47D30();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v72 = v36;
        *(_DWORD *)v35 = 136315138;
        v71[0] = *v65;
        sub_211958C38(&qword_254ACEAD8);
        v37 = sub_211A47928();
        v71[0] = sub_211950A9C(v37, v38, (uint64_t *)&v72);
        sub_211A47E2C();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21190D000, v33, v34, "%s: Existing prefs match the action prefs. Action is not needed.", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x212BE48A0](v36, -1, -1);
        MEMORY[0x212BE48A0](v35, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      LOBYTE(v72) = 0;
      sub_211A2BF8C();
      v60 = (void *)swift_allocError();
      *(_QWORD *)v61 = 2;
      *(_WORD *)(v61 + 8) = 256;
      sub_2119E6188((char *)&v72, v60, v67, v68, v69, v70);

    }
    else
    {
      v45 = 256;
      if (!v26)
        v45 = 0;
      v46 = v45 | v25;
      v47 = 0x10000;
      if (!v27)
        v47 = 0;
      v48 = v46 | v47 | (v28 << 24);
      type metadata accessor for FMFSavePrefsRequest();
      v49 = swift_allocObject();
      *(_BYTE *)(v49 + qword_254AC9740) = 0;
      v50 = (unint64_t *)(v49 + qword_254AC9738);
      *v50 = v48;
      v50[1] = v63;
      v50[2] = v64;
      v50[3] = v31;
      v51 = (_QWORD *)(v49 + qword_254AC9748);
      *v51 = 0;
      v51[1] = 0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v52 = sub_21193BD18();
      v72 = v48;
      v73 = v63;
      v74 = v64;
      v75 = v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2119F986C((uint64_t *)&v72, 0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v53 = v65[11];
      v54 = v65[12];
      sub_211931DB4(v65 + 8, v53);
      v55 = (_QWORD *)swift_allocObject();
      v55[2] = v65;
      v55[3] = sub_211A34060;
      v55[4] = v66;
      v56 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v54 + 64);
      refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v56(v52, sub_211A33C90, v55, refreshed, v53, v54);
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_retain_n();
    v39 = sub_211A47724();
    v40 = sub_211A47D30();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v72 = v42;
      *(_DWORD *)v41 = 136315138;
      sub_211958C38(&qword_254ACEAD8);
      v43 = sub_211A47928();
      v71[0] = sub_211950A9C(v43, v44, (uint64_t *)&v72);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v39, v40, "%s: Existing prefs not avaiable. Operation can be completed only if prefs exist in store.", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v42, -1, -1);
      MEMORY[0x212BE48A0](v41, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v72) = 0;
    sub_211A2BF8C();
    v58 = (void *)swift_allocError();
    *(_QWORD *)v59 = 2;
    *(_WORD *)(v59 + 8) = 256;
    sub_2119E6188((char *)&v72, v58, v67, v68, v69, v70);

  }
  return swift_release();
}

uint64_t sub_211A30DBC(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
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
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  _QWORD *v58;
  void (*v59)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t *, void *);
  uint64_t v66;
  char *v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;

  v69 = a1;
  v11 = sub_211958C38(&qword_254AC9FD0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v67 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v15 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v15 != -1)
    swift_once();
  v16 = sub_211A47748();
  v17 = sub_21194F3E0(v16, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v18 = sub_211A47724();
  v19 = sub_211A47D30();
  if (os_log_type_enabled(v18, v19))
  {
    v66 = a6;
    v20 = swift_slowAlloc();
    v64 = v17;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v68 = v14;
    v23 = v22;
    v71 = v22;
    v65 = a5;
    *(_DWORD *)v21 = 136315138;
    v70 = *a2;
    sub_211958C38(&qword_254ACEAD8);
    v24 = sub_211A47928();
    v70 = sub_211950A9C(v24, v25, &v71);
    a5 = v65;
    a6 = v66;
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v18, v19, "%s: updating me action initiated", v21, 0xCu);
    swift_arrayDestroy();
    v26 = v23;
    v14 = v68;
    MEMORY[0x212BE48A0](v26, -1, -1);
    MEMORY[0x212BE48A0](v21, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v27 = sub_211A47724();
    v28 = sub_211A47D24();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_21190D000, v27, v28, "Action is restricted. Returning with error", v29, 2u);
      MEMORY[0x212BE48A0](v29, -1, -1);
    }

    LOBYTE(v71) = 0;
    sub_211A2BF8C();
    v30 = (void *)swift_allocError();
    *(_QWORD *)v31 = 5;
    *(_WORD *)(v31 + 8) = 256;
    sub_2119E6188((char *)&v71, v30, a3, a4, a5, a6);

  }
  else
  {
    v32 = a2[6];
    sub_211958C38(&qword_254ACAA30);
    sub_211A47DA8();
    v33 = v71;
    v63 = a2;
    v66 = v32;
    if (v71)
    {
      v35 = v76;
      v34 = v77;
      v62 = v75;
      v36 = v73;
      v37 = v72;
      v68 = v14;
      LODWORD(v65) = v78 & 1;
      v38 = v69[4];
      v64 = v69[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = v68;
      sub_211933F60(v33);
      v71 = v33;
      v72 = v37;
      v73 = v36;
      v74 = v64;
      v75 = v38;
      v76 = v35;
      v77 = v34;
      v78 = (char)v65;
      sub_2119F9E84((uint64_t)&v71, 0);
      swift_bridgeObjectRelease();
      a2 = v63;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v39 = sub_211A46F08();
    v74 = v39;
    v75 = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
    v40 = sub_211969B08(&v71);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v40, *MEMORY[0x24BE319C8], v39);
    LOBYTE(v39) = MEMORY[0x212BE2D10](&v71);
    sub_211931C34((uint64_t)&v71);
    if ((v39 & 1) != 0)
    {
      v41 = sub_211A47B8C();
      v42 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v67, 1, 1, v41);
      v43 = (_QWORD *)swift_allocObject();
      v43[2] = 0;
      v43[3] = 0;
      v43[4] = v69;
      v43[5] = a2;
      v43[6] = sub_211A34060;
      v43[7] = v14;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_2119E2088(v42, (uint64_t)&unk_254ACEBA8, (uint64_t)v43);
      swift_release();
    }
    else
    {
      v44 = (_QWORD *)v69[3];
      v45 = v69[4];
      type metadata accessor for FMFSavePrefsRequest();
      v46 = swift_allocObject();
      *(_BYTE *)(v46 + qword_254AC9740) = 0;
      v47 = (_OWORD *)(v46 + qword_254AC9738);
      *v47 = 0u;
      v47[1] = 0u;
      v48 = (_QWORD *)(v46 + qword_254AC9748);
      *v48 = v44;
      v48[1] = v45;
      swift_bridgeObjectRetain();
      v49 = sub_21193BD18();
      sub_211A47DA8();
      v50 = v71;
      if (v71)
      {
        v68 = v44;
        v69 = v49;
        v52 = v76;
        v51 = v77;
        v54 = v72;
        v53 = v73;
        LODWORD(v67) = v78 & 1;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        a2 = v63;
        v49 = v69;
        sub_211933F60(v50);
        v71 = v50;
        v72 = v54;
        v73 = v53;
        v74 = (uint64_t)v68;
        v75 = v45;
        v76 = v52;
        v77 = v51;
        v78 = (char)v67;
        sub_2119F9E84((uint64_t)&v71, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v55 = a2[11];
      v56 = a2[12];
      sub_211931DB4(a2 + 8, v55);
      v57 = a2;
      v58 = (_QWORD *)swift_allocObject();
      v58[2] = v57;
      v58[3] = sub_211A34060;
      v58[4] = v14;
      v59 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v56 + 64);
      refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v59(v49, sub_211A33CCC, v58, refreshed, v55, v56);
      swift_release();
      swift_release();
    }
  }
  return swift_release();
}

uint64_t sub_211A3151C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  int v28;
  BOOL v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  void (*v49)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t *, void *);
  uint64_t v57;
  uint64_t v58[5];

  v12 = sub_211958C38(&qword_254AC9FD0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v54 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v55 = a3;
  v56 = a5;
  v15[4] = a5;
  v15[5] = a6;
  v16 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v16 != -1)
    swift_once();
  v17 = sub_211A47748();
  sub_21194F3E0(v17, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v18 = sub_211A47724();
  v19 = sub_211A47D30();
  if (os_log_type_enabled(v18, v19))
  {
    v52 = v15;
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v53 = a6;
    v22 = v21;
    v51 = a4;
    *(_DWORD *)v20 = 136315138;
    v57 = *a2;
    v58[0] = v21;
    sub_211958C38(&qword_254ACEAD8);
    v23 = sub_211A47928();
    v57 = sub_211950A9C(v23, v24, v58);
    a4 = v51;
    v15 = v52;
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v18, v19, "%s: not now action initiated", v20, 0xCu);
    swift_arrayDestroy();
    v25 = v22;
    a6 = v53;
    MEMORY[0x212BE48A0](v25, -1, -1);
    MEMORY[0x212BE48A0](v20, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v26 = (_QWORD *)(a1 + OBJC_IVAR____TtC7FMFCore15FMFNotNowAction_friend);
  v27 = type metadata accessor for FMFFriend();
  if ((*((_BYTE *)v26 + *(int *)(v27 + 36)) & 2) != 0
    && ((v28 = *((unsigned __int8 *)v26 + *(int *)(v27 + 40)), v28 != 2) ? (v29 = (v28 & 1) == 0) : (v29 = 0), v29))
  {
    v36 = sub_211A46F08();
    v58[3] = v36;
    v58[4] = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
    v37 = sub_211969B08(v58);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v37, *MEMORY[0x24BE319C8], v36);
    LOBYTE(v36) = MEMORY[0x212BE2D10](v58);
    sub_211931C34((uint64_t)v58);
    if ((v36 & 1) != 0)
    {
      v38 = sub_211A47B8C();
      v39 = (uint64_t)v54;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v54, 1, 1, v38);
      v40 = (_QWORD *)swift_allocObject();
      v40[2] = 0;
      v40[3] = 0;
      v40[4] = a1;
      v40[5] = sub_211A34060;
      v40[6] = v15;
      swift_retain();
      swift_retain();
      sub_2119E2088(v39, (uint64_t)&unk_254ACEBB8, (uint64_t)v40);
    }
    else
    {
      v41 = a2;
      v43 = *v26;
      v42 = v26[1];
      type metadata accessor for FMFNotNowRequest();
      v44 = (_QWORD *)(swift_allocObject() + qword_254ADC6B0);
      *v44 = v43;
      v44[1] = v42;
      swift_bridgeObjectRetain();
      v45 = sub_21193BD18();
      v47 = v41[11];
      v46 = v41[12];
      sub_211931DB4(v41 + 8, v47);
      v48 = (_QWORD *)swift_allocObject();
      v48[2] = v41;
      v48[3] = sub_211A34060;
      v48[4] = v15;
      v49 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v46 + 64);
      refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v49(v45, sub_211A33DB0, v48, refreshed, v47, v46);
      swift_release();
    }
    swift_release();
  }
  else
  {
    v30 = sub_211A47724();
    v31 = sub_211A47D30();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_21190D000, v30, v31, "%%@: Cannot respond not now when the friend is not sharing location with me.", v32, 2u);
      MEMORY[0x212BE48A0](v32, -1, -1);
    }

    LOBYTE(v58[0]) = 0;
    sub_211A2BF8C();
    v33 = (void *)swift_allocError();
    *(_QWORD *)v34 = 1;
    *(_WORD *)(v34 + 8) = 256;
    sub_2119E6188((char *)v58, v33, v55, a4, v56, a6);

  }
  return swift_release();
}

uint64_t sub_211A31A64(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
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
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t *, void *);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t (*v61)(uint64_t *, void *);
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  void (*v75)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t refreshed;
  char *v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t *, void *);
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  char v96;

  v12 = sub_211958C38(&qword_254AC9FD0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_211958C38((uint64_t *)&unk_254AC8CB0);
  MEMORY[0x24BDAC7A8](v16, v17);
  v83 = (char *)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_211958C38(&qword_254ACA278);
  MEMORY[0x24BDAC7A8](v19, v20);
  v82 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_211958C38(&qword_254AC8870);
  MEMORY[0x24BDAC7A8](v22, v23);
  v81 = (uint64_t)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = type metadata accessor for FMFFriend();
  v80 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84, v25);
  v27 = (char **)((char *)&v77 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  v28 = (_QWORD *)swift_allocObject();
  v28[2] = a3;
  v28[3] = a4;
  v88 = a5;
  v28[4] = a5;
  v28[5] = a6;
  v29 = qword_254AC7B80;
  v86 = a3;
  swift_retain();
  v87 = a4;
  swift_retain();
  swift_retain();
  if (v29 != -1)
    swift_once();
  v30 = sub_211A47748();
  v31 = sub_21194F3E0(v30, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v85 = v31;
  v32 = sub_211A47724();
  v33 = sub_211A47D30();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v78 = v28;
    v35 = (uint8_t *)v34;
    v36 = swift_slowAlloc();
    v77 = v15;
    v37 = v36;
    *(_QWORD *)&v89 = v36;
    v79 = v27;
    *(_DWORD *)v35 = 136315138;
    v95 = *a2;
    sub_211958C38(&qword_254ACEAD8);
    v38 = sub_211A47928();
    v95 = sub_211950A9C(v38, v39, (uint64_t *)&v89);
    v27 = v79;
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v32, v33, "%s: ask to follow action initiated", v35, 0xCu);
    swift_arrayDestroy();
    v40 = v37;
    v15 = v77;
    MEMORY[0x212BE48A0](v40, -1, -1);
    v41 = v35;
    v28 = v78;
    MEMORY[0x212BE48A0](v41, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (*(_BYTE *)(a2[13] + 40) == 1)
  {
    v42 = sub_211A47724();
    v43 = sub_211A47D24();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_21190D000, v42, v43, "Action is restricted. Returning with error", v44, 2u);
      MEMORY[0x212BE48A0](v44, -1, -1);
    }

    LOBYTE(v89) = 0;
    sub_211A2BF8C();
    v46 = (void *)swift_allocError();
    v47 = 5;
LABEL_17:
    *(_QWORD *)v45 = v47;
    *(_WORD *)(v45 + 8) = 256;
    sub_2119E6188((char *)&v89, v46, v86, v87, v88, a6);

    return swift_release();
  }
  v48 = (_QWORD *)(a1 + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend);
  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend + *(int *)(v84 + 36)) & 2) != 0
    || (v49 = v48[4], v50 = sub_2119482CC(v49), !v51))
  {
    v62 = sub_211A47724();
    v63 = sub_211A47D30();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_21190D000, v62, v63, "%%@: Cannot ask to follow when the friend is already sharing location.", v64, 2u);
      MEMORY[0x212BE48A0](v64, -1, -1);
    }

    LOBYTE(v89) = 0;
    sub_211A2BF8C();
    v46 = (void *)swift_allocError();
    v47 = 1;
    goto LABEL_17;
  }
  v86 = v50;
  v87 = v49;
  v88 = v51;
  v52 = v81;
  sub_211934794((uint64_t)v48, v81, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v80 + 56))(v52, 0, 1, v84);
  v53 = type metadata accessor for FMFIntermediateFriend();
  v54 = (uint64_t)v82;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v82, 1, 1, v53);
  v95 = 4;
  v96 = 0;
  v93 = 0;
  v94 = 1;
  v55 = type metadata accessor for FMFLocation();
  v56 = (uint64_t)v83;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v83, 1, 1, v55);
  v92 = 0;
  v90 = 0u;
  v91 = 0u;
  v89 = 0u;
  sub_211956D54(v52, v54, (unint64_t)&v95, (uint64_t)&v93, v56, 0, 1, (uint64_t *)&v89, v27, 0, 0, 2u, 2u, 2);
  LOBYTE(v89) = 4;
  sub_2119F8570((uint64_t)v27, &v89);
  v57 = sub_211A46F08();
  *((_QWORD *)&v90 + 1) = v57;
  *(_QWORD *)&v91 = sub_211910908((unint64_t *)&qword_254AC81D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE319D0], MEMORY[0x24BE319B8]);
  v58 = sub_211969B08((uint64_t *)&v89);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v58, *MEMORY[0x24BE319C8], v57);
  LOBYTE(v57) = MEMORY[0x212BE2D10](&v89);
  sub_211931C34((uint64_t)&v89);
  if ((v57 & 1) != 0)
  {
    v59 = sub_211A47B8C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v15, 1, 1, v59);
    v60 = (_QWORD *)swift_allocObject();
    v60[2] = 0;
    v60[3] = 0;
    v61 = v88;
    v60[4] = v86;
    v60[5] = v61;
    v60[6] = a2;
    v60[7] = a1;
    v60[8] = sub_211A34060;
    v60[9] = v28;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2119E2088((uint64_t)v15, (uint64_t)&unk_254ACEBC8, (uint64_t)v60);
    swift_release();
    sub_211934758((uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_211958C38((uint64_t *)&unk_254ACC540);
    v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = xmmword_211A4A230;
    v67 = v48[1];
    *(_QWORD *)(v66 + 32) = *v48;
    *(_QWORD *)(v66 + 40) = v67;
    swift_bridgeObjectRetain();
    v68 = swift_bridgeObjectRetain();
    v69 = sub_21194FDA0(v68);
    swift_bridgeObjectRelease();
    type metadata accessor for FMFAskToFollowRequest();
    v70 = swift_allocObject();
    *(_QWORD *)(v70 + qword_254ADC790) = v66;
    *(_QWORD *)(v70 + qword_254ADC798) = v69;
    v71 = sub_21193BD18();
    v79 = v27;
    v72 = a2[11];
    v73 = a2[12];
    sub_211931DB4(a2 + 8, v72);
    v74 = (_QWORD *)swift_allocObject();
    v74[2] = a2;
    v74[3] = a1;
    v74[4] = sub_211A34060;
    v74[5] = v28;
    v75 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t, void *), _QWORD *, uint64_t, uint64_t, uint64_t))(v73 + 64);
    refreshed = type metadata accessor for FMFInitRefreshClientResponse();
    swift_retain();
    swift_retain();
    swift_retain();
    v75(v71, sub_211A33EA0, v74, refreshed, v72, v73);
    swift_release();
    swift_release();
    sub_211934758((uint64_t)v79, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
  }
  return swift_release();
}

void sub_211A322F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t *, void *);
  uint64_t aBlock[6];

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  v12 = qword_254AC7BB0;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v12 != -1)
    swift_once();
  if (byte_254ACDFA0 == 1)
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v13 = sub_211A47748();
    sub_21194F3E0(v13, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v14 = sub_211A47724();
    v15 = sub_211A47D30();
    if (os_log_type_enabled(v14, v15))
    {
      v35 = a5;
      v16 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_DWORD *)v16 = 136315138;
      aBlock[0] = v34;
      sub_211958C38(&qword_254ACEAD8);
      v17 = sub_211A47928();
      sub_211950A9C(v17, v18, aBlock);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v14, v15, "%s: Dismissing FMFLocationAlert update due to demo mode.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v34, -1, -1);
      v19 = v16;
      a5 = v35;
      MEMORY[0x212BE48A0](v19, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    LOBYTE(aBlock[0]) = 0;
    sub_211A2BF8C();
    v27 = (void *)swift_allocError();
    *(_QWORD *)v28 = 6;
    *(_WORD *)(v28 + 8) = 256;
    sub_2119E6188((char *)aBlock, v27, a3, a4, a5, a6);

    swift_release();
  }
  else
  {
    if (qword_254AC7B80 != -1)
      swift_once();
    v20 = sub_211A47748();
    sub_21194F3E0(v20, (uint64_t)qword_254ADC7E8);
    swift_retain_n();
    v21 = sub_211A47724();
    v22 = sub_211A47D30();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      *(_DWORD *)v23 = 136315138;
      aBlock[0] = v24;
      sub_211958C38(&qword_254ACEAD8);
      v25 = sub_211A47928();
      sub_211950A9C(v25, v26, aBlock);
      sub_211A47E2C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21190D000, v21, v22, "%s: updating location alert action initiated", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v24, -1, -1);
      MEMORY[0x212BE48A0](v23, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2FED0]), sel_init);
    FMFLocationAlert.fence.getter();
    v31 = v30;
    v32 = (_QWORD *)swift_allocObject();
    v32[2] = a2;
    v32[3] = sub_211A34060;
    v32[4] = v11;
    aBlock[4] = (uint64_t)sub_211A34008;
    aBlock[5] = (uint64_t)v32;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_211A2400C;
    aBlock[3] = (uint64_t)&unk_24CCCF4B8;
    v33 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v29, sel_addFence_completion_, v31, v33);
    _Block_release(v33);
    swift_release();

  }
}

uint64_t sub_211A327E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6, const char *a7, _QWORD *a8)
{
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t (*v29)(uint64_t *, void *);
  uint64_t v30;

  v16 = qword_254AC7B80;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v16 != -1)
    swift_once();
  v17 = sub_211A47748();
  sub_21194F3E0(v17, (uint64_t)qword_254ADC7E8);
  swift_retain_n();
  v18 = sub_211A47724();
  v19 = sub_211A47D30();
  if (os_log_type_enabled(v18, v19))
  {
    v29 = a5;
    v20 = (uint8_t *)swift_slowAlloc();
    v28 = a1;
    v21 = swift_slowAlloc();
    *(_DWORD *)v20 = 136315138;
    v30 = v21;
    sub_211958C38(&qword_254ACEAD8);
    v22 = sub_211A47928();
    sub_211950A9C(v22, v23, &v30);
    sub_211A47E2C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21190D000, v18, v19, a7, v20, 0xCu);
    swift_arrayDestroy();
    v24 = v21;
    a1 = v28;
    MEMORY[0x212BE48A0](v24, -1, -1);
    v25 = v20;
    a5 = v29;
    MEMORY[0x212BE48A0](v25, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v26 = a1 + *a8;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_211A322F0(v26, a2, a3, a4, a5, a6);
  swift_release_n();
  swift_release_n();
  return swift_release_n();
}

uint64_t sub_211A32A50(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t *a6)
{
  _QWORD *v11;
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
  uint64_t (*v23)(uint64_t *, void *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
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
  const char *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  char v59;

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  type metadata accessor for FMFUpdateStewieLocationAction();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v12 = swift_dynamicCastClass();
  if (v12)
  {
    v13 = v12;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A257D8(v13, (uint64_t)sub_211A333BC, (uint64_t)v11);
LABEL_34:
    swift_release();
    swift_release();
    swift_release_n();
    swift_release();
    goto LABEL_35;
  }
  type metadata accessor for FMFShareLocationAction();
  v14 = swift_dynamicCastClass();
  if (v14)
  {
    v15 = (_QWORD *)v14;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A1BF1C(v15, (uint64_t)sub_211A333BC, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFRemoveFriendAction();
  v16 = swift_dynamicCastClass();
  if (v16)
  {
    v17 = v16;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2CAB0(v17, a2, (uint64_t)a3, a4, a5, a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFShowHideLocationAction();
  v18 = swift_dynamicCastClass();
  if (v18)
  {
    v19 = v18;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2D570(v19, a2, (uint64_t)a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFStopFollowingAction();
  v20 = swift_dynamicCastClass();
  if (v20)
  {
    v21 = v20;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2DD88(v21, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFStopSharingAction();
  v22 = swift_dynamicCastClass();
  if (v22)
  {
    v23 = (uint64_t (*)(uint64_t *, void *))v22;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2E3BC(v23, a2, (uint64_t)a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFRespondToInviteAction();
  v24 = swift_dynamicCastClass();
  if (v24)
  {
    v25 = v24;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2ED44(v25, a2, (uint64_t)a3, a4, a5, a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFSetFavoriteAction();
  v26 = swift_dynamicCastClass();
  if (v26)
  {
    v27 = (_QWORD **)v26;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2FC2C(v27, (_QWORD **)a2, a3, a4, a5, (unint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFUpdatePrefsAction();
  v28 = swift_dynamicCastClass();
  if (v28)
  {
    v29 = v28;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A30610(v29, a2, (uint64_t)a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFUpdateMeDeviceAction();
  v30 = swift_dynamicCastClass();
  if (v30)
  {
    v31 = (_QWORD *)v30;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A30DBC(v31, a2, (uint64_t)a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFNotNowAction();
  v32 = swift_dynamicCastClass();
  if (v32)
  {
    v33 = v32;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A3151C(v33, a2, (uint64_t)a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFAddUpdateLabelAction();
  v34 = swift_dynamicCastClass();
  if (v34)
  {
    v35 = v34;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A22620(v35, (uint64_t)sub_211A333BC, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFRemoveLabelsAction();
  v36 = swift_dynamicCastClass();
  if (v36)
  {
    v37 = v36;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A232B8(v37, (uint64_t)sub_211A333BC, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFAskToFollowAction();
  v38 = swift_dynamicCastClass();
  if (v38)
  {
    v39 = v38;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A31A64(v39, a2, (uint64_t)a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFAddLocationAlertAction();
  v40 = swift_dynamicCastClass();
  if (v40)
  {
    v41 = v40;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    v42 = "%s: adding location alert action initiated";
    v43 = &OBJC_IVAR____TtC7FMFCore25FMFAddLocationAlertAction_locationAlert;
LABEL_33:
    sub_211A327E8(v41, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)a6, v42, v43);
    goto LABEL_34;
  }
  type metadata accessor for FMFUpdateLocationAlertAction();
  v44 = swift_dynamicCastClass();
  if (v44)
  {
    v41 = v44;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    v42 = "%s: updating location alert action initiated";
    v43 = &OBJC_IVAR____TtC7FMFCore28FMFUpdateLocationAlertAction_locationAlert;
    goto LABEL_33;
  }
  type metadata accessor for FMFRemoveLocationAlertAction();
  v46 = swift_dynamicCastClass();
  if (v46)
  {
    v47 = v46;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A23574(v47, (uint64_t)sub_211A333BC, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFGetURLInfoAction();
  v48 = swift_dynamicCastClass();
  if (v48)
  {
    v49 = v48;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A2470C(v49, (uint64_t)sub_211A333BC, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFMuteFencesAction();
  v50 = swift_dynamicCastClass();
  if (v50)
  {
    v51 = v50;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_211A24010(v51, (uint64_t)sub_211A333BC, (uint64_t)v11);
    goto LABEL_34;
  }
  v52 = qword_254AC7B80;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  if (v52 != -1)
    swift_once();
  v53 = sub_211A47748();
  sub_21194F3E0(v53, (uint64_t)qword_254ADC7E8);
  v54 = sub_211A47724();
  v55 = sub_211A47D30();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v56 = 0;
    _os_log_impl(&dword_21190D000, v54, v55, "FMFActionsController: cannot map action to request", v56, 2u);
    MEMORY[0x212BE48A0](v56, -1, -1);
  }

  v59 = 0;
  sub_211A2BF8C();
  v57 = (void *)swift_allocError();
  *(_QWORD *)v58 = 0;
  *(_WORD *)(v58 + 8) = 256;
  sub_2119E6188(&v59, v57, (uint64_t)a3, a4, a5, (uint64_t)a6);

  swift_release();
  swift_release();
  swift_release_n();
LABEL_35:
  swift_release();
  swift_release_n();
  swift_release_n();
  return swift_release_n();
}

uint64_t sub_211A333BC(char *a1, void *a2)
{
  uint64_t v2;

  return sub_2119E6188(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_211A333CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_211A333F0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_211A33444()
{
  uint64_t v0;

  sub_211A1E914(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t *, id))(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
}

void sub_211A33464(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_211A1E8AC(a1, a2, *(_QWORD *)(v2 + 16), *(NSObject **)(v2 + 24));
}

uint64_t sub_211A33480()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_211A334A4()
{
  uint64_t v0;

  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_211A334B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  return sub_211A1E47C(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(uint64_t (**)(uint64_t *, void *))(v3 + 32));
}

uint64_t sub_211A334C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_211963DB0;
  return sub_211A1DD50(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_211A33558()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A33564(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A214D0(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24));
}

uint64_t sub_211A33578(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A210C4(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32), *(_QWORD *)(v2 + 40), &OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend, "%s: Successfully stopped following a friend.", "%s: Error removing friend sharing location with me. Error - %s");
}

uint64_t sub_211A335C4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A3360C()
{
  uint64_t v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v1 = (int *)type metadata accessor for FMFFriend();
  v2 = (*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  swift_release();
  v3 = v0 + v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v2 + v1[8];
  v5 = sub_211A47208();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v3 + v1[19] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v7 = v3 + v1[20];
  v8 = type metadata accessor for FMFLocation();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    v9 = v7 + *(int *)(v8 + 32);
    v10 = sub_211A4722C();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    v12 = v7 + *(int *)(v8 + 44);
    v13 = *(void **)(v12 + 304);
    if (v13)
    {
      if (*(_QWORD *)(v12 + 168))
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
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 = *(void **)(v12 + 304);
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A33880(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for FMFFriend() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_211A1FE3C(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t *)(v2 + v6), *(uint64_t (**)(uint64_t *, void *))(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_211A338E8()
{
  uint64_t v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v1 = (int *)type metadata accessor for FMFFriend();
  v2 = (*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = v0 + v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v2 + v1[8];
  v5 = sub_211A47208();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v3 + v1[19] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v7 = v3 + v1[20];
  v8 = type metadata accessor for FMFLocation();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    v9 = v7 + *(int *)(v8 + 32);
    v10 = sub_211A4722C();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    v12 = v7 + *(int *)(v8 + 44);
    v13 = *(void **)(v12 + 304);
    if (v13)
    {
      if (*(_QWORD *)(v12 + 168))
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
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 = *(void **)(v12 + 304);
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A33B74(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(type metadata accessor for FMFFriend() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = v1[5];
  v10 = v1[6];
  v11 = (uint64_t)v1 + v5;
  v12 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_211963DB0;
  return sub_211A1F3B0(a1, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_211A33C48()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A33C54(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A22218(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24), *(_QWORD *)(v2 + 32), "%s: Saved favorites.", "%s: Error saving favorites - %s");
}

uint64_t sub_211A33C84()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A33C90(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A22218(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24), *(_QWORD *)(v2 + 32), "%s: Updated prefs.", "%s: error when updating prefs: %s");
}

uint64_t sub_211A33CC0()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A33CCC(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A21E00(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24));
}

uint64_t sub_211A33CD8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A33D14(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_211963DB0;
  return sub_211A21840(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_211A33DA4()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A33DB0(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A23C14(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t *, void *))(v2 + 24), *(_QWORD *)(v2 + 32), "%s: not now request completed successfully.", MEMORY[0x24BEE7928], "%s: error sending not now: %s");
}

uint64_t sub_211A33DE4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A33E18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_2119A113C;
  return sub_211A20248(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_211A33EA0(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A210C4(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32), *(_QWORD *)(v2 + 40), &OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend, "%s: ask to follow request completed successfully.", "%s: error sending ask to follow: %s");
}

uint64_t sub_211A33EE0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A33F24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_211963DB0;
  return sub_211A2095C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_211A33FC8()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A33FFC()
{
  return sub_211918278((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_211A34008(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_211A23C14(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t *, void *))(v2 + 24), *(_QWORD *)(v2 + 32), "%s: Location alert updated.", MEMORY[0x24BEE7910], "%s: error when updating location alert: %s");
}

BOOL static FMImageCacheError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FMImageCacheError.hash(into:)()
{
  return sub_211A48324();
}

uint64_t FMImageCacheError.hashValue.getter()
{
  sub_211A48318();
  sub_211A48324();
  return sub_211A48348();
}

unint64_t sub_211A34110()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_211A3412C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_211A34170(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t FMImageCache.__allocating_init(converter:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  FMImageCache.init(converter:)(a1, a2);
  return v4;
}

uint64_t sub_211A34200()
{
  sub_211A47E14();
  return sub_211A47DA8();
}

uint64_t sub_211A34268@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t, uint64_t);
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void (*v94)(char *);
  char *v95;
  uint64_t v96;
  uint64_t v97;
  void (*v99)(char *, char *, uint64_t);
  char *v100;
  uint64_t v101;
  void (*v102)(char *, _QWORD, uint64_t, uint64_t);
  void (*v103)(char *);
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t AssociatedConformanceWitness;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  void (*v123)(char *);
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129[4];
  uint64_t v130;

  v124 = a5;
  v121 = a4;
  v123 = (void (*)(char *))a3;
  v127 = a2;
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 96);
  sub_21195E2C0(&qword_254ACC360);
  v8 = sub_211A48354();
  v115 = *(_QWORD *)(v8 - 8);
  v116 = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  v114 = (char *)&v107 - v10;
  v11 = *(_QWORD *)(v6 + 80);
  v125 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v12, v13);
  v107 = (char *)&v107 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v16);
  v111 = (char *)&v107 - v17;
  MEMORY[0x24BDAC7A8](v18, v19);
  v108 = (char *)&v107 - v20;
  MEMORY[0x24BDAC7A8](v21, v22);
  v119 = (char *)&v107 - v23;
  v24 = sub_211A47E14();
  v117 = *(_QWORD *)(v24 - 8);
  v118 = v24;
  MEMORY[0x24BDAC7A8](v24, v25);
  v110 = (char *)&v107 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27, v28);
  v30 = (char *)&v107 - v29;
  MEMORY[0x24BDAC7A8](v31, v32);
  v34 = (char *)&v107 - v33;
  v35 = *(char **)(v7 - 8);
  MEMORY[0x24BDAC7A8](v36, v37);
  v112 = (char *)&v107 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v39, v40);
  v42 = (char *)&v107 - v41;
  v109 = a1 + 48;
  swift_beginAccess();
  v122 = a1;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v43 = *(_QWORD *)(AssociatedConformanceWitness + 16);
  swift_bridgeObjectRetain();
  v44 = v127;
  v126 = v11;
  v120 = v43;
  MEMORY[0x212BE36A0]();
  v45 = v7;
  swift_bridgeObjectRelease();
  v46 = (unsigned int (*)(char *, uint64_t, uint64_t))*((_QWORD *)v35 + 6);
  if (v46(v34, 1, v7) == 1)
  {
    v47 = v118;
    v48 = *(void (**)(char *, uint64_t))(v117 + 8);
    v48(v34, v118);
    sub_211A380EC((uint64_t)v30);
    v49 = v44;
    if (v46(v30, 1, v45) == 1)
    {
      v48(v30, v47);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v50 = v126;
      v51 = sub_211A47C88();
      swift_bridgeObjectRelease();
      if ((v51 & 1) == 0)
      {
        v119 = v35;
        if (qword_254AC7B80 != -1)
          swift_once();
        v52 = sub_211A47748();
        sub_21194F3E0(v52, (uint64_t)qword_254ADC7E8);
        v53 = v125;
        v54 = v107;
        (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v107, v49, v50);
        v55 = sub_211A47724();
        v56 = sub_211A47D30();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc();
          v120 = swift_slowAlloc();
          v130 = v120;
          *(_DWORD *)v57 = 136315138;
          v118 = v45;
          v58 = sub_211A4821C();
          v128 = sub_211950A9C(v58, v59, &v130);
          v45 = v118;
          sub_211A47E2C();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v50);
          _os_log_impl(&dword_21190D000, v55, v56, "FMImageCache: Cached data for request: %s not found, regenerating.", v57, 0xCu);
          v60 = v120;
          swift_arrayDestroy();
          MEMORY[0x212BE48A0](v60, -1, -1);
          v61 = v57;
          v49 = v127;
          MEMORY[0x212BE48A0](v61, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v50);
        }

        v35 = v119;
        sub_211A353F4(v49, (uint64_t)v123, v121);
      }
      return (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))v35 + 7))(v124, 1, 1, v45);
    }
    else
    {
      v79 = (char *)*((_QWORD *)v35 + 4);
      v80 = v112;
      v118 = v45;
      v122 = v79;
      ((void (*)(char *, char *, uint64_t))v79)(v112, v30, v45);
      v81 = v126;
      if (qword_254AC7B80 != -1)
        swift_once();
      v82 = sub_211A47748();
      sub_21194F3E0(v82, (uint64_t)qword_254ADC7E8);
      v83 = v125;
      v84 = *(void (**)(char *, uint64_t, uint64_t))(v125 + 16);
      v85 = v108;
      v84(v108, v49, v81);
      v86 = sub_211A47724();
      v87 = sub_211A47D0C();
      if (os_log_type_enabled(v86, v87))
      {
        v88 = (uint8_t *)swift_slowAlloc();
        v89 = swift_slowAlloc();
        v119 = v35;
        v90 = v89;
        v129[0] = v89;
        *(_DWORD *)v88 = 136315138;
        v91 = sub_211A4821C();
        v130 = sub_211950A9C(v91, v92, v129);
        v80 = v112;
        v81 = v126;
        sub_211A47E2C();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v125 + 8))(v85, v81);
        _os_log_impl(&dword_21190D000, v86, v87, "FMImageCache: Found cached data for request: %s in disk cache.", v88, 0xCu);
        swift_arrayDestroy();
        v93 = v90;
        v35 = v119;
        MEMORY[0x212BE48A0](v93, -1, -1);
        MEMORY[0x212BE48A0](v88, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v81);
      }

      v84(v111, v127, v81);
      v99 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v35 + 2);
      v100 = v110;
      v101 = v118;
      v99(v110, v80, v118);
      v102 = (void (*)(char *, _QWORD, uint64_t, uint64_t))*((_QWORD *)v35 + 7);
      v102(v100, 0, 1, v101);
      swift_beginAccess();
      sub_211A47880();
      sub_211A47898();
      swift_endAccess();
      v103 = v123;
      if (v123)
      {
        v104 = v114;
        v99(v114, v80, v101);
        v105 = v116;
        swift_storeEnumTagMultiPayload();
        v103(v104);
        (*(void (**)(char *, uint64_t))(v115 + 8))(v104, v105);
      }
      v106 = v124;
      ((void (*)(uint64_t, char *, uint64_t))v122)(v124, v80, v101);
      return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v102)(v106, 0, 1, v101);
    }
  }
  else
  {
    v122 = (char *)*((_QWORD *)v35 + 4);
    ((void (*)(char *, char *, uint64_t))v122)(v42, v34, v7);
    v62 = v42;
    if (qword_254AC7B80 != -1)
      swift_once();
    v63 = sub_211A47748();
    sub_21194F3E0(v63, (uint64_t)qword_254ADC7E8);
    v65 = v125;
    v64 = v126;
    v66 = v119;
    (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v119, v44, v126);
    v67 = sub_211A47724();
    v68 = sub_211A47D0C();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = swift_slowAlloc();
      v127 = (uint64_t)v62;
      v70 = v64;
      v71 = v66;
      v72 = (uint8_t *)v69;
      v73 = swift_slowAlloc();
      v118 = v45;
      v74 = v73;
      v129[0] = v73;
      *(_DWORD *)v72 = 136315138;
      v120 = (uint64_t)(v72 + 4);
      v75 = sub_211A4821C();
      v130 = sub_211950A9C(v75, v76, v129);
      sub_211A47E2C();
      swift_bridgeObjectRelease();
      v77 = v70;
      v62 = (char *)v127;
      (*(void (**)(char *, uint64_t))(v125 + 8))(v71, v77);
      _os_log_impl(&dword_21190D000, v67, v68, "FMImageCache: Found cached data for request: %s in memory cache.", v72, 0xCu);
      swift_arrayDestroy();
      v78 = v74;
      v45 = v118;
      MEMORY[0x212BE48A0](v78, -1, -1);
      MEMORY[0x212BE48A0](v72, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v64);
    }

    v94 = v123;
    if (v123)
    {
      v95 = v114;
      (*((void (**)(char *, char *, uint64_t))v35 + 2))(v114, v62, v45);
      v96 = v116;
      swift_storeEnumTagMultiPayload();
      v94(v95);
      (*(void (**)(char *, uint64_t))(v115 + 8))(v95, v96);
    }
    v97 = v124;
    ((void (*)(uint64_t, char *, uint64_t))v122)(v124, v62, v45);
    return (*((uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))v35 + 7))(v97, 0, 1, v45);
  }
}

uint64_t sub_211A34CC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  _QWORD v10[6];

  v1 = v0;
  if (qword_254AC7B80 != -1)
    swift_once();
  v2 = sub_211A47748();
  sub_21194F3E0(v2, (uint64_t)qword_254ADC7E8);
  v3 = sub_211A47724();
  v4 = sub_211A47D30();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21190D000, v3, v4, "FMImageCache: Purging cache...", v5, 2u);
    MEMORY[0x212BE48A0](v5, -1, -1);
  }

  v6 = *(NSObject **)(v1 + 24);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_211A385BC;
  *(_QWORD *)(v7 + 24) = v1;
  v10[4] = sub_2119213A8;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_211921368;
  v10[3] = &unk_24CCCF588;
  v8 = _Block_copy(v10);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v8);
  _Block_release(v8);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v6 & 1) != 0)
    __break(1u);
  return result;
}

void sub_211A34E78(_QWORD *a1)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, unint64_t, uint64_t);
  id v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  id v49[9];

  v49[7] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_211958C38(&qword_254AC8C98);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_211A4713C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v43 - v13;
  swift_getAssociatedConformanceWitness();
  v15 = sub_211A47838();
  swift_beginAccess();
  a1[4] = v15;
  swift_bridgeObjectRelease();
  swift_getTupleTypeMetadata2();
  sub_211A47AF0();
  v16 = sub_211A47874();
  swift_beginAccess();
  a1[6] = v16;
  swift_bridgeObjectRelease();
  v46 = (id)objc_opt_self();
  v17 = objc_msgSend(v46, sel_defaultManager);
  (*(void (**)(void))(*a1 + 160))();
  v18 = (void *)sub_211A47100();
  v47 = *(void (**)(char *, uint64_t))(v7 + 8);
  v47(v14, v6);
  v49[0] = 0;
  v19 = objc_msgSend(v17, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v18, 0, 5, v49);

  v20 = v49[0];
  if (!v19)
  {
    v31 = v20;
    v32 = (void *)sub_211A470DC();

    swift_willThrow();
LABEL_13:
    if (qword_254AC7B80 != -1)
      swift_once();
    v34 = sub_211A47748();
    sub_21194F3E0(v34, (uint64_t)qword_254ADC7E8);
    v35 = v32;
    v36 = v32;
    v37 = sub_211A47724();
    v38 = sub_211A47D30();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = (void *)swift_slowAlloc();
      v49[0] = v40;
      *(_DWORD *)v39 = 136315138;
      swift_getErrorValue();
      v41 = sub_211A482DC();
      v48 = sub_211950A9C(v41, v42, (uint64_t *)v49);
      sub_211A47E2C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21190D000, v37, v38, "FMImageCache: Error deleting file : %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v40, -1, -1);
      MEMORY[0x212BE48A0](v39, -1, -1);

    }
    else
    {

    }
    return;
  }
  v21 = sub_211A47AA8();

  v22 = *(_QWORD *)(v21 + 16);
  if (v22)
  {
    v23 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v43 = v21;
    v24 = v21 + v23;
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v44 = *(_QWORD *)(v7 + 72);
    v45 = v25;
    while (1)
    {
      v45(v5, v24, v6);
      v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v26(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
      v27 = objc_msgSend(v46, sel_defaultManager, v43);
      v28 = (void *)sub_211A47100();
      v49[0] = 0;
      v29 = objc_msgSend(v27, sel_removeItemAtURL_error_, v28, v49);

      if (!v29)
        break;
      v30 = v49[0];
      v47(v10, v6);
      v24 += v44;
      if (!--v22)
        goto LABEL_10;
    }
    v33 = v49[0];
    swift_bridgeObjectRelease();
    v32 = (void *)sub_211A470DC();

    swift_willThrow();
    v47(v10, v6);
    goto LABEL_13;
  }
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
LABEL_10:
  v26(v5, 1, 1, v6);
  swift_bridgeObjectRelease();
}

uint64_t sub_211A353F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[6];

  v4 = v3;
  v29 = a2;
  v30 = a3;
  v6 = *v3;
  v32 = sub_211A4779C();
  v35 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32, v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_211A477D8();
  v33 = *(_QWORD *)(v10 - 8);
  v34 = v10;
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v6 + 80);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v12, v18);
  v19 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v4[3];
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, a1, v15);
  v20 = (*(unsigned __int8 *)(v16 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v21 = (v17 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v15;
  *(_OWORD *)(v22 + 24) = *(_OWORD *)(v6 + 88);
  *(_QWORD *)(v22 + 40) = *(_QWORD *)(v6 + 104);
  *(_QWORD *)(v22 + 48) = v4;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v22 + v20, v19, v15);
  v23 = (uint64_t *)(v22 + v21);
  v25 = v29;
  v24 = v30;
  *v23 = v29;
  v23[1] = v24;
  aBlock[4] = sub_211A38B2C;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21192382C;
  aBlock[3] = &unk_24CCCF888;
  v26 = _Block_copy(aBlock);
  swift_retain();
  sub_2119B8E00(v25);
  sub_211A477B4();
  v36 = MEMORY[0x24BEE4AF8];
  sub_211910908((unint64_t *)&qword_254ACC340, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_211958C38((uint64_t *)&unk_254ACC1D0);
  sub_21193AC34((unint64_t *)&qword_254ACC350, (uint64_t *)&unk_254ACC1D0);
  v27 = v32;
  sub_211A47EA4();
  MEMORY[0x212BE3BC8](0, v14, v9, v26);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v27);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v34);
  return swift_release();
}

void sub_211A35688(NSObject *a1, NSObject *a2, NSObject *a3)
{
  NSObject *v3;
  _QWORD *isa;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  Class v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(char *, NSObject *, uint64_t);
  NSObject *v35;
  NSObject *v36;
  char v37;
  NSObject *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject **v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  char *v61;
  NSObject *v62;
  NSObject *v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  NSObject *v71;
  void (*v72)(char *, NSObject *, uint64_t);
  uint64_t v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  char *v83;
  char *v84;
  NSObject *v85;
  uint64_t AssociatedConformanceWitness;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t v97;
  void (*v98)(char *, NSObject *, uint64_t);
  uint64_t v99;
  uint64_t aBlock[6];

  v85 = a3;
  v94 = a2;
  v96 = a1;
  isa = v3->isa;
  v5 = *((_QWORD *)v3->isa + 10);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1, a2);
  v92 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v84 = (char *)&v81 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10, v12);
  v91 = (char *)&v81 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v83 = (char *)&v81 - v17;
  v90 = v18;
  MEMORY[0x24BDAC7A8](v16, v19);
  v21 = (char *)&v81 - v20;
  v22 = isa[12];
  v23 = sub_211A47E14();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v25);
  v27 = (char *)&v81 - v26;
  swift_beginAccess();
  v95 = v3;
  v28 = v3[6].isa;
  v29 = v21;
  v30 = isa[11];
  v88 = isa[13];
  v87 = v30;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v31 = *(_QWORD *)(AssociatedConformanceWitness + 16);
  swift_bridgeObjectRetain();
  v32 = v96;
  v93 = v31;
  MEMORY[0x212BE36A0](v96, v28, v5, v22, v31);
  swift_bridgeObjectRelease();
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48);
  v89 = v22;
  LODWORD(v28) = v33(v27, 1, v22);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
  v34 = *(void (**)(char *, NSObject *, uint64_t))(v6 + 16);
  v35 = v32;
  v97 = v6;
  v98 = v34;
  v34(v29, v32, v5);
  if ((_DWORD)v28 == 1)
  {
    v36 = v95 + 4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v37 = sub_211A47C88();
    swift_bridgeObjectRelease();
    v38 = *(NSObject **)(v97 + 8);
    v39 = v5;
    ((void (*)(char *, uint64_t))v38)(v29, v5);
    if ((v37 & 1) == 0)
    {
LABEL_13:
      v94 = v36;
      if (qword_254AC7B80 != -1)
        swift_once();
      v60 = sub_211A47748();
      sub_21194F3E0(v60, (uint64_t)qword_254ADC7E8);
      v61 = v83;
      v62 = v35;
      v98(v83, v35, v39);
      v63 = sub_211A47724();
      v64 = sub_211A47D30();
      v65 = os_log_type_enabled(v63, v64);
      v82 = v38;
      if (v65)
      {
        v66 = (uint8_t *)swift_slowAlloc();
        v67 = swift_slowAlloc();
        aBlock[0] = v67;
        *(_DWORD *)v66 = 136315138;
        v92 = (char *)(v66 + 4);
        v68 = sub_211A4821C();
        v99 = sub_211950A9C(v68, v69, aBlock);
        sub_211A47E2C();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v38)(v61, v39);
        _os_log_impl(&dword_21190D000, v63, v64, "FMImageCache: Attempting to load request: %s", v66, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x212BE48A0](v67, -1, -1);
        MEMORY[0x212BE48A0](v66, -1, -1);
      }
      else
      {
        ((void (*)(char *, uint64_t))v38)(v61, v39);
      }

      v70 = v91;
      v71 = v35;
      v72 = v98;
      v98(v91, v35, v39);
      v73 = swift_allocObject();
      swift_weakInit();
      v74 = v84;
      v72(v84, v62, v39);
      v75 = v97;
      v76 = (*(unsigned __int8 *)(v97 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
      v77 = (char *)swift_allocObject();
      v78 = v87;
      *((_QWORD *)v77 + 2) = v39;
      *((_QWORD *)v77 + 3) = v78;
      v79 = v88;
      *((_QWORD *)v77 + 4) = v89;
      *((_QWORD *)v77 + 5) = v79;
      *((_QWORD *)v77 + 6) = v73;
      (*(void (**)(char *, char *, uint64_t))(v75 + 32))(&v77[v76], v74, v39);
      v80 = (void *)(*(uint64_t (**)(char *, uint64_t (*)(void *, unint64_t, char), char *, uint64_t, uint64_t))(v79 + 24))(v70, sub_211A38894, v77, v78, v79);
      -[objc_class addOperation:](v95[2].isa, sel_addOperation_, v80);
      v98(v74, v71, v39);
      swift_beginAccess();
      sub_211A47C94();
      sub_211A47C64();
      ((void (*)(char *, uint64_t))v82)(v70, v39);
      swift_endAccess();

      return;
    }
  }
  else
  {
    v38 = *(NSObject **)(v97 + 8);
    ((void (*)(char *, uint64_t))v38)(v29, v5);
  }
  v40 = v92;
  if (qword_254AC7B80 != -1)
    swift_once();
  v41 = sub_211A47748();
  sub_21194F3E0(v41, (uint64_t)qword_254ADC7E8);
  v98(v40, v32, v5);
  v42 = sub_211A47724();
  v43 = sub_211A47D30();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = v38;
    v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)v44 = 136315138;
    v47 = sub_211A4821C();
    v99 = sub_211950A9C(v47, v48, aBlock);
    sub_211A47E2C();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v45)(v40, v5);
    _os_log_impl(&dword_21190D000, v42, v43, "FMImageCache: Loading declined, we are already processing similar location: %s", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v46, -1, -1);
    MEMORY[0x212BE48A0](v44, -1, -1);
  }
  else
  {
    ((void (*)(char *, uint64_t))v38)(v40, v5);
  }

  v38 = v94;
  if (v94)
  {
    v35 = v95;
    v36 = v95[3].isa;
    v49 = v91;
    v98(v91, v96, v5);
    v50 = v5;
    v51 = v97;
    v52 = (*(unsigned __int8 *)(v97 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
    v53 = (v90 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
    v54 = (char *)swift_allocObject();
    v55 = v87;
    *((_QWORD *)v54 + 2) = v50;
    *((_QWORD *)v54 + 3) = v55;
    v56 = v88;
    *((_QWORD *)v54 + 4) = v89;
    *((_QWORD *)v54 + 5) = v56;
    *((_QWORD *)v54 + 6) = v35;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(&v54[v52], v49, v50);
    v57 = (NSObject **)&v54[v53];
    v58 = v85;
    *v57 = v38;
    v57[1] = v58;
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = sub_211A387BC;
    *(_QWORD *)(v39 + 24) = v54;
    aBlock[4] = (uint64_t)sub_2119778B8;
    aBlock[5] = v39;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_211921368;
    aBlock[3] = (uint64_t)&unk_24CCCF770;
    v59 = _Block_copy(aBlock);
    sub_2119B8E00((uint64_t)v38);
    sub_2119B8E00((uint64_t)v38);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v36, v59);
    sub_2119BA4CC((uint64_t)v38);
    _Block_release(v59);
    LOBYTE(v59) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v59 & 1) != 0)
    {
      __break(1u);
      goto LABEL_13;
    }
  }
}

uint64_t sub_211A35F68(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[4];
  uint64_t v26;

  v20 = a3;
  v21 = a4;
  v6 = (_QWORD *)*a1;
  v7 = *(_QWORD *)(*a1 + 80);
  v22 = *(_QWORD *)(v7 - 8);
  v23 = MEMORY[0x24BDAC7A8](a1 + 5, a2);
  v24 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = a1[5];
  v10 = v6[12];
  swift_bridgeObjectRetain();
  sub_21195E2C0(&qword_254ACC360);
  sub_211A48354();
  swift_getFunctionTypeMetadata1();
  v11 = sub_211A47B44();
  v12 = v6[13];
  v13 = v6[11];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x212BE36A0](v25, a2, v9, v7, v11, *(_QWORD *)(AssociatedConformanceWitness + 16));
  swift_bridgeObjectRelease();
  v15 = v25[0];
  if (!v25[0])
    v15 = sub_211A47AF0();
  v26 = v15;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v7;
  v16[3] = v13;
  v16[4] = v10;
  v16[5] = v12;
  v17 = v21;
  v16[6] = v20;
  v16[7] = v17;
  v25[0] = sub_211A38A88;
  v25[1] = v16;
  swift_retain();
  sub_211A47B2C();
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, a2, v7);
  v25[3] = v26;
  swift_beginAccess();
  sub_211A47880();
  sub_211A47898();
  return swift_endAccess();
}

uint64_t sub_211A36180(void *a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD aBlock[6];

  v43 = a7;
  v44 = a8;
  v42 = a5;
  v45 = a3;
  v46 = a1;
  v47 = a2;
  v10 = sub_211A4779C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_211A477D8();
  v48 = *(_QWORD *)(v15 - 8);
  v49 = v15;
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(a6 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  MEMORY[0x24BDAC7A8](v17, v22);
  v23 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v39 = a9;
    v41 = *(id *)(result + 24);
    swift_release();
    v25 = swift_allocObject();
    v40 = v14;
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v42, a6);
    v26 = (*(unsigned __int8 *)(v20 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    v27 = (v21 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
    v42 = v11;
    v28 = v10;
    v29 = (char *)swift_allocObject();
    v30 = v43;
    *((_QWORD *)v29 + 2) = a6;
    *((_QWORD *)v29 + 3) = v30;
    v31 = v39;
    *((_QWORD *)v29 + 4) = v44;
    *((_QWORD *)v29 + 5) = v31;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v29[v26], v23, a6);
    *(_QWORD *)&v29[v27] = v25;
    v32 = &v29[(v27 + 15) & 0xFFFFFFFFFFFFFFF8];
    v34 = v46;
    v33 = v47;
    *(_QWORD *)v32 = v46;
    *((_QWORD *)v32 + 1) = v33;
    LOBYTE(v27) = v45 & 1;
    v32[16] = v45 & 1;
    aBlock[4] = sub_211A38970;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21192382C;
    aBlock[3] = &unk_24CCCF810;
    v35 = _Block_copy(aBlock);
    swift_retain();
    sub_211A389D4(v34, v33, v27);
    sub_211A477B4();
    v50 = MEMORY[0x24BEE4AF8];
    sub_211910908((unint64_t *)&qword_254ACC340, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    sub_211958C38((uint64_t *)&unk_254ACC1D0);
    sub_21193AC34((unint64_t *)&qword_254ACC350, (uint64_t *)&unk_254ACC1D0);
    v36 = v40;
    sub_211A47EA4();
    v37 = v41;
    MEMORY[0x212BE3BC8](0, v19, v36, v35);
    _Block_release(v35);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v36, v28);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v19, v49);
    swift_release();
    return swift_release();
  }
  return result;
}

_QWORD *sub_211A364F0(uint64_t a1, uint64_t a2, void *a3, void (*a4)(char *, char *, uint64_t), int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t TupleTypeMetadata2;
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
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  _QWORD *result;
  uint64_t v57;
  char *v58;
  char *v59;
  _QWORD *v60;
  uint64_t *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  int v68;
  _BOOL4 v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t (*v75)(_QWORD, _QWORD, _QWORD);
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  char *v84;
  void (*v85)(_QWORD, _QWORD, _QWORD);
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  void (*v114)(uint64_t, _QWORD *);
  id v115;
  char *v116;
  _QWORD v117[2];
  char *v118;
  uint64_t v119;
  uint64_t *v120;
  char *v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  void *v126;
  void (*v127)(char *, char *, uint64_t);
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t (*v134)(_QWORD, _QWORD, _QWORD);
  char *v135;
  char *AssociatedConformanceWitness;
  void (*v137)(char *, uint64_t, uint64_t);
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t (*v147)(_QWORD, _QWORD, _QWORD);

  v142 = a7;
  v125 = a5;
  v127 = a4;
  v126 = a3;
  v13 = sub_211A47E14();
  v129 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v14);
  v128 = (char *)v117 - v15;
  sub_21195E2C0(&qword_254ACC360);
  v16 = sub_211A48354();
  v123 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v17);
  v122 = (_QWORD *)((char *)v117 - v18);
  v19 = sub_211A47E14();
  MEMORY[0x24BDAC7A8](v19, v20);
  v118 = (char *)v117 - v21;
  v143 = a8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v119 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v23 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2, TupleTypeMetadata2);
  v120 = (_QWORD *)((char *)v117 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v23, v25);
  v121 = (char *)v117 - v26;
  v130 = v27;
  v28 = sub_211A48354();
  v139 = *(_QWORD *)(v28 - 8);
  v140 = v28;
  v30 = MEMORY[0x24BDAC7A8](v28, v29);
  v135 = (char *)v117 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v30, v32);
  v138 = (_QWORD *)((char *)v117 - v34);
  v35 = *(_QWORD *)(a6 - 8);
  v37 = MEMORY[0x24BDAC7A8](v33, v36);
  AssociatedConformanceWitness = (char *)v117 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x24BDAC7A8](v37, v39);
  v132 = (char *)v117 - v41;
  MEMORY[0x24BDAC7A8](v40, v42);
  v44 = (char *)v117 - v43;
  v134 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(a2 + 16);
  if (qword_254AC7B80 != -1)
    swift_once();
  v45 = sub_211A47748();
  v46 = sub_21194F3E0(v45, (uint64_t)qword_254ADC7E8);
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v141 = a1;
  v137 = v47;
  v47(v44, a1, a6);
  v117[1] = v46;
  v48 = sub_211A47724();
  v49 = sub_211A47D30();
  v50 = os_log_type_enabled(v48, v49);
  v124 = v13;
  v131 = v16;
  v133 = a9;
  if (v50)
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    v147 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v52;
    *(_DWORD *)v51 = 136315138;
    swift_getAssociatedConformanceWitness();
    v53 = sub_211A4821C();
    v146 = sub_211950A9C(v53, v54, (uint64_t *)&v147);
    sub_211A47E2C();
    swift_bridgeObjectRelease();
    v55 = *(void (**)(char *, uint64_t))(v35 + 8);
    v55(v44, a6);
    _os_log_impl(&dword_21190D000, v48, v49, "FMImageCache: Finished loading request: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE48A0](v52, -1, -1);
    MEMORY[0x212BE48A0](v51, -1, -1);
  }
  else
  {
    v55 = *(void (**)(char *, uint64_t))(v35 + 8);
    v55(v44, a6);
  }

  swift_beginAccess();
  result = (_QWORD *)swift_weakLoadStrong();
  v57 = v143;
  v58 = AssociatedConformanceWitness;
  v59 = v135;
  if (result)
  {
    v60 = result;
    v61 = v138;
    sub_211A37278(v126, (unint64_t)v127, v125 & 1, result, v138);
    (*(void (**)(char *, uint64_t *, uint64_t))(v139 + 16))(v59, v61, v140);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v62 = *(char **)v59;
      v63 = v141;
      v137(v58, v141, a6);
      v64 = v62;
      v65 = v62;
      v66 = sub_211A47724();
      v67 = sub_211A47D30();
      v68 = v67;
      v69 = os_log_type_enabled(v66, v67);
      v135 = v62;
      if (v69)
      {
        v70 = swift_slowAlloc();
        v134 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
        v147 = v134;
        *(_DWORD *)v70 = 136315394;
        swift_getAssociatedConformanceWitness();
        LODWORD(v130) = v68;
        v71 = sub_211A4821C();
        v144 = sub_211950A9C(v71, v72, (uint64_t *)&v147);
        sub_211A47E2C();
        swift_bridgeObjectRelease();
        v55(v58, a6);
        *(_WORD *)(v70 + 12) = 2080;
        swift_getErrorValue();
        v73 = sub_211A482DC();
        v144 = sub_211950A9C(v73, v74, (uint64_t *)&v147);
        v63 = v141;
        sub_211A47E2C();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21190D000, v66, (os_log_type_t)v130, "FMImageCache: Failed to fetch image for request: %s due to: %s", (uint8_t *)v70, 0x16u);
        v75 = v134;
        swift_arrayDestroy();
        MEMORY[0x212BE48A0](v75, -1, -1);
        MEMORY[0x212BE48A0](v70, -1, -1);
      }
      else
      {
        v55(v58, a6);

      }
      v104 = v131;
      swift_beginAccess();
      v105 = v60[5];
      swift_getFunctionTypeMetadata1();
      v106 = sub_211A47B44();
      AssociatedConformanceWitness = (char *)swift_getAssociatedConformanceWitness();
      v107 = *((_QWORD *)AssociatedConformanceWitness + 2);
      swift_bridgeObjectRetain();
      MEMORY[0x212BE36A0](&v144, v63, v105, a6, v106, v107);
      v108 = swift_bridgeObjectRelease();
      v110 = v135;
      if (v144)
      {
        v145 = v144;
        MEMORY[0x24BDAC7A8](v108, v109);
        v117[-6] = a6;
        v117[-5] = v111;
        v117[-4] = v143;
        v117[-3] = v112;
        v117[-2] = v110;
        MEMORY[0x212BE47C8](MEMORY[0x24BEE12C8], v106);
        sub_211A47A60();
        swift_bridgeObjectRelease();
      }
      v113 = v122;
      *v122 = v110;
      swift_storeEnumTagMultiPayload();
      v114 = *(void (**)(uint64_t, _QWORD *))(*v60 + 288);
      v115 = v110;
      v114(v63, v113);

      (*(void (**)(_QWORD *, uint64_t))(v123 + 8))(v113, v104);
      v103 = v124;
    }
    else
    {
      v76 = *(int *)(v130 + 48);
      v77 = v130;
      v78 = v121;
      v79 = &v121[v76];
      v81 = *(_QWORD *)v59;
      v80 = *((_QWORD *)v59 + 1);
      *(_QWORD *)v121 = *(_QWORD *)v59;
      *((_QWORD *)v78 + 1) = v80;
      v82 = *(_QWORD *)(v57 - 8);
      v83 = *(void (**)(char *, char *, uint64_t))(v82 + 32);
      v83(&v78[v76], &v59[v76], v57);
      v137(v132, v141, a6);
      v84 = (char *)v120 + *(int *)(v77 + 48);
      v85 = *(void (**)(_QWORD, _QWORD, _QWORD))(v82 + 16);
      v135 = v79;
      v134 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v85;
      v85(v84, v79, v143);
      v86 = v118;
      v127 = v83;
      v83(v118, v84, v143);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v86, 0, 1, v143);
      swift_beginAccess();
      sub_211926D20(v81, v80);
      AssociatedConformanceWitness = (char *)swift_getAssociatedConformanceWitness();
      v87 = *((_QWORD *)AssociatedConformanceWitness + 2);
      sub_211A47880();
      sub_211A47898();
      swift_endAccess();
      v88 = v141;
      sub_211A3776C(v81, v80, v141);
      swift_beginAccess();
      v89 = v60[5];
      swift_getFunctionTypeMetadata1();
      v90 = sub_211A47B44();
      swift_bridgeObjectRetain();
      v91 = v143;
      MEMORY[0x212BE36A0](&v144, v88, v89, a6, v90, v87);
      v92 = v130;
      v93 = v120;
      swift_bridgeObjectRelease();
      if (v144)
      {
        v145 = v144;
        v94 = (char *)v93 + *(int *)(v92 + 48);
        *v93 = v81;
        v93[1] = v80;
        v95 = v134(v94, v135, v91);
        MEMORY[0x24BDAC7A8](v95, v96);
        v97 = v142;
        v117[-6] = a6;
        v117[-5] = v97;
        v98 = v133;
        v117[-4] = v91;
        v117[-3] = v98;
        v117[-2] = v93;
        sub_211926D20(v81, v80);
        MEMORY[0x212BE47C8](MEMORY[0x24BEE12C8], v90);
        v92 = v130;
        sub_211A47A60();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t *, uint64_t))(v119 + 8))(v93, v92);
      }
      v99 = v92;
      v100 = (char *)v93 + *(int *)(v92 + 48);
      *v93 = v81;
      v93[1] = v80;
      v134(v100, v135, v91);
      sub_21193B8F8(v81, v80);
      v101 = v122;
      v127((char *)v122, v100, v91);
      v102 = v131;
      swift_storeEnumTagMultiPayload();
      v63 = v141;
      (*(void (**)(uint64_t, _QWORD *))(*v60 + 288))(v141, v101);
      (*(void (**)(_QWORD *, uint64_t))(v123 + 8))(v101, v102);
      (*(void (**)(char *, uint64_t))(v119 + 8))(v121, v99);
      v103 = v124;
    }
    swift_beginAccess();
    sub_211A47C94();
    v116 = v128;
    sub_211A47C70();
    (*(void (**)(char *, uint64_t))(v129 + 8))(v116, v103);
    swift_endAccess();
    v137(v132, v63, a6);
    v145 = 0;
    swift_beginAccess();
    swift_getFunctionTypeMetadata1();
    sub_211A47B44();
    sub_211A47880();
    sub_211A47898();
    swift_endAccess();
    swift_release();
    return (_QWORD *)(*(uint64_t (**)(uint64_t *, uint64_t))(v139 + 8))(v138, v140);
  }
  return result;
}

id sub_211A37278@<X0>(void *a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, _QWORD *a4@<X3>, uint64_t *a5@<X8>)
{
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
  char *v19;
  void (*v20)(void *, unint64_t);
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  void (*v27)(char *, char *, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t *v29;
  char *v30;
  unint64_t v31;
  uint64_t *v32;
  unint64_t v33;

  v33 = a2;
  v9 = *(_QWORD *)(*a4 + 96);
  v10 = sub_211A47E14();
  v11 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10, v12);
  v15 = (char *)&v32 - v14;
  v16 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v13, v17);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    *a5 = (uint64_t)a1;
    swift_getTupleTypeMetadata2();
    sub_21195E2C0(&qword_254ACC360);
    sub_211A48354();
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  else
  {
    v32 = a5;
    v20 = (void (*)(void *, unint64_t))a4[7];
    v21 = (uint64_t)a1;
    v22 = a1;
    v23 = v33;
    sub_211926D20(v21, v33);
    v20(v22, v23);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v9) == 1)
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
      sub_211A38A20();
      v24 = swift_allocError();
      *v25 = 1;
      sub_211A38964(v22, v33, 0);
      *v32 = v24;
      swift_getTupleTypeMetadata2();
    }
    else
    {
      v27 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
      v27(v19, v15, v9);
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      v29 = v32;
      v30 = (char *)v32 + *(int *)(TupleTypeMetadata2 + 48);
      v31 = v33;
      *v32 = (uint64_t)v22;
      v29[1] = v31;
      v27(v30, v19, v9);
    }
    sub_21195E2C0(&qword_254ACC360);
    sub_211A48354();
    return (id)swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_211A3753C(void (**a1)(char *), _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t TupleTypeMetadata2;
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
  char *v19;
  uint64_t v20;
  uint64_t v22;
  void (*v23)(char *);

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v9);
  v11 = (char *)&v22 - v10;
  sub_21195E2C0(&qword_254ACC360);
  v12 = sub_211A48354();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v22 - v15;
  v23 = *a1;
  v17 = *(int *)(TupleTypeMetadata2 + 48);
  v18 = &v11[v17];
  v19 = (char *)a2 + v17;
  *(_OWORD *)v11 = *a2;
  v20 = *(_QWORD *)(a5 - 8);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(&v11[v17], v19, a5);
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v16, v18, a5);
  swift_storeEnumTagMultiPayload();
  v23(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_211A3769C(void (**a1)(char *), void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *);
  id v10;
  uint64_t v12;

  sub_21195E2C0(&qword_254ACC360);
  v4 = sub_211A48354();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v12 - v7;
  v9 = *a1;
  *(uint64_t *)((char *)&v12 - v7) = (uint64_t)a2;
  swift_storeEnumTagMultiPayload();
  v10 = a2;
  v9(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

void sub_211A3776C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  void *v7;

  v7 = (void *)MEMORY[0x212BE42D0]();
  sub_211A377CC(v3, a3, a1, a2);
  objc_autoreleasePoolPop(v7);
}

uint64_t sub_211A377CC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
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
  uint64_t v16;
  char *v17;
  void (*v18)(void);
  uint64_t v19;
  uint64_t AssociatedConformanceWitness;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  char *v32;
  void *v33;
  id v34;
  uint64_t inited;
  void **v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  unsigned int v44;
  id v45;
  void *v47;
  void *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t (*v61)(char *, uint64_t);
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  uint64_t (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  char *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  char *v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  char v86;
  id v87[3];

  v80 = a4;
  v79 = a3;
  v87[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v84 = sub_211A4713C();
  v6 = *(_QWORD *)(v84 - 8);
  v8 = MEMORY[0x24BDAC7A8](v84, v7);
  v77 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v75 - v12;
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v17 = (char *)&v75 - v16;
  v18 = *(void (**)(void))(v5 + 160);
  ((void (*)(uint64_t))v18)(v15);
  v19 = *(_QWORD *)(v5 + 80);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v19, AssociatedConformanceWitness);
  v82 = v17;
  sub_211A4710C();
  swift_bridgeObjectRelease();
  v76 = v6;
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22 = v84;
  v21(v13, v84);
  v86 = 0;
  v23 = (void *)objc_opt_self();
  v24 = objc_msgSend(v23, sel_defaultManager);
  v78 = a1;
  v25 = v23;
  v18();
  sub_211A47124();
  v83 = v21;
  v21(v13, v22);
  v26 = (void *)sub_211A478EC();
  swift_bridgeObjectRelease();
  LOBYTE(v17) = objc_msgSend(v24, sel_fileExistsAtPath_isDirectory_, v26, &v86);

  if ((v17 & 1) != 0)
    goto LABEL_3;
  v27 = objc_msgSend(v23, sel_defaultManager);
  v18();
  v28 = (void *)sub_211A47100();
  v83(v13, v84);
  v87[0] = 0;
  v29 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v87);

  v30 = v87[0];
  if (v29)
  {
LABEL_3:
    v31 = v81;
    v32 = v82;
    sub_211A47178();
    v33 = v31;
    if (!v31)
    {
      v34 = objc_msgSend(v25, sel_defaultManager);
      sub_211958C38(&qword_254ACD740);
      inited = swift_initStackObject();
      v36 = (void **)MEMORY[0x24BDD0CF0];
      *(_OWORD *)(inited + 16) = xmmword_211A4A230;
      v37 = *v36;
      *(_QWORD *)(inited + 32) = *v36;
      v38 = (void *)*MEMORY[0x24BDD0CE0];
      type metadata accessor for FileProtectionType(0);
      *(_QWORD *)(inited + 64) = v39;
      *(_QWORD *)(inited + 40) = v38;
      v40 = v37;
      v41 = v38;
      sub_21193B9B4(inited);
      type metadata accessor for FileAttributeKey(0);
      sub_211910908(&qword_254AC7EA0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_211A499E4);
      v42 = (void *)sub_211A47844();
      swift_bridgeObjectRelease();
      sub_211A47124();
      v43 = (void *)sub_211A478EC();
      swift_bridgeObjectRelease();
      v87[0] = 0;
      v44 = objc_msgSend(v34, sel_setAttributes_ofItemAtPath_error_, v42, v43, v87);

      if (v44)
      {
        v45 = v87[0];
        return ((uint64_t (*)(char *, uint64_t))v83)(v32, v84);
      }
      v62 = v87[0];
      v33 = (void *)sub_211A470DC();

      swift_willThrow();
    }
    if (qword_254AC7B80 != -1)
      swift_once();
    v63 = sub_211A47748();
    sub_21194F3E0(v63, (uint64_t)qword_254ADC7E8);
    v64 = v33;
    v65 = v33;
    v66 = sub_211A47724();
    v67 = sub_211A47D24();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v69 = (void *)swift_slowAlloc();
      v87[0] = v69;
      *(_DWORD *)v68 = 136315138;
      swift_getErrorValue();
      v70 = sub_211A482DC();
      v85 = sub_211950A9C(v70, v71, (uint64_t *)v87);
      sub_211A47E2C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21190D000, v66, v67, "FMImageCache: Could not save objects to disk %s", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v69, -1, -1);
      MEMORY[0x212BE48A0](v68, -1, -1);

      v72 = v82;
    }
    else
    {

      v72 = v32;
    }
    return ((uint64_t (*)(char *, uint64_t))v83)(v72, v84);
  }
  else
  {
    v47 = v30;
    v48 = (void *)sub_211A470DC();

    swift_willThrow();
    if (qword_254AC7B80 != -1)
      swift_once();
    v49 = sub_211A47748();
    sub_21194F3E0(v49, (uint64_t)qword_254ADC7E8);
    v50 = v77;
    v51 = v82;
    v52 = v84;
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v77, v82, v84);
    v53 = sub_211A47724();
    v54 = sub_211A47D30();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc();
      v81 = v48;
      v56 = (uint8_t *)v55;
      v57 = (void *)swift_slowAlloc();
      v87[0] = v57;
      *(_DWORD *)v56 = 136315138;
      sub_211910908((unint64_t *)&qword_254ACE770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v58 = sub_211A4821C();
      v85 = sub_211950A9C(v58, v59, (uint64_t *)v87);
      sub_211A47E2C();
      swift_bridgeObjectRelease();
      v60 = v50;
      v61 = (uint64_t (*)(char *, uint64_t))v83;
      v83(v60, v52);
      _os_log_impl(&dword_21190D000, v53, v54, "FMImageCache: Could not create directory for content: %s", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v57, -1, -1);
      MEMORY[0x212BE48A0](v56, -1, -1);

      return v61(v82, v52);
    }
    else
    {

      v73 = v50;
      v74 = (uint64_t (*)(char *, uint64_t))v83;
      v83(v73, v52);
      return v74(v51, v52);
    }
  }
}

id sub_211A37F84()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t AssociatedConformanceWitness;
  void (*v14)(char *, uint64_t);
  id v15;
  void *v16;
  id v17;
  uint64_t v19;

  v1 = *v0;
  v2 = sub_211A4713C();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2, v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v11 = (char *)&v19 - v10;
  (*(void (**)(uint64_t))(v1 + 160))(v9);
  v12 = *(_QWORD *)(v1 + 80);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v12, AssociatedConformanceWitness);
  sub_211A4710C();
  swift_bridgeObjectRelease();
  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v7, v2);
  v15 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_211A47124();
  v16 = (void *)sub_211A478EC();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_fileExistsAtPath_, v16);

  v14(v11, v2);
  return v17;
}

uint64_t sub_211A380EC@<X0>(uint64_t a1@<X8>)
{
  void (**v1)(void);
  void (*v2)(void);
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
  __n128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t AssociatedConformanceWitness;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v51 = a1;
  v2 = *v1;
  v3 = *((_QWORD *)*v1 + 12);
  v4 = sub_211A47E14();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v46 = (char *)&v43 - v6;
  v7 = sub_211A4713C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v48 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v43 - v13;
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  v19 = (char *)&v43 - v18;
  (*((void (**)(__n128))v2 + 20))(v17);
  v20 = *((_QWORD *)v2 + 10);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v20, AssociatedConformanceWitness);
  sub_211A4710C();
  swift_bridgeObjectRelease();
  v22 = v7;
  v50 = *(void (**)(char *, uint64_t))(v8 + 8);
  v50(v14, v7);
  v49 = v19;
  v23 = sub_211A47148();
  v25 = v24;
  v27 = v44;
  v26 = v45;
  v28 = v46;
  v1[7]();
  sub_21193B8F8(v23, v25);
  v29 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v28, 1, v3) == 1)
  {
    v47 = v3;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v26);
    v30 = v48;
    v31 = v22;
    if (qword_254AC7B80 != -1)
      swift_once();
    v32 = sub_211A47748();
    sub_21194F3E0(v32, (uint64_t)qword_254ADC7E8);
    v33 = v49;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v30, v49, v31);
    v34 = sub_211A47724();
    v35 = sub_211A47D30();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v53 = v37;
      *(_DWORD *)v36 = 136315138;
      sub_211910908((unint64_t *)&qword_254ACE770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v38 = sub_211A4821C();
      v52 = sub_211950A9C(v38, v39, &v53);
      sub_211A47E2C();
      swift_bridgeObjectRelease();
      v40 = v50;
      v50(v30, v31);
      _os_log_impl(&dword_21190D000, v34, v35, "FMImageCache: Failed to load cached image from disk: %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE48A0](v37, -1, -1);
      MEMORY[0x212BE48A0](v36, -1, -1);

    }
    else
    {

      v40 = v50;
      v50(v30, v31);
    }
    v40(v33, v31);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v51, 1, 1);
  }
  else
  {
    v50(v49, v22);
    v42 = v51;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v51, v28, v3);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v29 + 56))(v42, 0, 1);
  }
}

uint64_t FMImageCache.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t FMImageCache.__deallocating_deinit()
{
  FMImageCache.deinit();
  return swift_deallocClassInstance();
}

BOOL sub_211A3854C()
{
  return (sub_211A37F84() & 1) == 0;
}

uint64_t sub_211A38578@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_211A385A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_211A34268(*(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

void sub_211A385BC()
{
  _QWORD *v0;

  sub_211A34E78(v0);
}

uint64_t sub_211A385C4()
{
  return swift_deallocObject();
}

unint64_t sub_211A385D8()
{
  unint64_t result;

  result = qword_254ACEBD8[0];
  if (!qword_254ACEBD8[0])
  {
    result = MEMORY[0x212BE47C8](&protocol conformance descriptor for FMImageCacheError, &type metadata for FMImageCacheError);
    atomic_store(result, qword_254ACEBD8);
  }
  return result;
}

uint64_t dispatch thunk of FMImageCacheRequest.fileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of FMImageCacheOperation.init(request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t storeEnumTagSinglePayload for FMImageCacheError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_211A38678 + 4 * byte_211A51785[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_211A386AC + 4 * byte_211A51780[v4]))();
}

uint64_t sub_211A386AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A386B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x211A386BCLL);
  return result;
}

uint64_t sub_211A386C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x211A386D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_211A386D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A386DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMImageCacheError()
{
  return &type metadata for FMImageCacheError;
}

uint64_t dispatch thunk of FMImageCache.cacheRoot.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FMImageCache.__allocating_init(converter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of FMImageCache.cachedImage(for:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of FMImageCache.purge()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of FMImageCache.forwardToDelegate(request:result:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t sub_211A38730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A387BC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_211A35F68(*(_QWORD **)(v0 + 48), v0 + v2, *v3, v3[1]);
}

uint64_t sub_211A387F4()
{
  return swift_deallocObject();
}

uint64_t sub_211A38804()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_211A38828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_211A38894(void *a1, unint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v3[2];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  return sub_211A36180(a1, a2, a3 & 1, v3[6], (uint64_t)v3 + ((v5 + 56) & ~v5), v4, v3[3], v3[4], v3[5]);
}

uint64_t sub_211A388D8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  swift_release();
  sub_211A38964(*(id *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_BYTE *)(v0 + v3 + 16));
  return swift_deallocObject();
}

void sub_211A38964(id a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    sub_21193B8F8((uint64_t)a1, a2);
}

_QWORD *sub_211A38970()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = v0[2];
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_211A364F0((uint64_t)v0 + v3, *(_QWORD *)((char *)v0 + v4), *(void **)((char *)v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(char *, char *, uint64_t))((char *)v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *((unsigned __int8 *)v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 16), v1, v0[3], v0[4], v0[5]);
}

id sub_211A389D4(id a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)sub_211926D20((uint64_t)a1, a2);
}

uint64_t sub_211A389E0(void (**a1)(char *))
{
  uint64_t v1;

  return sub_211A3769C(a1, *(void **)(v1 + 48));
}

uint64_t sub_211A38A00(void (**a1)(char *))
{
  uint64_t v1;

  return sub_211A3753C(a1, *(_OWORD **)(v1 + 48), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

unint64_t sub_211A38A20()
{
  unint64_t result;

  result = qword_254ACEC60;
  if (!qword_254ACEC60)
  {
    result = MEMORY[0x212BE47C8](&protocol conformance descriptor for FMImageCacheError, &type metadata for FMImageCacheError);
    atomic_store(result, (unint64_t *)&qword_254ACEC60);
  }
  return result;
}

uint64_t sub_211A38A64()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_211A38A88()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_211A38AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  if (*(_QWORD *)(v0 + v4))
    swift_release();
  return swift_deallocObject();
}

void sub_211A38B2C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_211A35688((v0 + v2), *(NSObject **)(v0 + v3), *(NSObject **)(v0 + v3 + 8));
}

void sub_211A38B98()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  os_log_t oslog;
  NSObject *osloga;
  uint64_t v33;

  v1 = objc_msgSend(*(id *)(v0 + 32), sel_aa_primaryAppleAccount);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_aa_personID);
    if (v3)
    {
      v4 = sub_211A47910();
      oslog = v5;
    }
    else
    {
      v4 = 0;
      oslog = 0;
    }
    v9 = (void *)objc_opt_self();
    v10 = (void *)sub_211A478EC();
    v11 = (void *)sub_211A478EC();
    v30 = v9;
    v12 = objc_msgSend(v9, sel_stringForKey_inDomain_, v10, v11);

    if (v12)
    {
      v13 = sub_211A47910();
      v15 = v14;

      if (oslog)
      {
        if (v15)
        {
          if (v4 == v13 && oslog == v15)
          {
            swift_bridgeObjectRelease();
LABEL_26:
            if (qword_254AC7B80 != -1)
              swift_once();
            v21 = sub_211A47748();
            sub_21194F3E0(v21, (uint64_t)qword_254ADC7E8);
            swift_bridgeObjectRetain();
            v22 = sub_211A47724();
            v23 = sub_211A47D30();
            if (os_log_type_enabled(v22, v23))
            {
              v24 = (uint8_t *)swift_slowAlloc();
              v25 = swift_slowAlloc();
              v33 = v25;
              *(_DWORD *)v24 = 136315138;
              swift_bridgeObjectRetain();
              sub_211958C38(&qword_254AC7C58);
              v26 = sub_211A47928();
              sub_211950A9C(v26, v27, &v33);
              sub_211A47E2C();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_21190D000, v22, v23, "FMFGarbageCollector: saveFmfPersonID new: %s", v24, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x212BE48A0](v25, -1, -1);
              MEMORY[0x212BE48A0](v24, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            v28 = (void *)sub_211A478EC();
            v29 = (void *)sub_211A478EC();
            objc_msgSend(v30, sel_setString_forKey_inDomain_, v3, v28, v29);

            return;
          }
          v16 = sub_211A48258();
          swift_bridgeObjectRelease();
          if ((v16 & 1) != 0)
            goto LABEL_26;
        }
      }
      else
      {
        if (!v15)
          goto LABEL_26;
        swift_bridgeObjectRelease();
      }
    }
    else if (!oslog)
    {
      goto LABEL_26;
    }
    if (qword_254AC7B80 != -1)
      swift_once();
    v17 = sub_211A47748();
    sub_21194F3E0(v17, (uint64_t)qword_254ADC7E8);
    v18 = sub_211A47724();
    v19 = sub_211A47D30();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21190D000, v18, v19, "FMFGarbageCollector: purging cache because person id are not matching.", v20, 2u);
      MEMORY[0x212BE48A0](v20, -1, -1);
    }

    sub_211A399CC();
    goto LABEL_26;
  }
  if (qword_254AC7B80 != -1)
    swift_once();
  v6 = sub_211A47748();
  sub_21194F3E0(v6, (uint64_t)qword_254ADC7E8);
  osloga = sub_211A47724();
  v7 = sub_211A47D24();
  if (os_log_type_enabled(osloga, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21190D000, osloga, v7, "FMFGarbageCollector: saveFmfPersonID - error retrieving primary account", v8, 2u);
    MEMORY[0x212BE48A0](v8, -1, -1);
  }

}

uint64_t sub_211A39078(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[2];
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_211A4779C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v20[0] = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_211A477D8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void **)(v2 + 64);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v2;
  *(_QWORD *)(v15 + 24) = a1;
  aBlock[4] = sub_211A39E88;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21192382C;
  aBlock[3] = &unk_24CCCF968;
  v16 = _Block_copy(aBlock);
  v17 = v14;
  swift_retain();
  v18 = a1;
  sub_211A477B4();
  v20[1] = MEMORY[0x24BEE4AF8];
  sub_211910908((unint64_t *)&qword_254ACC340, v5, MEMORY[0x24BEE5468]);
  sub_211958C38((uint64_t *)&unk_254ACC1D0);
  sub_21193AC34((unint64_t *)&qword_254ACC350, (uint64_t *)&unk_254ACC1D0);
  sub_211A47EA4();
  MEMORY[0x212BE3BC8](0, v13, v8, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20[0] + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return swift_release();
}

void sub_211A39274(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD v18[10];
  __int128 v19;
  __int128 v20;

  if (qword_254AC7B80 != -1)
    swift_once();
  v4 = sub_211A47748();
  sub_21194F3E0(v4, (uint64_t)qword_254ADC7E8);
  swift_retain();
  v5 = sub_211A47724();
  v6 = sub_211A47D30();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    v18[0] = *(unsigned __int8 *)(a1 + 41);
    sub_211A47E2C();
    swift_release();
    _os_log_impl(&dword_21190D000, v5, v6, "FMFGarbageCollector: scheduleAccountVerification alreadyPending?: %{BOOL}d", v7, 8u);
    MEMORY[0x212BE48A0](v7, -1, -1);

    if ((*(_BYTE *)(a1 + 41) & 1) != 0)
      return;
  }
  else
  {

    swift_release();
    if ((*(_BYTE *)(a1 + 41) & 1) != 0)
      return;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v8 = objc_msgSend(a2, sel_userInfo);
    if (!v8)
      return;
    v9 = v8;
    v10 = sub_211A4785C();

    v16 = sub_211A47910();
    v17 = v11;
    sub_211A47F1C();
    if (*(_QWORD *)(v10 + 16) && (v12 = sub_2119B1D60((uint64_t)v18), (v13 & 1) != 0))
    {
      sub_211950B6C(*(_QWORD *)(v10 + 56) + 32 * v12, (uint64_t)&v19);
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_21196D990((uint64_t)v18);
    if (!*((_QWORD *)&v20 + 1))
    {
      sub_21193999C((uint64_t)&v19);
      return;
    }
    if ((swift_dynamicCast() & 1) == 0)
      return;
    v14 = *(_QWORD *)(a1 + 56);
    if (!v14)
    {
      swift_bridgeObjectRelease();
      return;
    }
    if (v16 == *(_QWORD *)(a1 + 48) && v14 == v17)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = sub_211A48258();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
        return;
    }
  }
  sub_211A39544();
}

uint64_t sub_211A39544()
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint8_t *v30;
  uint8_t *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  void *v35;
  uint64_t v36;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_211A4779C();
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_211A477D8();
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_211A477F0();
  v39 = *(_QWORD *)(v10 - 8);
  v40 = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v38 - v16;
  v18 = sub_211A477A8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20);
  v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v0 + 41) = 1;
  if (qword_254AC7B80 != -1)
    swift_once();
  v23 = sub_211A47748();
  sub_21194F3E0(v23, (uint64_t)qword_254ADC7E8);
  v24 = sub_211A47724();
  v25 = sub_211A47D30();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v38 = v17;
    v27 = v9;
    v28 = v5;
    v29 = v1;
    v30 = v26;
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_21190D000, v24, v25, "FMFGarbageCollector: Dispatching verification on background", v26, 2u);
    v31 = v30;
    v1 = v29;
    v5 = v28;
    v9 = v27;
    v17 = v38;
    MEMORY[0x212BE48A0](v31, -1, -1);
  }

  sub_211920E14();
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v22, *MEMORY[0x24BEE5470], v18);
  v32 = (void *)sub_211A47DCC();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  sub_211A477E4();
  MEMORY[0x212BE361C](v13, 0.2);
  v33 = v40;
  v34 = *(void (**)(char *, uint64_t))(v39 + 8);
  v34(v13, v40);
  aBlock[4] = sub_211A39E7C;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21192382C;
  aBlock[3] = &unk_24CCCF918;
  v35 = _Block_copy(aBlock);
  swift_retain();
  sub_211A477B4();
  v45 = MEMORY[0x24BEE4AF8];
  sub_211910908((unint64_t *)&qword_254ACC340, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_211958C38((uint64_t *)&unk_254ACC1D0);
  sub_21193AC34((unint64_t *)&qword_254ACC350, (uint64_t *)&unk_254ACC1D0);
  v36 = v44;
  sub_211A47EA4();
  MEMORY[0x212BE3B80](v17, v9, v5, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v5, v36);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v42);
  v34(v17, v33);
  return swift_release();
}

void sub_211A398F0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_254AC7B80 != -1)
    swift_once();
  v2 = sub_211A47748();
  sub_21194F3E0(v2, (uint64_t)qword_254ADC7E8);
  v3 = sub_211A47724();
  v4 = sub_211A47D30();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21190D000, v3, v4, "FMFGarbageCollector: Async verifying account", v5, 2u);
    MEMORY[0x212BE48A0](v5, -1, -1);
  }

  sub_211926D64();
  *(_BYTE *)(a1 + 41) = 0;
}

void sub_211A399CC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34[4];

  v1 = v0;
  v34[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(v0 + 40) == 1)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v3 = *(_QWORD *)(v0 + 88);
    v32 = *(_QWORD *)(v3 + 16);
    if (!v32)
    {
LABEL_27:
      if (MEMORY[0x212BE496C](v1 + 72))
      {
        sub_2119EA930();

        swift_unknownObjectRelease();
      }
      else
      {

      }
      return;
    }
    v30 = v0;
    v33 = v3 + 32;
    swift_bridgeObjectRetain();
    v4 = 0;
    v1 = v32;
    v31 = v3;
    while (v4 < *(_QWORD *)(v3 + 16))
    {
      v5 = v33 + 16 * v4;
      v7 = *(void **)v5;
      v6 = *(void **)(v5 + 8);
      swift_bridgeObjectRetain();
      v8 = (void *)sub_211A478EC();
      v34[0] = 0;
      v9 = objc_msgSend(v2, sel_contentsOfDirectoryAtPath_error_, v8, v34);

      v10 = v34[0];
      if (v9)
      {
        v11 = sub_211A47AA8();
        v12 = v10;

        v13 = *(_QWORD *)(v11 + 16);
        if (v13)
        {
          v14 = v11 + 40;
          for (i = v13 - 1; ; --i)
          {
            v34[0] = v7;
            v34[1] = v6;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_211A479B8();
            swift_bridgeObjectRelease();
            v16 = (void *)sub_211A478EC();
            swift_bridgeObjectRelease();
            v34[0] = 0;
            v17 = objc_msgSend(v2, sel_removeItemAtPath_error_, v16, v34);

            if (!v17)
            {
              v19 = v34[0];
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v3 = v31;
              v1 = v32;
              goto LABEL_16;
            }
            if (!i)
              break;
            v14 += 16;
            v18 = v34[0];
          }
          v25 = v34[0];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v3 = v31;
          v1 = v32;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        v19 = v34[0];
        swift_bridgeObjectRelease();
LABEL_16:
        v20 = (void *)sub_211A470DC();

        swift_willThrow();
        if (qword_254AC7B80 != -1)
          swift_once();
        v21 = sub_211A47748();
        sub_21194F3E0(v21, (uint64_t)qword_254ADC7E8);
        v22 = sub_211A47724();
        v23 = sub_211A47D24();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_21190D000, v22, v23, "FMFGarbageCollector: Error deleting file", v24, 2u);
          MEMORY[0x212BE48A0](v24, -1, -1);
        }

      }
      if (++v4 == v1)
      {
        swift_bridgeObjectRelease();
        v1 = v30;
        goto LABEL_27;
      }
    }
    __break(1u);
    goto LABEL_32;
  }
  if (qword_254AC7B80 != -1)
LABEL_32:
    swift_once();
  v26 = sub_211A47748();
  sub_21194F3E0(v26, (uint64_t)qword_254ADC7E8);
  v27 = sub_211A47724();
  v28 = sub_211A47D30();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_21190D000, v27, v28, "FMFGarbageCollector: Not purging files since not using cache", v29, 2u);
    MEMORY[0x212BE48A0](v29, -1, -1);
  }

  if (MEMORY[0x212BE496C](v1 + 72))
  {
    sub_2119EA930();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_211A39E30()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_211962AB8(v0 + 72);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_211A39E7C()
{
  uint64_t v0;

  sub_211A398F0(v0);
}

void sub_211A39E88()
{
  uint64_t v0;

  sub_211A39274(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_211A39E90()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 56) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_211A39E9C()
{
  return swift_deallocObject();
}

uint64_t sub_211A39EB0()
{
  return swift_deallocObject();
}

unint64_t sub_211A39ED0(uint64_t a1)
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
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_211958C38(&qword_254ACEE60);
  v2 = sub_211A480CC();
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
    sub_21192C6B8(v6, (uint64_t)&v15, &qword_254ACEE68);
    v7 = v15;
    v8 = v16;
    result = sub_21195BB68(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_211939954((uint64_t)&v17, v3[7] + 32 * result);
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

unint64_t sub_211A3A004(uint64_t a1)
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
  sub_211958C38(&qword_254AC8128);
  v2 = sub_211A480CC();
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
    sub_21192C6B8(v6, (uint64_t)&v15, &qword_254AC8130);
    v7 = v15;
    v8 = v16;
    result = sub_21195BB68(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21193DB98(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_211A3A138(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_211958C38(&qword_254ACEE88);
  v2 = (_QWORD *)sub_211A480CC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_21195BB68(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
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

FMFCore::InitialTabInfo __swiftcall InitialTabInfo.init()()
{
  _QWORD *v0;
  uint64_t v1;
  FMFCore::InitialTabInfo result;

  v1 = MEMORY[0x24BEE4AF8];
  *v0 = MEMORY[0x24BEE4AF8];
  v0[1] = v1;
  v0[2] = v1;
  return result;
}

uint64_t sub_211A3A264(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_211A3A29C
                                                            + 4 * asc_211A51990[a1]))(0x65746E6F43706174, 0xEA00000000007478);
}

uint64_t sub_211A3A29C()
{
  return 0x64657463656C6573;
}

unint64_t sub_211A3A2C0()
{
  return 0xD000000000000015;
}

unint64_t sub_211A3A2E0()
{
  return 0xD000000000000012;
}

uint64_t sub_211A3A2FC()
{
  return 1935827316;
}

uint64_t sub_211A3A30C(char *a1, char *a2)
{
  return sub_211975718(*a1, *a2);
}

uint64_t sub_211A3A318()
{
  sub_211A48318();
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

uint64_t sub_211A3A39C()
{
  sub_211A4797C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_211A3A3F4()
{
  sub_211A48318();
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

uint64_t sub_211A3A474@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_211A480F0();
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

void sub_211A3A4D0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 0x626C6C61436E696DLL;
  if (*v1)
    v2 = 0x626C6C614378616DLL;
  *a1 = v2;
  a1[1] = 0xEB000000006B6361;
}

_QWORD *assignWithCopy for InitialTabInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for InitialTabInfo(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InitialTabInfo(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InitialTabInfo(uint64_t result, int a2, int a3)
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

uint64_t sub_211A3A658()
{
  uint64_t v0;

  sub_21193CB88(v0 + qword_254ADC878);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_21193CBC8(*(_QWORD *)(v0 + qword_254ADC898));
}

uint64_t sub_211A3A6BC()
{
  return type metadata accessor for FMFInitRefreshClientRequest();
}

uint64_t storeEnumTagSinglePayload for FMFRefreshReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_211A3A710 + 4 * byte_211A5199A[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_211A3A744 + 4 * byte_211A51995[v4]))();
}

uint64_t sub_211A3A744(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A3A74C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x211A3A754);
  return result;
}

uint64_t sub_211A3A760(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x211A3A768);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_211A3A76C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A3A774(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMFRefreshReason()
{
  return &type metadata for FMFRefreshReason;
}

unint64_t sub_211A3A794()
{
  unint64_t result;

  result = qword_254ACEE20;
  if (!qword_254ACEE20)
  {
    result = MEMORY[0x212BE47C8](&unk_211A51ACC, &type metadata for FMFRefreshReason);
    atomic_store(result, (unint64_t *)&qword_254ACEE20);
  }
  return result;
}

id sub_211A3A7D8()
{
  id v0;
  id result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  result = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  qword_254ACEE90 = (uint64_t)v0;
  *(_QWORD *)algn_254ACEE98 = result;
  return result;
}

id static FMUserDefaults.shared.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v6;

  if (qword_254AC7BD0 != -1)
    swift_once();
  v3 = (void *)qword_254ACEE90;
  v2 = *(_QWORD *)algn_254ACEE98;
  v6 = *(id *)algn_254ACEE98;
  *a1 = qword_254ACEE90;
  a1[1] = v2;
  v4 = v3;
  return v6;
}

Swift::Bool __swiftcall FMUserDefaults.BOOL(for:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = *(void **)(v1 + 8);
  if (!objc_msgSend(*(id *)v1, sel_isInternalBuild))
    return 0;
  v3 = (void *)sub_211A478EC();
  v4 = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return v4;
}

Swift::String_optional __swiftcall FMUserDefaults.string(for:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Swift::String_optional result;

  v2 = *(void **)(v1 + 8);
  if (objc_msgSend(*(id *)v1, sel_isInternalBuild)
    && (v3 = (void *)sub_211A478EC(),
        v4 = objc_msgSend(v2, sel_stringForKey_, v3),
        v3,
        v4))
  {
    v5 = sub_211A47910();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = v5;
  v9 = v7;
  result.value._object = v9;
  result.value._countAndFlagsBits = v8;
  return result;
}

Swift::Int_optional __swiftcall FMUserDefaults.int(for:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned __int8 *v25;
  unsigned int v26;
  uint64_t v27;
  char v28;
  _QWORD v29[3];
  Swift::Int_optional result;

  v2 = *(void **)(v1 + 8);
  if (objc_msgSend(*(id *)v1, sel_isInternalBuild))
  {
    v3 = (void *)sub_211A478EC();
    v4 = objc_msgSend(v2, sel_stringForKey_, v3);

    if (v4)
    {
      v5 = sub_211A47910();
      v7 = v6;

      v9 = HIBYTE(v7) & 0xF;
      v10 = v5 & 0xFFFFFFFFFFFFLL;
      if ((v7 & 0x2000000000000000) != 0)
        v11 = HIBYTE(v7) & 0xF;
      else
        v11 = v5 & 0xFFFFFFFFFFFFLL;
      if (v11)
      {
        if ((v7 & 0x1000000000000000) != 0)
        {
          v13 = (uint64_t)sub_211A3B094(v5, v7, 10);
          LOBYTE(v5) = v28;
LABEL_46:
          swift_bridgeObjectRelease();
          v24 = v5 & 1;
          if ((v5 & 1) != 0)
            v8 = 0;
          else
            v8 = v13;
          goto LABEL_57;
        }
        if ((v7 & 0x2000000000000000) == 0)
        {
          if ((v5 & 0x1000000000000000) != 0)
            v12 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
          else
            v12 = (unsigned __int8 *)sub_211A47FB8();
          v13 = (uint64_t)sub_211A3B178(v12, v10, 10);
          LOBYTE(v5) = v14 & 1;
          goto LABEL_46;
        }
        v29[0] = v5;
        v29[1] = v7 & 0xFFFFFFFFFFFFFFLL;
        if (v5 == 43)
        {
          if (!v9)
            goto LABEL_61;
          if (v9 == 1 || (BYTE1(v5) - 48) > 9u)
            goto LABEL_33;
          v13 = (BYTE1(v5) - 48);
          if (v9 != 2)
          {
            if ((BYTE2(v5) - 48) > 9u)
              goto LABEL_33;
            v13 = 10 * (BYTE1(v5) - 48) + (BYTE2(v5) - 48);
            v15 = v9 - 3;
            if (v15)
            {
              v16 = (unsigned __int8 *)v29 + 3;
              while (1)
              {
                v17 = *v16 - 48;
                if (v17 > 9)
                  goto LABEL_33;
                v18 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                  goto LABEL_33;
                v13 = v18 + v17;
                if (__OFADD__(v18, v17))
                  goto LABEL_33;
                LOBYTE(v5) = 0;
                ++v16;
                if (!--v15)
                  goto LABEL_46;
              }
            }
          }
        }
        else
        {
          if (v5 == 45)
          {
            if (v9)
            {
              if (v9 != 1 && (BYTE1(v5) - 48) <= 9u)
              {
                if (v9 == 2)
                {
                  LOBYTE(v5) = 0;
                  v13 = -(uint64_t)(BYTE1(v5) - 48);
                  goto LABEL_46;
                }
                if ((BYTE2(v5) - 48) <= 9u)
                {
                  v13 = -10 * (BYTE1(v5) - 48) - (BYTE2(v5) - 48);
                  v23 = v9 - 3;
                  if (!v23)
                    goto LABEL_45;
                  v25 = (unsigned __int8 *)v29 + 3;
                  while (1)
                  {
                    v26 = *v25 - 48;
                    if (v26 > 9)
                      break;
                    v27 = 10 * v13;
                    if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                      break;
                    v13 = v27 - v26;
                    if (__OFSUB__(v27, v26))
                      break;
                    LOBYTE(v5) = 0;
                    ++v25;
                    if (!--v23)
                      goto LABEL_46;
                  }
                }
              }
LABEL_33:
              v13 = 0;
              LOBYTE(v5) = 1;
              goto LABEL_46;
            }
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          if (!v9 || (v5 - 48) > 9u)
            goto LABEL_33;
          v13 = (v5 - 48);
          if (v9 != 1)
          {
            if ((BYTE1(v5) - 48) > 9u)
              goto LABEL_33;
            v13 = 10 * (v5 - 48) + (BYTE1(v5) - 48);
            v19 = v9 - 2;
            if (v19)
            {
              v20 = (unsigned __int8 *)v29 + 2;
              while (1)
              {
                v21 = *v20 - 48;
                if (v21 > 9)
                  goto LABEL_33;
                v22 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                  goto LABEL_33;
                v13 = v22 + v21;
                if (__OFADD__(v22, v21))
                  goto LABEL_33;
                LOBYTE(v5) = 0;
                ++v20;
                if (!--v19)
                  goto LABEL_46;
              }
            }
          }
        }
LABEL_45:
        LOBYTE(v5) = 0;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
    }
  }
  v8 = 0;
  v24 = 1;
LABEL_57:
  LOBYTE(v10) = v24;
LABEL_62:
  result.is_nil = v10;
  result.value = v8;
  return result;
}

Swift::Double_optional __swiftcall FMUserDefaults.double(for:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  double v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  Swift::Bool v13;
  _BYTE *v14;
  BOOL v15;
  uint64_t v16;
  __n128 v17;
  _QWORD v18[5];
  _QWORD v19[3];
  char v20;
  _BOOL8 v21;
  Swift::Double_optional result;

  v2 = *(void **)(v1 + 8);
  if (!objc_msgSend(*(id *)v1, sel_isInternalBuild)
    || (v4 = (void *)sub_211A478EC(),
        v5 = objc_msgSend(v2, sel_stringForKey_, v4),
        v4,
        !v5))
  {
    v13 = 0;
    goto LABEL_23;
  }
  v6 = sub_211A47910();
  v8 = v7;

  v21 = 0;
  MEMORY[0x24BDAC7A8](v9, v10);
  v18[2] = &v21;
  if ((v8 & 0x1000000000000000) != 0 || !(v8 & 0x2000000000000000 | v6 & 0x1000000000000000))
  {
    sub_211A47F58();
  }
  else
  {
    v12 = MEMORY[0x24BDAC7A8](v11, v18);
    if ((v8 & 0x2000000000000000) != 0)
    {
      v19[0] = v6;
      v19[1] = v8 & 0xFFFFFFFFFFFFFFLL;
      v15 = (v6 > 0x20u || ((0x100003E01uLL >> v6) & 1) == 0)
         && (v14 = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0
         && *v14 == 0;
      v20 = v15;
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    if ((v6 & 0x1000000000000000) != 0)
    {
      ((void (*)(_QWORD *__return_ptr, uint64_t, __n128))sub_211A3B8B0)(v19, (v8 & 0xFFFFFFFFFFFFFFFLL) + 32, v12);
    }
    else
    {
      v16 = sub_211A47FB8();
      ((void (*)(_QWORD *__return_ptr, uint64_t, __n128))sub_211A3B8B0)(v19, v16, v17);
    }
    v20 = v19[0];
  }
  swift_bridgeObjectRelease();
LABEL_17:
  if (v20)
    v13 = v21;
  else
    v13 = 0;
LABEL_23:
  result.value = v3;
  result.is_nil = v13;
  return result;
}

void FMUserDefaults.set(value:for:)(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];
  uint64_t v13;

  v3 = *(void **)(v1 + 8);
  if (objc_msgSend(*(id *)v1, sel_isInternalBuild))
  {
    sub_211A3B91C(a1, (uint64_t)v12);
    v4 = v13;
    if (v13)
    {
      v5 = sub_211931DB4(v12, v13);
      v6 = *(_QWORD *)(v4 - 8);
      v7 = MEMORY[0x24BDAC7A8](v5, v5);
      v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v6 + 16))(v9, v7);
      v10 = sub_211A48240();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
      sub_211931C34((uint64_t)v12);
    }
    else
    {
      v10 = 0;
    }
    v11 = (void *)sub_211A478EC();
    objc_msgSend(v3, sel_setValue_forKey_, v10, v11);
    swift_unknownObjectRelease();

  }
}

uint64_t sub_211A3B008(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_211A47A18();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x212BE3808](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_211A3B080(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_211A3B178(a1, a2, a3);
}

unsigned __int8 *sub_211A3B094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_211A47A3C();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_211A3B3F4();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_211A47FB8();
  }
LABEL_7:
  v11 = sub_211A3B178(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_211A3B178(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_211A3B3F4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_211A47A48();
  v4 = sub_211A3B470(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_211A3B470(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_211A3B5B4(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_211950F68(v9, 0);
      v12 = sub_211A3B6A0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x212BE3784](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x212BE3784);
LABEL_9:
      sub_211A47FB8();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x212BE3784]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_211A3B5B4(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_211A3B008(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_211A3B008(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_211A47A00();
  }
  __break(1u);
  return result;
}

unint64_t sub_211A3B6A0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_211A3B008(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_211A47A0C();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_211A47FB8();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_211A3B008(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_211A479E8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

_BYTE *sub_211A3B8B0@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
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

uint64_t sub_211A3B91C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_211958C38(&qword_254AC97C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for FMUserDefaults(_QWORD *a1, uint64_t a2)
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

void destroy for FMUserDefaults(id *a1)
{

}

uint64_t assignWithCopy for FMUserDefaults(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for FMUserDefaults(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for FMUserDefaults(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FMUserDefaults(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FMUserDefaults()
{
  return &type metadata for FMUserDefaults;
}

uint64_t type metadata accessor for FMFRemoveLabelsRequest()
{
  uint64_t result;

  result = qword_254ACEEA0;
  if (!qword_254ACEEA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_211A3BB20()
{
  return swift_initClassMetadata2();
}

uint64_t sub_211A3BB6C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[4];

  v1 = *(_QWORD *)(v0 + qword_254ADC8B8);
  v3[3] = sub_211958C38(&qword_254AC8378);
  v3[0] = v1;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21193C870((uint64_t)v3, 0x736C6562616CLL, 0xE600000000000000);
  return swift_endAccess();
}

uint64_t sub_211A3BBF8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_211A3BC08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_211A47334();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + qword_254ADC678;
  v2 = sub_211A47208();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_211A3BCCC()
{
  sub_211A3BC08();
  return swift_deallocClassInstance();
}

uint64_t sub_211A3BCEC()
{
  return type metadata accessor for FMFRemoveLabelsRequest();
}

uint64_t static FMSystemInfo.isKoreaSKU()()
{
  id v0;
  unsigned int v1;
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_isInternalBuild);

  if (!v1
    || (v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults),
        v3 = (void *)sub_211A478EC(),
        v4 = objc_msgSend(v2, sel_BOOLForKey_, v3),
        v2,
        v3,
        !v4))
  {
    sub_211A3C16C((uint64_t)v13);
    if (v14)
    {
      if ((swift_dynamicCast() & 1) != 0 && v11 == 18507 && v12 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
        v9 = 1;
        return v9 & 1;
      }
    }
    else
    {
      sub_21193999C((uint64_t)v13);
    }
    v9 = sub_211A48258();
    swift_bridgeObjectRelease();
    return v9 & 1;
  }
  if (qword_254AC7B80 != -1)
    swift_once();
  v5 = sub_211A47748();
  sub_21194F3E0(v5, (uint64_t)qword_254ADC7E8);
  v6 = sub_211A47724();
  v7 = sub_211A47D30();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21190D000, v6, v7, "SystemInfo simulating Korea SKU device.", v8, 2u);
    MEMORY[0x212BE48A0](v8, -1, -1);
  }

  v9 = 1;
  return v9 & 1;
}

uint64_t static FMSystemInfo.isChinaSKU()()
{
  id v0;
  unsigned int v1;
  id v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_isInternalBuild);

  if (!v1
    || (v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults),
        v3 = (void *)sub_211A478EC(),
        v4 = objc_msgSend(v2, sel_BOOLForKey_, v3),
        v2,
        v3,
        !v4))
  {
    sub_211A3C16C((uint64_t)v13);
    if (v14)
    {
      if ((swift_dynamicCast() & 1) != 0 && v11 == 18499 && v12 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
        v9 = 1;
        return v9 & 1;
      }
    }
    else
    {
      sub_21193999C((uint64_t)v13);
    }
    v9 = sub_211A48258();
    swift_bridgeObjectRelease();
    return v9 & 1;
  }
  if (qword_254AC7B80 != -1)
    swift_once();
  v5 = sub_211A47748();
  sub_21194F3E0(v5, (uint64_t)qword_254ADC7E8);
  v6 = sub_211A47724();
  v7 = sub_211A47D30();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21190D000, v6, v7, "SystemInfo simulating China SKU device.", v8, 2u);
    MEMORY[0x212BE48A0](v8, -1, -1);
  }

  v9 = 1;
  return v9 & 1;
}

void sub_211A3C16C(uint64_t a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)sub_211A478EC();
  v3 = MGCopyAnswerWithError();

  if (v3)
  {
    *(_QWORD *)(a1 + 24) = swift_getObjectType();
    *(_QWORD *)a1 = v3;
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

uint64_t FMFAddress.displayAddress.getter()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjCClassFromMetadata;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v0[1];
  v1 = v0[2];
  v3 = v0[9];
  v4 = v0[10];
  v5 = v0[12];
  v7 = v0[17];
  v6 = v0[18];
  if (v5 && (v8 = v0[11], sub_211A47994() >= 1))
  {
    swift_bridgeObjectRetain();
    if (!v4)
      goto LABEL_4;
  }
  else
  {
    swift_bridgeObjectRetain();
    v8 = v7;
    v5 = v6;
    if (!v4)
    {
LABEL_4:
      if (!v5)
      {
        if (!v1)
          goto LABEL_6;
LABEL_14:
        swift_bridgeObjectRetain();
        v8 = v2;
        v5 = v1;
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  if (!v5)
    goto LABEL_21;
  if (v3 == v8 && v4 == v5 || (sub_211A48258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (!v1)
    {
LABEL_6:
      if (!v4)
        return 0;
      goto LABEL_21;
    }
    goto LABEL_14;
  }
LABEL_15:
  v9 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v9 = v8 & 0xFFFFFFFFFFFFLL;
  if (v9)
  {
    type metadata accessor for FMLocalize();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (v4)
    {
      v11 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_211A46FE0();

      sub_211958C38(&qword_254ACC560);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_211A49C40;
      v14 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
      v15 = sub_2119512B0();
      *(_QWORD *)(v13 + 32) = v3;
      *(_QWORD *)(v13 + 40) = v4;
      *(_QWORD *)(v13 + 96) = v14;
      *(_QWORD *)(v13 + 104) = v15;
      *(_QWORD *)(v13 + 64) = v15;
      *(_QWORD *)(v13 + 72) = v8;
      *(_QWORD *)(v13 + 80) = v5;
    }
    else
    {
      v20 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      sub_211A46FE0();

      sub_211958C38(&qword_254ACC560);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_211A4A230;
      *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v21 + 64) = sub_2119512B0();
      *(_QWORD *)(v21 + 32) = v8;
      *(_QWORD *)(v21 + 40) = v5;
    }
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  if (!v4)
    return 0;
LABEL_21:
  type metadata accessor for FMLocalize();
  v16 = swift_getObjCClassFromMetadata();
  v17 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v18 = objc_msgSend(v17, sel_bundleForClass_, v16);
  sub_211A46FE0();

  sub_211958C38(&qword_254ACC560);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_211A4A230;
  *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v19 + 64) = sub_2119512B0();
  *(_QWORD *)(v19 + 32) = v3;
  *(_QWORD *)(v19 + 40) = v4;
LABEL_23:
  v22 = sub_211A4791C();
  swift_bridgeObjectRelease();
  return v22;
}

id FMFAddress.placemark.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v1 = v0[2];
  v14 = v0[6];
  v2 = v0[8];
  v3 = v0[10];
  v4 = v0[12];
  v5 = v0[18];
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2FEC0]), sel_init);
  if (v3)
  {
    v7 = (void *)sub_211A478EC();
    objc_msgSend(v6, sel_setLocality_, v7);

  }
  if (v5)
  {
    v8 = (void *)sub_211A478EC();
    objc_msgSend(v6, sel_setAdministrativeArea_, v8);

  }
  if (v1)
  {
    v9 = (void *)sub_211A478EC();
    objc_msgSend(v6, sel_setCountry_, v9);

  }
  if (v4)
  {
    v10 = (void *)sub_211A478EC();
    objc_msgSend(v6, sel_setState_, v10);

  }
  if (v2)
  {
    v11 = (void *)sub_211A478EC();
    objc_msgSend(v6, sel_setStreetAddress_, v11);

  }
  if (v14)
  {
    v12 = (void *)sub_211A478EC();
    objc_msgSend(v6, sel_setStreetName_, v12);

  }
  return v6;
}

__n128 FMFAddress.init(formattedAddressLines:country:countryCode:streetName:streetAddress:locality:stateCode:postalCode:landmark:administrativeArea:areaOfInterest:fullThoroughfare:mapFormattedAddress:coarseAddressModern:streetAddressModern:smallAddressModern:mediumAddressModern:largeAddressModern:poiAddressModern:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, uint64_t a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19, __int128 a20,__int128 a21,__int128 a22,__n128 a23,uint64_t a24)
{
  __n128 result;

  result = a23;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_QWORD *)(a9 + 152) = 0;
  *(_QWORD *)(a9 + 160) = 0;
  *(_QWORD *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 168) = a16;
  *(_OWORD *)(a9 + 184) = a17;
  *(_OWORD *)(a9 + 200) = a18;
  *(_OWORD *)(a9 + 216) = a19;
  *(_OWORD *)(a9 + 232) = a20;
  *(_OWORD *)(a9 + 248) = a21;
  *(_OWORD *)(a9 + 264) = a22;
  *(__n128 *)(a9 + 280) = a23;
  *(_QWORD *)(a9 + 296) = a24;
  return result;
}

double FMFAddress.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = objc_msgSend(a1, sel_locality);
  v5 = sub_211A47910();
  v29 = v6;
  v30 = v5;

  v7 = objc_msgSend(a1, sel_administrativeArea);
  v8 = sub_211A47910();
  v27 = v9;
  v28 = v8;

  v10 = objc_msgSend(a1, sel_country);
  v26 = sub_211A47910();
  v12 = v11;

  v13 = objc_msgSend(a1, sel_state);
  v14 = sub_211A47910();
  v16 = v15;

  v17 = objc_msgSend(a1, sel_streetAddress);
  v18 = sub_211A47910();
  v20 = v19;

  v21 = objc_msgSend(a1, sel_streetName);
  v22 = sub_211A47910();
  v24 = v23;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v26;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = v22;
  *(_QWORD *)(a2 + 48) = v24;
  *(_QWORD *)(a2 + 56) = v18;
  *(_QWORD *)(a2 + 64) = v20;
  *(_QWORD *)(a2 + 72) = v30;
  *(_QWORD *)(a2 + 80) = v29;
  *(_QWORD *)(a2 + 88) = v14;
  *(_QWORD *)(a2 + 96) = v16;
  result = 0.0;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 120) = 0u;
  *(_QWORD *)(a2 + 136) = v28;
  *(_QWORD *)(a2 + 144) = v27;
  *(_QWORD *)(a2 + 152) = 0;
  *(_QWORD *)(a2 + 160) = 0;
  *(_QWORD *)(a2 + 168) = MEMORY[0x24BEE4AF8];
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  return result;
}

{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  id v62;
  void *v63;
  double result;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v4 = objc_msgSend(a1, sel_postalAddress);
  if (v4)
  {
    v5 = v4;
    v6 = _s7FMFCore10FMFAddressV21formattedAddressLines3forSaySSGSgSo08CNPostalD0C_tFZ_0((uint64_t)v4);

  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(a1, sel_country);
  if (v7)
  {
    v8 = v7;
    v9 = sub_211A47910();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  v12 = objc_msgSend(a1, sel_ISOcountryCode);
  if (v12)
  {
    v13 = v12;
    v14 = sub_211A47910();
    v83 = v15;

  }
  else
  {
    v14 = 0;
    v83 = 0;
  }
  v16 = objc_msgSend(a1, sel_postalAddress);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, sel_street);

    v19 = sub_211A47910();
    v81 = v20;
    v82 = v19;

  }
  else
  {
    v81 = 0;
    v82 = 0;
  }
  v21 = objc_msgSend(a1, sel_thoroughfare);
  if (v21)
  {
    v22 = v21;
    v23 = sub_211A47910();
    v79 = v24;
    v80 = v23;

  }
  else
  {
    v79 = 0;
    v80 = 0;
  }
  v25 = objc_msgSend(a1, sel_locality);
  if (v25)
  {
    v26 = v25;
    v27 = sub_211A47910();
    v77 = v28;
    v78 = v27;

  }
  else
  {
    v77 = 0;
    v78 = 0;
  }
  v29 = objc_msgSend(a1, sel_postalCode);
  if (v29)
  {
    v30 = v29;
    v31 = sub_211A47910();
    v75 = v32;
    v76 = v31;

  }
  else
  {
    v75 = 0;
    v76 = 0;
  }
  v33 = objc_msgSend(a1, sel_postalCode);
  if (v33)
  {
    v34 = v33;
    v35 = sub_211A47910();
    v73 = v36;
    v74 = v35;

  }
  else
  {
    v73 = 0;
    v74 = 0;
  }
  v37 = objc_msgSend(a1, sel_name);
  if (v37)
  {
    v38 = v37;
    v39 = sub_211A47910();
    v71 = v40;
    v72 = v39;

  }
  else
  {
    v71 = 0;
    v72 = 0;
  }
  v41 = objc_msgSend(a1, sel_administrativeArea);
  if (v41)
  {
    v42 = v41;
    v43 = sub_211A47910();
    v69 = v44;
    v70 = v43;

  }
  else
  {
    v69 = 0;
    v70 = 0;
  }
  v45 = objc_msgSend(a1, sel_subAdministrativeArea);
  if (v45)
  {
    v46 = v45;
    v47 = sub_211A47910();
    v67 = v48;
    v68 = v47;

  }
  else
  {
    v67 = 0;
    v68 = 0;
  }
  v49 = objc_msgSend(a1, sel_areasOfInterest);
  if (v49)
  {
    v50 = v49;
    v66 = sub_211A47AA8();

  }
  else
  {
    v66 = MEMORY[0x24BEE4AF8];
  }
  v51 = objc_msgSend(a1, sel_fullThoroughfare);
  if (v51)
  {
    v52 = v51;
    v53 = sub_211A47910();
    v55 = v54;

  }
  else
  {
    v53 = 0;
    v55 = 0;
  }
  v56 = objc_msgSend(a1, sel__geoMapItem);
  v57 = v56;
  if (v56)
  {
    v58 = objc_msgSend(v56, sel_addressObject);
    swift_unknownObjectRelease();
    if (v58)
    {
      v65 = v14;
      v59 = v11;
      v60 = v9;
      v61 = v6;
      v62 = objc_msgSend(v58, sel_fullAddressNoCurrentCountryWithMultiline_, 0);

      if (v62)
      {
        v58 = (id)sub_211A47910();
        v57 = v63;

      }
      else
      {

        v58 = 0;
        v57 = 0;
      }
      v6 = v61;
      v9 = v60;
      v11 = v59;
      v14 = v65;
    }
    else
    {

      v57 = 0;
    }
  }
  else
  {

    v58 = 0;
  }
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v83;
  *(_QWORD *)(a2 + 40) = v82;
  *(_QWORD *)(a2 + 48) = v81;
  *(_QWORD *)(a2 + 56) = v80;
  *(_QWORD *)(a2 + 64) = v79;
  *(_QWORD *)(a2 + 72) = v78;
  *(_QWORD *)(a2 + 80) = v77;
  *(_QWORD *)(a2 + 88) = v76;
  *(_QWORD *)(a2 + 96) = v75;
  *(_QWORD *)(a2 + 104) = v74;
  *(_QWORD *)(a2 + 112) = v73;
  *(_QWORD *)(a2 + 120) = v72;
  *(_QWORD *)(a2 + 128) = v71;
  *(_QWORD *)(a2 + 136) = v70;
  *(_QWORD *)(a2 + 144) = v69;
  *(_QWORD *)(a2 + 152) = v68;
  *(_QWORD *)(a2 + 160) = v67;
  *(_QWORD *)(a2 + 168) = v66;
  *(_QWORD *)(a2 + 176) = v53;
  *(_QWORD *)(a2 + 184) = v55;
  *(_QWORD *)(a2 + 192) = v58;
  *(_QWORD *)(a2 + 200) = v57;
  result = 0.0;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  return result;
}

double FMFAddress.init(mapItem:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  double result;
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
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v4 = objc_msgSend(a1, sel_geoAddress);
  v5 = objc_msgSend(v4, sel_structuredAddress);
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, sel_locality);
    if (v7)
    {
      v8 = v7;
      v9 = sub_211A47910();
      v82 = v10;
      v83 = v9;

    }
    else
    {
      v82 = 0;
      v83 = 0;
    }
    v11 = objc_msgSend(v6, sel_administrativeArea);
    if (v11)
    {
      v12 = v11;
      v13 = sub_211A47910();
      v80 = v14;
      v81 = v13;

    }
    else
    {
      v80 = 0;
      v81 = 0;
    }
    v15 = objc_msgSend(v6, sel_subAdministrativeArea);
    if (v15)
    {
      v16 = v15;
      v17 = sub_211A47910();
      v78 = v18;
      v79 = v17;

    }
    else
    {
      v78 = 0;
      v79 = 0;
    }
    v19 = objc_msgSend(v6, sel_country);
    if (v19)
    {
      v20 = v19;
      v21 = sub_211A47910();
      v76 = v22;
      v77 = v21;

    }
    else
    {
      v76 = 0;
      v77 = 0;
    }
    v23 = objc_msgSend(v6, sel_administrativeAreaCode);
    if (v23)
    {
      v24 = v23;
      v25 = sub_211A47910();
      v74 = v26;
      v75 = v25;

    }
    else
    {
      v74 = 0;
      v75 = 0;
    }
    v27 = objc_msgSend(v6, sel_postCode);
    if (v27)
    {
      v28 = v27;
      v29 = sub_211A47910();
      v72 = v30;
      v73 = v29;

    }
    else
    {
      v72 = 0;
      v73 = 0;
    }
  }
  else
  {
    v72 = 0;
    v73 = 0;
    v78 = 0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
    v74 = 0;
    v75 = 0;
    v82 = 0;
    v83 = 0;
    v76 = 0;
    v77 = 0;
  }
  v31 = objc_msgSend(a1, sel_name);
  if (v31)
  {
    v32 = v31;
    v33 = sub_211A47910();
    v84 = v34;

    if (v6)
      goto LABEL_23;
LABEL_26:
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v85 = v33;
    if (!v4)
      goto LABEL_38;
    goto LABEL_36;
  }
  v33 = 0;
  v84 = 0;
  if (!v6)
    goto LABEL_26;
LABEL_23:
  v35 = objc_msgSend(v6, sel_thoroughfare);
  if (v35)
  {
    v36 = v35;
    v37 = sub_211A47910();
    v70 = v38;
    v71 = v37;

  }
  else
  {
    v70 = 0;
    v71 = 0;
  }
  v39 = objc_msgSend(v6, sel_fullThoroughfare);
  if (v39)
  {
    v40 = v39;
    v41 = sub_211A47910();
    v68 = v42;
    v69 = v41;

  }
  else
  {
    v68 = 0;
    v69 = 0;
  }
  v43 = objc_msgSend(v6, sel_countryCode);
  if (v43)
  {
    v44 = v43;
    v45 = sub_211A47910();
    v66 = v46;
    v67 = v45;

    v85 = v33;
    if (!v4)
      goto LABEL_38;
  }
  else
  {
    v66 = 0;
    v67 = 0;
    v85 = v33;
    if (!v4)
    {
LABEL_38:
      v49 = v4;
      goto LABEL_39;
    }
  }
LABEL_36:
  v47 = objc_msgSend(v4, sel_formattedAddressLines);
  if (!v47)
    goto LABEL_38;
  v48 = v47;
  v49 = v4;
  sub_211A47A9C();

LABEL_39:
  v50 = objc_msgSend(a1, sel_geoAddress);
  if (v50)
  {
    v51 = v50;
    v52 = objc_msgSend(v50, sel_structuredAddress);

    if (v52)
    {
      v53 = objc_msgSend(v52, sel_areaOfInterests);

      if (v53)
      {
        sub_211A47A9C();

      }
    }
  }
  swift_bridgeObjectRelease();
  v54 = MEMORY[0x24BEE4AF8];
  v55 = objc_msgSend(a1, sel_geoAddress);
  v56 = v55;
  if (v55)
  {
    v57 = objc_msgSend(v55, sel_structuredAddress);

    if (v57)
    {
      v58 = objc_msgSend(v57, sel_fullThoroughfare);

      if (v58)
      {
        v57 = (id)sub_211A47910();
        v56 = v59;

        goto LABEL_50;
      }
      v57 = 0;
    }
    v56 = 0;
  }
  else
  {
    v57 = 0;
  }
LABEL_50:
  v60 = objc_msgSend(a1, sel_addressObject);
  v61 = v60;
  if (!v60)
  {

    swift_unknownObjectRelease();
LABEL_55:
    v64 = 0;
    goto LABEL_56;
  }
  v62 = objc_msgSend(v60, sel_fullAddressNoCurrentCountryWithMultiline_, 0);

  if (!v62)
  {

    swift_unknownObjectRelease();
    v61 = 0;
    goto LABEL_55;
  }
  v61 = (void *)sub_211A47910();
  v64 = v63;

  swift_unknownObjectRelease();
LABEL_56:
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v77;
  *(_QWORD *)(a2 + 16) = v76;
  *(_QWORD *)(a2 + 24) = v67;
  *(_QWORD *)(a2 + 32) = v66;
  *(_QWORD *)(a2 + 40) = v71;
  *(_QWORD *)(a2 + 48) = v70;
  *(_QWORD *)(a2 + 56) = v69;
  *(_QWORD *)(a2 + 64) = v68;
  *(_QWORD *)(a2 + 72) = v83;
  *(_QWORD *)(a2 + 80) = v82;
  *(_QWORD *)(a2 + 88) = v75;
  *(_QWORD *)(a2 + 96) = v74;
  *(_QWORD *)(a2 + 104) = v73;
  *(_QWORD *)(a2 + 112) = v72;
  *(_QWORD *)(a2 + 120) = v85;
  *(_QWORD *)(a2 + 128) = v84;
  *(_QWORD *)(a2 + 136) = v81;
  *(_QWORD *)(a2 + 144) = v80;
  *(_QWORD *)(a2 + 152) = v79;
  *(_QWORD *)(a2 + 160) = v78;
  *(_QWORD *)(a2 + 168) = v54;
  *(_QWORD *)(a2 + 176) = v57;
  *(_QWORD *)(a2 + 184) = v56;
  *(_QWORD *)(a2 + 192) = v61;
  *(_QWORD *)(a2 + 200) = v64;
  result = 0.0;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  return result;
}

FMFCore::FMFAddressLevelType_optional __swiftcall FMFAddressLevelType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 5;
  if ((unint64_t)rawValue < 5)
    v2 = rawValue;
  *v1 = v2;
  return (FMFCore::FMFAddressLevelType_optional)rawValue;
}

uint64_t FMFAddressLevelType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

FMFCore::FMFAddressLevelType_optional sub_211A3D0D8(Swift::Int *a1)
{
  return FMFAddressLevelType.init(rawValue:)(*a1);
}

uint64_t FMFAddress.formattedAddressLines.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMFAddress.country.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.countryCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.streetName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.streetAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.locality.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.stateCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.postalCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.landmark.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.administrativeArea.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.subAdministrativeArea.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.areaOfInterest.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMFAddress.fullThoroughfare.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.mapFormattedAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 192);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.coarseAddressModern.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 208);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.streetAddressModern.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 224);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.smallAddressModern.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 240);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.mediumAddressModern.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 256);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.largeAddressModern.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 272);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.poiAddressModern.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 288);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_211A3D408(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_211A3D444 + 4 * byte_211A51B50[a1]))(0xD000000000000015, 0x8000000211A53380);
}

uint64_t sub_211A3D444()
{
  return 0x7972746E756F63;
}

uint64_t sub_211A3D45C()
{
  return 0x437972746E756F63;
}

uint64_t sub_211A3D47C()
{
  return 0x614E746565727473;
}

uint64_t sub_211A3D4A0()
{
  return 0x6441746565727473;
}

uint64_t sub_211A3D4C4()
{
  return 0x7974696C61636F6CLL;
}

uint64_t sub_211A3D4DC()
{
  return 0x646F436574617473;
}

uint64_t sub_211A3D4F8()
{
  return 0x6F436C6174736F70;
}

uint64_t sub_211A3D514()
{
  return 0x6B72616D646E616CLL;
}

uint64_t sub_211A3D52C()
{
  uint64_t v0;

  return v0 - 1;
}

uint64_t sub_211A3D5F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_211A3D408(*a1);
  v5 = v4;
  if (v3 == sub_211A3D408(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_211A48258();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_211A3D680()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_211A48318();
  sub_211A3D408(v1);
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

uint64_t sub_211A3D6E0()
{
  unsigned __int8 *v0;

  sub_211A3D408(*v0);
  sub_211A4797C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_211A3D720()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_211A48318();
  sub_211A3D408(v1);
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

uint64_t sub_211A3D77C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211A3F294();
  *a1 = result;
  return result;
}

uint64_t sub_211A3D7A8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_211A3D408(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_211A3D7D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211A3F294();
  *a1 = result;
  return result;
}

void sub_211A3D7F4(_BYTE *a1@<X8>)
{
  *a1 = 20;
}

uint64_t sub_211A3D800()
{
  sub_211960200();
  return sub_211A4839C();
}

uint64_t FMFAddress.displayAddressWithStreetName.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = v0[5];
  if (*v0 && *(_QWORD *)(v1 + 16))
    v2 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t FMFAddress.displayAddressWithoutStreetName.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = v0[7];
  if (*v0 && *(_QWORD *)(v1 + 16) >= 2uLL)
    v2 = *(_QWORD *)(v1 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t FMFAddress.formattedAddress.getter()
{
  uint64_t *v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t ObjCClassFromMetadata;
  id v8;
  _BYTE v10[296];

  v3 = *v0;
  v2 = v0 + 1;
  v1 = v3;
  if (!v3 || !*(_QWORD *)(v1 + 16))
  {
    memcpy(v10, v2, sizeof(v10));
    v5 = FMFAddress.postalAddress.getter();
    v6 = _s7FMFCore10FMFAddressV21formattedAddressLines3forSaySSGSgSo08CNPostalD0C_tFZ_0((uint64_t)v5);

    if (v6)
    {
      if (v6[2])
      {
        sub_211958C38(&qword_254AC8378);
        sub_211A3F504();
        v4 = sub_211A478C8();
        swift_bridgeObjectRelease();
        return v4;
      }
      swift_bridgeObjectRelease();
    }
    type metadata accessor for FMLocalize();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v8 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v4 = sub_211A46FE0();

    return v4;
  }
  sub_211958C38(&qword_254AC8378);
  sub_211A3F504();
  return sub_211A478C8();
}

id FMFAddress.postalAddress.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v1 = v0[2];
  v20 = v0[4];
  v2 = v0[8];
  v3 = v0[10];
  v5 = v0[11];
  v4 = v0[12];
  v6 = v0[18];
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBAD78]), sel_init);
  if (v2)
  {
    v8 = (void *)sub_211A478EC();
    objc_msgSend(v7, sel_setStreet_, v8);

  }
  if (v3)
  {
    v9 = (void *)sub_211A478EC();
    objc_msgSend(v7, sel_setCity_, v9);

  }
  if (!v4)
  {
LABEL_13:
    if (!v6)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = objc_msgSend(v7, sel_city);
  v11 = sub_211A47910();
  v13 = v12;

  if (v5 == v11 && v4 == v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v15 = sub_211A48258();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  v16 = (void *)sub_211A478EC();
  objc_msgSend(v7, sel_setState_, v16);

LABEL_15:
  if (v1)
  {
    v17 = (void *)sub_211A478EC();
    objc_msgSend(v7, sel_setCountry_, v17);

  }
  if (v20)
  {
    v18 = (void *)sub_211A478EC();
    objc_msgSend(v7, sel_setISOCountryCode_, v18);

  }
  return v7;
}

void FMFAddress.levelType.getter(_BYTE *a1@<X8>)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1[2];
  v3 = v1[8];
  v4 = v1[10];
  v5 = v1[18];
  if (v3 && ((v3 & 0x2000000000000000) != 0 ? (v6 = HIBYTE(v3) & 0xF) : (v6 = v1[7] & 0xFFFFFFFFFFFFLL), v6))
  {
    *a1 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_15;
    v7 = v1[9] & 0xFFFFFFFFFFFFLL;
    if ((v4 & 0x2000000000000000) != 0)
      v7 = HIBYTE(v4) & 0xF;
    if (v7)
    {
      *a1 = 2;
    }
    else
    {
      if (!v5)
        goto LABEL_20;
LABEL_15:
      v8 = v1[17] & 0xFFFFFFFFFFFFLL;
      if ((v5 & 0x2000000000000000) != 0)
        v8 = HIBYTE(v5) & 0xF;
      if (v8)
      {
        *a1 = 3;
      }
      else
      {
        if (!v2)
          goto LABEL_22;
LABEL_20:
        v9 = v1[1] & 0xFFFFFFFFFFFFLL;
        if ((v2 & 0x2000000000000000) != 0)
          v9 = HIBYTE(v2) & 0xF;
        if (v9)
          *a1 = 4;
        else
LABEL_22:
          *a1 = 0;
      }
    }
  }
}

double FMFAddress.init(formattedAddressLines:country:countryCode:streetName:streetAddress:locality:stateCode:postalCode:landmark:administrativeArea:areaOfInterest:fullThoroughfare:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, uint64_t a15, __int128 a16, uint64_t a17)
{
  double result;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_QWORD *)(a9 + 152) = 0;
  *(_QWORD *)(a9 + 160) = 0;
  *(_QWORD *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 168) = a16;
  *(_QWORD *)(a9 + 184) = a17;
  result = 0.0;
  *(_OWORD *)(a9 + 272) = 0u;
  *(_OWORD *)(a9 + 288) = 0u;
  *(_OWORD *)(a9 + 240) = 0u;
  *(_OWORD *)(a9 + 256) = 0u;
  *(_OWORD *)(a9 + 208) = 0u;
  *(_OWORD *)(a9 + 224) = 0u;
  *(_OWORD *)(a9 + 192) = 0u;
  return result;
}

double FMFAddress.init(formattedAddressLines:country:countryCode:streetName:streetAddress:locality:stateCode:postalCode:landmark:administrativeArea:areaOfInterest:fullThoroughfare:mapFormattedAddress:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, uint64_t a15, __int128 a16, __int128 a17, uint64_t a18)
{
  double result;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_QWORD *)(a9 + 152) = 0;
  *(_QWORD *)(a9 + 160) = 0;
  *(_QWORD *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 168) = a16;
  *(_OWORD *)(a9 + 184) = a17;
  *(_QWORD *)(a9 + 200) = a18;
  result = 0.0;
  *(_OWORD *)(a9 + 272) = 0u;
  *(_OWORD *)(a9 + 288) = 0u;
  *(_OWORD *)(a9 + 240) = 0u;
  *(_OWORD *)(a9 + 256) = 0u;
  *(_OWORD *)(a9 + 208) = 0u;
  *(_OWORD *)(a9 + 224) = 0u;
  return result;
}

uint64_t FMFAddress.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  char v65;

  v3 = sub_211958C38(&qword_254ACEF00);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v60 = v1[2];
  v61 = v8;
  v10 = v1[3];
  v58 = v1[4];
  v59 = v10;
  v11 = v1[5];
  v56 = v1[6];
  v57 = v11;
  v12 = v1[8];
  v54 = v1[7];
  v55 = v12;
  v13 = v1[10];
  v52 = v1[9];
  v53 = v13;
  v14 = v1[12];
  v50 = v1[11];
  v51 = v14;
  v15 = v1[14];
  v48 = v1[13];
  v49 = v15;
  v16 = v1[16];
  v46 = v1[15];
  v47 = v16;
  v17 = v1[18];
  v44 = v1[17];
  v45 = v17;
  v42 = v1[19];
  v43 = v1[20];
  v41 = v1[21];
  v40 = v1[22];
  v39 = v1[23];
  v38 = v1[24];
  v37 = v1[25];
  v36 = v1[26];
  v35 = v1[27];
  v34 = v1[28];
  v33 = v1[29];
  v32 = v1[30];
  v31 = v1[31];
  v27 = v1[32];
  v26 = v1[33];
  v29 = v1[34];
  v28 = v1[35];
  v18 = v1[37];
  v30 = v1[36];
  sub_211931DB4(a1, a1[3]);
  sub_211960200();
  sub_211A4836C();
  v63 = v9;
  v65 = 0;
  sub_211958C38(&qword_254AC8B68);
  sub_21194D11C();
  v19 = v62;
  sub_211A481E0();
  if (v19)
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v20 = v58;
  v21 = v59;
  v22 = v57;
  v62 = v18;
  v25 = v4;
  v63 = v61;
  v64 = v60;
  v65 = 1;
  sub_211958C38(&qword_254AC7C58);
  sub_21194D07C((unint64_t *)&qword_254AC7C60, &qword_254AC7C58, MEMORY[0x24BEE0D08], MEMORY[0x24BEE4AA8]);
  sub_211A481E0();
  v63 = v21;
  v64 = v20;
  v65 = 2;
  sub_211A481E0();
  v63 = v22;
  v64 = v56;
  v65 = 3;
  sub_211A481E0();
  v63 = v54;
  v64 = v55;
  v65 = 4;
  sub_211A481E0();
  v63 = v52;
  v64 = v53;
  v65 = 5;
  sub_211A481E0();
  v63 = v50;
  v64 = v51;
  v65 = 6;
  sub_211A481E0();
  v63 = v48;
  v64 = v49;
  v65 = 7;
  sub_211A481E0();
  v63 = v46;
  v64 = v47;
  v65 = 8;
  sub_211A481E0();
  v63 = v44;
  v64 = v45;
  v65 = 9;
  sub_211A481E0();
  v63 = v42;
  v64 = v43;
  v65 = 10;
  sub_211A481E0();
  v63 = v41;
  v65 = 11;
  sub_211958C38(&qword_254AC8378);
  sub_21194D07C(&qword_254AC8B78, &qword_254AC8378, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_211A481E0();
  v63 = v40;
  v64 = v39;
  v65 = 12;
  sub_211A481E0();
  v63 = v38;
  v64 = v37;
  v65 = 13;
  sub_211A481E0();
  v63 = v36;
  v64 = v35;
  v65 = 14;
  sub_211A481E0();
  v63 = v34;
  v64 = v33;
  v65 = 15;
  sub_211A481E0();
  v63 = v32;
  v64 = v31;
  v65 = 16;
  sub_211A481E0();
  v63 = v27;
  v64 = v26;
  v65 = 17;
  sub_211A481E0();
  v63 = v29;
  v64 = v28;
  v65 = 18;
  sub_211A481E0();
  v63 = v30;
  v64 = v62;
  v65 = 19;
  sub_211A481E0();
  return (*(uint64_t (**)(char *, _QWORD))(v25 + 8))(v7, 0);
}

uint64_t sub_211A3E9A0(_QWORD *a1)
{
  return FMFAddress.encode(to:)(a1);
}

uint64_t _s7FMFCore10FMFAddressV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
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
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
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
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;

  v3 = *(_QWORD **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v139 = *(_QWORD *)(a1 + 88);
  v142 = *(_QWORD *)(a1 + 96);
  v136 = *(_QWORD *)(a1 + 104);
  v141 = *(_QWORD *)(a1 + 112);
  v132 = *(_QWORD *)(a1 + 120);
  v137 = *(_QWORD *)(a1 + 128);
  v128 = *(_QWORD *)(a1 + 136);
  v134 = *(_QWORD *)(a1 + 144);
  v126 = *(_QWORD *)(a1 + 152);
  v130 = *(_QWORD *)(a1 + 160);
  v124 = *(_QWORD **)(a1 + 168);
  v118 = *(_QWORD *)(a1 + 176);
  v122 = *(_QWORD *)(a1 + 184);
  v114 = *(_QWORD *)(a1 + 192);
  v119 = *(_QWORD *)(a1 + 200);
  v110 = *(_QWORD *)(a1 + 208);
  v116 = *(_QWORD *)(a1 + 216);
  v107 = *(_QWORD *)(a1 + 224);
  v112 = *(_QWORD *)(a1 + 232);
  v103 = *(_QWORD *)(a1 + 240);
  v108 = *(_QWORD *)(a1 + 248);
  v99 = *(_QWORD *)(a1 + 256);
  v104 = *(_QWORD *)(a1 + 264);
  v95 = *(_QWORD *)(a1 + 272);
  v100 = *(_QWORD *)(a1 + 280);
  v93 = *(_QWORD *)(a1 + 288);
  *(_QWORD *)&v96 = *(_QWORD *)(a1 + 296);
  v15 = *(_QWORD **)a2;
  v14 = *(_QWORD *)(a2 + 8);
  v17 = *(_QWORD *)(a2 + 16);
  v16 = *(_QWORD *)(a2 + 24);
  v19 = *(_QWORD *)(a2 + 32);
  v18 = *(_QWORD *)(a2 + 40);
  v21 = *(_QWORD *)(a2 + 48);
  v20 = *(_QWORD *)(a2 + 56);
  v22 = *(_QWORD *)(a2 + 64);
  v23 = *(_QWORD *)(a2 + 72);
  v25 = *(_QWORD *)(a2 + 80);
  v24 = *(_QWORD *)(a2 + 88);
  v26 = *(_QWORD *)(a2 + 96);
  v135 = *(_QWORD *)(a2 + 104);
  v140 = *(_QWORD *)(a2 + 112);
  v131 = *(_QWORD *)(a2 + 120);
  v138 = *(_QWORD *)(a2 + 128);
  v127 = *(_QWORD *)(a2 + 136);
  v133 = *(_QWORD *)(a2 + 144);
  v125 = *(_QWORD *)(a2 + 152);
  v129 = *(_QWORD *)(a2 + 160);
  v123 = *(_QWORD **)(a2 + 168);
  v117 = *(_QWORD *)(a2 + 176);
  v121 = *(_QWORD *)(a2 + 184);
  v113 = *(_QWORD *)(a2 + 192);
  v120 = *(_QWORD *)(a2 + 200);
  v109 = *(_QWORD *)(a2 + 208);
  v115 = *(_QWORD *)(a2 + 216);
  v105 = *(_QWORD *)(a2 + 224);
  v111 = *(_QWORD *)(a2 + 232);
  v101 = *(_QWORD *)(a2 + 240);
  v106 = *(_QWORD *)(a2 + 248);
  v97 = *(_QWORD *)(a2 + 256);
  v102 = *(_QWORD *)(a2 + 264);
  v94 = *(_QWORD *)(a2 + 272);
  v98 = *(_QWORD *)(a2 + 280);
  v92 = *(_QWORD *)(a2 + 288);
  *((_QWORD *)&v96 + 1) = *(_QWORD *)(a2 + 296);
  if (v3)
  {
    if (!v15)
      return 0;
    v78 = *(_QWORD *)(a2 + 72);
    v80 = v9;
    v74 = v11;
    v76 = *(_QWORD *)(a2 + 80);
    v83 = v10;
    v86 = *(_QWORD *)(a2 + 48);
    v71 = *(_QWORD *)(a2 + 96);
    v72 = *(_QWORD *)(a2 + 88);
    v69 = *(_QWORD *)(a2 + 16);
    v70 = v13;
    v27 = v12;
    v89 = *(_QWORD *)(a2 + 64);
    v28 = v8;
    v29 = *(_QWORD *)(a2 + 56);
    v68 = v7;
    v30 = v6;
    v31 = *(_QWORD *)(a2 + 40);
    v32 = v4;
    v33 = v5;
    v34 = *(_QWORD *)(a2 + 32);
    v35 = *(_QWORD *)(a2 + 24);
    v36 = *(_QWORD *)(a2 + 8);
    v37 = sub_21194E8E8(v3, v15);
    v14 = v36;
    v16 = v35;
    v19 = v34;
    v5 = v33;
    v4 = v32;
    v18 = v31;
    v6 = v30;
    v7 = v68;
    v17 = v69;
    v20 = v29;
    v8 = v28;
    v21 = v86;
    v22 = v89;
    v12 = v27;
    v13 = v70;
    v26 = v71;
    v24 = v72;
    v11 = v74;
    v9 = v80;
    v10 = v83;
    v25 = v76;
    v23 = v78;
    if ((v37 & 1) == 0)
      return 0;
  }
  else if (v15)
  {
    return 0;
  }
  if (v4)
  {
    if (!v17)
      return 0;
    if (v5 != v14 || v4 != v17)
    {
      v81 = v20;
      v84 = v12;
      v87 = v21;
      v90 = v22;
      v73 = v16;
      v75 = v19;
      v38 = v8;
      v77 = v18;
      v79 = v6;
      v39 = sub_211A48258();
      v16 = v73;
      v19 = v75;
      v18 = v77;
      v6 = v79;
      v20 = v81;
      v12 = v84;
      v8 = v38;
      v21 = v87;
      v22 = v90;
      v40 = v39;
      result = 0;
      if ((v40 & 1) == 0)
        return result;
    }
  }
  else if (v17)
  {
    return 0;
  }
  if (v7)
  {
    if (!v19)
      return 0;
    if (v6 != v16 || v7 != v19)
    {
      v82 = v20;
      v85 = v10;
      v88 = v21;
      v91 = v22;
      v42 = v12;
      v43 = v8;
      v44 = v18;
      v45 = sub_211A48258();
      v18 = v44;
      v8 = v43;
      v21 = v88;
      v22 = v91;
      v12 = v42;
      v20 = v82;
      v10 = v85;
      v46 = v45;
      result = 0;
      if ((v46 & 1) == 0)
        return result;
    }
  }
  else if (v19)
  {
    return 0;
  }
  if (v8)
  {
    if (!v21)
      return 0;
    if (v9 != v18 || v8 != v21)
    {
      v47 = v20;
      v48 = v10;
      v49 = v12;
      v50 = sub_211A48258();
      v20 = v47;
      v12 = v49;
      v10 = v48;
      v51 = v50;
      result = 0;
      if ((v51 & 1) == 0)
        return result;
    }
  }
  else if (v21)
  {
    return 0;
  }
  if (v10)
  {
    if (!v22)
      return 0;
    if (v11 != v20 || v10 != v22)
    {
      v52 = v12;
      v53 = sub_211A48258();
      v12 = v52;
      v54 = v53;
      result = 0;
      if ((v54 & 1) == 0)
        return result;
    }
  }
  else if (v22)
  {
    return 0;
  }
  if (v13)
  {
    if (!v25)
      return 0;
    if (v12 != v23 || v13 != v25)
    {
      v55 = sub_211A48258();
      result = 0;
      if ((v55 & 1) == 0)
        return result;
    }
  }
  else if (v25)
  {
    return 0;
  }
  if (v142)
  {
    if (!v26)
      return 0;
    if (v139 != v24 || v142 != v26)
    {
      v56 = sub_211A48258();
      result = 0;
      if ((v56 & 1) == 0)
        return result;
    }
  }
  else if (v26)
  {
    return 0;
  }
  if (v141)
  {
    if (!v140)
      return 0;
    if (v136 != v135 || v141 != v140)
    {
      v57 = sub_211A48258();
      result = 0;
      if ((v57 & 1) == 0)
        return result;
    }
  }
  else if (v140)
  {
    return 0;
  }
  if (v137)
  {
    if (!v138)
      return 0;
    if (v132 != v131 || v137 != v138)
    {
      v58 = sub_211A48258();
      result = 0;
      if ((v58 & 1) == 0)
        return result;
    }
  }
  else if (v138)
  {
    return 0;
  }
  if (v134)
  {
    if (!v133)
      return 0;
    if (v128 != v127 || v134 != v133)
    {
      v59 = sub_211A48258();
      result = 0;
      if ((v59 & 1) == 0)
        return result;
    }
  }
  else if (v133)
  {
    return 0;
  }
  if (v130)
  {
    if (!v129)
      return 0;
    if (v126 != v125 || v130 != v129)
    {
      v60 = sub_211A48258();
      result = 0;
      if ((v60 & 1) == 0)
        return result;
    }
  }
  else if (v129)
  {
    return 0;
  }
  if ((sub_21194E8E8(v124, v123) & 1) == 0)
    return 0;
  if (v122)
  {
    if (!v121)
      return 0;
    if (v118 != v117 || v122 != v121)
    {
      v61 = sub_211A48258();
      result = 0;
      if ((v61 & 1) == 0)
        return result;
    }
  }
  else if (v121)
  {
    return 0;
  }
  if (v119)
  {
    if (!v120)
      return 0;
    if (v114 != v113 || v119 != v120)
    {
      v62 = sub_211A48258();
      result = 0;
      if ((v62 & 1) == 0)
        return result;
    }
  }
  else if (v120)
  {
    return 0;
  }
  if (v116)
  {
    if (!v115)
      return 0;
    if (v110 != v109 || v116 != v115)
    {
      v63 = sub_211A48258();
      result = 0;
      if ((v63 & 1) == 0)
        return result;
    }
  }
  else if (v115)
  {
    return 0;
  }
  if (v112)
  {
    if (!v111)
      return 0;
    if (v107 != v105 || v112 != v111)
    {
      v64 = sub_211A48258();
      result = 0;
      if ((v64 & 1) == 0)
        return result;
    }
  }
  else if (v111)
  {
    return 0;
  }
  if (v108)
  {
    if (!v106)
      return 0;
    if (v103 != v101 || v108 != v106)
    {
      v65 = sub_211A48258();
      result = 0;
      if ((v65 & 1) == 0)
        return result;
    }
  }
  else if (v106)
  {
    return 0;
  }
  if (v104)
  {
    if (!v102)
      return 0;
    if (v99 != v97 || v104 != v102)
    {
      v66 = sub_211A48258();
      result = 0;
      if ((v66 & 1) == 0)
        return result;
    }
  }
  else if (v102)
  {
    return 0;
  }
  if (v100)
  {
    if (v98)
    {
      if (v95 != v94 || v100 != v98)
      {
        v67 = sub_211A48258();
        result = 0;
        if ((v67 & 1) == 0)
          return result;
      }
      goto LABEL_128;
    }
    return 0;
  }
  if (v98)
    return 0;
LABEL_128:
  result = v96 == 0;
  if ((_QWORD)v96 && *((_QWORD *)&v96 + 1))
  {
    if (v93 == v92 && (_QWORD)v96 == *((_QWORD *)&v96 + 1))
      return 1;
    else
      return sub_211A48258();
  }
  return result;
}

uint64_t sub_211A3F294()
{
  unint64_t v0;

  v0 = sub_211A4827C();
  swift_bridgeObjectRelease();
  if (v0 >= 0x14)
    return 20;
  else
    return v0;
}

_QWORD *_s7FMFCore10FMFAddressV21formattedAddressLines3forSaySSGSgSo08CNPostalD0C_tFZ_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_211A46FBC();
  v24 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_stringFromPostalAddress_style_, a1, 0);
  v7 = sub_211A47910();
  v9 = v8;

  v27 = v7;
  v28 = v9;
  v25 = 10;
  v26 = 0xE100000000000000;
  sub_21194FDB4();
  v10 = sub_211A47E44();
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v23 = v10;
    v12 = (uint64_t *)(v10 + 40);
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v14 = *v12;
      v27 = *(v12 - 1);
      v28 = v14;
      swift_bridgeObjectRetain();
      sub_211A46F80();
      v15 = sub_211A47E5C();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v2);
      swift_bridgeObjectRelease();
      v18 = HIBYTE(v17) & 0xF;
      if ((v17 & 0x2000000000000000) == 0)
        v18 = v15 & 0xFFFFFFFFFFFFLL;
      if (v18)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_2119B02DC(0, v13[2] + 1, 1, v13);
        v20 = v13[2];
        v19 = v13[3];
        if (v20 >= v19 >> 1)
          v13 = sub_2119B02DC((_QWORD *)(v19 > 1), v20 + 1, 1, v13);
        v13[2] = v20 + 1;
        v21 = &v13[2 * v20];
        v21[4] = v15;
        v21[5] = v17;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v12 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v13;
}

unint64_t sub_211A3F504()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254ACCAF8;
  if (!qword_254ACCAF8)
  {
    v1 = sub_21195E2C0(&qword_254AC8378);
    result = MEMORY[0x212BE47C8](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, &qword_254ACCAF8);
  }
  return result;
}

unint64_t sub_211A3F554()
{
  unint64_t result;

  result = qword_254ACEF08;
  if (!qword_254ACEF08)
  {
    result = MEMORY[0x212BE47C8](&protocol conformance descriptor for FMFAddressLevelType, &type metadata for FMFAddressLevelType);
    atomic_store(result, (unint64_t *)&qword_254ACEF08);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FMFAddressLevelType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_211A3F5E4 + 4 * byte_211A51B69[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_211A3F618 + 4 * byte_211A51B64[v4]))();
}

uint64_t sub_211A3F618(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A3F620(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x211A3F628);
  return result;
}

uint64_t sub_211A3F634(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x211A3F63CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_211A3F640(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A3F648(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMFAddressLevelType()
{
  return &type metadata for FMFAddressLevelType;
}

_QWORD *assignWithCopy for FMFAddress(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[17] = a2[17];
  a1[18] = a2[18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[19] = a2[19];
  a1[20] = a2[20];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[21] = a2[21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[22] = a2[22];
  a1[23] = a2[23];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[24] = a2[24];
  a1[25] = a2[25];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[26] = a2[26];
  a1[27] = a2[27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[28] = a2[28];
  a1[29] = a2[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[30] = a2[30];
  a1[31] = a2[31];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[32] = a2[32];
  a1[33] = a2[33];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[34] = a2[34];
  a1[35] = a2[35];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[36] = a2[36];
  a1[37] = a2[37];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for FMFAddress(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x130uLL);
}

uint64_t assignWithTake for FMFAddress(uint64_t a1, uint64_t a2)
{
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v16;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v19;
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_211A3FA70()
{
  unint64_t result;

  result = qword_254ACEF10;
  if (!qword_254ACEF10)
  {
    result = MEMORY[0x212BE47C8](&unk_211A51E28, &type metadata for FMFAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254ACEF10);
  }
  return result;
}

uint64_t type metadata accessor for FMFRemoveFriendRequest()
{
  uint64_t result;

  result = qword_254ACEF28;
  if (!qword_254ACEF28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_211A3FAF0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_211A3FB38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v1 = *(_QWORD *)(v0 + qword_254ADC8D0);
  v2 = *(_QWORD *)(v0 + qword_254ADC8D0 + 8);
  v4[3] = MEMORY[0x24BEE0D00];
  v4[0] = v1;
  v4[1] = v2;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21193C870((uint64_t)v4, 25705, 0xE200000000000000);
  return swift_endAccess();
}

uint64_t sub_211A3FBBC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_211A3FBD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_211A47334();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + qword_254ADC678;
  v2 = sub_211A47208();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_211A3FC98()
{
  sub_211A3FBD0();
  return swift_deallocClassInstance();
}

uint64_t sub_211A3FCB8()
{
  return type metadata accessor for FMFRemoveFriendRequest();
}

void sub_211A3FCC0(char *a1)
{
  sub_211975B34(*a1);
}

void sub_211A3FCCC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_211A48318();
  __asm { BR              X9 }
}

uint64_t sub_211A3FD14()
{
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

void sub_211A3FDC4()
{
  __asm { BR              X10 }
}

uint64_t sub_211A3FDFC()
{
  sub_211A4797C();
  return swift_bridgeObjectRelease();
}

void sub_211A3FE98()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_211A48318();
  __asm { BR              X9 }
}

uint64_t sub_211A3FEDC()
{
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

uint64_t sub_211A3FF8C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211A402D4();
  *a1 = result;
  return result;
}

uint64_t sub_211A3FFB8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_211A3FFE4 + 4 * byte_211A51F0F[*v0]))();
}

void sub_211A3FFE4(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "serverContext");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_211A4000C(_QWORD *a1@<X8>)
{
  *a1 = 0x746E6F4361746164;
  a1[1] = 0xEB00000000747865;
}

void sub_211A40030(_QWORD *a1@<X8>)
{
  *a1 = 0x6174536863746566;
  a1[1] = 0xEB00000000737574;
}

void sub_211A40054(_QWORD *a1@<X8>)
{
  *a1 = 0x52646E616D6D6F63;
  a1[1] = 0xEF65736E6F707365;
}

uint64_t sub_211A4007C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211A402D4();
  *a1 = result;
  return result;
}

void sub_211A400A0(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_211A400AC()
{
  sub_2119317F8();
  return sub_211A4839C();
}

uint64_t sub_211A400D4(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_2119311EC(a1);
  return v2;
}

uint64_t sub_211A40120()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_211921C14(v0 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_211A40170()
{
  return type metadata accessor for FMFBaseResponse();
}

uint64_t storeEnumTagSinglePayload for FMFBaseResponseError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_211A401C4 + 4 * byte_211A51F1E[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_211A401F8 + 4 * byte_211A51F19[v4]))();
}

uint64_t sub_211A401F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A40200(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x211A40208);
  return result;
}

uint64_t sub_211A40214(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x211A4021CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_211A40220(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211A40228(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMFBaseResponseError()
{
  return &type metadata for FMFBaseResponseError;
}

unint64_t sub_211A40248()
{
  unint64_t result;

  result = qword_254ACF078;
  if (!qword_254ACF078)
  {
    result = MEMORY[0x212BE47C8](&unk_211A52088, &type metadata for FMFBaseResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254ACF078);
  }
  return result;
}

unint64_t sub_211A40290()
{
  unint64_t result;

  result = qword_254ACF080;
  if (!qword_254ACF080)
  {
    result = MEMORY[0x212BE47C8](&unk_211A520F0, &type metadata for FMFBaseResponseError);
    atomic_store(result, (unint64_t *)&qword_254ACF080);
  }
  return result;
}

uint64_t sub_211A402D4()
{
  unint64_t v0;

  v0 = sub_211A480F0();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t type metadata accessor for FMFUpdateLocationAlertRequest()
{
  uint64_t result;

  result = qword_254ACF098;
  if (!qword_254ACF098)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_211A40358()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FMFLocationAlert();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_211A403CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_211A403E8(a1, a2, a3, &qword_254ACBBC8, type metadata accessor for LiveRelabilityStats, &qword_254ACF138);
}

uint64_t sub_211A403E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(_QWORD), uint64_t *a6)
{
  uint64_t *v6;
  uint64_t *v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;

  v10 = v6;
  v14 = sub_211958C38(a4);
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a5(0);
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)&v25 - v20;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1) == 1)
  {
    sub_211923EE8(a1, a4);
    sub_211A40DD4(a2, a3, a5, a6, (uint64_t)v17);
    swift_bridgeObjectRelease();
    return sub_211923EE8((uint64_t)v17, a4);
  }
  else
  {
    sub_211942810(a1, (uint64_t)v21, a5);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = *v10;
    *v10 = 0x8000000000000000;
    sub_211A44590((uint64_t)v21, a2, a3, isUniquelyReferenced_nonNull_native, a5, a6);
    *v10 = v26;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_211A40568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;

  v4 = v3;
  v8 = sub_211958C38(&qword_254ACCD20);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_211958C38(&qword_254ACCD18);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 48))(a1, 1) == 1)
  {
    sub_211923EE8(a1, &qword_254ACCD20);
    sub_211A40C98(a2, a3, (uint64_t)v11);
    swift_bridgeObjectRelease();
    return sub_211923EE8((uint64_t)v11, &qword_254ACCD20);
  }
  else
  {
    sub_211A46550(a1, (uint64_t)v15);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v4;
    *v4 = 0x8000000000000000;
    sub_211A44164((uint64_t)v15, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v20;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_211A406CC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v8;
  void *v9;
  id v10[2];
  _OWORD v11[2];
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  sub_211A46F74();
  swift_allocObject();
  sub_211A46F68();
  type metadata accessor for FMFLocationAlert();
  sub_211A40A74();
  v0 = sub_211A46F5C();
  v2 = v1;
  swift_release();
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_211A47160();
  v10[0] = 0;
  v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 0, v10);

  v6 = v10[0];
  if (v5)
  {
    sub_211A47E8C();
    swift_unknownObjectRelease();
    sub_21193DB98(v11, v12);
    sub_211950B6C((uint64_t)v12, (uint64_t)v11);
    sub_211958C38(&qword_254AC97B8);
    if (swift_dynamicCast())
    {
      sub_211A46350((uint64_t)v10[0], (void (*)(uint64_t, uint64_t, _BYTE *))sub_211A40ABC);
      sub_21193B8F8(v0, v2);
      sub_211931C34((uint64_t)v12);
      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_21193B8F8(v0, v2);
      return sub_211931C34((uint64_t)v12);
    }
  }
  else
  {
    v8 = v6;
    v9 = (void *)sub_211A470DC();

    swift_willThrow();
    return sub_21193B8F8(v0, v2);
  }
}

uint64_t sub_211A40904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE v6[32];

  sub_211950B6C(a3, (uint64_t)v6);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21193C870((uint64_t)v6, a1, a2);
  return swift_endAccess();
}

uint64_t sub_211A4098C()
{
  uint64_t v0;

  return sub_21197403C(v0 + qword_254ADC900);
}

uint64_t sub_211A4099C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_211A47334();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + qword_254ADC678;
  v2 = sub_211A47208();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_21197403C(v0 + qword_254ADC900);
  return swift_deallocClassInstance();
}

uint64_t sub_211A40A6C()
{
  return type metadata accessor for FMFUpdateLocationAlertRequest();
}

unint64_t sub_211A40A74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254ACA2B8;
  if (!qword_254ACA2B8)
  {
    v1 = type metadata accessor for FMFLocationAlert();
    result = MEMORY[0x212BE47C8](&protocol conformance descriptor for FMFLocationAlert, v1);
    atomic_store(result, (unint64_t *)&qword_254ACA2B8);
  }
  return result;
}

uint64_t sub_211A40ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_211A40904(a1, a2, a3);
}

uint64_t sub_211A40AC4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21195BB68(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_211A44B84();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_211A42FAC(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_211A40BA8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
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
  v8 = sub_21195BB68(a1, a2);
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
      sub_21193DBA8();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_21193DB98((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_211A43180(v8, v11);
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

uint64_t sub_211A40C98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_21195BB68(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_211A4530C();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_211958C38(&qword_254ACCD18);
    v14 = *(_QWORD *)(v13 - 8);
    sub_211A46550(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_211A43530(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_211958C38(&qword_254ACCD18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_211A40DC8(uint64_t a1, uint64_t a2)
{
  return sub_211A40FF8(a1, a2, &qword_254ACF150);
}

uint64_t sub_211A40DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_21195BB68(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v21 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_211A450DC(a3, a4);
      v15 = v21;
    }
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v15 + 56);
    v17 = a3(0);
    v18 = *(_QWORD *)(v17 - 8);
    sub_211942810(v16 + *(_QWORD *)(v18 + 72) * v12, a5, a3);
    sub_21194B4C4(v12, v15, a3);
    *v8 = v15;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a5, 0, 1, v17);
  }
  else
  {
    v20 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a5, 1, 1, v20);
  }
}

double sub_211A40F14@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21193A1E8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_211A45C98();
      v9 = v11;
    }
    sub_21193DB98((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_211A43748(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_211A40FEC(uint64_t a1, uint64_t a2)
{
  return sub_211A40FF8(a1, a2, &qword_254ACF100);
}

uint64_t sub_211A40FF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_21195BB68(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_211A45E54(a3);
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_211A43AE8(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_211A410D4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21195BB68(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_211A4619C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_211A43AE8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_211A411A0(uint64_t a1, char a2)
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
  sub_211958C38(&qword_254ACEE70);
  v37 = a2;
  v6 = sub_211A480C0();
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
    sub_211A48318();
    sub_211A4797C();
    result = sub_211A48348();
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

uint64_t sub_211A414A8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t v43;
  int v44;

  v3 = v2;
  v5 = sub_211958C38(&qword_254ACCD18);
  v43 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  sub_211958C38(&qword_254ACF148);
  v44 = a2;
  v10 = sub_211A480C0();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v42 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v40 = v2;
  v41 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v41)
      break;
    v24 = v42;
    v25 = v42[v23];
    ++v18;
    if (!v25)
    {
      v18 = v23 + 1;
      if (v23 + 1 >= v41)
        goto LABEL_34;
      v25 = v42[v18];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v41)
        {
LABEL_34:
          swift_release();
          v3 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v42[v26];
        if (!v25)
        {
          while (1)
          {
            v18 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v18 >= v41)
              goto LABEL_34;
            v25 = v42[v18];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v18 = v26;
      }
    }
LABEL_21:
    v15 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    v27 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v22);
    v29 = *v27;
    v28 = v27[1];
    v30 = *(_QWORD *)(v43 + 72);
    v31 = *(_QWORD *)(v9 + 56) + v30 * v22;
    if ((v44 & 1) != 0)
    {
      sub_211A46550(v31, (uint64_t)v8);
    }
    else
    {
      sub_211A465E0(v31, (uint64_t)v8);
      swift_bridgeObjectRetain();
    }
    sub_211A48318();
    sub_211A4797C();
    result = sub_211A48348();
    v32 = -1 << *(_BYTE *)(v11 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v16 + 8 * v34);
      }
      while (v38 == -1);
      v19 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v19);
    *v20 = v29;
    v20[1] = v28;
    result = sub_211A46550((uint64_t)v8, *(_QWORD *)(v11 + 56) + v30 * v19);
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v40;
  v24 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v39 = 1 << *(_BYTE *)(v9 + 32);
  if (v39 >= 64)
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v39;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_211A41814(uint64_t a1, char a2)
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t i;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;

  v3 = v2;
  v5 = *v2;
  sub_211958C38(&qword_254ACF0F8);
  v40 = a2;
  v6 = sub_211A480C0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
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
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v30 = *v29;
      v31 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 56 * v21;
      v33 = *(_QWORD *)(v32 + 8);
      v34 = *(_QWORD *)(v32 + 24);
      v44 = *(_QWORD *)(v32 + 16);
      v43 = *(_BYTE *)(v32 + 32);
      v35 = *(_QWORD *)(v32 + 48);
      v41 = *(_QWORD *)v32;
      v42 = *(_QWORD *)(v32 + 40);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_211A48318();
      sub_211A4797C();
      result = sub_211A48348();
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
            goto LABEL_39;
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
      *v18 = v30;
      v18[1] = v31;
      v19 = *(_QWORD *)(v7 + 56) + 56 * v17;
      *(_QWORD *)v19 = v41;
      *(_QWORD *)(v19 + 8) = v33;
      *(_QWORD *)(v19 + 16) = v44;
      *(_QWORD *)(v19 + 24) = v34;
      *(_BYTE *)(v19 + 32) = v43;
      *(_QWORD *)(v19 + 40) = v42;
      *(_QWORD *)(v19 + 48) = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_211A41B70(uint64_t a1, char a2)
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
  sub_211958C38(&qword_254ACF158);
  v37 = a2;
  v6 = sub_211A480C0();
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
    sub_211A48318();
    sub_211A4797C();
    result = sub_211A48348();
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

uint64_t sub_211A41E78(uint64_t a1, int a2)
{
  return sub_2119595A8(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend, &qword_254ACF0F0);
}

uint64_t sub_211A41E8C(uint64_t a1, char a2)
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
  uint64_t v34;
  char v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t i;
  char v40;

  v3 = v2;
  v5 = *v2;
  sub_211958C38(&qword_254ACF128);
  v40 = a2;
  v6 = sub_211A480C0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
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
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 24 * v21;
      v33 = *(_QWORD *)v32;
      v34 = *(_QWORD *)(v32 + 8);
      v35 = *(_BYTE *)(v32 + 16);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_211A48318();
      sub_211A4797C();
      result = sub_211A48348();
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
            goto LABEL_39;
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
      v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
      *(_QWORD *)v19 = v33;
      *(_QWORD *)(v19 + 8) = v34;
      *(_BYTE *)(v19 + 16) = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_211A421B0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t result;
  _OWORD v20[2];

  v3 = v2;
  v5 = *v2;
  sub_211958C38(&qword_254ACEE78);
  v6 = sub_211A480C0();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_29;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v11 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v10 <= 1)
  {
    swift_release();
    v12 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_29;
    goto LABEL_25;
  }
  v12 = (_QWORD *)(v5 + 64);
  v13 = *(_QWORD *)(v5 + 72);
  v14 = 1;
  if (v13)
    goto LABEL_17;
  v14 = 2;
  if (v10 <= 2)
    goto LABEL_22;
  v13 = *(_QWORD *)(v5 + 80);
  if (v13)
  {
LABEL_17:
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
LABEL_18:
    v16 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v11);
    v17 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v11);
    if ((a2 & 1) != 0)
      sub_21193DB98(v17, v20);
    else
      sub_211950B6C((uint64_t)v17, (uint64_t)v20);
    sub_211A48318();
    __asm { BR              X8 }
  }
  v15 = 3;
  if (v10 > 3)
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
        JUMPOUT(0x211A42694);
      }
      if (v14 >= v10)
        break;
      v13 = *(_QWORD *)(v5 + 64 + 8 * v14);
      ++v15;
      if (v13)
        goto LABEL_17;
    }
  }
LABEL_22:
  swift_release();
  if ((a2 & 1) == 0)
    goto LABEL_29;
LABEL_25:
  v18 = 1 << *(_BYTE *)(v5 + 32);
  if (v18 >= 64)
    bzero(v12, ((unint64_t)(v18 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v12 = -1 << v18;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_29:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_211A426C8(uint64_t a1, char a2, uint64_t *a3)
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
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  sub_211958C38(a3);
  v39 = a2;
  v7 = sub_211A480C0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
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
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_211A48318();
    sub_211A4797C();
    result = sub_211A48348();
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
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_211A429D0(uint64_t a1, char a2)
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
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  sub_211958C38(&qword_254ACF110);
  result = sub_211A480C0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v31 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v30 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v19 >= v30)
          goto LABEL_33;
        v20 = v31[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v30)
            goto LABEL_33;
          v20 = v31[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v30)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v31 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v31[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_42;
                if (v8 >= v30)
                  goto LABEL_33;
                v20 = v31[v8];
                ++v21;
                if (v20)
                  goto LABEL_30;
              }
            }
            v8 = v21;
          }
        }
LABEL_30:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v26 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v18);
      v27 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0)
        v28 = v27;
      sub_211A48318();
      sub_211A48324();
      result = sub_211A48348();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v24 = v15 == v23;
          if (v15 == v23)
            v15 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v16) = v26;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v16) = v27;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_211A42C98(uint64_t a1, char a2)
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
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  sub_211958C38(&qword_254ACF118);
  v36 = a2;
  v6 = sub_211A480C0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
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
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_211A48318();
    sub_211A4797C();
    result = sub_211A48348();
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
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
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

unint64_t sub_211A42FAC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_211A48318();
        swift_bridgeObjectRetain();
        sub_211A4797C();
        v9 = sub_211A48348();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_211A43180(unint64_t result, uint64_t a2)
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
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_211A48318();
        swift_bridgeObjectRetain();
        sub_211A4797C();
        v10 = sub_211A48348();
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

unint64_t sub_211A43354(unint64_t result, uint64_t a2)
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
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_211A48318();
        swift_bridgeObjectRetain();
        sub_211A4797C();
        v10 = sub_211A48348();
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
          if (32 * v3 != 32 * v6 || (v3 = v6, v16 >= v17 + 2))
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

unint64_t sub_211A43530(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_211A48318();
        swift_bridgeObjectRetain();
        sub_211A4797C();
        v9 = sub_211A48348();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_211958C38(&qword_254ACCD18) - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_211A4373C(unint64_t a1, uint64_t a2)
{
  return sub_21194B4C4(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
}

unint64_t sub_211A43748(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v3 = result;
  v4 = a2 + 64;
  v5 = (result + 1) & ~(-1 << *(_BYTE *)(a2 + 32));
  if (((1 << v5) & *(_QWORD *)(a2 + 64 + 8 * (v5 >> 6))) != 0)
  {
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 48) + v5);
      sub_211A48318();
      __asm { BR              X8 }
    }
    v7 = (uint64_t *)(v4 + 8 * (v3 >> 6));
    v8 = *v7;
    v9 = (-1 << v3) - 1;
  }
  else
  {
    v7 = (uint64_t *)(v4 + 8 * (result >> 6));
    v9 = *v7;
    v8 = (-1 << result) - 1;
  }
  *v7 = v9 & v8;
  v10 = *(_QWORD *)(a2 + 16);
  v11 = __OFSUB__(v10, 1);
  v12 = v10 - 1;
  if (v11)
  {
    __break(1u);
    JUMPOUT(0x211A43AB4);
  }
  *(_QWORD *)(a2 + 16) = v12;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

unint64_t sub_211A43AE8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_211A48318();
        swift_bridgeObjectRetain();
        sub_211A4797C();
        v9 = sub_211A48348();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_211A43CBC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_211A47EB0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_211A48318();
        sub_211A48324();
        result = sub_211A48348();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_BYTE *)(v10 + v3);
          v12 = (_BYTE *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_211A43E74(char a1, uint64_t a2, uint64_t a3, char a4)
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
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21195BB68(a2, a3);
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
    result = (uint64_t)sub_211A44D3C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1 & 1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1 & 1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_211A411A0(result, a4 & 1);
  result = sub_21195BB68(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_211A48294();
  __break(1u);
  return result;
}

uint64_t sub_211A43FCC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, char a7)
{
  _QWORD *v7;
  _QWORD **v8;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;

  v8 = (_QWORD **)v7;
  v15 = (_QWORD *)*v7;
  v17 = sub_21195BB68(a5, a6);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
  }
  else
  {
    v21 = v16;
    v22 = v15[3];
    if (v22 >= v20 && (a7 & 1) != 0)
    {
LABEL_7:
      v23 = *v8;
      if ((v21 & 1) != 0)
      {
LABEL_8:
        v24 = v23[7] + 32 * v17;
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        *(_QWORD *)v24 = a1;
        *(_QWORD *)(v24 + 8) = a2;
        *(_QWORD *)(v24 + 16) = a3;
        *(_BYTE *)(v24 + 24) = a4 & 1;
        *(_BYTE *)(v24 + 25) = BYTE1(a4) & 1;
        *(_BYTE *)(v24 + 26) = BYTE2(a4) & 1;
        return result;
      }
      goto LABEL_11;
    }
    if (v22 >= v20 && (a7 & 1) == 0)
    {
      sub_211A44EF0();
      goto LABEL_7;
    }
    sub_211948E78(v20, a7 & 1);
    v26 = sub_21195BB68(a5, a6);
    if ((v21 & 1) == (v27 & 1))
    {
      v17 = v26;
      v23 = *v8;
      if ((v21 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_211A449D8(v17, a5, a6, a1, a2, a3, a4 & 0x10101, v23);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_211A48294();
  __break(1u);
  return result;
}

void sub_211A44158(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_211A442A8(a1, a2, a3, a4, &qword_254ACEE88);
}

uint64_t sub_211A44164(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21195BB68(a2, a3);
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
        v19 = v18[7];
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(sub_211958C38(&qword_254ACCD18) - 8) + 72) * v12;
        return sub_211A46598(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_211A4530C();
      goto LABEL_7;
    }
    sub_211A414A8(v15, a4 & 1);
    v22 = sub_21195BB68(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_211A44A40(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_211A48294();
  __break(1u);
  return result;
}

void sub_211A4429C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_211A442A8(a1, a2, a3, a4, &qword_254ACF150);
}

void sub_211A442A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v7 = v5;
  v12 = *v5;
  v14 = sub_21195BB68(a2, a3);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_211A45E54(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v24 = (uint64_t *)(v20[6] + 16 * v14);
    *v24 = a2;
    v24[1] = a3;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v25 = v20[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (!v26)
    {
      v20[2] = v27;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_211A426C8(v17, a4 & 1, a5);
  v22 = sub_21195BB68(a2, a3);
  if ((v18 & 1) == (v23 & 1))
  {
    v14 = v22;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_211A48294();
  __break(1u);
}

uint64_t sub_211A4441C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21195BB68(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_211A45540();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_211A46514(a1, v18[7] + 56 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = v18[7] + 56 * v12;
    v24 = *(_OWORD *)a1;
    v25 = *(_OWORD *)(a1 + 16);
    v26 = *(_OWORD *)(a1 + 32);
    *(_QWORD *)(v23 + 48) = *(_QWORD *)(a1 + 48);
    *(_OWORD *)(v23 + 16) = v25;
    *(_OWORD *)(v23 + 32) = v26;
    *(_OWORD *)v23 = v24;
    v27 = v18[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v18[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_211A41814(v15, a4 & 1);
  v20 = sub_21195BB68(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_211A46514(a1, v18[7] + 56 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_211A48294();
  __break(1u);
  return result;
}

uint64_t sub_211A44590(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(_QWORD), uint64_t *a6)
{
  _QWORD *v6;
  _QWORD **v9;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;

  v9 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_21195BB68(a2, a3);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a4 & 1) != 0)
    {
LABEL_7:
      v22 = *v9;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = v22[7];
        v24 = a5(0);
        return sub_21195BCAC(a1, v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * v16, a5);
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a4 & 1) == 0)
    {
      sub_211A450DC(a5, a6);
      goto LABEL_7;
    }
    sub_2119595A8(v19, a4 & 1, a5, a6);
    v26 = sub_21195BB68(a2, a3);
    if ((v20 & 1) == (v27 & 1))
    {
      v16 = v26;
      v22 = *v9;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21195C3D4(v16, a2, a3, a1, v22, a5);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_211A48294();
  __break(1u);
  return result;
}

void sub_211A446F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_211A442A8(a1, a2, a3, a4, &qword_254ACF100);
}

void sub_211A44700(uint64_t a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = a2 & 1;
  v8 = *v3;
  v10 = sub_2119B1D04(a2 & 1);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_211A45FFC();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];

      *(_QWORD *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = v7;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_211A429D0(v13, a3 & 1);
  v18 = sub_2119B1D04(v7);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_211A48294();
  __break(1u);
}

uint64_t sub_211A44834(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21195BB68(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_211A4619C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_211A42C98(v15, a4 & 1);
  v21 = sub_21195BB68(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_211A48294();
  __break(1u);
  return result;
}

unint64_t sub_211A44990(unint64_t result, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_BYTE *)(a5[7] + result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_211A449D8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, _QWORD *a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a8[(result >> 6) + 8] |= 1 << result;
  v8 = (_QWORD *)(a8[6] + 16 * result);
  *v8 = a2;
  v8[1] = a3;
  v9 = a8[7] + 32 * result;
  *(_QWORD *)v9 = a4;
  *(_QWORD *)(v9 + 8) = a5;
  *(_QWORD *)(v9 + 16) = a6;
  *(_BYTE *)(v9 + 24) = a7 & 1;
  *(_BYTE *)(v9 + 25) = BYTE1(a7) & 1;
  *(_BYTE *)(v9 + 26) = BYTE2(a7) & 1;
  v10 = a8[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a8[2] = v12;
  return result;
}

uint64_t sub_211A44A40(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_211958C38(&qword_254ACCD18);
  result = sub_211A46550(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_211A44ACC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_21195C3D4(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD))type metadata accessor for FMFFriend);
}

_OWORD *sub_211A44AD8(unint64_t a1, char a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  result = sub_21193DB98(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

unint64_t sub_211A44B3C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

void *sub_211A44B84()
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
  sub_211958C38(&qword_254ACD708);
  v2 = *v0;
  v3 = sub_211A480B4();
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

void *sub_211A44D3C()
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
  sub_211958C38(&qword_254ACEE70);
  v2 = *v0;
  v3 = sub_211A480B4();
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

void *sub_211A44EE4()
{
  return sub_211A45910(&qword_254ACA760);
}

void *sub_211A44EF0()
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
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;

  v1 = v0;
  sub_211958C38(&qword_254ACF130);
  v2 = *v0;
  v3 = sub_211A480B4();
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
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = *(_BYTE *)(v21 + 24);
    v26 = *(_BYTE *)(v21 + 25);
    LOBYTE(v21) = *(_BYTE *)(v21 + 26);
    v27 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v27 = v19;
    v27[1] = v18;
    v28 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v28 = v22;
    *(_QWORD *)(v28 + 8) = v23;
    *(_QWORD *)(v28 + 16) = v24;
    *(_BYTE *)(v28 + 24) = v25;
    *(_BYTE *)(v28 + 25) = v26;
    *(_BYTE *)(v28 + 26) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
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

void *sub_211A450DC(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  unint64_t v13;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;

  v5 = a1(0);
  v33 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v30 - v7;
  sub_211958C38(a2);
  v30 = v2;
  v9 = *v2;
  v10 = sub_211A480B4();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v30 = v11;
    return result;
  }
  result = (void *)(v10 + 64);
  v13 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v13)
    result = memmove(result, (const void *)(v9 + 64), 8 * v13);
  v31 = v9 + 64;
  v15 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v16 = 1 << *(_BYTE *)(v9 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(v9 + 64);
  v32 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    v27 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v32)
      goto LABEL_26;
    v28 = *(_QWORD *)(v31 + 8 * v27);
    ++v15;
    if (!v28)
    {
      v15 = v27 + 1;
      if (v27 + 1 >= v32)
        goto LABEL_26;
      v28 = *(_QWORD *)(v31 + 8 * v15);
      if (!v28)
        break;
    }
LABEL_25:
    v18 = (v28 - 1) & v28;
    v20 = __clz(__rbit64(v28)) + (v15 << 6);
LABEL_12:
    v21 = 16 * v20;
    v22 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v20);
    v24 = *v22;
    v23 = v22[1];
    v25 = *(_QWORD *)(v33 + 72) * v20;
    sub_211934794(*(_QWORD *)(v9 + 56) + v25, (uint64_t)v8, a1);
    v26 = (_QWORD *)(*(_QWORD *)(v11 + 48) + v21);
    *v26 = v24;
    v26[1] = v23;
    sub_211942810((uint64_t)v8, *(_QWORD *)(v11 + 56) + v25, a1);
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v32)
    goto LABEL_26;
  v28 = *(_QWORD *)(v31 + 8 * v29);
  if (v28)
  {
    v15 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v15 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v15 >= v32)
      goto LABEL_26;
    v28 = *(_QWORD *)(v31 + 8 * v15);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_211A4530C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = sub_211958C38(&qword_254ACCD18);
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211958C38(&qword_254ACF148);
  v6 = *v0;
  v7 = sub_211A480B4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_25:
    *v1 = v8;
    return result;
  }
  v28 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v29 = v6 + 64;
  v11 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v12 = 1 << *(_BYTE *)(v6 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v6 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v15)
      goto LABEL_23;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_23;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_22:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_9:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v17);
    v20 = *v19;
    v21 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_211A465E0(*(_QWORD *)(v6 + 56) + v22, (uint64_t)v5);
    v23 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v18);
    *v23 = v20;
    v23[1] = v21;
    sub_211A46550((uint64_t)v5, *(_QWORD *)(v8 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_23:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_25;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_23;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_211A45540()
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;

  v1 = v0;
  sub_211958C38(&qword_254ACF0F8);
  v2 = *v0;
  v3 = sub_211A480B4();
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
    v31 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v31 >= v13)
      goto LABEL_26;
    v32 = *(_QWORD *)(v6 + 8 * v31);
    ++v9;
    if (!v32)
    {
      v9 = v31 + 1;
      if (v31 + 1 >= v13)
        goto LABEL_26;
      v32 = *(_QWORD *)(v6 + 8 * v9);
      if (!v32)
        break;
    }
LABEL_25:
    v12 = (v32 - 1) & v32;
    v15 = __clz(__rbit64(v32)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 56 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    v26 = *(_BYTE *)(v21 + 32);
    v27 = *(_QWORD *)(v21 + 40);
    v28 = *(_QWORD *)(v21 + 48);
    v29 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v29 = v19;
    v29[1] = v18;
    v30 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v30 = v22;
    *(_QWORD *)(v30 + 8) = v23;
    *(_QWORD *)(v30 + 16) = v24;
    *(_QWORD *)(v30 + 24) = v25;
    *(_BYTE *)(v30 + 32) = v26;
    *(_QWORD *)(v30 + 40) = v27;
    *(_QWORD *)(v30 + 48) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v33 = v31 + 2;
  if (v33 >= v13)
    goto LABEL_26;
  v32 = *(_QWORD *)(v6 + 8 * v33);
  if (v32)
  {
    v9 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v32 = *(_QWORD *)(v6 + 8 * v9);
    ++v33;
    if (v32)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_211A45730()
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
  sub_211958C38(&qword_254ACF158);
  v2 = *v0;
  v3 = sub_211A480B4();
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

void *sub_211A458DC()
{
  return sub_211A450DC((uint64_t (*)(_QWORD))type metadata accessor for FMFLocation, &qword_254ACF120);
}

void *sub_211A458F0()
{
  return sub_211A450DC((uint64_t (*)(_QWORD))type metadata accessor for FMFFriend, &qword_254ACF0F0);
}

void *sub_211A45904()
{
  return sub_211A45910(&qword_254ACF108);
}

void *sub_211A45910(uint64_t *a1)
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v2 = v1;
  sub_211958C38(a1);
  v3 = *v1;
  v4 = sub_211A480B4();
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
    v27 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v14)
      goto LABEL_26;
    v28 = *(_QWORD *)(v7 + 8 * v27);
    ++v10;
    if (!v28)
    {
      v10 = v27 + 1;
      if (v27 + 1 >= v14)
        goto LABEL_26;
      v28 = *(_QWORD *)(v7 + 8 * v10);
      if (!v28)
        break;
    }
LABEL_25:
    v13 = (v28 - 1) & v28;
    v16 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v20 = *v18;
    v19 = v18[1];
    v21 = 24 * v16;
    v22 = *(_QWORD *)(v3 + 56) + v21;
    v23 = *(_QWORD *)v22;
    v24 = *(_QWORD *)(v22 + 8);
    LOBYTE(v22) = *(_BYTE *)(v22 + 16);
    v25 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v25 = v20;
    v25[1] = v19;
    v26 = *(_QWORD *)(v5 + 56) + v21;
    *(_QWORD *)v26 = v23;
    *(_QWORD *)(v26 + 8) = v24;
    *(_BYTE *)(v26 + 16) = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v14)
    goto LABEL_26;
  v28 = *(_QWORD *)(v7 + 8 * v29);
  if (v28)
  {
    v10 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v28 = *(_QWORD *)(v7 + 8 * v10);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_211A45AD0()
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
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  sub_211958C38(&qword_254ACF128);
  v2 = *v0;
  v3 = sub_211A480B4();
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
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    LOBYTE(v21) = *(_BYTE *)(v21 + 16);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v24 = v19;
    v24[1] = v18;
    v25 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v25 = v22;
    *(_QWORD *)(v25 + 8) = v23;
    *(_BYTE *)(v25 + 16) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_211A45C98()
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
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _OWORD v20[2];

  v1 = v0;
  sub_211958C38(&qword_254ACEE78);
  v2 = *v0;
  v3 = sub_211A480B4();
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
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    sub_211950B6C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v20);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = v16;
    result = sub_21193DB98(v20, (_OWORD *)(*(_QWORD *)(v4 + 56) + 32 * v15));
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

id sub_211A45E54(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  sub_211958C38(a1);
  v3 = *v1;
  v4 = sub_211A480B4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
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
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
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

id sub_211A45FFC()
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
  void *v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  sub_211958C38(&qword_254ACF110);
  v2 = *v0;
  v3 = sub_211A480B4();
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
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = v16;
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

void *sub_211A4619C()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_211958C38(&qword_254ACF118);
  v2 = *v0;
  v3 = sub_211A480B4();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_211A46350(uint64_t a1, void (*a2)(uint64_t, uint64_t, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD v18[2];
  _BYTE v19[32];
  uint64_t v20;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      v9 = v15 + 1;
      if (v15 + 1 >= v7)
        return swift_release();
      v16 = *(_QWORD *)(v20 + 8 * v9);
      if (!v16)
      {
        v9 = v15 + 2;
        if (v15 + 2 >= v7)
          return swift_release();
        v16 = *(_QWORD *)(v20 + 8 * v9);
        if (!v16)
        {
          v9 = v15 + 3;
          if (v15 + 3 >= v7)
            return swift_release();
          v16 = *(_QWORD *)(v20 + 8 * v9);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    sub_211950B6C(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    result = sub_211923EE8((uint64_t)v18, &qword_254ACF0E8);
  }
  v17 = v15 + 4;
  if (v17 >= v7)
    return swift_release();
  v16 = *(_QWORD *)(v20 + 8 * v17);
  if (v16)
  {
    v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v20 + 8 * v9);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_211A46514(uint64_t a1, uint64_t a2)
{
  assignWithTake for FMFContact(a2, a1);
  return a2;
}

uint64_t sub_211A46550(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_211958C38(&qword_254ACCD18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_211A46598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_211958C38(&qword_254ACCD18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_211A465E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_211958C38(&qword_254ACCD18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FMFRemoveFriendAction.__allocating_init(friend:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_2119C01B0(a1, v2 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  *(_BYTE *)(v2 + 16) = 1;
  return v2;
}

uint64_t FMFRemoveFriendAction.init(friend:)(uint64_t a1)
{
  uint64_t v1;

  sub_2119C01B0(a1, v1 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  *(_BYTE *)(v1 + 16) = 1;
  return v1;
}

uint64_t sub_211A466A4()
{
  sub_211A47F70();
  sub_211A479B8();
  sub_211A483A8();
  sub_211A479B8();
  swift_bridgeObjectRelease();
  sub_211A479B8();
  sub_211930ED4();
  sub_211A47A30();
  sub_211A479B8();
  swift_bridgeObjectRelease();
  sub_211A479B8();
  type metadata accessor for FMFFriend();
  sub_211A48054();
  return 0;
}

void FMFRemoveFriendAction.__allocating_init(requiresRefresh:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void FMFRemoveFriendAction.init(requiresRefresh:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_211A46818()
{
  uint64_t v0;

  return sub_21194ED40(v0 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
}

uint64_t FMFRemoveFriendAction.deinit()
{
  uint64_t v0;

  sub_21194ED40(v0 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  return v0;
}

uint64_t FMFRemoveFriendAction.__deallocating_deinit()
{
  uint64_t v0;

  sub_21194ED40(v0 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  return swift_deallocClassInstance();
}

uint64_t sub_211A4687C()
{
  return type metadata accessor for FMFRemoveFriendAction();
}

uint64_t type metadata accessor for FMFRemoveFriendAction()
{
  uint64_t result;

  result = qword_254ACF188;
  if (!qword_254ACF188)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t method lookup function for FMFRemoveFriendAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMFRemoveFriendAction.__allocating_init(friend:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t FMFMyInfo.emails.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMFMyInfo.firstName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFMyInfo.meDeviceId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFMyInfo.deviceId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFMyInfo.eligibleAutoMe.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

void sub_211A46968(char *a1)
{
  sub_211974280(*a1);
}

void sub_211A46974()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_211A48318();
  __asm { BR              X9 }
}

uint64_t sub_211A469BC()
{
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

void sub_211A46A58()
{
  __asm { BR              X10 }
}

uint64_t sub_211A46A90()
{
  sub_211A4797C();
  return swift_bridgeObjectRelease();
}

void sub_211A46B18()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_211A48318();
  __asm { BR              X9 }
}

uint64_t sub_211A46B5C()
{
  sub_211A4797C();
  swift_bridgeObjectRelease();
  return sub_211A48348();
}

uint64_t sub_211A46BF8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211A46EB4();
  *a1 = result;
  return result;
}

uint64_t sub_211A46C24()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_211A46C50 + 4 * byte_211A52247[*v0]))();
}

void sub_211A46C50(_QWORD *a1@<X8>)
{
  *a1 = 0x6D614E7473726966;
  a1[1] = 0xE900000000000065;
}

void sub_211A46C70(_QWORD *a1@<X8>)
{
  *a1 = 0x656369766544656DLL;
  a1[1] = 0xEA00000000006449;
}

void sub_211A46C90(_QWORD *a1@<X8>)
{
  *a1 = 0x6449656369766564;
  a1[1] = 0xE800000000000000;
}

void sub_211A46CAC(char *a1@<X8>)
{
  strcpy(a1, "eligibleAutoMe");
  a1[15] = -18;
}

uint64_t sub_211A46CD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211A46EB4();
  *a1 = result;
  return result;
}

uint64_t sub_211A46CF8()
{
  sub_211920B58();
  return sub_211A48390();
}

uint64_t sub_211A46D20()
{
  sub_211920B58();
  return sub_211A4839C();
}

uint64_t assignWithCopy for FMFMyInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for FMFMyInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

unint64_t sub_211A46E70()
{
  unint64_t result;

  result = qword_254ACF258;
  if (!qword_254ACF258)
  {
    result = MEMORY[0x212BE47C8](&unk_211A523FC, &type metadata for FMFMyInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254ACF258);
  }
  return result;
}

uint64_t sub_211A46EB4()
{
  unint64_t v0;

  v0 = sub_211A480F0();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_211A46EFC()
{
  return MEMORY[0x24BE318A0]();
}

uint64_t sub_211A46F08()
{
  return MEMORY[0x24BE319D0]();
}

uint64_t sub_211A46F14()
{
  return MEMORY[0x24BE319F0]();
}

uint64_t sub_211A46F20()
{
  return MEMORY[0x24BE319F8]();
}

uint64_t sub_211A46F2C()
{
  return MEMORY[0x24BE31A00]();
}

uint64_t sub_211A46F38()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_211A46F44()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_211A46F50()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_211A46F5C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_211A46F68()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_211A46F74()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_211A46F80()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_211A46F8C()
{
  return MEMORY[0x24BDCB648]();
}

uint64_t sub_211A46F98()
{
  return MEMORY[0x24BDCB6E8]();
}

uint64_t sub_211A46FA4()
{
  return MEMORY[0x24BDCB6F0]();
}

uint64_t sub_211A46FB0()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t sub_211A46FBC()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_211A46FC8()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_211A46FD4()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_211A46FE0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_211A46FEC()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_211A46FF8()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_211A47004()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_211A47010()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_211A4701C()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_211A47028()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_211A47034()
{
  return MEMORY[0x24BDCCB28]();
}

uint64_t sub_211A47040()
{
  return MEMORY[0x24BDCCB38]();
}

uint64_t sub_211A4704C()
{
  return MEMORY[0x24BDCCBB0]();
}

uint64_t sub_211A47058()
{
  return MEMORY[0x24BDCCBE0]();
}

uint64_t sub_211A47064()
{
  return MEMORY[0x24BDCCC00]();
}

uint64_t sub_211A47070()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_211A4707C()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_211A47088()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_211A47094()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_211A470A0()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_211A470AC()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_211A470B8()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_211A470C4()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_211A470D0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_211A470DC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_211A470E8()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_211A470F4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_211A47100()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_211A4710C()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_211A47118()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_211A47124()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_211A47130()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_211A4713C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_211A47148()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_211A47154()
{
  return MEMORY[0x24BDCDC90]();
}

uint64_t sub_211A47160()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_211A4716C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_211A47178()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_211A47184()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_211A47190()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_211A4719C()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_211A471A8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_211A471B4()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_211A471C0()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_211A471CC()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_211A471D8()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_211A471E4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_211A471F0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_211A471FC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_211A47208()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_211A47214()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_211A47220()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_211A4722C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_211A47238()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_211A47244()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_211A47250()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_211A4725C()
{
  return MEMORY[0x24BDCECD0]();
}

uint64_t sub_211A47268()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_211A47274()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_211A47280()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_211A4728C()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_211A47298()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_211A472A4()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_211A472B0()
{
  return MEMORY[0x24BDCF1C0]();
}

uint64_t sub_211A472BC()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_211A472C8()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_211A472D4()
{
  return MEMORY[0x24BDCF4A0]();
}

uint64_t sub_211A472E0()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_211A472EC()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_211A472F8()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_211A47304()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_211A47310()
{
  return MEMORY[0x24BE30198]();
}

uint64_t sub_211A4731C()
{
  return MEMORY[0x24BE301A0]();
}

uint64_t sub_211A47328()
{
  return MEMORY[0x24BE301A8]();
}

uint64_t sub_211A47334()
{
  return MEMORY[0x24BE301C0]();
}

uint64_t sub_211A47340()
{
  return MEMORY[0x24BE301C8]();
}

uint64_t sub_211A4734C()
{
  return MEMORY[0x24BE301E0]();
}

uint64_t sub_211A47358()
{
  return MEMORY[0x24BE301E8]();
}

uint64_t sub_211A47364()
{
  return MEMORY[0x24BE301F8]();
}

uint64_t sub_211A47370()
{
  return MEMORY[0x24BE30200]();
}

uint64_t sub_211A4737C()
{
  return MEMORY[0x24BE30208]();
}

uint64_t sub_211A47388()
{
  return MEMORY[0x24BE30218]();
}

uint64_t sub_211A47394()
{
  return MEMORY[0x24BE31BD0]();
}

uint64_t sub_211A473A0()
{
  return MEMORY[0x24BE31BD8]();
}

uint64_t sub_211A473AC()
{
  return MEMORY[0x24BE31BE0]();
}

uint64_t sub_211A473B8()
{
  return MEMORY[0x24BE31BE8]();
}

uint64_t sub_211A473C4()
{
  return MEMORY[0x24BE31C08]();
}

uint64_t sub_211A473D0()
{
  return MEMORY[0x24BE31C10]();
}

uint64_t sub_211A473DC()
{
  return MEMORY[0x24BE31C18]();
}

uint64_t sub_211A473E8()
{
  return MEMORY[0x24BE31C38]();
}

uint64_t sub_211A473F4()
{
  return MEMORY[0x24BE31C40]();
}

uint64_t sub_211A47400()
{
  return MEMORY[0x24BE31D10]();
}

uint64_t sub_211A4740C()
{
  return MEMORY[0x24BE31D38]();
}

uint64_t sub_211A47418()
{
  return MEMORY[0x24BE31D50]();
}

uint64_t sub_211A47424()
{
  return MEMORY[0x24BE31D88]();
}

uint64_t sub_211A47430()
{
  return MEMORY[0x24BE31DB8]();
}

uint64_t sub_211A4743C()
{
  return MEMORY[0x24BE31DD0]();
}

uint64_t sub_211A47448()
{
  return MEMORY[0x24BE31DE8]();
}

uint64_t sub_211A47454()
{
  return MEMORY[0x24BE31EC0]();
}

uint64_t sub_211A47460()
{
  return MEMORY[0x24BE31F00]();
}

uint64_t sub_211A4746C()
{
  return MEMORY[0x24BE31F20]();
}

uint64_t sub_211A47478()
{
  return MEMORY[0x24BE31F48]();
}

uint64_t sub_211A47484()
{
  return MEMORY[0x24BE31FC8]();
}

uint64_t sub_211A47490()
{
  return MEMORY[0x24BE320A0]();
}

uint64_t sub_211A4749C()
{
  return MEMORY[0x24BE320B8]();
}

uint64_t sub_211A474A8()
{
  return MEMORY[0x24BE320C8]();
}

uint64_t sub_211A474B4()
{
  return MEMORY[0x24BE320E8]();
}

uint64_t sub_211A474C0()
{
  return MEMORY[0x24BE32108]();
}

uint64_t sub_211A474CC()
{
  return MEMORY[0x24BE32110]();
}

uint64_t sub_211A474D8()
{
  return MEMORY[0x24BE32118]();
}

uint64_t sub_211A474E4()
{
  return MEMORY[0x24BE32190]();
}

uint64_t sub_211A474F0()
{
  return MEMORY[0x24BE321C0]();
}

uint64_t sub_211A474FC()
{
  return MEMORY[0x24BE321F8]();
}

uint64_t sub_211A47508()
{
  return MEMORY[0x24BE32208]();
}

uint64_t sub_211A47514()
{
  return MEMORY[0x24BE32218]();
}

uint64_t sub_211A47520()
{
  return MEMORY[0x24BE32228]();
}

uint64_t sub_211A4752C()
{
  return MEMORY[0x24BE32240]();
}

uint64_t sub_211A47538()
{
  return MEMORY[0x24BE32250]();
}

uint64_t sub_211A47544()
{
  return MEMORY[0x24BE32270]();
}

uint64_t sub_211A47550()
{
  return MEMORY[0x24BE32280]();
}

uint64_t sub_211A4755C()
{
  return MEMORY[0x24BE32290]();
}

uint64_t sub_211A47568()
{
  return MEMORY[0x24BE322B0]();
}

uint64_t sub_211A47574()
{
  return MEMORY[0x24BE32308]();
}

uint64_t sub_211A47580()
{
  return MEMORY[0x24BE32378]();
}

uint64_t sub_211A4758C()
{
  return MEMORY[0x24BE32388]();
}

uint64_t sub_211A47598()
{
  return MEMORY[0x24BE323B8]();
}

uint64_t sub_211A475A4()
{
  return MEMORY[0x24BE323C0]();
}

uint64_t sub_211A475B0()
{
  return MEMORY[0x24BE323C8]();
}

uint64_t sub_211A475BC()
{
  return MEMORY[0x24BE323D8]();
}

uint64_t sub_211A475C8()
{
  return MEMORY[0x24BE323E0]();
}

uint64_t sub_211A475D4()
{
  return MEMORY[0x24BE323E8]();
}

uint64_t sub_211A475E0()
{
  return MEMORY[0x24BE323F0]();
}

uint64_t sub_211A475EC()
{
  return MEMORY[0x24BE323F8]();
}

uint64_t sub_211A475F8()
{
  return MEMORY[0x24BE32400]();
}

uint64_t sub_211A47604()
{
  return MEMORY[0x24BE32408]();
}

uint64_t sub_211A47610()
{
  return MEMORY[0x24BE32418]();
}

uint64_t sub_211A4761C()
{
  return MEMORY[0x24BE32420]();
}

uint64_t sub_211A47628()
{
  return MEMORY[0x24BE32428]();
}

uint64_t sub_211A47634()
{
  return MEMORY[0x24BE32430]();
}

uint64_t sub_211A47640()
{
  return MEMORY[0x24BE32448]();
}

uint64_t sub_211A4764C()
{
  return MEMORY[0x24BE32450]();
}

uint64_t sub_211A47658()
{
  return MEMORY[0x24BE32458]();
}

uint64_t sub_211A47664()
{
  return MEMORY[0x24BE32460]();
}

uint64_t sub_211A47670()
{
  return MEMORY[0x24BE32468]();
}

uint64_t sub_211A4767C()
{
  return MEMORY[0x24BE32470]();
}

uint64_t sub_211A47688()
{
  return MEMORY[0x24BE32478]();
}

uint64_t sub_211A47694()
{
  return MEMORY[0x24BE32480]();
}

uint64_t sub_211A476A0()
{
  return MEMORY[0x24BE32488]();
}

uint64_t sub_211A476AC()
{
  return MEMORY[0x24BE32498]();
}

uint64_t sub_211A476B8()
{
  return MEMORY[0x24BE324A0]();
}

uint64_t sub_211A476C4()
{
  return MEMORY[0x24BE324A8]();
}

uint64_t sub_211A476D0()
{
  return MEMORY[0x24BE324B0]();
}

uint64_t sub_211A476DC()
{
  return MEMORY[0x24BE18CF8]();
}

uint64_t sub_211A476E8()
{
  return MEMORY[0x24BE18D20]();
}

uint64_t sub_211A476F4()
{
  return MEMORY[0x24BE18D28]();
}

uint64_t sub_211A47700()
{
  return MEMORY[0x24BE18D30]();
}

uint64_t sub_211A4770C()
{
  return MEMORY[0x24BE18D40]();
}

uint64_t sub_211A47718()
{
  return MEMORY[0x24BE18D48]();
}

uint64_t sub_211A47724()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_211A47730()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_211A4773C()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_211A47748()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_211A47754()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_211A47760()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_211A4776C()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_211A47778()
{
  return MEMORY[0x24BDBA060]();
}

uint64_t sub_211A47784()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_211A47790()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_211A4779C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_211A477A8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_211A477B4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_211A477C0()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_211A477CC()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_211A477D8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_211A477E4()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_211A477F0()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_211A477FC()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_211A47808()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_211A47814()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_211A47820()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_211A4782C()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_211A47838()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_211A47844()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_211A47850()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_211A4785C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_211A47868()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_211A47874()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_211A47880()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_211A4788C()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_211A47898()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_211A478A4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_211A478B0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_211A478BC()
{
  return MEMORY[0x24BEE0770]();
}

uint64_t sub_211A478C8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_211A478D4()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_211A478E0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_211A478EC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_211A478F8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_211A47904()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_211A47910()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_211A4791C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_211A47928()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_211A47934()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_211A47940()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_211A4794C()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_211A47958()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_211A47964()
{
  return MEMORY[0x24BEE0AA0]();
}

uint64_t sub_211A47970()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_211A4797C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_211A47988()
{
  return MEMORY[0x24BEE0B38]();
}

uint64_t sub_211A47994()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_211A479A0()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_211A479AC()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_211A479B8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_211A479C4()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_211A479D0()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_211A479DC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_211A479E8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_211A479F4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_211A47A00()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_211A47A0C()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_211A47A18()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_211A47A24()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_211A47A30()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_211A47A3C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_211A47A48()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_211A47A54()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_211A47A60()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_211A47A6C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_211A47A78()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_211A47A84()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_211A47A90()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_211A47A9C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_211A47AA8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_211A47AB4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_211A47AC0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_211A47ACC()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_211A47AD8()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_211A47AE4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_211A47AF0()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_211A47AFC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_211A47B08()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_211A47B14()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_211A47B20()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_211A47B2C()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_211A47B38()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_211A47B44()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_211A47B50()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_211A47B5C()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_211A47B68()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_211A47B74()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_211A47B80()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_211A47B8C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_211A47B98()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_211A47BA4()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_211A47BB0()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_211A47BBC()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_211A47BC8()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_211A47BD4()
{
  return MEMORY[0x24BEE6B58]();
}

uint64_t sub_211A47BE0()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_211A47BEC()
{
  return MEMORY[0x24BEE6BB0]();
}

uint64_t sub_211A47BF8()
{
  return MEMORY[0x24BEE6BE0]();
}

uint64_t sub_211A47C04()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_211A47C10()
{
  return MEMORY[0x24BEE6C20]();
}

uint64_t sub_211A47C1C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_211A47C28()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_211A47C34()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_211A47C40()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_211A47C4C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_211A47C58()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_211A47C64()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_211A47C70()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_211A47C7C()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_211A47C88()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_211A47C94()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_211A47CA0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_211A47CAC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_211A47CB8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_211A47CC4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_211A47CD0()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_211A47CDC()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_211A47CE8()
{
  return MEMORY[0x24BEE1A50]();
}

uint64_t sub_211A47CF4()
{
  return MEMORY[0x24BEE1B30]();
}

uint64_t sub_211A47D00()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_211A47D0C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_211A47D18()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_211A47D24()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_211A47D30()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_211A47D3C()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t sub_211A47D48()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_211A47D54()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_211A47D60()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_211A47D6C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_211A47D78()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_211A47D84()
{
  return MEMORY[0x24BEE5708]();
}

uint64_t sub_211A47D90()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_211A47D9C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_211A47DA8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_211A47DB4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_211A47DC0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_211A47DCC()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_211A47DD8()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_211A47DE4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_211A47DF0()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_211A47DFC()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_211A47E08()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_211A47E14()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_211A47E20()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_211A47E2C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_211A47E38()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_211A47E44()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_211A47E50()
{
  return MEMORY[0x24BDD0518]();
}

uint64_t sub_211A47E5C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_211A47E68()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_211A47E74()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_211A47E80()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_211A47E8C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_211A47E98()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_211A47EA4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_211A47EB0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_211A47EBC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_211A47EC8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_211A47ED4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_211A47EE0()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_211A47EEC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_211A47EF8()
{
  return MEMORY[0x24BDD0698]();
}

uint64_t sub_211A47F04()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_211A47F10()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_211A47F1C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_211A47F28()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_211A47F34()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_211A47F40()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_211A47F4C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_211A47F58()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_211A47F64()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_211A47F70()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_211A47F7C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_211A47F88()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_211A47F94()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_211A47FA0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_211A47FAC()
{
  return MEMORY[0x24BEE27B0]();
}

uint64_t sub_211A47FB8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_211A47FC4()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_211A47FD0()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_211A47FDC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_211A47FE8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_211A47FF4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_211A48000()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_211A4800C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_211A48018()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_211A48024()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_211A48030()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_211A4803C()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_211A48048()
{
  return MEMORY[0x24BEE2AE8]();
}

uint64_t sub_211A48054()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_211A48060()
{
  return MEMORY[0x24BEE6EF0]();
}

uint64_t sub_211A4806C()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_211A48078()
{
  return MEMORY[0x24BEE2BE8]();
}

uint64_t sub_211A48084()
{
  return MEMORY[0x24BEE2BF0]();
}

uint64_t sub_211A48090()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_211A4809C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_211A480A8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_211A480B4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_211A480C0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_211A480CC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_211A480D8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_211A480E4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_211A480F0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_211A480FC()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_211A48108()
{
  return MEMORY[0x24BE30220]();
}

uint64_t sub_211A48114()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_211A48120()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_211A4812C()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_211A48138()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_211A48144()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_211A48150()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_211A4815C()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_211A48168()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_211A48174()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_211A48180()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_211A4818C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_211A48198()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_211A481A4()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_211A481B0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_211A481BC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_211A481C8()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_211A481D4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_211A481E0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_211A481EC()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_211A481F8()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_211A48204()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_211A48210()
{
  return MEMORY[0x24BEE7028]();
}

uint64_t sub_211A4821C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_211A48228()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_211A48234()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_211A48240()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_211A4824C()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_211A48258()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_211A48264()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_211A48270()
{
  return MEMORY[0x24BEE3A40]();
}

uint64_t sub_211A4827C()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_211A48288()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_211A48294()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_211A482A0()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_211A482AC()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_211A482B8()
{
  return MEMORY[0x24BEE7148]();
}

uint64_t sub_211A482C4()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_211A482D0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_211A482DC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_211A482E8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_211A482F4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_211A48300()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_211A4830C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_211A48318()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_211A48324()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_211A48330()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_211A4833C()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_211A48348()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_211A48354()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_211A48360()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_211A4836C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_211A48378()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_211A48384()
{
  return MEMORY[0x24BEE49D0]();
}

uint64_t sub_211A48390()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_211A4839C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_211A483A8()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE1FA98]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x24BE1FAA0]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x24BE18E30]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x24BE18E38]();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return MEMORY[0x24BE18E40]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x24BE046F0]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x24BE04700]();
}

uint64_t CPPhoneNumberCopyLastKnownNetworkCountryCode()
{
  return MEMORY[0x24BE04708]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x24BE04710]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x24BDC2828]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x24BDC28D0]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
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

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x24BEE4D68]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x24BDB0110](*(_QWORD *)&state, path);
}

