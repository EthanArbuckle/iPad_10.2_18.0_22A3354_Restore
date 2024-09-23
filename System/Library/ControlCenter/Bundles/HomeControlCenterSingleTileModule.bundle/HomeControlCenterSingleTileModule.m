uint64_t FeatureFlagsKey.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v6[5];

  v3 = a1;
  v6[3] = a1;
  v6[4] = a2;
  v4 = sub_232C0A7B0(v6);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v4, v2, v3);
  LOBYTE(v3) = sub_232C0F394();
  sub_232C0A7EC((uint64_t)v6);
  return v3 & 1;
}

uint64_t *sub_232C0A7B0(uint64_t *a1)
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

uint64_t sub_232C0A7EC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t variable initialization expression of ControlCenterModule.context()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.lockState()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.viewController()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.registration()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.scheduledRegistrationCancelation()
{
  return 0;
}

id ControlCenterModule.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *ControlCenterModule.init()()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  objc_super v20;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_232C0AAE4(&qword_255FF56F0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_232C0F3C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation] = 0;
  v20.receiver = v1;
  v20.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v20, sel_init);
  sub_232C0F3AC();
  v11 = sub_232C0F3B8();
  v12 = sub_232C0F550();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_232C08000, v11, v12, "Initializing ControlCenterModule", v13, 2u);
    MEMORY[0x2349275C8](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  objc_msgSend(v14, sel_bootstrap);

  type metadata accessor for LockStateHandler();
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = -1;
  *(_QWORD *)(v15 + 32) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v15 + 32) = &off_2503FC788;
  swift_unknownObjectWeakAssign();
  v16 = (char *)v10;
  sub_232C0E890();

  *(_QWORD *)&v16[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState] = v15;
  swift_release();
  v17 = sub_232C0F520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  sub_232C0AC28((uint64_t)v5, (uint64_t)&unk_255FF5728, (uint64_t)v18);
  swift_release();
  return v16;
}

uint64_t sub_232C0AAE4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234927568]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_232C0AB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_232C0AB3C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  sub_232C0F484();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4F350];
  *(_QWORD *)(v0 + 24) = sub_232C0F46C();
  *(_QWORD *)(v0 + 32) = sub_232C0E6F8(&qword_255FF58B8, v2, (uint64_t (*)(uint64_t))type metadata accessor for ControlCenterModule, (uint64_t)&protocol conformance descriptor for ControlCenterModule);
  sub_232C0E6F8((unint64_t *)&unk_255FF58C0, 255, v1, MEMORY[0x24BE4F358]);
  sub_232C0F4F0();
  return swift_task_switch();
}

uint64_t sub_232C0ABEC()
{
  uint64_t v0;

  sub_232C0F478();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232C0AC28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_232C0F520();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_232C0F514();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_232C0E7BC(a1, &qword_255FF56F0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_232C0F4F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t ControlCenterModule.moduleDescription.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_232C0F4B4();
  v1 = (id)HULocalizedString();

  v2 = sub_232C0F4C0();
  return v2;
}

uint64_t ControlCenterModule.supportedGridSizeClasses.getter()
{
  return 21;
}

uint64_t ControlCenterModule.expandsGridSizeClassesForAccessibility.getter()
{
  return 1;
}

id ControlCenterModule.setContentModuleContext(_:)(void *a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context) = a1;

  return a1;
}

id ControlCenterModule.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *ControlCenterModule.contentModuleContext.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  v2 = v1;
  return v1;
}

void ControlCenterModule.controlCenterModuleViewController(_:moduleWillAppear:)()
{
  id v0;

  sub_232C0B090();
  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  objc_msgSend(v0, sel_enterModuleViewWillAppear);

}

uint64_t sub_232C0B090()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  _QWORD *v10;
  NSObject *v11;
  uint8_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;

  v1 = sub_232C0F3C4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232C0F3AC();
  v5 = v0;
  v6 = sub_232C0F3B8();
  v7 = sub_232C0F550();
  if (os_log_type_enabled(v6, v7))
  {
    v18 = v1;
    v8 = swift_slowAlloc();
    v17 = v2;
    v9 = (uint8_t *)v8;
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v19 = v5;
    v11 = v5;
    sub_232C0F598();
    *v10 = v5;

    v1 = v18;
    _os_log_impl(&dword_232C08000, v6, v7, "%@:CharacteristicRegistration canceling scheduled characteristic deregistration", v9, 0xCu);
    sub_232C0AAE4(&qword_255FF5760);
    swift_arrayDestroy();
    MEMORY[0x2349275C8](v10, -1, -1);
    v12 = v9;
    v2 = v17;
    MEMORY[0x2349275C8](v12, -1, -1);
  }
  else
  {

    v6 = v5;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v13 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation;
  v14 = *(Class *)((char *)&v5->isa
                 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation);
  if (v14)
    objc_msgSend(v14, sel_cancel);
  *(Class *)((char *)&v5->isa + v13) = 0;
  return swift_unknownObjectRelease();
}

