uint64_t sub_22DDE8E20()
{
  char *v0;
  char *v1;
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
  char *v14;
  char *v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  char v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  char v55;
  id v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65[3];
  uint64_t v66;

  v1 = v0;
  v2 = sub_22DE1E410();
  v61 = *(_QWORD *)(v2 - 8);
  v62 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v60 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22DE1E9BC();
  v59 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v57 = (char *)&v57 - v7;
  v8 = type metadata accessor for FBKEvaluationController.FormContext(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB94F8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v15 = &v0[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___observationRegistrar];
  v65[0] = (uint64_t)v1;
  sub_22DD504A8((unint64_t *)&qword_255DB7270, type metadata accessor for FBKEvaluationController, (uint64_t)&protocol conformance descriptor for FBKEvaluationController);
  v63 = v15;
  sub_22DE1E068();
  swift_release();
  v16 = OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType;
  v64 = v1;
  if (!v1[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType])
  {
    swift_getKeyPath();
    v24 = v64;
    v65[0] = (uint64_t)v64;
    sub_22DE1E068();
    swift_release();
    v25 = (uint64_t)v24 + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext;
    swift_beginAccess();
    sub_22DD506A0(v25, (uint64_t)v14, &qword_255DB94F8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
    {
      sub_22DD5071C((uint64_t)v14, &qword_255DB94F8);
LABEL_8:
      if (qword_255DB53B8 != -1)
        swift_once();
      __swift_project_value_buffer(v62, (uint64_t)qword_255DC3D78);
      v26 = sub_22DE1E3F8();
      v27 = sub_22DE1F4F0();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_22DD4B000, v26, v27, "Form UI View Controller is nil. Assuming not presented yet", v28, 2u);
        MEMORY[0x22E320870](v28, -1, -1);
      }

      goto LABEL_18;
    }
    sub_22DD5C570((uint64_t)v14, (uint64_t)v11, type metadata accessor for FBKEvaluationController.FormContext);
    sub_22DD5071C((uint64_t)v14, &qword_255DB94F8);
    v40 = *(void **)&v11[*(int *)(v8 + 24)];
    v41 = v40;
    sub_22DD5C950((uint64_t)v11, type metadata accessor for FBKEvaluationController.FormContext);
    if (!v40)
      goto LABEL_8;
    v42 = objc_msgSend(v41, sel_sheetPresentationController);
    if (!v42)
    {
      if (qword_255DB53B8 != -1)
        swift_once();
      __swift_project_value_buffer(v62, (uint64_t)qword_255DC3D78);
      v52 = sub_22DE1E3F8();
      v53 = sub_22DE1F4FC();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_22DD4B000, v52, v53, "Form UI View Controller is presented but has no Sheet Presentation Controller. Cannot go full screen", v54, 2u);
        MEMORY[0x22E320870](v54, -1, -1);

      }
      else
      {

      }
      goto LABEL_18;
    }
    v43 = v42;
    v44 = objc_msgSend(v42, sel_selectedDetentIdentifier);
    if (v44)
    {
      v45 = v44;
      v46 = (void *)*MEMORY[0x24BEBE738];
      v47 = sub_22DE1F2B0();
      v49 = v48;
      if (v47 == sub_22DE1F2B0() && v49 == v50)
      {
        v51 = v46;

        swift_bridgeObjectRelease_n();
LABEL_31:

        goto LABEL_18;
      }
      v55 = sub_22DE1F8E0();
      v56 = v46;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v55 & 1) != 0)
        goto LABEL_31;
    }
    v23 = sub_22DDE9658();

    return v23 & 1;
  }
  if (v1[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType] != 1)
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v29 = v62;
    v30 = __swift_project_value_buffer(v62, (uint64_t)qword_255DC3D78);
    v31 = v60;
    v32 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v60, v30, v29);
    v33 = v64;
    v34 = v64;
    v35 = sub_22DE1E3F8();
    v36 = sub_22DE1F514();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc();
      v38 = swift_slowAlloc();
      v65[0] = v38;
      *(_DWORD *)v37 = 136446466;
      v66 = sub_22DDA2E30(0xD000000000000020, 0x800000022DE2C9A0, v65);
      sub_22DE1F628();
      *(_WORD *)(v37 + 12) = 2080;
      swift_getKeyPath();
      v66 = (uint64_t)v34;
      sub_22DE1E068();
      swift_release();
      v66 = sub_22DDA2E30(*(_QWORD *)&aUikit_1[8 * v33[v16]], qword_22DE26648[v33[v16]], v65);
      sub_22DE1F628();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22DD4B000, v35, v36, "%{public}s not applicable for api type: %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v38, -1, -1);
      MEMORY[0x22E320870](v37, -1, -1);

      (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v62);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v29);
    }
    goto LABEL_18;
  }
  swift_getKeyPath();
  v17 = v64;
  v65[0] = (uint64_t)v64;
  sub_22DE1E068();
  swift_release();
  if (v17[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__isFeedbackFormPresented] != 1)
    goto LABEL_18;
  swift_getKeyPath();
  v65[0] = (uint64_t)v17;
  sub_22DE1E068();
  swift_release();
  v18 = &v17[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__swiftUIDetent];
  swift_beginAccess();
  v19 = v59;
  v20 = v57;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v57, v18, v4);
  v21 = v58;
  sub_22DE1E9A4();
  sub_22DD504A8(&qword_255DB7618, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEB10], MEMORY[0x24BDEEB28]);
  LOBYTE(v18) = sub_22DE1F280();
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v21, v4);
  v22(v20, v4);
  if ((v18 & 1) != 0)
  {
LABEL_18:
    v23 = 0;
    return v23 & 1;
  }
  v23 = sub_22DDE9658();
  return v23 & 1;
}

uint64_t sub_22DDE9658()
{
  _BYTE *v0;
  _BYTE *v1;
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
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _BYTE *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t aBlock[6];
  uint64_t v50;

  v1 = v0;
  v2 = sub_22DE1E410();
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22DE1E9BC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FBKEvaluationController.FormContext(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB94F8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v15 = &v0[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___observationRegistrar];
  aBlock[0] = (uint64_t)v1;
  v47 = sub_22DD504A8((unint64_t *)&qword_255DB7270, type metadata accessor for FBKEvaluationController, (uint64_t)&protocol conformance descriptor for FBKEvaluationController);
  v48 = v15;
  sub_22DE1E068();
  swift_release();
  if (!v1[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType])
  {
    swift_getKeyPath();
    aBlock[0] = (uint64_t)v1;
    sub_22DE1E068();
    swift_release();
    v18 = (uint64_t)&v1[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext];
    swift_beginAccess();
    sub_22DD506A0(v18, (uint64_t)v14, &qword_255DB94F8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
    {
      sub_22DD5071C((uint64_t)v14, &qword_255DB94F8);
      v19 = v46;
    }
    else
    {
      sub_22DD5C570((uint64_t)v14, (uint64_t)v11, type metadata accessor for FBKEvaluationController.FormContext);
      sub_22DD5071C((uint64_t)v14, &qword_255DB94F8);
      v34 = *(void **)&v11[*(int *)(v8 + 24)];
      v17 = v34;
      sub_22DD5C950((uint64_t)v11, type metadata accessor for FBKEvaluationController.FormContext);
      v19 = v46;
      if (v34)
      {
        v35 = objc_msgSend((id)v17, sel_sheetPresentationController);
        if (v35)
        {
          v36 = v35;
          v37 = swift_allocObject();
          *(_QWORD *)(v37 + 16) = v36;
          v19 = swift_allocObject();
          *(_QWORD *)(v19 + 16) = sub_22DDC162C;
          *(_QWORD *)(v19 + 24) = v37;
          aBlock[4] = (uint64_t)sub_22DD54288;
          aBlock[5] = v19;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_22DDDE064;
          aBlock[3] = (uint64_t)&block_descriptor_82_1;
          v38 = _Block_copy(aBlock);
          v39 = v36;
          swift_retain();
          swift_release();
          objc_msgSend(v39, sel_animateChanges_, v38);

          _Block_release(v38);
          v17 = 1;
          LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();
          swift_release();
          swift_release();
          if ((v39 & 1) == 0)
            return v17;
          __break(1u);
        }
        if (qword_255DB53B8 != -1)
          swift_once();
        __swift_project_value_buffer(v19, (uint64_t)qword_255DC3D78);
        v40 = sub_22DE1E3F8();
        v41 = sub_22DE1F4FC();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_22DD4B000, v40, v41, "Form UI View Controller has no Sheet Presentation Controller. Cannot go full screen", v42, 2u);
          MEMORY[0x22E320870](v42, -1, -1);

        }
        else
        {

        }
        return 0;
      }
    }
    if (qword_255DB53B8 != -1)
      swift_once();
    __swift_project_value_buffer(v19, (uint64_t)qword_255DC3D78);
    v20 = sub_22DE1E3F8();
    v21 = sub_22DE1F4FC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_22DD4B000, v20, v21, "Form UI View Controller is nil. Cannot go full screen", v22, 2u);
      MEMORY[0x22E320870](v22, -1, -1);
    }

    return 0;
  }
  if (v1[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType] != 1)
  {
    v23 = OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType;
    if (qword_255DB53B8 != -1)
      swift_once();
    v24 = v46;
    v25 = __swift_project_value_buffer(v46, (uint64_t)qword_255DC3D78);
    v27 = v44;
    v26 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v25, v24);
    v28 = v1;
    v29 = sub_22DE1E3F8();
    v30 = sub_22DE1F514();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      aBlock[0] = v32;
      *(_DWORD *)v31 = 136446466;
      v50 = sub_22DDA2E30(0xD000000000000018, 0x800000022DE2BF60, aBlock);
      sub_22DE1F628();
      *(_WORD *)(v31 + 12) = 2080;
      swift_getKeyPath();
      v50 = (uint64_t)v28;
      sub_22DE1E068();
      swift_release();
      v50 = sub_22DDA2E30(*(_QWORD *)&aUikit_1[8 * (char)v1[v23]], qword_22DE26648[(char)v1[v23]], aBlock);
      sub_22DE1F628();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22DD4B000, v29, v30, "%{public}s not applicable for api type: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v32, -1, -1);
      MEMORY[0x22E320870](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v24);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v24);
    }
    return 0;
  }
  sub_22DE1E9A4();
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v43 - 2) = (uint64_t)v1;
  *(&v43 - 1) = (uint64_t)v7;
  aBlock[0] = (uint64_t)v1;
  sub_22DE1E05C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

void sub_22DDE9DF8(uint64_t a1, void (*a2)(_QWORD, _QWORD), void (*a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_255DB53B8 != -1)
    swift_once();
  v6 = sub_22DE1E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_255DC3D78);
  v7 = sub_22DE1E3F8();
  v8 = sub_22DE1F514();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136446210;
    sub_22DDA2E30(0xD000000000000022, 0x800000022DE2BCD0, &v11);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v7, v8, "%{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v10, -1, -1);
    MEMORY[0x22E320870](v9, -1, -1);
  }

  sub_22DDE15E8(a1, a2, a3);
}

uint64_t sub_22DDE9F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if (qword_255DB53B8 != -1)
    swift_once();
  v6 = sub_22DE1E410();
  __swift_project_value_buffer(v6, (uint64_t)qword_255DC3D78);
  v7 = sub_22DE1E3F8();
  v8 = sub_22DE1F514();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136446210;
    sub_22DDA2E30(0xD000000000000025, 0x800000022DE2BD00, &v13);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v7, v8, "%{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v10, -1, -1);
    MEMORY[0x22E320870](v9, -1, -1);
  }

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  sub_22DD50D8C(a2);
  sub_22DDE15E8(a1, (void (*)(_QWORD, _QWORD))sub_22DDF5DB8, (void (*)(_QWORD, _QWORD, _QWORD))v11);
  return swift_release();
}

void sub_22DDEA164(void *a1, char a2, void (*a3)(void *, uint64_t))
{
  void *v5;
  void *v6;
  _BYTE *v7;

  if (a3)
  {
    if ((a2 & 1) != 0)
    {
      sub_22DD50D8C((uint64_t)a3);
      sub_22DDF7A04(a1);
      a3(a1, 1);
      sub_22DD50DE0((uint64_t)a3);
      v5 = a1;
      goto LABEL_7;
    }
    if (a1)
    {
      sub_22DD50D8C((uint64_t)a3);
      sub_22DDF7A04(a1);
      a3(a1, 0);
      sub_22DD50DE0((uint64_t)a3);
      v5 = a1;
LABEL_7:
      sub_22DD6E88C(v5);
      return;
    }
    sub_22DDD4680();
    v6 = (void *)swift_allocError();
    *v7 = 4;
    swift_retain();
    a3(v6, 1);

    sub_22DD50DE0((uint64_t)a3);
  }
}

uint64_t sub_22DDEA280(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9518);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22DDD4680();
  v6 = swift_allocError();
  *v7 = 4;
  *v5 = v6;
  swift_storeEnumTagMultiPayload();
  a2(v5);
  return sub_22DD5071C((uint64_t)v5, &qword_255DB9518);
}

void sub_22DDEA340(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  void (*v26)(void *, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unsigned int *v30;
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = v2;
  v39 = a2;
  v38 = type metadata accessor for FBKEvaluation.Input(0);
  MEMORY[0x24BDAC7A8](v38);
  v41 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22DE1E194();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_22DE1E14C();
  v43 = *(_QWORD *)(v10 - 8);
  v44 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v42 = (uint64_t)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22DE1E410();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = *a1;
  if (qword_255DB53B8 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v12, (uint64_t)qword_255DC3D78);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  v17 = sub_22DE1E3F8();
  v18 = sub_22DE1F514();
  if (os_log_type_enabled(v17, v18))
  {
    v34 = v9;
    v35 = v7;
    v36 = v6;
    v37 = v3;
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v46 = v20;
    *(_DWORD *)v19 = 136446466;
    v45 = sub_22DDA2E30(0xD00000000000002DLL, 0x800000022DE2BD30, &v46);
    sub_22DE1F628();
    *(_WORD *)(v19 + 12) = 2082;
    v21 = 0x800000022DE2B4E0;
    v22 = 0x442073626D756854;
    if (v40 == 1)
      v21 = 0xEB000000006E776FLL;
    else
      v22 = 0xD000000000000010;
    if ((_DWORD)v40)
      v23 = v22;
    else
      v23 = 0x552073626D756854;
    if ((_DWORD)v40)
      v24 = v21;
    else
      v24 = 0xE900000000000070;
    v45 = sub_22DDA2E30(v23, v24, &v46);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22DD4B000, v17, v18, "%{public}s response %{public}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v20, -1, -1);
    MEMORY[0x22E320870](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v6 = v36;
    v3 = v37;
    v9 = v34;
    v7 = v35;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  v25 = v41;
  if (sub_22DDF4800())
  {
    swift_getKeyPath();
    v46 = v3;
    sub_22DD504A8((unint64_t *)&qword_255DB7270, type metadata accessor for FBKEvaluationController, (uint64_t)&protocol conformance descriptor for FBKEvaluationController);
    sub_22DE1E068();
    swift_release();
    v26 = *(void (**)(void *, uint64_t))(v3
                                                 + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluationCompletionHandler);
    if (v26)
    {
      v27 = sub_22DE1E0D4();
      sub_22DD504A8(&qword_255DB94E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE30DF0], MEMORY[0x24BE30DF8]);
      v28 = (void *)swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BE30DE8], v27);
      swift_retain();
      v26(v28, 1);
      sub_22DD50DE0((uint64_t)v26);

    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 104))(v42, **((unsigned int **)&unk_24F9947C0 + v40), v44);
    sub_22DD5C570(v39, (uint64_t)v25, type metadata accessor for FBKEvaluation.Input);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v9 = *v25;
      v30 = (unsigned int *)MEMORY[0x24BE30F00];
    }
    else
    {
      v31 = sub_22DE1E050();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v9, v25, v31);
      v30 = (unsigned int *)MEMORY[0x24BE30F38];
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *v30, v6);
    v32 = v42;
    sub_22DDE3944(v42, (uint64_t)v9, 1, 0);
    (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v32, v44);
  }
}

void sub_22DDEA870(uint64_t a1)
{
  char v1;

  v1 = 0;
  sub_22DDEA340(&v1, a1);
}

void sub_22DDEA898(uint64_t a1)
{
  char v1;

  v1 = 1;
  sub_22DDEA340(&v1, a1);
}

void sub_22DDEA8C4(uint64_t a1)
{
  char v1;

  v1 = 2;
  sub_22DDEA340(&v1, a1);
}

unint64_t sub_22DDEA8F0(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[3];
  uint64_t v18;

  v2 = v1;
  v4 = sub_22DE1E14C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  if (qword_255DB53B8 != -1)
    swift_once();
  v9 = sub_22DE1E410();
  __swift_project_value_buffer(v9, (uint64_t)qword_255DC3D78);
  v10 = sub_22DE1E3F8();
  v11 = sub_22DE1F4F0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v17[1] = v2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136446210;
    v17[2] = sub_22DDA2E30(0xD000000000000016, 0x800000022DE2BD60, &v18);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v10, v11, "%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v14, -1, -1);
    MEMORY[0x22E320870](v13, -1, -1);
  }

  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, **((unsigned int **)&unk_24F9947C0 + v8), v4);
  v15 = sub_22DDE8864((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

id FBKEvaluationController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKEvaluationController.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FBKEvaluationController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKEvaluationController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t FBKEvaluationController.feedbackDraftViewController(_:didCompleteWithResponseType:responseID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22DDF5DC4(a1, a3, a4);
}

uint64_t sub_22DDEACC4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  char *v31;
  int64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  _QWORD *v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t result;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, char *, uint64_t);
  unint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82[3];
  unint64_t v83;

  v1 = sub_22DE1E2CC();
  v2 = *(_QWORD **)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v80 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v79 = (char *)&v69 - v5;
  v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses);
  swift_beginAccess();
  v7 = *v6;
  if (*v6)
  {
    v69 = v1;
    v8 = *(_QWORD *)(v7 + 16);
    v9 = MEMORY[0x24BEE4AF8];
    v73 = v2;
    if (v8)
    {
      v75 = swift_bridgeObjectRetain();
      v10 = v75 + 48;
      do
      {
        v14 = *(_QWORD *)(v10 + 24);
        v15 = *(unsigned __int8 *)(v10 + 32);
        if (v15 != 3 || v14 > 1)
        {
          v17 = *(_QWORD *)(v10 - 16);
          v18 = *(_QWORD *)(v10 - 8);
          v19 = *(_QWORD *)(v10 + 8);
          v77 = *(void (**)(uint64_t, char *, uint64_t))v10;
          v78 = v17;
          LODWORD(v76) = *(unsigned __int8 *)(v10 + 16);
          v20 = *(_QWORD *)(v10 + 40);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_22DDAA44C(v14, v15);
          swift_bridgeObjectRetain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v82[0] = v9;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_22DE0F2B8(0, *(_QWORD *)(v9 + 16) + 1, 1);
            v9 = v82[0];
          }
          v12 = *(_QWORD *)(v9 + 16);
          v11 = *(_QWORD *)(v9 + 24);
          if (v12 >= v11 >> 1)
          {
            sub_22DE0F2B8(v11 > 1, v12 + 1, 1);
            v9 = v82[0];
          }
          *(_QWORD *)(v9 + 16) = v12 + 1;
          v13 = v9 + (v12 << 6);
          *(_QWORD *)(v13 + 32) = v78;
          *(_QWORD *)(v13 + 40) = v18;
          *(_QWORD *)(v13 + 48) = v77;
          *(_QWORD *)(v13 + 56) = v19;
          *(_BYTE *)(v13 + 64) = v76;
          *(_QWORD *)(v13 + 72) = v14;
          *(_BYTE *)(v13 + 80) = v15;
          *(_QWORD *)(v13 + 88) = v20;
          v2 = v73;
        }
        v10 += 64;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
    }
    v83 = MEMORY[0x24BEE4B00];
    v22 = v69;
    v72 = *(_QWORD *)(v9 + 16);
    if (v72)
    {
      v23 = 0;
      v71 = v9 + 32;
      v70 = v9;
      do
      {
        if (v23 >= *(_QWORD *)(v9 + 16))
        {
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        v78 = v23;
        v26 = v71 + (v23 << 6);
        v27 = *(_QWORD *)(v26 + 24);
        v28 = *(_QWORD *)(v26 + 40);
        v29 = *(unsigned __int8 *)(v26 + 48);
        v30 = *(_QWORD *)(v26 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_22DDAA44C(v28, v29);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31 = v79;
        sub_22DE1E2B4();
        v77 = (void (*)(uint64_t, char *, uint64_t))v2[2];
        v77((uint64_t)v80, v31, v22);
        v32 = *(_QWORD *)(v30 + 16);
        if (v32)
        {
          v74 = v27;
          LODWORD(v75) = v29;
          v76 = v28;
          v82[0] = MEMORY[0x24BEE4AF8];
          swift_bridgeObjectRetain();
          sub_22DE0F280(0, v32, 0);
          v33 = v82[0];
          v34 = (_BYTE *)(v30 + 64);
          do
          {
            v36 = *((_QWORD *)v34 - 2);
            v35 = *((_QWORD *)v34 - 1);
            if (*v34 == 1)
            {
              swift_bridgeObjectRetain();
            }
            else
            {
              v38 = *((_QWORD *)v34 - 4);
              v37 = *((_QWORD *)v34 - 3);
              sub_22DDF7710(v38, v37, *((_QWORD *)v34 - 2), *((_QWORD *)v34 - 1), 0);
              v36 = v38;
              v35 = v37;
            }
            v82[0] = v33;
            v40 = *(_QWORD *)(v33 + 16);
            v39 = *(_QWORD *)(v33 + 24);
            if (v40 >= v39 >> 1)
            {
              sub_22DE0F280(v39 > 1, v40 + 1, 1);
              v33 = v82[0];
            }
            *(_QWORD *)(v33 + 16) = v40 + 1;
            v41 = v33 + 16 * v40;
            *(_QWORD *)(v41 + 32) = v36;
            *(_QWORD *)(v41 + 40) = v35;
            v34 += 40;
            --v32;
          }
          while (v32);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_22DDAA4C4(v76, v75);
          swift_bridgeObjectRelease_n();
          v22 = v69;
          v2 = v73;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_22DDAA4C4(v28, v29);
          swift_bridgeObjectRelease();
          v33 = MEMORY[0x24BEE4AF8];
        }
        v42 = v83;
        v43 = swift_isUniquelyReferenced_nonNull_native();
        v82[0] = v42;
        v83 = 0x8000000000000000;
        v45 = sub_22DDFD5E0((uint64_t)v80);
        v46 = *(_QWORD *)(v42 + 16);
        v47 = (v44 & 1) == 0;
        v48 = v46 + v47;
        if (__OFADD__(v46, v47))
          goto LABEL_52;
        v49 = v44;
        if (*(_QWORD *)(v42 + 24) >= v48)
        {
          if ((v43 & 1) != 0)
          {
            v52 = (_QWORD *)v82[0];
            if ((v44 & 1) != 0)
              goto LABEL_18;
          }
          else
          {
            sub_22DE00450();
            v52 = (_QWORD *)v82[0];
            if ((v49 & 1) != 0)
              goto LABEL_18;
          }
        }
        else
        {
          sub_22DDFF044(v48, v43);
          v50 = sub_22DDFD5E0((uint64_t)v80);
          if ((v49 & 1) != (v51 & 1))
          {
            result = sub_22DE1F91C();
            __break(1u);
            return result;
          }
          v45 = v50;
          v52 = (_QWORD *)v82[0];
          if ((v49 & 1) != 0)
          {
LABEL_18:
            v24 = v52[7];
            swift_bridgeObjectRelease();
            *(_QWORD *)(v24 + 8 * v45) = v33;
            goto LABEL_19;
          }
        }
        v52[(v45 >> 6) + 8] |= 1 << v45;
        v77(v52[6] + v2[9] * v45, v80, v22);
        *(_QWORD *)(v52[7] + 8 * v45) = v33;
        v53 = v52[2];
        v54 = __OFADD__(v53, 1);
        v55 = v53 + 1;
        if (v54)
          goto LABEL_53;
        v52[2] = v55;
LABEL_19:
        v23 = v78 + 1;
        v83 = (unint64_t)v52;
        swift_bridgeObjectRelease();
        v25 = (void (*)(uint64_t, uint64_t))v2[1];
        v25((uint64_t)v80, v22);
        v25((uint64_t)v79, v22);
        v9 = v70;
      }
      while (v23 != v72);
    }
    swift_release();
    if (qword_255DB53B8 != -1)
LABEL_54:
      swift_once();
    v56 = sub_22DE1E410();
    __swift_project_value_buffer(v56, (uint64_t)qword_255DC3D78);
    v57 = sub_22DE1E3F8();
    v58 = sub_22DE1F4F0();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v82[0] = v60;
      *(_DWORD *)v59 = 136315138;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BE0);
      sub_22DD504A8(&qword_255DB9660, (uint64_t (*)(uint64_t))MEMORY[0x24BE31270], MEMORY[0x24BE31280]);
      v61 = sub_22DE1F250();
      v63 = v62;
      swift_bridgeObjectRelease();
      v81 = sub_22DDA2E30(v61, v63, v82);
      sub_22DE1F628();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22DD4B000, v57, v58, "Filtered question-answer pairs: \n%s", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v60, -1, -1);
      MEMORY[0x22E320870](v59, -1, -1);
    }

    swift_beginAccess();
    return v83;
  }
  else
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v65 = sub_22DE1E410();
    __swift_project_value_buffer(v65, (uint64_t)qword_255DC3D78);
    v66 = sub_22DE1E3F8();
    v67 = sub_22DE1F4FC();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_22DD4B000, v66, v67, "No detailed answers found in FBKFeedbackForm. Cannot record answers", v68, 2u);
      MEMORY[0x22E320870](v68, -1, -1);
    }

    return MEMORY[0x24BEE4B00];
  }
}

void sub_22DDEB488(uint64_t a1)
{
  char *v1;
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
  char *v14;
  uint64_t v15;
  char v16;
  void *v17;
  _BYTE *v18;
  void (*v19)(char *, char *, uint64_t);
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v27;
  _BYTE *v28;
  void *v29;
  char *v30;
  id v31;
  char *v32;
  _QWORD v33[2];
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;

  v33[1] = a1;
  v2 = sub_22DE1E14C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v34 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v33 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB94F8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for FBKEvaluationController.FormContext(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v37 = v1;
  sub_22DD504A8((unint64_t *)&qword_255DB7270, type metadata accessor for FBKEvaluationController, (uint64_t)&protocol conformance descriptor for FBKEvaluationController);
  sub_22DE1E068();
  swift_release();
  v15 = (uint64_t)&v1[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext];
  swift_beginAccess();
  sub_22DD506A0(v15, (uint64_t)v10, &qword_255DB94F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22DD5071C((uint64_t)v10, &qword_255DB94F8);
    sub_22DDB8A1C(0xD000000000000037, 0x800000022DE2C700, &v36);
    v16 = v36;
    sub_22DDD4680();
    v17 = (void *)swift_allocError();
    *v18 = v16;
    sub_22DDE0CDC(v17, 1);

  }
  else
  {
    sub_22DD647B0((uint64_t)v10, (uint64_t)v14, type metadata accessor for FBKEvaluationController.FormContext);
    v19 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v19(v7, v14, v2);
    v20 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v7, v2);
    v21 = v2;
    if (v20 == *MEMORY[0x24BE30EB0] || v20 == *MEMORY[0x24BE30E80] || v20 == *MEMORY[0x24BE30E98])
    {
      v29 = *(void **)&v14[*(int *)(v11 + 20)];
      v30 = v34;
      v19(v34, v14, v2);
      *(_QWORD *)(swift_allocObject() + 16) = v1;
      v31 = v29;
      v32 = v1;
      sub_22DE1E260();

      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v30, v2);
      sub_22DD5C950((uint64_t)v14, type metadata accessor for FBKEvaluationController.FormContext);
    }
    else if (v20 == *MEMORY[0x24BE30EA8] || v20 == *MEMORY[0x24BE30E90] || v20 == *MEMORY[0x24BE30EA0])
    {
      sub_22DE1F7CC();
      __break(1u);
    }
    else
    {
      v34 = v1;
      if (qword_255DB53B8 != -1)
        swift_once();
      v22 = sub_22DE1E410();
      __swift_project_value_buffer(v22, (uint64_t)qword_255DC3D78);
      v23 = sub_22DE1E3F8();
      v24 = sub_22DE1F514();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        v36 = v26;
        *(_DWORD *)v25 = 136446210;
        v35 = sub_22DDA2E30(0xD000000000000038, 0x800000022DE2C740, &v36);
        v21 = v2;
        sub_22DE1F628();
        _os_log_impl(&dword_22DD4B000, v23, v24, "%{public}s Unknown Action case", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E320870](v26, -1, -1);
        MEMORY[0x22E320870](v25, -1, -1);
      }

      sub_22DDD4680();
      v27 = (void *)swift_allocError();
      sub_22DDB8A1C(0xD000000000000013, 0x800000022DE2BC10, v28);
      sub_22DDE0CDC(v27, 1);

      sub_22DD5C950((uint64_t)v14, type metadata accessor for FBKEvaluationController.FormContext);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v21);
    }
  }
}

uint64_t FBKEvaluationController.feedbackDraftViewControllerDidCancel(_:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB6250);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (qword_255DB53B8 != -1)
    swift_once();
  v3 = sub_22DE1E410();
  __swift_project_value_buffer(v3, (uint64_t)qword_255DC3D78);
  v4 = sub_22DE1E3F8();
  v5 = sub_22DE1F514();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12[0] = v7;
    *(_DWORD *)v6 = 136446210;
    v11 = sub_22DDA2E30(0xD000000000000028, 0x800000022DE2BDB0, v12);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v7, -1, -1);
    MEMORY[0x22E320870](v6, -1, -1);
  }

  swift_beginAccess();
  swift_beginAccess();
  v8 = swift_bridgeObjectRetain();
  sub_22DDF6090(v8);
  swift_bridgeObjectRelease();
  v9 = sub_22DE1E11C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_22DDEB488((uint64_t)v2);
  return sub_22DD5071C((uint64_t)v2, &qword_255DB6250);
}

void FBKEvaluationController.feedbackDraftViewController(_:didFailToSubmitFeedback:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14[3];

  if (qword_255DB53B8 != -1)
    swift_once();
  v3 = sub_22DE1E410();
  __swift_project_value_buffer(v3, (uint64_t)qword_255DC3D78);
  v4 = a2;
  v5 = sub_22DE1E3F8();
  v6 = sub_22DE1F514();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v14[0] = v13;
    *(_DWORD *)v7 = 136446466;
    sub_22DDA2E30(0xD000000000000037, 0x800000022DE2BDE0, v14);
    sub_22DE1F628();
    *(_WORD *)(v7 + 12) = 2112;
    v8 = v4;
    sub_22DE1F628();
    *v12 = v4;

    _os_log_impl(&dword_22DD4B000, v5, v6, "%{public}s, error: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB8160);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v13, -1, -1);
    MEMORY[0x22E320870](v7, -1, -1);

  }
  else
  {

  }
  swift_beginAccess();
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  sub_22DDF6090(v9);
  swift_bridgeObjectRelease();
  sub_22DDD4680();
  v10 = (void *)swift_allocError();
  *v11 = 1;
  sub_22DDE0CDC(v10, 1);

}

uint64_t sub_22DDEC1B4(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v21 = a6;
  v10 = sub_22DE1F1B4();
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22DE1F1D8();
  v22 = *(_QWORD *)(v13 - 8);
  v23 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DD70E78(0, (unint64_t *)&qword_255DB8140);
  v16 = (void *)sub_22DE1F574();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a1;
  *(_BYTE *)(v17 + 32) = a2 & 1;
  aBlock[4] = a5;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22DD9C498;
  aBlock[3] = v21;
  v18 = _Block_copy(aBlock);
  v19 = a3;
  sub_22DDF7A04(a1);
  swift_release();
  sub_22DE1F1CC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_22DD504A8((unint64_t *)&qword_255DB6898, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB8150);
  sub_22DD508B0((unint64_t *)&qword_255DB68A0, (uint64_t *)&unk_255DB8150, MEMORY[0x24BEE12C8]);
  sub_22DE1F67C();
  MEMORY[0x22E31FDFC](0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v15, v23);
}

uint64_t sub_22DDEC3DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  _QWORD v8[4];

  v0 = 0x632D74726F706572;
  v1 = sub_22DE1E14C();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE30EB8];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE30E98], v1);
  sub_22DD504A8(&qword_255DB64E0, v2, MEMORY[0x24BE30ED8]);
  sub_22DE1F3AC();
  sub_22DE1F3AC();
  if (v8[2] == v8[0] && v8[3] == v8[1])
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  }
  else
  {
    v6 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
    if ((v6 & 1) == 0)
      return 0x6C6176652D736F69;
  }
  return v0;
}

unint64_t sub_22DDEC570(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
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
  uint8_t *v23;
  uint8_t *v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  __int128 v61;
  id *v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t (*v76)(char *, uint64_t, uint64_t);
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  __int128 v89;
  id v90;
  uint64_t v91[3];

  v2 = sub_22DE1E1F4();
  v3 = *(_QWORD *)(v2 - 8);
  v81 = v2;
  v82 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v83 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB5D80);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v76 - v9;
  v84 = sub_22DE1E248();
  v11 = *(_QWORD *)(v84 - 8);
  v12 = MEMORY[0x24BDAC7A8](v84);
  v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v76 - v15;
  v17 = sub_22DE1DFB4();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (uint8_t *)&v76 - v22;
  v87 = sub_22DE12BF0(MEMORY[0x24BEE4AF8]);
  type metadata accessor for FBKEvaluationController(0);
  sub_22DDEE0EC(a1, (uint64_t)v21);
  v80 = v14;
  v88 = (uint64_t)v16;
  *(_QWORD *)&v89 = v8;
  v24 = v23;
  (*(void (**)(uint8_t *, char *, uint64_t))(v18 + 32))(v23, v21, v17);
  sub_22DE1E218();
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v26 = v84;
  v27 = v25(v10, 1, v84);
  v86 = v17;
  v78 = v11;
  v79 = v18;
  if (v27 == 1)
  {
    v28 = v11;
    sub_22DD5071C((uint64_t)v10, &qword_255DB5D80);
    v30 = v82;
    v29 = (uint64_t)v83;
    v31 = v89;
    v32 = v87;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v88, v10, v26);
    v33 = (uint64_t)v83;
    sub_22DE1E200();
    v34 = sub_22DDEE6F4(v23, v33, 0);
    v36 = v35;
    v30 = v82;
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v33, v81);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = v87;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v91[0] = v37;
    sub_22DDFF6DC(v34, v36, 0, isUniquelyReferenced_nonNull_native);
    v32 = v91[0];
    swift_bridgeObjectRelease();
    v39 = *(_QWORD *)(v36 + 16);
    v31 = v89;
    if (v39)
    {
      v76 = v25;
      v77 = v24;
      v87 = v32;
      swift_bridgeObjectRelease();
      v40 = 0;
      *(_QWORD *)&v41 = 136446210;
      v85 = v41;
      v42 = v88;
      do
      {
        v43 = *(void **)(v36 + 8 * v40 + 32);
        v44 = v43;
        if (qword_255DB53B8 != -1)
          swift_once();
        v45 = sub_22DE1E410();
        __swift_project_value_buffer(v45, (uint64_t)qword_255DC3D78);
        v46 = v43;
        v47 = v43;
        v48 = sub_22DE1E3F8();
        v49 = sub_22DE1F4FC();
        if (os_log_type_enabled(v48, v49))
        {
          v50 = swift_slowAlloc();
          v51 = swift_slowAlloc();
          v90 = v43;
          v91[0] = v51;
          *(_DWORD *)v50 = v85;
          v52 = v43;
          __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
          v53 = sub_22DE1F2EC();
          *(_QWORD *)(v50 + 4) = sub_22DDA2E30(v53, v54, v91);
          v31 = v89;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_22DD4B000, v48, v49, "originalContent attachments could not be attached: %{public}s)", (uint8_t *)v50, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E320870](v51, -1, -1);
          v55 = v50;
          v42 = v88;
          MEMORY[0x22E320870](v55, -1, -1);

        }
        else
        {

        }
        ++v40;
      }
      while (v39 != v40);
      swift_bridgeObjectRelease();
      v28 = v78;
      v26 = v84;
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v42, v84);
      v17 = v86;
      v32 = v87;
      v25 = v76;
      v24 = v77;
      v30 = v82;
      v29 = (uint64_t)v83;
    }
    else
    {
      v28 = v78;
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v88, v84);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17 = v86;
      v29 = (uint64_t)v83;
      v26 = v84;
    }
  }
  sub_22DE1E230();
  if (v25((char *)v31, 1, v26) == 1)
  {
    (*(void (**)(uint8_t *, uint64_t))(v79 + 8))(v24, v17);
    sub_22DD5071C(v31, &qword_255DB5D80);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v80, v31, v26);
    sub_22DE1E200();
    v77 = v24;
    v56 = sub_22DDEE6F4(v24, v29, 1);
    v58 = v57;
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v81);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v59 = swift_isUniquelyReferenced_nonNull_native();
    v91[0] = v32;
    sub_22DDFF6DC(v56, v58, 1, v59);
    v87 = v91[0];
    swift_bridgeObjectRelease();
    *(_QWORD *)&v85 = v58;
    v60 = *(_QWORD *)(v58 + 16);
    swift_bridgeObjectRelease();
    if (v60)
    {
      v62 = (id *)(v85 + 32);
      *(_QWORD *)&v61 = 136446210;
      v89 = v61;
      v88 = MEMORY[0x24BEE4AD8] + 8;
      do
      {
        v63 = *v62;
        v64 = *v62;
        if (qword_255DB53B8 != -1)
          swift_once();
        v65 = sub_22DE1E410();
        __swift_project_value_buffer(v65, (uint64_t)qword_255DC3D78);
        v66 = v63;
        v67 = v63;
        v68 = sub_22DE1E3F8();
        v69 = sub_22DE1F4FC();
        if (os_log_type_enabled(v68, v69))
        {
          v70 = swift_slowAlloc();
          v71 = swift_slowAlloc();
          v90 = v63;
          v91[0] = v71;
          *(_DWORD *)v70 = v89;
          v72 = v63;
          __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
          v73 = sub_22DE1F2EC();
          *(_QWORD *)(v70 + 4) = sub_22DDA2E30(v73, v74, v91);
          v17 = v86;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_22DD4B000, v68, v69, "generatedContent attachments could not be attached: %{public}s)", (uint8_t *)v70, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E320870](v71, -1, -1);
          MEMORY[0x22E320870](v70, -1, -1);

        }
        else
        {

        }
        ++v62;
        --v60;
      }
      while (v60);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v80, v84);
    (*(void (**)(uint8_t *, uint64_t))(v79 + 8))(v77, v17);
    return v87;
  }
  return v32;
}

uint64_t sub_22DDECF94(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_22DDFCD2C(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = sub_22DE1DFB4();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DDED0FC(uint64_t a1)
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
  v3 = sub_22DDFD074(isUniquelyReferenced_nonNull_native, v15, 1, v3);
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
  v10 = (unint64_t)&v3[v9 + 4];
  if (a1 + 32 < v10 + 8 * v8 && v10 < a1 + 32 + 8 * v8)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
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
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DDED268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t result;
  int v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_22DE1E1F4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE31060])
    goto LABEL_2;
  v8 = v6;
  result = 0xD000000000000010;
  if (v8 != *MEMORY[0x24BE31018])
  {
    if (v8 == *MEMORY[0x24BE31008])
    {
      return 0xD000000000000014;
    }
    else if (v8 == *MEMORY[0x24BE30FC0])
    {
      return 0x6353207472616D53;
    }
    else if (v8 == *MEMORY[0x24BE31020] || v8 == *MEMORY[0x24BE30FD0])
    {
      return 1769105747;
    }
    else if (v8 == *MEMORY[0x24BE30FE8])
    {
      return 0x20676E6974697257;
    }
    else if (v8 == *MEMORY[0x24BE30FD8])
    {
      return 0x6552207472616D53;
    }
    else if (v8 == *MEMORY[0x24BE31010])
    {
      return 0x696A6F6D6E6547;
    }
    else if (v8 == *MEMORY[0x24BE31028])
    {
      return 0x6D7553206C69614DLL;
    }
    else if (v8 == *MEMORY[0x24BE31000])
    {
      return 0xD000000000000019;
    }
    else if (v8 != *MEMORY[0x24BE31030])
    {
      if (v8 == *MEMORY[0x24BE31048])
      {
        return 0xD000000000000015;
      }
      else if (v8 == *MEMORY[0x24BE31038])
      {
        return 0xD000000000000016;
      }
      else if (v8 == *MEMORY[0x24BE31040])
      {
        return 0xD000000000000024;
      }
      else if (v8 == *MEMORY[0x24BE30FB0])
      {
        return 0xD000000000000017;
      }
      else if (v8 == *MEMORY[0x24BE30FC8])
      {
        return 0x7341207466697753;
      }
      else if (v8 == *MEMORY[0x24BE30FF8])
      {
        return 0x4320736F746F6850;
      }
      else
      {
        if (v8 != *MEMORY[0x24BE31058])
        {
LABEL_2:
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          return 0x6E776F6E6B6E75;
        }
        return 1953719636;
      }
    }
  }
  return result;
}

uint64_t sub_22DDED618()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v1 = sub_22DE1E14C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x24BE30EB0] || v5 == *MEMORY[0x24BE30E80] || v5 == *MEMORY[0x24BE30E98])
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v7 = sub_22DE1DED0();

  }
  else if (v5 == *MEMORY[0x24BE30EA8] || v5 == *MEMORY[0x24BE30E90] || v5 == *MEMORY[0x24BE30EA0])
  {
    return 0;
  }
  else
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v11 = sub_22DE1E410();
    __swift_project_value_buffer(v11, (uint64_t)qword_255DC3D78);
    v12 = sub_22DE1E3F8();
    v13 = sub_22DE1F514();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v18 = v15;
      *(_DWORD *)v14 = 136446210;
      v17 = sub_22DDA2E30(0xD000000000000017, 0x800000022DE2C2A0, &v18);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v12, v13, "%{public}s Unknown Action case", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v15, -1, -1);
      MEMORY[0x22E320870](v14, -1, -1);
    }

    v16 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v7 = sub_22DE1DED0();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v7;
}

uint64_t sub_22DDEDA38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v8;

  v1 = v0;
  v2 = sub_22DE1E1F4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE31060])
    goto LABEL_2;
  if (v6 == *MEMORY[0x24BE31018])
    return 0x316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31008])
    return 0x326E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FC0])
    return 0x336E69616D6F64;
  if (v6 == *MEMORY[0x24BE31020])
    return 0x386E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FD0])
    return 0x346E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FE8])
    return 0x396E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FD8])
    return 0x30316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31010])
    return 0x31316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31028])
    return 0x32316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31000])
    return 0x33316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31030])
    return 0x34316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31048])
    return 0x35316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31038])
    return 0x36316E69616D6F64;
  if (v6 == *MEMORY[0x24BE31040])
    return 0x37316E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FB0])
    return 0x366E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FC8])
    return 0x38316E69616D6F64;
  if (v6 == *MEMORY[0x24BE30FF8])
    return 0x39316E69616D6F64;
  if (v6 != *MEMORY[0x24BE31058])
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0x6E776F6E6B6E75;
  }
  return 0x586E69616D6F64;
}

uint64_t sub_22DDEDE0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_22DE1E14C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x24BE30EB0])
    return 28789;
  if (v5 == *MEMORY[0x24BE30E80])
    return 1853321060;
  if (v5 == *MEMORY[0x24BE30E98])
  {
    v7 = 0x7265636E6F63;
    return v7 & 0xFFFFFFFFFFFFLL | 0x6E000000000000;
  }
  if (v5 == *MEMORY[0x24BE30EA8])
    return 1885956979;
  if (v5 == *MEMORY[0x24BE30E90])
    return 0x64696C61766E69;
  if (v5 != *MEMORY[0x24BE30EA0])
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v8 = sub_22DE1E410();
    __swift_project_value_buffer(v8, (uint64_t)qword_255DC3D78);
    v9 = sub_22DE1E3F8();
    v10 = sub_22DE1F514();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v14 = v12;
      *(_DWORD *)v11 = 136446210;
      v13 = sub_22DDA2E30(0xD000000000000011, 0x800000022DE2C280, &v14);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v9, v10, "%{public}s Unknown Action case", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v12, -1, -1);
      MEMORY[0x22E320870](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v7 = 0x776F6E6B6E75;
    return v7 & 0xFFFFFFFFFFFFLL | 0x6E000000000000;
  }
  return 0x646574656C6564;
}

uint64_t sub_22DDEE0EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unsigned int v24;
  void (*v25)(uint64_t, uint64_t);
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  void *v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  char *v55;
  uint64_t v56;
  id v57[3];

  v54 = a1;
  v57[2] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = sub_22DE1DF0C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22DE1E050();
  v50 = *(_QWORD *)(v7 - 8);
  v51 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22DE1DFB4();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v16;
  sub_22DD506A0((uint64_t)v54, (uint64_t)v12, (uint64_t *)&unk_255DB7BC0);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v13);
  v52 = v17;
  v53 = v13;
  v55 = v15;
  if (v18 == 1)
  {
    sub_22DD5071C((uint64_t)v12, (uint64_t *)&unk_255DB7BC0);
    v19 = NSTemporaryDirectory();
    sub_22DE1F2B0();

    sub_22DE1DF24();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v15, v12, v13);
  }
  v54 = (id)objc_opt_self();
  v49 = *MEMORY[0x24BDCD790];
  v20 = 3;
  while (1)
  {
    v57[0] = (id)761423459;
    v57[1] = (id)0xE400000000000000;
    sub_22DE1E044();
    sub_22DE1E02C();
    v21 = a2;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v9, v51);
    sub_22DE1F328();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, v49, v3);
    sub_22DD50840();
    sub_22DE1DF9C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v54, sel_defaultManager);
    sub_22DE1DF90();
    v23 = (void *)sub_22DE1F28C();
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v22, sel_fileExistsAtPath_, v23);

    if (!v24)
      break;
    v25 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v25(v21, v53);
    --v20;
    a2 = v21;
    if (!v20)
    {
      sub_22DD9A370();
      swift_allocError();
      *v26 = 6;
      swift_willThrow();
      v27 = v53;
      v28 = v55;
      return ((uint64_t (*)(char *, uint64_t))v25)(v28, v27);
    }
  }
  v29 = objc_msgSend(v54, sel_defaultManager);
  v30 = (void *)sub_22DE1DF3C();
  v57[0] = 0;
  v31 = objc_msgSend(v29, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v30, 1, 0, v57);

  if ((v31 & 1) != 0)
  {
    v32 = v57[0];
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v55, v53);
  }
  v34 = v21;
  v35 = v57[0];
  v36 = (void *)sub_22DE1DEE8();

  swift_willThrow();
  if (qword_255DB53B8 != -1)
    swift_once();
  v37 = sub_22DE1E410();
  __swift_project_value_buffer(v37, (uint64_t)qword_255DC3D78);
  v38 = v36;
  v39 = v36;
  v40 = sub_22DE1E3F8();
  v41 = sub_22DE1F508();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = (void *)swift_slowAlloc();
    v56 = (uint64_t)v36;
    v57[0] = v43;
    *(_DWORD *)v42 = 136446210;
    v44 = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
    v45 = sub_22DE1F2EC();
    v56 = sub_22DDA2E30(v45, v46, (uint64_t *)v57);
    sub_22DE1F628();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22DD4B000, v40, v41, "Failed to create attachment directory: %{public}s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v43, -1, -1);
    MEMORY[0x22E320870](v42, -1, -1);
  }
  else
  {

  }
  v27 = v53;
  v28 = v55;
  sub_22DD9A370();
  swift_allocError();
  *v47 = 1;
  swift_willThrow();

  v25 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
  v25(v34, v27);
  return ((uint64_t (*)(char *, uint64_t))v25)(v28, v27);
}

unint64_t sub_22DDEE6F4(uint8_t *a1, uint64_t a2, char a3)
{
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  _QWORD *v68;
  _QWORD *v69;
  id v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  _QWORD *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  id v89;
  NSObject *v90;
  os_log_type_t v91;
  _QWORD *v92;
  uint64_t v93;
  _QWORD *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t *v104;
  char *v105;
  uint64_t *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  void *v113;
  id v114;
  uint64_t v115;
  id v116;
  id v117;
  NSObject *v118;
  os_log_type_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  char *v131;
  uint64_t *v132;
  void (*v133)(uint64_t *, _QWORD, uint64_t);
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  __int128 v138;
  void *v139;
  id v140;
  uint64_t v141;
  id v142;
  id v143;
  NSObject *v144;
  os_log_type_t v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  void *v160;
  id v161;
  uint64_t v162;
  id v163;
  id v164;
  NSObject *v165;
  os_log_type_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void (*v177)(uint64_t *, uint64_t);
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  __int128 v193;
  void *v194;
  id v195;
  uint64_t v196;
  id v197;
  id v198;
  NSObject *v199;
  os_log_type_t v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  unint64_t v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  _QWORD *v213;
  uint64_t *v214;
  __int128 v215;
  void *v216;
  id v217;
  uint64_t v218;
  id v219;
  id v220;
  NSObject *v221;
  os_log_type_t v222;
  uint64_t *v223;
  _QWORD *v224;
  uint64_t v225;
  uint64_t v226;
  id v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  unint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  uint64_t v240;
  uint64_t *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  __int128 v247;
  void *v248;
  id v249;
  uint64_t v250;
  id v251;
  id v252;
  NSObject *v253;
  os_log_type_t v254;
  uint64_t v255;
  uint64_t v256;
  id v257;
  uint64_t v258;
  unint64_t v259;
  uint64_t v260;
  char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  __int128 v266;
  void *v267;
  id v268;
  uint64_t v269;
  id v270;
  id v271;
  NSObject *v272;
  os_log_type_t v273;
  uint64_t v274;
  uint64_t v275;
  id v276;
  uint64_t v277;
  unint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void (*v284)(char *, uint64_t);
  uint64_t v285;
  uint64_t v286;
  char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  __int128 v292;
  void *v293;
  id v294;
  uint64_t v295;
  id v296;
  id v297;
  NSObject *v298;
  os_log_type_t v299;
  uint64_t v300;
  uint64_t v301;
  id v302;
  uint64_t v303;
  unint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  void (*v310)(char *, uint64_t);
  uint64_t v311;
  uint64_t v313;
  char *v314;
  uint64_t v315;
  unint64_t v316;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v318;
  unint64_t v319;
  uint64_t v320;
  uint64_t v321;
  unint64_t v322;
  void (*v323)(char *, uint64_t, uint64_t);
  __int128 v324;
  char *v325;
  uint64_t v326;
  uint64_t *v327;
  char *v328;
  char *v329;
  uint64_t *v330;
  uint64_t *v331;
  char *v332;
  char *v333;
  char *v334;
  uint64_t *v335;
  char *v336;
  uint64_t v337;
  unint64_t v338;
  uint64_t *v339;
  _QWORD *v340;
  uint64_t *v341;
  unsigned int v342;
  uint64_t v343;
  uint64_t v344;
  uint8_t *v345;
  __int128 v346;
  __int128 v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  _QWORD *v352;
  unint64_t v353;

  v344 = a2;
  *(_QWORD *)&v347 = sub_22DE1DFB4();
  *(_QWORD *)&v346 = *(_QWORD *)(v347 - 8);
  v5 = MEMORY[0x24BDAC7A8](v347);
  v7 = (char *)&v320 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v325 = (char *)&v320 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v326 = (uint64_t)&v320 - v10;
  v348 = sub_22DE1E248();
  v11 = *(_QWORD *)(v348 - 8);
  v12 = MEMORY[0x24BDAC7A8](v348);
  v328 = (char *)&v320 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v327 = (uint64_t *)((char *)&v320 - v15);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v332 = (char *)&v320 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v331 = (uint64_t *)((char *)&v320 - v19);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v336 = (char *)&v320 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v335 = (uint64_t *)((char *)&v320 - v23);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v340 = (uint64_t *)((char *)&v320 - v25);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v339 = (uint64_t *)((char *)&v320 - v27);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v341 = (uint64_t *)((char *)&v320 - v29);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v330 = (uint64_t *)((char *)&v320 - v31);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v320 - v32;
  v34 = sub_22DE1E20C();
  v337 = *(_QWORD *)(v34 - 8);
  v338 = v34;
  v35 = MEMORY[0x24BDAC7A8](v34);
  v329 = (char *)&v320 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v333 = (char *)&v320 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v334 = (char *)&v320 - v39;
  v40 = sub_22DE1E1F4();
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v43 = (char *)&v320 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v352 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v353 = MEMORY[0x24BEE4AF8];
  v44 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v345 = a1;
  sub_22DE1DF90();
  v45 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  LODWORD(a1) = objc_msgSend(v44, sel_fileExistsAtPath_, v45);

  if ((_DWORD)a1)
  {
    v342 = a3 & 1;
    v46 = *MEMORY[0x24BE31018];
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 104);
    v47(v43, v46, v40);
    v48 = MEMORY[0x22E31EA64](v344, v43);
    v49 = *(void (**)(char *, uint64_t))(v41 + 8);
    v49(v43, v40);
    v343 = v11;
    v50 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    if ((v48 & 1) != 0 && v342)
    {
      v51 = v348;
      v50(v33, v349, v348);
      v52 = v343;
      if ((*(unsigned int (**)(char *, uint64_t))(v343 + 88))(v33, v51) == *MEMORY[0x24BE31148])
      {
        v323 = v50;
        (*(void (**)(char *, uint64_t))(v52 + 96))(v33, v51);
        v54 = v337;
        v53 = v338;
        v55 = (uint64_t)v334;
        (*(void (**)(char *, char *, unint64_t))(v337 + 32))(v334, v33, v338);
        v56 = sub_22DE02A60(v55);
        if (v57 >> 60 == 15)
        {
          (*(void (**)(uint64_t, unint64_t))(v54 + 8))(v55, v53);
        }
        else
        {
          v74 = v330;
          *v330 = v56;
          v74[1] = v57;
          v75 = v57;
          v76 = v56;
          (*(void (**)(uint64_t *, _QWORD, uint64_t))(v343 + 104))(v74, *MEMORY[0x24BE311A0], v51);
          v47(v43, v46, v40);
          sub_22DD64850(v76, v75);
          sub_22DDEE6F4(v345, v43, 1);
          v78 = v77;
          v49(v43, v40);
          v79 = swift_bridgeObjectRetain();
          sub_22DDECF94(v79);
          v80 = swift_bridgeObjectRetain();
          sub_22DDED0FC(v80);
          v81 = *(_QWORD *)(v78 + 16);
          swift_bridgeObjectRelease();
          if (!v81)
          {
            swift_bridgeObjectRelease();
            sub_22DDDD8F4(v76, v75);
            (*(void (**)(uint64_t *, uint64_t))(v343 + 8))(v74, v51);
            (*(void (**)(char *, unint64_t))(v337 + 8))(v334, v338);
            return v353;
          }
          v321 = v76;
          v322 = v75;
          v83 = 0;
          v84 = &unk_255DB5000;
          *(_QWORD *)&v82 = 138412290;
          v324 = v82;
          do
          {
            v85 = *(void **)(v78 + 8 * v83 + 32);
            v86 = v85;
            if (v84[119] != -1)
              swift_once();
            v87 = sub_22DE1E410();
            __swift_project_value_buffer(v87, (uint64_t)qword_255DC3D78);
            v88 = v85;
            v89 = v85;
            v90 = sub_22DE1E3F8();
            v91 = sub_22DE1F4FC();
            if (os_log_type_enabled(v90, v91))
            {
              v92 = v84;
              v93 = swift_slowAlloc();
              v94 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v93 = v324;
              v95 = v85;
              v96 = _swift_stdlib_bridgeErrorToNSError();
              *(_QWORD *)(v93 + 4) = v96;
              *v94 = v96;

              _os_log_impl(&dword_22DD4B000, v90, v91, "GP sent structured generated data where the image reference was able to load, but the image could not be saved in our storage: %@", (uint8_t *)v93, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_255DB8160);
              swift_arrayDestroy();
              MEMORY[0x22E320870](v94, -1, -1);
              v97 = v93;
              v84 = v92;
              MEMORY[0x22E320870](v97, -1, -1);

            }
            else
            {

            }
            ++v83;
          }
          while (v81 != v83);
          sub_22DDDD8F4(v321, v322);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t *, uint64_t))(v343 + 8))(v330, v348);
          (*(void (**)(char *, unint64_t))(v337 + 8))(v334, v338);
        }
        v50 = v323;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v51);
      }
    }
    v98 = v341;
    v99 = v348;
    v50((char *)v341, v349, v348);
    v100 = v343;
    v101 = (*(uint64_t (**)(uint64_t *, uint64_t))(v343 + 88))(v98, v99);
    if (v101 == *MEMORY[0x24BE311B8])
    {
      (*(void (**)(uint64_t *, uint64_t))(v100 + 96))(v98, v99);
      v102 = *v98;
      v103 = v98[1];
      v104 = (uint64_t *)v98[2];
      v105 = (char *)v98[3];
      v106 = v339;
      *v339 = *v98;
      v106[1] = v103;
      v107 = *(char **)(v100 + 104);
      ((void (*)(uint64_t *, _QWORD, uint64_t))v107)(v106, *MEMORY[0x24BE311A0], v99);
      v341 = (uint64_t *)v102;
      v338 = v103;
      sub_22DD64850(v102, v103);
      v108 = v344;
      v337 = sub_22DDEE6F4(v345, v344, v342);
      v349 = v109;
      v110 = *(_QWORD *)(v109 + 16);
      if (v110)
      {
        v334 = v105;
        v335 = v104;
        v336 = v107;
        swift_bridgeObjectRetain();
        v111 = 0;
        *(_QWORD *)&v112 = 136380675;
        v347 = v112;
        *(_QWORD *)&v346 = MEMORY[0x24BEE4AD8] + 8;
        do
        {
          v113 = *(void **)(v349 + 8 * v111 + 32);
          v114 = v113;
          if (qword_255DB53B8 != -1)
            swift_once();
          v115 = sub_22DE1E410();
          __swift_project_value_buffer(v115, (uint64_t)qword_255DC3D78);
          v116 = v113;
          v117 = v113;
          v118 = sub_22DE1E3F8();
          v119 = sub_22DE1F4FC();
          if (os_log_type_enabled(v118, v119))
          {
            v120 = swift_slowAlloc();
            v121 = swift_slowAlloc();
            v350 = (uint64_t)v113;
            v351 = v121;
            *(_DWORD *)v120 = v347;
            v122 = v113;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v123 = sub_22DE1F2EC();
            *(_QWORD *)(v120 + 4) = sub_22DDA2E30(v123, v124, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v118, v119, "Failed to write image attachment.  %{private}s", (uint8_t *)v120, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22E320870](v121, -1, -1);
            MEMORY[0x22E320870](v120, -1, -1);

          }
          else
          {

          }
          ++v111;
        }
        while (v110 != v111);
        swift_bridgeObjectRelease();
        v108 = v344;
        v107 = v336;
        v104 = v335;
        v105 = v334;
      }
      v153 = v340;
      *v340 = v104;
      v153[1] = v105;
      ((void (*)(_QWORD *, _QWORD, uint64_t))v107)(v153, *MEMORY[0x24BE31180], v348);
      v154 = sub_22DDEE6F4(v345, v108, v342);
      v156 = v155;
      v157 = *(_QWORD *)(v155 + 16);
      if (v157)
      {
        v344 = v154;
        swift_bridgeObjectRetain();
        v158 = 0;
        *(_QWORD *)&v159 = 136380675;
        v346 = v159;
        v345 = (uint8_t *)(MEMORY[0x24BEE4AD8] + 8);
        *(_QWORD *)&v347 = v156;
        do
        {
          v160 = *(void **)(v156 + 8 * v158 + 32);
          v161 = v160;
          if (qword_255DB53B8 != -1)
            swift_once();
          v162 = sub_22DE1E410();
          __swift_project_value_buffer(v162, (uint64_t)qword_255DC3D78);
          v163 = v160;
          v164 = v160;
          v165 = sub_22DE1E3F8();
          v166 = sub_22DE1F4FC();
          if (os_log_type_enabled(v165, v166))
          {
            v167 = swift_slowAlloc();
            v168 = swift_slowAlloc();
            v350 = (uint64_t)v160;
            v351 = v168;
            *(_DWORD *)v167 = v346;
            v169 = v160;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v170 = sub_22DE1F2EC();
            *(_QWORD *)(v167 + 4) = sub_22DDA2E30(v170, v171, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v165, v166, "Failed to write text attachment.  %{private}s", (uint8_t *)v167, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22E320870](v168, -1, -1);
            v172 = v167;
            v156 = v347;
            MEMORY[0x22E320870](v172, -1, -1);

          }
          else
          {

          }
          ++v158;
        }
        while (v157 != v158);
        swift_bridgeObjectRelease();
      }
      v173 = swift_bridgeObjectRetain();
      sub_22DDECF94(v173);
      v174 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v174);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v175 = swift_bridgeObjectRetain();
      sub_22DDECF94(v175);
      v176 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v176);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DD64894((uint64_t)v341, v338);
      v177 = *(void (**)(uint64_t *, uint64_t))(v343 + 8);
      v178 = v348;
      v177(v340, v348);
      v179 = v339;
LABEL_77:
      v177(v179, v178);
      return v353;
    }
    v125 = v344;
    if (v101 == *MEMORY[0x24BE31138])
    {
      v126 = v343;
      v127 = v348;
      (*(void (**)(uint64_t *, uint64_t))(v343 + 96))(v98, v348);
      v128 = *v98;
      v129 = v98[1];
      v130 = v98[2];
      v131 = (char *)v98[3];
      v338 = v130;
      v132 = v335;
      *v335 = v128;
      v132[1] = v129;
      v133 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v126 + 104);
      v133(v132, *MEMORY[0x24BE311B0], v127);
      v340 = (_QWORD *)v129;
      v341 = (uint64_t *)v128;
      sub_22DD64850(v128, v129);
      v339 = (uint64_t *)sub_22DDEE6F4(v345, v125, v342);
      v349 = v134;
      v135 = *(_QWORD *)(v134 + 16);
      if (v135)
      {
        v334 = v131;
        v337 = (uint64_t)v133;
        swift_bridgeObjectRetain();
        v136 = 0;
        v137 = &unk_255DB5000;
        *(_QWORD *)&v138 = 136380675;
        v347 = v138;
        *(_QWORD *)&v346 = MEMORY[0x24BEE4AD8] + 8;
        do
        {
          v139 = *(void **)(v349 + 8 * v136 + 32);
          v140 = v139;
          if (v137[119] != -1)
            swift_once();
          v141 = sub_22DE1E410();
          __swift_project_value_buffer(v141, (uint64_t)qword_255DC3D78);
          v142 = v139;
          v143 = v139;
          v144 = sub_22DE1E3F8();
          v145 = sub_22DE1F4FC();
          if (os_log_type_enabled(v144, v145))
          {
            v146 = swift_slowAlloc();
            v147 = v137;
            v148 = swift_slowAlloc();
            v350 = (uint64_t)v139;
            v351 = v148;
            *(_DWORD *)v146 = v347;
            v149 = v139;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v150 = sub_22DE1F2EC();
            *(_QWORD *)(v146 + 4) = sub_22DDA2E30(v150, v151, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v144, v145, "Failed to write sketch attachment.  %{private}s", (uint8_t *)v146, 0xCu);
            swift_arrayDestroy();
            v152 = v148;
            v137 = v147;
            MEMORY[0x22E320870](v152, -1, -1);
            MEMORY[0x22E320870](v146, -1, -1);

          }
          else
          {

          }
          ++v136;
        }
        while (v135 != v136);
        swift_bridgeObjectRelease();
        v125 = v344;
        v133 = (void (*)(uint64_t *, _QWORD, uint64_t))v337;
        v131 = v334;
      }
      v207 = v336;
      *(_QWORD *)v336 = v338;
      *((_QWORD *)v207 + 1) = v131;
      v133((uint64_t *)v207, *MEMORY[0x24BE31180], v348);
      v208 = sub_22DDEE6F4(v345, v125, v342);
      v210 = v209;
      v211 = *(_QWORD *)(v209 + 16);
      if (v211)
      {
        v344 = v208;
        swift_bridgeObjectRetain();
        v212 = 0;
        v213 = &unk_255DB5000;
        v214 = qword_255DC3D78;
        *(_QWORD *)&v215 = 136380675;
        v346 = v215;
        v345 = (uint8_t *)(MEMORY[0x24BEE4AD8] + 8);
        *(_QWORD *)&v347 = v210;
        do
        {
          v216 = *(void **)(v210 + 8 * v212 + 32);
          v217 = v216;
          if (v213[119] != -1)
            swift_once();
          v218 = sub_22DE1E410();
          __swift_project_value_buffer(v218, (uint64_t)v214);
          v219 = v216;
          v220 = v216;
          v221 = sub_22DE1E3F8();
          v222 = sub_22DE1F4FC();
          if (os_log_type_enabled(v221, v222))
          {
            v223 = v214;
            v224 = v213;
            v225 = swift_slowAlloc();
            v226 = swift_slowAlloc();
            v350 = (uint64_t)v216;
            v351 = v226;
            *(_DWORD *)v225 = v346;
            v227 = v216;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v228 = sub_22DE1F2EC();
            *(_QWORD *)(v225 + 4) = sub_22DDA2E30(v228, v229, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v221, v222, "Failed to write text attachment.  %{private}s", (uint8_t *)v225, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22E320870](v226, -1, -1);
            v230 = v225;
            v213 = v224;
            v214 = v223;
            v210 = v347;
            MEMORY[0x22E320870](v230, -1, -1);

          }
          else
          {

          }
          ++v212;
        }
        while (v211 != v212);
        swift_bridgeObjectRelease();
      }
      v231 = swift_bridgeObjectRetain();
      sub_22DDECF94(v231);
      v232 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v232);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v233 = swift_bridgeObjectRetain();
      sub_22DDECF94(v233);
      v234 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v234);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DD64894((uint64_t)v341, (unint64_t)v340);
      v177 = *(void (**)(uint64_t *, uint64_t))(v343 + 8);
      v178 = v348;
      v177((uint64_t *)v336, v348);
      v179 = v335;
      goto LABEL_77;
    }
    v180 = v348;
    if (v101 == *MEMORY[0x24BE31168])
    {
      v181 = v343;
      (*(void (**)(uint64_t *, uint64_t))(v343 + 96))(v98, v348);
      v182 = *v98;
      v183 = v98[1];
      v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9630);
      v186 = v337;
      v185 = v338;
      (*(void (**)(char *, char *, unint64_t))(v337 + 32))(v333, (char *)v98 + *(int *)(v184 + 48), v338);
      v187 = v331;
      *v331 = v182;
      v187[1] = v183;
      v188 = *MEMORY[0x24BE311A0];
      v336 = *(char **)(v181 + 104);
      ((void (*)(uint64_t *, uint64_t, uint64_t))v336)(v187, v188, v180);
      v340 = (_QWORD *)v183;
      v341 = (uint64_t *)v182;
      sub_22DD64850(v182, v183);
      v339 = (uint64_t *)sub_22DDEE6F4(v345, v125, v342);
      v190 = *(_QWORD *)(v189 + 16);
      v349 = v189;
      if (v190)
      {
        v191 = v189;
        swift_bridgeObjectRetain();
        v192 = 0;
        *(_QWORD *)&v193 = 136380675;
        v347 = v193;
        *(_QWORD *)&v346 = MEMORY[0x24BEE4AD8] + 8;
        do
        {
          v194 = *(void **)(v191 + 8 * v192 + 32);
          v195 = v194;
          if (qword_255DB53B8 != -1)
            swift_once();
          v196 = sub_22DE1E410();
          __swift_project_value_buffer(v196, (uint64_t)qword_255DC3D78);
          v197 = v194;
          v198 = v194;
          v199 = sub_22DE1E3F8();
          v200 = sub_22DE1F4FC();
          if (os_log_type_enabled(v199, v200))
          {
            v201 = swift_slowAlloc();
            v202 = swift_slowAlloc();
            v350 = (uint64_t)v194;
            v351 = v202;
            *(_DWORD *)v201 = v347;
            v203 = v194;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v204 = sub_22DE1F2EC();
            *(_QWORD *)(v201 + 4) = sub_22DDA2E30(v204, v205, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v199, v200, "Failed to write image attachment.  %{private}s", (uint8_t *)v201, 0xCu);
            swift_arrayDestroy();
            v206 = v202;
            v191 = v349;
            MEMORY[0x22E320870](v206, -1, -1);
            MEMORY[0x22E320870](v201, -1, -1);

          }
          else
          {

          }
          ++v192;
        }
        while (v190 != v192);
        swift_bridgeObjectRelease();
        v125 = v344;
        v186 = v337;
        v185 = v338;
      }
      v261 = v332;
      (*(void (**)(char *, char *, unint64_t))(v186 + 16))(v332, v333, v185);
      ((void (*)(char *, _QWORD, uint64_t))v336)(v261, *MEMORY[0x24BE31148], v348);
      v344 = sub_22DDEE6F4(v345, v125, v342);
      v263 = v262;
      v264 = *(_QWORD *)(v262 + 16);
      if (v264)
      {
        swift_bridgeObjectRetain();
        v265 = 0;
        *(_QWORD *)&v266 = 136380675;
        v346 = v266;
        v345 = (uint8_t *)(MEMORY[0x24BEE4AD8] + 8);
        *(_QWORD *)&v347 = v263;
        do
        {
          v267 = *(void **)(v263 + 8 * v265 + 32);
          v268 = v267;
          if (qword_255DB53B8 != -1)
            swift_once();
          v269 = sub_22DE1E410();
          __swift_project_value_buffer(v269, (uint64_t)qword_255DC3D78);
          v270 = v267;
          v271 = v267;
          v272 = sub_22DE1E3F8();
          v273 = sub_22DE1F4FC();
          if (os_log_type_enabled(v272, v273))
          {
            v274 = swift_slowAlloc();
            v275 = swift_slowAlloc();
            v350 = (uint64_t)v267;
            v351 = v275;
            *(_DWORD *)v274 = v346;
            v276 = v267;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v277 = sub_22DE1F2EC();
            *(_QWORD *)(v274 + 4) = sub_22DDA2E30(v277, v278, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v272, v273, "Failed to write structured attachment.  %{private}s", (uint8_t *)v274, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22E320870](v275, -1, -1);
            v279 = v274;
            v263 = v347;
            MEMORY[0x22E320870](v279, -1, -1);

          }
          else
          {

          }
          ++v265;
        }
        while (v264 != v265);
        swift_bridgeObjectRelease();
        v186 = v337;
        v185 = v338;
      }
      v280 = swift_bridgeObjectRetain();
      sub_22DDECF94(v280);
      v281 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v281);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v282 = swift_bridgeObjectRetain();
      sub_22DDECF94(v282);
      v283 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v283);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DD64894((uint64_t)v341, (unint64_t)v340);
      v284 = *(void (**)(char *, uint64_t))(v343 + 8);
      v285 = v348;
      v284(v332, v348);
      v284((char *)v331, v285);
      (*(void (**)(char *, unint64_t))(v186 + 8))(v333, v185);
      return v353;
    }
    v236 = v337;
    v235 = v338;
    if (v101 == *MEMORY[0x24BE31170])
    {
      v237 = v343;
      (*(void (**)(uint64_t *, uint64_t))(v343 + 96))(v98, v348);
      v238 = *v98;
      v239 = v98[1];
      v240 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9628);
      (*(void (**)(char *, char *, unint64_t))(v236 + 32))(v329, (char *)v98 + *(int *)(v240 + 48), v235);
      v241 = v327;
      *v327 = v238;
      v241[1] = v239;
      v242 = *MEMORY[0x24BE311B0];
      v336 = *(char **)(v237 + 104);
      ((void (*)(uint64_t *, uint64_t, uint64_t))v336)(v241, v242, v180);
      v340 = (_QWORD *)v239;
      v341 = (uint64_t *)v238;
      sub_22DD64850(v238, v239);
      v339 = (uint64_t *)sub_22DDEE6F4(v345, v125, v342);
      v244 = *(_QWORD *)(v243 + 16);
      v349 = v243;
      if (v244)
      {
        v245 = v243;
        swift_bridgeObjectRetain();
        v246 = 0;
        *(_QWORD *)&v247 = 136380675;
        v347 = v247;
        *(_QWORD *)&v346 = MEMORY[0x24BEE4AD8] + 8;
        do
        {
          v248 = *(void **)(v245 + 8 * v246 + 32);
          v249 = v248;
          if (qword_255DB53B8 != -1)
            swift_once();
          v250 = sub_22DE1E410();
          __swift_project_value_buffer(v250, (uint64_t)qword_255DC3D78);
          v251 = v248;
          v252 = v248;
          v253 = sub_22DE1E3F8();
          v254 = sub_22DE1F4FC();
          if (os_log_type_enabled(v253, v254))
          {
            v255 = swift_slowAlloc();
            v256 = swift_slowAlloc();
            v350 = (uint64_t)v248;
            v351 = v256;
            *(_DWORD *)v255 = v347;
            v257 = v248;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v258 = sub_22DE1F2EC();
            *(_QWORD *)(v255 + 4) = sub_22DDA2E30(v258, v259, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v253, v254, "Failed to write sketch attachment.  %{private}s", (uint8_t *)v255, 0xCu);
            swift_arrayDestroy();
            v260 = v256;
            v245 = v349;
            MEMORY[0x22E320870](v260, -1, -1);
            MEMORY[0x22E320870](v255, -1, -1);

          }
          else
          {

          }
          ++v246;
        }
        while (v244 != v246);
        swift_bridgeObjectRelease();
        v125 = v344;
        v236 = v337;
        v235 = v338;
      }
      v287 = v328;
      (*(void (**)(char *, char *, unint64_t))(v236 + 16))(v328, v329, v235);
      ((void (*)(char *, _QWORD, uint64_t))v336)(v287, *MEMORY[0x24BE31148], v348);
      v344 = sub_22DDEE6F4(v345, v125, v342);
      v289 = v288;
      v290 = *(_QWORD *)(v288 + 16);
      if (v290)
      {
        swift_bridgeObjectRetain();
        v291 = 0;
        *(_QWORD *)&v292 = 136380675;
        v346 = v292;
        v345 = (uint8_t *)(MEMORY[0x24BEE4AD8] + 8);
        *(_QWORD *)&v347 = v289;
        do
        {
          v293 = *(void **)(v289 + 8 * v291 + 32);
          v294 = v293;
          if (qword_255DB53B8 != -1)
            swift_once();
          v295 = sub_22DE1E410();
          __swift_project_value_buffer(v295, (uint64_t)qword_255DC3D78);
          v296 = v293;
          v297 = v293;
          v298 = sub_22DE1E3F8();
          v299 = sub_22DE1F4FC();
          if (os_log_type_enabled(v298, v299))
          {
            v300 = swift_slowAlloc();
            v301 = swift_slowAlloc();
            v350 = (uint64_t)v293;
            v351 = v301;
            *(_DWORD *)v300 = v346;
            v302 = v293;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
            v303 = sub_22DE1F2EC();
            *(_QWORD *)(v300 + 4) = sub_22DDA2E30(v303, v304, &v351);
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_22DD4B000, v298, v299, "Failed to write structured attachment.  %{private}s", (uint8_t *)v300, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22E320870](v301, -1, -1);
            v305 = v300;
            v289 = v347;
            MEMORY[0x22E320870](v305, -1, -1);

          }
          else
          {

          }
          ++v291;
        }
        while (v290 != v291);
        swift_bridgeObjectRelease();
        v236 = v337;
        v235 = v338;
      }
      v306 = swift_bridgeObjectRetain();
      sub_22DDECF94(v306);
      v307 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v307);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v308 = swift_bridgeObjectRetain();
      sub_22DDECF94(v308);
      v309 = swift_bridgeObjectRetain();
      sub_22DDED0FC(v309);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DD64894((uint64_t)v341, (unint64_t)v340);
      v310 = *(void (**)(char *, uint64_t))(v343 + 8);
      v311 = v348;
      v310(v328, v348);
      v310((char *)v327, v311);
      (*(void (**)(char *, unint64_t))(v236 + 8))(v329, v235);
      return v353;
    }
    v286 = v326;
    sub_22DDF07B8(v345, v344, v342, v326);
    sub_22DDF2274(v286);
    v313 = v346;
    v314 = v325;
    v315 = v347;
    (*(void (**)(char *, uint64_t, _QWORD))(v346 + 16))(v325, v286, v347);
    v316 = v353;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v316 = sub_22DDFCD2C(0, *(_QWORD *)(v316 + 16) + 1, 1, v316);
    v319 = *(_QWORD *)(v316 + 16);
    v318 = *(_QWORD *)(v316 + 24);
    if (v319 >= v318 >> 1)
      v316 = sub_22DDFCD2C(v318 > 1, v319 + 1, 1, v316);
    *(_QWORD *)(v316 + 16) = v319 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v313 + 32))(v316+ ((*(unsigned __int8 *)(v313 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v313 + 80))+ *(_QWORD *)(v313 + 72) * v319, v314, v315);
    v353 = v316;
    (*(void (**)(uint64_t, uint64_t))(v313 + 8))(v286, v315);
    v73 = v353;
    (*(void (**)(uint64_t *, uint64_t))(v343 + 8))(v98, v348);
  }
  else
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v58 = sub_22DE1E410();
    __swift_project_value_buffer(v58, (uint64_t)qword_255DC3D78);
    v59 = v346;
    v60 = v347;
    (*(void (**)(char *, uint8_t *, _QWORD))(v346 + 16))(v7, v345, v347);
    v61 = sub_22DE1E3F8();
    v62 = sub_22DE1F4FC();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = swift_slowAlloc();
      v351 = v64;
      *(_DWORD *)v63 = 136380675;
      v65 = sub_22DE1DF90();
      v350 = sub_22DDA2E30(v65, v66, &v351);
      sub_22DE1F628();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v60);
      _os_log_impl(&dword_22DD4B000, v61, v62, "Attachments directory does not exist: %{private}s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v64, -1, -1);
      MEMORY[0x22E320870](v63, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v60);
    }

    sub_22DD9A370();
    v67 = (void *)swift_allocError();
    *v68 = 1;
    v69 = v352;
    v70 = v67;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v69 = sub_22DDFD074(0, v69[2] + 1, 1, v69);
    v72 = v69[2];
    v71 = v69[3];
    if (v72 >= v71 >> 1)
      v69 = sub_22DDFD074((_QWORD *)(v71 > 1), v72 + 1, 1, v69);
    v69[2] = v72 + 1;
    v69[v72 + 4] = v67;

    return v353;
  }
  return v73;
}

void sub_22DDF07A8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F98E8B8;
}

uint64_t sub_22DDF07B8@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33[4];

  v30 = a3;
  v31 = a2;
  v29 = a4;
  v6 = sub_22DE1DFB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22DE1DF0C();
  v27 = *(_QWORD *)(v10 - 8);
  v28 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v32 = a1;
  sub_22DE1DF90();
  v14 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  LODWORD(a1) = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if ((_DWORD)a1)
  {
    result = sub_22DDF0B58();
    if (!v4)
    {
      v33[0] = sub_22DDF11F8(v31, v30 & 1);
      v33[1] = v24;
      sub_22DE1F328();
      sub_22DE1F328();
      swift_bridgeObjectRelease();
      v26 = v27;
      v25 = v28;
      (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v12, *MEMORY[0x24BDCD7A0], v28);
      sub_22DD50840();
      sub_22DE1DFA8();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v25);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v16 = sub_22DE1E410();
    __swift_project_value_buffer(v16, (uint64_t)qword_255DC3D78);
    (*(void (**)(char *, uint8_t *, uint64_t))(v7 + 16))(v9, v32, v6);
    v17 = sub_22DE1E3F8();
    v18 = sub_22DE1F4FC();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      *(_DWORD *)v19 = 136380675;
      v32 = v19 + 4;
      v33[0] = v20;
      v21 = sub_22DE1DF90();
      v33[3] = sub_22DDA2E30(v21, v22, v33);
      sub_22DE1F628();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      _os_log_impl(&dword_22DD4B000, v17, v18, "Attachments directory does not exist: %{private}s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v20, -1, -1);
      MEMORY[0x22E320870](v19, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }

    sub_22DD9A370();
    swift_allocError();
    *v23 = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_22DDF0B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_22DE1E248();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x24BE31180])
    goto LABEL_2;
  if (v5 == *MEMORY[0x24BE311A0])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    sub_22DD64894(*(_QWORD *)v4, *((_QWORD *)v4 + 1));
    return 6778480;
  }
  if (v5 == *MEMORY[0x24BE31190] || v5 == *MEMORY[0x24BE31150] || v5 == *MEMORY[0x24BE311B0])
  {
LABEL_8:
    v6 = 1635017060;
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    sub_22DD64894(*(_QWORD *)v4, *((_QWORD *)v4 + 1));
    return v6;
  }
  if (v5 == *MEMORY[0x24BE311B8] || v5 == *MEMORY[0x24BE31138])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    sub_22DD64894(*(_QWORD *)v4, *((_QWORD *)v4 + 1));
    swift_bridgeObjectRelease();
LABEL_13:
    if (qword_255DB53B8 != -1)
      swift_once();
    v8 = sub_22DE1E410();
    v6 = __swift_project_value_buffer(v8, (uint64_t)qword_255DC3D78);
    v9 = sub_22DE1E3F8();
    v10 = sub_22DE1F4FC();
    if (os_log_type_enabled(v9, v10))
    {
      v6 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v25 = v11;
      *(_DWORD *)v6 = 136446210;
      v24 = sub_22DDA2E30(0x65747845656C6966, 0xEF29286E6F69736ELL, &v25);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v9, v10, "%{public}s cannot be used with complex types", (uint8_t *)v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v11, -1, -1);
      MEMORY[0x22E320870](v6, -1, -1);
    }

    v12 = sub_22DE1E224();
    sub_22DD504A8(&qword_255DB9638, (uint64_t (*)(uint64_t))MEMORY[0x24BE31118], MEMORY[0x24BE31120]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v13, *MEMORY[0x24BE31110], v12);
    swift_willThrow();
    return v6;
  }
  if (v5 == *MEMORY[0x24BE311A8])
    goto LABEL_8;
  if (v5 == *MEMORY[0x24BE31140])
    goto LABEL_2;
  if (v5 == *MEMORY[0x24BE31148])
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 1852797802;
  }
  if (v5 == *MEMORY[0x24BE31168])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    sub_22DD64894(*(_QWORD *)v4, *((_QWORD *)v4 + 1));
    v14 = (uint64_t *)&unk_255DB9630;
LABEL_26:
    v15 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(v14) + 48)];
    v16 = sub_22DE1E20C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    goto LABEL_13;
  }
  if (v5 == *MEMORY[0x24BE31170])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    sub_22DD64894(*(_QWORD *)v4, *((_QWORD *)v4 + 1));
    v14 = (uint64_t *)&unk_255DB9628;
    goto LABEL_26;
  }
  if (v5 == *MEMORY[0x24BE31160] || v5 == *MEMORY[0x24BE31158])
  {
LABEL_2:
    v6 = 7633012;
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    swift_bridgeObjectRelease();
    return v6;
  }
  if (v5 == *MEMORY[0x24BE31198])
    goto LABEL_8;
  if (v5 == *MEMORY[0x24BE31178])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    swift_bridgeObjectRelease();
    return 1819112552;
  }
  else
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v17 = sub_22DE1E410();
    __swift_project_value_buffer(v17, (uint64_t)qword_255DC3D78);
    v18 = sub_22DE1E3F8();
    v19 = sub_22DE1F4FC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v25 = v21;
      *(_DWORD *)v20 = 136446210;
      v24 = sub_22DDA2E30(0x65747845656C6966, 0xEF29286E6F69736ELL, &v25);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v18, v19, "%{public}s unknown Content type", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v21, -1, -1);
      MEMORY[0x22E320870](v20, -1, -1);
    }

    v6 = sub_22DE1E224();
    sub_22DD504A8(&qword_255DB9638, (uint64_t (*)(uint64_t))MEMORY[0x24BE31118], MEMORY[0x24BE31120]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v22, *MEMORY[0x24BE31110], v6);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v6;
}

uint64_t sub_22DDF11F8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  id v14;
  BOOL v16;
  _QWORD v17[2];

  v6 = sub_22DE1E1F4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x24BE31060])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    swift_bridgeObjectRelease();
    goto LABEL_3;
  }
  if (v10 == *MEMORY[0x24BE31018] || v10 == *MEMORY[0x24BE31008])
  {
LABEL_18:
    v14 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v2 = sub_22DE1DED0();

    return v2;
  }
  if (v10 != *MEMORY[0x24BE30FC0])
  {
    v13 = v10 == *MEMORY[0x24BE31020] || v10 == *MEMORY[0x24BE30FD0];
    if (!v13 && v10 != *MEMORY[0x24BE30FE8] && v10 != *MEMORY[0x24BE30FD8] && v10 != *MEMORY[0x24BE31010])
    {
      v16 = v10 == *MEMORY[0x24BE31028] || v10 == *MEMORY[0x24BE31000];
      if (!v16
        && v10 != *MEMORY[0x24BE31030]
        && v10 != *MEMORY[0x24BE31048]
        && v10 != *MEMORY[0x24BE31038]
        && v10 != *MEMORY[0x24BE31040]
        && v10 != *MEMORY[0x24BE30FB0])
      {
        if (v10 != *MEMORY[0x24BE30FC8] && v10 != *MEMORY[0x24BE30FF8] && v10 != *MEMORY[0x24BE31058])
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        goto LABEL_3;
      }
    }
    goto LABEL_18;
  }
LABEL_3:
  sub_22DDF19C4(v2, a1);
  if (!v3)
  {
    v11 = 0x65746172656E6567;
    if ((a2 & 1) != 0)
    {
      v12 = 0xEA00000000002D64;
    }
    else
    {
      v11 = 0x2D7475706E69;
      v12 = 0xE600000000000000;
    }
    v17[0] = v11;
    v17[1] = v12;
    swift_bridgeObjectRetain();
    sub_22DE1F328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v17[0];
  }
  return v2;
}

uint64_t sub_22DDF19C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = sub_22DE1E1F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22DE1E248();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v11, v8);
  if (v12 == *MEMORY[0x24BE31180])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    return 1954047348;
  }
  if (v12 == *MEMORY[0x24BE311A0])
  {
    v13 = 0x6567616D69;
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v7, v4) != *MEMORY[0x24BE31018])
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v13;
  }
  if (v12 == *MEMORY[0x24BE31190])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    return 0x6F69647561;
  }
  if (v12 == *MEMORY[0x24BE31150])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    return 0x74697277646E6168;
  }
  if (v12 == *MEMORY[0x24BE311B0])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    return 0x686374656B73;
  }
  if (v12 == *MEMORY[0x24BE311B8] || v12 == *MEMORY[0x24BE31138])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    swift_bridgeObjectRelease();
LABEL_16:
    if (qword_255DB53B8 != -1)
      swift_once();
    v14 = sub_22DE1E410();
    __swift_project_value_buffer(v14, (uint64_t)qword_255DC3D78);
    v15 = sub_22DE1E3F8();
    v16 = sub_22DE1F4FC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v32 = v18;
      *(_DWORD *)v17 = 136446210;
      v31 = sub_22DDA2E30(0x4E636972656E6567, 0xEB00000000656D61, &v32);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v15, v16, "%{public}s cannot be used with complex types", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v18, -1, -1);
      MEMORY[0x22E320870](v17, -1, -1);
    }

    v13 = sub_22DE1E224();
    sub_22DD504A8(&qword_255DB9638, (uint64_t (*)(uint64_t))MEMORY[0x24BE31118], MEMORY[0x24BE31120]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v19, *MEMORY[0x24BE31110], v13);
    swift_willThrow();
    return v13;
  }
  if (v12 == *MEMORY[0x24BE311A8])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    return 0x6F65646976;
  }
  if (v12 == *MEMORY[0x24BE31140])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    return 0x6F43656372756F73;
  }
  if (v12 == *MEMORY[0x24BE31148])
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return 0x7275746375727473;
  }
  if (v12 == *MEMORY[0x24BE31168])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    v21 = (uint64_t *)&unk_255DB9630;
LABEL_32:
    v22 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(v21) + 48)];
    v23 = sub_22DE1E20C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
    goto LABEL_16;
  }
  if (v12 == *MEMORY[0x24BE31170])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    v21 = (uint64_t *)&unk_255DB9628;
    goto LABEL_32;
  }
  if (v12 == *MEMORY[0x24BE31160])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    return 0x6163696669746F6ELL;
  }
  else if (v12 == *MEMORY[0x24BE31158])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    return 0x7373654D6C69616DLL;
  }
  else if (v12 == *MEMORY[0x24BE31198])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    sub_22DD64894(*(_QWORD *)v11, *((_QWORD *)v11 + 1));
    return 0x696A6F6D65;
  }
  else if (v12 == *MEMORY[0x24BE31178])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    return 0x746E65746E6F63;
  }
  else
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v24 = sub_22DE1E410();
    __swift_project_value_buffer(v24, (uint64_t)qword_255DC3D78);
    v25 = sub_22DE1E3F8();
    v26 = sub_22DE1F4FC();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v32 = v28;
      *(_DWORD *)v27 = 136446210;
      v31 = sub_22DDA2E30(0x4E636972656E6567, 0xEB00000000656D61, &v32);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v25, v26, "%{public}s unknown Content type", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v28, -1, -1);
      MEMORY[0x22E320870](v27, -1, -1);
    }

    v13 = sub_22DE1E224();
    sub_22DD504A8(&qword_255DB9638, (uint64_t (*)(uint64_t))MEMORY[0x24BE31118], MEMORY[0x24BE31120]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v29, *MEMORY[0x24BE31110], v13);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v13;
}

uint64_t sub_22DDF2274(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *);
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  char *v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t result;
  void (*v58)(char *, uint64_t);
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t, uint64_t);
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  uint64_t v102;
  uint64_t v103;

  v88 = sub_22DE1E20C();
  v2 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v4 = (char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22DE1F2E0();
  v91 = *(_QWORD *)(v5 - 8);
  v92 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v90 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22DE1E248();
  v97 = *(_QWORD *)(v7 - 8);
  v98 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v96 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22DE1DFB4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v95 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v82 - v13;
  v15 = sub_22DE1E410();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255DB53B8 != -1)
    swift_once();
  v87 = v4;
  v89 = v2;
  v19 = __swift_project_value_buffer(v15, (uint64_t)qword_255DC3D78);
  v20 = *(void (**)(char *))(v16 + 16);
  v99 = v19;
  v20(v18);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v100 = a1;
  v93 = v21;
  v21(v14, a1, v9);
  v22 = sub_22DE1E3F8();
  v23 = sub_22DE1F4F0();
  v24 = v23;
  v25 = v9;
  if (os_log_type_enabled(v22, v23))
  {
    v26 = swift_slowAlloc();
    v83 = v10;
    v84 = v24;
    v27 = v26;
    v85 = swift_slowAlloc();
    v103 = v85;
    *(_DWORD *)v27 = 136315394;
    v86 = v16;
    v102 = sub_22DDA2E30(0x7275286574697277, 0xEB00000000293A6CLL, &v103);
    sub_22DE1F628();
    *(_WORD *)(v27 + 12) = 2080;
    v28 = sub_22DE1DF90();
    v102 = sub_22DDA2E30(v28, v29, &v103);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    v30 = *(void (**)(char *, uint64_t))(v83 + 8);
    v31 = v25;
    v30(v14, v25);
    _os_log_impl(&dword_22DD4B000, v22, (os_log_type_t)v84, "%s %s", (uint8_t *)v27, 0x16u);
    v32 = v85;
    swift_arrayDestroy();
    MEMORY[0x22E320870](v32, -1, -1);
    MEMORY[0x22E320870](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v86 + 8))(v18, v15);
  }
  else
  {
    v30 = *(void (**)(char *, uint64_t))(v10 + 8);
    v31 = v25;
    v30(v14, v25);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  v33 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v34 = v100;
  sub_22DE1DF90();
  v35 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v36 = objc_msgSend(v33, sel_fileExistsAtPath_, v35);

  if ((v36 & 1) != 0)
  {
    v37 = v95;
    v93(v95, v34, v31);
    v38 = sub_22DE1E3F8();
    v39 = sub_22DE1F4FC();
    if (!os_log_type_enabled(v38, v39))
    {
      v30(v37, v31);
      goto LABEL_15;
    }
    v40 = swift_slowAlloc();
    v101 = v30;
    v41 = v37;
    v42 = (uint8_t *)v40;
    v43 = swift_slowAlloc();
    v103 = v43;
    *(_DWORD *)v42 = 136380675;
    v44 = sub_22DE1DF90();
    v102 = sub_22DDA2E30(v44, v45, &v103);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    v101(v41, v31);
    _os_log_impl(&dword_22DD4B000, v38, v39, "Attachment URL already exists: %{private}s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v43, -1, -1);
    goto LABEL_13;
  }
  v47 = v96;
  v46 = v97;
  v48 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v96, v94, v98);
  v49 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v47, v48);
  if (v49 == *MEMORY[0x24BE31180])
    goto LABEL_10;
  if (v49 == *MEMORY[0x24BE311A0]
    || v49 == *MEMORY[0x24BE31190]
    || v49 == *MEMORY[0x24BE31150]
    || v49 == *MEMORY[0x24BE311B0])
  {
    goto LABEL_20;
  }
  if (v49 == *MEMORY[0x24BE311B8] || v49 == *MEMORY[0x24BE31138])
  {
    (*(void (**)(char *, uint64_t))(v46 + 96))(v47, v48);
    sub_22DD64894(*(_QWORD *)v47, *((_QWORD *)v47 + 1));
    swift_bridgeObjectRelease();
LABEL_25:
    v59 = sub_22DE1E3F8();
    v60 = sub_22DE1F4FC();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      v103 = v62;
      *(_DWORD *)v61 = 136446210;
      v102 = sub_22DDA2E30(0x7275286574697277, 0xEB00000000293A6CLL, &v103);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v59, v60, "%{public}s cannot be used with complex types", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v62, -1, -1);
      MEMORY[0x22E320870](v61, -1, -1);
    }

    v63 = sub_22DE1E224();
    sub_22DD504A8(&qword_255DB9638, (uint64_t (*)(uint64_t))MEMORY[0x24BE31118], MEMORY[0x24BE31120]);
    v64 = swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v63 - 8) + 104))(v65, *MEMORY[0x24BE31110], v63);
    v101 = (void (*)(char *, uint64_t))v64;
    return swift_willThrow();
  }
  if (v49 == *MEMORY[0x24BE311A8])
    goto LABEL_20;
  if (v49 == *MEMORY[0x24BE31140])
    goto LABEL_10;
  if (v49 != *MEMORY[0x24BE31148])
  {
    v72 = v89;
    if (v49 == *MEMORY[0x24BE31168])
    {
      (*(void (**)(char *, uint64_t))(v46 + 96))(v47, v48);
      sub_22DD64894(*(_QWORD *)v47, *((_QWORD *)v47 + 1));
      v73 = (uint64_t *)&unk_255DB9630;
LABEL_37:
      v74 = __swift_instantiateConcreteTypeFromMangledName(v73);
      (*(void (**)(char *, uint64_t))(v72 + 8))(&v47[*(int *)(v74 + 48)], v88);
      goto LABEL_25;
    }
    if (v49 == *MEMORY[0x24BE31170])
    {
      (*(void (**)(char *, uint64_t))(v46 + 96))(v47, v48);
      sub_22DD64894(*(_QWORD *)v47, *((_QWORD *)v47 + 1));
      v73 = (uint64_t *)&unk_255DB9628;
      goto LABEL_37;
    }
    if (v49 == *MEMORY[0x24BE31160] || v49 == *MEMORY[0x24BE31158])
    {
LABEL_10:
      (*(void (**)(char *, uint64_t))(v46 + 96))(v47, v48);
      v50 = v90;
      sub_22DE1F2D4();
      v51 = sub_22DE1F2BC();
      v53 = v52;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v91 + 8))(v50, v92);
      if (v53 >> 60 == 15)
      {
        v38 = sub_22DE1E3F8();
        v54 = sub_22DE1F4FC();
        if (!os_log_type_enabled(v38, v54))
        {
LABEL_15:

          sub_22DD9A370();
          v55 = swift_allocError();
          *v56 = 5;
          v101 = (void (*)(char *, uint64_t))v55;
          return swift_willThrow();
        }
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_22DD4B000, v38, v54, "Cannot convert .text to data using UTF8", v42, 2u);
LABEL_13:
        MEMORY[0x22E320870](v42, -1, -1);
        goto LABEL_15;
      }
      goto LABEL_21;
    }
    if (v49 != *MEMORY[0x24BE31198])
    {
      if (v49 != *MEMORY[0x24BE31178])
      {
        v75 = sub_22DE1E3F8();
        v76 = sub_22DE1F4FC();
        if (os_log_type_enabled(v75, v76))
        {
          v77 = (uint8_t *)swift_slowAlloc();
          v78 = swift_slowAlloc();
          v103 = v78;
          *(_DWORD *)v77 = 136446210;
          v102 = sub_22DDA2E30(0x7275286574697277, 0xEB00000000293A6CLL, &v103);
          sub_22DE1F628();
          _os_log_impl(&dword_22DD4B000, v75, v76, "%{public}s unknown Content type", v77, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E320870](v78, -1, -1);
          MEMORY[0x22E320870](v77, -1, -1);
        }

        v79 = sub_22DE1E224();
        sub_22DD504A8(&qword_255DB9638, (uint64_t (*)(uint64_t))MEMORY[0x24BE31118], MEMORY[0x24BE31120]);
        v80 = swift_allocError();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v79 - 8) + 104))(v81, *MEMORY[0x24BE31110], v79);
        v101 = (void (*)(char *, uint64_t))v80;
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v47, v98);
      }
      goto LABEL_10;
    }
LABEL_20:
    (*(void (**)(char *, uint64_t))(v46 + 96))(v47, v48);
    v51 = *(_QWORD *)v47;
    v53 = *((_QWORD *)v47 + 1);
LABEL_21:
    v58 = v101;
    sub_22DE1DFD8();
    result = sub_22DD64894(v51, v53);
    v101 = v58;
    return result;
  }
  (*(void (**)(char *, uint64_t))(v46 + 96))(v47, v48);
  v66 = v88;
  v67 = v89;
  v68 = v87;
  (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v87, v47, v88);
  sub_22DE1DDD4();
  swift_allocObject();
  sub_22DE1DDC8();
  sub_22DD504A8(&qword_255DB9640, (uint64_t (*)(uint64_t))MEMORY[0x24BE310E0], MEMORY[0x24BE310F0]);
  v69 = v101;
  v70 = sub_22DE1DDBC();
  v101 = v69;
  if (!v69)
  {
    v51 = v70;
    v53 = v71;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v66);
    swift_release();
    goto LABEL_21;
  }
  (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v66);
  return swift_release();
}

void sub_22DDF2E98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  char *v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  id v38[2];

  v38[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_22DE1DFB4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v36 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - v9;
  sub_22DE1DF60();
  sub_22DDF36FC((uint64_t)v10, v8);
  v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v35(v10, v2);
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_defaultManager);
  sub_22DE1DF90();
  v13 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_fileExistsAtPath_, v13);

  if (v14)
  {
    v15 = objc_msgSend(v11, sel_defaultManager);
    v16 = (void *)sub_22DE1DF3C();
    v38[0] = 0;
    v17 = objc_msgSend(v15, sel_removeItemAtURL_error_, v16, v38);

    if (v17)
    {
      v18 = v38[0];
    }
    else
    {
      v19 = v38[0];
      v20 = (void *)sub_22DE1DEE8();

      swift_willThrow();
      if (qword_255DB53B8 != -1)
        swift_once();
      v21 = sub_22DE1E410();
      __swift_project_value_buffer(v21, (uint64_t)qword_255DC3D78);
      v22 = v36;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v36, a1, v2);
      v23 = v20;
      v24 = v20;
      v25 = sub_22DE1E3F8();
      v26 = sub_22DE1F4FC();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = swift_slowAlloc();
        v34 = (void *)swift_slowAlloc();
        v37 = (uint64_t)v20;
        v38[0] = v34;
        *(_DWORD *)v27 = 136380931;
        v28 = v20;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
        v29 = sub_22DE1F2EC();
        v37 = sub_22DDA2E30(v29, v30, (uint64_t *)v38);
        sub_22DE1F628();
        swift_bridgeObjectRelease();

        *(_WORD *)(v27 + 12) = 2081;
        v31 = sub_22DE1DF90();
        v37 = sub_22DDA2E30(v31, v32, (uint64_t *)v38);
        sub_22DE1F628();
        swift_bridgeObjectRelease();
        v35(v22, v2);
        _os_log_impl(&dword_22DD4B000, v25, v26, "Failed to remove attachment: error: %{private}s path: %{private}s", (uint8_t *)v27, 0x16u);
        v33 = v34;
        swift_arrayDestroy();
        MEMORY[0x22E320870](v33, -1, -1);
        MEMORY[0x22E320870](v27, -1, -1);

      }
      else
      {

        v35(v22, v2);
      }
    }
  }
}

void sub_22DDF32AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32[2];

  v32[1] = *(id *)MEMORY[0x24BDAC8D0];
  v30 = sub_22DE1DFB4();
  v2 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_defaultManager);
  sub_22DE1DF90();
  v7 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_fileExistsAtPath_, v7);

  if (v8)
  {
    v9 = objc_msgSend(v5, sel_defaultManager);
    v10 = (void *)sub_22DE1DF3C();
    v32[0] = 0;
    v11 = objc_msgSend(v9, sel_removeItemAtURL_error_, v10, v32);

    if (v11)
    {
      v12 = v32[0];
    }
    else
    {
      v13 = v32[0];
      v14 = (void *)sub_22DE1DEE8();

      swift_willThrow();
      if (qword_255DB53B8 != -1)
        swift_once();
      v15 = sub_22DE1E410();
      __swift_project_value_buffer(v15, (uint64_t)qword_255DC3D78);
      v16 = v30;
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, a1, v30);
      v17 = v14;
      v18 = v14;
      v19 = sub_22DE1E3F8();
      v20 = sub_22DE1F4FC();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = swift_slowAlloc();
        v29 = (void *)swift_slowAlloc();
        v31 = (uint64_t)v14;
        v32[0] = v29;
        *(_DWORD *)v21 = 136380931;
        v22 = v14;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
        v23 = sub_22DE1F2EC();
        v31 = sub_22DDA2E30(v23, v24, (uint64_t *)v32);
        sub_22DE1F628();
        swift_bridgeObjectRelease();

        *(_WORD *)(v21 + 12) = 2081;
        v25 = sub_22DE1DF90();
        v31 = sub_22DDA2E30(v25, v26, (uint64_t *)v32);
        sub_22DE1F628();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v30);
        _os_log_impl(&dword_22DD4B000, v19, v20, "Failed to remove attachment directory: error: %{private}s path: %{private}s", (uint8_t *)v21, 0x16u);
        v27 = v29;
        swift_arrayDestroy();
        MEMORY[0x22E320870](v27, -1, -1);
        MEMORY[0x22E320870](v21, -1, -1);

      }
      else
      {

        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v16);
      }
    }
  }
}

void sub_22DDF364C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_22DE1F628();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_22DDF36FC(uint64_t a1, char *a2)
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
  v6 = sub_22DE1DFB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_22DD504A8(&qword_255DB9648, v11, MEMORY[0x24BDCDAF0]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_22DE1F25C();
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
      sub_22DD504A8(&qword_255DB9650, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
      v21 = sub_22DE1F280();
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
    sub_22DDF3CC4((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_22DDF3958()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_22DE1DFB4();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9658);
  v6 = sub_22DE1F70C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_22DD504A8(&qword_255DB9648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
      result = sub_22DE1F25C();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_22DDF3CC4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_22DE1DFB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_22DDF3958();
  }
  else
  {
    if (v11 > v10)
    {
      sub_22DDF3EC8();
      goto LABEL_12;
    }
    sub_22DDF40EC();
  }
  v12 = *v3;
  sub_22DD504A8(&qword_255DB9648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  v13 = sub_22DE1F25C();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_22DD504A8(&qword_255DB9650, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
      v18 = sub_22DE1F280();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22DE1F910();
  __break(1u);
  return result;
}

void *sub_22DDF3EC8()
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
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_22DE1DFB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9658);
  v6 = *v0;
  v7 = sub_22DE1F700();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_22DDF40EC()
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
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_22DE1DFB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9658);
  v7 = sub_22DE1F70C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
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
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_22DD504A8(&qword_255DB9648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    result = sub_22DE1F25C();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22DDF4414(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _BYTE *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  uint64_t KeyPath;
  id v28;
  uint64_t result;
  uint64_t v30;
  _QWORD v31[2];
  objc_super v32;

  v7 = sub_22DE1E9BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2[OBJC_IVAR____TtC8Feedback23FBKEvaluationController_blockPresentationDetentUsage] = 0;
  a2[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__evaluationState] = 0;
  v11 = (uint64_t)&a2[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__delegate];
  *(_QWORD *)&a2[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v11 + 8) = 0;
  swift_unknownObjectWeakInit();
  v12 = a2;
  sub_22DE1E9A4();
  (*(void (**)(_BYTE *, char *, uint64_t))(v8 + 32))(&v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__swiftUIDetent], v10, v7);
  v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__isFeedbackFormPresented] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__interaction] = 0;
  v13 = &v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluation];
  *(_QWORD *)v13 = 0;
  v13[8] = -1;
  v14 = &v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluationCompletionHandler];
  *v14 = 0;
  v14[1] = 0;
  v15 = &v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__subject];
  v16 = sub_22DE1E194();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  v17(v15, 1, 1, v16);
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___cachedInteraction] = 0;
  v18 = &v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext];
  v19 = type metadata accessor for FBKEvaluationController.FormContext(0);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v18, 1, 1, v19);
  v20(v18, 1, 1, v19);
  v21 = &v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__actionPerformed];
  v22 = sub_22DE1E14C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  sub_22DE1E08C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass()
    || ((swift_getObjectType(), swift_conformsToProtocol2()) ? (v23 = a1) : (v23 = 0), v23))
  {
    swift_unknownObjectRetain();
    sub_22DDA47D8(v11);
    *(_QWORD *)(v11 + 8) = a4;
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    v12[OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType] = 0;

    v24 = (objc_class *)type metadata accessor for FBKEvaluationController(0);
    v32.receiver = v12;
    v32.super_class = v24;
    v25 = objc_msgSendSuper2(&v32, sel_init);
    v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v31[-4] = v25;
    v31[-3] = sub_22DDF7F34;
    v30 = v26;
    v31[1] = v25;
    sub_22DD504A8((unint64_t *)&qword_255DB7270, type metadata accessor for FBKEvaluationController, (uint64_t)&protocol conformance descriptor for FBKEvaluationController);
    v28 = v25;
    swift_retain();
    sub_22DE1E05C();

    swift_unknownObjectRelease();
    swift_release();
    swift_release_n();
    return (uint64_t)v28;
  }
  else
  {
    result = sub_22DE1F7CC();
    __break(1u);
  }
  return result;
}

BOOL sub_22DDF4800()
{
  uint64_t v0;
  uint64_t *boxed_opaque_existential_1;
  char v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8[5];

  v0 = sub_22DE1E0E0();
  v8[3] = v0;
  v8[4] = sub_22DD504A8(&qword_255DB81A0, (uint64_t (*)(uint64_t))MEMORY[0x24BE30E10], MEMORY[0x24BE30E08]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BE30E00], v0);
  v2 = sub_22DE1E0A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if ((v2 & 1) == 0)
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v3 = sub_22DE1E410();
    __swift_project_value_buffer(v3, (uint64_t)qword_255DC3D78);
    v4 = sub_22DE1E3F8();
    v5 = sub_22DE1F4FC();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22DD4B000, v4, v5, "CentralizedFeedback feature flag is not enabled.", v6, 2u);
      MEMORY[0x22E320870](v6, -1, -1);
    }

  }
  return (v2 & 1) == 0;
}

unint64_t _s8Feedback23FBKEvaluationControllerC15systemImageName3for11hasResponseSS0A7Service14FBKSEvaluationC6ActionO_SbtFZ_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v15;
  unint64_t v16;

  v2 = sub_22DE1E14C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 != *MEMORY[0x24BE30EB0])
  {
    if (v6 == *MEMORY[0x24BE30E80])
    {
      v15 = 0;
      v16 = 0xE000000000000000;
      sub_22DE1F730();
      swift_bridgeObjectRelease();
      v9 = 0x7568742E646E6168;
      v10 = 0xEF6E776F6473626DLL;
    }
    else
    {
      if (v6 != *MEMORY[0x24BE30E98])
      {
        if (v6 != *MEMORY[0x24BE30EA8] && v6 != *MEMORY[0x24BE30E90] && v6 != *MEMORY[0x24BE30EA0])
        {
          v15 = 0;
          v16 = 0xE000000000000000;
          sub_22DE1F730();
          swift_bridgeObjectRelease();
          v15 = 0xD000000000000013;
          v16 = 0x800000022DE2C9F0;
          sub_22DE1F328();
          swift_bridgeObjectRelease();
          v11 = v15;
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          return v11;
        }
        v7 = 0x656C637269632E78;
        v8 = 0xE800000000000000;
        goto LABEL_3;
      }
      v15 = 0;
      v16 = 0xE000000000000000;
      sub_22DE1F730();
      swift_bridgeObjectRelease();
      v9 = 0xD000000000000016;
      v10 = 0x800000022DE2B4C0;
    }
    v15 = v9;
    v16 = v10;
    goto LABEL_9;
  }
  v7 = 0x7568742E646E6168;
  v8 = 0xED0000707573626DLL;
LABEL_3:
  v15 = v7;
  v16 = v8;
LABEL_9:
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t type metadata accessor for FBKEvaluationController(uint64_t a1)
{
  return sub_22DD6481C(a1, (uint64_t *)&unk_255DB9550);
}

uint64_t type metadata accessor for FBKEvaluationController.FormContext(uint64_t a1)
{
  return sub_22DD6481C(a1, qword_255DB95D0);
}

id sub_22DDF4BE8(id a1, unsigned __int8 a2)
{
  if (a2 != 255)
    return sub_22DDF7A04(a1);
  return a1;
}

void sub_22DDF4C00(id a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_22DD6E88C(a1);
}

uint64_t sub_22DDF4C18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_22DE1E050();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  if (*(_QWORD *)(v0 + v4))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DDF4CA4()
{
  return sub_22DDF5CF0((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], (uint64_t (*)(unint64_t, _QWORD, _QWORD))sub_22DDE15E8);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_22DDF4CD0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_22DDF4CF4(uint64_t a1, char *a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), void (*a5)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  _QWORD *v19;
  char *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  BOOL v26;
  void (*v27)(_QWORD, _QWORD, _QWORD);
  void (*v28)(_QWORD, _QWORD);
  uint64_t v29;
  uint8_t *v30;
  id v31;
  int v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t KeyPath;
  id v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t (**v62)(void *, char);
  char *v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  void (*v69)(_QWORD, _QWORD, _QWORD);
  void (*v70)(_QWORD, _QWORD);
  uint64_t v71;
  void *v72;
  _BYTE *v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  _QWORD v79[2];
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  void (*v86)(_QWORD, _QWORD);
  void (*v87)(_QWORD, _QWORD, _QWORD);
  uint64_t v88;
  uint64_t v89;
  char *v90;

  v84 = sub_22DE1E050();
  v82 = *(_QWORD *)(v84 - 8);
  v10 = *(_QWORD *)(v82 + 64);
  v11 = MEMORY[0x24BDAC7A8](v84);
  v81 = (char *)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v80 = (char *)v79 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v83 = (char *)v79 - v14;
  v15 = sub_22DE1E194();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (void **)((char *)v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v88 = (uint64_t)v19;
  v19[4] = a5;
  v85 = (void (*)(char *, char *, uint64_t))a3;
  swift_retain();
  v86 = a4;
  v87 = a5;
  sub_22DD50D8C((uint64_t)a4);
  if (sub_22DDDEF84(0))
  {
    if (qword_255DB53B8 != -1)
      swift_once();
    v74 = sub_22DE1E410();
    __swift_project_value_buffer(v74, (uint64_t)qword_255DC3D78);
    v75 = sub_22DE1E3F8();
    v76 = sub_22DE1F4FC();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = (uint8_t *)swift_slowAlloc();
      v78 = swift_slowAlloc();
      v90 = (char *)v78;
      *(_DWORD *)v77 = 136446210;
      v89 = sub_22DDA2E30(0xD00000000000002ALL, 0x800000022DE2C8B0, (uint64_t *)&v90);
      sub_22DE1F628();
      _os_log_impl(&dword_22DD4B000, v75, v76, "%{public}s called while FBKEvaluationController is idling.", v77, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v78, -1, -1);
      MEMORY[0x22E320870](v77, -1, -1);
    }

    swift_release();
    swift_release();
    sub_22DD50DE0((uint64_t)v86);
    sub_22DE1F7CC();
    __break(1u);
  }
  else
  {
    swift_getKeyPath();
    v20 = &a2[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___observationRegistrar];
    v90 = a2;
    sub_22DD504A8((unint64_t *)&qword_255DB7270, type metadata accessor for FBKEvaluationController, (uint64_t)&protocol conformance descriptor for FBKEvaluationController);
    v79[1] = v20;
    sub_22DE1E068();
    swift_release();
    v21 = *(void **)&a2[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___cachedInteraction];
    if (v21)
    {
      v22 = v21;
      if ((sub_22DE1E170() & 1) != 0)
      {
        if (qword_255DB53B8 != -1)
          swift_once();
        v23 = sub_22DE1E410();
        __swift_project_value_buffer(v23, (uint64_t)qword_255DC3D78);
        v24 = sub_22DE1E3F8();
        v25 = sub_22DE1F514();
        v26 = os_log_type_enabled(v24, v25);
        v27 = v87;
        v29 = (uint64_t)v85;
        v28 = v86;
        if (v26)
        {
          v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_22DD4B000, v24, v25, "Using cached interaction", v30, 2u);
          MEMORY[0x22E320870](v30, -1, -1);
        }

        v31 = v22;
        sub_22DDE1C04(v21, 0, v29, (uint64_t)v28, (uint64_t)v27);
LABEL_21:
        swift_release();

        return;
      }

    }
    (*(void (**)(void **, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
    v32 = (*(uint64_t (**)(void **, uint64_t))(v16 + 88))(v18, v15);
    if (v32 == *MEMORY[0x24BE30F38])
    {
      (*(void (**)(void **, uint64_t))(v16 + 96))(v18, v15);
      v34 = v82;
      v33 = v83;
      v35 = v84;
      v87 = *(void (**)(_QWORD, _QWORD, _QWORD))(v82 + 32);
      v87(v83, v18, v84);
      if (qword_255DB53B8 != -1)
        swift_once();
      v36 = sub_22DE1E410();
      __swift_project_value_buffer(v36, (uint64_t)qword_255DC3D78);
      v37 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
      v38 = v80;
      v37(v80, v33, v35);
      v39 = sub_22DE1E3F8();
      v40 = sub_22DE1F514();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        v42 = swift_slowAlloc();
        v85 = v37;
        v43 = v42;
        v90 = (char *)v42;
        *(_DWORD *)v41 = 136446210;
        v44 = sub_22DE1E02C();
        v89 = sub_22DDA2E30(v44, v45, (uint64_t *)&v90);
        v35 = v84;
        v34 = v82;
        sub_22DE1F628();
        swift_bridgeObjectRelease();
        v86 = *(void (**)(_QWORD, _QWORD))(v34 + 8);
        v86(v38, v35);
        _os_log_impl(&dword_22DD4B000, v39, v40, "Prefetching interaction for uuid %{public}s", v41, 0xCu);
        swift_arrayDestroy();
        v46 = v43;
        v37 = v85;
        MEMORY[0x22E320870](v46, -1, -1);
        v47 = v41;
        v33 = v83;
        MEMORY[0x22E320870](v47, -1, -1);
      }
      else
      {
        v86 = *(void (**)(_QWORD, _QWORD))(v34 + 8);
        v86(v38, v35);
      }

      v55 = v88;
      v88 = sub_22DE1E104();
      v56 = v81;
      v37(v81, v33, v35);
      v57 = *(unsigned __int8 *)(v34 + 80);
      v58 = v33;
      v59 = (v57 + 16) & ~v57;
      v60 = (v10 + v59 + 7) & 0xFFFFFFFFFFFFFFF8;
      v61 = swift_allocObject();
      v87(v61 + v59, v56, v35);
      *(_QWORD *)(v61 + v60) = a2;
      v62 = (uint64_t (**)(void *, char))(v61 + ((v60 + 15) & 0xFFFFFFFFFFFFFFF8));
      *v62 = sub_22DDF7D3C;
      v62[1] = (uint64_t (*)(void *, char))v55;
      v63 = a2;
      swift_retain();
      MEMORY[0x22E31E974](v58, sub_22DDF7900, v61);
      swift_release();
      v86(v58, v35);
    }
    else
    {
      if (v32 == *MEMORY[0x24BE30F00])
      {
        (*(void (**)(void **, uint64_t))(v16 + 96))(v18, v15);
        v48 = *v18;
        if (qword_255DB53B8 != -1)
          swift_once();
        v49 = sub_22DE1E410();
        __swift_project_value_buffer(v49, (uint64_t)qword_255DC3D78);
        v50 = sub_22DE1E3F8();
        v51 = sub_22DE1F514();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_22DD4B000, v50, v51, "Interaction already available", v52, 2u);
          MEMORY[0x22E320870](v52, -1, -1);
        }

        KeyPath = swift_getKeyPath();
        MEMORY[0x24BDAC7A8](KeyPath);
        v90 = a2;
        v54 = v48;
        sub_22DE1E05C();
        swift_release();

        v31 = v54;
        sub_22DDE1C04(v48, 0, (uint64_t)v85, (uint64_t)v86, (uint64_t)v87);
        goto LABEL_21;
      }
      if (qword_255DB53B8 != -1)
        swift_once();
      v64 = sub_22DE1E410();
      __swift_project_value_buffer(v64, (uint64_t)qword_255DC3D78);
      v65 = sub_22DE1E3F8();
      v66 = sub_22DE1F514();
      if (os_log_type_enabled(v65, v66))
      {
        v67 = (uint8_t *)swift_slowAlloc();
        v68 = swift_slowAlloc();
        v90 = (char *)v68;
        *(_DWORD *)v67 = 136446210;
        v89 = sub_22DDA2E30(0xD00000000000002ALL, 0x800000022DE2C8B0, (uint64_t *)&v90);
        sub_22DE1F628();
        _os_log_impl(&dword_22DD4B000, v65, v66, "%{public}s Unknown Subject case", v67, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E320870](v68, -1, -1);
        MEMORY[0x22E320870](v67, -1, -1);
      }

      v69 = v87;
      v71 = (uint64_t)v85;
      v70 = v86;
      sub_22DDD4680();
      v72 = (void *)swift_allocError();
      sub_22DDB8A1C(0xD000000000000014, 0x800000022DE2C890, v73);
      sub_22DDE1C04(v72, 1, v71, (uint64_t)v70, (uint64_t)v69);

      (*(void (**)(void **, uint64_t))(v16 + 8))(v18, v15);
    }
    swift_release();
  }
}

uint64_t sub_22DDF5754@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22DDE3780(a1, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__subject, &qword_255DB63B0, a2);
}

uint64_t sub_22DDF5784()
{
  uint64_t v0;

  return sub_22DDE1528(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &qword_255DB63B0, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__subject);
}

void sub_22DDF57B4()
{
  sub_22DDF7D4C(&OBJC_IVAR____TtC8Feedback23FBKEvaluationController___cachedInteraction);
}

uint64_t sub_22DDF57D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22DDE3780(a1, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext, &qword_255DB94F8, a2);
}

uint64_t sub_22DDF5800()
{
  uint64_t v0;

  return sub_22DDE1528(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &qword_255DB94F8, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext);
}

void sub_22DDF5828()
{
  sub_22DDF7ED8();
}

uint64_t sub_22DDF583C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22DDE3780(a1, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__actionPerformed, &qword_255DB94F0, a2);
}

uint64_t sub_22DDF586C()
{
  uint64_t v0;

  return sub_22DDE1528(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &qword_255DB94F0, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__actionPerformed);
}

uint64_t sub_22DDF589C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_22DDDE578(a1, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__evaluationState, a2);
}

uint64_t sub_22DDF58C4(void *a1, char a2)
{
  uint64_t v2;

  return sub_22DDEC1B4(a1, a2 & 1, *(void **)(v2 + 16), (uint64_t)&unk_24F994580, (uint64_t)sub_22DDF770C, (uint64_t)&block_descriptor_144);
}

uint64_t sub_22DDF58F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_22DE1E14C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_22DE1E194();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_22DDF59B4(void *a1, char a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2 & 1;
  v5 = *(_QWORD *)(sub_22DE1E14C() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_22DE1E194() - 8) + 80);
  return sub_22DDE52D0(a1, v4, *(void **)(v2 + 16), v2 + v6, v2 + ((v6 + v7 + v8) & ~v8));
}

uint64_t sub_22DDF5A30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_22DE1E14C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_22DDF5AA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_22DE1E14C() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_22DDE4D3C(a1, v1 + v4, *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_22DDF5AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_22DE1E14C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_22DE1E194();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_22DDF5BBC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(sub_22DE1E14C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  result = sub_22DE1E194();
  v5 = *(_QWORD *)(result - 8);
  v6 = (v2 + v3 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  if (!__OFADD__(v7, 1))
    return sub_22DDE3944(v0 + v2, v0 + v6, 1, v7 + 1);
  __break(1u);
  return result;
}

uint64_t sub_22DDF5C48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_22DE1E194();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DDF5CDC()
{
  return sub_22DDF5CF0((uint64_t (*)(_QWORD))MEMORY[0x24BE30F68], (uint64_t (*)(unint64_t, _QWORD, _QWORD))sub_22DDE5C94);
}

uint64_t sub_22DDF5CF0(uint64_t (*a1)(_QWORD), uint64_t (*a2)(unint64_t, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a1(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a2(v2 + v5, *(_QWORD *)(v2 + v6), *(_QWORD *)(v2 + v6 + 8));
}

uint64_t sub_22DDF5D50()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DDF5D7C(void *a1, char a2)
{
  uint64_t v2;

  return sub_22DDE6308(a1, a2 & 1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_22DDF5D8C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

void sub_22DDF5DB8(void *a1, char a2)
{
  uint64_t v2;

  sub_22DDEA164(a1, a2 & 1, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t sub_22DDF5DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB6250);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22DE1E11C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255DB53B8 != -1)
    swift_once();
  v14 = sub_22DE1E410();
  __swift_project_value_buffer(v14, (uint64_t)qword_255DC3D78);
  v15 = sub_22DE1E3F8();
  v16 = sub_22DE1F514();
  if (os_log_type_enabled(v15, v16))
  {
    v28 = a3;
    v17 = swift_slowAlloc();
    v29 = v4;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v26 = a1;
    v20 = v19;
    v31[0] = v19;
    v27 = v10;
    *(_DWORD *)v18 = 136446210;
    v30 = sub_22DDA2E30(0xD000000000000046, 0x800000022DE2C840, v31);
    v10 = v27;
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v15, v16, "%{public}s", v18, 0xCu);
    swift_arrayDestroy();
    v21 = v20;
    a1 = v26;
    MEMORY[0x22E320870](v21, -1, -1);
    MEMORY[0x22E320870](v18, -1, -1);
  }

  v22 = (void **)(a1 + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_form);
  swift_beginAccess();
  v23 = *v22;
  swift_bridgeObjectRetain();
  v24 = v23;
  sub_22DDEACC4();

  sub_22DE1E110();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  sub_22DDEB488((uint64_t)v9);
  sub_22DD5071C((uint64_t)v9, &qword_255DB6250);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_22DDF6090(uint64_t a1)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t i;
  unint64_t v28;
  uint64_t v29;
  uint64_t result;
  _QWORD v31[2];
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;

  v2 = sub_22DE1DFB4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v31 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v31 - v13;
  v34 = MEMORY[0x24BEE4B08];
  v15 = *(_QWORD *)(a1 + 16);
  v31[1] = a1;
  if (v15)
  {
    v16 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = *(_QWORD *)(v3 + 72);
    v33 = v17;
    swift_bridgeObjectRetain();
    while (1)
    {
      v33(v14, v16, v2);
      v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v18(v14, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v14, 1, v2) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v14, v2);
      sub_22DDF2E98((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v16 += v32;
      if (!--v15)
        goto LABEL_7;
    }
  }
  else
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    swift_bridgeObjectRetain();
LABEL_7:
    v18(v14, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  v19 = v34;
  v20 = v34 + 56;
  v21 = 1 << *(_BYTE *)(v34 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & *(_QWORD *)(v34 + 56);
  v33 = (void (*)(char *, uint64_t, uint64_t))((unint64_t)(v21 + 63) >> 6);
  swift_bridgeObjectRetain_n();
  v24 = 0;
  if (!v23)
    goto LABEL_12;
LABEL_11:
  v25 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  for (i = v25 | (v24 << 6); ; i = __clz(__rbit64(v28)) + (v24 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v12, *(_QWORD *)(v19 + 48) + *(_QWORD *)(v3 + 72) * i, v2);
    v18(v12, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
      goto LABEL_35;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v12, v2);
    sub_22DDF32AC((uint64_t)v6);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    if (v23)
      goto LABEL_11;
LABEL_12:
    if (__OFADD__(v24++, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v24 >= (uint64_t)v33)
      goto LABEL_34;
    v28 = *(_QWORD *)(v20 + 8 * v24);
    if (!v28)
      break;
LABEL_26:
    v23 = (v28 - 1) & v28;
  }
  v29 = v24 + 1;
  if (v24 + 1 >= (uint64_t)v33)
    goto LABEL_34;
  v28 = *(_QWORD *)(v20 + 8 * v29);
  if (v28)
    goto LABEL_25;
  v29 = v24 + 2;
  if (v24 + 2 >= (uint64_t)v33)
    goto LABEL_34;
  v28 = *(_QWORD *)(v20 + 8 * v29);
  if (v28)
    goto LABEL_25;
  v29 = v24 + 3;
  if (v24 + 3 >= (uint64_t)v33)
    goto LABEL_34;
  v28 = *(_QWORD *)(v20 + 8 * v29);
  if (v28)
    goto LABEL_25;
  v29 = v24 + 4;
  if (v24 + 4 >= (uint64_t)v33)
    goto LABEL_34;
  v28 = *(_QWORD *)(v20 + 8 * v29);
  if (v28)
    goto LABEL_25;
  v29 = v24 + 5;
  if (v24 + 5 >= (uint64_t)v33)
  {
LABEL_34:
    v18(v12, 1, 1, v2);
LABEL_35:
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v28 = *(_QWORD *)(v20 + 8 * v29);
  if (v28)
  {
LABEL_25:
    v24 = v29;
    goto LABEL_26;
  }
  while (1)
  {
    v24 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v24 >= (uint64_t)v33)
      goto LABEL_34;
    v28 = *(_QWORD *)(v20 + 8 * v24);
    ++v29;
    if (v28)
      goto LABEL_26;
  }
LABEL_37:
  __break(1u);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  swift_release();
  __break(1u);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v20, v2);
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC0_23didFailToStartWithErroryAA011FBKFeedbackefC0C_AA08FBKDraftL0OtF_0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  uint64_t v8[3];

  if (qword_255DB53B8 != -1)
    swift_once();
  v0 = sub_22DE1E410();
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D78);
  v1 = sub_22DE1E3F8();
  v2 = sub_22DE1F514();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v8[0] = v4;
    *(_DWORD *)v3 = 136446210;
    sub_22DDA2E30(0xD000000000000037, 0x800000022DE2C800, v8);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v1, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v4, -1, -1);
    MEMORY[0x22E320870](v3, -1, -1);
  }

  swift_beginAccess();
  swift_beginAccess();
  v5 = swift_bridgeObjectRetain();
  sub_22DDF6090(v5);
  swift_bridgeObjectRelease();
  sub_22DDD4680();
  v6 = (void *)swift_allocError();
  *v7 = 1;
  sub_22DDE0CDC(v6, 1);

}

uint64_t _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC0_18didFailToAttachURL5erroryAA011FBKFeedbackefC0C_10Foundation0K0VAA18FBKAttachmentErrorOtF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20[3];

  v4 = sub_22DE1DFB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255DB53B8 != -1)
    swift_once();
  v8 = sub_22DE1E410();
  __swift_project_value_buffer(v8, (uint64_t)qword_255DC3D78);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v9 = sub_22DE1E3F8();
  v10 = sub_22DE1F514();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v18[1] = a1;
    v12 = v11;
    v13 = swift_slowAlloc();
    v20[0] = v13;
    *(_DWORD *)v12 = 136446466;
    v19 = sub_22DDA2E30(0xD000000000000038, 0x800000022DE2C7C0, v20);
    sub_22DE1F628();
    *(_WORD *)(v12 + 12) = 2082;
    v14 = sub_22DE1DF18();
    v19 = sub_22DDA2E30(v14, v15, v20);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_22DD4B000, v9, v10, "%{public}s: %{public}s ", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v13, -1, -1);
    MEMORY[0x22E320870](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  swift_beginAccess();
  swift_beginAccess();
  v16 = swift_bridgeObjectRetain();
  sub_22DDF6090(v16);
  return swift_bridgeObjectRelease();
}

uint64_t _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC11DidLoadFormyyAA011FBKFeedbackefC0CF_0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[3];

  if (qword_255DB53B8 != -1)
    swift_once();
  v0 = sub_22DE1E410();
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D78);
  v1 = sub_22DE1E3F8();
  v2 = sub_22DE1F514();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v7[0] = v4;
    *(_DWORD *)v3 = 136446210;
    sub_22DDA2E30(0xD00000000000002ALL, 0x800000022DE2C6D0, v7);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v1, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v4, -1, -1);
    MEMORY[0x22E320870](v3, -1, -1);
  }

  swift_beginAccess();
  swift_beginAccess();
  v5 = swift_bridgeObjectRetain();
  sub_22DDF6090(v5);
  return swift_bridgeObjectRelease();
}

unint64_t sub_22DDF6B28()
{
  unint64_t result;

  result = qword_255DB9520;
  if (!qword_255DB9520)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKEvaluationController.APIType, &type metadata for FBKEvaluationController.APIType);
    atomic_store(result, (unint64_t *)&qword_255DB9520);
  }
  return result;
}

uint64_t sub_22DDF6B6C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC8Feedback23FBKEvaluationController_blockPresentationDetentUsage);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22DDF6BBC(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback23FBKEvaluationController_blockPresentationDetentUsage);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

void sub_22DDF6C0C(uint64_t a1)
{
  id v1;
  unsigned __int8 v2;

  v1 = *(id *)a1;
  v2 = *(_BYTE *)(a1 + 8);
  sub_22DDF4BE8(*(id *)a1, v2);
  sub_22DDE0394(v1, v2);
}

id sub_22DDF6C50@<X0>(uint64_t *a1@<X8>)
{
  return sub_22DDE063C(a1);
}

uint64_t sub_22DDF6C74()
{
  return type metadata accessor for FBKEvaluationController(0);
}

void sub_22DDF6C7C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_22DE1E9BC();
  if (v0 <= 0x3F)
  {
    sub_22DD60C90(319, &qword_255DB9560, (void (*)(uint64_t))MEMORY[0x24BE30F68]);
    if (v1 <= 0x3F)
    {
      sub_22DD60C90(319, &qword_255DB9568, (void (*)(uint64_t))type metadata accessor for FBKEvaluationController.FormContext);
      if (v2 <= 0x3F)
      {
        sub_22DD60C90(319, qword_255DB9570, (void (*)(uint64_t))MEMORY[0x24BE30EB8]);
        if (v3 <= 0x3F)
        {
          sub_22DE1E098();
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for FBKEvaluationController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of FBKEvaluationController.isFeedbackFormPresented.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of FBKEvaluationController.__allocating_init(subject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 528))();
}

uint64_t dispatch thunk of FBKEvaluationController.__allocating_init(evaluatedFeature:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 536))();
}

uint64_t dispatch thunk of FBKEvaluationController.evaluation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of FBKEvaluationController.evaluationResponse.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of FBKEvaluationController.evaluationResponse.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of FBKEvaluationController.evaluationResponse.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of FBKEvaluationController.preloadInteraction(evaluationID:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of FBKEvaluationController.reset()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidPerformAction(action:subject:showFeedbackForm:retryCount:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of FBKEvaluationController.checkForExistingEvaluation(subject:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidLike(subject:showFeedbackForm:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidDislike(subject:showFeedbackForm:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidReportAConcern(subject:showFeedbackForm:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of FBKEvaluationController.systemImageName(action:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of FBKEvaluationController.preloadInteraction(ID:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of FBKEvaluationController.preloadFeatureDetails(ID:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of FBKEvaluationController.checkForExistingEvaluation(input:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of FBKEvaluationController.checkForExistingEvaluations(input:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidPerformAction(action:evaluationInput:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidLike(evaluationInput:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidDislike(evaluationInput:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidReportAConcern(evaluationInput:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of FBKEvaluationController.systemImageName(type:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x430))();
}

ValueMetadata *type metadata accessor for FBKEvaluationController.APIType()
{
  return &type metadata for FBKEvaluationController.APIType;
}

uint64_t _s8Feedback23FBKEvaluationControllerC7APITypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DDF7108 + 4 * byte_22DE260D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22DDF713C + 4 * byte_22DE260D0[v4]))();
}

uint64_t sub_22DDF713C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DDF7144(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DDF714CLL);
  return result;
}

uint64_t sub_22DDF7158(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DDF7160);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22DDF7164(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DDF716C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKEvaluationController.EvaluationState()
{
  return &type metadata for FBKEvaluationController.EvaluationState;
}

uint64_t *sub_22DDF7188(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22DE1E14C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    v12 = v10;
    v13 = v11;
  }
  return a1;
}

void sub_22DDF7220(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22DE1E14C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t sub_22DDF7270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = sub_22DE1E14C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = *(void **)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v10;
  v11 = v9;
  v12 = v10;
  return a1;
}

uint64_t sub_22DDF72DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = sub_22DE1E14C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  v11 = *(int *)(a3 + 24);
  v12 = *(void **)(a1 + v11);
  v13 = *(void **)(a2 + v11);
  *(_QWORD *)(a1 + v11) = v13;
  v14 = v13;

  return a1;
}

uint64_t sub_22DDF735C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_22DE1E14C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_22DDF73C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = sub_22DE1E14C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = *(int *)(a3 + 24);
  v10 = *(void **)(a1 + v9);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);

  return a1;
}

uint64_t sub_22DDF7438()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DDF7444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_22DE1E14C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_22DDF74C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DDF74CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_22DE1E14C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_22DDF7544()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22DE1E14C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_22DDF75C8()
{
  unint64_t result;

  result = qword_255DB9610;
  if (!qword_255DB9610)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE26470, &type metadata for FBKEvaluationController.EvaluationState);
    atomic_store(result, (unint64_t *)&qword_255DB9610);
  }
  return result;
}

uint64_t sub_22DDF760C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_22DDDE578(a1, &OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType, a2);
}

uint64_t sub_22DDF763C()
{
  return swift_deallocObject();
}

void sub_22DDF764C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__apiType) = *(_BYTE *)(v0 + 24);
}

void sub_22DDF766C()
{
  sub_22DDF7D4C(&OBJC_IVAR____TtC8Feedback23FBKEvaluationController__interaction);
}

void sub_22DDF7688()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__isFeedbackFormPresented) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_22DDF76A8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__delegate + 8) = *(_QWORD *)(v0 + 32);
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_22DDF76D4(void *a1, char a2)
{
  uint64_t v2;

  return sub_22DDEC1B4(a1, a2 & 1, *(void **)(v2 + 16), (uint64_t)&unk_24F994350, (uint64_t)sub_22DDF770C, (uint64_t)&block_descriptor_100);
}

uint64_t sub_22DDF7710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DDF773C()
{
  uint64_t v0;

  sub_22DD6E88C(*(id *)(v0 + 16));

  swift_release();
  return swift_deallocObject();
}

void sub_22DDF7774()
{
  uint64_t v0;

  sub_22DDE654C(*(id *)(v0 + 16), *(_BYTE *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(id, uint64_t))(v0 + 40));
}

uint64_t sub_22DDF7788()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB9668) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = sub_22DE1E14C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    v8 = sub_22DE1E050();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v2, v8);
  }
  v9 = (v2 + v3 + v6) & ~v6;
  v10 = (v7 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v9, v4);

  return swift_deallocObject();
}

void sub_22DDF7884()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB9668) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(sub_22DE1E14C() - 8);
  v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  sub_22DDE504C(v0 + v2, v0 + v5, *(_QWORD *)(v0 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_22DDF7904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_22DE1E050();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_22DD6E88C(*(id *)(v0 + 16));
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

void sub_22DDF79AC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_22DE1E050() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_22DDE31FC(*(void **)(v0 + 16), *(unsigned __int8 *)(v0 + 24), v0 + v2, *(_QWORD *)(v0 + v3), *(void (**)(void *, uint64_t))(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

id sub_22DDF7A04(id a1)
{
  return a1;
}

uint64_t sub_22DDF7A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_22DE1E14C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_22DE1E194();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  sub_22DD6E88C(*(id *)(v0 + 16));

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

void sub_22DDF7AD8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_22DE1E14C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_22DE1E194() - 8) + 80);
  sub_22DDE5608(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24), *(void **)(v0 + 32), (void *)(v0 + v2), v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_22DDF7B44()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22DDF7B68(void *a1, char a2)
{
  uint64_t v2;

  return sub_22DDE59DC(a1, a2 & 1, *(void **)(v2 + 16));
}

uint64_t sub_22DDF7B74()
{
  uint64_t v0;

  sub_22DD6E88C(*(id *)(v0 + 16));

  return swift_deallocObject();
}

void sub_22DDF7BA4()
{
  uint64_t v0;

  sub_22DDE5C0C(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t objectdestroy_96Tm()
{
  uint64_t v0;

  sub_22DD6E88C(*(id *)(v0 + 24));
  return swift_deallocObject();
}

void sub_22DDF7BE8()
{
  uint64_t v0;

  sub_22DDE0CDC(*(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
}

void sub_22DDF7C10()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__evaluationState) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_22DDF7C28()
{
  return sub_22DDF7F40();
}

uint64_t sub_22DDF7C3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DDF7C60(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_22DDF7C98(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_22DDF7CC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_22DDF7D08()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DDF7D3C(void *a1, char a2)
{
  uint64_t *v2;

  return sub_22DDE1C04(a1, a2 & 1, v2[2], v2[3], v2[4]);
}

void sub_22DDF7D4C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  v4 = *(void **)(v2 + *a1);
  *(_QWORD *)(v2 + *a1) = v3;
  v5 = v3;

}

uint64_t objectdestroy_115Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_22DE1E050();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DDF7E18(void *a1, char a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a2 & 1;
  v5 = *(_QWORD *)(sub_22DE1E050() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_22DDE2F1C(a1, v4, v2 + v6, *(void **)(v2 + v7), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_22DDF7E88()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  sub_22DD6E88C(*(id *)(v0 + 40));
  return swift_deallocObject();
}

void sub_22DDF7EC8()
{
  uint64_t v0;

  sub_22DDE1E4C(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t, _QWORD))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
}

void sub_22DDF7ED8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v1 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluation;
  v3 = *(void **)v2;
  v4 = *(_BYTE *)(v0 + 32);
  *(_QWORD *)v2 = v1;
  v5 = *(_BYTE *)(v2 + 8);
  *(_BYTE *)(v2 + 8) = v4;
  sub_22DDF4BE8(v1, v4);
  sub_22DDF4C00(v3, v5);
}

void sub_22DDF7F34(void *a1, char a2)
{
  uint64_t v2;

  sub_22DDDF2E0(a1, a2 & 1, v2);
}

uint64_t sub_22DDF7F40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = v0[3];
  v2 = v0[4];
  v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluationCompletionHandler);
  v4 = *v3;
  *v3 = v1;
  v3[1] = v2;
  sub_22DD50D8C(v1);
  return sub_22DD50DE0(v4);
}

uint64_t _s16AttachmentResultVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16AttachmentResultVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s16AttachmentResultVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s16AttachmentResultVwta(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s16AttachmentResultVMa()
{
  return &_s16AttachmentResultVN;
}

uint64_t _s4KindOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DDF80E8 + 4 * byte_22DE260DF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22DDF811C + 4 * byte_22DE260DA[v4]))();
}

uint64_t sub_22DDF811C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DDF8124(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DDF812CLL);
  return result;
}

uint64_t sub_22DDF8138(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DDF8140);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22DDF8144(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DDF814C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s4KindOMa()
{
  return &_s4KindON;
}

uint64_t sub_22DDF8168()
{
  return sub_22DD508B0(&qword_255DB9670, &qword_255DB9678, MEMORY[0x24BEE12E0]);
}

unint64_t sub_22DDF8198()
{
  unint64_t result;

  result = qword_255DB9680;
  if (!qword_255DB9680)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE265D0, &_s4KindON);
    atomic_store(result, (unint64_t *)&qword_255DB9680);
  }
  return result;
}

uint64_t sub_22DDF8248()
{
  return sub_22DDF586C();
}

uint64_t sub_22DDF825C()
{
  return sub_22DDF5800();
}

uint64_t sub_22DDF8270()
{
  return sub_22DDF5784();
}

void sub_22DDF8284()
{
  sub_22DDF7C10();
}

void sub_22DDF829C()
{
  sub_22DDF7688();
}

uint64_t sub_22DDF82B0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_22DE1F694();
    v5 = v4;
    v6 = sub_22DE1F6E8();
    v8 = MEMORY[0x22E31FF28](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_22DDF8A14(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_22DDF83BC(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_22DDF8A14(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_22DDF8604(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_22DDF83BC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_22DE1F6B8() == *(_DWORD *)(a4 + 36))
      {
        sub_22DE1F6C4();
        sub_22DDF8990();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_22DE1F5EC();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_22DE1F5F8();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_22DE1F5F8();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x22E31FF4C](a1, a2, v7);
  sub_22DDF8990();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_22DDF8604(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

void sub_22DDF868C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD v22[2];

  v1 = v0;
  v2 = sub_22DE1E410();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, sel_currentUser);
  if (!v6)
    goto LABEL_9;
  v7 = v6;
  v8 = objc_msgSend(v6, sel_bugFormStubs);

  if (!v8)
    goto LABEL_9;
  sub_22DDF8990();
  sub_22DDF89CC();
  v9 = sub_22DE1F49C();

  v10 = (void *)sub_22DDF82B0(v9);
  swift_bridgeObjectRelease();
  if (v10)
  {
    if (qword_255DB5398 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v2, (uint64_t)qword_255DC3D18);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
    v12 = v10;
    v13 = sub_22DE1E3F8();
    v14 = sub_22DE1F514();
    if (!os_log_type_enabled(v13, v14))
    {

      v13 = v12;
      goto LABEL_15;
    }
    v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v15 = 134349056;
    v16 = -[NSObject ID](v12, sel_ID);
    if (v16)
    {
      v17 = v16;
      v18 = objc_msgSend(v16, sel_integerValue, v15 + 4);

      v22[1] = v18;
      sub_22DE1F628();

      _os_log_impl(&dword_22DD4B000, v13, v14, "Will start draft with form [%{public}ld]", v15, 0xCu);
      MEMORY[0x22E320870](v15, -1, -1);
LABEL_15:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return;
    }

    __break(1u);
  }
  else
  {
LABEL_9:
    if (qword_255DB5398 != -1)
      swift_once();
    __swift_project_value_buffer(v2, (uint64_t)qword_255DC3D18);
    v19 = sub_22DE1E3F8();
    v20 = sub_22DE1F4FC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_22DD4B000, v19, v20, "Could not find FBKFormStub", v21, 2u);
      MEMORY[0x22E320870](v21, -1, -1);
    }

  }
}

unint64_t sub_22DDF8990()
{
  unint64_t result;

  result = qword_255DB9688;
  if (!qword_255DB9688)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DB9688);
  }
  return result;
}

unint64_t sub_22DDF89CC()
{
  unint64_t result;
  unint64_t v1;

  result = qword_255DB9690;
  if (!qword_255DB9690)
  {
    v1 = sub_22DDF8990();
    result = MEMORY[0x22E3207B0](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255DB9690);
  }
  return result;
}

uint64_t sub_22DDF8A14(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void FBKEvaluationControllerDelegate.evaluationDidComplete(controller:evaluation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_22DDF8BE0(a1, a2, a3, a4, 0xD00000000000002DLL, 0x800000022DE2CA10);
}

void FBKEvaluationControllerDelegate.evaluationDidComplete(controller:response:)()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_255DB53B8 != -1)
    swift_once();
  v0 = sub_22DE1E410();
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D78);
  oslog = sub_22DE1E3F8();
  v1 = sub_22DE1F514();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136446210;
    sub_22DDA2E30(0xD00000000000002BLL, 0x800000022DE2CA40, &v5);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, oslog, v1, "%{public}s", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v3, -1, -1);
    MEMORY[0x22E320870](v2, -1, -1);

  }
  else
  {

  }
}

void FBKEvaluationControllerDelegate.evaluationDidFail(controller:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_22DDF8BE0(a1, a2, a3, a4, 0xD000000000000024, 0x800000022DE2CA70);
}

void sub_22DDF8BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  NSObject *oslog;
  uint64_t v13;

  if (qword_255DB53B8 != -1)
    swift_once();
  v8 = sub_22DE1E410();
  __swift_project_value_buffer(v8, (uint64_t)qword_255DC3D78);
  oslog = sub_22DE1E3F8();
  v9 = sub_22DE1F514();
  if (os_log_type_enabled(oslog, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136446210;
    sub_22DDA2E30(a5, a6, &v13);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, oslog, v9, "%{public}s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v11, -1, -1);
    MEMORY[0x22E320870](v10, -1, -1);

  }
  else
  {

  }
}

uint64_t dispatch thunk of FBKEvaluationControllerDelegateBase.evaluationDidComplete(controller:evaluation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of FBKEvaluationControllerDelegateBase.evaluationDidComplete(controller:response:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FBKEvaluationControllerDelegateBase.evaluationDidFail(controller:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of FBKEvaluationControllerDelegateDynamicPresenter.viewControllerForPresentation(controller:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t FBKAnswerType.description.getter(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 7)
    return 0x206E776F6E6B6E55;
  else
    return *(_QWORD *)&aUnknown_2[8 * a1 + 8];
}

uint64_t sub_22DDF8DDC()
{
  uint64_t *v0;

  return FBKAnswerType.description.getter(*v0);
}

uint64_t FBKImageTransformer.__allocating_init(_:targetFileSize:resizeScale:attemptLimit:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a3;
  *(double *)(result + 40) = a5;
  *(_QWORD *)(result + 48) = a4;
  *(_QWORD *)(result + 56) = 0;
  return result;
}

uint64_t FBKImageTransformer.init(_:targetFileSize:resizeScale:attemptLimit:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a5;
  *(_QWORD *)(v5 + 48) = a4;
  *(_QWORD *)(v5 + 56) = 0;
  return v5;
}

uint64_t sub_22DDF8E60()
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
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  CGAffineTransform v41;
  uint64_t v42;

  v2 = v0;
  v3 = sub_22DE1E410();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)&v35 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v35 - v9;
  if (qword_255DB53A8 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v3, (uint64_t)qword_255DC3D48);
  v11 = sub_22DE1E3F8();
  v12 = sub_22DE1F4F0();
  v13 = os_log_type_enabled(v11, v12);
  v39 = v1;
  if (v13)
  {
    v14 = swift_slowAlloc();
    v36 = v3;
    v15 = v10;
    v16 = (uint8_t *)v14;
    v17 = v4;
    v18 = swift_slowAlloc();
    *(_QWORD *)&v41.a = v18;
    *(_DWORD *)v16 = 136315138;
    v42 = sub_22DDA2E30(0x2928657A69736572, 0xE800000000000000, (uint64_t *)&v41);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v11, v12, "%s", v16, 0xCu);
    swift_arrayDestroy();
    v19 = v18;
    v4 = v17;
    MEMORY[0x22E320870](v19, -1, -1);
    v20 = v16;
    v10 = v15;
    v2 = v0;
    v3 = v36;
    MEMORY[0x22E320870](v20, -1, -1);
  }

  v21 = *(_QWORD *)(v2 + 56);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
  {
    __break(1u);
    JUMPOUT(0x22DDF9F04);
  }
  *(_QWORD *)(v2 + 56) = v23;
  v24 = *(_QWORD *)(v2 + 48);
  if (v24 >= v23)
  {
    v30 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v40, v10, v3);
    swift_retain();
    v31 = sub_22DE1E3F8();
    v32 = sub_22DE1F4F0();
    if (os_log_type_enabled(v31, v32))
    {
      v36 = v4;
      v33 = swift_slowAlloc();
      *(_QWORD *)&v41.a = swift_slowAlloc();
      *(_DWORD *)v33 = 136315394;
      v42 = sub_22DDA2E30(0x2928657A69736572, 0xE800000000000000, (uint64_t *)&v41);
      sub_22DE1F628();
      *(_WORD *)(v33 + 12) = 2048;
      __asm { BR              X13 }
    }

    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v30, v3);
    __asm { BR              X11 }
  }
  v25 = sub_22DE1E3F8();
  v26 = sub_22DE1F4F0();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    *(_QWORD *)&v41.a = v28;
    *(_DWORD *)v27 = 136315138;
    v42 = sub_22DDA2E30(0x2928657A69736572, 0xE800000000000000, (uint64_t *)&v41);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v25, v26, "%s - reached attempt limit", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v28, -1, -1);
    MEMORY[0x22E320870](v27, -1, -1);
  }

  sub_22DDF9FCC();
  swift_allocError();
  *(_QWORD *)v29 = v24;
  *(_BYTE *)(v29 + 8) = 0;
  swift_willThrow();
  return v4;
}

uint64_t FBKImageTransformer.deinit()
{
  uint64_t v0;

  sub_22DD64894(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return v0;
}

uint64_t FBKImageTransformer.__deallocating_deinit()
{
  uint64_t v0;

  sub_22DD64894(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t sub_22DDF9FA4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_22DDF9FCC()
{
  unint64_t result;

  result = qword_255DB9698;
  if (!qword_255DB9698)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKImageTransformer.TransformError, &type metadata for FBKImageTransformer.TransformError);
    atomic_store(result, (unint64_t *)&qword_255DB9698);
  }
  return result;
}

uint64_t type metadata accessor for FBKImageTransformer()
{
  return objc_opt_self();
}

uint64_t method lookup function for FBKImageTransformer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKImageTransformer.__allocating_init(_:targetFileSize:resizeScale:attemptLimit:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of FBKImageTransformer.resize()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

ValueMetadata *type metadata accessor for FBKImageTransformer.TransformError()
{
  return &type metadata for FBKImageTransformer.TransformError;
}

uint64_t sub_22DDFA070@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  int v20;
  uint64_t **v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  uint64_t **v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  _QWORD *v46;
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  int64_t v64;
  unint64_t v65;
  int64_t v66;
  uint64_t *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  char v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  char v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  int64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;

  v2 = v1;
  v97 = a1;
  v107 = sub_22DE1DE1C();
  v108 = *(_QWORD *)(v107 - 8);
  v3 = MEMORY[0x24BDAC7A8](v107);
  v98 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v112 = (char *)&v93 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v93 - v7;
  v9 = sub_22DE1DDEC();
  v10 = *(_QWORD **)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v96 = sub_22DE1DE70();
  v95 = *(_QWORD *)(v96 - 8);
  v13 = MEMORY[0x24BDAC7A8](v96);
  v94 = (char *)&v93 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v93 - v15);
  sub_22DE1DE64();
  sub_22DE1DE4C();
  v109 = v16;
  sub_22DE1DE58();
  v17 = v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId;
  swift_beginAccess();
  if ((*(_BYTE *)(v17 + 8) & 1) != 0)
    goto LABEL_19;
  v18 = *(_QWORD *)v17;
  v19 = (unsigned __int16 *)(v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment);
  swift_beginAccess();
  if ((v19[1] & 1) != 0)
    goto LABEL_19;
  v20 = *v19;
  v21 = (uint64_t **)(v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host);
  swift_beginAccess();
  v22 = v21[1];
  if (!v22
    || (v23 = *v21,
        v24 = (uint64_t *)(v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken),
        swift_beginAccess(),
        (v25 = v24[1]) == 0))
  {
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9878);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_22DE20F30;
    if (qword_255DB5360 != -1)
      goto LABEL_93;
    goto LABEL_20;
  }
  LODWORD(v102) = v20;
  v106 = v18;
  v101 = v8;
  v111 = v2;
  v104 = *v24;
  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9878);
  v27 = *(_QWORD *)(v108 + 72);
  v28 = (*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_22DE268E0;
  v105 = v28;
  v103 = v29;
  v30 = qword_255DB5350;
  swift_bridgeObjectRetain();
  v110 = v26;
  swift_bridgeObjectRetain();
  if (v30 != -1)
LABEL_95:
    swift_once();
  v114 = (uint64_t)v23;
  v115 = (unint64_t)v22;
  sub_22DE1DDE0();
  sub_22DD50840();
  sub_22DE1F658();
  ((void (*)(_QWORD *, unint64_t))v10[1])(v12, v9);
  swift_bridgeObjectRelease();
  sub_22DE1DDF8();
  swift_bridgeObjectRelease();
  if (qword_255DB5358 != -1)
    swift_once();
  v31 = (id)MEMORY[0x22E320294]((__int16)v102);
  sub_22DE1F2B0();

  sub_22DE1DDF8();
  swift_bridgeObjectRelease();
  if (qword_255DB5348 != -1)
    swift_once();
  v12 = (_QWORD *)unk_255DB97A0;
  v114 = v106;
  sub_22DE1F8C8();
  sub_22DE1DDF8();
  swift_bridgeObjectRelease();
  v106 = v27;
  v32 = v111;
  if (qword_255DB5380 != -1)
    swift_once();
  sub_22DE1DDF8();
  swift_bridgeObjectRelease();
  v23 = v109;
  sub_22DE1DE34();
  v33 = (uint64_t **)(v32 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds);
  swift_beginAccess();
  v22 = *v33;
  if (*v33)
  {
    v12 = (_QWORD *)v22[2];
    if (v12)
    {
      v114 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_22DE0F280(0, (int64_t)v12, 0);
      v34 = 0;
      v35 = v114;
      v9 = MEMORY[0x24BEE1ED0];
      do
      {
        v116 = v22[(_QWORD)v34 + 4];
        v36 = sub_22DE1F8C8();
        v10 = v37;
        v114 = v35;
        v27 = *(_QWORD *)(v35 + 16);
        v38 = *(_QWORD *)(v35 + 24);
        if (v27 >= v38 >> 1)
        {
          sub_22DE0F280(v38 > 1, v27 + 1, 1);
          v35 = v114;
        }
        v34 = (_QWORD *)((char *)v34 + 1);
        *(_QWORD *)(v35 + 16) = v27 + 1;
        v39 = v35 + 16 * v27;
        *(_QWORD *)(v39 + 32) = v36;
        *(_QWORD *)(v39 + 40) = v10;
      }
      while (v12 != v34);
      swift_bridgeObjectRelease();
      v114 = v35;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BE0);
      sub_22DE01478();
      sub_22DE1F274();
      v12 = v46;
      swift_release();
      v47 = sub_22DE1DE28();
      v23 = (uint64_t *)v47;
      if (*v48)
      {
        v22 = v48;
        if (qword_255DB5368 != -1)
          swift_once();
        v49 = v101;
        sub_22DE1DDF8();
        swift_bridgeObjectRelease();
        v12 = (_QWORD *)*v22;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v22 = (uint64_t)v12;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v12 = (_QWORD *)sub_22DDFCAF8(0, v12[2] + 1, 1, (unint64_t)v12, &qword_255DB9878, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
          *v22 = (uint64_t)v12;
        }
        v51 = v106;
        v53 = v12[2];
        v52 = v12[3];
        if (v53 >= v52 >> 1)
        {
          v92 = sub_22DDFCAF8(v52 > 1, v53 + 1, 1, (unint64_t)v12, &qword_255DB9878, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
          v51 = v106;
          v12 = (_QWORD *)v92;
          *v22 = v92;
        }
        v12[2] = v53 + 1;
        (*(void (**)(char *, char *, uint64_t))(v108 + 32))((char *)v12 + v105 + v53 * v51, v49, v107);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      ((void (*)(uint64_t *, _QWORD))v23)(&v114, 0);
      v32 = v111;
    }
  }
  v54 = v32 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers;
  swift_beginAccess();
  v55 = *(char **)v54;
  v56 = *(_QWORD *)(*(_QWORD *)v54 + 64);
  v99 = *(_QWORD *)v54 + 64;
  v57 = 1 << v55[32];
  v58 = -1;
  if (v57 < 64)
    v58 = ~(-1 << v57);
  v59 = v58 & v56;
  v100 = (unint64_t)(v57 + 63) >> 6;
  v101 = v55;
  swift_bridgeObjectRetain();
  v60 = 0;
  while (1)
  {
    if (v59)
    {
      v61 = __clz(__rbit64(v59));
      v62 = (v59 - 1) & v59;
      v63 = v61 | (v60 << 6);
      goto LABEL_53;
    }
    v64 = v60 + 1;
    if (__OFADD__(v60, 1))
      break;
    if (v64 >= v100)
      goto LABEL_91;
    v65 = *(_QWORD *)(v99 + 8 * v64);
    ++v60;
    if (!v65)
    {
      v60 = v64 + 1;
      if (v64 + 1 >= v100)
        goto LABEL_91;
      v65 = *(_QWORD *)(v99 + 8 * v60);
      if (!v65)
      {
        v60 = v64 + 2;
        if (v64 + 2 >= v100)
          goto LABEL_91;
        v65 = *(_QWORD *)(v99 + 8 * v60);
        if (!v65)
        {
          v66 = v64 + 3;
          if (v66 >= v100)
          {
LABEL_91:
            swift_release();
            v40 = v109;
            goto LABEL_21;
          }
          v65 = *(_QWORD *)(v99 + 8 * v66);
          if (!v65)
          {
            while (1)
            {
              v60 = v66 + 1;
              if (__OFADD__(v66, 1))
                break;
              if (v60 >= v100)
                goto LABEL_91;
              v65 = *(_QWORD *)(v99 + 8 * v60);
              ++v66;
              if (v65)
                goto LABEL_52;
            }
            __break(1u);
            goto LABEL_95;
          }
          v60 = v66;
        }
      }
    }
LABEL_52:
    v62 = (v65 - 1) & v65;
    v63 = __clz(__rbit64(v65)) + (v60 << 6);
LABEL_53:
    v102 = v62;
    v103 = v60;
    v67 = (uint64_t *)(*((_QWORD *)v101 + 6) + 16 * v63);
    v69 = *v67;
    v68 = v67[1];
    v10 = *(_QWORD **)(*((_QWORD *)v101 + 7) + 8 * v63);
    v22 = (uint64_t *)v10[2];
    v110 = *v67;
    v111 = v68;
    if (v22)
    {
      sub_22DDA492C(v69, v68);
      swift_bridgeObjectRetain();
      v70 = v10 + 5;
      v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v27 = *(v70 - 1);
        v73 = *v70;
        v74 = HIBYTE(*v70) & 0xF;
        if ((*v70 & 0x2000000000000000) == 0)
          v74 = v27 & 0xFFFFFFFFFFFFLL;
        if (v74)
        {
          swift_bridgeObjectRetain();
          v75 = swift_isUniquelyReferenced_nonNull_native();
          v114 = (uint64_t)v12;
          if ((v75 & 1) == 0)
          {
            v23 = &v114;
            sub_22DE0F280(0, v12[2] + 1, 1);
            v12 = (_QWORD *)v114;
          }
          v9 = v12[2];
          v71 = v12[3];
          if (v9 >= v71 >> 1)
          {
            v23 = &v114;
            sub_22DE0F280(v71 > 1, v9 + 1, 1);
            v12 = (_QWORD *)v114;
          }
          v12[2] = v9 + 1;
          v72 = &v12[2 * v9];
          v72[4] = v27;
          v72[5] = v73;
        }
        v70 += 2;
        v22 = (uint64_t *)((char *)v22 - 1);
      }
      while (v22);
      swift_bridgeObjectRelease();
      v69 = v110;
      v76 = v111;
    }
    else
    {
      v76 = v68;
      sub_22DDA492C(v69, v68);
      v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v77 = v12[2];
    v104 = 8 * v76;
    if (v77 > 1)
    {
      v27 = 0;
      v22 = v12 + 5;
      do
      {
        v10 = (_QWORD *)*v22;
        v78 = qword_255DB5378;
        swift_bridgeObjectRetain();
        if (v78 != -1)
          swift_once();
        v114 = 0x6E6F697473657571;
        v115 = 0xEA00000000005B73;
        v113 = v27;
        sub_22DE1F8C8();
        sub_22DE1F328();
        swift_bridgeObjectRelease();
        sub_22DE1F328();
        v9 = v69;
        if (v111 <= 2)
          v9 = *(_QWORD *)&aTitle_7[v104];
        sub_22DDA492C(v69, v111);
        sub_22DE1F328();
        swift_bridgeObjectRelease();
        sub_22DE1F328();
        v23 = (uint64_t *)sub_22DE1DE28();
        if (*v79)
        {
          v9 = (unint64_t)v79;
          sub_22DE1DDF8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v80 = *(_QWORD *)v9;
          v81 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)v9 = v80;
          if ((v81 & 1) == 0)
          {
            v80 = sub_22DDFCAF8(0, *(_QWORD *)(v80 + 16) + 1, 1, v80, &qword_255DB9878, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
            *(_QWORD *)v9 = v80;
          }
          v83 = *(_QWORD *)(v80 + 16);
          v82 = *(_QWORD *)(v80 + 24);
          v84 = v106;
          if (v83 >= v82 >> 1)
          {
            v85 = sub_22DDFCAF8(v82 > 1, v83 + 1, 1, v80, &qword_255DB9878, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
            v84 = v106;
            v80 = v85;
            *(_QWORD *)v9 = v85;
          }
          *(_QWORD *)(v80 + 16) = v83 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v108 + 32))(v80 + v105 + v83 * v84, v112, v107);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        ((void (*)(uint64_t *, _QWORD))v23)(&v114, 0);
        ++v27;
        v22 += 2;
        v69 = v110;
      }
      while (v77 != v27);
LABEL_35:
      swift_release();
      sub_22DDA40E0(v69, v111);
      goto LABEL_36;
    }
    if (!v77)
      goto LABEL_35;
    v10 = (_QWORD *)v12[4];
    swift_bridgeObjectRetain();
    swift_release();
    if (qword_255DB5370 != -1)
      swift_once();
    v114 = 0x6E6F697473657571;
    v115 = 0xE90000000000005BLL;
    v22 = (uint64_t *)v111;
    sub_22DDA492C(v69, v111);
    sub_22DE1F328();
    swift_bridgeObjectRelease();
    sub_22DDA40E0(v69, (unint64_t)v22);
    sub_22DE1F328();
    v12 = (_QWORD *)v114;
    v23 = (uint64_t *)sub_22DE1DE28();
    if (*v86)
    {
      v22 = v86;
      sub_22DE1DDF8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = (_QWORD *)*v22;
      v87 = swift_isUniquelyReferenced_nonNull_native();
      *v22 = (uint64_t)v12;
      if ((v87 & 1) == 0)
      {
        v12 = (_QWORD *)sub_22DDFCAF8(0, v12[2] + 1, 1, (unint64_t)v12, &qword_255DB9878, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
        *v22 = (uint64_t)v12;
      }
      v89 = v12[2];
      v88 = v12[3];
      v90 = v106;
      if (v89 >= v88 >> 1)
      {
        v91 = sub_22DDFCAF8(v88 > 1, v89 + 1, 1, (unint64_t)v12, &qword_255DB9878, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
        v90 = v106;
        v12 = (_QWORD *)v91;
        *v22 = v91;
      }
      v12[2] = v89 + 1;
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))((char *)v12 + v105 + v89 * v90, v98, v107);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    ((void (*)(uint64_t *, _QWORD))v23)(&v114, 0);
LABEL_36:
    v60 = v103;
    v59 = v102;
  }
  __break(1u);
LABEL_93:
  swift_once();
LABEL_20:
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22DE1DDF8();
  swift_bridgeObjectRelease();
  v40 = v109;
  sub_22DE1DE34();
LABEL_21:
  v41 = v95;
  v42 = v94;
  v43 = v96;
  (*(void (**)(char *, uint64_t *, uint64_t))(v95 + 16))(v94, v40, v96);
  sub_22DE1DE40();
  v44 = *(void (**)(char *, uint64_t))(v41 + 8);
  v44(v42, v43);
  return ((uint64_t (*)(uint64_t *, uint64_t))v44)(v40, v43);
}

void sub_22DDFB110()
{
  qword_255DB9798 = 0x64496D726F66;
  unk_255DB97A0 = 0xE600000000000000;
}

void sub_22DDFB130()
{
  qword_255DB97A8 = 1953722216;
  unk_255DB97B0 = 0xE400000000000000;
}

void sub_22DDFB14C()
{
  qword_255DB97B8 = 0x6D6E6F7269766E65;
  unk_255DB97C0 = 0xEB00000000746E65;
}

void sub_22DDFB178()
{
  strcpy((char *)&qword_255DB97C8, "formIdentifier");
  unk_255DB97D7 = -18;
}

void sub_22DDFB1A8()
{
  qword_255DB97D8 = 0x6D726F4667756C70;
  unk_255DB97E0 = 0xEB00000000736449;
}

void sub_22DDFB1D4()
{
  qword_255DB97E8 = 0x6E6F697473657571;
  unk_255DB97F0 = 0xE800000000000000;
}

void sub_22DDFB1F8()
{
  qword_255DB97F8 = 0x6E6F697473657571;
  unk_255DB9800 = 0xE900000000000073;
}

void sub_22DDFB220()
{
  qword_255DB9808 = 0x6E656B6F54707061;
  unk_255DB9810 = 0xE800000000000000;
}

uint64_t FBKFeedbackForm.__allocating_init(url:)(uint64_t a1)
{
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
  char *v13;
  id v14;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  unint64_t v47;
  char *v48;
  int64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  char v61;
  char v62;
  BOOL v63;
  int v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t *v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  int64_t v90;
  unint64_t v91;
  int64_t v92;
  uint64_t v93;
  uint64_t *v94;
  unint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  _QWORD *v104;
  unint64_t v105;
  unint64_t v106;
  _QWORD *v107;
  uint64_t *v108;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v110;
  char v111;
  unint64_t v112;
  uint64_t v113;
  _BOOL8 v114;
  uint64_t v115;
  char v116;
  unint64_t v117;
  char v118;
  uint64_t *v119;
  char v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  _BOOL8 v124;
  uint64_t v125;
  char v126;
  unint64_t v127;
  char v128;
  _QWORD *v129;
  _QWORD *v130;
  uint64_t v131;
  BOOL v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  int64_t v142;
  char *v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t *v147;
  unint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  char *v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t result;
  uint64_t v158;
  uint64_t v159;
  int64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  int64_t v164;
  char *v165;
  uint64_t v166;
  char *v167;
  char *v168;
  id v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  __int128 v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  char v186;
  char v187;
  unint64_t v188;
  unint64_t v189;

  v173 = sub_22DE1DFB4();
  v171 = *(_QWORD *)(v173 - 8);
  MEMORY[0x24BDAC7A8](v173);
  v3 = (char *)&v158 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9818);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v158 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22DE1DE1C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v158 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v158 - v12;
  v14 = objc_allocWithZone(MEMORY[0x24BDD1808]);
  v172 = a1;
  v15 = (void *)sub_22DE1DF3C();
  v16 = (char *)objc_msgSend(v14, sel_initWithURL_resolvingAgainstBaseURL_, v15, 1);

  if (!v16)
    goto LABEL_197;
  v17 = objc_msgSend(v16, sel_queryItems);
  if (!v17)
    goto LABEL_196;
  v18 = v17;
  v19 = sub_22DE1F3D0();

  v20 = *(_QWORD *)(v19 + 16);
  v174 = v16;
  if (v20)
  {
    v179 = v6;
    v180 = v13;
    v21 = v19 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v22 = *(_QWORD *)(v8 + 72);
    v23 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    v181 = v19;
    swift_bridgeObjectRetain();
    while (1)
    {
      v23(v11, v21, v7);
      v24 = sub_22DE1DE04();
      v26 = v25;
      if (qword_255DB5360 != -1)
        swift_once();
      if (v24 == qword_255DB97C8 && v26 == unk_255DB97D0)
        break;
      v28 = sub_22DE1F8E0();
      swift_bridgeObjectRelease();
      if ((v28 & 1) != 0)
        goto LABEL_16;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      v21 += v22;
      if (!--v20)
      {
        swift_bridgeObjectRelease();
        v29 = 1;
        v16 = v174;
        v13 = v180;
        v6 = v179;
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
LABEL_16:
    swift_bridgeObjectRelease();
    v6 = v179;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v179, v11, v7);
    v29 = 0;
    v16 = v174;
    v13 = v180;
  }
  else
  {
    v29 = 1;
  }
LABEL_17:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v29, 1, v7);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22DDFF69C((uint64_t)v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    v30 = sub_22DE1DE10();
    if (v31)
    {
      v32 = v30;
      v33 = v31;
      v34 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm());
      v35 = FBKFeedbackForm.init(identifier:)(v32, v33);

      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v172, v173);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      return (uint64_t)v35;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  v36 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm());
  v37 = (char *)FBKFeedbackForm.init(identifier:)(0, 0xE000000000000000);
  v38 = objc_msgSend(v16, sel_queryItemsAsDictionary);
  v3 = (char *)MEMORY[0x24BEE0D00];
  v39 = sub_22DE1F244();

  v40 = v39 + 64;
  v41 = 1 << *(_BYTE *)(v39 + 32);
  if (v41 < 64)
    v42 = ~(-1 << v41);
  else
    v42 = -1;
  v181 = v42 & *(_QWORD *)(v39 + 64);
  v179 = &v37[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers];
  v43 = &v37[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken];
  v16 = &v37[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds];
  v44 = &v37[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host];
  v45 = &v37[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment];
  v169 = v37;
  v46 = &v37[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId];
  swift_beginAccess();
  v175 = v45;
  swift_beginAccess();
  v170 = v44;
  swift_beginAccess();
  v168 = v16;
  swift_beginAccess();
  v167 = v43;
  swift_beginAccess();
  v47 = v181;
  v48 = 0;
  v49 = (unint64_t)(v41 + 63) >> 6;
  v176 = xmmword_22DE20F30;
  v177 = v39 + 64;
  while (1)
  {
    if (v47)
    {
      v181 = (v47 - 1) & v47;
      v180 = v48;
      v50 = __clz(__rbit64(v47)) | ((_QWORD)v48 << 6);
      goto LABEL_44;
    }
    v51 = (int64_t)(v48 + 1);
    if (__OFADD__(v48, 1))
    {
      __break(1u);
LABEL_186:
      __break(1u);
      goto LABEL_187;
    }
    if (v51 >= v49)
      goto LABEL_183;
    v52 = *(_QWORD *)(v40 + 8 * v51);
    v53 = (int64_t)(v48 + 1);
    if (v52)
      goto LABEL_43;
    v53 = v51 + 1;
    if (v51 + 1 >= v49)
      goto LABEL_183;
    v52 = *(_QWORD *)(v40 + 8 * v53);
    if (v52)
      goto LABEL_43;
    v53 = v51 + 2;
    if (v51 + 2 >= v49)
      goto LABEL_183;
    v52 = *(_QWORD *)(v40 + 8 * v53);
    if (v52)
      goto LABEL_43;
    v54 = v51 + 3;
    if (v54 >= v49)
    {
LABEL_183:
      v35 = v169;

      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v172, v173);
      swift_release();
      return (uint64_t)v35;
    }
    v52 = *(_QWORD *)(v40 + 8 * v54);
    if (!v52)
    {
      while (1)
      {
        v53 = v54 + 1;
        if (__OFADD__(v54, 1))
          break;
        if (v53 >= v49)
          goto LABEL_183;
        v52 = *(_QWORD *)(v40 + 8 * v53);
        ++v54;
        if (v52)
          goto LABEL_43;
      }
LABEL_187:
      __break(1u);
LABEL_188:
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
      goto LABEL_193;
    }
    v53 = v54;
LABEL_43:
    v181 = (v52 - 1) & v52;
    v180 = (char *)v53;
    v50 = __clz(__rbit64(v52)) + (v53 << 6);
LABEL_44:
    v55 = (uint64_t *)(*(_QWORD *)(v39 + 48) + 16 * v50);
    v57 = *v55;
    v56 = v55[1];
    v16 = *(char **)(*(_QWORD *)(v39 + 56) + 8 * v50);
    v58 = qword_255DB5348;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    if (v58 != -1)
      swift_once();
    v59 = v57 == qword_255DB9798 && v56 == unk_255DB97A0;
    if (v59 || (sub_22DE1F8E0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v182 = (uint64_t)v16;
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v60 = sub_22DDFC874(v184, v185);
        v62 = v61;
        swift_unknownObjectRelease();
        *(_QWORD *)v46 = v60;
        v46[8] = v62 & 1;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (qword_255DB5358 != -1)
      swift_once();
    v63 = v57 == qword_255DB97B8 && v56 == unk_255DB97C0;
    if (v63 || (sub_22DE1F8E0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v182 = (uint64_t)v16;
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_22DE00258();
        v64 = sub_22DE1F5A4();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        v65 = v175;
        *(_WORD *)v175 = v64;
        v65[2] = BYTE2(v64) & 1;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (qword_255DB5350 != -1)
      swift_once();
    if (v57 == qword_255DB97A8 && v56 == unk_255DB97B0 || (sub_22DE1F8E0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v182 = (uint64_t)v16;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_27;
      v66 = v184;
      v67 = v185;
      v68 = &v187;
      goto LABEL_69;
    }
    if (qword_255DB5368 != -1)
      swift_once();
    if (v57 == qword_255DB97D8 && v56 == unk_255DB97E0 || (sub_22DE1F8E0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v182 = (uint64_t)v16;
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v182 = 44;
        v183 = 0xE100000000000000;
        sub_22DD50840();
        v70 = v3;
        v71 = sub_22DE1F640();
        swift_bridgeObjectRelease();
        v72 = *(_QWORD *)(v71 + 16);
        if (v72)
        {
          v164 = v49;
          v165 = v46;
          v166 = v39;
          swift_bridgeObjectRetain();
          v73 = (unint64_t *)(v71 + 40);
          v74 = (_QWORD *)MEMORY[0x24BEE4AF8];
          do
          {
            v75 = *(v73 - 1);
            v76 = *v73;
            swift_bridgeObjectRetain();
            v77 = sub_22DDFC874(v75, v76);
            if ((v78 & 1) == 0)
            {
              v79 = v77;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v74 = sub_22DDFD180(0, v74[2] + 1, 1, v74);
              v81 = v74[2];
              v80 = v74[3];
              if (v81 >= v80 >> 1)
                v74 = sub_22DDFD180((_QWORD *)(v80 > 1), v81 + 1, 1, v74);
              v74[2] = v81 + 1;
              v74[v81 + 4] = v79;
            }
            v73 += 2;
            --v72;
          }
          while (v72);
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease_n();
          v39 = v166;
          v46 = v165;
          v49 = v164;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          v74 = (_QWORD *)MEMORY[0x24BEE4AF8];
        }
        *(_QWORD *)v168 = v74;
        swift_bridgeObjectRelease();
        v3 = v70;
        v40 = v177;
        goto LABEL_27;
      }
LABEL_26:
      swift_unknownObjectRelease();
      goto LABEL_27;
    }
    if (qword_255DB5380 != -1)
      swift_once();
    if (v57 == qword_255DB9808 && v56 == unk_255DB9810 || (sub_22DE1F8E0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v182 = (uint64_t)v16;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_27;
      v66 = v184;
      v67 = v185;
      v68 = &v186;
LABEL_69:
      v69 = (uint64_t *)*((_QWORD *)v68 - 32);
      *v69 = v66;
      v69[1] = v67;
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    if (qword_255DB5378 != -1)
      swift_once();
    if (v57 == qword_255DB97F8 && v56 == unk_255DB9800 || (sub_22DE1F8E0() & 1) != 0)
      break;
    if (qword_255DB5370 != -1)
      swift_once();
    if (v57 == qword_255DB97E8 && v56 == unk_255DB97F0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v136 = sub_22DE1F8E0();
      swift_bridgeObjectRelease();
      if ((v136 & 1) == 0)
        goto LABEL_26;
    }
    v184 = (uint64_t)v16;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9820);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_26;
    v166 = v39;
    v137 = 0;
    v3 = (char *)v182;
    v138 = *(_QWORD *)(v182 + 64);
    v163 = v182 + 64;
    v139 = 1 << *(_BYTE *)(v182 + 32);
    if (v139 < 64)
      v140 = ~(-1 << v139);
    else
      v140 = -1;
    v141 = v140 & v138;
    v178 = (unint64_t)(v139 + 63) >> 6;
    while (1)
    {
      if (v141)
      {
        v142 = v49;
        v143 = v46;
        v144 = __clz(__rbit64(v141));
        v141 &= v141 - 1;
        v145 = v144 | (v137 << 6);
        goto LABEL_166;
      }
      v153 = v137 + 1;
      if (__OFADD__(v137, 1))
        goto LABEL_192;
      v154 = v3;
      v3 = (char *)MEMORY[0x24BEE0D00];
      v40 = v177;
      if (v153 >= v178)
        goto LABEL_182;
      v155 = *(_QWORD *)(v163 + 8 * v153);
      ++v137;
      if (!v155)
      {
        v137 = v153 + 1;
        if (v153 + 1 >= v178)
          goto LABEL_182;
        v155 = *(_QWORD *)(v163 + 8 * v137);
        if (!v155)
        {
          v137 = v153 + 2;
          if (v153 + 2 >= v178)
            goto LABEL_182;
          v155 = *(_QWORD *)(v163 + 8 * v137);
          if (!v155)
            break;
        }
      }
LABEL_181:
      v142 = v49;
      v143 = v46;
      v141 = (v155 - 1) & v155;
      v145 = __clz(__rbit64(v155)) + (v137 << 6);
      v3 = v154;
LABEL_166:
      v146 = 16 * v145;
      v147 = (uint64_t *)(*((_QWORD *)v3 + 6) + v146);
      v148 = v147[1];
      v149 = (uint64_t *)(*((_QWORD *)v3 + 7) + v146);
      v150 = *v149;
      v151 = v149[1];
      v184 = *v147;
      v185 = v148;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v184 = sub_22DE1F388();
      v185 = v152;
      sub_22DE0898C(&v184, v150, v151);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v46 = v143;
      v49 = v142;
    }
    v156 = v153 + 3;
    if (v156 >= v178)
      goto LABEL_182;
    v155 = *(_QWORD *)(v163 + 8 * v156);
    if (v155)
    {
      v137 = v156;
      goto LABEL_181;
    }
    while (1)
    {
      v137 = v156 + 1;
      if (__OFADD__(v156, 1))
        goto LABEL_194;
      if (v137 >= v178)
        break;
      v155 = *(_QWORD *)(v163 + 8 * v137);
      ++v156;
      if (v155)
        goto LABEL_181;
    }
LABEL_182:
    swift_unknownObjectRelease();
    swift_release();
    v39 = v166;
LABEL_27:
    v47 = v181;
    v48 = v180;
  }
  swift_bridgeObjectRelease();
  v184 = (uint64_t)v16;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C20);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_26;
  v82 = 0;
  v83 = v182;
  v84 = *(_QWORD *)(v182 + 64);
  v159 = v182 + 64;
  v85 = 1 << *(_BYTE *)(v182 + 32);
  if (v85 < 64)
    v86 = ~(-1 << v85);
  else
    v86 = -1;
  v87 = v86 & v84;
  v160 = (unint64_t)(v85 + 63) >> 6;
  v166 = v39;
  v165 = v46;
  v164 = v49;
  v158 = v182;
LABEL_106:
  while (2)
  {
    if (v87)
    {
      v88 = __clz(__rbit64(v87));
      v87 &= v87 - 1;
      v89 = v88 | (v82 << 6);
      goto LABEL_122;
    }
    v90 = v82 + 1;
    if (__OFADD__(v82, 1))
      goto LABEL_191;
    v3 = (char *)MEMORY[0x24BEE0D00];
    if (v90 >= v160)
    {
LABEL_158:
      swift_unknownObjectRelease();
      swift_release();
      goto LABEL_27;
    }
    v91 = *(_QWORD *)(v159 + 8 * v90);
    ++v82;
    if (v91)
      goto LABEL_121;
    v82 = v90 + 1;
    if (v90 + 1 >= v160)
      goto LABEL_158;
    v91 = *(_QWORD *)(v159 + 8 * v82);
    if (v91)
      goto LABEL_121;
    v82 = v90 + 2;
    if (v90 + 2 >= v160)
      goto LABEL_158;
    v91 = *(_QWORD *)(v159 + 8 * v82);
    if (v91)
    {
LABEL_121:
      v87 = (v91 - 1) & v91;
      v89 = __clz(__rbit64(v91)) + (v82 << 6);
LABEL_122:
      v93 = *(_QWORD *)(*(_QWORD *)(v83 + 56) + 8 * v89);
      v3 = *(char **)(v93 + 16);
      if (!v3)
        continue;
      v162 = v87;
      v163 = v82;
      v94 = (uint64_t *)(*(_QWORD *)(v83 + 48) + 16 * v89);
      v95 = v94[1];
      v178 = *v94;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_beginAccess();
      v161 = v93;
      v96 = (uint64_t *)(v93 + 40);
      while (1)
      {
        v99 = *(v96 - 1);
        v98 = *v96;
        v100 = *(_QWORD *)v179;
        v101 = *(_QWORD *)(*(_QWORD *)v179 + 16);
        swift_bridgeObjectRetain();
        if (v101)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v102 = sub_22DDFD4E4(v178, v95);
          if ((v103 & 1) != 0)
          {
            v104 = *(_QWORD **)(*(_QWORD *)(v100 + 56) + 8 * v102);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v104 = sub_22DDFCF68(0, v104[2] + 1, 1, v104);
            v106 = v104[2];
            v105 = v104[3];
            if (v106 >= v105 >> 1)
              v104 = sub_22DDFCF68((_QWORD *)(v105 > 1), v106 + 1, 1, v104);
            v104[2] = v106 + 1;
            v107 = &v104[2 * v106];
            v107[4] = v99;
            v107[5] = v98;
            v108 = (uint64_t *)v179;
            swift_beginAccess();
            swift_bridgeObjectRetain();
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v182 = *v108;
            v110 = v182;
            *v108 = 0x8000000000000000;
            v112 = sub_22DDFD4E4(v178, v95);
            v113 = *(_QWORD *)(v110 + 16);
            v114 = (v111 & 1) == 0;
            v115 = v113 + v114;
            if (__OFADD__(v113, v114))
              goto LABEL_189;
            v116 = v111;
            if (*(_QWORD *)(v110 + 24) >= v115)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                sub_22DE000A4();
            }
            else
            {
              sub_22DDFEA2C(v115, isUniquelyReferenced_nonNull_native);
              v117 = sub_22DDFD4E4(v178, v95);
              if ((v116 & 1) != (v118 & 1))
                goto LABEL_195;
              v112 = v117;
            }
            v129 = (_QWORD *)v182;
            if ((v116 & 1) == 0)
            {
              *(_QWORD *)(v182 + 8 * (v112 >> 6) + 64) |= 1 << v112;
              v134 = (_QWORD *)(v129[6] + 16 * v112);
              *v134 = v178;
              v134[1] = v95;
              *(_QWORD *)(v129[7] + 8 * v112) = v104;
              v135 = v129[2];
              v132 = __OFADD__(v135, 1);
              v133 = v135 + 1;
              if (v132)
                goto LABEL_190;
              goto LABEL_152;
            }
            goto LABEL_124;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9BD0);
        v104 = (_QWORD *)swift_allocObject();
        *((_OWORD *)v104 + 1) = v176;
        v104[4] = v99;
        v104[5] = v98;
        v119 = (uint64_t *)v179;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v120 = swift_isUniquelyReferenced_nonNull_native();
        v182 = *v119;
        v121 = v182;
        *v119 = 0x8000000000000000;
        v112 = sub_22DDFD4E4(v178, v95);
        v123 = *(_QWORD *)(v121 + 16);
        v124 = (v122 & 1) == 0;
        v125 = v123 + v124;
        if (__OFADD__(v123, v124))
          goto LABEL_186;
        v126 = v122;
        if (*(_QWORD *)(v121 + 24) >= v125)
        {
          if ((v120 & 1) == 0)
            sub_22DE000A4();
        }
        else
        {
          sub_22DDFEA2C(v125, v120);
          v127 = sub_22DDFD4E4(v178, v95);
          if ((v126 & 1) != (v128 & 1))
            goto LABEL_195;
          v112 = v127;
        }
        v129 = (_QWORD *)v182;
        if ((v126 & 1) == 0)
        {
          *(_QWORD *)(v182 + 8 * (v112 >> 6) + 64) |= 1 << v112;
          v130 = (_QWORD *)(v129[6] + 16 * v112);
          *v130 = v178;
          v130[1] = v95;
          *(_QWORD *)(v129[7] + 8 * v112) = v104;
          v131 = v129[2];
          v132 = __OFADD__(v131, 1);
          v133 = v131 + 1;
          if (v132)
            goto LABEL_188;
LABEL_152:
          v129[2] = v133;
          swift_bridgeObjectRetain();
          goto LABEL_125;
        }
LABEL_124:
        v97 = v129[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v97 + 8 * v112) = v104;
LABEL_125:
        *(_QWORD *)v179 = v129;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        v40 = v177;
        v96 += 2;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!--v3)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v39 = v166;
          v46 = v165;
          v49 = v164;
          v83 = v158;
          v82 = v163;
          v87 = v162;
          goto LABEL_106;
        }
      }
    }
    break;
  }
  v92 = v90 + 3;
  if (v92 >= v160)
    goto LABEL_158;
  v91 = *(_QWORD *)(v159 + 8 * v92);
  if (v91)
  {
    v82 = v92;
    goto LABEL_121;
  }
  while (1)
  {
    v82 = v92 + 1;
    if (__OFADD__(v92, 1))
      break;
    if (v82 >= v160)
      goto LABEL_158;
    v91 = *(_QWORD *)(v159 + 8 * v82);
    ++v92;
    if (v91)
      goto LABEL_121;
  }
LABEL_193:
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  sub_22DE1F91C();
  __break(1u);
LABEL_196:

LABEL_197:
  (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v3, v172, v173);
  v188 = 0;
  v189 = 0xE000000000000000;
  sub_22DE1F730();
  swift_bridgeObjectRelease();
  v188 = 0xD000000000000026;
  v189 = 0x800000022DE2CB30;
  sub_22DD504A8((unint64_t *)&qword_255DB7D78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  sub_22DE1F8C8();
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  result = sub_22DE1F7CC();
  __break(1u);
  return result;
}

unint64_t sub_22DDFC874(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  _QWORD v23[3];

  v4 = HIBYTE(a2) & 0xF;
  v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    v8 = (unint64_t)sub_22DE00680(a1, a2, 10);
    v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)sub_22DE1F76C();
    v8 = (unint64_t)sub_22DE00764(v7, v5, 10);
    v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4)
      goto LABEL_52;
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u)
      goto LABEL_36;
    v8 = (BYTE1(a1) - 48);
    v15 = v4 - 2;
    if (v15)
    {
      v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        v17 = *v16 - 48;
        if (v17 > 9)
          goto LABEL_36;
        if (!is_mul_ok(v8, 0xAuLL))
          goto LABEL_36;
        v14 = __CFADD__(10 * v8, v17);
        v8 = 10 * v8 + v17;
        if (v14)
          goto LABEL_36;
        v10 = 0;
        ++v16;
        if (!--v15)
          goto LABEL_39;
      }
    }
LABEL_38:
    v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u)
      goto LABEL_36;
    v8 = (a1 - 48);
    v18 = v4 - 1;
    if (v18)
    {
      v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        v21 = *v20 - 48;
        if (v21 > 9)
          goto LABEL_36;
        if (!is_mul_ok(v8, 0xAuLL))
          goto LABEL_36;
        v14 = __CFADD__(10 * v8, v21);
        v8 = 10 * v8 + v21;
        if (v14)
          goto LABEL_36;
        v10 = 0;
        ++v20;
        if (!--v18)
          goto LABEL_39;
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      v2 = 0;
      v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        v11 = v4 - 2;
        if (v11)
        {
          v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            v13 = *v12 - 48;
            if (v13 > 9)
              goto LABEL_36;
            if (!is_mul_ok(v8, 0xAuLL))
              goto LABEL_36;
            v14 = 10 * v8 >= v13;
            v8 = 10 * v8 - v13;
            if (!v14)
              goto LABEL_36;
            v10 = 0;
            ++v12;
            if (!--v11)
              goto LABEL_39;
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    v8 = 0;
    v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  v10 = 1;
  v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    return 0;
  else
    return v8;
}

uint64_t sub_22DDFCAD0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22DDFCAF8(a1, a2, a3, a4, &qword_255DB9838, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
}

uint64_t sub_22DDFCAE4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22DDFCAF8(a1, a2, a3, a4, (uint64_t *)&unk_255DBA070, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Message);
}

uint64_t sub_22DDFCAF8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_22DE1F7C0();
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
    sub_22DE01170(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_22DDFCD04(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22DDFCAF8(a1, a2, a3, a4, &qword_255DB9830, type metadata accessor for BatchInteraction);
}

uint64_t sub_22DDFCD18(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22DDFCAF8(a1, a2, a3, a4, &qword_255DB9898, (uint64_t (*)(_QWORD))type metadata accessor for URLError);
}

uint64_t sub_22DDFCD2C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22DDFCAF8(a1, a2, a3, a4, &qword_255DB9858, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

_QWORD *sub_22DDFCD40(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9890);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22DE00E9C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_22DDFCE4C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9880);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
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
    sub_22DE00F8C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_22DDFCF68(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9BD0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
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
    sub_22DE01080(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_22DDFD074(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9848);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22DE01288(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_22DDFD180(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9FF0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22DE01390(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_22DDFD28C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7DA8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22DDFD2F0(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_22DE1F37C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x22E31FBD4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_22DDFD368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22DE1F964();
  sub_22DE1F310();
  v4 = sub_22DE1F97C();
  return sub_22DDFD678(a1, a2, v4);
}

unint64_t sub_22DDFD3CC(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_22DE1E050();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_22DD504A8(&qword_255DB5D30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v3 = sub_22DE1F25C();
  return sub_22DDFDB50(a1, v3, v2, &qword_255DB9828, MEMORY[0x24BDCEA98]);
}

unint64_t sub_22DDFD464(uint64_t a1)
{
  uint64_t v2;

  sub_22DE1F2B0();
  sub_22DE1F964();
  sub_22DE1F310();
  v2 = sub_22DE1F97C();
  swift_bridgeObjectRelease();
  return sub_22DDFD758(a1, v2);
}

unint64_t sub_22DDFD4E4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_22DE1F964();
  sub_22DE1F970();
  if (a2 > 2)
    sub_22DE1F310();
  v4 = sub_22DE1F97C();
  return sub_22DDFD8CC(a1, a2, v4);
}

unint64_t sub_22DDFD584(char a1)
{
  char v1;
  uint64_t v2;

  v1 = a1 & 1;
  sub_22DE1F964();
  sub_22DE1F970();
  v2 = sub_22DE1F97C();
  return sub_22DDFDA94(v1, v2);
}

unint64_t sub_22DDFD5E0(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_22DE1E2CC();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE31270];
  sub_22DD504A8(&qword_255DB9660, (uint64_t (*)(uint64_t))MEMORY[0x24BE31270], MEMORY[0x24BE31280]);
  v3 = sub_22DE1F25C();
  return sub_22DDFDB50(a1, v3, v2, &qword_255DB9870, MEMORY[0x24BE31288]);
}

unint64_t sub_22DDFD678(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22DE1F8E0() & 1) == 0)
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
      while (!v14 && (sub_22DE1F8E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22DDFD758(uint64_t a1, uint64_t a2)
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
    v6 = sub_22DE1F2B0();
    v8 = v7;
    if (v6 == sub_22DE1F2B0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22DE1F8E0();
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
          v13 = sub_22DE1F2B0();
          v15 = v14;
          if (v13 == sub_22DE1F2B0() && v15 == v16)
            break;
          v18 = sub_22DE1F8E0();
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

unint64_t sub_22DDFD8CC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v13;
  uint64_t v14;
  unint64_t v15;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
    return v5;
  v8 = ~v4;
  while (1)
  {
    v9 = *(_QWORD *)(v3 + 48) + 16 * v5;
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)(v9 + 8);
    switch(v11)
    {
      case 0uLL:
        if (!a2)
        {
          v14 = *(_QWORD *)v9;
          v15 = 0;
          goto LABEL_24;
        }
        goto LABEL_13;
      case 1uLL:
        if (a2 == 1)
        {
          v14 = *(_QWORD *)v9;
          v15 = 1;
          goto LABEL_24;
        }
        goto LABEL_13;
      case 2uLL:
        if (a2 == 2)
        {
          v14 = *(_QWORD *)v9;
          v15 = 2;
          goto LABEL_24;
        }
LABEL_13:
        sub_22DDA492C(*(_QWORD *)v9, *(_QWORD *)(v9 + 8));
        sub_22DDA492C(a1, a2);
        sub_22DDA40E0(v10, v11);
        sub_22DDA40E0(a1, a2);
        goto LABEL_14;
    }
    if (a2 < 3)
      goto LABEL_13;
    if (v10 == a1 && v11 == a2)
      break;
    v13 = sub_22DE1F8E0();
    sub_22DDA492C(v10, v11);
    sub_22DDA492C(a1, a2);
    sub_22DDA40E0(v10, v11);
    sub_22DDA40E0(a1, a2);
    if ((v13 & 1) != 0)
      return v5;
LABEL_14:
    v5 = (v5 + 1) & v8;
    if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      return v5;
  }
  sub_22DDA492C(a1, a2);
  sub_22DDA492C(a1, a2);
  v14 = a1;
  v15 = a2;
LABEL_24:
  sub_22DDA40E0(v14, v15);
  sub_22DDA40E0(a1, a2);
  return v5;
}

unint64_t sub_22DDFDA94(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_22DDFDB50(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_22DD504A8(v21, v20, v22);
      v17 = sub_22DE1F280();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

uint64_t sub_22DDFDC80(uint64_t a1, int a2)
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
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_22DE1E050();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9FE0);
  v42 = a2;
  v10 = sub_22DE1F7F0();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_22DD504A8(&qword_255DB5D30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_22DE1F25C();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_22DDFE014(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9850);
  v36 = a2;
  v6 = sub_22DE1F7F0();
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
    sub_22DE1F964();
    sub_22DE1F310();
    result = sub_22DE1F97C();
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

uint64_t sub_22DDFE328(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
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
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_22DE1DFB4();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB98A0);
  v43 = a2;
  v8 = sub_22DE1F7F0();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_22DE1F964();
      sub_22DE1F310();
      result = sub_22DE1F97C();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_22DDFE690(uint64_t a1, char a2)
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
  uint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9888);
  v45 = a2;
  v6 = sub_22DE1F7F0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v43 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v41 = v3;
  v42 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  v44 = v5;
  while (1)
  {
    if (v10)
    {
      v46 = (v10 - 1) & v10;
      v47 = v13;
      v20 = __clz(__rbit64(v10)) | (v13 << 6);
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
    if (v21 >= v42)
      break;
    v22 = v43;
    v23 = v43[v21];
    v24 = v13 + 1;
    if (!v23)
    {
      v24 = v13 + 2;
      if (v13 + 2 >= v42)
        goto LABEL_33;
      v23 = v43[v24];
      if (!v23)
      {
        v25 = v13 + 3;
        if (v13 + 3 >= v42)
        {
LABEL_33:
          swift_release();
          v3 = v41;
          if ((v45 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = v43[v25];
        if (!v23)
        {
          while (1)
          {
            v24 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v24 >= v42)
              goto LABEL_33;
            v23 = v43[v24];
            ++v25;
            if (v23)
              goto LABEL_30;
          }
        }
        v24 = v13 + 3;
      }
    }
LABEL_30:
    v46 = (v23 - 1) & v23;
    v47 = v24;
    v20 = __clz(__rbit64(v23)) + (v24 << 6);
LABEL_31:
    v30 = *(_QWORD *)(v5 + 56);
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v32 = *v31;
    v33 = v31[1];
    v34 = (uint64_t *)(v30 + (v20 << 6));
    v35 = v34[1];
    v48 = *v34;
    v36 = v34[3];
    v50 = v34[2];
    v49 = *((_BYTE *)v34 + 32);
    v37 = v34[5];
    v38 = *((_BYTE *)v34 + 48);
    v39 = v34[7];
    if ((v45 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22DDAA44C(v37, v38);
      swift_bridgeObjectRetain();
    }
    sub_22DE1F964();
    sub_22DE1F310();
    result = sub_22DE1F97C();
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
    v18[1] = v33;
    v19 = *(_QWORD *)(v7 + 56) + (v17 << 6);
    v13 = v47;
    *(_QWORD *)v19 = v48;
    *(_QWORD *)(v19 + 8) = v35;
    *(_QWORD *)(v19 + 16) = v50;
    *(_QWORD *)(v19 + 24) = v36;
    *(_BYTE *)(v19 + 32) = v49;
    *(_QWORD *)(v19 + 40) = v37;
    *(_BYTE *)(v19 + 48) = v38;
    *(_QWORD *)(v19 + 56) = v39;
    ++*(_QWORD *)(v7 + 16);
    v5 = v44;
    v10 = v46;
  }
  swift_release();
  v3 = v41;
  v22 = v43;
  if ((v45 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v40 = 1 << *(_BYTE *)(v5 + 32);
  if (v40 >= 64)
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v40;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_22DDFEA2C(uint64_t a1, char a2)
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
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  __int128 v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9860);
  v6 = sub_22DE1F7F0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v31 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v30 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v17 >= v30)
          goto LABEL_35;
        v18 = v31[v17];
        ++v13;
        if (!v18)
        {
          v13 = v17 + 1;
          if (v17 + 1 >= v30)
            goto LABEL_35;
          v18 = v31[v13];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v30)
            {
LABEL_35:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v29 = 1 << *(_BYTE *)(v5 + 32);
                if (v29 >= 64)
                  bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v31 = -1 << v29;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v13 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_42;
                if (v13 >= v30)
                  goto LABEL_35;
                v18 = v31[v13];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v13 = v19;
          }
        }
LABEL_21:
        v10 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
      v32 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v16);
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v16 + 8);
      if ((a2 & 1) == 0)
      {
        sub_22DDA492C(v32, v21);
        swift_bridgeObjectRetain();
      }
      sub_22DE1F964();
      sub_22DE1F970();
      if (v21 > 2)
        sub_22DE1F310();
      result = sub_22DE1F97C();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_OWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14) = v32;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v14) = v20;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_22DDFED64(uint64_t a1, char a2)
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
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9840);
  result = sub_22DE1F7F0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v29 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
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
        if (v20 >= v12)
          goto LABEL_33;
        v21 = v29[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v12)
            goto LABEL_33;
          v21 = v29[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v29 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v29[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v12)
                  goto LABEL_33;
                v21 = v29[v8];
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
      v27 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v19);
      v30 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_22DE1F964();
      sub_22DE1F970();
      result = sub_22DE1F97C();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v17) = v27;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v17) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_22DDFF044(uint64_t a1, int a2)
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
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_22DE1E2CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9868);
  v42 = a2;
  v10 = sub_22DE1F7F0();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_22DD504A8(&qword_255DB9660, (uint64_t (*)(uint64_t))MEMORY[0x24BE31270], MEMORY[0x24BE31280]);
    result = sub_22DE1F25C();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_22DDFF3D8(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
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
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v5 = v4;
  v10 = *v4;
  v12 = sub_22DDFD368(a2, a3);
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
    sub_22DDFFE84();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_22DE014C4((uint64_t)a1, v18[7] + (v12 << 6));
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = (_OWORD *)(v18[7] + (v12 << 6));
    v24 = *a1;
    v25 = a1[1];
    v26 = a1[3];
    v23[2] = a1[2];
    v23[3] = v26;
    *v23 = v24;
    v23[1] = v25;
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
  sub_22DDFE690(v15, a4 & 1);
  v20 = sub_22DDFD368(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_22DE014C4((uint64_t)a1, v18[7] + (v12 << 6));
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22DE1F91C();
  __break(1u);
  return result;
}

uint64_t sub_22DDFF53C(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
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
  v12 = sub_22DDFD4E4(a2, a3);
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
    sub_22DE000A4();
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
      return sub_22DDA492C(a2, a3);
    }
    goto LABEL_14;
  }
  sub_22DDFEA2C(v15, a4 & 1);
  v21 = sub_22DDFD4E4(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22DE1F91C();
  __break(1u);
  return result;
}

uint64_t sub_22DDFF69C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9818);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DDFF6DC(uint64_t a1, uint64_t a2, char a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  char v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v9 = a3 & 1;
  v10 = (_QWORD *)*v4;
  v12 = sub_22DDFD584(a3 & 1);
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
        v19 = (uint64_t *)(v18[7] + 16 * v12);
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        *v19 = a1;
        v19[1] = a2;
        return result;
      }
      return sub_22DDFF800(v12, v9, a1, a2, v18);
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22DE00294();
      goto LABEL_7;
    }
    sub_22DDFED64(v15, a4 & 1);
    v21 = sub_22DDFD584(v9);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
      return sub_22DDFF800(v12, v9, a1, a2, v18);
    }
  }
  result = sub_22DE1F91C();
  __break(1u);
  return result;
}

unint64_t sub_22DDFF800(unint64_t result, char a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a5[6] + result) = a2 & 1;
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

id sub_22DDFF84C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_22DE1E050();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9FE0);
  v24 = v0;
  v5 = *v0;
  v6 = sub_22DE1F7E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22DDFFA74()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9850);
  v2 = *v0;
  v3 = sub_22DE1F7E4();
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

void *sub_22DDFFC28()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_22DE1DFB4();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB98A0);
  v31 = v0;
  v4 = *v0;
  v5 = sub_22DE1F7E4();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_22DDFFE84()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unsigned __int8 v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t *v33;
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9888);
  v33 = v0;
  v1 = *v0;
  v2 = sub_22DE1F7E4();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v33 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v34 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    v30 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v30 >= v11)
      goto LABEL_26;
    v31 = *(_QWORD *)(v34 + 8 * v30);
    ++v7;
    if (!v31)
    {
      v7 = v30 + 1;
      if (v30 + 1 >= v11)
        goto LABEL_26;
      v31 = *(_QWORD *)(v34 + 8 * v7);
      if (!v31)
        break;
    }
LABEL_25:
    v10 = (v31 - 1) & v31;
    v13 = __clz(__rbit64(v31)) + (v7 << 6);
LABEL_12:
    v14 = 16 * v13;
    v15 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v13);
    v17 = *v15;
    v16 = v15[1];
    v18 = v13 << 6;
    v19 = *(_QWORD *)(v1 + 56) + v18;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 16);
    v23 = *(_QWORD *)(v19 + 24);
    v24 = *(_BYTE *)(v19 + 32);
    v25 = *(_QWORD *)(v19 + 40);
    v26 = *(_QWORD *)(v19 + 56);
    v27 = (_QWORD *)(*(_QWORD *)(v3 + 48) + v14);
    v28 = *(_BYTE *)(v19 + 48);
    *v27 = v17;
    v27[1] = v16;
    v29 = *(_QWORD *)(v3 + 56) + v18;
    *(_QWORD *)v29 = v20;
    *(_QWORD *)(v29 + 8) = v21;
    *(_QWORD *)(v29 + 16) = v22;
    *(_QWORD *)(v29 + 24) = v23;
    *(_BYTE *)(v29 + 32) = v24;
    *(_QWORD *)(v29 + 40) = v25;
    *(_BYTE *)(v29 + 48) = v28;
    *(_QWORD *)(v29 + 56) = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22DDAA44C(v25, v28);
    result = (void *)swift_bridgeObjectRetain();
  }
  v32 = v30 + 2;
  if (v32 >= v11)
    goto LABEL_26;
  v31 = *(_QWORD *)(v34 + 8 * v32);
  if (v31)
  {
    v7 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v7 >= v11)
      goto LABEL_26;
    v31 = *(_QWORD *)(v34 + 8 * v7);
    ++v32;
    if (v31)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22DE000A4()
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
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9860);
  v2 = *v0;
  v3 = sub_22DE1F7E4();
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
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v18);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v18) = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    sub_22DDA492C(v19, *((unint64_t *)&v19 + 1));
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

unint64_t sub_22DE00258()
{
  unint64_t result;

  result = qword_255DB8980;
  if (!qword_255DB8980)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DB8980);
  }
  return result;
}

void *sub_22DE00294()
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

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9840);
  v2 = *v0;
  v3 = sub_22DE1F7E4();
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
    v16 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15) = v16;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_22DE00450()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_22DE1E2CC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9868);
  v24 = v0;
  v5 = *v0;
  v6 = sub_22DE1F7E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unsigned __int8 *sub_22DE00680(uint64_t a1, uint64_t a2, int64_t a3)
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
  v5 = sub_22DE1F388();
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
  v5 = sub_22DE009E0();
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
    v7 = (unsigned __int8 *)sub_22DE1F76C();
  }
LABEL_7:
  v11 = sub_22DE00764(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_22DE00764(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  unint64_t v13;
  unsigned __int8 v14;
  BOOL v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unint64_t v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

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
              if (!is_mul_ok(v9, a3))
                return 0;
              v13 = v9 * a3;
              v14 = v11 + v12;
              v15 = v13 >= v14;
              v9 = v13 - v14;
              if (!v15)
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
      goto LABEL_66;
    }
    if (a2)
    {
      v25 = a3 + 48;
      v26 = a3 + 55;
      v27 = a3 + 87;
      if (a3 > 10)
      {
        v25 = 58;
      }
      else
      {
        v27 = 97;
        v26 = 65;
      }
      if (result)
      {
        v28 = 0;
        do
        {
          v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27)
                return 0;
              v30 = -87;
            }
            else
            {
              v30 = -55;
            }
          }
          else
          {
            v30 = -48;
          }
          if (!is_mul_ok(v28, a3))
            return 0;
          v31 = v28 * a3;
          v32 = v29 + v30;
          v15 = __CFADD__(v31, v32);
          v28 = v31 + v32;
          if (v15)
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v16 = a2 - 1;
  if (a2 == 1)
    return 0;
  v17 = a3 + 48;
  v18 = a3 + 55;
  v19 = a3 + 87;
  if (a3 > 10)
  {
    v17 = 58;
  }
  else
  {
    v19 = 97;
    v18 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v20 = result + 1;
  do
  {
    v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19)
          return 0;
        v22 = -87;
      }
      else
      {
        v22 = -55;
      }
    }
    else
    {
      v22 = -48;
    }
    if (!is_mul_ok(v9, a3))
      return 0;
    v23 = v9 * a3;
    v24 = v21 + v22;
    v15 = __CFADD__(v23, v24);
    v9 = v23 + v24;
    if (v15)
      return 0;
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22DE009E0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_22DE1F394();
  v4 = sub_22DE00A5C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22DE00A5C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_22DE00BA0(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_22DDFD28C(v9, 0);
      v12 = sub_22DE00C8C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x22E31FB80](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22E31FB80);
LABEL_9:
      sub_22DE1F76C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22E31FB80]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_22DE00BA0(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_22DDFD2F0(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_22DDFD2F0(a2, a3, a4);
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
    return sub_22DE1F364();
  }
  __break(1u);
  return result;
}

unint64_t sub_22DE00C8C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_22DDFD2F0(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_22DE1F370();
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
          result = sub_22DE1F76C();
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
    result = sub_22DDFD2F0(v12, a6, a7);
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
    v12 = sub_22DE1F34C();
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

uint64_t sub_22DE00E9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE00F8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE01080(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE01170(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE01288(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

char *sub_22DE01390(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_22DE1F808();
  __break(1u);
  return result;
}

unint64_t sub_22DE01478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DB9DE0;
  if (!qword_255DB9DE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DB9BE0);
    result = MEMORY[0x22E3207B0](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255DB9DE0);
  }
  return result;
}

uint64_t sub_22DE014C4(uint64_t a1, uint64_t a2)
{
  assignWithTake for FBKFeedbackForm.FormResponse(a2, a1);
  return a2;
}

void sub_22DE01500()
{
  sub_22DE01548(17, 0x636974796C616E41, 0xEF2E746E65764573);
}

void sub_22DE01528()
{
  sub_22DE01548(39, 0xD000000000000025, 0x800000022DE2CC40);
}

void sub_22DE01548(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for AnalyticsEvent();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_22DE1F730();
  swift_bridgeObjectRelease();
  v10 = a2;
  v11 = a3;
  sub_22DE01DB4(v3, (uint64_t)v8);
  v9 = (char *)sub_22DE01618 + 4 * byte_22DE26920[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22DE01618()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_22DE1E1F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0, v2);
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  return *(_QWORD *)(v1 - 80);
}

void sub_22DE016E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = sub_22DE1E1F4();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for AnalyticsEvent();
  MEMORY[0x24BDAC7A8](v3);
  sub_22DE01DB4(v0, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (char *)sub_22DE017C8 + 4 * byte_22DE26925[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

unint64_t sub_22DE017C8()
{
  return sub_22DE06F24(MEMORY[0x24BEE4AF8]);
}

void sub_22DE01A1C()
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
  char *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock[6];

  v1 = type metadata accessor for AnalyticsEvent();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  sub_22DE01548(39, 0xD000000000000025, 0x800000022DE2CC40);
  v11 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  sub_22DE01DB4(v0, (uint64_t)v10);
  v12 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v13 = swift_allocObject();
  sub_22DE01E80((uint64_t)v10, v13 + v12);
  aBlock[4] = (uint64_t)sub_22DE01EC4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22DE01EFC;
  aBlock[3] = (uint64_t)&block_descriptor_9;
  v14 = _Block_copy(aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);

  if (qword_255DB53B0 != -1)
    swift_once();
  v15 = sub_22DE1E410();
  __swift_project_value_buffer(v15, (uint64_t)qword_255DC3D60);
  sub_22DE01DB4(v0, (uint64_t)v8);
  sub_22DE01DB4(v0, (uint64_t)v5);
  v16 = sub_22DE1E3F8();
  v17 = sub_22DE1F4F0();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315394;
    sub_22DE01548(39, 0xD000000000000025, 0x800000022DE2CC40);
    v26 = sub_22DDA2E30(v20, v21, aBlock);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    sub_22DD6F9A8((uint64_t)v8);
    *(_WORD *)(v18 + 12) = 2080;
    sub_22DE016E8();
    v26 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB98A8);
    v23 = sub_22DE1F2EC();
    v26 = sub_22DDA2E30(v23, v24, aBlock);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    sub_22DD6F9A8((uint64_t)v5);
    _os_log_impl(&dword_22DD4B000, v16, v17, "%s - %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v19, -1, -1);
    MEMORY[0x22E320870](v18, -1, -1);
  }
  else
  {
    sub_22DD6F9A8((uint64_t)v8);
    sub_22DD6F9A8((uint64_t)v5);
  }

}

uint64_t type metadata accessor for AnalyticsEvent()
{
  uint64_t result;

  result = qword_255DB9928;
  if (!qword_255DB9928)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22DE01DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnalyticsEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DE01DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AnalyticsEvent() - 8) + 80);
  if (swift_getEnumCaseMultiPayload() - 1 <= 1)
  {
    v2 = sub_22DE1E1F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + ((v1 + 16) & ~v1), v2);
  }
  return swift_deallocObject();
}

uint64_t sub_22DE01E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnalyticsEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22DE01EC4()
{
  type metadata accessor for AnalyticsEvent();
  sub_22DE016E8();
}

id sub_22DE01EFC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_22DD70E78(0, (unint64_t *)&qword_255DB5D40);
    v4 = (void *)sub_22DE1F238();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

void sub_22DE01F98()
{
  sub_22DE01548(17, 0x636974796C616E41, 0xEF2E746E65764573);
}

uint64_t *sub_22DE01FD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v8 = sub_22DE1E1F4();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
  }
  return a1;
}

uint64_t sub_22DE020C0(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((result - 1) <= 1)
  {
    v3 = sub_22DE1E1F4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *sub_22DE02110(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v7 = sub_22DE1E1F4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_22DE021D8(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_22DD6F9A8((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_22DE1E1F4();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *sub_22DE022B0(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v7 = sub_22DE1E1F4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_22DE02378(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_22DD6F9A8((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_22DE1E1F4();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22DE02450()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22DE1E1F4();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_22DE024C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_22DE1E248();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22DE1E20C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v7, v4) != *MEMORY[0x24BE31148])
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_255DB53A8 != -1)
      swift_once();
    v18 = sub_22DE1E410();
    __swift_project_value_buffer(v18, (uint64_t)qword_255DC3D48);
    v19 = sub_22DE1E3F8();
    v20 = sub_22DE1F4FC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_22DD4B000, v19, v20, "Content is not structured.", v21, 2u);
      MEMORY[0x22E320870](v21, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
  (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v4);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  v12 = sub_22DE02A60((uint64_t)v11);
  if (v13 >> 60 == 15)
  {
    if (qword_255DB53A8 != -1)
      swift_once();
    v14 = sub_22DE1E410();
    __swift_project_value_buffer(v14, (uint64_t)qword_255DC3D48);
    v15 = sub_22DE1E3F8();
    v16 = sub_22DE1F4FC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_22DD4B000, v15, v16, "Data returned is nil", v17, 2u);
      MEMORY[0x22E320870](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
  v23 = v12;
  v24 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *a2 = v23;
  a2[1] = v24;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(a2, *MEMORY[0x24BE311A0], v4);
  return (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

unint64_t sub_22DE027C0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v10;

  v2 = 0xD00000000000001ELL;
  v3 = sub_22DE1E20C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16))
  {
    v7 = sub_22DDFD368(0x497972617262696CLL, 0xE900000000000044);
    if ((v8 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(a1 + 56) + *(_QWORD *)(v4 + 72) * v7, v3);
      if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) == *MEMORY[0x24BE310D0])
      {
        (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
        return *(_QWORD *)v6;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
    }
  }
  return v2;
}

uint64_t sub_22DE028E4(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (a2 >> 60 != 15)
  {
    v9 = result;
    swift_beginAccess();
    v10 = *(_QWORD *)(a7 + 16);
    v11 = *(_QWORD *)(a7 + 24);
    *(_QWORD *)(a7 + 16) = v9;
    *(_QWORD *)(a7 + 24) = a2;
    sub_22DD64850(v9, a2);
    return sub_22DDDD8F4(v10, v11);
  }
  return result;
}

uint64_t sub_22DE02960(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void (*v9)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a2;
  v9 = *(void (**)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v10 = v8;
    v8 = (void *)sub_22DE1DFCC();
    v12 = v11;

    if (a3)
      goto LABEL_3;
LABEL_7:
    v13 = 0;
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  swift_retain();
  v12 = 0xF000000000000000;
  if (!a3)
    goto LABEL_7;
LABEL_3:
  v13 = sub_22DE1F2B0();
  a3 = v14;
  if (a5)
LABEL_4:
    a5 = sub_22DE1F244();
LABEL_5:
  v9(v8, v12, v13, a3, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DDDD8F4((uint64_t)v8, v12);
  return swift_release();
}

uint64_t sub_22DE02A60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t (*v13)(uint64_t *, uint64_t);
  int v14;
  int v15;
  void (*v16)(uint64_t *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  _QWORD *v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB73F8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_22DE1E20C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (uint64_t *)((char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&aBlock[-1] - v10);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&aBlock[-1] - v10, a1, v5);
  v13 = *(uint64_t (**)(uint64_t *, uint64_t))(v6 + 88);
  v14 = v13(v11, v5);
  if (v14 != *MEMORY[0x24BE310B0])
  {
    (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v11, v5);
    if (qword_255DB53A8 != -1)
      swift_once();
    v21 = sub_22DE1E410();
    __swift_project_value_buffer(v21, (uint64_t)qword_255DC3D48);
    v22 = sub_22DE1E3F8();
    v23 = sub_22DE1F4FC();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_30;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    v25 = "Structured content is not a dictionary.";
    goto LABEL_29;
  }
  v15 = v14;
  v16 = *(void (**)(uint64_t *, uint64_t))(v6 + 96);
  v16(v11, v5);
  v17 = *v11;
  if (*(_QWORD *)(v17 + 16) && (v18 = sub_22DDFD368(0x636E657265666572, 0xE900000000000065), (v19 & 1) != 0))
  {
    v12((char *)v4, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v6 + 72) * v18, v5);
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, v20, 1, v5);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_22DE034B8((uint64_t)v4);
LABEL_20:
    if (qword_255DB53A8 != -1)
      swift_once();
    v53 = sub_22DE1E410();
    __swift_project_value_buffer(v53, (uint64_t)qword_255DC3D48);
    v22 = sub_22DE1E3F8();
    v23 = sub_22DE1F4FC();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_30;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
LABEL_29:
    _os_log_impl(&dword_22DD4B000, v22, v23, v25, v24, 2u);
    MEMORY[0x22E320870](v24, -1, -1);
LABEL_30:

    return 0;
  }
  if (v13(v4, v5) != v15)
  {
    (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v4, v5);
    goto LABEL_20;
  }
  v16(v4, v5);
  v26 = *v4;
  if (!*(_QWORD *)(v26 + 16) || (v27 = sub_22DDFD368(0x44496567616D69, 0xE700000000000000), (v28 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_25:
    if (qword_255DB53A8 != -1)
      swift_once();
    v54 = sub_22DE1E410();
    __swift_project_value_buffer(v54, (uint64_t)qword_255DC3D48);
    v22 = sub_22DE1E3F8();
    v23 = sub_22DE1F4FC();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_30;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    goto LABEL_29;
  }
  v12((char *)v9, *(_QWORD *)(v26 + 56) + *(_QWORD *)(v6 + 72) * v27, v5);
  if (v13(v9, v5) != *MEMORY[0x24BE310D0])
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v9, v5);
    goto LABEL_25;
  }
  v16(v9, v5);
  v30 = *v9;
  v29 = v9[1];
  sub_22DE027C0(v26);
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3620]), sel_init);
  v32 = (void *)objc_opt_self();
  v33 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v32, sel_defaultApplicationLibraryIdentifierWithContainerIdentifier_, v33);

  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3628]), sel_init);
  objc_msgSend(v35, sel_setAllowsUpgrade_, 1);
  aBlock[0] = 0;
  v36 = objc_msgSend(v31, sel_openPhotoLibraryWithIdentifier_options_error_, v34, v35, aBlock);
  if (!v36)
  {
    v56 = aBlock[0];
    swift_bridgeObjectRelease();
    v57 = (void *)sub_22DE1DEE8();

    swift_willThrow();
    if (qword_255DB53A8 != -1)
      swift_once();
    v58 = sub_22DE1E410();
    __swift_project_value_buffer(v58, (uint64_t)qword_255DC3D48);
    v59 = v57;
    v60 = v57;
    v61 = sub_22DE1E3F8();
    v62 = sub_22DE1F4FC();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v63 = 138412290;
      v65 = v57;
      v66 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v66;
      sub_22DE1F628();
      *v64 = v66;

      _os_log_impl(&dword_22DD4B000, v61, v62, "Failed to open GP library: %@", v63, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB8160);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v64, -1, -1);
      MEMORY[0x22E320870](v63, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v37 = v36;
  v38 = aBlock[0];

  v39 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9BD0);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_22DE20F30;
  *(_QWORD *)(v40 + 32) = v30;
  *(_QWORD *)(v40 + 40) = v29;
  v41 = v37;
  v42 = (void *)sub_22DE1F3C4();
  swift_bridgeObjectRelease();
  v43 = objc_msgSend(v41, sel_librarySpecificFetchOptions);

  v44 = objc_msgSend(v39, sel_fetchAssetsWithLocalIdentifiers_options_, v42, v43);
  v45 = objc_msgSend(v44, sel_firstObject);
  if (!v45)
  {
    if (qword_255DB53A8 != -1)
      swift_once();
    v67 = sub_22DE1E410();
    __swift_project_value_buffer(v67, (uint64_t)qword_255DC3D48);
    v68 = v44;
    v69 = sub_22DE1E3F8();
    v70 = sub_22DE1F4FC();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v71 = 134217984;
      aBlock[0] = objc_msgSend(v68, sel_count);
      sub_22DE1F628();

      _os_log_impl(&dword_22DD4B000, v69, v70, "Failed to find image in library: %ld", v71, 0xCu);
      MEMORY[0x22E320870](v71, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v46 = v45;
  v47 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3598]), sel_init);
  v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_22DE26990;
  objc_msgSend(v48, sel_setSynchronous_, 1);
  aBlock[4] = sub_22DE0352C;
  aBlock[5] = (id)v49;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_22DE02960;
  aBlock[3] = &block_descriptor_10;
  v50 = _Block_copy(aBlock);
  v51 = v48;
  swift_retain();
  swift_release();
  objc_msgSend(v47, sel_requestImageDataAndOrientationForAsset_options_resultHandler_, v46, v51, v50);

  _Block_release(v50);
  swift_beginAccess();
  v52 = *(_QWORD *)(v49 + 16);
  sub_22DE0354C(v52, *(_QWORD *)(v49 + 24));
  swift_release();
  return v52;
}

uint64_t sub_22DE034B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB73F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DE034F8()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 != 15)
    sub_22DD64894(*(_QWORD *)(v0 + 16), v1);
  return swift_deallocObject();
}

uint64_t sub_22DE0352C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return sub_22DE028E4(a1, a2, a3, a4, a5, a6, v6);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_22DE0354C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_22DD64850(a1, a2);
  return a1;
}

uint64_t FBKInlineConcern.feedbackController.getter()
{
  uint64_t v0;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  MEMORY[0x22E31F8EC](&v2, v0);
  return v2;
}

uint64_t FBKInlineConcern.feedbackController.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  return sub_22DE1F07C();
}

void (*FBKInlineConcern.feedbackController.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = *v1;
  v5 = v1[1];
  v3[5] = *v1;
  v3[6] = v5;
  v6 = (void *)v1[2];
  v3[7] = v6;
  *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  swift_retain();
  swift_retain();
  v7 = v6;
  v3[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  MEMORY[0x22E31F8EC]();
  return sub_22DD959A8;
}

uint64_t FBKInlineConcern.$feedbackController.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  sub_22DE1F094();
  return v1;
}

uint64_t FBKInlineConcern.subject.getter()
{
  return sub_22DE03990((uint64_t (*)(uint64_t))MEMORY[0x24BDF47B0]);
}

uint64_t type metadata accessor for FBKInlineConcern()
{
  uint64_t result;

  result = qword_255DB99B8;
  if (!qword_255DB99B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22DE03718(uint64_t a1)
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

  v2 = sub_22DE1E194();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  type metadata accessor for FBKInlineConcern();
  v9(v6, (uint64_t)v8, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  sub_22DE1F07C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t FBKInlineConcern.subject.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_22DE1E194();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FBKInlineConcern();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  sub_22DE1F07C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*FBKInlineConcern.subject.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = sub_22DE1E194();
  *v3 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[1] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  v3[4] = v7;
  v8 = malloc(*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  v3[5] = v8;
  v9 = type metadata accessor for FBKInlineConcern();
  sub_22DD95E00(v1 + *(int *)(v9 + 20), (uint64_t)v8);
  MEMORY[0x22E31F8EC](v7);
  return sub_22DD95D50;
}

uint64_t FBKInlineConcern.$subject.getter()
{
  return sub_22DE03990((uint64_t (*)(uint64_t))MEMORY[0x24BDF47E0]);
}

uint64_t sub_22DE03990(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  type metadata accessor for FBKInlineConcern();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  return a1(v2);
}

uint64_t FBKInlineConcern.disabled.getter()
{
  uint64_t v0;
  uint64_t v2;

  type metadata accessor for FBKInlineConcern();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  MEMORY[0x22E31F8EC](&v2, v0);
  return v2;
}

_QWORD *sub_22DE03A38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  type metadata accessor for FBKInlineConcern();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  result = MEMORY[0x22E31F8EC](&v4, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_22DE03AA8()
{
  type metadata accessor for FBKInlineConcern();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  return sub_22DE1F07C();
}

uint64_t FBKInlineConcern.disabled.setter()
{
  type metadata accessor for FBKInlineConcern();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  return sub_22DE1F07C();
}

void (*FBKInlineConcern.disabled.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for FBKInlineConcern() + 24));
  v5 = *v4;
  v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  LOBYTE(v4) = *((_BYTE *)v4 + 16);
  *((_BYTE *)v3 + 19) = (_BYTE)v4;
  *v3 = v5;
  v3[1] = v6;
  *((_BYTE *)v3 + 16) = (_BYTE)v4;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  MEMORY[0x22E31F8EC]();
  return sub_22DD9610C;
}

uint64_t FBKInlineConcern.$disabled.getter()
{
  uint64_t v1;

  type metadata accessor for FBKInlineConcern();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  sub_22DE1F094();
  return v1;
}

uint64_t sub_22DE03C68@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for FBKInlineConcern() + 28));
  v4 = *v3;
  v5 = v3[1];
  if (*v3)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_22DD96FCC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_22DD50D8C(v4);
}

uint64_t sub_22DE03CE0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_22DD96FC4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for FBKInlineConcern() + 28));
  v8 = *v7;
  sub_22DD50D8C(v3);
  result = sub_22DD50DE0(v8);
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  return result;
}

uint64_t FBKInlineConcern.onFormComplete.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for FBKInlineConcern() + 28));
  sub_22DD50D8C(v1);
  return v1;
}

uint64_t FBKInlineConcern.onFormComplete.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for FBKInlineConcern() + 28));
  result = sub_22DD50DE0(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FBKInlineConcern.onFormComplete.modify())(_QWORD)
{
  type metadata accessor for FBKInlineConcern();
  return nullsub_1;
}

uint64_t FBKInlineConcern.init(feedbackController:subject:disabled:onFormComplete:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  int *v17;
  _QWORD *v18;
  uint64_t result;
  char *v20;

  v17 = (int *)type metadata accessor for FBKInlineConcern();
  v18 = (_QWORD *)((char *)a9 + v17[7]);
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  result = sub_22DD96438(a4, (uint64_t)a9 + v17[5]);
  v20 = (char *)a9 + v17[6];
  *(_QWORD *)v20 = a5;
  *((_QWORD *)v20 + 1) = a6;
  v20[16] = a7;
  *v18 = a8;
  v18[1] = a10;
  return result;
}

uint64_t FBKInlineConcern.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v21 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22DE1E14C();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v8 + 104))(v7, *MEMORY[0x24BE30E98]);
  v9 = type metadata accessor for FBKInlineConcern();
  sub_22DE1F094();
  v10 = (uint64_t *)((char *)v1 + *(int *)(v9 + 28));
  v11 = *v10;
  v12 = v10[1];
  v22 = *v1;
  v23 = *(_OWORD *)(v1 + 1);
  sub_22DD50D8C(v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  sub_22DE1F094();
  v13 = v24;
  v14 = v25;
  v15 = v26;
  v16 = (uint64_t *)((char *)v1 + *(int *)(v9 + 24));
  v17 = *v16;
  v18 = v16[1];
  LOBYTE(v16) = *((_BYTE *)v16 + 16);
  v22 = v17;
  *(_QWORD *)&v23 = v18;
  BYTE8(v23) = (_BYTE)v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7910);
  sub_22DE1F094();
  return sub_22DDA6998((uint64_t)v7, (uint64_t)v4, v11, v12, v13, v14, v15, v21, v24, v25, v26);
}

uint64_t sub_22DE04080()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DE0409C()
{
  uint64_t v0;

  type metadata accessor for FBKInlineConcern();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  return MEMORY[0x22E31F8EC](v0);
}

uint64_t getEnumTagSinglePayload for FBKInlineConcern()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE04108(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for FBKInlineConcern()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE04194(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_22DE0420C()
{
  unint64_t v0;

  sub_22DD96F00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_22DE04294()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t getEnumTagSinglePayload for BatchAction(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BatchAction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DE04398 + 4 * byte_22DE26A65[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22DE043CC + 4 * byte_22DE26A60[v4]))();
}

uint64_t sub_22DE043CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE043D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DE043DCLL);
  return result;
}

uint64_t sub_22DE043E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DE043F0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22DE043F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE043FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BatchAction()
{
  return &type metadata for BatchAction;
}

uint64_t sub_22DE04418(char a1)
{
  return *(_QWORD *)&aThumbsupthumbs_0[8 * a1];
}

void sub_22DE04438(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22DE04488()
{
  _QWORD v1[8];

  strcpy((char *)v1, "hand.thumbsup");
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t sub_22DE0456C()
{
  char *v0;

  return sub_22DE04418(*v0);
}

unint64_t sub_22DE04578()
{
  unint64_t result;

  result = qword_255DB99F8;
  if (!qword_255DB99F8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE26AAC, &type metadata for BatchAction);
    atomic_store(result, (unint64_t *)&qword_255DB99F8);
  }
  return result;
}

uint64_t sub_22DE045BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  v3 = v0;
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E068();
  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  sub_22DE06168(v1, *(_QWORD *)(v3 + 24), *(void **)(v3 + 32));
  return v1;
}

void sub_22DE04660(void (*a1)(void), uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(void);
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  id v56;
  char *v57;
  char *v58;
  uint64_t v59;
  _QWORD v60[3];
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void (*v73)(void);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  __int128 aBlock;
  uint64_t (*v79)(uint64_t);
  void *v80;
  void (*v81)();
  _QWORD *v82;
  id v83;
  _OWORD v84[2];

  v3 = v2;
  v71 = a2;
  v73 = a1;
  v64 = *v2;
  v4 = sub_22DE1F1B4();
  v69 = *(_QWORD *)(v4 - 8);
  v70 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v68 = (char *)v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_22DE1F1D8();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_22DE1F1C0();
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v61 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22DE1DF00();
  v74 = *(_QWORD *)(v8 - 8);
  v75 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithOptions_, 128);
  sub_22DE1F4B4();
  v77 = (char *)v2 + OBJC_IVAR____TtC8Feedback17AppInfoController___observationRegistrar;
  sub_22DE1DEF4();
  if (!v80)
  {
LABEL_14:
    (*(void (**)(char *, uint64_t))(v74 + 8))(v10, v75);
    if (qword_255DB53A8 != -1)
      swift_once();
    v19 = sub_22DE1E410();
    __swift_project_value_buffer(v19, (uint64_t)qword_255DC3D48);
    swift_retain_n();
    v20 = sub_22DE1E3F8();
    v21 = sub_22DE1F4FC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = v3;
      v24 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v24;
      *(_DWORD *)v22 = 136315138;
      swift_getKeyPath();
      *(_QWORD *)&v84[0] = v23;
      sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
      sub_22DE1E068();
      swift_release();
      v25 = v23[5];
      v26 = v23[6];
      swift_bridgeObjectRetain();
      *(_QWORD *)&v84[0] = sub_22DDA2E30(v25, v26, (uint64_t *)&aBlock);
      sub_22DE1F628();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22DD4B000, v20, v21, "Failed to find app record for bundleID: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E320870](v24, -1, -1);
      MEMORY[0x22E320870](v22, -1, -1);

      v28 = v72;
      v27 = v73;
      if (!v73)
        goto LABEL_21;
    }
    else
    {

      swift_release_n();
      v28 = v72;
      v27 = v73;
      if (!v73)
      {
LABEL_21:

        return;
      }
    }
    v27();
    goto LABEL_21;
  }
  while (1)
  {
    sub_22DDB26A8(&aBlock, v84);
    sub_22DD70E78(0, &qword_255DB9AC8);
    if (!swift_dynamicCast())
      goto LABEL_4;
    v11 = v83;
    v12 = objc_msgSend(v83, sel_bundleIdentifier);
    if (v12)
    {
      v13 = v12;
      v14 = sub_22DE1F2B0();
      v16 = v15;

    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    swift_getKeyPath();
    *(_QWORD *)&v84[0] = v3;
    v76 = sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
    sub_22DE1E068();
    swift_release();
    if (v16)
      break;
LABEL_3:

LABEL_4:
    sub_22DE1DEF4();
    if (!v80)
      goto LABEL_14;
  }
  v17 = v3;
  if (v14 != v3[5] || v16 != v3[6])
  {
    v18 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
      goto LABEL_23;
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
LABEL_23:
  v29 = qword_255DB53A8;
  v30 = v11;
  if (v29 != -1)
    swift_once();
  v31 = sub_22DE1E410();
  v32 = __swift_project_value_buffer(v31, (uint64_t)qword_255DC3D48);
  v33 = v17;
  swift_retain_n();
  v34 = sub_22DE1E3F8();
  v35 = sub_22DE1F4FC();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc();
    v60[2] = v32;
    v37 = (uint8_t *)v36;
    v38 = swift_slowAlloc();
    *(_QWORD *)&v84[0] = v38;
    *(_DWORD *)v37 = 136315138;
    v60[1] = v37 + 4;
    swift_getKeyPath();
    v83 = v17;
    sub_22DE1E068();
    swift_release();
    v39 = v17[5];
    v40 = v33[6];
    swift_bridgeObjectRetain();
    v83 = (id)sub_22DDA2E30(v39, v40, (uint64_t *)v84);
    sub_22DE1F628();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22DD4B000, v34, v35, "Found app record for bundleID: %s, will break early", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v38, -1, -1);
    MEMORY[0x22E320870](v37, -1, -1);

  }
  else
  {

    swift_release_n();
  }

  (*(void (**)(char *, uint64_t))(v74 + 8))(v10, v75);
  swift_retain_n();
  v41 = v30;
  v42 = sub_22DE1E3F8();
  v43 = sub_22DE1F4F0();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v45;
    *(_DWORD *)v44 = 136315138;
    swift_getKeyPath();
    *(_QWORD *)&v84[0] = v33;
    sub_22DE1E068();
    swift_release();
    v46 = v41;
    v47 = v33[5];
    v48 = v33[6];
    swift_bridgeObjectRetain();
    *(_QWORD *)&v84[0] = sub_22DDA2E30(v47, v48, (uint64_t *)&aBlock);
    sub_22DE1F628();
    swift_release_n();
    v41 = v46;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22DD4B000, v42, v43, "Found app record for bundleID: %s, will prepare image", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v45, -1, -1);
    MEMORY[0x22E320870](v44, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  sub_22DD70E78(0, (unint64_t *)&qword_255DB8140);
  v49 = v62;
  v50 = v61;
  v51 = v63;
  (*(void (**)(char *, _QWORD, uint64_t))(v62 + 104))(v61, *MEMORY[0x24BEE5480], v63);
  v52 = (void *)sub_22DE1F598();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v51);
  v53 = (_QWORD *)swift_allocObject();
  v54 = (uint64_t)v73;
  v53[2] = v33;
  v53[3] = v54;
  v53[4] = v71;
  v53[5] = v41;
  v53[6] = v64;
  v81 = sub_22DE062C0;
  v82 = v53;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v79 = sub_22DD9C498;
  v80 = &block_descriptor_11;
  v55 = _Block_copy(&aBlock);
  v56 = v41;
  swift_retain();
  sub_22DD50D8C(v54);
  v57 = v65;
  sub_22DE1F1CC();
  *(_QWORD *)&v84[0] = MEMORY[0x24BEE4AF8];
  sub_22DD504A8((unint64_t *)&qword_255DB6898, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB8150);
  sub_22DD78E50();
  v58 = v68;
  v59 = v70;
  sub_22DE1F67C();
  MEMORY[0x22E31FDFC](0, v57, v58, v55);
  _Block_release(v55);

  (*(void (**)(char *, uint64_t))(v69 + 8))(v58, v59);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v57, v67);
  swift_release();
}

uint64_t sub_22DE05070()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E068();
  swift_release();
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_22DE05104()
{
  qword_255DC3D10 = 0x4038000000000000;
}

uint64_t sub_22DE05114(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_22DE1F8E0() & 1) == 0)
    return 0;
  sub_22DD70E78(0, (unint64_t *)&qword_255DB5D40);
  return sub_22DE1F5F8() & 1;
}

id sub_22DE05194@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E068();
  swift_release();
  v4 = v3[2];
  v5 = v3[3];
  v6 = (void *)v3[4];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = (uint64_t)v6;
  return sub_22DE06168(v4, v5, v6);
}

uint64_t sub_22DE0522C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *a1;
  v2 = a1[1];
  v3 = (void *)a1[2];
  swift_getKeyPath();
  sub_22DE06168(v1, v2, v3);
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E05C();
  sub_22DE061A0(v1, v2, v3);
  return swift_release();
}

uint64_t sub_22DE05300@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E068();
  swift_release();
  v4 = *(_QWORD *)(v3 + 48);
  *a2 = *(_QWORD *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE05390()
{
  swift_getKeyPath();
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  swift_bridgeObjectRetain();
  sub_22DE1E05C();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE0544C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB8970);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_22DE04660((void (*)(void))sub_22DDC6700, v6);
  return swift_release();
}

void sub_22DE05528(uint64_t a1, void (*a2)(void), uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v8 = sub_22DE1F1B4();
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v42 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22DE1F1D8();
  v40 = *(_QWORD *)(v10 - 8);
  v41 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  aBlock[0] = a1;
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E068();
  swift_release();
  v13 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithBundleIdentifier_, v14);

  if (qword_255DB5388 != -1)
    swift_once();
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_initWithSize_scale_, *(double *)&qword_255DC3D10, *(double *)&qword_255DC3D10, 2.0);
  v17 = objc_msgSend(v15, sel_prepareImageForDescriptor_, v16);

  if (v17)
  {
    v38 = v15;
    v39 = v8;
    v18 = (uint64_t)a2;
    v19 = a3;
    v20 = objc_msgSend(v17, sel_CGImage);
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_, v20);

      v23 = objc_msgSend(a4, sel_localizedName);
      v24 = sub_22DE1F2B0();
      v26 = v25;

      sub_22DD70E78(0, (unint64_t *)&qword_255DB8140);
      v27 = v22;
      v28 = (void *)sub_22DE1F574();
      v29 = (_QWORD *)swift_allocObject();
      v29[2] = a1;
      v29[3] = v24;
      v29[4] = v26;
      v29[5] = v27;
      v29[6] = v18;
      v29[7] = v19;
      aBlock[4] = sub_22DE0632C;
      aBlock[5] = v29;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22DD9C498;
      aBlock[3] = &block_descriptor_13;
      v30 = _Block_copy(aBlock);
      v31 = v27;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_22DD50D8C(v18);
      swift_release();
      sub_22DE1F1CC();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_22DD504A8((unint64_t *)&qword_255DB6898, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB8150);
      sub_22DD78E50();
      v32 = v42;
      v33 = v39;
      sub_22DE1F67C();
      MEMORY[0x22E31FDFC](0, v12, v32, v30);
      _Block_release(v30);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v33);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v41);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_255DB53A8 != -1)
      swift_once();
    v34 = sub_22DE1E410();
    __swift_project_value_buffer(v34, (uint64_t)qword_255DC3D48);
    v35 = sub_22DE1E3F8();
    v36 = sub_22DE1F4FC();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_22DD4B000, v35, v36, "Failed to prepare image for app record", v37, 2u);
      MEMORY[0x22E320870](v37, -1, -1);
    }

    if (a2)
      a2();

  }
}

uint64_t sub_22DE059F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t KeyPath;
  id v12;
  uint64_t result;

  if (qword_255DB53A8 != -1)
    swift_once();
  v7 = sub_22DE1E410();
  __swift_project_value_buffer(v7, (uint64_t)qword_255DC3D48);
  v8 = sub_22DE1E3F8();
  v9 = sub_22DE1F4F0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22DD4B000, v8, v9, "Successfully built app info", v10, 2u);
    MEMORY[0x22E320870](v10, -1, -1);
  }

  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  swift_bridgeObjectRetain();
  v12 = a4;
  sub_22DE1E05C();
  swift_release();

  result = swift_bridgeObjectRelease();
  if (a5)
    return a5(result);
  return result;
}

uint64_t sub_22DE05BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_22DE061A0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC8Feedback17AppInfoController___observationRegistrar;
  v2 = sub_22DE1E098();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_22DE05C20()
{
  return type metadata accessor for AppInfoController();
}

uint64_t type metadata accessor for AppInfoController()
{
  uint64_t result;

  result = qword_255DB9A30;
  if (!qword_255DB9A30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22DE05C64()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22DE1E098();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void destroy for AppInfoController.AppInfo(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s8Feedback17AppInfoControllerC7AppInfoVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for AppInfoController.AppInfo(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  return a1;
}

uint64_t assignWithTake for AppInfoController.AppInfo(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppInfoController.AppInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInfoController.AppInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppInfoController.AppInfo()
{
  return &type metadata for AppInfoController.AppInfo;
}

uint64_t sub_22DE05E84(_QWORD **a1, _QWORD **a2)
{
  return sub_22DE05E90(*a1, *a2);
}

uint64_t sub_22DE05E90(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  swift_getKeyPath();
  sub_22DD504A8(&qword_255DB7598, (uint64_t (*)(uint64_t))type metadata accessor for AppInfoController, (uint64_t)&unk_22DE26BF8);
  sub_22DE1E068();
  swift_release();
  v5 = a1[2];
  v4 = a1[3];
  v6 = (void *)a1[4];
  swift_getKeyPath();
  sub_22DE06168(v5, v4, v6);
  sub_22DE1E068();
  swift_release();
  v7 = a2[3];
  if (!v4)
  {
    if (!v7)
      goto LABEL_9;
LABEL_15:
    v13 = 0;
    return v13 & 1;
  }
  if (!v7)
  {
    swift_bridgeObjectRelease();

    goto LABEL_15;
  }
  v8 = a2[2];
  v9 = (void *)a2[4];
  if ((v5 != v8 || v4 != v7) && (sub_22DE1F8E0() & 1) == 0)
  {
    sub_22DE06168(v5, v4, v6);
    sub_22DE06168(v8, v7, v9);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22DE061A0(v5, v4, v6);
    goto LABEL_15;
  }
  sub_22DD70E78(0, (unint64_t *)&qword_255DB5D40);
  sub_22DE06168(v5, v4, v6);
  sub_22DE06168(v8, v7, v9);
  v10 = sub_22DE1F5F8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DE061A0(v5, v4, v6);
  if ((v10 & 1) == 0)
    goto LABEL_15;
LABEL_9:
  swift_getKeyPath();
  sub_22DE1E068();
  swift_release();
  v12 = a1[5];
  v11 = a1[6];
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_22DE1E068();
  swift_release();
  if (v12 == a2[5] && v11 == a2[6])
  {
    swift_bridgeObjectRelease();
    v13 = 1;
  }
  else
  {
    v13 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
  }
  return v13 & 1;
}

id sub_22DE06168(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  return result;
}

void sub_22DE061A0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_22DE061D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[4];
  *(_QWORD *)(v1 + 40) = v0[3];
  *(_QWORD *)(v1 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_22DE0620C()
{
  sub_22DE0633C();
}

uint64_t sub_22DE06220()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB8970);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_22DE06284()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();

  return swift_deallocObject();
}

void sub_22DE062C0()
{
  uint64_t v0;

  sub_22DE05528(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_22DE062E8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  if (*(_QWORD *)(v0 + 48))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DE0632C()
{
  uint64_t v0;

  return sub_22DE059F0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(uint64_t (**)(uint64_t))(v0 + 48));
}

void sub_22DE0633C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (_QWORD *)v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = (void *)v0[5];
  v5 = v2[2];
  v6 = v2[3];
  v7 = (void *)v2[4];
  v2[2] = v1;
  v2[3] = v3;
  v2[4] = v4;
  sub_22DE06168(v1, v3, v4);
  sub_22DE061A0(v5, v6, v7);
}

uint64_t sub_22DE06390(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  int v11;
  const char *v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = 0xD000000000000013;
  v3 = sub_22DE1E1F4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - v8;
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v28 - v8, a1, v3);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v9, v3);
  if (v11 == *MEMORY[0x24BE31028] || v11 == *MEMORY[0x24BE31000])
  {
    v2 = 0xD000000000000014;
    v13 = "com.apple.mobilemail";
LABEL_9:
    v14 = (unint64_t)(v13 - 32) | 0x8000000000000000;
    if (qword_255DB53A8 != -1)
      swift_once();
    v15 = sub_22DE1E410();
    __swift_project_value_buffer(v15, (uint64_t)qword_255DC3D48);
    v10(v7, a1, v3);
    swift_bridgeObjectRetain_n();
    v16 = sub_22DE1E3F8();
    v17 = sub_22DE1F4F0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v31 = v28;
      *(_DWORD *)v18 = 136315394;
      swift_bridgeObjectRetain();
      v19 = sub_22DDA2E30(v2, v14, &v31);
      v29 = v2;
      v30 = v19;
      sub_22DE1F628();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2080;
      sub_22DD504A8(&qword_255DB5D78, (uint64_t (*)(uint64_t))MEMORY[0x24BE31068], MEMORY[0x24BE31090]);
      v20 = sub_22DE1F8C8();
      v30 = sub_22DDA2E30(v20, v21, &v31);
      v2 = v29;
      sub_22DE1F628();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      _os_log_impl(&dword_22DD4B000, v16, v17, "Will use bundleID override for AppInfoController: %s for feature domain: %s", (uint8_t *)v18, 0x16u);
      v22 = v28;
      swift_arrayDestroy();
      MEMORY[0x22E320870](v22, -1, -1);
      MEMORY[0x22E320870](v18, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    return v2;
  }
  if (v11 == *MEMORY[0x24BE31030])
  {
    v13 = "com.apple.MobileSMS";
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  if (qword_255DB53A8 != -1)
    swift_once();
  v23 = sub_22DE1E410();
  __swift_project_value_buffer(v23, (uint64_t)qword_255DC3D48);
  v24 = sub_22DE1E3F8();
  v25 = sub_22DE1F4F0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_22DD4B000, v24, v25, "Will use bundleID provided for AppInfoController", v26, 2u);
    MEMORY[0x22E320870](v26, -1, -1);
  }

  return 0;
}

ValueMetadata *type metadata accessor for BatchLoadingView()
{
  return &type metadata for BatchLoadingView;
}

uint64_t sub_22DE0678C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DE0679C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t KeyPath;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;

  v2 = sub_22DE1E50C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7640);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1E5B4();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDEB488], v2);
  KeyPath = swift_getKeyPath();
  v11 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB9AD0) + 36));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB68F0);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v11 + *(int *)(v12 + 28), v5, v2);
  *v11 = KeyPath;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22DE068F4()
{
  return sub_22DE1E794();
}

uint64_t sub_22DE06914()
{
  return sub_22DE1E794();
}

uint64_t sub_22DE06934(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_22DE1E50C();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x22E31F01C](v4);
}

unint64_t sub_22DE069B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DB9AD8;
  if (!qword_255DB9AD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DB9AD0);
    v2[0] = sub_22DD508B0((unint64_t *)&unk_255DB9AE0, &qword_255DB7640, MEMORY[0x24BDEBC00]);
    v2[1] = sub_22DD508B0(&qword_255DB6910, &qword_255DB68F0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DB9AD8);
  }
  return result;
}

unint64_t sub_22DE06A54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9FD8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9FE0);
  v6 = sub_22DE1F7FC();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_22DE136E8(v12, (uint64_t)v5);
    result = sub_22DDFD3CC((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_22DE1E050();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_22DE06BE0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA010);
  v2 = (_QWORD *)sub_22DE1F7FC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_22DDFD464((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

unint64_t sub_22DE06CE8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA008);
  v2 = (_QWORD *)sub_22DE1F7FC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_22DDFD368(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_22DE06E08(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9860);
  v2 = (_QWORD *)sub_22DE1F7FC();
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
    sub_22DDA492C(v5, v6);
    swift_bridgeObjectRetain();
    result = sub_22DDFD4E4(v5, v6);
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

unint64_t sub_22DE06F24(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9F88);
  v2 = (_QWORD *)sub_22DE1F7FC();
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
    result = sub_22DDFD368(v5, v6);
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

id FBKFeedbackForm.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return FBKFeedbackForm.init(identifier:)(a1, a2);
}

Feedback::FBKFeedbackForm::AuthenticationMethod_optional __swiftcall FBKFeedbackForm.AuthenticationMethod.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (Feedback::FBKFeedbackForm::AuthenticationMethod_optional)rawValue;
}

uint64_t FBKFeedbackForm.AuthenticationMethod.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

Feedback::FBKFeedbackForm::AuthenticationMethod_optional sub_22DE07098(Swift::Int *a1)
{
  return FBKFeedbackForm.AuthenticationMethod.init(rawValue:)(*a1);
}

void sub_22DE070A0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t FBKFeedbackForm.Question.description.getter()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;

  v1 = v0[1];
  v2 = *v0;
  if (v1 <= 2)
    v2 = *(_QWORD *)&aTitle_8[8 * v1];
  sub_22DDA492C(*v0, v1);
  return v2;
}

uint64_t FBKFeedbackForm.Question.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_22DE1F970();
  sub_22DE1F970();
  return sub_22DE1F310();
}

uint64_t FBKFeedbackForm.Question.hashValue.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_22DE1F964();
  sub_22DE1F970();
  if (v1 > 2)
    sub_22DE1F310();
  return sub_22DE1F97C();
}

uint64_t sub_22DE07214()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_22DE1F964();
  sub_22DE1F970();
  if (v1 > 2)
    sub_22DE1F310();
  return sub_22DE1F97C();
}

uint64_t sub_22DE072A0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_22DE1F970();
  sub_22DE1F970();
  return sub_22DE1F310();
}

uint64_t sub_22DE07324()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_22DE1F964();
  sub_22DE1F970();
  if (v1 > 2)
    sub_22DE1F310();
  return sub_22DE1F97C();
}

uint64_t sub_22DE073B4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_identifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE0741C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_identifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22DE07470()
{
  return sub_22DE07614();
}

uint64_t sub_22DE0747C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE074C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_22DE07510(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t (*sub_22DE07560())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE075A4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE07608()
{
  return sub_22DE07614();
}

uint64_t sub_22DE07614()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE07658(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22DE076A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE076EC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton);
}

uint64_t sub_22DE076FC(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton) = result;
  return result;
}

uint64_t (*sub_22DE0770C(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE07734()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching);
}

uint64_t sub_22DE07744(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching) = result;
  return result;
}

uint64_t (*sub_22DE07754(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE07778()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo);
}

uint64_t sub_22DE07788(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo) = result;
  return result;
}

uint64_t (*sub_22DE07798(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE077BC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast);
}

uint64_t sub_22DE077CC(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast) = result;
  return result;
}

uint64_t (*sub_22DE077DC(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE07800()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled);
}

uint64_t sub_22DE07810(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled) = result;
  return result;
}

uint64_t (*sub_22DE07820(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE07844()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices);
}

uint64_t sub_22DE07854(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices) = result;
  return result;
}

uint64_t (*sub_22DE07864(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE07888()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices);
}

uint64_t sub_22DE078A0(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices;
  *(_QWORD *)v3 = result;
  *(_BYTE *)(v3 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_22DE078BC(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices;
  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = v2;
  v3 = (uint64_t *)(v1 + v2);
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = (_BYTE)v3;
  return sub_22DE078EC;
}

uint64_t sub_22DE078EC(uint64_t result)
{
  uint64_t v1;
  char v2;

  v1 = *(_QWORD *)(result + 16) + *(_QWORD *)(result + 24);
  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t static FBKFeedbackForm.DefaultMaxInlineChoices.getter()
{
  return 10;
}

uint64_t sub_22DE07910()
{
  return sub_22DE07614();
}

uint64_t sub_22DE0791C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22DE07960(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22DE079A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE079EC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22DE07A30(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22DE07A78())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22DE07ABC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *v32;
  id v33;
  unint64_t *v34;
  unint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[3];

  v4 = v3;
  v44 = a2;
  v7 = sub_22DE1DFB4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v39 - v12;
  if (qword_255DB53A0 != -1)
    swift_once();
  v14 = sub_22DE1E410();
  __swift_project_value_buffer(v14, (uint64_t)qword_255DC3D30);
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v41(v13, a1, v7);
  swift_bridgeObjectRetain_n();
  v15 = sub_22DE1E3F8();
  v16 = sub_22DE1F514();
  v17 = os_log_type_enabled(v15, v16);
  v43 = a1;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v40 = v11;
    v19 = v18;
    v20 = swift_slowAlloc();
    v42 = v7;
    v21 = v20;
    v46[0] = v20;
    *(_DWORD *)v19 = 136446723;
    v45 = sub_22DDA2E30(0xD000000000000028, 0x800000022DE2CD70, v46);
    sub_22DE1F628();
    *(_WORD *)(v19 + 12) = 2082;
    v39 = v3;
    v22 = sub_22DE1DF30();
    v45 = sub_22DDA2E30(v22, v23, v46);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v42);
    *(_WORD *)(v19 + 22) = 2081;
    if (a3)
      v24 = v44;
    else
      v24 = 0;
    if (a3)
      v25 = a3;
    else
      v25 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v45 = sub_22DDA2E30(v24, v25, v46);
    sub_22DE1F628();
    swift_bridgeObjectRelease_n();
    v4 = v39;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22DD4B000, v15, v16, "%{public}s [%{public}s] [%{private}s]", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    v26 = v21;
    v7 = v42;
    MEMORY[0x22E320870](v26, -1, -1);
    v27 = v19;
    v11 = v40;
    MEMORY[0x22E320870](v27, -1, -1);

    if (a3)
      goto LABEL_11;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);

    swift_bridgeObjectRelease_n();
    if (a3)
    {
LABEL_11:
      v28 = objc_allocWithZone(MEMORY[0x24BE30DA0]);
      swift_bridgeObjectRetain();
      v29 = (void *)sub_22DE1F28C();
      swift_bridgeObjectRelease();
      v30 = (void *)sub_22DE1DF3C();
      v31 = objc_msgSend(v28, sel_initWithDescription_URL_, v29, v30);

      v32 = (_QWORD *)(v4 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachmentDescriptors);
      swift_beginAccess();
      v33 = v31;
      MEMORY[0x22E31FC34]();
      if (*(_QWORD *)((*v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22DE1F3F4();
      sub_22DE1F40C();
      sub_22DE1F3E8();
      swift_endAccess();

      return;
    }
  }
  v41(v11, v43, v7);
  v34 = (unint64_t *)(v4 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments);
  swift_beginAccess();
  v35 = *v34;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v34 = v35;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v35 = sub_22DDFCD2C(0, *(_QWORD *)(v35 + 16) + 1, 1, v35);
    *v34 = v35;
  }
  v38 = *(_QWORD *)(v35 + 16);
  v37 = *(_QWORD *)(v35 + 24);
  if (v38 >= v37 >> 1)
  {
    v35 = sub_22DDFCD2C(v37 > 1, v38 + 1, 1, v35);
    *v34 = v35;
  }
  *(_QWORD *)(v35 + 16) = v38 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v35+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v38, v11, v7);
  swift_endAccess();
}

void sub_22DE07F5C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23[3];

  v5 = v4;
  if (qword_255DB53A0 != -1)
    swift_once();
  v10 = sub_22DE1E410();
  __swift_project_value_buffer(v10, (uint64_t)qword_255DC3D30);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_22DE1E3F8();
  v12 = sub_22DE1F514();
  if (os_log_type_enabled(v11, v12))
  {
    v22 = v5;
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v23[0] = v14;
    *(_DWORD *)v13 = 136446723;
    sub_22DDA2E30(0xD00000000000004BLL, 0x800000022DE2CDA0, v23);
    sub_22DE1F628();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_22DDA2E30(a3, a4, v23);
    sub_22DE1F628();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2081;
    swift_bridgeObjectRetain();
    sub_22DDA2E30(a1, a2, v23);
    sub_22DE1F628();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22DD4B000, v11, v12, "%{public}s [%{public}s] [%{private}s]", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v14, -1, -1);
    v15 = v13;
    v5 = v22;
    MEMORY[0x22E320870](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v16 = objc_allocWithZone(MEMORY[0x24BE30DA0]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v18 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_initWithDescription_diagnosticExtensionIdentifier_, v17, v18);

  v20 = (_QWORD *)(v5 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachmentDescriptors);
  swift_beginAccess();
  v21 = v19;
  MEMORY[0x22E31FC34]();
  if (*(_QWORD *)((*v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22DE1F3F4();
  sub_22DE1F40C();
  sub_22DE1F3E8();
  swift_endAccess();

}

uint64_t sub_22DE0829C()
{
  return sub_22DE08EC8(&OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText);
}

uint64_t sub_22DE082A8(uint64_t a1, uint64_t a2)
{
  return sub_22DE08F24(a1, a2, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText);
}

uint64_t (*sub_22DE082B4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_22DE082F8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_22DE08358()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_22DE083A4(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_22DE083F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE08438()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22DE08470(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22DE0848C(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon;
  a1[2] = v1;
  a1[3] = v3;
  v4 = (_QWORD *)(v1 + v3);
  v5 = v4[1];
  *a1 = *v4;
  a1[1] = v5;
  swift_bridgeObjectRetain();
  return sub_22DE084D4;
}

uint64_t sub_22DE084D4(uint64_t a1)
{
  *(_OWORD *)(*(_QWORD *)(a1 + 16) + *(_QWORD *)(a1 + 24)) = *(_OWORD *)a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE084F0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22DE08534(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22DE0857C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE085C0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_launchedInBatchMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22DE08604()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle);
}

uint64_t sub_22DE08614(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle) = result;
  return result;
}

uint64_t (*sub_22DE08624(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_22DE07730;
}

uint64_t sub_22DE08648(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)result + *(_QWORD *)(result + 8)) = *(_BYTE *)(result + 16);
  return result;
}

id FBKFeedbackForm.init(identifier:)(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  _BYTE *v13;
  _QWORD *v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  objc_super v27;

  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod] = 2;
  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachmentDescriptors] = MEMORY[0x24BEE4AF8];
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices] = 0;
  v6 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices];
  *(_QWORD *)v6 = 10;
  v6[8] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions] = 1;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop] = 1;
  v7 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText];
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString] = 0;
  v8 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon];
  *v8 = 0;
  v8[1] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts] = 0;
  v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_sandboxExtensionAttachments] = v5;
  v9 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds] = 0;
  v10 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment];
  *(_WORD *)v10 = 0;
  v10[2] = 1;
  v11 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host];
  *v11 = 0;
  v11[1] = 0;
  v12 = &v2[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken];
  *v12 = 0;
  v12[1] = 0;
  v13 = v2;
  *(_QWORD *)&v13[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers] = sub_22DE06E08(v5);
  *(_QWORD *)&v13[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments] = v5;
  v14 = &v13[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_identifier];
  *v14 = a1;
  v14[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22DE231A0;
  *(_QWORD *)(inited + 32) = sub_22DE1E278();
  *(_QWORD *)(inited + 40) = v16;
  *(_QWORD *)(inited + 48) = sub_22DE1E26C();
  *(_QWORD *)(inited + 56) = v17;
  v18 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v19 = objc_msgSend(v18, sel_bundleIdentifier);

  if (!v19)
  {
    v20 = 0;
    v22 = 0;
    v23 = *(_QWORD *)(inited + 40);
    if (v23)
      goto LABEL_3;
LABEL_9:
    if (!v22)
    {
LABEL_18:
      swift_bridgeObjectRelease();
      v25 = 1;
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  v20 = sub_22DE1F2B0();
  v22 = v21;

  v23 = *(_QWORD *)(inited + 40);
  if (!v23)
    goto LABEL_9;
LABEL_3:
  if (!v22)
  {
    if (!*(_QWORD *)(inited + 56))
      goto LABEL_18;
    goto LABEL_16;
  }
  if (*(_QWORD *)(inited + 32) == v20 && v23 == v22 || (sub_22DE1F8E0() & 1) != 0)
    goto LABEL_14;
LABEL_10:
  v24 = *(_QWORD *)(inited + 56);
  if (v24 && (*(_QWORD *)(inited + 48) == v20 && v24 == v22 || (sub_22DE1F8E0() & 1) != 0))
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v25 = 0;
LABEL_19:
  v13[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_launchedInBatchMode] = v25;

  v27.receiver = v13;
  v27.super_class = (Class)type metadata accessor for FBKFeedbackForm();
  return objc_msgSendSuper2(&v27, sel_init);
}

uint64_t sub_22DE0898C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;

  v6 = *a1;
  v7 = a1[1];
  v8 = (uint64_t *)(v3 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers);
  swift_beginAccess();
  v9 = *v8;
  if (!*(_QWORD *)(*v8 + 16))
    goto LABEL_9;
  sub_22DDA492C(v6, v7);
  swift_bridgeObjectRetain();
  v10 = sub_22DDFD4E4(v6, v7);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_22DDA40E0(v6, v7);
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9BD0);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_22DE20F30;
    *(_QWORD *)(v12 + 32) = a2;
    *(_QWORD *)(v12 + 40) = a3;
    swift_beginAccess();
    sub_22DDA492C(v6, v7);
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_22DDA40E0(v6, v7);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v12 = (uint64_t)sub_22DDFCF68(0, *(_QWORD *)(v12 + 16) + 1, 1, (_QWORD *)v12);
  v14 = *(_QWORD *)(v12 + 16);
  v13 = *(_QWORD *)(v12 + 24);
  if (v14 >= v13 >> 1)
    v12 = (uint64_t)sub_22DDFCF68((_QWORD *)(v13 > 1), v14 + 1, 1, (_QWORD *)v12);
  *(_QWORD *)(v12 + 16) = v14 + 1;
  v15 = v12 + 16 * v14;
  *(_QWORD *)(v15 + 32) = a2;
  *(_QWORD *)(v15 + 40) = a3;
  swift_beginAccess();
  sub_22DDA492C(v6, v7);
LABEL_10:
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v18 = *v8;
  *v8 = 0x8000000000000000;
  sub_22DDFF53C(v12, v6, v7, isUniquelyReferenced_nonNull_native);
  *v8 = v18;
  swift_bridgeObjectRelease();
  sub_22DDA40E0(v6, v7);
  return swift_endAccess();
}

uint64_t sub_22DE08B94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_22DE08BDC(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId;
  result = swift_beginAccess();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_22DE08C38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE08C7C()
{
  return sub_22DE07614();
}

uint64_t sub_22DE08C88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22DE08CD8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22DE08D1C()
{
  uint64_t v0;
  unsigned __int16 *v1;

  v1 = (unsigned __int16 *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment);
  swift_beginAccess();
  return *v1 | (*((unsigned __int8 *)v1 + 2) << 16);
}

uint64_t sub_22DE08D68(int a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment;
  result = swift_beginAccess();
  *(_WORD *)v3 = a1;
  *(_BYTE *)(v3 + 2) = BYTE2(a1) & 1;
  return result;
}

uint64_t (*sub_22DE08DB8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE08DFC()
{
  return sub_22DE08EC8(&OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host);
}

uint64_t sub_22DE08E08(uint64_t a1, uint64_t a2)
{
  return sub_22DE08F24(a1, a2, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host);
}

uint64_t (*sub_22DE08E14())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22DE08E58(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE08EBC()
{
  return sub_22DE08EC8(&OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken);
}

uint64_t sub_22DE08EC8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_22DE08F18(uint64_t a1, uint64_t a2)
{
  return sub_22DE08F24(a1, a2, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken);
}

uint64_t sub_22DE08F24(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22DE08F7C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

char *FBKFeedbackForm.__allocating_init(formId:plugFormIds:environment:host:appToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14;
  id v15;
  char *v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;

  v14 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm());
  v15 = FBKFeedbackForm.init(identifier:)(0, 0xE000000000000000);
  sub_22DD70E78(0, (unint64_t *)&qword_255DB8980);
  v16 = (char *)v15;
  v17 = sub_22DE1F5A4();
  swift_bridgeObjectRelease();
  v18 = &v16[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment];
  swift_beginAccess();
  *(_WORD *)v18 = v17;
  v18[2] = BYTE2(v17) & 1;
  v19 = &v16[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds];
  swift_beginAccess();
  *(_QWORD *)v19 = a2;
  swift_bridgeObjectRelease();
  v20 = &v16[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId];
  swift_beginAccess();
  *(_QWORD *)v20 = a1;
  v20[8] = 0;
  v21 = &v16[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host];
  swift_beginAccess();
  *(_QWORD *)v21 = a5;
  *((_QWORD *)v21 + 1) = a6;
  swift_bridgeObjectRelease();
  v22 = &v16[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken];
  swift_beginAccess();
  *(_QWORD *)v22 = a7;
  *((_QWORD *)v22 + 1) = a8;

  swift_bridgeObjectRelease();
  return v16;
}

uint64_t static FBKFeedbackForm.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_22DE0916C(void *a1)
{
  uint64_t v1;
  uint64_t p_type;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  unsigned __int8 *v67;
  uint64_t v68;
  void *v69;
  unsigned __int8 *v70;
  uint64_t v71;
  void *v72;
  unsigned __int8 *v73;
  uint64_t v74;
  void *v75;
  unsigned __int8 *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t *v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  __int16 *v103;
  id v104;
  void *v105;
  _QWORD *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t result;
  uint64_t v117;
  uint64_t v118;
  int64_t v119;
  uint64_t v120[3];
  _QWORD *v121;

  v3 = v1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers;
  swift_beginAccess();
  v4 = *(_QWORD **)v3;
  v118 = *(_QWORD *)v3 + 64;
  v5 = 1 << *(_BYTE *)(*(_QWORD *)v3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(*(_QWORD *)v3 + 64);
  v119 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v8 << 6);
    }
    else
    {
      v13 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_69;
      if (v13 >= v119)
      {
LABEL_35:
        swift_release();
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BE0);
        v34 = (void *)sub_22DE1F238();
        swift_bridgeObjectRelease();
        v35 = (void *)sub_22DE1F28C();
        p_type = (uint64_t)&stru_24F998FF0.type;
        v8 = (int64_t)a1;
        objc_msgSend(a1, sel_encodeObject_forKey_, v34, v35);

        swift_beginAccess();
        swift_bridgeObjectRetain();
        v36 = (void *)sub_22DE1F28C();
        swift_bridgeObjectRelease();
        v37 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeObject_forKey_, v36, v37);

        v38 = (unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod);
        swift_beginAccess();
        v39 = *v38;
        v40 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeInteger_forKey_, v39, v40);

        type metadata accessor for SandboxExtensionURL();
        swift_bridgeObjectRetain();
        v41 = (void *)sub_22DE1F3C4();
        swift_bridgeObjectRelease();
        v42 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeObject_forKey_, v41, v42);

        v43 = v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText;
        swift_beginAccess();
        if (*(_QWORD *)(v43 + 8))
        {
          swift_bridgeObjectRetain();
          v44 = sub_22DE1F28C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v44 = 0;
        }
        v45 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeObject_forKey_, v44, v45);
        swift_unknownObjectRelease();

        v46 = (id *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString);
        swift_beginAccess();
        v47 = *v46;
        v48 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeObject_forKey_, v47, v48);

        v49 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle);
        v50 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v49, v50);

        if (*(_QWORD *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon + 8))
        {
          swift_bridgeObjectRetain();
          v51 = sub_22DE1F28C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v51 = 0;
        }
        v52 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeObject_forKey_, v51, v52);
        swift_unknownObjectRelease();

        swift_beginAccess();
        sub_22DD70E78(0, &qword_255DB9BE8);
        swift_bridgeObjectRetain();
        v53 = (void *)sub_22DE1F3C4();
        swift_bridgeObjectRelease();
        v54 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeObject_forKey_, v53, v54);

        v55 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton);
        v56 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v55, v56);

        v57 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching);
        v58 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v57, v58);

        v59 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled);
        v60 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v59, v60);

        v61 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo);
        v62 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v61, v62);

        v63 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast);
        v64 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v63, v64);

        v65 = *(unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices);
        v66 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v65, v66);

        v67 = (unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts);
        swift_beginAccess();
        v68 = *v67;
        v69 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v68, v69);

        v70 = (unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_launchedInBatchMode);
        swift_beginAccess();
        v71 = *v70;
        v72 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v71, v72);

        v73 = (unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions);
        swift_beginAccess();
        v74 = *v73;
        v75 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v74, v75);

        v76 = (unsigned __int8 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop);
        swift_beginAccess();
        v77 = *v76;
        v78 = (void *)sub_22DE1F28C();
        objc_msgSend(a1, sel_encodeBool_forKey_, v77, v78);

        if ((*(_BYTE *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices + 8) & 1) == 0)
        {
          v79 = *(_QWORD *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices);
          v80 = (void *)sub_22DE1F28C();
          objc_msgSend(a1, sel_encodeInteger_forKey_, v79, v80);

        }
        sub_22DE1DDD4();
        swift_allocObject();
        sub_22DE1DDC8();
        v81 = (uint64_t *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses);
        swift_beginAccess();
        if (*v81)
        {
          v120[0] = *v81;
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BF0);
          sub_22DE1024C(&qword_255DB9BF8, &qword_255DB9BF0, (uint64_t (*)(void))sub_22DE0FBB0, MEMORY[0x24BEE12A0]);
          v95 = sub_22DE1DDBC();
          v97 = v96;
          swift_bridgeObjectRelease();
          v98 = (void *)sub_22DE1DFC0();
          v99 = (void *)sub_22DE1F28C();
          objc_msgSend(a1, sel_encodeObject_forKey_, v98, v99);

          sub_22DD64894(v95, v97);
          goto LABEL_53;
        }
        if (qword_255DB53A0 != -1)
          swift_once();
        v92 = sub_22DE1E410();
        __swift_project_value_buffer(v92, (uint64_t)qword_255DC3D30);
        v85 = sub_22DE1E3F8();
        v93 = sub_22DE1F4F0();
        if (os_log_type_enabled(v85, v93))
        {
          v94 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v94 = 0;
          _os_log_impl(&dword_22DD4B000, v85, v93, "No FBKFeedbackForm.FormResponses", v94, 2u);
          MEMORY[0x22E320870](v94, -1, -1);
        }
        goto LABEL_52;
      }
      v14 = *(_QWORD *)(v118 + 8 * v13);
      ++v8;
      if (!v14)
      {
        v8 = v13 + 1;
        if (v13 + 1 >= v119)
          goto LABEL_35;
        v14 = *(_QWORD *)(v118 + 8 * v8);
        if (!v14)
        {
          v8 = v13 + 2;
          if (v13 + 2 >= v119)
            goto LABEL_35;
          v14 = *(_QWORD *)(v118 + 8 * v8);
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v119)
              goto LABEL_35;
            v14 = *(_QWORD *)(v118 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                v8 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_70;
                if (v8 >= v119)
                  goto LABEL_35;
                v14 = *(_QWORD *)(v118 + 8 * v8);
                ++v15;
                if (v14)
                  goto LABEL_21;
              }
            }
            v8 = v15;
          }
        }
      }
LABEL_21:
      v7 = (v14 - 1) & v14;
      v12 = __clz(__rbit64(v14)) + (v8 << 6);
    }
    v16 = (uint64_t *)(v4[6] + 16 * v12);
    v17 = *v16;
    v18 = v16[1];
    v19 = *v16;
    v20 = v18;
    if (v18 <= 2)
    {
      v19 = *(_QWORD *)&aTitle_8[8 * v18];
      v20 = *(_QWORD *)&aDescrip_2[8 * v18 + 8];
    }
    v21 = *(_QWORD *)(v4[7] + 8 * v12);
    swift_bridgeObjectRetain();
    sub_22DDA492C(v17, v18);
    p_type = swift_isUniquelyReferenced_nonNull_native();
    v121 = v9;
    v23 = sub_22DDFD368(v19, v20);
    v24 = v9[2];
    v25 = (v22 & 1) == 0;
    v26 = v24 + v25;
    if (__OFADD__(v24, v25))
      break;
    v27 = v22;
    if (v9[3] >= v26)
    {
      if ((p_type & 1) != 0)
      {
        v9 = v121;
        if ((v22 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_22DDFFA74();
        v9 = v121;
        if ((v27 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_22DDFE014(v26, p_type);
      v28 = sub_22DDFD368(v19, v20);
      if ((v27 & 1) != (v29 & 1))
      {
        result = sub_22DE1F91C();
        __break(1u);
        return result;
      }
      v23 = v28;
      v9 = v121;
      if ((v27 & 1) != 0)
      {
LABEL_4:
        v10 = v9[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v10 + 8 * v23) = v21;
        goto LABEL_5;
      }
    }
    v9[(v23 >> 6) + 8] |= 1 << v23;
    v30 = (uint64_t *)(v9[6] + 16 * v23);
    *v30 = v19;
    v30[1] = v20;
    *(_QWORD *)(v9[7] + 8 * v23) = v21;
    v31 = v9[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_68;
    v9[2] = v33;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
  swift_once();
  v82 = sub_22DE1E410();
  __swift_project_value_buffer(v82, (uint64_t)qword_255DC3D30);
  v83 = v4;
  v84 = v4;
  v85 = sub_22DE1E3F8();
  v86 = sub_22DE1F4FC();
  if (os_log_type_enabled(v85, v86))
  {
    v87 = (uint8_t *)swift_slowAlloc();
    v88 = swift_slowAlloc();
    v120[0] = v88;
    *(_DWORD *)v87 = 136446210;
    v89 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
    v90 = sub_22DE1F2EC();
    sub_22DDA2E30(v90, v91, v120);
    v8 = (int64_t)a1;
    p_type = 0x24F999000;
    sub_22DE1F628();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22DD4B000, v85, v86, "Failed to JSON encode FormResponses in FBKFeedbackForm: %{public}s", v87, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v88, -1, -1);
    MEMORY[0x22E320870](v87, -1, -1);

    goto LABEL_53;
  }

LABEL_52:
LABEL_53:
  if (MEMORY[0x22E32027C]())
  {
    v100 = v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId;
    swift_beginAccess();
    if ((*(_BYTE *)(v100 + 8) & 1) == 0)
    {
      v101 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, *(_QWORD *)v100);
      v102 = (void *)sub_22DE1F28C();
      objc_msgSend((id)v8, *(SEL *)(p_type + 2232), v101, v102);

    }
    v103 = (__int16 *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment);
    swift_beginAccess();
    if ((v103[1] & 1) == 0)
    {
      v104 = (id)MEMORY[0x22E320294](*v103);
      if (!v104)
      {
        sub_22DE1F2B0();
        v104 = (id)sub_22DE1F28C();
        swift_bridgeObjectRelease();
      }
      v105 = (void *)sub_22DE1F28C();
      objc_msgSend((id)v8, *(SEL *)(p_type + 2232), v104, v105);

    }
    v106 = (_QWORD *)(v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds);
    swift_beginAccess();
    if (*v106)
    {
      swift_bridgeObjectRetain();
      v107 = (void *)sub_22DE1F3C4();
      swift_bridgeObjectRelease();
      v108 = (void *)sub_22DE1F28C();
      objc_msgSend((id)v8, *(SEL *)(p_type + 2232), v107, v108);

    }
    v109 = v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host;
    swift_beginAccess();
    if (*(_QWORD *)(v109 + 8))
    {
      swift_bridgeObjectRetain();
      v110 = (void *)sub_22DE1F28C();
      swift_bridgeObjectRelease();
      v111 = (void *)sub_22DE1F28C();
      objc_msgSend((id)v8, *(SEL *)(p_type + 2232), v110, v111);

    }
    v112 = v117 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken;
    swift_beginAccess();
    if (*(_QWORD *)(v112 + 8))
    {
      swift_bridgeObjectRetain();
      v113 = (void *)sub_22DE1F28C();
      swift_bridgeObjectRelease();
      v114 = (void *)sub_22DE1F28C();
      objc_msgSend((id)v8, *(SEL *)(p_type + 2232), v113, v114);

    }
  }
  return swift_release();
}

uint64_t FBKFeedbackForm.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FBKFeedbackForm.init(coder:)(a1);
}

uint64_t FBKFeedbackForm.init(coder:)(void *a1)
{
  _BYTE *v1;
  unint64_t v2;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char **v43;
  unsigned __int8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  void *v51;
  unsigned __int8 v52;
  void *v53;
  unsigned __int8 v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned __int8 v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  id v103;
  int64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v108;
  int64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  unint64_t v114;
  BOOL v116;
  _BOOL4 v118;
  BOOL v120;
  uint64_t *v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  unsigned __int8 v127;
  uint64_t result;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD *v131;
  char *v132;
  char *v133;
  uint64_t *v134;
  uint64_t *v135;
  void **v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  unsigned __int8 *v144;
  uint64_t v145;
  _BYTE *v146;
  id v147;
  unint64_t v148;
  _BYTE *v149;
  unint64_t v150;
  uint64_t *v151;
  int64_t v152;
  unint64_t v153;
  int64_t v154;
  uint64_t v155;
  BOOL v156;
  _BOOL4 v157;
  char **v158;
  uint64_t v159[2];
  objc_super v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  __int128 v164;
  uint64_t v165;
  __int128 v166;
  uint64_t v167;

  v2 = (unint64_t)v1;
  v4 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod];
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod] = 2;
  v5 = MEMORY[0x24BEE4AF8];
  v131 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachmentDescriptors];
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachmentDescriptors] = MEMORY[0x24BEE4AF8];
  v138 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton] = 0;
  v139 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching] = 0;
  v143 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo] = 0;
  v145 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast] = 0;
  v140 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled] = 0;
  v141 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices] = 0;
  v6 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices];
  *(_QWORD *)v6 = 10;
  v142 = v6;
  v6[8] = 0;
  v130 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses];
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses] = 0;
  v146 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions];
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions] = 1;
  v149 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop];
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop] = 1;
  v7 = (uint64_t *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText];
  *v7 = 0;
  v7[1] = 0;
  v136 = (void **)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString];
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString] = 0;
  v8 = (uint64_t *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon];
  *v8 = 0;
  v8[1] = 0;
  v151 = v8;
  v144 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts];
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts] = 0;
  v137 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle;
  v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle] = 0;
  v9 = OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_sandboxExtensionAttachments;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_sandboxExtensionAttachments] = v5;
  v10 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId];
  *(_QWORD *)v10 = 0;
  v133 = v10;
  v10[8] = 1;
  v11 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds];
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds] = 0;
  v12 = &v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment];
  *(_WORD *)v12 = 0;
  v132 = v12;
  v12[2] = 1;
  v13 = (uint64_t *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host];
  *v13 = 0;
  v13[1] = 0;
  v135 = v13;
  v14 = (uint64_t *)&v1[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken];
  *v14 = 0;
  v14[1] = 0;
  v134 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB8E00);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_22DE23E60;
  *(_QWORD *)(v15 + 32) = sub_22DD70E78(0, &qword_255DB8E08);
  v155 = sub_22DD70E78(0, (unint64_t *)&unk_255DB9C10);
  *(_QWORD *)(v15 + 40) = v155;
  *(_QWORD *)(v15 + 48) = sub_22DD70E78(0, (unint64_t *)&unk_255DB8E10);
  v16 = v1;
  sub_22DE1F5D4();
  swift_bridgeObjectRelease();
  if (!v165)
    goto LABEL_121;
  v129 = v11;
  sub_22DDB26A8(&v164, &v166);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C20);
  swift_dynamicCast();
  v17 = v163;
  *(_QWORD *)&v16[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers] = MEMORY[0x24BEE4B00];
  v18 = sub_22DE1F5C8();
  if (v18)
  {
    v19 = (void *)v18;
    v20 = v16;
    v21 = sub_22DE1F2B0();
    v23 = v22;

    v24 = (uint64_t *)&v20[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_identifier];
    *v24 = v21;
    v24[1] = v23;
    v25 = (void *)sub_22DE1F28C();
    v26 = objc_msgSend(a1, sel_decodeIntegerForKey_, v25);

    if ((unint64_t)v26 >= 3)
      v27 = 1;
    else
      v27 = (char)v26;
    swift_beginAccess();
    *v4 = v27;
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_22DE231A0;
    *(_QWORD *)(v28 + 32) = v155;
    *(_QWORD *)(v28 + 40) = type metadata accessor for SandboxExtensionURL();
    sub_22DE1F5D4();
    swift_bridgeObjectRelease();
    if (v165)
    {
      sub_22DDB26A8(&v164, &v166);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C28);
      swift_dynamicCast();
      *(_QWORD *)(v2 + v9) = v162;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v20[OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments] = MEMORY[0x24BEE4AF8];
      v147 = a1;
      v29 = sub_22DE1F5C8();
      if (v29)
      {
        v30 = (void *)v29;
        v31 = sub_22DE1F2B0();
        v33 = v32;

      }
      else
      {
        v31 = 0;
        v33 = 0;
      }
      swift_beginAccess();
      *v7 = v31;
      v7[1] = v33;
      swift_bridgeObjectRelease();
      sub_22DD70E78(0, (unint64_t *)&unk_255DB9C30);
      v34 = sub_22DE1F5C8();
      swift_beginAccess();
      v35 = *v136;
      *v136 = (void *)v34;

      v36 = sub_22DE1F5C8();
      v37 = (uint64_t)v20;
      if (v36)
      {
        v38 = (void *)v36;
        v39 = sub_22DE1F2B0();
        v41 = v40;

      }
      else
      {
        v39 = 0;
        v41 = 0;
      }
      *v151 = v39;
      v151[1] = v41;
      swift_bridgeObjectRelease();
      v42 = (void *)sub_22DE1F28C();
      v43 = &selRef_prepareImageForDescriptor_;
      v44 = objc_msgSend(v147, sel_decodeBoolForKey_, v42);

      *(_BYTE *)(v2 + v137) = v44;
      v45 = swift_allocObject();
      *(_OWORD *)(v45 + 16) = xmmword_22DE231A0;
      *(_QWORD *)(v45 + 32) = v155;
      *(_QWORD *)(v45 + 40) = sub_22DD70E78(0, &qword_255DB9BE8);
      sub_22DE1F5D4();
      swift_bridgeObjectRelease();
      if (v167)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C68);
        v46 = v138;
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_beginAccess();
          *v131 = v161;
          swift_bridgeObjectRelease();
          while (1)
          {
            v51 = (void *)sub_22DE1F28C();
            v52 = objc_msgSend(v147, v43[9], v51);

            *(_BYTE *)(v2 + v46) = v52;
            v53 = (void *)sub_22DE1F28C();
            v54 = objc_msgSend(v147, v43[9], v53);

            *(_BYTE *)(v2 + v139) = v54;
            v55 = (void *)sub_22DE1F28C();
            v56 = objc_msgSend(v147, v43[9], v55);

            *(_BYTE *)(v2 + v140) = v56;
            v57 = (void *)sub_22DE1F28C();
            v58 = objc_msgSend(v147, v43[9], v57);

            *(_BYTE *)(v2 + v141) = v58;
            v59 = (void *)sub_22DE1F28C();
            v60 = objc_msgSend(v147, sel_decodeIntegerForKey_, v59);

            *(_QWORD *)v142 = v60;
            v142[8] = 0;
            v61 = (void *)sub_22DE1F28C();
            LOBYTE(v60) = objc_msgSend(v147, v43[9], v61);

            *(_BYTE *)(v2 + v143) = (_BYTE)v60;
            v62 = (void *)sub_22DE1F28C();
            LOBYTE(v60) = objc_msgSend(v147, v43[9], v62);

            *(_BYTE *)(v2 + v145) = (_BYTE)v60;
            v63 = (void *)sub_22DE1F28C();
            v64 = objc_msgSend(v147, v43[9], v63);

            swift_beginAccess();
            *v144 = v64;
            v65 = (void *)sub_22DE1F28C();
            LOBYTE(v63) = objc_msgSend(v147, v43[9], v65);

            *(_BYTE *)(v37 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_launchedInBatchMode) = (_BYTE)v63;
            v66 = (void *)sub_22DE1F28C();
            LOBYTE(v63) = objc_msgSend(v147, v43[9], v66);

            swift_beginAccess();
            *v146 = (_BYTE)v63;
            v67 = (void *)sub_22DE1F28C();
            LOBYTE(v63) = objc_msgSend(v147, v43[9], v67);

            swift_beginAccess();
            *v149 = (_BYTE)v63;
            sub_22DD70E78(0, (unint64_t *)&unk_255DB9C40);
            v146 = (_BYTE *)sub_22DE1F5C8();
            if (v146)
            {
              v68 = sub_22DE1DFCC();
              v70 = v69;
              sub_22DE1DDB0();
              swift_allocObject();
              sub_22DE1DDA4();
              __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BF0);
              sub_22DE1024C(&qword_255DB9C58, &qword_255DB9BF0, (uint64_t (*)(void))sub_22DE0FBF4, MEMORY[0x24BEE12D0]);
              sub_22DE1DD98();
              sub_22DD64894(v68, v70);
              swift_release();
              v75 = v166;
              swift_beginAccess();
              *v130 = v75;
              swift_bridgeObjectRelease();
              v37 = (uint64_t)v20;
            }
            else
            {
              if (qword_255DB53A0 != -1)
                swift_once();
              v71 = sub_22DE1E410();
              __swift_project_value_buffer(v71, (uint64_t)qword_255DC3D30);
              v72 = sub_22DE1E3F8();
              v73 = sub_22DE1F4F0();
              if (os_log_type_enabled(v72, v73))
              {
                v74 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v74 = 0;
                _os_log_impl(&dword_22DD4B000, v72, v73, "No formResponsesJSONData", v74, 2u);
                MEMORY[0x22E320870](v74, -1, -1);
              }

            }
            v148 = v17;
            v145 = 0;
            if ((MEMORY[0x22E32027C]() & 1) == 0)
              break;
            v76 = sub_22DE1F5C8();
            if (v76)
            {
              v77 = (void *)v76;
              sub_22DE1F2B0();

              sub_22DD70E78(0, (unint64_t *)&qword_255DB8980);
              LODWORD(v77) = sub_22DE1F5A4();
              swift_bridgeObjectRelease();
              swift_beginAccess();
              *(_WORD *)v132 = (_WORD)v77;
              v132[2] = BYTE2(v77) & 1;
            }
            v78 = sub_22DE1F5C8();
            if (v78)
            {
              v79 = (void *)v78;
              v80 = sub_22DE1F2B0();
              v82 = v81;

            }
            else
            {
              v80 = 0;
              v82 = 0;
            }
            swift_beginAccess();
            *v135 = v80;
            v135[1] = v82;
            swift_bridgeObjectRelease();
            v83 = sub_22DD70E78(0, &qword_255DB7D70);
            v84 = (void *)sub_22DE1F5C8();
            if (v84)
            {
              v85 = v84;
              v86 = objc_msgSend(v84, sel_unsignedIntegerValue);

              swift_beginAccess();
              *(_QWORD *)v133 = v86;
              v133[8] = 0;
            }
            v87 = swift_allocObject();
            *(_OWORD *)(v87 + 16) = xmmword_22DE231A0;
            *(_QWORD *)(v87 + 32) = v155;
            *(_QWORD *)(v87 + 40) = v83;
            sub_22DE1F5D4();
            swift_bridgeObjectRelease();
            if (!v167)
            {
              sub_22DD7CA0C((uint64_t)&v166);
              goto LABEL_59;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C50);
            if ((swift_dynamicCast() & 1) == 0)
              goto LABEL_59;
            v43 = v158;
            if ((unint64_t)v158 >> 62)
            {
              swift_bridgeObjectRetain();
              v37 = sub_22DE1F7D8();
              swift_bridgeObjectRelease();
              if (!v37)
              {
LABEL_57:
                swift_bridgeObjectRelease();
                v88 = MEMORY[0x24BEE4AF8];
LABEL_58:
                swift_beginAccess();
                *v129 = v88;
                swift_bridgeObjectRelease();
                v37 = (uint64_t)v20;
LABEL_59:
                v94 = sub_22DE1F5C8();
                if (v94)
                {
                  v95 = (void *)v94;
                  v96 = sub_22DE1F2B0();
                  v98 = v97;

                }
                else
                {
                  v96 = 0;
                  v98 = 0;
                }
                swift_beginAccess();
                *v134 = v96;
                v134[1] = v98;

                swift_bridgeObjectRelease();
LABEL_63:
                v160.receiver = (id)v37;
                v160.super_class = (Class)type metadata accessor for FBKFeedbackForm();
                v99 = objc_msgSendSuper2(&v160, sel_init);
                v150 = v17 + 64;
                v100 = 1 << *(_BYTE *)(v17 + 32);
                v101 = -1;
                if (v100 < 64)
                  v101 = ~(-1 << v100);
                v102 = v101 & *(_QWORD *)(v17 + 64);
                v152 = (unint64_t)(v100 + 63) >> 6;
                v103 = v99;
                v104 = 0;
                while (1)
                {
                  if (v102)
                  {
                    v105 = __clz(__rbit64(v102));
                    v102 &= v102 - 1;
                    v106 = v105 | (v104 << 6);
                  }
                  else
                  {
                    if (__OFADD__(v104++, 1))
                    {
                      __break(1u);
                      goto LABEL_119;
                    }
                    if (v104 >= v152)
                      goto LABEL_117;
                    v108 = *(_QWORD *)(v150 + 8 * v104);
                    if (!v108)
                    {
                      v109 = v104 + 1;
                      if (v104 + 1 >= v152)
                        goto LABEL_117;
                      v108 = *(_QWORD *)(v150 + 8 * v109);
                      if (!v108)
                      {
                        v109 = v104 + 2;
                        if (v104 + 2 >= v152)
                          goto LABEL_117;
                        v108 = *(_QWORD *)(v150 + 8 * v109);
                        if (!v108)
                        {
                          v109 = v104 + 3;
                          if (v104 + 3 >= v152)
                          {
LABEL_117:

                            swift_release();
                            return (uint64_t)v103;
                          }
                          v108 = *(_QWORD *)(v150 + 8 * v109);
                          if (!v108)
                          {
                            while (1)
                            {
                              v104 = v109 + 1;
                              if (__OFADD__(v109, 1))
                                break;
                              if (v104 >= v152)
                                goto LABEL_117;
                              v108 = *(_QWORD *)(v150 + 8 * v104);
                              ++v109;
                              if (v108)
                                goto LABEL_79;
                            }
LABEL_119:
                            __break(1u);
LABEL_120:
                            __break(1u);
LABEL_121:
                            __break(1u);
                            goto LABEL_122;
                          }
                        }
                      }
                      v104 = v109;
                    }
LABEL_79:
                    v102 = (v108 - 1) & v108;
                    v106 = __clz(__rbit64(v108)) + (v104 << 6);
                  }
                  v110 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v106);
                  v111 = *(_QWORD *)(v110 + 16);
                  if (v111)
                  {
                    v153 = v102;
                    v154 = v104;
                    v112 = (uint64_t *)(*(_QWORD *)(v17 + 48) + 16 * v106);
                    v113 = *v112;
                    v114 = v112[1];
                    v116 = *v112 == 0x656C7469743ALL && v114 == 0xE600000000000000;
                    v118 = v113 == 0x616572613ALL && v114 == 0xE500000000000000;
                    v157 = v118;
                    v120 = v113 == 0x706972637365643ALL && v114 == 0xEC0000006E6F6974;
                    v156 = v120;
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    v121 = (uint64_t *)(v110 + 40);
                    do
                    {
                      v125 = *(v121 - 1);
                      v124 = *v121;
                      if (v116)
                      {
                        v122 = 0;
                        v123 = 0;
                      }
                      else
                      {
                        v126 = sub_22DE1F8E0();
                        if (((v126 | v157) & 1) != 0)
                        {
                          v122 = 0;
                          v123 = ~v126 & 1;
                        }
                        else
                        {
                          v127 = sub_22DE1F8E0();
                          if ((v127 & 1) != 0)
                            v123 = 1;
                          else
                            v123 = 2;
                          if (((v127 | v156) & 1) != 0)
                          {
                            v122 = 0;
                          }
                          else if ((sub_22DE1F8E0() & 1) != 0)
                          {
                            v122 = 0;
                            v123 = 2;
                          }
                          else
                          {
                            swift_bridgeObjectRetain();
                            v122 = v113;
                            v123 = v114;
                          }
                        }
                      }
                      v121 += 2;
                      v159[0] = v122;
                      v159[1] = v123;
                      swift_bridgeObjectRetain();
                      sub_22DE0898C(v159, v125, v124);
                      swift_bridgeObjectRelease();
                      sub_22DDA40E0(v122, v123);
                      --v111;
                    }
                    while (v111);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    v17 = v148;
                    v104 = v154;
                    v102 = v153;
                  }
                }
              }
            }
            else
            {
              v37 = *(_QWORD *)(((unint64_t)v158 & 0xFFFFFFFFFFFFF8) + 0x10);
              if (!v37)
                goto LABEL_57;
            }
            *(_QWORD *)&v166 = MEMORY[0x24BEE4AF8];
            sub_22DE0F2D4(0, v37 & ~(v37 >> 63), 0);
            if (v37 < 0)
              goto LABEL_120;
            v46 = 0;
            v88 = v166;
            v17 = (unint64_t)v158 & 0xC000000000000001;
            while (v37 != v46)
            {
              if (v17)
                v89 = (char *)MEMORY[0x22E31FFC4](v46);
              else
                v89 = v158[v46 + 4];
              v90 = v89;
              v91 = (unint64_t)objc_msgSend(v89, sel_integerValue);
              if ((v91 & 0x8000000000000000) != 0)
                goto LABEL_124;
              v92 = v91;

              *(_QWORD *)&v166 = v88;
              v2 = *(_QWORD *)(v88 + 16);
              v93 = *(_QWORD *)(v88 + 24);
              if (v2 >= v93 >> 1)
              {
                sub_22DE0F2D4(v93 > 1, v2 + 1, 1);
                v88 = v166;
              }
              ++v46;
              *(_QWORD *)(v88 + 16) = v2 + 1;
              *(_QWORD *)(v88 + 8 * v2 + 32) = v92;
              if (v37 == v46)
              {
                swift_bridgeObjectRelease();
                v17 = v148;
                goto LABEL_58;
              }
            }
            __break(1u);
LABEL_55:
            swift_once();
LABEL_18:
            v47 = sub_22DE1E410();
            __swift_project_value_buffer(v47, (uint64_t)qword_255DC3D30);
            v48 = sub_22DE1E3F8();
            v49 = sub_22DE1F4FC();
            if (os_log_type_enabled(v48, v49))
            {
              v50 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v50 = 0;
              _os_log_impl(&dword_22DD4B000, v48, v49, "Failed to decode attachmentDescriptors", v50, 2u);
              MEMORY[0x22E320870](v50, -1, -1);
            }

          }
          goto LABEL_63;
        }
      }
      else
      {
        sub_22DD7CA0C((uint64_t)&v166);
        v46 = v138;
      }
      if (qword_255DB53A0 == -1)
        goto LABEL_18;
      goto LABEL_55;
    }
  }
  else
  {
LABEL_122:
    __break(1u);
  }
  __break(1u);
LABEL_124:
  result = sub_22DE1F7C0();
  __break(1u);
  return result;
}

id FBKFeedbackForm.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBKFeedbackForm.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FBKFeedbackForm.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKFeedbackForm();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22DE0BA18(char a1)
{
  if ((a1 & 1) != 0)
    return 0x696669746E656469;
  else
    return 1954047348;
}

uint64_t sub_22DE0BA54()
{
  char *v0;

  return sub_22DE0BA18(*v0);
}

uint64_t sub_22DE0BA5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE12D18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22DE0BA80()
{
  sub_22DE0FC38();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0BAA8()
{
  sub_22DE0FC38();
  return sub_22DE1F9AC();
}

uint64_t FBKFeedbackForm.FormResponse.Question.Kind.Choice.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C70);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE0FC38();
  sub_22DE1F994();
  v12 = 0;
  sub_22DE1F898();
  if (!v2)
  {
    v11 = 1;
    sub_22DE1F898();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t FBKFeedbackForm.FormResponse.Question.Kind.Choice.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE0FC38();
  sub_22DE1F988();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = 0;
  v9 = sub_22DE1F850();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_22DE1F850();
  v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v16;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE0BDA4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return FBKFeedbackForm.FormResponse.Question.Kind.Choice.init(from:)(a1, a2);
}

uint64_t sub_22DE0BDB8(_QWORD *a1)
{
  return FBKFeedbackForm.FormResponse.Question.Kind.Choice.encode(to:)(a1);
}

BOOL FBKFeedbackForm.FormResponse.Question.Kind.hasChoiceAnswer.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8) < 3u;
}

uint64_t FBKFeedbackForm.FormResponse.Question.Kind.description.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22DE0BE10
                                                                     + 4 * byte_22DE26D40[*(unsigned __int8 *)(v0 + 8)]))(0xD00000000000001DLL, 0x800000022DE2D0B0);
}

uint64_t sub_22DE0BE10()
{
  return 0x656C7069746C754DLL;
}

uint64_t sub_22DE0BE34()
{
  return 0x726564696C53;
}

uint64_t sub_22DE0BE48()
{
  _QWORD *v0;

  return *(_QWORD *)&aTextFietextAre[8 * *v0];
}

uint64_t sub_22DE0BE6C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22DE0BEA4 + 4 * byte_22DE26D44[a1]))(0xD00000000000001ALL, 0x800000022DE2D270);
}

uint64_t sub_22DE0BEA4()
{
  return 0x6C65694674786574;
}

uint64_t sub_22DE0BEC0()
{
  return 0x6165724174786574;
}

uint64_t sub_22DE0BED8()
{
  return 0x656C7069746C756DLL;
}

uint64_t sub_22DE0BEFC()
{
  return 0x726564696C73;
}

uint64_t sub_22DE0BF10()
{
  return 1702125924;
}

uint64_t sub_22DE0BF20()
{
  return 0x656D695465746164;
}

uint64_t sub_22DE0BF38()
{
  return 1701669236;
}

uint64_t sub_22DE0BF48()
{
  unsigned __int8 *v0;

  return sub_22DE0BE6C(*v0);
}

uint64_t sub_22DE0BF50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE12DF8(a1, a2);
  *a3 = result;
  return result;
}

void sub_22DE0BF74(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_22DE0BF80()
{
  sub_22DE0FC7C();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0BFA8()
{
  sub_22DE0FC7C();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0BFD0()
{
  return 0;
}

uint64_t sub_22DE0BFDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_22DE0C008(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22DE0C014()
{
  sub_22DE0FD48();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C03C()
{
  sub_22DE0FD48();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C064()
{
  sub_22DE0FD04();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C08C()
{
  sub_22DE0FD04();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C0B4()
{
  return 1;
}

uint64_t sub_22DE0C0C8()
{
  sub_22DE0FE14();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C0F0()
{
  sub_22DE0FE14();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C118()
{
  sub_22DE0FE58();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C140()
{
  sub_22DE0FE58();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE13100(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22DE0C190()
{
  sub_22DE0FD8C();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C1B8()
{
  sub_22DE0FD8C();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C1E0()
{
  sub_22DE0FE9C();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C208()
{
  sub_22DE0FE9C();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C230()
{
  sub_22DE0FEE0();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C258()
{
  sub_22DE0FEE0();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0C280()
{
  sub_22DE0FCC0();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0C2A8()
{
  sub_22DE0FCC0();
  return sub_22DE1F9AC();
}

void FBKFeedbackForm.FormResponse.Question.Kind.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v20;
  _QWORD v21[2];
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
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C88);
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C90);
  v27 = *(_QWORD *)(v6 - 8);
  v28 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v26 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9C98);
  v24 = *(_QWORD *)(v8 - 8);
  v25 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v23 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CA0);
  v39 = *(_QWORD *)(v10 - 8);
  v40 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v38 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CA8);
  v36 = *(_QWORD *)(v12 - 8);
  v37 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v35 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CB0);
  v33 = *(_QWORD *)(v14 - 8);
  v34 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v32 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CB8);
  v21[1] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v21[0] = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CC0);
  MEMORY[0x24BDAC7A8](v17);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CC8);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(unsigned __int8 *)(v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE0FC7C();
  v42 = v19;
  sub_22DE1F994();
  __asm { BR              X9 }
}

uint64_t sub_22DE0C5A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v1 - 72) = 2;
  sub_22DE0FE58();
  v2 = *(_QWORD *)(v1 - 192);
  v4 = *(_QWORD *)(v1 - 112);
  v3 = *(_QWORD *)(v1 - 104);
  sub_22DE1F880();
  *(_QWORD *)(v1 - 72) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9CF8);
  sub_22DE1024C(&qword_255DB9D00, &qword_255DB9CF8, (uint64_t (*)(void))sub_22DE0FDD0, MEMORY[0x24BEE12A0]);
  v5 = *(_QWORD *)(v1 - 176);
  sub_22DE1F8B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 184) + 8))(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 120) + 8))(v4, v3);
}

uint64_t FBKFeedbackForm.FormResponse.Question.Kind.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD v26[4];
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
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;

  v42 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D30);
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v46 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D38);
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D40);
  v31 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v40 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D48);
  v30 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v45 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D50);
  v32 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D58);
  v28 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v44 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D60);
  v26[3] = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D68);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D70);
  v15 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v48 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_22DE0FC7C();
  v19 = v49;
  sub_22DE1F988();
  if (!v19)
  {
    v26[2] = v14;
    v26[0] = v12;
    v26[1] = v11;
    v49 = v15;
    v20 = sub_22DE1F874();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X10 }
    v21 = sub_22DE1F760();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D78);
    *v23 = &type metadata for FBKFeedbackForm.FormResponse.Question.Kind;
    v24 = v47;
    sub_22DE1F838();
    sub_22DE1F754();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v17, v24);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
}

uint64_t sub_22DE0D35C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKFeedbackForm.FormResponse.Question.Kind.init(from:)(a1, a2);
}

void sub_22DE0D370(_QWORD *a1)
{
  FBKFeedbackForm.FormResponse.Question.Kind.encode(to:)(a1);
}

void FBKFeedbackForm.FormResponse.Question.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_22DE1F328();
  __asm { BR              X9 }
}

uint64_t sub_22DE0D3F4()
{
  uint64_t v0;
  unsigned __int8 v1;
  uint64_t v3;

  sub_22DDAA44C(v0, v1);
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  sub_22DDAA4C4(v0, v1);
  return v3;
}

uint64_t sub_22DE0D494(char a1)
{
  return *(_QWORD *)&aIdentifidispla[8 * a1];
}

uint64_t sub_22DE0D4B4()
{
  char *v0;

  return sub_22DE0D494(*v0);
}

uint64_t sub_22DE0D4BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE1319C(a1, a2);
  *a3 = result;
  return result;
}

void sub_22DE0D4E0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_22DE0D4EC()
{
  sub_22DE0FF68();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0D514()
{
  sub_22DE0FF68();
  return sub_22DE1F9AC();
}

uint64_t FBKFeedbackForm.FormResponse.Question.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D90);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v15 = *(_QWORD *)(v1 + 24);
  v16 = v7;
  v20 = *(unsigned __int8 *)(v1 + 32);
  v14 = *(_QWORD *)(v1 + 40);
  v13 = *(unsigned __int8 *)(v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE0FF68();
  sub_22DE1F994();
  v24 = 0;
  v8 = v17;
  sub_22DE1F898();
  if (!v8)
  {
    v9 = v13;
    v10 = v14;
    v23 = 1;
    sub_22DE1F898();
    v22 = 2;
    sub_22DE1F8A4();
    v18 = v10;
    v19 = v9;
    v21 = 3;
    sub_22DE0FFAC();
    sub_22DE1F8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t FBKFeedbackForm.FormResponse.Question.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  int v26;
  char v27;
  char v28;
  char v29;
  char v30;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9DA8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE0FF68();
  sub_22DE1F988();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v30 = 0;
  v9 = sub_22DE1F850();
  v11 = v10;
  v23 = v9;
  v29 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_22DE1F850();
  v14 = v13;
  v21 = v12;
  v28 = 2;
  swift_bridgeObjectRetain();
  v22 = v14;
  v26 = sub_22DE1F85C();
  v27 = 3;
  sub_22DE0FFF0();
  sub_22DE1F868();
  v15 = v26 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v24;
  v17 = v25;
  swift_bridgeObjectRetain();
  v18 = v22;
  swift_bridgeObjectRetain();
  sub_22DDAA44C(v16, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v23;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v21;
  *(_QWORD *)(a2 + 24) = v18;
  *(_BYTE *)(a2 + 32) = v15;
  *(_QWORD *)(a2 + 40) = v16;
  *(_BYTE *)(a2 + 48) = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_22DDAA4C4(v16, v17);
}

uint64_t sub_22DE0D9A0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6563696F6863;
  else
    return 1954047348;
}

uint64_t sub_22DE0D9CC(_QWORD *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9F90);
  v22 = *(_QWORD *)(v3 - 8);
  v23 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9F98);
  v21 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9FA0);
  v26 = *(_QWORD *)(v9 - 8);
  v27 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[1];
  v24 = *v1;
  v25 = v12;
  v13 = v1[2];
  v19 = v1[3];
  v20 = v13;
  v14 = *((_BYTE *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE13534();
  sub_22DE1F994();
  if ((v14 & 1) != 0)
  {
    LOBYTE(v28) = 1;
    sub_22DE13578();
    v15 = v27;
    sub_22DE1F880();
    v28 = v24;
    v29 = v25;
    v30 = v20;
    v31 = v19;
    sub_22DE0FDD0();
    v16 = v23;
    sub_22DE1F8B0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v16);
  }
  else
  {
    LOBYTE(v28) = 0;
    sub_22DE135BC();
    v15 = v27;
    sub_22DE1F880();
    sub_22DE1F898();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v15);
}

uint64_t sub_22DE0DC24@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  _BYTE v34[4];
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v38 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9FC0);
  v4 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  v40 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v41 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9FC8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v34[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9FD0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = a1[3];
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_22DE13534();
  v15 = v47;
  sub_22DE1F988();
  if (!v15)
  {
    v36 = v6;
    v37 = v7;
    v16 = v41;
    v47 = v11;
    v17 = v13;
    v18 = sub_22DE1F874();
    v19 = (_BYTE *)v18;
    if (*(_QWORD *)(v18 + 16) == 1)
    {
      v35 = *(unsigned __int8 *)(v18 + 32);
      if ((v35 & 1) != 0)
      {
        LOBYTE(v43) = 1;
        sub_22DE13578();
        sub_22DE1F82C();
        sub_22DE0FF24();
        v20 = v39;
        sub_22DE1F868();
        (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v16, v20);
        swift_bridgeObjectRelease();
        (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v13, v10);
        v22 = v43;
        v21 = v44;
        v23 = v45;
        v24 = v46;
      }
      else
      {
        LOBYTE(v43) = 0;
        sub_22DE135BC();
        sub_22DE1F82C();
        v41 = v19;
        v29 = v36;
        v30 = sub_22DE1F850();
        v31 = v47;
        v22 = v30;
        v21 = v32;
        (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v9, v29);
        swift_bridgeObjectRelease();
        (*(void (**)(_BYTE *, uint64_t))(v31 + 8))(v17, v10);
        v23 = 0;
        v24 = 0;
      }
      v33 = v38;
      *v38 = v22;
      v33[1] = v21;
      v33[2] = v23;
      v33[3] = v24;
      *((_BYTE *)v33 + 32) = v35;
    }
    else
    {
      v25 = sub_22DE1F760();
      swift_allocError();
      v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9D78);
      *v27 = &type metadata for FBKFeedbackForm.FormResponse.Answer.Value;
      sub_22DE1F838();
      sub_22DE1F754();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x24BEE26D0], v25);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v13, v10);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
}

uint64_t sub_22DE0E02C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKFeedbackForm.FormResponse.Question.init(from:)(a1, a2);
}

uint64_t sub_22DE0E040(_QWORD *a1)
{
  return FBKFeedbackForm.FormResponse.Question.encode(to:)(a1);
}

uint64_t sub_22DE0E058()
{
  sub_22DE13578();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0E080()
{
  sub_22DE13578();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0E0A8()
{
  char *v0;

  return sub_22DE0D9A0(*v0);
}

uint64_t sub_22DE0E0B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE1335C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22DE0E0D4()
{
  sub_22DE13534();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0E0FC()
{
  sub_22DE13534();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0E124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE1342C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22DE0E14C()
{
  sub_22DE135BC();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0E174()
{
  sub_22DE135BC();
  return sub_22DE1F9AC();
}

uint64_t sub_22DE0E19C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22DE0DC24(a1, a2);
}

uint64_t sub_22DE0E1B0(_QWORD *a1)
{
  return sub_22DE0D9CC(a1);
}

uint64_t FBKFeedbackForm.FormResponse.Answer.description.getter()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    sub_22DE1F328();
    sub_22DE1F7B4();
    return 0;
  }
  else
  {
    sub_22DE1F328();
    return 0x203A74786574;
  }
}

uint64_t sub_22DE0E284()
{
  sub_22DE1F964();
  sub_22DE1F970();
  return sub_22DE1F97C();
}

uint64_t sub_22DE0E2C4()
{
  return sub_22DE1F970();
}

uint64_t sub_22DE0E2E8()
{
  sub_22DE1F964();
  sub_22DE1F970();
  return sub_22DE1F97C();
}

uint64_t sub_22DE0E328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE134A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22DE0E350()
{
  sub_22DE10034();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0E378()
{
  sub_22DE10034();
  return sub_22DE1F9AC();
}

uint64_t FBKFeedbackForm.FormResponse.Answer.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9DB8);
  v11 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v1;
  v7 = *((_QWORD *)v1 + 2);
  v6 = *((_QWORD *)v1 + 3);
  v8 = *((_BYTE *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE10034();
  sub_22DE1F994();
  v12 = v10;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  sub_22DE10078();
  sub_22DE1F8B0();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v5, v3);
}

uint64_t FBKFeedbackForm.FormResponse.Answer.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  __int128 v10;
  _OWORD v12[2];
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9DD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE10034();
  sub_22DE1F988();
  if (!v2)
  {
    sub_22DE100BC();
    sub_22DE1F868();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v13;
    v10 = v12[1];
    *(_OWORD *)a2 = v12[0];
    *(_OWORD *)(a2 + 16) = v10;
    *(_BYTE *)(a2 + 32) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_22DE0E5EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FBKFeedbackForm.FormResponse.Answer.init(from:)(a1, a2);
}

uint64_t sub_22DE0E600(_QWORD *a1)
{
  return FBKFeedbackForm.FormResponse.Answer.encode(to:)(a1);
}

uint64_t FBKFeedbackForm.FormResponse.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 v3;
  int64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_BYTE *)(v0 + 48);
  sub_22DE1F730();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22DDAA44C(v1, v3);
  FBKFeedbackForm.FormResponse.Question.description.getter();
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DDAA4C4(v1, v3);
  sub_22DE1F328();
  v4 = *(_QWORD *)(v2 + 16);
  if (v4)
  {
    v16 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_22DE0F280(0, v4, 0);
    v5 = (_BYTE *)(v2 + 64);
    do
    {
      v6 = *((_QWORD *)v5 - 4);
      v7 = *((_QWORD *)v5 - 3);
      v9 = *((_QWORD *)v5 - 2);
      v8 = *((_QWORD *)v5 - 1);
      if ((*v5 & 1) != 0)
      {
        sub_22DDF7710(v6, v7, v9, v8, 1);
        sub_22DE1F328();
        sub_22DE1F7B4();
        sub_22DE10100(v6, v7, v9, v8, 1);
        v10 = 0;
        v11 = 0xE000000000000000;
      }
      else
      {
        sub_22DDF7710(v6, v7, v9, v8, 0);
        sub_22DE1F328();
        sub_22DE10100(v6, v7, v9, v8, 0);
        v10 = 0x203A74786574;
        v11 = 0xE600000000000000;
      }
      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_22DE0F280(v12 > 1, v13 + 1, 1);
      v5 += 40;
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v11;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9BE0);
  sub_22DE01478();
  sub_22DE1F274();
  swift_bridgeObjectRelease();
  sub_22DE1F328();
  swift_bridgeObjectRelease();
  sub_22DE1F328();
  return 0x6E6F697473657551;
}

uint64_t sub_22DE0E930(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73726577736E61;
  else
    return 0x6E6F697473657571;
}

uint64_t sub_22DE0E968()
{
  char *v0;

  return sub_22DE0E930(*v0);
}

uint64_t sub_22DE0E970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DE13600(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22DE0E994()
{
  sub_22DE1013C();
  return sub_22DE1F9A0();
}

uint64_t sub_22DE0E9BC()
{
  sub_22DE1013C();
  return sub_22DE1F9AC();
}

uint64_t FBKFeedbackForm.FormResponse.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  int v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9DE8);
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v1;
  v7 = *((_QWORD *)v1 + 2);
  v6 = *((_QWORD *)v1 + 3);
  v8 = *((_BYTE *)v1 + 32);
  v9 = *((_QWORD *)v1 + 5);
  v23 = *((unsigned __int8 *)v1 + 48);
  v12 = *((_QWORD *)v1 + 7);
  v13 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE1013C();
  sub_22DE1F994();
  v17 = v14;
  v18 = v7;
  v19 = v6;
  v20 = v8;
  v21 = v13;
  v22 = v23;
  v24 = 0;
  sub_22DE10180();
  v10 = v15;
  sub_22DE1F8B0();
  if (!v10)
  {
    *(_QWORD *)&v17 = v12;
    v24 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9E00);
    sub_22DE1024C(&qword_255DB9E08, &qword_255DB9E00, (uint64_t (*)(void))sub_22DE101C4, MEMORY[0x24BEE12A0]);
    sub_22DE1F8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v5, v3);
}

uint64_t FBKFeedbackForm.FormResponse.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v33;
  unsigned __int8 v34;
  int v35;
  char v36;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9E18);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DE1013C();
  sub_22DE1F988();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v36 = 0;
  sub_22DE10208();
  sub_22DE1F868();
  v22 = v28;
  v23 = a2;
  v9 = v29;
  v21 = v30;
  v10 = v31;
  v20 = v32;
  v11 = v33;
  v12 = v34;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9E00);
  v36 = 1;
  v26 = v9;
  swift_bridgeObjectRetain();
  v25 = v10;
  swift_bridgeObjectRetain();
  v27 = v11;
  v35 = v12;
  sub_22DDAA44C(v11, v12);
  sub_22DE1024C(&qword_255DB9E28, &qword_255DB9E00, (uint64_t (*)(void))sub_22DE102B0, MEMORY[0x24BEE12D0]);
  sub_22DE1F868();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v28;
  v14 = v26;
  swift_bridgeObjectRetain();
  v15 = v25;
  swift_bridgeObjectRetain();
  v16 = v27;
  LOBYTE(v12) = v35;
  sub_22DDAA44C(v27, v35);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DDAA4C4(v16, v12);
  v17 = v23;
  *v23 = v22;
  v17[1] = v14;
  v17[2] = v21;
  v17[3] = v15;
  *((_BYTE *)v17 + 32) = v20;
  v17[5] = v16;
  *((_BYTE *)v17 + 48) = v12;
  v17[7] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DDAA4C4(v16, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE0EE94@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return FBKFeedbackForm.FormResponse.init(from:)(a1, a2);
}

uint64_t sub_22DE0EEA8(_QWORD *a1)
{
  return FBKFeedbackForm.FormResponse.encode(to:)(a1);
}

uint64_t FBKFeedbackForm.serializedAndDeserializedCopy.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v9);
  v2 = v9[0];
  if (v1)
  {
    v3 = sub_22DE1DFCC();
    v5 = v4;

    sub_22DD70E78(0, &qword_255DB9E38);
    type metadata accessor for FBKFeedbackForm();
    v6 = sub_22DE1F52C();
    if (!v6)
      __break(1u);
    sub_22DD64894(v3, v5);
    return v6;
  }
  else
  {
    v8 = v2;
    sub_22DE1DEE8();

    swift_willThrow();
    swift_unexpectedError();
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t FBKFeedbackForm.answersSummary.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers);
  swift_beginAccess();
  v2 = *v1;
  v18 = v2 + 64;
  v3 = 1 << *(_BYTE *)(v2 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v2 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_21;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v6)
      goto LABEL_23;
    v12 = *(_QWORD *)(v18 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v6)
        goto LABEL_23;
      v12 = *(_QWORD *)(v18 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v6)
          goto LABEL_23;
        v12 = *(_QWORD *)(v18 + 8 * v8);
        if (!v12)
          break;
      }
    }
LABEL_20:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_21:
    v14 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v16 = *v14;
    v15 = v14[1];
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v10);
    if (v15 > 2)
      sub_22DDA492C(v16, v15);
    sub_22DDA492C(v16, v15);
    swift_bridgeObjectRetain();
    sub_22DE1F328();
    swift_bridgeObjectRelease();
    sub_22DDA40E0(v16, v15);
    sub_22DE1F328();
    MEMORY[0x22E31FC58](v17, MEMORY[0x24BEE0D00]);
    sub_22DE1F328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22DE1F328();
    result = swift_bridgeObjectRelease();
  }
  v13 = v11 + 3;
  if (v13 >= v6)
  {
LABEL_23:
    swift_release();
    return 0;
  }
  v12 = *(_QWORD *)(v18 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v6)
      goto LABEL_23;
    v12 = *(_QWORD *)(v18 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22DE0F280(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22DE0F2F0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22DE0F29C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_22DE0F458(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_22DE0F2B8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22DE0F7D8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22DE0F2D4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22DE0F940(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22DE0F2F0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9BD0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE0F458(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA060);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA068);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE0F5F8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DBA070);
  v10 = *(_QWORD *)(type metadata accessor for BatchInteraction.ContentPreview.CUContent.Message(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for BatchInteraction.ContentPreview.CUContent.Message(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE0F7D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA000);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8])
      memmove(v13, v14, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t sub_22DE0F940(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB9FF0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
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
  result = sub_22DE1F808();
  __break(1u);
  return result;
}

uint64_t _s8Feedback15FBKFeedbackFormC8QuestionO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      v3 = 0;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      v3 = 1;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5)
        v6 = 1;
      else
        v6 = sub_22DE1F8E0();
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
LABEL_12:
    sub_22DDA492C(v4, v5);
    sub_22DDA492C(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2)
    goto LABEL_11;
  v6 = 1;
  v3 = 2;
LABEL_13:
  sub_22DDA40E0(v2, v3);
  sub_22DDA40E0(v4, v5);
  return v6 & 1;
}

uint64_t type metadata accessor for FBKFeedbackForm()
{
  return objc_opt_self();
}

unint64_t sub_22DE0FBB0()
{
  unint64_t result;

  result = qword_255DB9C00;
  if (!qword_255DB9C00)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse, &type metadata for FBKFeedbackForm.FormResponse);
    atomic_store(result, (unint64_t *)&qword_255DB9C00);
  }
  return result;
}

unint64_t sub_22DE0FBF4()
{
  unint64_t result;

  result = qword_255DB9C60;
  if (!qword_255DB9C60)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse, &type metadata for FBKFeedbackForm.FormResponse);
    atomic_store(result, (unint64_t *)&qword_255DB9C60);
  }
  return result;
}

unint64_t sub_22DE0FC38()
{
  unint64_t result;

  result = qword_255DB9C78;
  if (!qword_255DB9C78)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27E04, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9C78);
  }
  return result;
}

unint64_t sub_22DE0FC7C()
{
  unint64_t result;

  result = qword_255DB9CD0;
  if (!qword_255DB9CD0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27DB4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9CD0);
  }
  return result;
}

unint64_t sub_22DE0FCC0()
{
  unint64_t result;

  result = qword_255DB9CD8;
  if (!qword_255DB9CD8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27D64, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9CD8);
  }
  return result;
}

unint64_t sub_22DE0FD04()
{
  unint64_t result;

  result = qword_255DB9CE0;
  if (!qword_255DB9CE0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27D14, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateTimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9CE0);
  }
  return result;
}

unint64_t sub_22DE0FD48()
{
  unint64_t result;

  result = qword_255DB9CE8;
  if (!qword_255DB9CE8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27CC4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9CE8);
  }
  return result;
}

unint64_t sub_22DE0FD8C()
{
  unint64_t result;

  result = qword_255DB9CF0;
  if (!qword_255DB9CF0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27C74, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SliderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9CF0);
  }
  return result;
}

unint64_t sub_22DE0FDD0()
{
  unint64_t result;

  result = qword_255DB9D08;
  if (!qword_255DB9D08)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Question.Kind.Choice, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice);
    atomic_store(result, (unint64_t *)&qword_255DB9D08);
  }
  return result;
}

unint64_t sub_22DE0FE14()
{
  unint64_t result;

  result = qword_255DB9D10;
  if (!qword_255DB9D10)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27C24, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.MultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9D10);
  }
  return result;
}

unint64_t sub_22DE0FE58()
{
  unint64_t result;

  result = qword_255DB9D18;
  if (!qword_255DB9D18)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27BD4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SingleSelectMultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9D18);
  }
  return result;
}

unint64_t sub_22DE0FE9C()
{
  unint64_t result;

  result = qword_255DB9D20;
  if (!qword_255DB9D20)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27B84, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextAreaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9D20);
  }
  return result;
}

unint64_t sub_22DE0FEE0()
{
  unint64_t result;

  result = qword_255DB9D28;
  if (!qword_255DB9D28)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27B34, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9D28);
  }
  return result;
}

unint64_t sub_22DE0FF24()
{
  unint64_t result;

  result = qword_255DB9D88;
  if (!qword_255DB9D88)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Question.Kind.Choice, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice);
    atomic_store(result, (unint64_t *)&qword_255DB9D88);
  }
  return result;
}

unint64_t sub_22DE0FF68()
{
  unint64_t result;

  result = qword_255DB9D98;
  if (!qword_255DB9D98)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27AE4, &type metadata for FBKFeedbackForm.FormResponse.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9D98);
  }
  return result;
}

unint64_t sub_22DE0FFAC()
{
  unint64_t result;

  result = qword_255DB9DA0;
  if (!qword_255DB9DA0)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Question.Kind, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind);
    atomic_store(result, (unint64_t *)&qword_255DB9DA0);
  }
  return result;
}

unint64_t sub_22DE0FFF0()
{
  unint64_t result;

  result = qword_255DB9DB0;
  if (!qword_255DB9DB0)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Question.Kind, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind);
    atomic_store(result, (unint64_t *)&qword_255DB9DB0);
  }
  return result;
}

unint64_t sub_22DE10034()
{
  unint64_t result;

  result = qword_255DB9DC0;
  if (!qword_255DB9DC0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27A94, &type metadata for FBKFeedbackForm.FormResponse.Answer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9DC0);
  }
  return result;
}

unint64_t sub_22DE10078()
{
  unint64_t result;

  result = qword_255DB9DC8;
  if (!qword_255DB9DC8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27A6C, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value);
    atomic_store(result, (unint64_t *)&qword_255DB9DC8);
  }
  return result;
}

unint64_t sub_22DE100BC()
{
  unint64_t result;

  result = qword_255DB9DD8;
  if (!qword_255DB9DD8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27A44, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value);
    atomic_store(result, (unint64_t *)&qword_255DB9DD8);
  }
  return result;
}

uint64_t sub_22DE10100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if ((a5 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_22DE1013C()
{
  unint64_t result;

  result = qword_255DB9DF0;
  if (!qword_255DB9DF0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE279F4, &type metadata for FBKFeedbackForm.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9DF0);
  }
  return result;
}

unint64_t sub_22DE10180()
{
  unint64_t result;

  result = qword_255DB9DF8;
  if (!qword_255DB9DF8)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Question, &type metadata for FBKFeedbackForm.FormResponse.Question);
    atomic_store(result, (unint64_t *)&qword_255DB9DF8);
  }
  return result;
}

unint64_t sub_22DE101C4()
{
  unint64_t result;

  result = qword_255DB9E10;
  if (!qword_255DB9E10)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Answer, &type metadata for FBKFeedbackForm.FormResponse.Answer);
    atomic_store(result, (unint64_t *)&qword_255DB9E10);
  }
  return result;
}

unint64_t sub_22DE10208()
{
  unint64_t result;

  result = qword_255DB9E20;
  if (!qword_255DB9E20)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Question, &type metadata for FBKFeedbackForm.FormResponse.Question);
    atomic_store(result, (unint64_t *)&qword_255DB9E20);
  }
  return result;
}

uint64_t sub_22DE1024C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x22E3207B0](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22DE102B0()
{
  unint64_t result;

  result = qword_255DB9E30;
  if (!qword_255DB9E30)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.FormResponse.Answer, &type metadata for FBKFeedbackForm.FormResponse.Answer);
    atomic_store(result, (unint64_t *)&qword_255DB9E30);
  }
  return result;
}

unint64_t sub_22DE102F8()
{
  unint64_t result;

  result = qword_255DB9E40;
  if (!qword_255DB9E40)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.AuthenticationMethod, &type metadata for FBKFeedbackForm.AuthenticationMethod);
    atomic_store(result, (unint64_t *)&qword_255DB9E40);
  }
  return result;
}

unint64_t sub_22DE10340()
{
  unint64_t result;

  result = qword_255DB9E48;
  if (!qword_255DB9E48)
  {
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKFeedbackForm.Question, &type metadata for FBKFeedbackForm.Question);
    atomic_store(result, (unint64_t *)&qword_255DB9E48);
  }
  return result;
}

uint64_t sub_22DE10384@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_identifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE103DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers, a2);
}

uint64_t sub_22DE103E8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE075A4(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_answers);
}

uint64_t sub_22DE10404@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22DE10454(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_authenticationMethod);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_22DE104A0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments, a2);
}

uint64_t keypath_get_1Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE104FC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE075A4(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments);
}

_QWORD *sub_22DE10518@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton);
  return result;
}

_BYTE *sub_22DE10530(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__hideAttachmentButton) = *result;
  return result;
}

_QWORD *sub_22DE10548@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching);
  return result;
}

_BYTE *sub_22DE10560(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__disableAccountSwitching) = *result;
  return result;
}

_QWORD *sub_22DE10578@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo);
  return result;
}

_BYTE *sub_22DE10590(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showInlineUserInfo) = *result;
  return result;
}

_QWORD *sub_22DE105A8@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast);
  return result;
}

_BYTE *sub_22DE105C0(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__showUserSwitcherLast) = *result;
  return result;
}

_QWORD *sub_22DE105D8@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled);
  return result;
}

_BYTE *sub_22DE105F0(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__alternateImagePreviewEnabled) = *result;
  return result;
}

_QWORD *sub_22DE10608@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices);
  return result;
}

_BYTE *sub_22DE10620(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__useInlineChoices) = *result;
  return result;
}

_QWORD *sub_22DE10638@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices;
  v3 = *(_QWORD *)v2;
  LOBYTE(v2) = *(_BYTE *)(v2 + 8);
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_22DE1065C(uint64_t result, _QWORD *a2)
{
  char v2;
  uint64_t v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__maxInlineChoices;
  *(_QWORD *)v3 = *(_QWORD *)result;
  *(_BYTE *)(v3 + 8) = v2;
  return result;
}

uint64_t sub_22DE10680@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses, a2);
}

uint64_t sub_22DE1068C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE075A4(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formResponses);
}

uint64_t sub_22DE106A8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_23Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions, a2);
}

uint64_t sub_22DE106B4(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_24Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_autoGathersDiagnosticExtensions);
}

uint64_t sub_22DE106C0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_23Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop, a2);
}

uint64_t sub_22DE106CC(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_24Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_allowsAttachmentDragAndDrop);
}

uint64_t sub_22DE106D8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText, a2);
}

uint64_t sub_22DE106E4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE08E58(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttachmentLegalText);
}

id sub_22DE10700@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_22DE10754@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(*a1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon);
  v3 = v2[1];
  *a2 = *v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE10770(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__largeTitleIcon);
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE107AC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_23Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts, a2);
}

uint64_t sub_22DE107B8(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_24Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_alwaysDeletesDrafts);
}

uint64_t sub_22DE107C4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_23Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_launchedInBatchMode, a2);
}

uint64_t keypath_get_23Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_22DE1081C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_24Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_launchedInBatchMode);
}

uint64_t keypath_set_24Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

_QWORD *sub_22DE10870@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle);
  return result;
}

_BYTE *sub_22DE10888(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm__displayTitle) = *result;
  return result;
}

uint64_t sub_22DE108A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 8);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_22DE108F8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_formId;
  result = swift_beginAccess();
  *(_QWORD *)v4 = v2;
  *(_BYTE *)(v4 + 8) = v3;
  return result;
}

uint64_t sub_22DE10954@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds, a2);
}

uint64_t sub_22DE10960(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE075A4(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_plugFormIds);
}

uint64_t sub_22DE1097C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 2);
  *(_WORD *)a2 = *(_WORD *)v3;
  *(_BYTE *)(a2 + 2) = v5;
  return result;
}

uint64_t sub_22DE109D4(__int16 *a1, _QWORD *a2)
{
  __int16 v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 2);
  v4 = *a2 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_environment;
  result = swift_beginAccess();
  *(_WORD *)v4 = v2;
  *(_BYTE *)(v4 + 2) = v3;
  return result;
}

uint64_t sub_22DE10A30@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host, a2);
}

uint64_t sub_22DE10A3C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE08E58(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_host);
}

uint64_t sub_22DE10A58@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken, a2);
}

uint64_t keypath_get_27Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DE10AB4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22DE08E58(a1, a2, a3, a4, &OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_appToken);
}

uint64_t method lookup function for FBKFeedbackForm()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBKFeedbackForm.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of FBKFeedbackForm.answers.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of FBKFeedbackForm.prefilledQuestions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of FBKFeedbackForm.authenticationMethod.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of FBKFeedbackForm.authenticationMethod.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of FBKFeedbackForm.authenticationMethod.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of FBKFeedbackForm.attachments.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of FBKFeedbackForm.attachments.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of FBKFeedbackForm.attachments.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of FBKFeedbackForm.hideAttachmentButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.hideAttachmentButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.hideAttachmentButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.disableAccountSwitching.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.disableAccountSwitching.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.disableAccountSwitching.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.showInlineUserInfo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of FBKFeedbackForm.showInlineUserInfo.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of FBKFeedbackForm.showInlineUserInfo.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of FBKFeedbackForm.showUserSwitcherLast.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of FBKFeedbackForm.showUserSwitcherLast.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of FBKFeedbackForm.showUserSwitcherLast.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of FBKFeedbackForm.alternateImagePreviewEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of FBKFeedbackForm.alternateImagePreviewEnabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of FBKFeedbackForm.alternateImagePreviewEnabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of FBKFeedbackForm.useInlineChoices.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.useInlineChoices.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.useInlineChoices.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.maxInlineChoices.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.maxInlineChoices.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x2D8))(a1, a2 & 1);
}

uint64_t dispatch thunk of FBKFeedbackForm.maxInlineChoices.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.formResponses.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x300))();
}

uint64_t dispatch thunk of FBKFeedbackForm.autoGathersDiagnosticExtensions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of FBKFeedbackForm.autoGathersDiagnosticExtensions.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of FBKFeedbackForm.autoGathersDiagnosticExtensions.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of FBKFeedbackForm.allowsAttachmentDragAndDrop.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of FBKFeedbackForm.allowsAttachmentDragAndDrop.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of FBKFeedbackForm.allowsAttachmentDragAndDrop.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x340))();
}

uint64_t dispatch thunk of FBKFeedbackForm.addAttachment(url:localizedDescription:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of FBKFeedbackForm.setDiagnosticExtension(localizedDescription:diagnosticExtensionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x368))();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttributedLegalString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x370))();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttributedLegalString.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x378))();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttributedLegalString.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of FBKFeedbackForm.largeTitleIcon.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of FBKFeedbackForm.largeTitleIcon.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of FBKFeedbackForm.largeTitleIcon.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of FBKFeedbackForm.alwaysDeletesDrafts.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.alwaysDeletesDrafts.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.alwaysDeletesDrafts.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.launchedInBatchMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.displayTitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.displayTitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.displayTitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1072))();
}

uint64_t dispatch thunk of FBKFeedbackForm.prefill(question:answer:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x438))();
}

uint64_t dispatch thunk of FBKFeedbackForm.formId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x440))();
}

uint64_t dispatch thunk of FBKFeedbackForm.formId.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x448))(a1, a2 & 1);
}

uint64_t dispatch thunk of FBKFeedbackForm.formId.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of FBKFeedbackForm.plugFormIds.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x458))();
}

uint64_t dispatch thunk of FBKFeedbackForm.plugFormIds.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x460))();
}

uint64_t dispatch thunk of FBKFeedbackForm.plugFormIds.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x468))();
}

uint64_t dispatch thunk of FBKFeedbackForm.environment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x470))() & 0x1FFFF;
}

uint64_t dispatch thunk of FBKFeedbackForm.environment.setter(int a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0x478))(a1 & 0x1FFFF);
}

uint64_t dispatch thunk of FBKFeedbackForm.environment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of FBKFeedbackForm.host.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of FBKFeedbackForm.host.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of FBKFeedbackForm.host.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x498))();
}

uint64_t dispatch thunk of FBKFeedbackForm.appToken.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4A0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.appToken.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4A8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.appToken.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B0))();
}

uint64_t dispatch thunk of FBKFeedbackForm.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4B8))();
}

uint64_t dispatch thunk of FBKFeedbackForm.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1216))();
}

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.AuthenticationMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DE11380 + 4 * byte_22DE26D66[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22DE113B4 + 4 * byte_22DE26D61[v4]))();
}

uint64_t sub_22DE113B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE113BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DE113C4);
  return result;
}

uint64_t sub_22DE113D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DE113D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22DE113DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE113E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.AuthenticationMethod()
{
  return &type metadata for FBKFeedbackForm.AuthenticationMethod;
}

unint64_t destroy for FBKFeedbackForm.Question(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s8Feedback15FBKFeedbackFormC8QuestionOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for FBKFeedbackForm.Question(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FBKFeedbackForm.Question(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKFeedbackForm.Question(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.Question(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

_QWORD *sub_22DE11610(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.Question()
{
  return &type metadata for FBKFeedbackForm.Question;
}

uint64_t destroy for FBKFeedbackForm.FormResponse(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DDAA4C4(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FBKFeedbackForm.FormResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22DDAA44C(v6, v7);
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FBKFeedbackForm.FormResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  unsigned __int8 v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_BYTE *)(a2 + 48);
  sub_22DDAA44C(v4, v5);
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  v7 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v5;
  sub_22DDAA4C4(v6, v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FBKFeedbackForm.FormResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unsigned __int8 v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v8 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v6;
  sub_22DDAA4C4(v7, v8);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse()
{
  return &type metadata for FBKFeedbackForm.FormResponse;
}

uint64_t destroy for FBKFeedbackForm.FormResponse.Question(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_22DDAA4C4(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for FBKFeedbackForm.FormResponse.Question(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22DDAA44C(v5, v6);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = v6;
  return a1;
}

uint64_t assignWithCopy for FBKFeedbackForm.FormResponse.Question(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = v2[2];
  *(_QWORD *)(a1 + 24) = v2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *((_BYTE *)v2 + 32);
  v4 = v2[5];
  LOBYTE(v2) = *((_BYTE *)v2 + 48);
  sub_22DDAA44C(v4, v2);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  v6 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = (_BYTE)v2;
  sub_22DDAA4C4(v5, v6);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FBKFeedbackForm.FormResponse.Question(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unsigned __int8 v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v8 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v6;
  sub_22DDAA4C4(v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question;
}

uint64_t initializeBufferWithCopyOfBuffer for FBKFeedbackForm.FormResponse.Question.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22DDAA44C(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for FBKFeedbackForm.FormResponse.Question.Kind(uint64_t a1)
{
  return sub_22DDAA4C4(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for FBKFeedbackForm.FormResponse.Question.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22DDAA44C(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_22DDAA4C4(v5, v6);
  return a1;
}

uint64_t assignWithTake for FBKFeedbackForm.FormResponse.Question.Kind(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_22DDAA4C4(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question.Kind(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question.Kind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_22DE11C08(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_22DE11C20(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind;
}

uint64_t destroy for FBKFeedbackForm.FormResponse.Question.Kind.Choice()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for FBKFeedbackForm.FormResponse.Question.Kind.Choice(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for FBKFeedbackForm.FormResponse.Question.Kind.Choice(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for FBKFeedbackForm.FormResponse.Question.Kind.Choice(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question.Kind.Choice(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question.Kind.Choice(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.Choice()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Answer()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Answer;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.CodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.CodingKeys;
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV5ValueOwxx_0(uint64_t a1)
{
  return sub_22DE10100(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV5ValueOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_22DDF7710(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV5ValueOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_22DDF7710(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_22DE10100(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV5ValueOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_22DE10100(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV5ValueOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV5ValueOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_22DE11FF0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_22DE11FF8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Answer.Value()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Answer.Value;
}

uint64_t sub_22DE12020()
{
  return 0;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Answer.CodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Answer.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DE12084 + 4 * byte_22DE26D70[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22DE120B8 + 4 * byte_22DE26D6B[v4]))();
}

uint64_t sub_22DE120B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE120C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DE120C8);
  return result;
}

uint64_t sub_22DE120D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DE120DCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22DE120E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE120E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.CodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_22DE12150 + 4 * byte_22DE26D7A[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_22DE12184 + 4 * byte_22DE26D75[v4]))();
}

uint64_t sub_22DE12184(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE1218C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DE12194);
  return result;
}

uint64_t sub_22DE121A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DE121A8);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_22DE121AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE121B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.TextFieldCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextFieldCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.TextAreaCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextAreaCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.SingleSelectMultipleChoiceCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SingleSelectMultipleChoiceCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.MultipleChoiceCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.MultipleChoiceCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.SliderCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SliderCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.DateCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.DateTimeCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateTimeCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.TimeCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TimeCodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Question.Kind.Choice.CodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice.CodingKeys;
}

unint64_t sub_22DE12264()
{
  unint64_t result;

  result = qword_255DB9E78;
  if (!qword_255DB9E78)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27334, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9E78);
  }
  return result;
}

unint64_t sub_22DE122AC()
{
  unint64_t result;

  result = qword_255DB9E80;
  if (!qword_255DB9E80)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE274DC, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SliderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9E80);
  }
  return result;
}

unint64_t sub_22DE122F4()
{
  unint64_t result;

  result = qword_255DB9E88;
  if (!qword_255DB9E88)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27594, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.MultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9E88);
  }
  return result;
}

unint64_t sub_22DE1233C()
{
  unint64_t result;

  result = qword_255DB9E90;
  if (!qword_255DB9E90)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2764C, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SingleSelectMultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9E90);
  }
  return result;
}

unint64_t sub_22DE12384()
{
  unint64_t result;

  result = qword_255DB9E98;
  if (!qword_255DB9E98)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE277A4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9E98);
  }
  return result;
}

unint64_t sub_22DE123CC()
{
  unint64_t result;

  result = qword_255DB9EA0;
  if (!qword_255DB9EA0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2785C, &type metadata for FBKFeedbackForm.FormResponse.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EA0);
  }
  return result;
}

unint64_t sub_22DE12414()
{
  unint64_t result;

  result = qword_255DB9EA8;
  if (!qword_255DB9EA8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27914, &type metadata for FBKFeedbackForm.FormResponse.Answer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EA8);
  }
  return result;
}

unint64_t sub_22DE1245C()
{
  unint64_t result;

  result = qword_255DB9EB0;
  if (!qword_255DB9EB0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE279CC, &type metadata for FBKFeedbackForm.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EB0);
  }
  return result;
}

unint64_t sub_22DE124A4()
{
  unint64_t result;

  result = qword_255DB9EB8;
  if (!qword_255DB9EB8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2793C, &type metadata for FBKFeedbackForm.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EB8);
  }
  return result;
}

unint64_t sub_22DE124EC()
{
  unint64_t result;

  result = qword_255DB9EC0;
  if (!qword_255DB9EC0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27964, &type metadata for FBKFeedbackForm.FormResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EC0);
  }
  return result;
}

unint64_t sub_22DE12534()
{
  unint64_t result;

  result = qword_255DB9EC8;
  if (!qword_255DB9EC8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27884, &type metadata for FBKFeedbackForm.FormResponse.Answer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EC8);
  }
  return result;
}

unint64_t sub_22DE1257C()
{
  unint64_t result;

  result = qword_255DB9ED0;
  if (!qword_255DB9ED0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE278AC, &type metadata for FBKFeedbackForm.FormResponse.Answer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9ED0);
  }
  return result;
}

unint64_t sub_22DE125C4()
{
  unint64_t result;

  result = qword_255DB9ED8;
  if (!qword_255DB9ED8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE277CC, &type metadata for FBKFeedbackForm.FormResponse.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9ED8);
  }
  return result;
}

unint64_t sub_22DE1260C()
{
  unint64_t result;

  result = qword_255DB9EE0;
  if (!qword_255DB9EE0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE277F4, &type metadata for FBKFeedbackForm.FormResponse.Question.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EE0);
  }
  return result;
}

unint64_t sub_22DE12654()
{
  unint64_t result;

  result = qword_255DB9EE8;
  if (!qword_255DB9EE8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE276C4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EE8);
  }
  return result;
}

unint64_t sub_22DE1269C()
{
  unint64_t result;

  result = qword_255DB9EF0;
  if (!qword_255DB9EF0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE276EC, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EF0);
  }
  return result;
}

unint64_t sub_22DE126E4()
{
  unint64_t result;

  result = qword_255DB9EF8;
  if (!qword_255DB9EF8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27674, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextAreaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9EF8);
  }
  return result;
}

unint64_t sub_22DE1272C()
{
  unint64_t result;

  result = qword_255DB9F00;
  if (!qword_255DB9F00)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2769C, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TextAreaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F00);
  }
  return result;
}

unint64_t sub_22DE12774()
{
  unint64_t result;

  result = qword_255DB9F08;
  if (!qword_255DB9F08)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE275BC, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SingleSelectMultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F08);
  }
  return result;
}

unint64_t sub_22DE127BC()
{
  unint64_t result;

  result = qword_255DB9F10;
  if (!qword_255DB9F10)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE275E4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SingleSelectMultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F10);
  }
  return result;
}

unint64_t sub_22DE12804()
{
  unint64_t result;

  result = qword_255DB9F18;
  if (!qword_255DB9F18)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27504, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.MultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F18);
  }
  return result;
}

unint64_t sub_22DE1284C()
{
  unint64_t result;

  result = qword_255DB9F20;
  if (!qword_255DB9F20)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2752C, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.MultipleChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F20);
  }
  return result;
}

unint64_t sub_22DE12894()
{
  unint64_t result;

  result = qword_255DB9F28;
  if (!qword_255DB9F28)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2744C, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SliderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F28);
  }
  return result;
}

unint64_t sub_22DE128DC()
{
  unint64_t result;

  result = qword_255DB9F30;
  if (!qword_255DB9F30)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27474, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.SliderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F30);
  }
  return result;
}

unint64_t sub_22DE12924()
{
  unint64_t result;

  result = qword_255DB9F38;
  if (!qword_255DB9F38)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE273FC, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F38);
  }
  return result;
}

unint64_t sub_22DE1296C()
{
  unint64_t result;

  result = qword_255DB9F40;
  if (!qword_255DB9F40)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27424, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F40);
  }
  return result;
}

unint64_t sub_22DE129B4()
{
  unint64_t result;

  result = qword_255DB9F48;
  if (!qword_255DB9F48)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE273AC, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateTimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F48);
  }
  return result;
}

unint64_t sub_22DE129FC()
{
  unint64_t result;

  result = qword_255DB9F50;
  if (!qword_255DB9F50)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE273D4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.DateTimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F50);
  }
  return result;
}

unint64_t sub_22DE12A44()
{
  unint64_t result;

  result = qword_255DB9F58;
  if (!qword_255DB9F58)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2735C, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F58);
  }
  return result;
}

unint64_t sub_22DE12A8C()
{
  unint64_t result;

  result = qword_255DB9F60;
  if (!qword_255DB9F60)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27384, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.TimeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F60);
  }
  return result;
}

unint64_t sub_22DE12AD4()
{
  unint64_t result;

  result = qword_255DB9F68;
  if (!qword_255DB9F68)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27714, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F68);
  }
  return result;
}

unint64_t sub_22DE12B1C()
{
  unint64_t result;

  result = qword_255DB9F70;
  if (!qword_255DB9F70)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2773C, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F70);
  }
  return result;
}

unint64_t sub_22DE12B64()
{
  unint64_t result;

  result = qword_255DB9F78;
  if (!qword_255DB9F78)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE272A4, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F78);
  }
  return result;
}

unint64_t sub_22DE12BAC()
{
  unint64_t result;

  result = qword_255DB9F80;
  if (!qword_255DB9F80)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE272CC, &type metadata for FBKFeedbackForm.FormResponse.Question.Kind.Choice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9F80);
  }
  return result;
}

unint64_t sub_22DE12BF0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  char v4;
  unint64_t result;
  __int128 v6;
  char v7;
  _OWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _OWORD *v12;
  char v13;
  __int128 v14;
  __int128 v15;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9840);
  v3 = (_QWORD *)sub_22DE1F7FC();
  v4 = *(_BYTE *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 40);
  result = sub_22DDFD584(v4);
  v6 = v14;
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = (_OWORD *)(a1 + 64);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v4;
    *(_OWORD *)(v3[7] + 16 * result) = v6;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    if (!--v1)
      goto LABEL_8;
    v12 = (_OWORD *)((char *)v8 + 24);
    v4 = *((_BYTE *)v8 - 8);
    v15 = *v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_22DDFD584(v4);
    v8 = v12;
    v6 = v15;
    if ((v13 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_22DE12D18(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v3 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22DE12DF8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C65694674786574 && a2 == 0xE900000000000064;
  if (v3 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6165724174786574 && a2 == 0xE800000000000000 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000022DE2D270 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C7069746C756DLL && a2 == 0xEE006563696F6843 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726564696C73 && a2 == 0xE600000000000000 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656D695465746164 && a2 == 0xE800000000000000 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_22DE13100(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x736563696F6863 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22DE13184()
{
  return 0x736563696F6863;
}

uint64_t sub_22DE1319C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5479616C70736964 && a2 == 0xEB00000000747865 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E65646469487369 && a2 == 0xEE006D726F466E49 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_22DE1335C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v3 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563696F6863 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22DE1342C(uint64_t a1, uint64_t a2)
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
    v3 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22DE13498()
{
  return 12383;
}

uint64_t sub_22DE134A4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22DE13520()
{
  return 0x65756C6176;
}

unint64_t sub_22DE13534()
{
  unint64_t result;

  result = qword_255DB9FA8;
  if (!qword_255DB9FA8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2814C, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9FA8);
  }
  return result;
}

unint64_t sub_22DE13578()
{
  unint64_t result;

  result = qword_255DB9FB0;
  if (!qword_255DB9FB0)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE280FC, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.ChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9FB0);
  }
  return result;
}

unint64_t sub_22DE135BC()
{
  unint64_t result;

  result = qword_255DB9FB8;
  if (!qword_255DB9FB8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE280AC, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DB9FB8);
  }
  return result;
}

uint64_t sub_22DE13600(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F697473657571 && a2 == 0xE800000000000000;
  if (v3 || (sub_22DE1F8E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73726577736E61 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22DE1F8E0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22DE136E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DE1377C + 4 * byte_22DE26D84[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22DE137B0 + 4 * byte_22DE26D7F[v4]))();
}

uint64_t sub_22DE137B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE137B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DE137C0);
  return result;
}

uint64_t sub_22DE137CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DE137D4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22DE137D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DE137E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Answer.Value.CodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.CodingKeys;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Answer.Value.TextCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.TextCodingKeys;
}

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s8Feedback15FBKFeedbackFormC12FormResponseV6AnswerV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DE1389C + 4 * byte_22DE26D89[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DE138BC + 4 * byte_22DE26D8E[v4]))();
}

_BYTE *sub_22DE1389C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DE138BC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DE138C4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DE138CC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DE138D4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DE138DC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBKFeedbackForm.FormResponse.Answer.Value.ChoiceCodingKeys()
{
  return &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.ChoiceCodingKeys;
}

unint64_t sub_22DE138FC()
{
  unint64_t result;

  result = qword_255DBA018;
  if (!qword_255DBA018)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27F14, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.ChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA018);
  }
  return result;
}

unint64_t sub_22DE13944()
{
  unint64_t result;

  result = qword_255DBA020;
  if (!qword_255DBA020)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27FCC, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA020);
  }
  return result;
}

unint64_t sub_22DE1398C()
{
  unint64_t result;

  result = qword_255DBA028;
  if (!qword_255DBA028)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE28084, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA028);
  }
  return result;
}

unint64_t sub_22DE139D4()
{
  unint64_t result;

  result = qword_255DBA030;
  if (!qword_255DBA030)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27F3C, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA030);
  }
  return result;
}

unint64_t sub_22DE13A1C()
{
  unint64_t result;

  result = qword_255DBA038;
  if (!qword_255DBA038)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27F64, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA038);
  }
  return result;
}

unint64_t sub_22DE13A64()
{
  unint64_t result;

  result = qword_255DBA040;
  if (!qword_255DBA040)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27E84, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.ChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA040);
  }
  return result;
}

unint64_t sub_22DE13AAC()
{
  unint64_t result;

  result = qword_255DBA048;
  if (!qword_255DBA048)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27EAC, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.ChoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA048);
  }
  return result;
}

unint64_t sub_22DE13AF4()
{
  unint64_t result;

  result = qword_255DBA050;
  if (!qword_255DBA050)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE27FF4, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA050);
  }
  return result;
}

unint64_t sub_22DE13B3C()
{
  unint64_t result;

  result = qword_255DBA058;
  if (!qword_255DBA058)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE2801C, &type metadata for FBKFeedbackForm.FormResponse.Answer.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DBA058);
  }
  return result;
}

uint64_t sub_22DE13BA4(_QWORD *a1, uint64_t (*a2)(_QWORD))
{
  return a2(*a1);
}

uint64_t sub_22DE13BC8(uint64_t a1, uint64_t (*a2)(uint64_t *))
{
  uint64_t v3;

  v3 = a1;
  return a2(&v3);
}

uint64_t FBKInlineView.feedbackController.getter()
{
  uint64_t v0;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  MEMORY[0x22E31F8EC](&v2, v0);
  return v2;
}

uint64_t FBKInlineView.feedbackController.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  return sub_22DE1F07C();
}

void (*FBKInlineView.feedbackController.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = *v1;
  v5 = v1[1];
  v3[5] = *v1;
  v3[6] = v5;
  v6 = (void *)v1[2];
  v3[7] = v6;
  *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  swift_retain();
  swift_retain();
  v7 = v6;
  v3[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  MEMORY[0x22E31F8EC]();
  return sub_22DD959A8;
}

uint64_t FBKInlineView.$feedbackController.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  sub_22DE1F094();
  return v1;
}

uint64_t FBKInlineView.subject.getter()
{
  return sub_22DE140F0((uint64_t (*)(uint64_t))MEMORY[0x24BDF47B0]);
}

uint64_t type metadata accessor for FBKInlineView()
{
  uint64_t result;

  result = qword_255DBA0F0;
  if (!qword_255DBA0F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22DE13DB0(uint64_t a1)
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

  v2 = sub_22DE1E194();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  type metadata accessor for FBKInlineView();
  v9(v6, (uint64_t)v8, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  sub_22DE1F07C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t FBKInlineView.subject.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_22DE1E194();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FBKInlineView();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  sub_22DE1F07C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*FBKInlineView.subject.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = sub_22DE1E194();
  *v3 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[1] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  v3[4] = v7;
  v8 = malloc(*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  v3[5] = v8;
  v9 = type metadata accessor for FBKInlineView();
  sub_22DD506A0(v1 + *(int *)(v9 + 20), (uint64_t)v8, &qword_255DB7908);
  MEMORY[0x22E31F8EC](v7);
  return sub_22DE14024;
}

void sub_22DE14024(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 40);
  v4 = *(void **)(*(_QWORD *)a1 + 16);
  v5 = *(void **)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    v6 = *v2;
    v7 = v2[1];
    (*(void (**)(_QWORD, void *, _QWORD))(v7 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 16), v5, *v2);
    sub_22DE1F07C();
    sub_22DD5071C((uint64_t)v3, &qword_255DB7908);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v5, v6);
  }
  else
  {
    sub_22DE1F07C();
    sub_22DD5071C((uint64_t)v3, &qword_255DB7908);
  }
  free(v3);
  free(v5);
  free(v4);
  free(v2);
}

uint64_t FBKInlineView.$subject.getter()
{
  return sub_22DE140F0((uint64_t (*)(uint64_t))MEMORY[0x24BDF47E0]);
}

uint64_t sub_22DE140F0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  type metadata accessor for FBKInlineView();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  return a1(v2);
}

uint64_t sub_22DE1413C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for FBKInlineView() + 24));
  v4 = *v3;
  v5 = v3[1];
  if (*v3)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_22DE15340;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_22DD50D8C(v4);
}

uint64_t sub_22DE141B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_22DE15310;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for FBKInlineView() + 24));
  v8 = *v7;
  sub_22DD50D8C(v3);
  result = sub_22DD50DE0(v8);
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  return result;
}

uint64_t FBKInlineView.onFormComplete.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for FBKInlineView() + 24));
  sub_22DD50D8C(v1);
  return v1;
}

uint64_t FBKInlineView.onFormComplete.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for FBKInlineView() + 24));
  result = sub_22DD50DE0(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FBKInlineView.onFormComplete.modify())(_QWORD)
{
  type metadata accessor for FBKInlineView();
  return nullsub_1;
}

uint64_t FBKInlineView.init(feedbackController:subject:onFormComplete:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  int *v14;
  _QWORD *v15;
  char *v16;
  uint64_t result;
  char v18;
  uint64_t v19;

  v14 = (int *)type metadata accessor for FBKInlineView();
  v15 = (_QWORD *)((char *)a7 + v14[6]);
  v16 = (char *)a7 + v14[7];
  sub_22DE1EFEC();
  *v16 = v18;
  *((_QWORD *)v16 + 1) = v19;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  result = sub_22DD96438(a4, (uint64_t)a7 + v14[5]);
  *v15 = a5;
  v15[1] = a6;
  return result;
}

uint64_t FBKInlineView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA080);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_22DE1E8F0();
  *((_QWORD *)v5 + 1) = 0x4030000000000000;
  v5[16] = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA088);
  sub_22DE14494(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  v7 = sub_22DE1EC5C();
  sub_22DD506A0((uint64_t)v5, a1, &qword_255DBA080);
  v8 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DBA090) + 36);
  *(_BYTE *)v8 = v7;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_BYTE *)(v8 + 40) = 1;
  return sub_22DD5071C((uint64_t)v5, &qword_255DBA080);
}

uint64_t sub_22DE14494@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _BYTE *v37;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v43[4];
  int v44;
  uint64_t v45;
  _BYTE *v46;
  _BYTE *v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;

  v59 = a2;
  v57 = type metadata accessor for FBKInlineThumbsUp();
  v3 = MEMORY[0x24BDAC7A8](v57);
  v58 = &v43[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v43[-v5];
  v7 = type metadata accessor for FBKInlineView();
  v8 = *(_QWORD *)(v7 - 8);
  v55 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v43[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  MEMORY[0x24BDAC7A8](v53);
  v12 = &v43[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (int *)type metadata accessor for FBKInlineThumbsDown();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v56 = &v43[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v17 = &v43[-v16];
  v60 = *(_QWORD *)a1;
  v61 = *(_OWORD *)(a1 + 8);
  *(_QWORD *)&v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7280);
  sub_22DE1F094();
  v49 = v62;
  v48 = v63;
  v52 = a1 + *(int *)(v7 + 20);
  sub_22DE1F094();
  v18 = a1 + *(int *)(v7 + 28);
  v19 = *(_QWORD *)(v18 + 8);
  LOBYTE(v60) = *(_BYTE *)v18;
  *(_QWORD *)&v61 = v19;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB5850);
  sub_22DE1F010();
  v20 = v62;
  v45 = v63;
  v44 = BYTE8(v63);
  v47 = v10;
  sub_22DD5C570(a1, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineView);
  v21 = *(unsigned __int8 *)(v8 + 80);
  v22 = (v21 + 16) & ~v21;
  v55 += v22;
  v50 = v21 | 7;
  v23 = swift_allocObject();
  sub_22DE15368((uint64_t)v10, v23 + v22);
  v24 = &v17[v13[7]];
  *(_QWORD *)v17 = v49;
  *(_OWORD *)(v17 + 8) = v48;
  v25 = (uint64_t)&v17[v13[5]];
  v46 = v12;
  sub_22DD96438((uint64_t)v12, v25);
  v26 = &v17[v13[6]];
  v27 = v45;
  *(_QWORD *)v26 = v20;
  *((_QWORD *)v26 + 1) = v27;
  v26[16] = v44;
  *v24 = sub_22DE153AC;
  v24[1] = v23;
  v60 = *(_QWORD *)a1;
  v61 = *(_OWORD *)(a1 + 8);
  sub_22DE1F094();
  v28 = v62;
  v54 = v63;
  sub_22DE1F094();
  v29 = *(_QWORD *)(v18 + 8);
  LOBYTE(v60) = *(_BYTE *)v18;
  *(_QWORD *)&v61 = v29;
  sub_22DE1F010();
  v30 = v62;
  v31 = v63;
  LOBYTE(v20) = BYTE8(v63);
  v32 = (uint64_t)v47;
  sub_22DD5C570(a1, (uint64_t)v47, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineView);
  v33 = swift_allocObject();
  sub_22DE15368(v32, v33 + v22);
  v34 = v57;
  v35 = &v6[*(int *)(v57 + 28)];
  *(_QWORD *)v6 = v28;
  *(_OWORD *)(v6 + 8) = v54;
  v36 = v34;
  sub_22DD96438((uint64_t)v46, (uint64_t)&v6[*(int *)(v34 + 20)]);
  v37 = &v6[*(int *)(v36 + 24)];
  *(_QWORD *)v37 = v30;
  *((_QWORD *)v37 + 1) = v31;
  v37[16] = v20;
  *v35 = sub_22DE153AC;
  v35[1] = v33;
  v38 = v56;
  sub_22DD5C570((uint64_t)v17, (uint64_t)v56, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsDown);
  v39 = v58;
  sub_22DD5C570((uint64_t)v6, (uint64_t)v58, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsUp);
  v40 = v59;
  sub_22DD5C570((uint64_t)v38, v59, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsDown);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA140);
  sub_22DD5C570((uint64_t)v39, v40 + *(int *)(v41 + 48), (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsUp);
  sub_22DD5C950((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsUp);
  sub_22DD5C950((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsDown);
  sub_22DD5C950((uint64_t)v39, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsUp);
  return sub_22DD5C950((uint64_t)v38, (uint64_t (*)(_QWORD))type metadata accessor for FBKInlineThumbsDown);
}

uint64_t sub_22DE148E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DE148F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA080);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_22DE1E8F0();
  *((_QWORD *)v5 + 1) = 0x4030000000000000;
  v5[16] = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA088);
  sub_22DE14494(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  v7 = sub_22DE1EC5C();
  sub_22DD506A0((uint64_t)v5, a1, &qword_255DBA080);
  v8 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DBA090) + 36);
  *(_BYTE *)v8 = v7;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_BYTE *)(v8 + 40) = 1;
  return sub_22DD5071C((uint64_t)v5, &qword_255DBA080);
}

uint64_t sub_22DE149DC()
{
  uint64_t v0;

  type metadata accessor for FBKInlineView();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
  return MEMORY[0x22E31F8EC](v0);
}

uint64_t *initializeBufferWithCopyOfBuffer for FBKInlineView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    v8 = (void *)a2[2];
    a1[1] = a2[1];
    a1[2] = (uint64_t)v8;
    v9 = a3[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (char *)a2 + v9;
    v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *v10 = *(uint64_t *)((char *)a2 + v9);
    v10[1] = v12;
    swift_retain();
    swift_retain();
    v13 = v8;
    swift_retain();
    swift_retain();
    v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
    v15 = (char *)v10 + v14;
    v16 = &v11[v14];
    v17 = sub_22DE1E194();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v18 = a3[6];
    v19 = (uint64_t *)((char *)a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    if (*v20)
    {
      v21 = v20[1];
      *v19 = *v20;
      v19[1] = v21;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v19 = *(_OWORD *)v20;
    }
    v22 = a3[7];
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    *v23 = *v24;
    *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for FBKInlineView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  swift_release();

  v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
  v6 = sub_22DE1E194();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  if (*(_QWORD *)(a1 + *(int *)(a2 + 24)))
    swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for FBKInlineView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (void *)a2[2];
  a1[2] = v7;
  v8 = a3[5];
  v9 = (_QWORD *)((char *)a1 + v8);
  v10 = (char *)a2 + v8;
  v11 = *(_QWORD *)((char *)a2 + v8 + 8);
  *v9 = *(_QWORD *)((char *)a2 + v8);
  v9[1] = v11;
  swift_retain();
  swift_retain();
  v12 = v7;
  swift_retain();
  swift_retain();
  v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
  v14 = (char *)v9 + v13;
  v15 = &v10[v13];
  v16 = sub_22DE1E194();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  v17 = a3[6];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  if (*v19)
  {
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  *v22 = *v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for FBKInlineView(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v6 = (void *)a2[2];
  v7 = (void *)a1[2];
  a1[2] = v6;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
  swift_retain();
  swift_release();
  *((_QWORD *)v10 + 1) = *((_QWORD *)v11 + 1);
  swift_retain();
  swift_release();
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
  v13 = &v10[v12];
  v14 = &v11[v12];
  v15 = sub_22DE1E194();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[6];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)((char *)a1 + v16);
  v20 = *(_QWORD *)((char *)a2 + v16);
  if (!v19)
  {
    if (v20)
    {
      v22 = *((_QWORD *)v18 + 1);
      *v17 = v20;
      v17[1] = v22;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v17 = *(_OWORD *)v18;
    goto LABEL_8;
  }
  if (!v20)
  {
    swift_release();
    goto LABEL_7;
  }
  v21 = *((_QWORD *)v18 + 1);
  *v17 = v20;
  v17[1] = v21;
  swift_retain();
  swift_release();
LABEL_8:
  v23 = a3[7];
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  *v24 = *v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for FBKInlineView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[5];
  v7 = (_QWORD *)(a1 + v6);
  v8 = a2 + v6;
  v9 = *(_QWORD *)(a2 + v6 + 8);
  *v7 = *(_QWORD *)(a2 + v6);
  v7[1] = v9;
  v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
  v11 = (char *)v7 + v10;
  v12 = v8 + v10;
  v13 = sub_22DE1E194();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[6];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *v16;
  if (*v16)
  {
    v18 = v16[1];
    *v15 = v17;
    v15[1] = v18;
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v16;
  }
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

_QWORD *assignWithTake for FBKInlineView(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = (void *)a1[2];
  a1[2] = a2[2];

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_release();
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_release();
  v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
  v11 = &v8[v10];
  v12 = &v9[v10];
  v13 = sub_22DE1E194();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[6];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (char *)a2 + v14;
  v17 = *(_QWORD *)((char *)a1 + v14);
  v18 = *(_QWORD *)((char *)a2 + v14);
  if (!v17)
  {
    if (v18)
    {
      v20 = *((_QWORD *)v16 + 1);
      *v15 = v18;
      v15[1] = v20;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v15 = *(_OWORD *)v16;
    goto LABEL_8;
  }
  if (!v18)
  {
    swift_release();
    goto LABEL_7;
  }
  v19 = *((_QWORD *)v16 + 1);
  *v15 = v18;
  v15[1] = v19;
  swift_release();
LABEL_8:
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  *v22 = *v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FBKInlineView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE150AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for FBKInlineView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE15138(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_22DE151B0()
{
  unint64_t v0;

  sub_22DD96F00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_22DE15234()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DBA130;
  if (!qword_255DBA130)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DBA090);
    v2[0] = sub_22DE152A0();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DBA130);
  }
  return result;
}

unint64_t sub_22DE152A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DBA138;
  if (!qword_255DBA138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DBA080);
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_255DBA138);
  }
  return result;
}

uint64_t sub_22DE152EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DE15310(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_22DE15340(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_22DE15368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FBKInlineView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for FBKInlineView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();

  v4 = v3 + *(int *)(v1 + 20);
  swift_release();
  swift_release();
  v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7908) + 32);
  v6 = sub_22DE1E194();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  if (*(_QWORD *)(v3 + *(int *)(v1 + 24)))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DE154A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t (**v5)(uint64_t);

  result = type metadata accessor for FBKInlineView();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v5 = (uint64_t (**)(uint64_t))(v1 + *(int *)(result + 24) + ((v4 + 16) & ~v4));
  if (*v5)
    return (*v5)(a1);
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FeedbackFormView(_QWORD *a1, uint64_t a2)
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

void destroy for FeedbackFormView(id *a1)
{

}

uint64_t assignWithCopy for FeedbackFormView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for FeedbackFormView(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for FeedbackFormView()
{
  return &type metadata for FeedbackFormView;
}

uint64_t sub_22DE155FC()
{
  return sub_22DE15C74();
}

id sub_22DE1560C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;

  v3 = (void *)sub_22DE15774(*(_QWORD *)(v1 + 8));
  *a1 = v3;
  return v3;
}

uint64_t sub_22DE15634()
{
  return sub_22DE1EBA8();
}

uint64_t sub_22DE1566C()
{
  sub_22DE15730();
  return sub_22DE1EBE4();
}

uint64_t sub_22DE156BC()
{
  sub_22DE15730();
  return sub_22DE1EBB4();
}

void sub_22DE1570C()
{
  sub_22DE15730();
  sub_22DE1EBD8();
  __break(1u);
}

unint64_t sub_22DE15730()
{
  unint64_t result;

  result = qword_255DBA148;
  if (!qword_255DBA148)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE28324, &type metadata for FeedbackFormView);
    atomic_store(result, (unint64_t *)&qword_255DBA148);
  }
  return result;
}

uint64_t sub_22DE15774(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v2 = sub_22DE1E410();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1E404();
  v6 = sub_22DE1E3F8();
  v7 = sub_22DE1F4F0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v12 = v9;
    *(_DWORD *)v8 = 136446210;
    v11 = sub_22DDA2E30(0xD000000000000011, 0x800000022DE2D290, &v12);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v9, -1, -1);
    MEMORY[0x22E320870](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return a1;
}

uint64_t sub_22DE1593C(uint64_t a1)
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t result;
  _QWORD v20[2];
  uint64_t v21[3];
  uint64_t v22;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB94F8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22DE1E410();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1E404();
  v9 = sub_22DE1E3F8();
  v10 = sub_22DE1F4F0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v20[1] = a1;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v21[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v22 = sub_22DDA2E30(0xD00000000000001ELL, 0x800000022DE2D350, v21);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v9, v10, "%{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v13, -1, -1);
    MEMORY[0x22E320870](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_instantiateConcreteTypeFromMangledName(qword_255DBA150);
  sub_22DE1EC14();
  v14 = (void *)v22;
  swift_getKeyPath();
  v21[0] = (uint64_t)v14;
  sub_22DE15FFC();
  sub_22DE1E068();
  swift_release();
  v15 = (uint64_t)v14 + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext;
  swift_beginAccess();
  sub_22DE16044(v15, (uint64_t)v4);

  v16 = type metadata accessor for FBKEvaluationController.FormContext(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v4, 1, v16) == 1)
  {
    sub_22DE1608C((uint64_t)v4);
  }
  else
  {
    v17 = *(void **)&v4[*(int *)(v16 + 24)];
    v18 = v17;
    sub_22DE160CC((uint64_t)v4);
    if (v17)
      return (uint64_t)v18;
  }
  result = sub_22DE1F7CC();
  __break(1u);
  return result;
}

uint64_t sub_22DE15C74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_22DE1E410();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1E404();
  v4 = sub_22DE1E3F8();
  v5 = sub_22DE1F514();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136446210;
    v9 = sub_22DDA2E30(0xD000000000000022, 0x800000022DE2D2E0, &v10);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v7, -1, -1);
    MEMORY[0x22E320870](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22DE15E34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_22DE1E410();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1E404();
  v4 = sub_22DE1E3F8();
  v5 = sub_22DE1F514();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136446210;
    v9 = sub_22DDA2E30(0xD000000000000029, 0x800000022DE2D2B0, &v10);
    sub_22DE1F628();
    _os_log_impl(&dword_22DD4B000, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E320870](v7, -1, -1);
    MEMORY[0x22E320870](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_22DE15FFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DB7270;
  if (!qword_255DB7270)
  {
    v1 = type metadata accessor for FBKEvaluationController(255);
    result = MEMORY[0x22E3207B0](&protocol conformance descriptor for FBKEvaluationController, v1);
    atomic_store(result, (unint64_t *)&qword_255DB7270);
  }
  return result;
}

uint64_t sub_22DE16044(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB94F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DE1608C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB94F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DE160CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FBKEvaluationController.FormContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DE1610C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_22DE1E020();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1E014();
  type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  sub_22DE1DFE4();
  if (v4 >= 86400.0)
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17A0]), sel_init);
    objc_msgSend(v5, sel_setUnitsStyle_, 2);
    objc_msgSend(v5, sel_setDateTimeStyle_, 1);
    v8 = (void *)sub_22DE1DFF0();
    v6 = (void *)sub_22DE1DFF0();
    v7 = objc_msgSend(v5, sel_localizedStringForDate_relativeToDate_, v8, v6);

  }
  else
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    objc_msgSend(v5, sel_setDateStyle_, 0);
    objc_msgSend(v5, sel_setTimeStyle_, 1);
    v6 = (void *)sub_22DE1DFF0();
    v7 = objc_msgSend(v5, sel_stringFromDate_, v6);
  }

  v9 = sub_22DE1F2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v9;
}

uint64_t sub_22DE162D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;

  v4 = sub_22DE1E8F0();
  sub_22DE16530((uint64_t)&v42);
  v41 = v43;
  v34 = v45;
  v35 = v46;
  v36 = v42;
  v32 = v47;
  v33 = v44;
  v5 = v48;
  v6 = v49;
  v38 = v50;
  v37 = v51;
  v7 = type metadata accessor for CUMailMessageMetadata(0);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v39 = v6;
  v40 = v5;
  if ((*(_BYTE *)(a1 + *(int *)(v7 + 20)) & 1) == 0)
  {
    v12 = v4;
    v13 = *(_QWORD *)(a1 + 24);
    v42 = *(_QWORD *)(a1 + 16);
    v43 = v13;
    sub_22DD50840();
    v4 = v12;
    swift_bridgeObjectRetain();
    v14 = sub_22DE1ED94();
    v16 = v15;
    v18 = v17 & 1;
    sub_22DE1ECB0();
    v19 = sub_22DE1ED64();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    swift_release();
    v26 = v16;
    v27 = v18;
    v6 = v39;
    v5 = v40;
    sub_22DD4FC6C(v14, v26, v27);
    swift_bridgeObjectRelease();
    v10 = v23 & 1;
    v11 = v25;
    v9 = v21;
    v8 = v19;
  }
  LOBYTE(v42) = 1;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v36;
  *(_QWORD *)(a2 + 32) = v41;
  *(_BYTE *)(a2 + 40) = v33;
  *(_QWORD *)(a2 + 48) = v34;
  *(_QWORD *)(a2 + 56) = v35;
  *(_BYTE *)(a2 + 64) = v32;
  *(_QWORD *)(a2 + 72) = v5;
  *(_QWORD *)(a2 + 80) = v6;
  *(_BYTE *)(a2 + 88) = v38;
  *(_QWORD *)(a2 + 96) = v37;
  *(_QWORD *)(a2 + 104) = v8;
  *(_QWORD *)(a2 + 112) = v9;
  *(_QWORD *)(a2 + 120) = v10;
  *(_QWORD *)(a2 + 128) = v11;
  v28 = v10;
  v29 = v8;
  v30 = v11;
  sub_22DD50088(v36, v41, v33);
  swift_bridgeObjectRetain();
  sub_22DD50088(v5, v39, v38);
  swift_bridgeObjectRetain();
  sub_22DDDCAA4(v29, v9, v28, v30);
  sub_22DDDCBC4(v29, v9, v28, v30);
  sub_22DD4FC6C(v36, v41, v33);
  swift_bridgeObjectRelease();
  sub_22DD4FC6C(v40, v39, v38);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE16530@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_22DD50840();
  swift_bridgeObjectRetain();
  v2 = sub_22DE1ED94();
  v4 = v3;
  v6 = v5 & 1;
  sub_22DE1ED1C();
  v7 = sub_22DE1ED64();
  v31 = v8;
  v32 = v7;
  v10 = v9;
  v33 = v11;
  swift_release();
  v30 = v10 & 1;
  sub_22DD4FC6C(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_22DE1610C();
  v12 = sub_22DE1ED94();
  v14 = v13;
  v16 = v15 & 1;
  sub_22DE1EF5C();
  v17 = sub_22DE1ED4C();
  v19 = v18;
  v21 = v20 & 1;
  sub_22DD4FC6C(v12, v14, v16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_22DE1ECB0();
  v22 = sub_22DE1ED64();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  swift_release();
  sub_22DD4FC6C(v17, v19, v21);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v32;
  *(_QWORD *)(a1 + 8) = v31;
  *(_BYTE *)(a1 + 16) = v30;
  *(_QWORD *)(a1 + 24) = v33;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v22;
  *(_QWORD *)(a1 + 56) = v24;
  *(_BYTE *)(a1 + 64) = v26 & 1;
  *(_QWORD *)(a1 + 72) = v28;
  sub_22DD50088(v32, v31, v30);
  swift_bridgeObjectRetain();
  sub_22DD50088(v22, v24, v26 & 1);
  swift_bridgeObjectRetain();
  sub_22DD4FC6C(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  sub_22DD4FC6C(v32, v31, v30);
  return swift_bridgeObjectRelease();
}

double sub_22DE16770@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t KeyPath;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  _OWORD v12[8];
  uint64_t v13;
  _OWORD v14[9];
  char v15;

  v2 = v1;
  v4 = sub_22DE1E9F8();
  sub_22DE162D4(v2, (uint64_t)v12);
  *(_OWORD *)((char *)&v14[5] + 7) = v12[5];
  *(_OWORD *)((char *)&v14[6] + 7) = v12[6];
  *(_OWORD *)((char *)&v14[7] + 7) = v12[7];
  *(_OWORD *)((char *)&v14[1] + 7) = v12[1];
  *(_OWORD *)((char *)&v14[2] + 7) = v12[2];
  *(_OWORD *)((char *)&v14[3] + 7) = v12[3];
  *(_OWORD *)((char *)&v14[4] + 7) = v12[4];
  v15 = 0;
  *(_QWORD *)((char *)&v14[8] + 7) = v13;
  *(_OWORD *)((char *)v14 + 7) = v12[0];
  v5 = sub_22DE1ECBC();
  KeyPath = swift_getKeyPath();
  v7 = v14[4];
  *(_OWORD *)(a1 + 97) = v14[5];
  v8 = v14[7];
  *(_OWORD *)(a1 + 113) = v14[6];
  *(_OWORD *)(a1 + 129) = v8;
  *(_OWORD *)(a1 + 144) = *(_OWORD *)((char *)&v14[7] + 15);
  v9 = v14[0];
  *(_OWORD *)(a1 + 33) = v14[1];
  result = *(double *)&v14[2];
  v11 = v14[3];
  *(_OWORD *)(a1 + 49) = v14[2];
  *(_OWORD *)(a1 + 65) = v11;
  *(_OWORD *)(a1 + 81) = v7;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0x4020000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 17) = v9;
  *(_QWORD *)(a1 + 160) = KeyPath;
  *(_QWORD *)(a1 + 168) = v5;
  return result;
}

uint64_t sub_22DE1685C(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 8);
  result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0)
    return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(_DWORD)result;
  return result;
}

uint64_t sub_22DE16884@<X0>(uint64_t a1@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = a1;
  v2 = type metadata accessor for CUMailMessagePreviewer(0);
  v29 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v30 = v3;
  v32 = (uint64_t)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22DE1E2E4();
  v28 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA420);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA428);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA430);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_22DE1E9F8();
  *((_QWORD *)v9 + 1) = 0x4030000000000000;
  v9[16] = 0;
  v16 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DBA438) + 44)];
  v31 = v1;
  sub_22DE16B94(v1, v16);
  v17 = sub_22DE1ECBC();
  KeyPath = swift_getKeyPath();
  sub_22DD506A0((uint64_t)v9, (uint64_t)v12, &qword_255DBA420);
  v19 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  *v19 = KeyPath;
  v19[1] = v17;
  sub_22DD5071C((uint64_t)v9, &qword_255DBA420);
  if (qword_255DB53D0 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v4, (uint64_t)qword_255DC3D90);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v6, v20, v4);
  v21 = sub_22DE1EF98();
  v22 = sub_22DE1EC5C();
  sub_22DD506A0((uint64_t)v12, (uint64_t)v15, &qword_255DBA428);
  v23 = &v15[*(int *)(v13 + 36)];
  *(_QWORD *)v23 = v21;
  v23[8] = v22;
  sub_22DD5071C((uint64_t)v12, &qword_255DBA428);
  v24 = v32;
  sub_22DD5C570(v31, v32, type metadata accessor for CUMailMessagePreviewer);
  v25 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v26 = swift_allocObject();
  sub_22DD647B0(v24, v26 + v25, type metadata accessor for CUMailMessagePreviewer);
  sub_22DE1AADC();
  sub_22DE1EE00();
  swift_release();
  return sub_22DD5071C((uint64_t)v15, &qword_255DBA430);
}

uint64_t sub_22DE16B94@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t (*v51)(void);
  double v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
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
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  unsigned __int8 v111;
  uint64_t v112;
  uint64_t v113;

  v106 = sub_22DE1E2E4();
  v88 = *(_QWORD *)(v106 - 8);
  v4 = MEMORY[0x24BDAC7A8](v106);
  v102 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v89 = (char *)&v87 - v6;
  v87 = sub_22DE1E734();
  MEMORY[0x24BDAC7A8](v87);
  v8 = (_OWORD *)((char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7700);
  MEMORY[0x24BDAC7A8](v90);
  v10 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA458);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (double *)((char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA460);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA468);
  MEMORY[0x24BDAC7A8](v91);
  v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA470);
  v19 = MEMORY[0x24BDAC7A8](v93);
  v101 = (uint64_t)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v92 = (uint64_t)&v87 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v105 = (uint64_t)&v87 - v23;
  v24 = a1 + *(int *)(type metadata accessor for CUMailMessagePreviewer(0) + 20);
  if ((*(_BYTE *)(v24 + 8) & 1) != 0)
  {
    v103 = 0;
    v104 = 0;
    v107 = 0;
    v99 = 0;
    v100 = 0;
    v98 = 0;
    v97 = 0;
    v96 = 0;
    v95 = 0;
    v94 = 0;
    v25 = 0.0;
  }
  else
  {
    v104 = sub_22DE1E8F0();
    sub_22DE173A0((uint64_t)&v108);
    v103 = v108;
    v99 = v109;
    v100 = *((_QWORD *)&v108 + 1);
    v98 = *((_QWORD *)&v109 + 1);
    v97 = v110;
    v96 = v111;
    v25 = 16.0;
    v107 = 1;
    v95 = v112;
    v94 = v113;
  }
  *(_QWORD *)v13 = sub_22DE1E9F8();
  v13[1] = v25;
  *((_BYTE *)v13 + 16) = 0;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA478);
  sub_22DE17584(a1, (uint64_t)v13 + *(int *)(v26 + 44));
  v27 = sub_22DE1EC5C();
  sub_22DE1E4B8();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_22DD506A0((uint64_t)v13, (uint64_t)v16, &qword_255DBA458);
  v36 = &v16[*(int *)(v14 + 36)];
  *v36 = v27;
  *((_QWORD *)v36 + 1) = v29;
  *((_QWORD *)v36 + 2) = v31;
  *((_QWORD *)v36 + 3) = v33;
  *((_QWORD *)v36 + 4) = v35;
  v36[40] = 0;
  sub_22DD5071C((uint64_t)v13, &qword_255DBA458);
  v37 = (char *)v8 + *(int *)(v87 + 20);
  v38 = *MEMORY[0x24BDEEB68];
  v39 = sub_22DE1E9C8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v37, v38, v39);
  __asm { FMOV            V0.2D, #8.0 }
  *v8 = _Q0;
  if (*(_BYTE *)(v24 + 8) == 1)
  {
    v45 = v89;
    if (qword_255DB53D0 != -1)
      swift_once();
    v46 = qword_255DC3D90;
  }
  else
  {
    v45 = v89;
    if (qword_255DB53F8 != -1)
      swift_once();
    v46 = qword_255DC3E08;
  }
  v47 = v106;
  v48 = __swift_project_value_buffer(v106, (uint64_t)v46);
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
  v49(v45, v48, v47);
  v50 = sub_22DE1EF98();
  sub_22DE1E56C();
  v51 = MEMORY[0x24BDED998];
  sub_22DD5C570((uint64_t)v8, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v52 = *(double *)&v108 * 0.5;
  v53 = (uint64_t)&v10[*(int *)(v90 + 68)];
  sub_22DD5C570((uint64_t)v8, v53, (uint64_t (*)(_QWORD))v51);
  *(double *)(v53 + *(int *)(sub_22DE1E728() + 20)) = v52;
  v54 = v53 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7710) + 36);
  v55 = v109;
  *(_OWORD *)v54 = v108;
  *(_OWORD *)(v54 + 16) = v55;
  *(_QWORD *)(v54 + 32) = v110;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7718);
  *(_QWORD *)(v53 + *(int *)(v56 + 52)) = v50;
  *(_WORD *)(v53 + *(int *)(v56 + 56)) = 256;
  v57 = sub_22DE1F130();
  v59 = v58;
  v60 = (uint64_t *)(v53 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7720) + 36));
  *v60 = v57;
  v60[1] = v59;
  sub_22DD5C950((uint64_t)v8, (uint64_t (*)(_QWORD))v51);
  v61 = sub_22DE1F130();
  v63 = v62;
  v64 = (uint64_t)&v18[*(int *)(v91 + 36)];
  sub_22DD506A0((uint64_t)v10, v64, &qword_255DB7700);
  v65 = (uint64_t *)(v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7708) + 36));
  *v65 = v61;
  v65[1] = v63;
  sub_22DD506A0((uint64_t)v16, (uint64_t)v18, &qword_255DBA460);
  sub_22DD5071C((uint64_t)v10, &qword_255DB7700);
  sub_22DD5071C((uint64_t)v16, &qword_255DBA460);
  if (qword_255DB53D0 != -1)
    swift_once();
  v66 = v106;
  v67 = __swift_project_value_buffer(v106, (uint64_t)qword_255DC3D90);
  v49(v102, v67, v66);
  v68 = sub_22DE1EF98();
  v69 = sub_22DE1EC5C();
  v70 = v92;
  sub_22DD506A0((uint64_t)v18, v92, &qword_255DBA468);
  v71 = v70 + *(int *)(v93 + 36);
  *(_QWORD *)v71 = v68;
  *(_BYTE *)(v71 + 8) = v69;
  sub_22DD5071C((uint64_t)v18, &qword_255DBA468);
  v72 = v105;
  sub_22DD5003C(v70, v105, &qword_255DBA470);
  v73 = v72;
  v74 = v101;
  sub_22DD506A0(v73, v101, &qword_255DBA470);
  *a2 = v104;
  a2[1] = 0;
  v75 = v107;
  v76 = v103;
  a2[2] = v107;
  a2[3] = v76;
  v78 = v99;
  v77 = v100;
  a2[4] = v100;
  a2[5] = v78;
  v79 = v98;
  v80 = v97;
  a2[6] = v98;
  a2[7] = v80;
  v81 = v95;
  a2[8] = v96;
  a2[9] = v81;
  a2[10] = v94;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA480);
  sub_22DD506A0(v74, (uint64_t)a2 + *(int *)(v82 + 48), &qword_255DBA470);
  v83 = v104;
  v84 = v75;
  v85 = v103;
  sub_22DE1AC18(v104, 0, v84, v103, v77, v78, v79);
  sub_22DD5071C(v105, &qword_255DBA470);
  sub_22DD5071C(v74, &qword_255DBA470);
  return sub_22DE1AC6C(v83, 0, v107, v85, v77, v78, v79);
}

uint64_t sub_22DE173A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_22DE1E980();
  v2 = sub_22DE1ED7C();
  v4 = v3;
  v6 = v5 & 1;
  sub_22DE1ED10();
  v7 = sub_22DE1ED64();
  v9 = v8;
  v11 = v10;
  swift_release();
  v12 = v11 & 1;
  sub_22DD4FC6C(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_22DE1EF5C();
  v13 = sub_22DE1ED4C();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  sub_22DD4FC6C(v7, v9, v12);
  swift_release();
  swift_bridgeObjectRelease();
  LOBYTE(v2) = v17 & 1;
  v20 = sub_22DE1EFBC();
  v21 = sub_22DE1EF5C();
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_BYTE *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v19;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v20;
  *(_QWORD *)(a1 + 56) = v21;
  sub_22DD50088(v13, v15, v2);
  swift_bridgeObjectRetain();
  sub_22DD4FC6C(v13, v15, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE17584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  unint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  _BYTE *v56;
  uint64_t v57;
  _BYTE *v58;
  void (*v59)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t (**v69)@<X0>(uint64_t@<X8>);
  uint64_t v70;
  void (*v71)(_BYTE *, uint64_t);
  _BYTE v73[4];
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  char v88;
  uint64_t v89;
  uint64_t v90;

  v86 = a2;
  v3 = type metadata accessor for CUMailMessagePreviewer(0);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  v81 = *(_QWORD *)(v3 - 8);
  v82 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v80 = &v73[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_22DE1F0B8();
  v84 = *(_QWORD *)(v6 - 8);
  v85 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v83 = &v73[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v79 = &v73[-v9];
  v10 = type metadata accessor for CUMailMessageMetadata(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v73[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA488);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v87 = &v73[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = &v73[-v17];
  MEMORY[0x24BDAC7A8](v16);
  v20 = &v73[-v19];
  v78 = &v73[-v19];
  sub_22DD5C570(a1, (uint64_t)v12, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
  v12[*(int *)(v10 + 20)] = 1;
  v77 = a1 + *(int *)(v3 + 20);
  LOBYTE(v3) = sub_22DE1EC5C();
  sub_22DE1E4B8();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  sub_22DD5C570((uint64_t)v12, (uint64_t)v18, type metadata accessor for CUMailMessageMetadata);
  v29 = &v18[*(int *)(v13 + 36)];
  *v29 = v3;
  *((_QWORD *)v29 + 1) = v22;
  *((_QWORD *)v29 + 2) = v24;
  *((_QWORD *)v29 + 3) = v26;
  *((_QWORD *)v29 + 4) = v28;
  v29[40] = 0;
  sub_22DD5C950((uint64_t)v12, type metadata accessor for CUMailMessageMetadata);
  sub_22DD5003C((uint64_t)v18, (uint64_t)v20, &qword_255DBA488);
  sub_22DE1F0AC();
  v30 = *(_QWORD *)(a1 + 24);
  v89 = *(_QWORD *)(a1 + 16);
  v90 = v30;
  sub_22DD50840();
  swift_bridgeObjectRetain();
  v31 = sub_22DE1ED94();
  v33 = v32;
  LOBYTE(v13) = v34 & 1;
  sub_22DE1ED04();
  v35 = sub_22DE1ED64();
  v37 = v36;
  v39 = v38;
  swift_release();
  sub_22DD4FC6C(v31, v33, v13);
  swift_bridgeObjectRelease();
  v75 = sub_22DE1ED58();
  v41 = v40;
  v74 = v42;
  v76 = v43;
  sub_22DD4FC6C(v35, v37, v39 & 1);
  swift_bridgeObjectRelease();
  LODWORD(v77) = sub_22DE1EC5C();
  sub_22DE1E4B8();
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = v80;
  sub_22DD5C570(a1, (uint64_t)v80, type metadata accessor for CUMailMessagePreviewer);
  v53 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  v54 = swift_allocObject();
  sub_22DD647B0((uint64_t)v52, v54 + v53, type metadata accessor for CUMailMessagePreviewer);
  v55 = v78;
  v56 = v87;
  sub_22DD506A0((uint64_t)v78, (uint64_t)v87, &qword_255DBA488);
  v58 = v83;
  v57 = v84;
  v59 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v84 + 16);
  v60 = v79;
  v61 = v85;
  v59(v83, v79, v85);
  LOBYTE(v89) = v74 & 1;
  v88 = 0;
  v62 = (uint64_t)v56;
  v63 = v86;
  sub_22DD506A0(v62, v86, &qword_255DBA488);
  v64 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_255DBA490);
  v59((_BYTE *)(v63 + v64[12]), v58, v61);
  v65 = v63 + v64[16];
  v66 = v89;
  v67 = v88;
  v68 = v75;
  *(_QWORD *)v65 = v75;
  *(_QWORD *)(v65 + 8) = v41;
  *(_BYTE *)(v65 + 16) = v66;
  *(_QWORD *)(v65 + 24) = v76;
  *(_BYTE *)(v65 + 32) = v77;
  *(_QWORD *)(v65 + 40) = v45;
  *(_QWORD *)(v65 + 48) = v47;
  *(_QWORD *)(v65 + 56) = v49;
  *(_QWORD *)(v65 + 64) = v51;
  *(_BYTE *)(v65 + 72) = v67;
  v69 = (uint64_t (**)@<X0>(uint64_t@<X8>))(v63 + v64[20]);
  *v69 = sub_22DE1ADCC;
  v69[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v54;
  v70 = v68;
  sub_22DD50088(v68, v41, v66);
  v71 = *(void (**)(_BYTE *, uint64_t))(v57 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v71(v60, v61);
  sub_22DD5071C((uint64_t)v55, &qword_255DBA488);
  swift_release();
  sub_22DD4FC6C(v70, v41, v89);
  swift_bridgeObjectRelease();
  v71(v58, v61);
  return sub_22DD5071C((uint64_t)v87, &qword_255DBA488);
}

uint64_t sub_22DE17AB0@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
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
  char *v31;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v37 = a2;
  v3 = type metadata accessor for CUMailMessagePreviewer(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA498);
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA4A0);
  MEMORY[0x24BDAC7A8](v34);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = a1[1];
  v33 = (char *)a1 + *(int *)(v3 + 20);
  v13 = v33[8];
  swift_bridgeObjectRetain();
  v14 = 0;
  if ((v13 & 1) == 0)
  {
    sub_22DE1E620();
    v14 = v15;
  }
  v46 = 0;
  sub_22DE1EFEC();
  v16 = v38;
  v17 = v39;
  v38 = v11;
  v39 = v12;
  v40 = v14;
  v41 = v13;
  v42 = v16;
  v43 = v17;
  v44 = 0xD00000000000012CLL;
  v45 = 0x800000022DE2D370;
  sub_22DD5C570((uint64_t)a1, (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CUMailMessagePreviewer);
  v18 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v19 = swift_allocObject();
  sub_22DD647B0((uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, type metadata accessor for CUMailMessagePreviewer);
  sub_22DE1AE68();
  sub_22DE1EE00();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v20 = sub_22DE1EC5C();
  sub_22DE1E4B8();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v35;
  v29 = v36;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v10, v8, v36);
  v31 = &v10[*(int *)(v34 + 36)];
  *v31 = v20;
  *((_QWORD *)v31 + 1) = v22;
  *((_QWORD *)v31 + 2) = v24;
  *((_QWORD *)v31 + 3) = v26;
  *((_QWORD *)v31 + 4) = v28;
  v31[40] = 0;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v29);
  return sub_22DD5003C((uint64_t)v10, v37, &qword_255DBA4A0);
}

uint64_t sub_22DE17D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (**v14)();
  uint64_t v16;

  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0)
                                        - 8)
                            + 80);
    v10 = a1 + ((v9 + 32) & ~v9);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a1;
    *(_QWORD *)(v11 + 24) = a2;
    *(_BYTE *)(v11 + 32) = a3 & 1;
    sub_22DD5C570(v10, a4, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
    v12 = type metadata accessor for CUMailMessagePreviewer(0);
    v13 = a4 + *(int *)(v12 + 20);
    *(_QWORD *)v13 = v5;
    *(_BYTE *)(v13 + 8) = 0;
    v14 = (uint64_t (**)())(a4 + *(int *)(v12 + 24));
    *v14 = sub_22DE19624;
    v14[1] = (uint64_t (*)())v11;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a4, 0, 1, v12);
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  else
  {
    v16 = type metadata accessor for CUMailMessagePreviewer(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a4, 1, 1, v16);
  }
}

uint64_t sub_22DE17E98(uint64_t a1, uint64_t a2, char a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v4 = a3 & 1;
  v5 = sub_22DE1E1F4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for FullScreenPreviewController.Content.PreviewType(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = swift_retain();
  sub_22DD83ECC(v12, v4);
  swift_release();
  *v11 = a1;
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE31028], v5);
  swift_bridgeObjectRetain();
  sub_22DD7765C((uint64_t)v11, (uint64_t)v8);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_22DD5C950((uint64_t)v11, type metadata accessor for FullScreenPreviewController.Content.PreviewType);
}

uint64_t sub_22DE17FE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22DE17D6C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

uint64_t sub_22DE17FEC@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v22 = a1;
  v3 = type metadata accessor for CUMailOriginalContentFullScreenPreviewController(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA3D8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = *(_QWORD *)(*(_QWORD *)v1 + 16) > 1uLL;
  v13 = 0x6567617373654DLL;
  if (*(_QWORD *)(*(_QWORD *)v1 + 16) > 1uLL)
    v13 = 0x61737265766E6F43;
  v21 = v13;
  if (v12)
    v14 = 0xEC0000006E6F6974;
  else
    v14 = 0xE700000000000000;
  v23 = sub_22DE1EF74();
  sub_22DE1A97C();
  v15 = sub_22DE1EFA4();
  sub_22DD5C570(v2, (uint64_t)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CUMailOriginalContentFullScreenPreviewController);
  v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v17 = swift_allocObject();
  sub_22DD647B0((uint64_t)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, type metadata accessor for CUMailOriginalContentFullScreenPreviewController);
  v18 = (uint64_t *)&v9[*(int *)(v6 + 40)];
  *v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB6010);
  swift_storeEnumTagMultiPayload();
  *((_QWORD *)v9 + 6) = sub_22DE1AA8C;
  *((_QWORD *)v9 + 7) = v17;
  *(_OWORD *)v9 = xmmword_22DE28420;
  *((_QWORD *)v9 + 2) = v21;
  *((_QWORD *)v9 + 3) = v14;
  *((_QWORD *)v9 + 4) = v15;
  v9[40] = 0;
  sub_22DD5003C((uint64_t)v9, (uint64_t)v11, &qword_255DBA3D8);
  return sub_22DD5003C((uint64_t)v11, v22, &qword_255DBA3D8);
}

uint64_t sub_22DE18204@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA3E8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a2 = sub_22DE1E9EC();
  *(_QWORD *)(a2 + 8) = 0x4040000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA3F0);
  v11 = *a1;
  swift_getKeyPath();
  sub_22DD504A8(&qword_255DB82C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  swift_bridgeObjectRetain();
  sub_22DE1DEC4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA3F8);
  sub_22DD508B0(&qword_255DBA400, &qword_255DBA3F8, MEMORY[0x24BEE12C8]);
  sub_22DD508B0(&qword_255DBA408, &qword_255DBA3E8, MEMORY[0x24BDCC6C8]);
  v8 = sub_22DE1F3A0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  v11 = v8;
  sub_22DE1E050();
  type metadata accessor for CUMailMessagePreviewer(0);
  sub_22DD508B0(&qword_255DBA410, &qword_255DBA3F8, MEMORY[0x24BEE12D8]);
  sub_22DD504A8(&qword_255DBA3D0, type metadata accessor for CUMailMessagePreviewer, (uint64_t)&unk_22DE285F4);
  sub_22DD504A8(&qword_255DBA418, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail, (uint64_t)&unk_22DE215D8);
  return sub_22DE1F0D0();
}

uint64_t sub_22DE18428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;

  sub_22DD5C570(a1, a2, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
  result = type metadata accessor for CUMailMessagePreviewer(0);
  v4 = a2 + *(int *)(result + 20);
  *(_QWORD *)v4 = 0;
  *(_BYTE *)(v4 + 8) = 1;
  v5 = (_QWORD *)(a2 + *(int *)(result + 24));
  *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t sub_22DE18480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA190);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  *(_QWORD *)v9 = sub_22DE1E9F8();
  *((_QWORD *)v9 + 1) = 0x4030000000000000;
  v9[16] = 0;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA198);
  sub_22DE18590(a1, (uint64_t *)&v9[*(int *)(v10 + 44)]);
  sub_22DD506A0((uint64_t)v9, (uint64_t)v7, &qword_255DBA190);
  sub_22DD506A0((uint64_t)v7, a2, &qword_255DBA190);
  v11 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1A0) + 48);
  *(_QWORD *)v11 = 0;
  *(_BYTE *)(v11 + 8) = 1;
  sub_22DD5071C((uint64_t)v9, &qword_255DBA190);
  return sub_22DD5071C((uint64_t)v7, &qword_255DBA190);
}

uint64_t sub_22DE18590@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
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
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
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
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(void);
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  char *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t *v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;

  v87 = a1;
  v101 = a2;
  v92 = sub_22DE1E734();
  MEMORY[0x24BDAC7A8](v92);
  v93 = (char *)&v82 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7700);
  MEMORY[0x24BDAC7A8](v97);
  v100 = (uint64_t)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_22DE1E2E4();
  v89 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v90 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1B0);
  MEMORY[0x24BDAC7A8](v85);
  v83 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1B8);
  MEMORY[0x24BDAC7A8](v86);
  v88 = (uint64_t)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1C0);
  v10 = MEMORY[0x24BDAC7A8](v96);
  v99 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v98 = (uint64_t)&v82 - v12;
  sub_22DE1E980();
  v13 = sub_22DE1ED7C();
  v15 = v14;
  v17 = v16 & 1;
  sub_22DE1ED10();
  v18 = sub_22DE1ED64();
  v20 = v19;
  v22 = v21;
  swift_release();
  sub_22DD4FC6C(v13, v15, v17);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v102 = sub_22DE1EF5C();
  v23 = sub_22DE1ED4C();
  v94 = v24;
  v95 = v23;
  v84 = v25;
  v27 = v26;
  sub_22DD4FC6C(v18, v20, v22 & 1);
  swift_release();
  v28 = (uint64_t)v83;
  swift_bridgeObjectRelease();
  *(_QWORD *)v7 = sub_22DE1E9F8();
  *((_QWORD *)v7 + 1) = 0x4030000000000000;
  v7[16] = 0;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1C8);
  sub_22DE18CEC(v87, (uint64_t)&v7[*(int *)(v29 + 44)]);
  LOBYTE(v15) = sub_22DE1EC5C();
  sub_22DE1E4B8();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  sub_22DD506A0((uint64_t)v7, v28, &qword_255DBA1A8);
  v38 = v28 + *(int *)(v85 + 36);
  *(_BYTE *)v38 = v15;
  *(_QWORD *)(v38 + 8) = v31;
  *(_QWORD *)(v38 + 16) = v33;
  *(_QWORD *)(v38 + 24) = v35;
  *(_QWORD *)(v38 + 32) = v37;
  *(_BYTE *)(v38 + 40) = 0;
  sub_22DD5071C((uint64_t)v7, &qword_255DBA1A8);
  if (qword_255DB53D0 != -1)
    swift_once();
  v39 = v91;
  v40 = __swift_project_value_buffer(v91, (uint64_t)qword_255DC3D90);
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v89 + 16);
  v42 = v90;
  v41(v90, v40, v39);
  v43 = sub_22DE1EF98();
  v44 = sub_22DE1EC5C();
  v45 = v88;
  sub_22DD506A0(v28, v88, &qword_255DBA1B0);
  v46 = v45 + *(int *)(v86 + 36);
  *(_QWORD *)v46 = v43;
  *(_BYTE *)(v46 + 8) = v44;
  sub_22DD5071C(v28, &qword_255DBA1B0);
  v47 = v93;
  v48 = &v93[*(int *)(v92 + 20)];
  v49 = *MEMORY[0x24BDEEB68];
  v50 = sub_22DE1E9C8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 104))(v48, v49, v50);
  __asm { FMOV            V0.2D, #8.0 }
  *v47 = _Q0;
  if (qword_255DB53F8 != -1)
    swift_once();
  v56 = v84 & 1;
  v57 = __swift_project_value_buffer(v39, (uint64_t)qword_255DC3E08);
  v41(v42, v57, v39);
  v58 = sub_22DE1EF98();
  sub_22DE1E56C();
  v59 = MEMORY[0x24BDED998];
  v60 = v100;
  sub_22DD5C570((uint64_t)v47, v100, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v61 = *(double *)&v102 * 0.5;
  v62 = v60 + *(int *)(v97 + 68);
  sub_22DD5C570((uint64_t)v47, v62, (uint64_t (*)(_QWORD))v59);
  *(double *)(v62 + *(int *)(sub_22DE1E728() + 20)) = v61;
  v63 = v62 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7710) + 36);
  v64 = v103;
  *(_OWORD *)v63 = v102;
  *(_OWORD *)(v63 + 16) = v64;
  *(_QWORD *)(v63 + 32) = v104;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7718);
  *(_QWORD *)(v62 + *(int *)(v65 + 52)) = v58;
  *(_WORD *)(v62 + *(int *)(v65 + 56)) = 256;
  v66 = sub_22DE1F130();
  v68 = v67;
  v69 = (uint64_t *)(v62 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7720) + 36));
  *v69 = v66;
  v69[1] = v68;
  sub_22DD5C950((uint64_t)v47, (uint64_t (*)(_QWORD))v59);
  v70 = sub_22DE1F130();
  v72 = v71;
  v73 = (uint64_t)v99;
  v74 = (uint64_t)&v99[*(int *)(v96 + 36)];
  sub_22DD506A0(v60, v74, &qword_255DB7700);
  v75 = (uint64_t *)(v74 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7708) + 36));
  *v75 = v70;
  v75[1] = v72;
  sub_22DD506A0(v45, v73, &qword_255DBA1B8);
  sub_22DD5071C(v60, &qword_255DB7700);
  sub_22DD5071C(v45, &qword_255DBA1B8);
  v76 = v98;
  sub_22DD5003C(v73, v98, &qword_255DBA1C0);
  sub_22DD506A0(v76, v73, &qword_255DBA1C0);
  v77 = v101;
  v79 = v94;
  v78 = v95;
  *v101 = v95;
  v77[1] = v79;
  *((_BYTE *)v77 + 16) = v56;
  v77[3] = v27;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1D0);
  sub_22DD506A0(v73, (uint64_t)v77 + *(int *)(v80 + 48), &qword_255DBA1C0);
  sub_22DD50088(v78, v79, v56);
  swift_bridgeObjectRetain();
  sub_22DD5071C(v76, &qword_255DBA1C0);
  sub_22DD5071C(v73, &qword_255DBA1C0);
  sub_22DD4FC6C(v78, v79, v56);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DE18CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t KeyPath;
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
  uint64_t v69;

  v68 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1D8);
  MEMORY[0x24BDAC7A8](v3);
  v65 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22DE1E974();
  MEMORY[0x24BDAC7A8](v5);
  v6 = type metadata accessor for CUMailMessageMetadata(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v64 = (uint64_t)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v67 = (uint64_t)&v64 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1E0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v66 = (uint64_t)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(qword_255DB5958);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB5948);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v64 - v23;
  v25 = type metadata accessor for BatchInteraction(0);
  sub_22DD506A0(a1 + *(int *)(v25 + 28), (uint64_t)v18, qword_255DB5958);
  v26 = type metadata accessor for BatchInteraction.ContentPolarity(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 48))(v18, 1, v26) != 1)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v29 = type metadata accessor for BatchInteraction.ContentPolarity;
      v30 = (uint64_t)v18;
    }
    else
    {
      sub_22DD5003C((uint64_t)v18, (uint64_t)v24, &qword_255DB5948);
      sub_22DD506A0((uint64_t)v24, (uint64_t)v22, &qword_255DB5948);
      v34 = type metadata accessor for BatchInteraction.ContentPreview(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 48))(v22, 1, v34) == 1)
      {
        sub_22DD5071C((uint64_t)v24, &qword_255DB5948);
        v28 = (uint64_t)v22;
        v27 = &qword_255DB5948;
        goto LABEL_3;
      }
      if (swift_getEnumCaseMultiPayload() == 4)
      {
        v35 = *(_QWORD *)v22;
        if ((v22[8] & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v27 = &qword_255DB5948;
          v28 = (uint64_t)v24;
        }
        else
        {
          if (*(_QWORD *)(v35 + 16))
          {
            sub_22DD5C570(v35 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)), (uint64_t)v12, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
            v36 = 0;
          }
          else
          {
            v36 = 1;
          }
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v36, 1, v13);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
          {
            v37 = v66;
            sub_22DD647B0((uint64_t)v12, v66, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
            v38 = v67;
            sub_22DD5C570(v37, v67, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
            *(_BYTE *)(v38 + *(int *)(v6 + 20)) = 0;
            sub_22DE1E968();
            sub_22DE1E95C();
            sub_22DE1EFBC();
            sub_22DE1E944();
            swift_release();
            sub_22DE1E95C();
            sub_22DE1E938();
            sub_22DE1E95C();
            sub_22DE1E98C();
            v39 = sub_22DE1ED7C();
            v41 = v40;
            LOBYTE(v38) = v42 & 1;
            v69 = sub_22DE1EF5C();
            v43 = sub_22DE1ED4C();
            v45 = v44;
            v47 = v46 & 1;
            sub_22DD4FC6C(v39, v41, v38);
            swift_release();
            swift_bridgeObjectRelease();
            sub_22DE1ECB0();
            v48 = sub_22DE1ED64();
            v50 = v49;
            LOBYTE(v37) = v51;
            swift_release();
            LOBYTE(v39) = v37 & 1;
            sub_22DD4FC6C(v43, v45, v47);
            swift_bridgeObjectRelease();
            v52 = sub_22DE1ED70();
            v54 = v53;
            v56 = v55;
            LOBYTE(v43) = v57 & 1;
            sub_22DD4FC6C(v48, v50, v39);
            swift_bridgeObjectRelease();
            KeyPath = swift_getKeyPath();
            v59 = v67;
            v60 = v64;
            sub_22DD5C570(v67, v64, type metadata accessor for CUMailMessageMetadata);
            v61 = v65;
            sub_22DD5C570(v60, v65, type metadata accessor for CUMailMessageMetadata);
            v62 = v61 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_255DBA1F0) + 48);
            *(_QWORD *)v62 = v52;
            *(_QWORD *)(v62 + 8) = v54;
            *(_BYTE *)(v62 + 16) = v43;
            *(_QWORD *)(v62 + 24) = v56;
            *(_QWORD *)(v62 + 32) = KeyPath;
            *(_QWORD *)(v62 + 40) = 4;
            *(_BYTE *)(v62 + 48) = 0;
            sub_22DD50088(v52, v54, v43);
            swift_bridgeObjectRetain();
            swift_retain();
            sub_22DD5C950(v59, type metadata accessor for CUMailMessageMetadata);
            sub_22DD5C950(v66, type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail);
            sub_22DD5071C((uint64_t)v24, &qword_255DB5948);
            sub_22DD4FC6C(v52, v54, v43);
            swift_release();
            swift_bridgeObjectRelease();
            sub_22DD5C950(v60, type metadata accessor for CUMailMessageMetadata);
            v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1E8);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v61, 0, 1, v63);
            return sub_22DD5003C(v61, v68, &qword_255DBA1D8);
          }
          sub_22DD5071C((uint64_t)v24, &qword_255DB5948);
          v27 = &qword_255DBA1E0;
          v28 = (uint64_t)v12;
        }
        goto LABEL_3;
      }
      sub_22DD5071C((uint64_t)v24, &qword_255DB5948);
      v29 = type metadata accessor for BatchInteraction.ContentPreview;
      v30 = (uint64_t)v22;
    }
    sub_22DD5C950(v30, v29);
    goto LABEL_7;
  }
  v27 = qword_255DB5958;
  v28 = (uint64_t)v18;
LABEL_3:
  sub_22DD5071C(v28, v27);
LABEL_7:
  v31 = v68;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA1E8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 1, 1, v32);
}

uint64_t sub_22DE19410(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(_QWORD);
  char v12;
  uint64_t v13;
  uint64_t v15;

  v4 = sub_22DE1E1F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BatchInteraction(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DD5C570(a1, (uint64_t)v10, v11);
  if ((a2 & 1) != 0)
  {
    if (qword_255DB5340 != -1)
      swift_once();
    v13 = qword_255DC3D08;
    sub_22DE1E200();
    v12 = sub_22DD62E9C((uint64_t)v7, v13);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    v12 = 0;
  }
  sub_22DD5C950((uint64_t)v10, type metadata accessor for BatchInteraction);
  return v12 & 1;
}

uint64_t sub_22DE19550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_22DE1E8F0();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA188);
  return sub_22DE18480(a1, a2 + *(int *)(v4 + 44));
}

ValueMetadata *type metadata accessor for CUMailGeneratedContentPreviewController()
{
  return &type metadata for CUMailGeneratedContentPreviewController;
}

ValueMetadata *type metadata accessor for CUMailOriginalContentPreviewController()
{
  return &type metadata for CUMailOriginalContentPreviewController;
}

uint64_t sub_22DE195BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DE195CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for CUMailMessageMetadata(uint64_t a1)
{
  return sub_22DD6481C(a1, qword_255DBA250);
}

uint64_t sub_22DE195F8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DE19624()
{
  uint64_t v0;

  return sub_22DE17E98(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t type metadata accessor for CUMailMessagePreviewer(uint64_t a1)
{
  return sub_22DD6481C(a1, qword_255DBA2E0);
}

_QWORD *sub_22DE19644(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v25;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
    v11 = v10[7];
    v25 = (char *)v4 + v11;
    v12 = (char *)a2 + v11;
    v13 = sub_22DE1E020();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v25, v12, v13);
    v15 = v10[8];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_22DE1E050();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = v10[9];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    v22 = sub_22DE1DEB8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    *((_BYTE *)v4 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return v4;
}

uint64_t sub_22DE19794(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v3 = a1 + v2[7];
  v4 = sub_22DE1E020();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = a1 + v2[8];
  v6 = sub_22DE1E050();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + v2[9];
  v8 = sub_22DE1DEB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

_QWORD *sub_22DE19844(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v9 = v8[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_22DE1E020();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = v8[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = v8[9];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_22DE19968(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

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
  v6 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v7 = v6[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22DE1E020();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = v6[8];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = v6[9];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_OWORD *sub_22DE19A9C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v8 = v7[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_22DE1E020();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = v7[8];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = v7[9];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_22DE19B80(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

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
  v9 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v10 = v9[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_22DE1E020();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = v9[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  v18 = v9[9];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22DE19C84()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE19C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_22DE19D1C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE19D28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_22DE19DA0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22DE19E10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
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
  char *v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v32;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
    v11 = v10[7];
    v32 = (char *)v4 + v11;
    v12 = (char *)a2 + v11;
    v13 = sub_22DE1E020();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v32, v12, v13);
    v15 = v10[8];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_22DE1E050();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = v10[9];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    v22 = sub_22DE1DEB8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    v23 = *(int *)(a3 + 20);
    v24 = *(int *)(a3 + 24);
    v25 = (char *)v4 + v23;
    v26 = (char *)a2 + v23;
    *(_QWORD *)v25 = *(_QWORD *)v26;
    v25[8] = v26[8];
    v27 = (uint64_t *)((char *)v4 + v24);
    v28 = (uint64_t *)((char *)a2 + v24);
    if (*v28)
    {
      v29 = v28[1];
      *v27 = *v28;
      v27[1] = v29;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v27 = *(_OWORD *)v28;
    }
  }
  return v4;
}

uint64_t sub_22DE19F98(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v5 = a1 + v4[7];
  v6 = sub_22DE1E020();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + v4[8];
  v8 = sub_22DE1E050();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + v4[9];
  v10 = sub_22DE1DEB8();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  if (*(_QWORD *)(a1 + *(int *)(a2 + 24)))
    return swift_release();
  return result;
}

_QWORD *sub_22DE1A074(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
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
  char *v24;
  char *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v9 = v8[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_22DE1E020();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = v8[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = v8[9];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  v22 = *(int *)(a3 + 20);
  v23 = *(int *)(a3 + 24);
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  v24[8] = v25[8];
  v26 = (_QWORD *)((char *)a1 + v23);
  v27 = (_QWORD *)((char *)a2 + v23);
  if (*v27)
  {
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v26 = *(_OWORD *)v27;
  }
  return a1;
}

_QWORD *sub_22DE1A1D0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
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
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

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
  v6 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v7 = v6[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22DE1E020();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = v6[8];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = v6[9];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  v19 = *(int *)(a3 + 20);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *(_QWORD *)v21;
  v20[8] = v21[8];
  *(_QWORD *)v20 = v22;
  v23 = *(int *)(a3 + 24);
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v26 = *(_QWORD *)((char *)a1 + v23);
  v27 = *v25;
  if (!v26)
  {
    if (v27)
    {
      v29 = v25[1];
      *v24 = v27;
      v24[1] = v29;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    return a1;
  }
  if (!v27)
  {
    swift_release();
    goto LABEL_7;
  }
  v28 = v25[1];
  *v24 = v27;
  v24[1] = v28;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_22DE1A370(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
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
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v8 = v7[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_22DE1E020();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = v7[8];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = v7[9];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v20 = *(int *)(a3 + 20);
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v20;
  v23 = (char *)a2 + v20;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v22[8] = v23[8];
  v24 = (_QWORD *)((char *)a1 + v21);
  v25 = (uint64_t *)((char *)a2 + v21);
  v26 = *v25;
  if (*v25)
  {
    v27 = v25[1];
    *v24 = v26;
    v24[1] = v27;
  }
  else
  {
    *(_OWORD *)v24 = *(_OWORD *)v25;
  }
  return a1;
}

_QWORD *sub_22DE1A488(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
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
  char *v24;
  char *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

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
  v9 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v10 = v9[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_22DE1E020();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = v9[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_22DE1E050();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  v18 = v9[9];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_22DE1DEB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  v22 = *(int *)(a3 + 20);
  v23 = *(int *)(a3 + 24);
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v24[8] = v25[8];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  v26 = (_QWORD *)((char *)a1 + v23);
  v27 = (_QWORD *)((char *)a2 + v23);
  v28 = *v27;
  if (!*(_QWORD *)((char *)a1 + v23))
  {
    if (v28)
    {
      v30 = v27[1];
      *v26 = v28;
      v26[1] = v30;
      return a1;
    }
LABEL_7:
    *(_OWORD *)v26 = *(_OWORD *)v27;
    return a1;
  }
  if (!v28)
  {
    swift_release();
    goto LABEL_7;
  }
  v29 = v27[1];
  *v26 = v28;
  v26[1] = v29;
  swift_release();
  return a1;
}

uint64_t sub_22DE1A5E8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE1A5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_22DE1A67C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE1A688(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

uint64_t sub_22DE1A700()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22DE1A77C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DE1A788(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255DB7808);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_22DE1A808()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22DE1A814(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255DB7808);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for CUMailOriginalContentFullScreenPreviewController(uint64_t a1)
{
  return sub_22DD6481C(a1, qword_255DBA378);
}

uint64_t sub_22DE1A8A0()
{
  return sub_22DD508B0(&qword_255DBA3B0, &qword_255DBA3B8, MEMORY[0x24BDF4498]);
}

unint64_t sub_22DE1A8D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255DBA3C0;
  if (!qword_255DBA3C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DBA3C8);
    v2 = sub_22DD504A8(&qword_255DBA3D0, type metadata accessor for CUMailMessagePreviewer, (uint64_t)&unk_22DE285F4);
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255DBA3C0);
  }
  return result;
}

uint64_t sub_22DE1A94C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DE1A95C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DE1A96C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22DE1A97C()
{
  unint64_t result;

  result = qword_255DBA3E0;
  if (!qword_255DBA3E0)
  {
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDF3E58], MEMORY[0x24BDF3E48]);
    atomic_store(result, (unint64_t *)&qword_255DBA3E0);
  }
  return result;
}

uint64_t sub_22DE1A9C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for CUMailOriginalContentFullScreenPreviewController(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DB6010);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v5 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DB7010) + 32);
    v6 = sub_22DE1E71C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  return swift_deallocObject();
}

uint64_t sub_22DE1AA8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CUMailOriginalContentFullScreenPreviewController(0)
                                      - 8)
                          + 80);
  return sub_22DE18204((uint64_t *)(v1 + ((v3 + 16) & ~v3)), a1);
}

unint64_t sub_22DE1AADC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DBA440;
  if (!qword_255DBA440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DBA430);
    v2[0] = sub_22DE1AB80(&qword_255DBA448, &qword_255DBA428, &qword_255DBA450, &qword_255DBA420);
    v2[1] = sub_22DD508B0(&qword_255DB74D0, &qword_255DB74D8, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DBA440);
  }
  return result;
}

uint64_t sub_22DE1AB80(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_22DD508B0(a3, a4, MEMORY[0x24BDF4700]);
    v9[1] = sub_22DD508B0(&qword_255DB74E0, &qword_255DB74E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22DE1AC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;

  if (a7)
  {
    sub_22DD50088(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_22DE1AC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;

  if (a7)
  {
    sub_22DD4FC6C(a4, a5, a6 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for CUMailMessagePreviewer(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for BatchInteraction.ContentPreview.CUContent.Mail(0);
  v5 = v3 + v4[7];
  v6 = sub_22DE1E020();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v3 + v4[8];
  v8 = sub_22DE1E050();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v3 + v4[9];
  v10 = sub_22DE1DEB8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  if (*(_QWORD *)(v3 + *(int *)(v1 + 24)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DE1ADCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CUMailMessagePreviewer(0) - 8) + 80);
  return sub_22DE17AB0((uint64_t *)(v1 + ((v3 + 16) & ~v3)), a1);
}

uint64_t sub_22DE1AE1C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (**v3)(void);

  result = type metadata accessor for CUMailMessagePreviewer(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v3 = (uint64_t (**)(void))(v0 + *(int *)(result + 24) + ((v2 + 16) & ~v2));
  if (*v3)
    return (*v3)();
  return result;
}

unint64_t sub_22DE1AE68()
{
  unint64_t result;

  result = qword_255DBA4A8;
  if (!qword_255DBA4A8)
  {
    result = MEMORY[0x22E3207B0](&unk_22DE22900, &type metadata for BatchWebView);
    atomic_store(result, (unint64_t *)&qword_255DBA4A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CUMailMessagePreviewer.Mode()
{
  return &type metadata for CUMailMessagePreviewer.Mode;
}

uint64_t sub_22DE1AEBC()
{
  return sub_22DD508B0(&qword_255DBA4B0, &qword_255DBA3D8, (uint64_t)&unk_22DE25F78);
}

uint64_t sub_22DE1AEE8()
{
  return sub_22DE1AB80(&qword_255DBA4B8, &qword_255DBA4C0, &qword_255DBA4C8, &qword_255DBA4D0);
}

uint64_t sub_22DE1AF1C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DBA430);
  sub_22DE1AADC();
  return swift_getOpaqueTypeConformance2();
}

void sub_22DE1AF68(unint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *v35;

  v32 = a2;
  v33 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22DE1DFB4();
  v9 = *(unsigned __int8 **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v27 = (char *)&v25 - v12;
  if (a1 >> 62)
    goto LABEL_20;
  v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v13; v13 = sub_22DE1F7D8())
  {
    v34 = v8;
    v29 = a1 & 0xC000000000000001;
    v31 = MEMORY[0x24BEE4AF8];
    v14 = 4;
    v28 = v7;
    v26 = a1;
    while (1)
    {
      v15 = v9;
      v16 = v29
          ? (unsigned __int8 *)MEMORY[0x22E31FFC4](v14 - 4, a1)
          : (unsigned __int8 *)*(id *)(a1 + 8 * v14);
      v9 = v16;
      v17 = v14 - 3;
      if (__OFADD__(v14 - 4, 1))
        break;
      v35 = v16;
      sub_22DE1BDF4((void **)&v35, v32, (uint64_t)v7);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }
      v8 = v13;

      v9 = v15;
      v18 = v34;
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v15 + 6))(v7, 1, v34) == 1)
      {
        sub_22DDA47FC((uint64_t)v7);
      }
      else
      {
        v19 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v15 + 4);
        v20 = v27;
        v19(v27, v7, v18);
        v19(v30, v20, v18);
        v21 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v21 = sub_22DDFCD2C(0, *(_QWORD *)(v21 + 16) + 1, 1, v21);
        v23 = *(_QWORD *)(v21 + 16);
        v22 = *(_QWORD *)(v21 + 24);
        if (v23 >= v22 >> 1)
          v21 = sub_22DDFCD2C(v22 > 1, v23 + 1, 1, v21);
        *(_QWORD *)(v21 + 16) = v23 + 1;
        v9 = v15;
        v24 = (v15[80] + 32) & ~(unint64_t)v15[80];
        v31 = v21;
        v19((char *)(v21 + v24 + *((_QWORD *)v15 + 9) * v23), v30, v34);
        a1 = v26;
      }
      ++v14;
      v13 = v8;
      v7 = v28;
      if (v17 == v8)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
}

unint64_t sub_22DE1B24C()
{
  uint64_t v0;
  uint64_t ObjectType;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v7;

  ObjectType = swift_getObjectType();
  v7 = MEMORY[0x24BEE4AF8];
  v2 = swift_bridgeObjectRetain();
  sub_22DE1AF68(v2, &v7, ObjectType);
  v4 = v3;
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_22DE1B2F4()
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, char *, uint64_t);
  char v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  int v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t result;
  _QWORD v70[2];
  __int128 v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  void (*v85)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t);
  uint64_t v88;
  _QWORD *v89;

  v1 = sub_22DE1DFB4();
  v88 = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v84 = (char *)v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v70 - v5;
  v7 = MEMORY[0x24BDAC7A8](v4);
  v76 = (char *)v70 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v70 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v77 = (char *)v70 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v70 - v17;
  v19 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_attachments);
  swift_beginAccess();
  v20 = *v19;
  v21 = *(_QWORD *)(*v19 + 16);
  v73 = *v19;
  if (v21)
  {
    v72 = v14;
    v75 = v6;
    v22 = v20 + ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80));
    v83 = *(_QWORD *)(v88 + 72);
    v87 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
    swift_bridgeObjectRetain();
    v80 = MEMORY[0x24BEE4B00];
    *(_QWORD *)&v23 = 136446210;
    v71 = v23;
    v70[1] = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v23 = 136446466;
    v79 = v23;
    v81 = v10;
    v82 = v18;
    while (1)
    {
      v87(v18, v22, v1);
      v24 = v88;
      v85 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v88 + 56);
      v85(v18, 0, 1, v1);
      v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
      if (v25(v18, 1, v1) == 1)
        break;
      v26 = *(void (**)(char *, char *, uint64_t))(v88 + 32);
      v26(v10, v18, v1);
      v27 = sub_22DE1DF54();
      v86 = v21;
      if ((v27 & 1) != 0)
      {
        v28 = sub_22DE1DF90();
        v29 = v10;
        v31 = v30;
        v32 = (uint64_t)v77;
        v87(v77, (uint64_t)v29, v1);
        v85((char *)v32, 0, 1, v1);
        v33 = v25((char *)v32, 1, v1);
        v78 = v31;
        if (v33 == 1)
        {
          sub_22DDA47FC(v32);
          v34 = v80;
          swift_bridgeObjectRetain();
          v35 = sub_22DDFD368(v28, v31);
          v37 = v36;
          swift_bridgeObjectRelease();
          if ((v37 & 1) != 0)
          {
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v89 = (_QWORD *)v34;
            v39 = v34;
            v10 = v81;
            if (!isUniquelyReferenced_nonNull_native)
            {
              sub_22DDFFC28();
              v39 = (uint64_t)v89;
            }
            swift_bridgeObjectRelease();
            v40 = (uint64_t)v72;
            v26(v72, (char *)(*(_QWORD *)(v39 + 56) + v35 * v83), v1);
            v80 = v39;
            sub_22DE1C9E0(v35, v39);
            swift_bridgeObjectRelease();
            v41 = 0;
          }
          else
          {
            v41 = 1;
            v40 = (uint64_t)v72;
            v10 = v81;
          }
          v85((char *)v40, v41, 1, v1);
          swift_bridgeObjectRelease();
          sub_22DDA47FC(v40);
        }
        else
        {
          v26(v76, (char *)v32, v1);
          v52 = v80;
          v53 = swift_isUniquelyReferenced_nonNull_native();
          v89 = (_QWORD *)v52;
          v74 = v28;
          v55 = sub_22DDFD368(v28, v31);
          v56 = *(_QWORD *)(v52 + 16);
          v57 = (v54 & 1) == 0;
          v58 = v56 + v57;
          if (__OFADD__(v56, v57))
          {
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            result = sub_22DE1F91C();
            __break(1u);
            return result;
          }
          v59 = v54;
          if (*(_QWORD *)(v52 + 24) >= v58)
          {
            v10 = v81;
            if ((v53 & 1) == 0)
              sub_22DDFFC28();
            v60 = v78;
          }
          else
          {
            sub_22DDFE328(v58, v53);
            v60 = v78;
            v61 = sub_22DDFD368(v74, v78);
            v10 = v81;
            if ((v59 & 1) != (v62 & 1))
              goto LABEL_37;
            v55 = v61;
          }
          v63 = v74;
          v64 = v89;
          if ((v59 & 1) != 0)
          {
            (*(void (**)(unint64_t, char *, uint64_t))(v88 + 40))(v89[7] + v55 * v83, v76, v1);
          }
          else
          {
            v89[(v55 >> 6) + 8] |= 1 << v55;
            v65 = (uint64_t *)(v64[6] + 16 * v55);
            *v65 = v63;
            v65[1] = v60;
            v26((char *)(v64[7] + v55 * v83), v76, v1);
            v66 = v64[2];
            v67 = __OFADD__(v66, 1);
            v68 = v66 + 1;
            if (v67)
              goto LABEL_36;
            v64[2] = v68;
            swift_bridgeObjectRetain();
          }
          v80 = (uint64_t)v89;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v18 = v82;
          v21 = v86;
        }
        (*(void (**)(char *, uint64_t))(v88 + 8))(v10, v1);
      }
      else
      {
        if (qword_255DB5390 != -1)
          swift_once();
        v42 = sub_22DE1E410();
        __swift_project_value_buffer(v42, (uint64_t)qword_255DBA4D8);
        v43 = v75;
        v44 = v81;
        v87(v75, (uint64_t)v81, v1);
        v45 = sub_22DE1E3F8();
        v46 = sub_22DE1F4FC();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = swift_slowAlloc();
          v48 = swift_slowAlloc();
          v89 = (_QWORD *)v48;
          *(_DWORD *)v47 = v71;
          sub_22DE1C998();
          v49 = sub_22DE1F8C8();
          *(_QWORD *)(v47 + 4) = sub_22DDA2E30(v49, v50, (uint64_t *)&v89);
          swift_bridgeObjectRelease();
          v51 = *(void (**)(char *, uint64_t))(v88 + 8);
          v51(v43, v1);
          _os_log_impl(&dword_22DD4B000, v45, v46, "Given url is not reachable [%{public}s]. Will not attach.", (uint8_t *)v47, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E320870](v48, -1, -1);
          MEMORY[0x22E320870](v47, -1, -1);

        }
        else
        {

          v51 = *(void (**)(char *, uint64_t))(v88 + 8);
          v51(v43, v1);
        }
        v51(v44, v1);
        v10 = v44;
        v18 = v82;
        v21 = v86;
      }
      v22 += v83;
      if (!--v21)
        goto LABEL_33;
    }
  }
  else
  {
    v85 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v88 + 56);
    swift_bridgeObjectRetain();
    v80 = MEMORY[0x24BEE4B00];
LABEL_33:
    v85(v18, 1, 1, v1);
  }
  swift_bridgeObjectRelease();
  return v80;
}

uint64_t sub_22DE1BC44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DE1BD44();
  sub_22DE1F520();
  v5 = sub_22DE1DFB4();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  sub_22DDA47FC((uint64_t)v4);
  v7 = NSTemporaryDirectory();
  sub_22DE1F2B0();

  sub_22DE1DF24();
  return swift_bridgeObjectRelease();
}

unint64_t sub_22DE1BD44()
{
  unint64_t result;

  result = qword_255DBA4F0;
  if (!qword_255DBA4F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DBA4F0);
  }
  return result;
}

uint64_t sub_22DE1BD80()
{
  uint64_t v0;

  v0 = sub_22DE1E410();
  __swift_allocate_value_buffer(v0, qword_255DBA4D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_255DBA4D8);
  return sub_22DE1E404();
}

uint64_t sub_22DE1BDF4@<X0>(void **a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v28 = a3;
  v5 = sub_22DE1DFB4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URLError();
  v25[0] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  v13 = swift_allocBox();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v26 = v15;
  v14(v15, 1, 1, v5);
  swift_retain();
  v27 = v13;
  v16 = (void *)v25[1];
  sub_22DD98ECC(v12, v13, a2);
  if (v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, (uint64_t)v12 + OBJC_IVAR____TtC8Feedback19SandboxExtensionURL_url, v5);
    v29 = v16;
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
    swift_dynamicCast();
    v18 = v30;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v8, v5);
    *(_QWORD *)&v11[*(int *)(v9 + 20)] = v18;
    v19 = *a2;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v19;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v19 = sub_22DDFCD18(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
      *a2 = v19;
    }
    v22 = *(_QWORD *)(v19 + 16);
    v21 = *(_QWORD *)(v19 + 24);
    if (v22 >= v21 >> 1)
    {
      v19 = sub_22DDFCD18(v21 > 1, v22 + 1, 1, v19);
      *a2 = v19;
    }
    *(_QWORD *)(v19 + 16) = v22 + 1;
    sub_22DD9A9A0((uint64_t)v11, v19+ ((*(unsigned __int8 *)(v25[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25[0] + 80))+ *(_QWORD *)(v25[0] + 72) * v22);

  }
  v23 = v26;
  swift_beginAccess();
  sub_22DE1C908(v23, v28);
  return swift_release();
}

void sub_22DE1C060(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  id v39;
  void *v40;
  void *v41;
  char *v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v62;
  unint64_t v63;
  _QWORD v64[2];
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  unint64_t *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  id v79[3];
  uint64_t v80;
  uint64_t v81[8];

  v69 = a3;
  v81[6] = *MEMORY[0x24BDAC8D0];
  v67 = type metadata accessor for URLError();
  v70 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v68 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22DE1DFB4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v66 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v64 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v64 - v13;
  v72 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  v15 = MEMORY[0x24BDAC7A8](v72);
  v76 = (uint64_t)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v64 - v17;
  v19 = swift_projectBox();
  sub_22DE1BC44((uint64_t)v14);
  sub_22DE1DF30();
  sub_22DE1DF48();
  swift_bridgeObjectRelease();
  v77 = *(void (**)(char *, uint64_t))(v7 + 8);
  v77(v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  swift_beginAccess();
  v71 = v18;
  v20 = (uint64_t)v18;
  v21 = v19;
  sub_22DE1C950(v20, v19);
  if (qword_255DB5390 != -1)
    swift_once();
  v22 = sub_22DE1E410();
  __swift_project_value_buffer(v22, (uint64_t)qword_255DBA4D8);
  v74 = v7;
  v75 = a1;
  v73 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v73(v12, a1, v6);
  swift_retain_n();
  v23 = a2;
  v24 = sub_22DE1E3F8();
  v25 = sub_22DE1F4F0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    v81[0] = v65;
    *(_DWORD *)v26 = 136315394;
    v64[1] = v23;
    sub_22DE1C998();
    v27 = sub_22DE1F8C8();
    v79[0] = (id)sub_22DDA2E30(v27, v28, v81);
    sub_22DE1F628();
    swift_bridgeObjectRelease();
    v77(v12, v6);
    *(_WORD *)(v26 + 12) = 2080;
    swift_beginAccess();
    sub_22DE1C908(v19, (uint64_t)v71);
    v29 = sub_22DE1F2EC();
    v79[0] = (id)sub_22DDA2E30(v29, v30, v81);
    sub_22DE1F628();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22DD4B000, v24, v25, "Will copy sandboxed url %s to temporary directory %s", (uint8_t *)v26, 0x16u);
    v31 = v65;
    swift_arrayDestroy();
    MEMORY[0x22E320870](v31, -1, -1);
    MEMORY[0x22E320870](v26, -1, -1);

  }
  else
  {
    v77(v12, v6);

    swift_release_n();
  }
  v32 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v33 = v75;
  v34 = (void *)sub_22DE1DF3C();
  swift_beginAccess();
  v35 = v76;
  sub_22DE1C908(v19, v76);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v35, 1, v6) == 1)
    __break(1u);
  v36 = v76;
  v37 = (void *)sub_22DE1DF3C();
  v77((char *)v36, v6);
  v79[0] = 0;
  v38 = objc_msgSend(v32, sel_copyItemAtURL_toURL_error_, v34, v37, v79);

  v39 = v79[0];
  if (!v38)
  {
    v40 = v39;
    v41 = (void *)sub_22DE1DEE8();

    swift_willThrow();
    v42 = v66;
    v73(v66, v33, v6);
    swift_retain();
    v43 = v41;
    swift_retain();
    v44 = v41;
    v45 = sub_22DE1E3F8();
    v46 = sub_22DE1F4FC();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = v6;
      v48 = swift_slowAlloc();
      v76 = swift_slowAlloc();
      v80 = v76;
      *(_DWORD *)v48 = 136315650;
      sub_22DE1C998();
      v49 = sub_22DE1F8C8();
      v79[0] = (id)sub_22DDA2E30(v49, v50, &v80);
      sub_22DE1F628();
      swift_bridgeObjectRelease();
      v77(v42, v47);
      *(_WORD *)(v48 + 12) = 2080;
      swift_beginAccess();
      sub_22DE1C908(v21, (uint64_t)v71);
      v51 = sub_22DE1F2EC();
      v78 = sub_22DDA2E30(v51, v52, &v80);
      sub_22DE1F628();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 22) = 2080;
      v78 = (uint64_t)v41;
      v53 = v41;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DB7A58);
      v54 = sub_22DE1F2EC();
      v78 = sub_22DDA2E30(v54, v55, &v80);
      sub_22DE1F628();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22DD4B000, v45, v46, "Failed to copy sandboxed url %s to temporary directory %s error %s", (uint8_t *)v48, 0x20u);
      v56 = v76;
      swift_arrayDestroy();
      MEMORY[0x22E320870](v56, -1, -1);
      v57 = v48;
      v6 = v47;
      v33 = v75;
      MEMORY[0x22E320870](v57, -1, -1);
    }
    else
    {
      v77(v42, v6);
      swift_release_n();

    }
    v58 = v69;
    v59 = (uint64_t)v68;
    v73(v68, v33, v6);
    *(_QWORD *)(v59 + *(int *)(v67 + 20)) = 2;
    v60 = *v58;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v58 = v60;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v60 = sub_22DDFCD18(0, *(_QWORD *)(v60 + 16) + 1, 1, v60);
      *v58 = v60;
    }
    v63 = *(_QWORD *)(v60 + 16);
    v62 = *(_QWORD *)(v60 + 24);
    if (v63 >= v62 >> 1)
    {
      v60 = sub_22DDFCD18(v62 > 1, v63 + 1, 1, v60);
      *v58 = v60;
    }
    *(_QWORD *)(v60 + 16) = v63 + 1;
    sub_22DD9A9A0(v59, v60+ ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80))+ *(_QWORD *)(v70 + 72) * v63);

  }
}

uint64_t sub_22DE1C908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DE1C950(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DB7BC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_22DE1C998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DB7D78;
  if (!qword_255DB7D78)
  {
    v1 = sub_22DE1DFB4();
    result = MEMORY[0x22E3207B0](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_255DB7D78);
  }
  return result;
}

unint64_t sub_22DE1C9E0(unint64_t result, uint64_t a2)
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
    result = sub_22DE1F688();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_22DE1F964();
        swift_bridgeObjectRetain();
        sub_22DE1F310();
        v9 = sub_22DE1F97C();
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
        v15 = *(_QWORD *)(*(_QWORD *)(sub_22DE1DFB4() - 8) + 72);
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

uint64_t sub_22DE1CBDC()
{
  uint64_t v0;

  v0 = sub_22DE1E410();
  __swift_allocate_value_buffer(v0, qword_255DC3D18);
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D18);
  return sub_22DE1E404();
}

uint64_t sub_22DE1CC48()
{
  uint64_t v0;

  v0 = sub_22DE1E410();
  __swift_allocate_value_buffer(v0, qword_255DC3D30);
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D30);
  return sub_22DE1E404();
}

uint64_t sub_22DE1CCC4()
{
  uint64_t v0;

  v0 = sub_22DE1E410();
  __swift_allocate_value_buffer(v0, qword_255DC3D48);
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D48);
  return sub_22DE1E404();
}

uint64_t sub_22DE1CD34()
{
  uint64_t v0;

  v0 = sub_22DE1E410();
  __swift_allocate_value_buffer(v0, qword_255DC3D60);
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D60);
  return sub_22DE1E404();
}

uint64_t sub_22DE1CDB4()
{
  uint64_t v0;

  v0 = sub_22DE1E410();
  __swift_allocate_value_buffer(v0, qword_255DC3D78);
  __swift_project_value_buffer(v0, (uint64_t)qword_255DC3D78);
  return sub_22DE1E404();
}

uint64_t sub_22DE1CE28()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22DE1E44C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22DE1CE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_22DE1F568();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22DE1F538();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_22DE1F1D8();
  MEMORY[0x24BDAC7A8](v6);
  sub_22DD78E9C();
  sub_22DE1F1CC();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_22DD504A8(&qword_255DBA6C0, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA6C8);
  sub_22DD508B0(&qword_255DBA6D0, &qword_255DBA6C8, MEMORY[0x24BEE12C8]);
  sub_22DE1F67C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_22DE1F58C();
  qword_255DBA4F8 = result;
  return result;
}

uint64_t sub_22DE1D05C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_cancellable))
  {
    swift_retain();
    sub_22DE1E434();
    swift_release();
  }
  v2 = v0 + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader__image;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9460);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = v1 + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_url;
  v5 = sub_22DE1DFB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_22DE1D110()
{
  return _s8Feedback11ImageLoaderCMa_0();
}

uint64_t _s8Feedback11ImageLoaderCMa_0()
{
  uint64_t result;

  result = qword_255DBA548;
  if (!qword_255DBA548)
    return swift_getSingletonMetadata();
  return result;
}

void sub_22DE1D154()
{
  unint64_t v0;
  unint64_t v1;

  sub_22DDDD578();
  if (v0 <= 0x3F)
  {
    sub_22DE1DFB4();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_22DE1D1EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  id v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
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
  char *v45;
  uint64_t v46;
  char *v47;
  id v48;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DB9420);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22DE1F4C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA668);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA670);
  v41 = *(_QWORD *)(v12 - 8);
  v42 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA678);
  v43 = *(_QWORD *)(v15 - 8);
  v44 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v47 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA680);
  v46 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v45 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DBA688);
  result = MEMORY[0x24BDAC7A8](v19);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_isLoading) & 1) == 0)
  {
    v37 = v17;
    v38 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    v39 = v22;
    v40 = result;
    v23 = v0;
    v24 = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
    sub_22DE1F4CC();

    __swift_instantiateConcreteTypeFromMangledName(qword_255DB9338);
    sub_22DD504A8(&qword_255DBA690, (uint64_t (*)(uint64_t))MEMORY[0x24BDCFEB8], MEMORY[0x24BDCFEB0]);
    sub_22DE1E488();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v48 = 0;
    sub_22DD508B0(&qword_255DBA698, &qword_255DBA668, MEMORY[0x24BDB96C0]);
    sub_22DE1E47C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_allocObject();
    swift_weakInit();
    swift_allocObject();
    swift_weakInit();
    swift_allocObject();
    swift_weakInit();
    sub_22DD508B0(&qword_255DBA6A0, &qword_255DBA670, MEMORY[0x24BDB95A8]);
    swift_retain();
    swift_retain();
    v25 = v42;
    sub_22DE1E470();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v25);
    swift_release();
    swift_release();
    if (qword_255DB53C0 != -1)
      swift_once();
    v26 = (void *)qword_255DBA4F8;
    v48 = (id)qword_255DBA4F8;
    v27 = sub_22DE1F55C();
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56);
    v28(v3, 1, 1, v27);
    sub_22DD78E9C();
    sub_22DD508B0(&qword_255DBA6A8, &qword_255DBA678, MEMORY[0x24BDB9568]);
    sub_22DD504A8((unint64_t *)&qword_255DB9450, (uint64_t (*)(uint64_t))sub_22DD78E9C, MEMORY[0x24BEE5670]);
    v29 = v26;
    v31 = v44;
    v30 = v45;
    v32 = v47;
    sub_22DE1E4A0();
    sub_22DDDD790((uint64_t)v3);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v31);
    v48 = (id)sub_22DE1F574();
    v28(v3, 1, 1, v27);
    sub_22DD508B0(&qword_255DBA6B0, &qword_255DBA680, MEMORY[0x24BDB9548]);
    v33 = v37;
    v34 = v38;
    sub_22DE1E494();
    sub_22DDDD790((uint64_t)v3);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v30, v33);
    swift_allocObject();
    swift_weakInit();
    sub_22DD508B0(&qword_255DBA6B8, &qword_255DBA688, MEMORY[0x24BDB9A08]);
    v35 = v40;
    v36 = sub_22DE1E4AC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v35);
    *(_QWORD *)(v23 + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_cancellable) = v36;
    return swift_release();
  }
  return result;
}

void sub_22DE1D808(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = a1[1];
  sub_22DD64850(*a1, v4);
  v5 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  v6 = (void *)sub_22DE1DFC0();
  v7 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_22DD64894(v3, v4);

  *a2 = v7;
}

uint64_t sub_22DE1D890()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_isLoading) = 1;
    return swift_release();
  }
  return result;
}

uint64_t sub_22DE1D8E8()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_isLoading) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_22DE1D93C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + OBJC_IVAR____TtC8FeedbackP33_3BDF5462943C09CAD27F77ADE48386A511ImageLoader_isLoading) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_22DE1D990(void **a1)
{
  void *v1;
  uint64_t result;
  id v3;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v3 = v1;
    return sub_22DE1E458();
  }
  return result;
}

uint64_t sub_22DE1DA20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  _s8Feedback11ImageLoaderCMa_0();
  result = sub_22DE1E440();
  *a1 = result;
  return result;
}

uint64_t sub_22DE1DA5C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22DE1DA80()
{
  return sub_22DE1D890();
}

uint64_t sub_22DE1DA88()
{
  return sub_22DE1D8E8();
}

uint64_t sub_22DE1DA90()
{
  return sub_22DE1D93C();
}

uint64_t sub_22DE1DA98(void **a1)
{
  return sub_22DE1D990(a1);
}

uint64_t sub_22DE1DAA0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22DE1E44C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22DE1DB20(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_22DE1E458();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id sub_22DE1DBB8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_255DBA6D8 = (uint64_t)result;
  return result;
}

uint64_t sub_22DE1DC0C(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3D90);
}

uint64_t sub_22DE1DC30(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3DA8);
}

uint64_t sub_22DE1DC54(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3DC0);
}

uint64_t sub_22DE1DC6C(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3DD8);
}

uint64_t sub_22DE1DC88(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3DF0);
}

uint64_t sub_22DE1DCA4(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3E08);
}

uint64_t sub_22DE1DCC0(uint64_t a1)
{
  return sub_22DE1DCDC(a1, qword_255DC3E20);
}

uint64_t sub_22DE1DCDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_22DE1E2E4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_255DB53C8 != -1)
    swift_once();
  v4 = (id)qword_255DBA6D8;
  return sub_22DE1E2D8();
}

uint64_t sub_22DE1DD74()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_22DE1DD80()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_22DE1DD8C()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_22DE1DD98()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_22DE1DDA4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_22DE1DDB0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_22DE1DDBC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_22DE1DDC8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_22DE1DDD4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_22DE1DDE0()
{
  return MEMORY[0x24BDCB668]();
}

uint64_t sub_22DE1DDEC()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_22DE1DDF8()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_22DE1DE04()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_22DE1DE10()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_22DE1DE1C()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_22DE1DE28()
{
  return MEMORY[0x24BDCBA48]();
}

uint64_t sub_22DE1DE34()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_22DE1DE40()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_22DE1DE4C()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_22DE1DE58()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_22DE1DE64()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_22DE1DE70()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_22DE1DE7C()
{
  return MEMORY[0x24BDCC240]();
}

uint64_t sub_22DE1DE88()
{
  return MEMORY[0x24BDCC248]();
}

uint64_t sub_22DE1DE94()
{
  return MEMORY[0x24BDCC250]();
}

uint64_t sub_22DE1DEA0()
{
  return MEMORY[0x24BDCC258]();
}

uint64_t sub_22DE1DEAC()
{
  return MEMORY[0x24BDCC3F8]();
}

uint64_t sub_22DE1DEB8()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_22DE1DEC4()
{
  return MEMORY[0x24BDCC6B8]();
}

uint64_t sub_22DE1DED0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22DE1DEDC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22DE1DEE8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22DE1DEF4()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_22DE1DF00()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_22DE1DF0C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_22DE1DF18()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_22DE1DF24()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_22DE1DF30()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_22DE1DF3C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22DE1DF48()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_22DE1DF54()
{
  return MEMORY[0x24BDCD958]();
}

uint64_t sub_22DE1DF60()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_22DE1DF6C()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_22DE1DF78()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_22DE1DF84()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22DE1DF90()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_22DE1DF9C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_22DE1DFA8()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_22DE1DFB4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22DE1DFC0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22DE1DFCC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22DE1DFD8()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_22DE1DFE4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_22DE1DFF0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_22DE1DFFC()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_22DE1E008()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_22DE1E014()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_22DE1E020()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22DE1E02C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22DE1E038()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_22DE1E044()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22DE1E050()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22DE1E05C()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_22DE1E068()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_22DE1E074()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_22DE1E080()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_22DE1E08C()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_22DE1E098()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_22DE1E0A4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_22DE1E0B0()
{
  return MEMORY[0x24BE30D08]();
}

uint64_t sub_22DE1E0BC()
{
  return MEMORY[0x24BE30D10]();
}

uint64_t sub_22DE1E0C8()
{
  return MEMORY[0x24BE30D18]();
}

uint64_t sub_22DE1E0D4()
{
  return MEMORY[0x24BE30DF0]();
}

uint64_t sub_22DE1E0E0()
{
  return MEMORY[0x24BE30E10]();
}

uint64_t sub_22DE1E0EC()
{
  return MEMORY[0x24BE30E28]();
}

uint64_t sub_22DE1E0F8()
{
  return MEMORY[0x24BE30E30]();
}

uint64_t sub_22DE1E104()
{
  return MEMORY[0x24BE30E40]();
}

uint64_t sub_22DE1E110()
{
  return MEMORY[0x24BE30E58]();
}

uint64_t sub_22DE1E11C()
{
  return MEMORY[0x24BE30E60]();
}

uint64_t sub_22DE1E128()
{
  return MEMORY[0x24BE30E70]();
}

uint64_t sub_22DE1E134()
{
  return MEMORY[0x24BE30E78]();
}

uint64_t sub_22DE1E140()
{
  return MEMORY[0x24BE30E88]();
}

uint64_t sub_22DE1E14C()
{
  return MEMORY[0x24BE30EB8]();
}

uint64_t sub_22DE1E158()
{
  return MEMORY[0x24BE30EE8]();
}

uint64_t sub_22DE1E164()
{
  return MEMORY[0x24BE30EF0]();
}

uint64_t sub_22DE1E170()
{
  return MEMORY[0x24BE30EF8]();
}

uint64_t sub_22DE1E17C()
{
  return MEMORY[0x24BE30F10]();
}

uint64_t sub_22DE1E188()
{
  return MEMORY[0x24BE30F40]();
}

uint64_t sub_22DE1E194()
{
  return MEMORY[0x24BE30F68]();
}

uint64_t sub_22DE1E1A0()
{
  return MEMORY[0x24BE30F80]();
}

uint64_t sub_22DE1E1AC()
{
  return MEMORY[0x24BE30F88]();
}

uint64_t sub_22DE1E1B8()
{
  return MEMORY[0x24BE30F90]();
}

uint64_t sub_22DE1E1C4()
{
  return MEMORY[0x24BE30FA0]();
}

uint64_t sub_22DE1E1D0()
{
  return MEMORY[0x24BE30FA8]();
}

uint64_t sub_22DE1E1DC()
{
  return MEMORY[0x24BE30FB8]();
}

uint64_t sub_22DE1E1E8()
{
  return MEMORY[0x24BE31050]();
}

uint64_t sub_22DE1E1F4()
{
  return MEMORY[0x24BE31068]();
}

uint64_t sub_22DE1E200()
{
  return MEMORY[0x24BE310A8]();
}

uint64_t sub_22DE1E20C()
{
  return MEMORY[0x24BE310E0]();
}

uint64_t sub_22DE1E218()
{
  return MEMORY[0x24BE31108]();
}

uint64_t sub_22DE1E224()
{
  return MEMORY[0x24BE31118]();
}

uint64_t sub_22DE1E230()
{
  return MEMORY[0x24BE31128]();
}

uint64_t sub_22DE1E23C()
{
  return MEMORY[0x24BE31130]();
}

uint64_t sub_22DE1E248()
{
  return MEMORY[0x24BE311C0]();
}

uint64_t sub_22DE1E254()
{
  return MEMORY[0x24BE311E8]();
}

uint64_t sub_22DE1E260()
{
  return MEMORY[0x24BE311F0]();
}

uint64_t sub_22DE1E26C()
{
  return MEMORY[0x24BE31230]();
}

uint64_t sub_22DE1E278()
{
  return MEMORY[0x24BE31238]();
}

uint64_t sub_22DE1E284()
{
  return MEMORY[0x24BE31240]();
}

uint64_t sub_22DE1E290()
{
  return MEMORY[0x24BE31248]();
}

uint64_t sub_22DE1E29C()
{
  return MEMORY[0x24BE31250]();
}

uint64_t sub_22DE1E2A8()
{
  return MEMORY[0x24BE31258]();
}

uint64_t sub_22DE1E2B4()
{
  return MEMORY[0x24BE31260]();
}

uint64_t sub_22DE1E2C0()
{
  return MEMORY[0x24BE31268]();
}

uint64_t sub_22DE1E2CC()
{
  return MEMORY[0x24BE31270]();
}

uint64_t sub_22DE1E2D8()
{
  return MEMORY[0x24BDC6D18]();
}

uint64_t sub_22DE1E2E4()
{
  return MEMORY[0x24BDC6D28]();
}

uint64_t sub_22DE1E2F0()
{
  return MEMORY[0x24BE79B90]();
}

uint64_t sub_22DE1E2FC()
{
  return MEMORY[0x24BE79B98]();
}

uint64_t sub_22DE1E308()
{
  return MEMORY[0x24BE79DD0]();
}

uint64_t sub_22DE1E314()
{
  return MEMORY[0x24BE79DF8]();
}

uint64_t sub_22DE1E320()
{
  return MEMORY[0x24BE79E40]();
}

uint64_t sub_22DE1E32C()
{
  return MEMORY[0x24BE79E80]();
}

uint64_t sub_22DE1E338()
{
  return MEMORY[0x24BE79ED0]();
}

uint64_t sub_22DE1E344()
{
  return MEMORY[0x24BE79F88]();
}

uint64_t sub_22DE1E350()
{
  return MEMORY[0x24BE79F90]();
}

uint64_t sub_22DE1E35C()
{
  return MEMORY[0x24BE79F98]();
}

uint64_t sub_22DE1E368()
{
  return MEMORY[0x24BE79FF8]();
}

uint64_t sub_22DE1E374()
{
  return MEMORY[0x24BE7A058]();
}

uint64_t sub_22DE1E380()
{
  return MEMORY[0x24BE7A080]();
}

uint64_t sub_22DE1E38C()
{
  return MEMORY[0x24BE7A090]();
}

uint64_t sub_22DE1E398()
{
  return MEMORY[0x24BE7A0C0]();
}

uint64_t sub_22DE1E3A4()
{
  return MEMORY[0x24BE7A2B0]();
}

uint64_t sub_22DE1E3B0()
{
  return MEMORY[0x24BE7A2B8]();
}

uint64_t sub_22DE1E3BC()
{
  return MEMORY[0x24BE7A2F0]();
}

uint64_t sub_22DE1E3C8()
{
  return MEMORY[0x24BE7A2F8]();
}

uint64_t sub_22DE1E3D4()
{
  return MEMORY[0x24BE7A300]();
}

uint64_t sub_22DE1E3E0()
{
  return MEMORY[0x24BE7A550]();
}

uint64_t sub_22DE1E3EC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_22DE1E3F8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22DE1E404()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22DE1E410()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22DE1E41C()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_22DE1E428()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_22DE1E434()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_22DE1E440()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_22DE1E44C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_22DE1E458()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_22DE1E464()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_22DE1E470()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_22DE1E47C()
{
  return MEMORY[0x24BDB9F50]();
}

uint64_t sub_22DE1E488()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_22DE1E494()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_22DE1E4A0()
{
  return MEMORY[0x24BDBA0D0]();
}

uint64_t sub_22DE1E4AC()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_22DE1E4B8()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_22DE1E4C4()
{
  return MEMORY[0x24BDEB1D8]();
}

uint64_t sub_22DE1E4D0()
{
  return MEMORY[0x24BDEB1F0]();
}

uint64_t sub_22DE1E4DC()
{
  return MEMORY[0x24BDEB210]();
}

uint64_t sub_22DE1E4E8()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_22DE1E4F4()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_22DE1E500()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_22DE1E50C()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_22DE1E518()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_22DE1E524()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_22DE1E530()
{
  return MEMORY[0x24BDEB500]();
}

uint64_t sub_22DE1E53C()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_22DE1E548()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_22DE1E554()
{
  return MEMORY[0x24BDEB5B0]();
}

uint64_t sub_22DE1E560()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_22DE1E56C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_22DE1E578()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_22DE1E584()
{
  return MEMORY[0x24BDEBAD8]();
}

uint64_t sub_22DE1E590()
{
  return MEMORY[0x24BDEBAE0]();
}

uint64_t sub_22DE1E59C()
{
  return MEMORY[0x24BDEBAE8]();
}

uint64_t sub_22DE1E5A8()
{
  return MEMORY[0x24BDEBBA8]();
}

uint64_t sub_22DE1E5B4()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_22DE1E5C0()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_22DE1E5CC()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_22DE1E5D8()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_22DE1E5E4()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_22DE1E5F0()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_22DE1E5FC()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_22DE1E608()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_22DE1E614()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_22DE1E620()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_22DE1E62C()
{
  return MEMORY[0x24BDEC1C8]();
}

uint64_t sub_22DE1E638()
{
  return MEMORY[0x24BDEC1E0]();
}

uint64_t sub_22DE1E644()
{
  return MEMORY[0x24BDEC1F8]();
}

uint64_t sub_22DE1E650()
{
  return MEMORY[0x24BDEC210]();
}

uint64_t sub_22DE1E65C()
{
  return MEMORY[0x24BDEC218]();
}

uint64_t sub_22DE1E668()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_22DE1E674()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_22DE1E680()
{
  return MEMORY[0x24BDEC678]();
}

uint64_t sub_22DE1E68C()
{
  return MEMORY[0x24BDEC818]();
}

uint64_t sub_22DE1E698()
{
  return MEMORY[0x24BDEC820]();
}

uint64_t sub_22DE1E6A4()
{
  return MEMORY[0x24BDEC840]();
}

uint64_t sub_22DE1E6B0()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_22DE1E6BC()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_22DE1E6C8()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_22DE1E6D4()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_22DE1E6E0()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_22DE1E6EC()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_22DE1E6F8()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_22DE1E704()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_22DE1E710()
{
  return MEMORY[0x24BDED8C8]();
}

uint64_t sub_22DE1E71C()
{
  return MEMORY[0x24BDED8D0]();
}

uint64_t sub_22DE1E728()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_22DE1E734()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_22DE1E740()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_22DE1E74C()
{
  return MEMORY[0x24BDEDD68]();
}

uint64_t sub_22DE1E758()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_22DE1E764()
{
  return MEMORY[0x24BDEDEC0]();
}

uint64_t sub_22DE1E770()
{
  return MEMORY[0x24BDEDEC8]();
}

uint64_t sub_22DE1E77C()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_22DE1E788()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_22DE1E794()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_22DE1E7A0()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_22DE1E7AC()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_22DE1E7B8()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_22DE1E7C4()
{
  return MEMORY[0x24BDEE0D0]();
}

uint64_t sub_22DE1E7D0()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_22DE1E7DC()
{
  return MEMORY[0x24BDEE108]();
}

uint64_t sub_22DE1E7E8()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_22DE1E7F4()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_22DE1E800()
{
  return MEMORY[0x24BDEE1D8]();
}

uint64_t sub_22DE1E80C()
{
  return MEMORY[0x24BDEE1E0]();
}

uint64_t sub_22DE1E818()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_22DE1E824()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_22DE1E830()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_22DE1E83C()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_22DE1E848()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_22DE1E854()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_22DE1E860()
{
  return MEMORY[0x24BDEE3B0]();
}

uint64_t sub_22DE1E86C()
{
  return MEMORY[0x24BDEE3B8]();
}

uint64_t sub_22DE1E878()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_22DE1E884()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_22DE1E890()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_22DE1E89C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_22DE1E8A8()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_22DE1E8B4()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_22DE1E8C0()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_22DE1E8CC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_22DE1E8D8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_22DE1E8E4()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_22DE1E8F0()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_22DE1E8FC()
{
  return MEMORY[0x24BDEE980]();
}

uint64_t sub_22DE1E908()
{
  return MEMORY[0x24BDEE988]();
}

uint64_t sub_22DE1E914()
{
  return MEMORY[0x24BDEE9A0]();
}

uint64_t sub_22DE1E920()
{
  return MEMORY[0x24BDEE9A8]();
}

uint64_t sub_22DE1E92C()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_22DE1E938()
{
  return MEMORY[0x24BDEE9F0]();
}

uint64_t sub_22DE1E944()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_22DE1E950()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_22DE1E95C()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_22DE1E968()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_22DE1E974()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_22DE1E980()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_22DE1E98C()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_22DE1E998()
{
  return MEMORY[0x24BDEEAA0]();
}

uint64_t sub_22DE1E9A4()
{
  return MEMORY[0x24BDEEAF0]();
}

uint64_t sub_22DE1E9B0()
{
  return MEMORY[0x24BDEEAF8]();
}

uint64_t sub_22DE1E9BC()
{
  return MEMORY[0x24BDEEB10]();
}

uint64_t sub_22DE1E9C8()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_22DE1E9D4()
{
  return MEMORY[0x24BDEEDC0]();
}

uint64_t sub_22DE1E9E0()
{
  return MEMORY[0x24BDEEDC8]();
}

uint64_t sub_22DE1E9EC()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_22DE1E9F8()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_22DE1EA04()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t sub_22DE1EA10()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_22DE1EA1C()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_22DE1EA28()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_22DE1EA34()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_22DE1EA40()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_22DE1EA4C()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_22DE1EA58()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_22DE1EA64()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_22DE1EA70()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_22DE1EA7C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_22DE1EA88()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_22DE1EA94()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_22DE1EAA0()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_22DE1EAAC()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_22DE1EAB8()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_22DE1EAC4()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_22DE1EAD0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_22DE1EADC()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_22DE1EAE8()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_22DE1EAF4()
{
  return MEMORY[0x24BDEF5C8]();
}

uint64_t sub_22DE1EB00()
{
  return MEMORY[0x24BDEF5D8]();
}

uint64_t sub_22DE1EB0C()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_22DE1EB18()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_22DE1EB24()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_22DE1EB30()
{
  return MEMORY[0x24BDEFAB0]();
}

uint64_t sub_22DE1EB3C()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_22DE1EB48()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_22DE1EB54()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_22DE1EB60()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_22DE1EB6C()
{
  return MEMORY[0x24BDF0A18]();
}

uint64_t sub_22DE1EB78()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_22DE1EB84()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_22DE1EB90()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_22DE1EB9C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_22DE1EBA8()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_22DE1EBB4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_22DE1EBC0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_22DE1EBCC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_22DE1EBD8()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_22DE1EBE4()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_22DE1EBF0()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_22DE1EBFC()
{
  return MEMORY[0x24BDF12A0]();
}

uint64_t sub_22DE1EC08()
{
  return MEMORY[0x24BDF12B0]();
}

uint64_t sub_22DE1EC14()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_22DE1EC20()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_22DE1EC2C()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_22DE1EC38()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_22DE1EC44()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_22DE1EC50()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_22DE1EC5C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_22DE1EC68()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_22DE1EC74()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_22DE1EC80()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_22DE1EC8C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_22DE1EC98()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_22DE1ECA4()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_22DE1ECB0()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_22DE1ECBC()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_22DE1ECC8()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_22DE1ECD4()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_22DE1ECE0()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_22DE1ECEC()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_22DE1ECF8()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_22DE1ED04()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_22DE1ED10()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_22DE1ED1C()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_22DE1ED28()
{
  return MEMORY[0x24BDF19C0]();
}

uint64_t sub_22DE1ED34()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_22DE1ED40()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_22DE1ED4C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_22DE1ED58()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_22DE1ED64()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_22DE1ED70()
{
  return MEMORY[0x24BDF1EA0]();
}

uint64_t sub_22DE1ED7C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_22DE1ED88()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_22DE1ED94()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_22DE1EDA0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22DE1EDAC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22DE1EDB8()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_22DE1EDC4()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_22DE1EDD0()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_22DE1EDDC()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_22DE1EDE8()
{
  return MEMORY[0x24BDF2348]();
}

uint64_t sub_22DE1EDF4()
{
  return MEMORY[0x24BDF24B8]();
}

uint64_t sub_22DE1EE00()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_22DE1EE0C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22DE1EE18()
{
  return MEMORY[0x24BDF2738]();
}

uint64_t sub_22DE1EE24()
{
  return MEMORY[0x24BDF2818]();
}

uint64_t sub_22DE1EE30()
{
  return MEMORY[0x24BDF2830]();
}

uint64_t sub_22DE1EE3C()
{
  return MEMORY[0x24BDF2958]();
}

uint64_t sub_22DE1EE48()
{
  return MEMORY[0x24BDF2B38]();
}

uint64_t sub_22DE1EE54()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_22DE1EE60()
{
  return MEMORY[0x24BDF2E60]();
}

uint64_t sub_22DE1EE6C()
{
  return MEMORY[0x24BDF2E70]();
}

uint64_t sub_22DE1EE78()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_22DE1EE84()
{
  return MEMORY[0x24BDF2FD8]();
}

uint64_t sub_22DE1EE90()
{
  return MEMORY[0x24BDF32C8]();
}

uint64_t sub_22DE1EE9C()
{
  return MEMORY[0x24BDF32E8]();
}

uint64_t sub_22DE1EEA8()
{
  return MEMORY[0x24BDF33F8]();
}

uint64_t sub_22DE1EEB4()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_22DE1EEC0()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_22DE1EECC()
{
  return MEMORY[0x24BDF3658]();
}

uint64_t sub_22DE1EED8()
{
  return MEMORY[0x24BDF3728]();
}

uint64_t sub_22DE1EEE4()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_22DE1EEF0()
{
  return MEMORY[0x24BDF37C8]();
}

uint64_t sub_22DE1EEFC()
{
  return MEMORY[0x24BDF37D0]();
}

uint64_t sub_22DE1EF08()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_22DE1EF14()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_22DE1EF20()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_22DE1EF2C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_22DE1EF38()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_22DE1EF44()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_22DE1EF50()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_22DE1EF5C()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_22DE1EF68()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_22DE1EF74()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_22DE1EF80()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_22DE1EF8C()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_22DE1EF98()
{
  return MEMORY[0x24BDF3E98]();
}

uint64_t sub_22DE1EFA4()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_22DE1EFB0()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_22DE1EFBC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_22DE1EFC8()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_22DE1EFD4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_22DE1EFE0()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_22DE1EFEC()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_22DE1EFF8()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_22DE1F004()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_22DE1F010()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_22DE1F01C()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_22DE1F028()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_22DE1F034()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_22DE1F040()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_22DE1F04C()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_22DE1F058()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_22DE1F064()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_22DE1F070()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_22DE1F07C()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_22DE1F088()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_22DE1F094()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_22DE1F0A0()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_22DE1F0AC()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_22DE1F0B8()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_22DE1F0C4()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_22DE1F0D0()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_22DE1F0DC()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_22DE1F0E8()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_22DE1F0F4()
{
  return MEMORY[0x24BDF4AD8]();
}

uint64_t sub_22DE1F100()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_22DE1F10C()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_22DE1F118()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_22DE1F124()
{
  return MEMORY[0x24BDF4C18]();
}

uint64_t sub_22DE1F130()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_22DE1F13C()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_22DE1F148()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_22DE1F154()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_22DE1F160()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_22DE1F16C()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_22DE1F178()
{
  return MEMORY[0x24BDF5610]();
}

uint64_t sub_22DE1F184()
{
  return MEMORY[0x24BDF5618]();
}

uint64_t sub_22DE1F190()
{
  return MEMORY[0x24BDF5620]();
}

uint64_t sub_22DE1F19C()
{
  return MEMORY[0x24BDF5628]();
}

uint64_t sub_22DE1F1A8()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_22DE1F1B4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22DE1F1C0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_22DE1F1CC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22DE1F1D8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22DE1F1E4()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_22DE1F1F0()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_22DE1F1FC()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_22DE1F208()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_22DE1F214()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_22DE1F220()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_22DE1F22C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_22DE1F238()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22DE1F244()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22DE1F250()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_22DE1F25C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22DE1F268()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_22DE1F274()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22DE1F280()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22DE1F28C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22DE1F298()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22DE1F2A4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22DE1F2B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22DE1F2BC()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_22DE1F2C8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22DE1F2D4()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_22DE1F2E0()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_22DE1F2EC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22DE1F2F8()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_22DE1F304()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_22DE1F310()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22DE1F31C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22DE1F328()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22DE1F334()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_22DE1F340()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22DE1F34C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_22DE1F358()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_22DE1F364()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_22DE1F370()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_22DE1F37C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_22DE1F388()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22DE1F394()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22DE1F3A0()
{
  return MEMORY[0x24BDCFB60]();
}

uint64_t sub_22DE1F3AC()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22DE1F3B8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22DE1F3C4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22DE1F3D0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22DE1F3DC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22DE1F3E8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22DE1F3F4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22DE1F400()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22DE1F40C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22DE1F418()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22DE1F424()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_22DE1F430()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22DE1F43C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22DE1F448()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22DE1F454()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_22DE1F460()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22DE1F46C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22DE1F478()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_22DE1F484()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_22DE1F490()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_22DE1F49C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_22DE1F4A8()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_22DE1F4B4()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_22DE1F4C0()
{
  return MEMORY[0x24BDCFEB8]();
}

uint64_t sub_22DE1F4CC()
{
  return MEMORY[0x24BDCFED0]();
}

uint64_t sub_22DE1F4D8()
{
  return MEMORY[0x24BE30D28]();
}

uint64_t sub_22DE1F4E4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22DE1F4F0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22DE1F4FC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22DE1F508()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22DE1F514()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22DE1F520()
{
  return MEMORY[0x24BE30D30]();
}

uint64_t sub_22DE1F52C()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_22DE1F538()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22DE1F544()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_22DE1F550()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_22DE1F55C()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_22DE1F568()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_22DE1F574()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22DE1F580()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22DE1F58C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_22DE1F598()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_22DE1F5A4()
{
  return MEMORY[0x24BE30D38]();
}

uint64_t sub_22DE1F5B0()
{
  return MEMORY[0x24BE30D40]();
}

uint64_t sub_22DE1F5BC()
{
  return MEMORY[0x24BEBCF80]();
}

uint64_t sub_22DE1F5C8()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_22DE1F5D4()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_22DE1F5E0()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_22DE1F5EC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_22DE1F5F8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22DE1F604()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_22DE1F610()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22DE1F61C()
{
  return MEMORY[0x24BDD0498]();
}

uint64_t sub_22DE1F628()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22DE1F634()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22DE1F640()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_22DE1F64C()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_22DE1F658()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_22DE1F664()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22DE1F670()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_22DE1F67C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22DE1F688()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22DE1F694()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_22DE1F6A0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_22DE1F6AC()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_22DE1F6B8()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_22DE1F6C4()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_22DE1F6D0()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_22DE1F6DC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_22DE1F6E8()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_22DE1F6F4()
{
  return MEMORY[0x24BDD0698]();
}

uint64_t sub_22DE1F700()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22DE1F70C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22DE1F718()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22DE1F724()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_22DE1F730()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22DE1F73C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22DE1F748()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22DE1F754()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_22DE1F760()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_22DE1F76C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22DE1F778()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_22DE1F784()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_22DE1F790()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_22DE1F79C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_22DE1F7A8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_22DE1F7B4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22DE1F7C0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22DE1F7CC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22DE1F7D8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22DE1F7E4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22DE1F7F0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22DE1F7FC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22DE1F808()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22DE1F814()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22DE1F820()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22DE1F82C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_22DE1F838()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_22DE1F844()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_22DE1F850()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22DE1F85C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_22DE1F868()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22DE1F874()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_22DE1F880()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_22DE1F88C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_22DE1F898()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22DE1F8A4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_22DE1F8B0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22DE1F8BC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22DE1F8C8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22DE1F8D4()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_22DE1F8E0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22DE1F8EC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_22DE1F8F8()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_22DE1F904()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22DE1F910()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22DE1F91C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22DE1F928()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22DE1F934()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22DE1F940()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22DE1F94C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22DE1F958()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22DE1F964()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22DE1F970()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22DE1F97C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22DE1F988()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22DE1F994()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22DE1F9A0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22DE1F9AC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t FBKErrorOfType()
{
  return MEMORY[0x24BE30D60]();
}

uint64_t FBKIsAppleConnectAvailable()
{
  return MEMORY[0x24BE30D70]();
}

uint64_t FBKIsInternalInstall()
{
  return MEMORY[0x24BE30D78]();
}

uint64_t FBKLoginWithAppleConnect()
{
  return MEMORY[0x24BE30D80]();
}

uint64_t FBKStringFromEnvironment()
{
  return MEMORY[0x24BE30D88]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