void ControlCenterModule.controlCenterModuleViewController(_:didChangeDisplayedItems:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  _QWORD v22[5];

  v3 = v2;
  v6 = sub_232C0AAE4(&qword_255FF56F0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a1, sel_itemManager);
  v21 = objc_msgSend(v9, sel_home);

  if (v21)
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
    v11 = objc_msgSend(v10, sel_homeManager);

    if (v11)
    {
      sub_232C0F448();
      v22[3] = sub_232C0AAE4(&qword_255FF5730);
      v22[4] = sub_232C0E3B8();
      v22[0] = a2;
      swift_bridgeObjectRetain();
      v12 = sub_232C0F418();
      sub_232C0A7EC((uint64_t)v22);
      v13 = *(_QWORD *)(v3 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration);
      v14 = sub_232C0F520();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
      v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_232C0F3DC();
      v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4CCD8];
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_retain();
      v17 = v21;
      v18 = sub_232C0F3D0();
      v19 = sub_232C0E6F8(&qword_255FF5748, 255, v16, MEMORY[0x24BE4CCE0]);
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = v18;
      v20[3] = v19;
      v20[4] = v13;
      v20[5] = v12;
      v20[6] = a2;
      v20[7] = v15;
      v20[8] = v17;
      swift_release();
      sub_232C0AC28((uint64_t)v8, (uint64_t)&unk_255FF5750, (uint64_t)v20);
      swift_release();

      swift_release();
    }
    else
    {

    }
  }
}

uint64_t sub_232C0B564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;

  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[9] = a4;
  v9 = sub_232C0F460();
  v8[14] = v9;
  v8[15] = *(_QWORD *)(v9 - 8);
  v8[16] = swift_task_alloc();
  sub_232C0F3DC();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4CCD8];
  v8[17] = sub_232C0F3D0();
  sub_232C0E6F8(&qword_255FF5748, 255, v10, MEMORY[0x24BE4CCE0]);
  v8[18] = sub_232C0F4F0();
  v8[19] = v11;
  return swift_task_switch();
}

uint64_t sub_232C0B628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 72);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 80);
    v3 = sub_232C0F3F4();
    sub_232C0D298(v3, v2);
    LOBYTE(v2) = v4;
    swift_bridgeObjectRelease();
    if ((v2 & 1) != 0)
      goto LABEL_7;
  }
  if ((*(_QWORD *)(v0 + 80) & 0xC000000000000001) != 0 && sub_232C0F5BC() < 0)
    return sub_232C0F604();
  v7 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 112);
  sub_232C0BD18(*(_QWORD *)(v0 + 88));
  sub_232C0F454();
  sub_232C0E6F8(&qword_255FF5888, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F338], MEMORY[0x24BE4F328]);
  sub_232C0F3A0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if (v1)
  {
LABEL_7:
    swift_retain();
    swift_release();
    sub_232C0F3E8();
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 96) + 16;
    swift_beginAccess();
    v10 = MEMORY[0x234927640](v9);
    *(_QWORD *)(v0 + 160) = v10;
    if (v10)
    {
      sub_232C0F508();
      *(_QWORD *)(v0 + 168) = sub_232C0F4FC();
      sub_232C0F4F0();
      return swift_task_switch();
    }
    else
    {
      v11 = *(void **)(v0 + 104);
      v12 = *(_QWORD *)(v0 + 96) + 16;
      sub_232C0F40C();
      swift_allocObject();
      v13 = v11;
      swift_bridgeObjectRetain();
      v14 = sub_232C0F400();
      *(_QWORD *)(v0 + 208) = v14;
      swift_beginAccess();
      v15 = MEMORY[0x234927640](v12);
      if (v15)
      {
        v16 = (void *)v15;
        *(_QWORD *)(v15 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration) = v14;
        swift_retain();
        swift_release();

      }
      sub_232C0F448();
      *(_QWORD *)(v0 + 216) = sub_232C0F43C();
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 224) = v17;
      *v17 = v0;
      v17[1] = sub_232C0BC80;
      return sub_232C0F424();
    }
  }
}

uint64_t sub_232C0B948()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0[20];
  swift_release();
  v2 = *(void **)(v1 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController);
  if (v2 && (objc_opt_self(), (v3 = swift_dynamicCastObjCClass()) != 0))
  {
    v4 = (void *)v3;
    v5 = (void *)v0[20];
    v6 = v2;
    v7 = objc_msgSend(v4, sel_fullDescription);
    v8 = sub_232C0F4C0();
    v10 = v9;

    v0[22] = v8;
    v0[23] = v10;
  }
  else
  {
    v11 = (void *)v0[20];
    v0[8] = v2;
    sub_232C0AAE4(&qword_255FF5890);
    v12 = sub_232C0F58C();
    v14 = v13;

    v0[24] = v12;
    v0[25] = v14;
  }
  return swift_task_switch();
}

uint64_t sub_232C0BA40()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v1 = (void *)v0[13];
  v2 = v0[12] + 16;
  sub_232C0F40C();
  swift_allocObject();
  v3 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_232C0F400();
  v0[26] = v4;
  swift_beginAccess();
  v5 = MEMORY[0x234927640](v2);
  if (v5)
  {
    v6 = (void *)v5;
    *(_QWORD *)(v5 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration) = v4;
    swift_retain();
    swift_release();

  }
  sub_232C0F448();
  v0[27] = sub_232C0F43C();
  v7 = (_QWORD *)swift_task_alloc();
  v0[28] = v7;
  *v7 = v0;
  v7[1] = sub_232C0BC80;
  return sub_232C0F424();
}

uint64_t sub_232C0BB60()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v1 = (void *)v0[13];
  v2 = v0[12] + 16;
  sub_232C0F40C();
  swift_allocObject();
  v3 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_232C0F400();
  v0[26] = v4;
  swift_beginAccess();
  v5 = MEMORY[0x234927640](v2);
  if (v5)
  {
    v6 = (void *)v5;
    *(_QWORD *)(v5 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration) = v4;
    swift_retain();
    swift_release();

  }
  sub_232C0F448();
  v0[27] = sub_232C0F43C();
  v7 = (_QWORD *)swift_task_alloc();
  v0[28] = v7;
  *v7 = v0;
  v7[1] = sub_232C0BC80;
  return sub_232C0F424();
}

uint64_t sub_232C0BC80()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_232C0BCD4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_232C0BD18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_232C0F5B0();
    sub_232C0E738(0, &qword_255FF5860);
    sub_232C0E5B4();
    sub_232C0F538();
    v1 = v18;
    v17 = v19;
    v2 = v20;
    v3 = v21;
    v4 = v22;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v17 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    v12 = v3;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!sub_232C0F5D4())
      goto LABEL_31;
    sub_232C0E738(0, &qword_255FF5860);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v10 = v23;
    swift_unknownObjectRelease();
    if (!v23)
      goto LABEL_31;
LABEL_10:
    objc_opt_self();
    v11 = swift_dynamicCastObjCClass();

    if (v11)
      goto LABEL_31;
  }
  if (v4)
  {
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v9 = v8 | (v3 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v10)
      goto LABEL_31;
    goto LABEL_10;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16)
      goto LABEL_31;
    v14 = *(_QWORD *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      v3 = v12 + 2;
      if (v12 + 2 >= v16)
        goto LABEL_31;
      v14 = *(_QWORD *)(v17 + 8 * v3);
      if (!v14)
      {
        v3 = v12 + 3;
        if (v12 + 3 >= v16)
          goto LABEL_31;
        v14 = *(_QWORD *)(v17 + 8 * v3);
        if (!v14)
        {
          v3 = v12 + 4;
          if (v12 + 4 >= v16)
            goto LABEL_31;
          v14 = *(_QWORD *)(v17 + 8 * v3);
          if (!v14)
          {
            v3 = v12 + 5;
            if (v12 + 5 >= v16)
              goto LABEL_31;
            v14 = *(_QWORD *)(v17 + 8 * v3);
            if (!v14)
            {
              v15 = v12 + 6;
              while (v16 != v15)
              {
                v14 = *(_QWORD *)(v17 + 8 * v15++);
                if (v14)
                {
                  v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_232C0E770();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v4 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t ControlCenterModule.controlCenterModuleViewController(_:moduleDidDisappear:)()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  objc_msgSend(v0, sel_exitModuleViewDidDisappear);

  return sub_232C0C0D4();
}

uint64_t sub_232C0C0D4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_232C0F3C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation;
  v7 = *(void **)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation];
  if (v7)
    objc_msgSend(v7, sel_cancel);
  sub_232C0F3AC();
  v8 = v1;
  v9 = sub_232C0F3B8();
  v10 = sub_232C0F550();
  if (os_log_type_enabled(v9, v10))
  {
    v24 = v2;
    v11 = swift_slowAlloc();
    v26 = v1;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v25 = v6;
    v23 = (_QWORD *)v13;
    *(_DWORD *)v12 = 138412290;
    aBlock[0] = v8;
    v14 = v8;
    sub_232C0F598();
    v15 = v23;
    *v23 = v8;

    v2 = v24;
    _os_log_impl(&dword_232C08000, v9, v10, "%@:CharacteristicRegistration scheduling characteristic deregistration", v12, 0xCu);
    sub_232C0AAE4(&qword_255FF5760);
    swift_arrayDestroy();
    v16 = v15;
    v6 = v25;
    MEMORY[0x2349275C8](v16, -1, -1);
    v17 = v12;
    v1 = v26;
    MEMORY[0x2349275C8](v17, -1, -1);
  }
  else
  {

    v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v18 = objc_msgSend((id)objc_opt_self(), sel_mainThreadScheduler);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_232C0E64C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232C0CAC0;
  aBlock[3] = &unk_2503FC798;
  v20 = _Block_copy(aBlock);
  swift_release();
  v21 = objc_msgSend(v18, sel_afterDelay_performBlock_, v20, 5.0);
  swift_unknownObjectRelease();
  _Block_release(v20);
  *(_QWORD *)&v1[v6] = v21;
  return swift_unknownObjectRelease();
}

uint64_t ControlCenterModule.launchHomeApp(for:)(void *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  NSObject *v20;
  _QWORD *v21;
  uint8_t *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[2];
  _QWORD *v27;
  uint8_t *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;

  v2 = v1;
  v4 = sub_232C0F3C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_232C0AAE4(&qword_255FF5758);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_232C0F370();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232C0F364();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_232C0E7BC((uint64_t)v10, &qword_255FF5758);
  v31 = v5;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  sub_232C0F3AC();
  v16 = a1;
  v17 = sub_232C0F3B8();
  v18 = sub_232C0F550();
  if (os_log_type_enabled(v17, v18))
  {
    v30 = v2;
    v19 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    v28 = v19;
    v29 = v14;
    *(_DWORD *)v19 = 138412290;
    v26[1] = v19 + 4;
    v32 = v16;
    v20 = v16;
    v14 = v29;
    sub_232C0F598();
    v21 = v27;
    *v27 = v16;

    v2 = v30;
    v22 = v28;
    _os_log_impl(&dword_232C08000, v17, v18, "Launching Home app for moduleViewController %@", v28, 0xCu);
    sub_232C0AAE4(&qword_255FF5760);
    swift_arrayDestroy();
    MEMORY[0x2349275C8](v21, -1, -1);
    MEMORY[0x2349275C8](v22, -1, -1);
  }
  else
  {

    v17 = v16;
  }

  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v4);
  v23 = *(void **)(v2 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  if (v23)
  {
    v24 = v23;
    v25 = (void *)sub_232C0F358();
    objc_msgSend(v24, sel_openURL_completionHandler_, v25, 0);

  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

BOOL ControlCenterModule.isDeviceUnlocked(for:)()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState)
      && sub_232C0EE28();
}

char *sub_232C0C7AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char *result;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = sub_232C0AAE4(&qword_255FF56F0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_232C0F3C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1 + 16;
  sub_232C0F3AC();
  swift_retain();
  v10 = sub_232C0F3B8();
  v11 = sub_232C0F550();
  if (os_log_type_enabled(v10, v11))
  {
    v23 = v5;
    v24 = v4;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    swift_beginAccess();
    v14 = MEMORY[0x234927640](a1 + 16);
    v15 = v14;
    if (v14)
      v25 = v14;
    else
      v25 = 0;
    sub_232C0F598();
    *v13 = v15;
    swift_release();
    _os_log_impl(&dword_232C08000, v10, v11, "%@:CharacteristicRegistration deregistering characteristic notifications", v12, 0xCu);
    sub_232C0AAE4(&qword_255FF5760);
    swift_arrayDestroy();
    MEMORY[0x2349275C8](v13, -1, -1);
    MEMORY[0x2349275C8](v12, -1, -1);

    v5 = v23;
    v4 = v24;
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  v16 = (char *)MEMORY[0x234927640](a1 + 16);
  if (v16)
  {
    v17 = v16;
    v18 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration;
    v19 = *(_QWORD *)&v16[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration];
    if (v19)
    {
      v20 = sub_232C0F520();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
      v21 = (_QWORD *)swift_allocObject();
      v21[2] = 0;
      v21[3] = 0;
      v21[4] = v19;
      swift_retain();
      sub_232C0AC28((uint64_t)v4, (uint64_t)&unk_255FF5880, (uint64_t)v21);
      swift_release();
      *(_QWORD *)&v17[v18] = 0;

      swift_release();
    }
    else
    {

    }
  }
  swift_beginAccess();
  result = (char *)MEMORY[0x234927640](v9);
  if (result)
  {
    *(_QWORD *)&result[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation] = 0;

    return (char *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_232C0CAC0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_232C0CAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_232C0CB04()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  *(_QWORD *)(v0 + 24) = sub_232C0F448();
  sub_232C0F3DC();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4CCD8];
  *(_QWORD *)(v0 + 32) = sub_232C0F3D0();
  sub_232C0E6F8(&qword_255FF5748, 255, v1, MEMORY[0x24BE4CCE0]);
  sub_232C0F4F0();
  return swift_task_switch();
}

uint64_t sub_232C0CBA0()
{
  uint64_t v0;
  _QWORD *v1;

  swift_release();
  *(_QWORD *)(v0 + 40) = sub_232C0F43C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_232C0CC04;
  return sub_232C0F430();
}

uint64_t sub_232C0CC04()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ControlCenterModule.configuration.getter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = swift_getObjectType();
  v3 = sub_232C0F3C4();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_232C0CCC0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(*(_QWORD *)(v0 + 40)
                + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController);
  *(_QWORD *)(v0 + 80) = v1;
  if (v1 && (objc_opt_self(), v2 = swift_dynamicCastObjCClass(), (*(_QWORD *)(v0 + 88) = v2) != 0))
  {
    *(_QWORD *)(v0 + 96) = sub_232C0F508();
    v3 = v1;
    *(_QWORD *)(v0 + 104) = sub_232C0F4FC();
    sub_232C0F4F0();
    return swift_task_switch();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 32);
    v6 = sub_232C0F4A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232C0CDB0()
{
  _QWORD *v0;
  void *v1;
  void *v2;

  v1 = (void *)v0[10];
  v2 = (void *)v0[11];
  swift_release();
  v0[14] = objc_msgSend(v2, sel_itemManager);

  return swift_task_switch();
}

uint64_t sub_232C0CE10()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 112);
  sub_232C0F49C();
  v2 = swift_dynamicCastClass();
  *(_QWORD *)(v0 + 120) = v2;
  if (v2)
  {
    v3 = v1;
    *(_QWORD *)(v0 + 128) = sub_232C0F4FC();
    sub_232C0F4F0();
    return swift_task_switch();
  }
  else
  {
    sub_232C0F3AC();
    v5 = v1;
    v6 = sub_232C0F3B8();
    v7 = sub_232C0F544();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(void **)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 72);
    v11 = *(void **)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 56);
    v13 = *(_QWORD *)(v0 + 64);
    if (v8)
    {
      v24 = *(_QWORD *)(v0 + 72);
      v23 = *(void **)(v0 + 80);
      v14 = swift_slowAlloc();
      v22 = v13;
      v15 = (_QWORD *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v25 = v21;
      *(_DWORD *)v14 = 136315394;
      v16 = sub_232C0F628();
      *(_QWORD *)(v0 + 16) = sub_232C0D7AC(v16, v17, &v25);
      sub_232C0F598();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2112;
      *(_QWORD *)(v0 + 24) = v9;
      v18 = v9;
      sub_232C0F598();
      *v15 = v9;

      _os_log_impl(&dword_232C08000, v6, v7, "%s: Failed to unwrap item manager to ControlCenterModuleItemManager: %@", (uint8_t *)v14, 0x16u);
      sub_232C0AAE4(&qword_255FF5760);
      swift_arrayDestroy();
      MEMORY[0x2349275C8](v15, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2349275C8](v21, -1, -1);
      MEMORY[0x2349275C8](v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v12);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
    }
    v19 = *(_QWORD *)(v0 + 32);
    v20 = sub_232C0F4A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_232C0D100()
{
  swift_release();
  sub_232C0F490();
  return swift_task_switch();
}

uint64_t sub_232C0D148()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 112);
  v2 = *(void **)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 32);

  v4 = sub_232C0F4A8();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232C0D1BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_232C0E88C;
  return ControlCenterModule.configuration.getter(a1);
}

uint64_t sub_232C0D20C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_232C0D238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_232C0E88C;
  v3[2] = v2;
  return swift_task_switch();
}

void sub_232C0D298(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_232C0F5C8();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_232C0D5AC(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v27 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(a1 + 56);
  sub_232C0E738(0, &qword_255FF5898);
  v11 = 0;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v12 = a2 + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_39;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v28)
        return;
      v16 = *(_QWORD *)(v27 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v28)
          return;
        v16 = *(_QWORD *)(v27 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v28)
            return;
          v16 = *(_QWORD *)(v27 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_38:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_39:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v19 = sub_232C0F574();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_46;
    v29 = v11;
    v22 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
    v23 = sub_232C0F580();

    if ((v23 & 1) == 0)
    {
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
        v26 = sub_232C0F580();

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
LABEL_46:

      return;
    }
LABEL_20:

    v11 = v29;
  }
  v17 = v15 + 4;
  if (v17 >= v28)
    return;
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_38;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_38;
  }
LABEL_49:
  __break(1u);
}

void sub_232C0D5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_232C0F5BC())
    return;
  v4 = 0;
  v5 = a2 + 56;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_6:
    v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v11);
    v13 = sub_232C0F5E0();

    if ((v13 & 1) == 0)
      return;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v4;
  if (v15)
    goto LABEL_19;
  v4 = v14 + 1;
  if (v14 + 1 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  v16 = v14 + 2;
  if (v16 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      return;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_232C0D6FC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_232C0D760;
  return v6(a1);
}

uint64_t sub_232C0D760()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_232C0D7AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_232C0D87C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_232C0E60C((uint64_t)v12, *a3);
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
      sub_232C0E60C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_232C0A7EC((uint64_t)v12);
  return v7;
}

uint64_t sub_232C0D87C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_232C0F5A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_232C0DA34(a5, a6);
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
  v8 = sub_232C0F5F8();
  if (!v8)
  {
    sub_232C0F604();
    __break(1u);
LABEL_17:
    result = sub_232C0F61C();
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

uint64_t sub_232C0DA34(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_232C0DAC8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_232C0DCA0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_232C0DCA0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_232C0DAC8(uint64_t a1, unint64_t a2)
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
      v3 = sub_232C0DC3C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_232C0F5EC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_232C0F604();
      __break(1u);
LABEL_10:
      v2 = sub_232C0F4CC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_232C0F61C();
    __break(1u);
LABEL_14:
    result = sub_232C0F604();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_232C0DC3C(uint64_t a1, uint64_t a2)
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
  sub_232C0AAE4(&qword_255FF5870);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_232C0DCA0(char a1, int64_t a2, char a3, char *a4)
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
    sub_232C0AAE4(&qword_255FF5870);
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
  result = sub_232C0F61C();
  __break(1u);
  return result;
}

uint64_t _s33HomeControlCenterSingleTileModule0bcF0C21contentViewController3forSo011CCUIContentf7ContenthI0_So06UIViewI0CXcSo0kF19PresentationContextCSg_tF_0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t result;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53[2];

  v1 = v0;
  v53[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  v2 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController;
  v3 = *(void **)&v0[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController];
  if (v3)
  {
    v4 = *(id *)&v0[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController];
LABEL_10:
    v43 = v3;
    return (uint64_t)v4;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = objc_allocWithZone(MEMORY[0x24BDF6718]);
  v8 = (void *)sub_232C0F4B4();
  v9 = objc_msgSend(v7, sel_initWithName_bundle_, v8, v6);

  if (v9)
  {
    v51 = v9;
    v52 = v2;
    v10 = objc_msgSend(v9, sel_data);
    v11 = sub_232C0F388();
    v13 = v12;

    sub_232C0F4C0();
    v14 = (void *)sub_232C0F37C();
    v15 = (void *)sub_232C0F4B4();
    swift_bridgeObjectRelease();
    v53[0] = 0;
    v16 = objc_msgSend((id)objc_opt_self(), sel_packageWithData_type_options_error_, v14, v15, 0, v53);

    if (v16)
    {
      v17 = v53[0];
      sub_232C0E778(v11, v13);
      v18 = (void *)objc_opt_self();
      v48 = objc_msgSend(v18, sel_previewWithPackage_forGridSize_, v16, 1, 2);
      v50 = v16;
      v47 = objc_msgSend(v18, sel_previewWithPackage_forGridSize_, v16, 1, 4);
      v19 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_scale_, 6, 2, 25.0);
      sub_232C0F4C0();
      v20 = objc_allocWithZone(MEMORY[0x24BE4D0B8]);
      v21 = v19;
      v22 = (void *)sub_232C0F4B4();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v20, sel_initWithSystemImageNamed_configuration_, v22, v21);

      v49 = v21;
      v24 = (void *)objc_opt_self();
      v25 = objc_msgSend(v24, sel_systemWhiteColor);
      v26 = (void *)sub_232C0F4B4();
      v27 = (id)HULocalizedString();

      if (!v27)
      {
        sub_232C0F4C0();
        v27 = (id)sub_232C0F4B4();
        swift_bridgeObjectRelease();
      }
      v28 = objc_msgSend(v18, sel_previewWithTemplate_tintColor_title_subtitle_forGridSize_, v23, v25, v27, 0, 2, 2);

      v29 = objc_msgSend(v24, sel_systemWhiteColor);
      v30 = (void *)sub_232C0F4B4();
      v31 = (id)HULocalizedString();

      if (!v31)
      {
        sub_232C0F4C0();
        v31 = (id)sub_232C0F4B4();
        swift_bridgeObjectRelease();
      }
      v32 = objc_msgSend(v18, sel_previewWithTemplate_tintColor_title_subtitle_forGridSize_, v23, v29, v31, 0, 2, 4);

      sub_232C0AAE4(&qword_255FF58A0);
      v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = xmmword_232C0FAE0;
      *(_QWORD *)(v33 + 32) = v48;
      *(_QWORD *)(v33 + 40) = v47;
      *(_QWORD *)(v33 + 48) = v28;
      *(_QWORD *)(v33 + 56) = v32;
      v53[0] = (id)v33;
      sub_232C0F4E4();
      v34 = objc_allocWithZone(MEMORY[0x24BE4F440]);
      sub_232C0F568();
      v35 = v48;
      v36 = v47;
      v37 = v28;
      v38 = v32;
      v39 = v1;
      v40 = (void *)sub_232C0F4D8();
      swift_bridgeObjectRelease();
      v41 = objc_msgSend(v34, sel_initWithDelegate_ofKind_withPreviews_, v39, 1, v40);

      v42 = *(void **)&v1[v52];
      *(_QWORD *)&v1[v52] = v41;
      v4 = v41;

      v3 = 0;
      goto LABEL_10;
    }
    v45 = v53[0];
    v46 = (void *)sub_232C0F34C();

    swift_willThrow();
    sub_232C0E778(v11, v13);

  }
  result = sub_232C0F610();
  __break(1u);
  return result;
}

unint64_t sub_232C0E3B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255FF5738;
  if (!qword_255FF5738)
  {
    v1 = sub_232C0E404(&qword_255FF5730);
    result = MEMORY[0x234927580](MEMORY[0x24BEE1728], v1);
    atomic_store(result, &qword_255FF5738);
  }
  return result;
}

uint64_t sub_232C0E404(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234927574](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_232C0E448()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_232C0E46C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_232C0E4B8(uint64_t a1)
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
  v11[1] = sub_232C0E54C;
  return sub_232C0B564(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_232C0E54C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for ControlCenterModule()
{
  return objc_opt_self();
}

unint64_t sub_232C0E5B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255FF5868;
  if (!qword_255FF5868)
  {
    v1 = sub_232C0E738(255, &qword_255FF5860);
    result = MEMORY[0x234927580](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255FF5868);
  }
  return result;
}

uint64_t sub_232C0E60C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_232C0E64C()
{
  uint64_t v0;

  return sub_232C0C7AC(v0);
}

uint64_t sub_232C0E654(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_232C0E664()
{
  return swift_release();
}

uint64_t sub_232C0E66C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_232C0E698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_232C0E88C;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_232C0E6F8(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x234927580](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_232C0E738(uint64_t a1, unint64_t *a2)
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

uint64_t sub_232C0E770()
{
  return swift_release();
}

uint64_t sub_232C0E778(uint64_t a1, unint64_t a2)
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

uint64_t sub_232C0E7BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_232C0AAE4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_232C0E7F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_232C0E81C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_232C0E54C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255FF58A8 + dword_255FF58A8))(a1, v4);
}

void sub_232C0E890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  int *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_232C0F3C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232C0F3AC();
  v6 = sub_232C0F3B8();
  v7 = sub_232C0F550();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_232C08000, v6, v7, "Registering for lock state notifications", v8, 2u);
    MEMORY[0x2349275C8](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = (int *)(v1 + 16);
  swift_beginAccess();
  if (*(_DWORD *)(v1 + 16) == -1)
  {
    v10 = (const char *)*MEMORY[0x24BE67240];
    sub_232C0EFFC();
    v11 = sub_232C0F55C();
    v12 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_232C0F05C;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_232C0EDEC;
    aBlock[3] = &unk_2503FC850;
    v13 = _Block_copy(aBlock);
    swift_release();
    swift_beginAccess();
    notify_register_dispatch(v10, v9, v11, v13);
    swift_endAccess();
    _Block_release(v13);

  }
}

uint64_t sub_232C0EA78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  int v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_232C0F3C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 32) = 0;
  swift_unknownObjectWeakAssign();
  sub_232C0F3AC();
  v6 = sub_232C0F3B8();
  v7 = sub_232C0F550();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_232C08000, v6, v7, "Unregistering lock state notifications", v8, 2u);
    MEMORY[0x2349275C8](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  v9 = *(_DWORD *)(v1 + 16);
  if (v9 != -1)
  {
    notify_cancel(v9);
    *(_DWORD *)(v1 + 16) = -1;
  }
  sub_232C0EBEC(v1 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LockStateHandler()
{
  return objc_opt_self();
}

uint64_t sub_232C0EBEC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_232C0EC10()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_232C0EC64();
    return swift_release();
  }
  return result;
}

uint64_t sub_232C0EC64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  BOOL v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  void *v11;
  _DWORD v12[4];

  v1 = v0;
  v2 = sub_232C0F3C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_232C0F07C();
  sub_232C0F3AC();
  v7 = sub_232C0F3B8();
  v8 = sub_232C0F550();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v12[3] = v6;
    sub_232C0F598();
    _os_log_impl(&dword_232C08000, v7, v8, "Access allowed for current lock state is %{BOOL}d, updating delegate", v9, 8u);
    MEMORY[0x2349275C8](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  result = MEMORY[0x234927640](v1 + 24);
  if (result)
  {
    if (*(_QWORD *)(result + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController))
    {
      objc_opt_self();
      v11 = (void *)swift_dynamicCastObjCClass();
      if (v11)
        objc_msgSend(v11, sel_setAccessAllowedForCurrentLockState_, v6);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_232C0EDEC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

BOOL sub_232C0EE28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void (*v10)(char *, uint64_t);
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _DWORD v17[4];

  v0 = sub_232C0F3C4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v17 - v5;
  sub_232C0F3AC();
  v7 = sub_232C0F3B8();
  v8 = sub_232C0F550();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_232C08000, v7, v8, "Checking if device is unlocked", v9, 2u);
    MEMORY[0x2349275C8](v9, -1, -1);
  }

  v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v6, v0);
  v11 = MKBGetDeviceLockState();
  sub_232C0F3AC();
  v12 = sub_232C0F3B8();
  v13 = sub_232C0F550();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v14 = 67109120;
    v17[3] = v11;
    sub_232C0F598();
    _os_log_impl(&dword_232C08000, v12, v13, "Lock state is %d", v14, 8u);
    MEMORY[0x2349275C8](v14, -1, -1);
  }

  v10(v4, v0);
  return !v11 || v11 == 3;
}

unint64_t sub_232C0EFFC()
{
  unint64_t result;

  result = qword_255FF5978;
  if (!qword_255FF5978)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255FF5978);
  }
  return result;
}

uint64_t sub_232C0F038()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_232C0F05C()
{
  return sub_232C0EC10();
}

uint64_t sub_232C0F064(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_232C0F074()
{
  return swift_release();
}

BOOL sub_232C0F07C()
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
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void (*v13)(char *, uint64_t);
  id v14;
  id v15;
  unsigned int v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v25;

  v0 = sub_232C0F3C4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v25 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - v8;
  sub_232C0F3AC();
  v10 = sub_232C0F3B8();
  v11 = sub_232C0F550();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_232C08000, v10, v11, "Checking if access is allowed for current lock state", v12, 2u);
    MEMORY[0x2349275C8](v12, -1, -1);
  }

  v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v9, v0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v15 = objc_msgSend(v14, sel_homeManager);

  if (v15 && (v16 = objc_msgSend(v15, sel_isAccessAllowedWhenLocked), v15, v16))
  {
    sub_232C0F3AC();
    v17 = sub_232C0F3B8();
    v18 = sub_232C0F550();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_232C08000, v17, v18, "Home manager doesn't care about lock state, returning YES", v19, 2u);
      MEMORY[0x2349275C8](v19, -1, -1);
    }

    v13(v7, v0);
    return 1;
  }
  else
  {
    sub_232C0F3AC();
    v21 = sub_232C0F3B8();
    v22 = sub_232C0F550();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_232C08000, v21, v22, "Home manager does care, checking lock state", v23, 2u);
      MEMORY[0x2349275C8](v23, -1, -1);
    }

    v13(v4, v0);
    return sub_232C0EE28();
  }
}

uint64_t sub_232C0F31C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_232C0F34C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_232C0F358()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_232C0F364()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_232C0F370()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_232C0F37C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_232C0F388()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_232C0F394()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_232C0F3A0()
{
  return MEMORY[0x24BE4DC80]();
}

uint64_t sub_232C0F3AC()
{
  return MEMORY[0x24BE4F320]();
}

uint64_t sub_232C0F3B8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_232C0F3C4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_232C0F3D0()
{
  return MEMORY[0x24BE4CCD0]();
}

uint64_t sub_232C0F3DC()
{
  return MEMORY[0x24BE4CCD8]();
}

uint64_t sub_232C0F3E8()
{
  return MEMORY[0x24BE4CCE8]();
}

uint64_t sub_232C0F3F4()
{
  return MEMORY[0x24BE4CCF0]();
}

uint64_t sub_232C0F400()
{
  return MEMORY[0x24BE4CCF8]();
}

uint64_t sub_232C0F40C()
{
  return MEMORY[0x24BE4CD08]();
}

uint64_t sub_232C0F418()
{
  return MEMORY[0x24BE4CD18]();
}

uint64_t sub_232C0F424()
{
  return MEMORY[0x24BE4CD20]();
}

uint64_t sub_232C0F430()
{
  return MEMORY[0x24BE4CD30]();
}

uint64_t sub_232C0F43C()
{
  return MEMORY[0x24BE4CD40]();
}

uint64_t sub_232C0F448()
{
  return MEMORY[0x24BE4CD48]();
}

uint64_t sub_232C0F454()
{
  return MEMORY[0x24BE4F330]();
}

uint64_t sub_232C0F460()
{
  return MEMORY[0x24BE4F338]();
}

uint64_t sub_232C0F46C()
{
  return MEMORY[0x24BE4F340]();
}

uint64_t sub_232C0F478()
{
  return MEMORY[0x24BE4F348]();
}

uint64_t sub_232C0F484()
{
  return MEMORY[0x24BE4F350]();
}

uint64_t sub_232C0F490()
{
  return MEMORY[0x24BE4F360]();
}

uint64_t sub_232C0F49C()
{
  return MEMORY[0x24BE4F368]();
}

uint64_t sub_232C0F4A8()
{
  return MEMORY[0x24BE4F370]();
}

uint64_t sub_232C0F4B4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_232C0F4C0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_232C0F4CC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_232C0F4D8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_232C0F4E4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_232C0F4F0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_232C0F4FC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_232C0F508()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_232C0F514()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_232C0F520()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_232C0F52C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_232C0F538()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_232C0F544()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_232C0F550()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_232C0F55C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_232C0F568()
{
  return MEMORY[0x24BE4F3B0]();
}

uint64_t sub_232C0F574()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_232C0F580()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_232C0F58C()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_232C0F598()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_232C0F5A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_232C0F5B0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_232C0F5BC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_232C0F5C8()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_232C0F5D4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_232C0F5E0()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_232C0F5EC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_232C0F5F8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_232C0F604()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_232C0F610()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_232C0F61C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_232C0F628()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t HULocalizedString()
{
  return MEMORY[0x24BE4F3F0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

