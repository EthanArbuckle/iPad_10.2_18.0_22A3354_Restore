uint64_t sub_1B8FF1CC0()
{
  swift_beginAccess();
  return sub_1B93ECF74();
}

uint64_t sub_1B8FF1D08(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  __int128 v13;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig);
  swift_beginAccess();
  v3[1] = a1;
  result = swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
  if (v5)
  {
    v6 = *v3;
    v7 = v3[1];
    v8 = *((_BYTE *)v3 + 16);
    v13 = *(_OWORD *)(v3 + 3);
    v9 = v3[5];
    v10 = *((_BYTE *)v3 + 48);
    v11 = *((_BYTE *)v3 + 49);
    v12 = v5 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
    swift_beginAccess();
    *(_QWORD *)v12 = v6;
    *(_QWORD *)(v12 + 8) = v7;
    *(_BYTE *)(v12 + 16) = v8;
    *(_OWORD *)(v12 + 24) = v13;
    *(_QWORD *)(v12 + 40) = v9;
    *(_BYTE *)(v12 + 48) = v10;
    *(_BYTE *)(v12 + 49) = v11;
    sub_1B93ECF74();
    sub_1B93ECF74();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void (*sub_1B8FF1E08(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  v3[10] = v1;
  v3[11] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[9] = *(_QWORD *)(v5 + 8);
  sub_1B93ECF74();
  return sub_1B8FF1E7C;
}

void sub_1B8FF1E7C(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;

  v2 = *(_QWORD **)a1;
  *(_QWORD *)(v2[10] + v2[11] + 8) = *(_QWORD *)(*(_QWORD *)a1 + 72);
  v3 = v2[10];
  if ((a2 & 1) != 0)
  {
    sub_1B93ECF74();
    swift_bridgeObjectRelease();
    v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
    if (v4)
    {
      v5 = (uint64_t *)(v2[10] + v2[11]);
      v6 = *v5;
      v7 = v5[1];
      v8 = *((_BYTE *)v5 + 16);
      v22 = *(_OWORD *)(v5 + 3);
      v9 = v5[5];
      v10 = *((_BYTE *)v5 + 48);
      v21 = *((_BYTE *)v5 + 49);
      v11 = v4 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
      swift_beginAccess();
      *(_QWORD *)v11 = v6;
      *(_QWORD *)(v11 + 8) = v7;
      *(_BYTE *)(v11 + 16) = v8;
      *(_OWORD *)(v11 + 24) = v22;
      *(_QWORD *)(v11 + 40) = v9;
      *(_BYTE *)(v11 + 48) = v10;
      *(_BYTE *)(v11 + 49) = v21;
      sub_1B93ECF74();
      sub_1B93ECF74();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v3 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
  if (v12)
  {
    v13 = (uint64_t *)(v2[10] + v2[11]);
    v14 = *v13;
    v15 = v13[1];
    v16 = *((_BYTE *)v13 + 16);
    v23 = *(_OWORD *)(v13 + 3);
    v17 = v13[5];
    v18 = *((_BYTE *)v13 + 48);
    v19 = *((_BYTE *)v13 + 49);
    v20 = v12 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
    swift_beginAccess();
    *(_QWORD *)v20 = v14;
    *(_QWORD *)(v20 + 8) = v15;
    *(_BYTE *)(v20 + 16) = v16;
    *(_OWORD *)(v20 + 24) = v23;
    *(_QWORD *)(v20 + 40) = v17;
    *(_BYTE *)(v20 + 48) = v18;
    *(_BYTE *)(v20 + 49) = v19;
    sub_1B93ECF74();
    sub_1B93ECF74();
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
  }
  free(v2);
}

uint64_t sub_1B8FF2038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;

  v4 = v3;
  v7 = v4 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BCCC1DA8](v7))
  {
    v8 = *(_QWORD *)(v7 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(v4, a2, a3, ObjectType, v8);
    swift_unknownObjectRelease();
  }
  type metadata accessor for ActionSetDeviceDataModel();
  sub_1B8F9AAD0();
  sub_1B93ED130();
  sub_1B93ED13C();
  return swift_release();
}

void sub_1B8FF210C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  unint64_t v6;
  uint64_t v7;
  __int128 v8[2];
  _QWORD v9[4];

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
  if (v1)
  {
    v2 = v0;
    sub_1B8E2D0BC(v1 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer, (uint64_t)v8);
    sub_1B8E35A58(v8, (uint64_t)v9);
    v3 = v0 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate;
    swift_beginAccess();
    if (MEMORY[0x1BCCC1DA8](v3))
    {
      v4 = *(_QWORD *)(v3 + 8);
      ObjectType = swift_getObjectType();
      __swift_project_boxed_opaque_existential_1(v9, v9[3]);
      v6 = sub_1B93EC9B0();
      v7 = sub_1B8E937A4(v6);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))(v4 + 8))(v2, v7, v9, ObjectType, v4);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
}

uint64_t sub_1B8FF2224@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;

  v3 = *a1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_BYTE *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 40);
  v7 = *(_BYTE *)(v3 + 48);
  v8 = *(_BYTE *)(v3 + 49);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(v3 + 24);
  *(_QWORD *)(a2 + 40) = v6;
  *(_BYTE *)(a2 + 48) = v7;
  *(_BYTE *)(a2 + 49) = v8;
  sub_1B93ECF74();
  return sub_1B93ECF74();
}

uint64_t sub_1B8FF22B0(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v7[2];
  char v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  char v12;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_BYTE *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  v5 = *(_BYTE *)(a1 + 49);
  v7[0] = *(_QWORD *)a1;
  v7[1] = v1;
  v8 = v2;
  v9 = *(_OWORD *)(a1 + 24);
  v10 = v3;
  v11 = v4;
  v12 = v5;
  sub_1B93ECF74();
  sub_1B93ECF74();
  return sub_1B8FF1424(v7);
}

void sub_1B8FF24B8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;
  id v7;

  v5 = a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF20F1C0);
    v5 = sub_1B93EDF4C();
  }
  v7 = a1;
  a4(v5);

}

id ActionGridViewController.__allocating_init(actionBuilderContainer:home:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a1, v6);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v11, v9);
  v13 = sub_1B8FF3D1C((uint64_t)v11, a2, v5, v6, v7);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v13;
}

id ActionGridViewController.init(actionBuilderContainer:home:)(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v10, v8);
  v12 = sub_1B8FF3D1C((uint64_t)v10, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v12;
}

id sub_1B8FF2690(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, a1);
}

uint64_t sub_1B8FF26CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  _BYTE v34[48];

  v6 = a4 + 16;
  sub_1B8E2D0BC(a3, (uint64_t)v34);
  v7 = (char *)objc_allocWithZone((Class)type metadata accessor for ActionGridItemModule());
  v8 = &v7[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = 1;
  v8[16] = 1;
  *(_OWORD *)(v8 + 24) = xmmword_1B943DF30;
  *((_QWORD *)v8 + 5) = 0;
  *((_WORD *)v8 + 24) = 1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_1B8E2D0BC((uint64_t)v34, (uint64_t)&v7[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer]);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v7[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType] = 1;
  swift_unknownObjectWeakAssign();
  v10 = &v7[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_itemProviderBlock];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v33.receiver = v7;
  v33.super_class = (Class)type metadata accessor for AccessoryItemModule();
  v11 = a1;
  swift_unknownObjectRetain();
  v12 = (char *)objc_msgSendSuper2(&v33, sel_initWithItemUpdater_, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);

  swift_unknownObjectRelease();
  swift_beginAccess();
  v31 = v6;
  v13 = MEMORY[0x1BCCC1DA8](v6);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = v12;
    v16 = v13 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
    swift_beginAccess();
    v17 = *(_QWORD *)v16;
    v18 = *(_QWORD *)(v16 + 8);
    v19 = *(_BYTE *)(v16 + 16);
    v9 = *(_QWORD *)(v16 + 24);
    v20 = *(_QWORD *)(v16 + 32);
    v30 = *(_QWORD *)(v16 + 40);
    v21 = *(_BYTE *)(v16 + 48);
    v22 = *(_BYTE *)(v16 + 49);
    v12 = v15;
    sub_1B93ECF74();
    sub_1B93ECF74();

  }
  else
  {
    v17 = 0;
    v18 = 0;
    v30 = 0;
    v22 = 0;
    v20 = 15;
    v19 = 1;
    v21 = 1;
  }
  v23 = &v12[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config];
  swift_beginAccess();
  *(_QWORD *)v23 = v17;
  *((_QWORD *)v23 + 1) = v18;
  v23[16] = v19;
  *((_QWORD *)v23 + 3) = v9;
  *((_QWORD *)v23 + 4) = v20;
  *((_QWORD *)v23 + 5) = v30;
  v23[48] = v21;
  v23[49] = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v24 = MEMORY[0x1BCCC1DA8](v31);
  if (v24)
  {
    v25 = (void *)v24;
    v26 = *(void **)(v24 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
    *(_QWORD *)(v24 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule) = v12;
    v27 = v12;

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v28 + 32) = v12;
  v32 = v28;
  sub_1B93EDF64();
  return v32;
}

id sub_1B8FF2998(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;

  type metadata accessor for ActionGridItemModule();
  v3 = swift_dynamicCastClass();
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_allocWithZone((Class)type metadata accessor for ActionGridItemModuleController());
  v6 = a1;
  v7 = (char *)objc_msgSend(v5, sel_initWithModule_, v4);
  v8 = &v7[OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController_delegate];
  swift_beginAccess();
  *((_QWORD *)v8 + 1) = &protocol witness table for ActionGridViewController;
  swift_unknownObjectWeakAssign();
  v9 = *(void **)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController) = v7;
  v10 = v7;

  v11 = objc_msgSend(v10, sel_asGeneric);
  return v11;
}

__CFString *sub_1B8FF2AE4(void *a1, uint64_t a2, double a3, double a4)
{
  char *v4;
  char *v5;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  __CFString *v21;
  void *v22;
  objc_class *v23;
  objc_super v25;

  v5 = v4;
  v10 = sub_1B93EB900();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)&v5[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController];
  if (!v15)
    goto LABEL_7;
  objc_opt_self();
  v16 = swift_dynamicCastObjCClass();
  if (!v16)
    goto LABEL_7;
  v17 = (void *)v16;
  v18 = v15;
  v19 = a1;
  v20 = objc_msgSend(v17, sel_containingItem);
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {

LABEL_7:
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))(v14, a2, v10, v12);
LABEL_8:
    v22 = (void *)sub_1B93EB8B8();
    v23 = (objc_class *)type metadata accessor for ActionGridViewController();
    v25.receiver = v5;
    v25.super_class = v23;
    v21 = (__CFString *)objc_msgSendSuper2(&v25, sel_tappableAreaForPoint_inItem_atIndexPath_, a1, v22, a3, a4);

    goto LABEL_9;
  }

  v21 = CFSTR("HUTileCellTappableAreaGeneralToggleArea");
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a2, v10);
  if (!v21)
    goto LABEL_8;
LABEL_9:
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return v21;
}

uint64_t sub_1B8FF2EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_1B93EE06C();
  v4[6] = sub_1B93EE060();
  sub_1B93EE018();
  return swift_task_switch();
}

uint64_t sub_1B8FF2F18()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t (*v10)(_QWORD);

  v1 = (void *)v0[5];
  v3 = (void *)v0[3];
  v2 = (const void *)v0[4];
  v4 = (void *)v0[2];
  swift_release();
  v0[7] = _Block_copy(v2);
  v10 = (uint64_t (*)(_QWORD))((char *)&dword_1EF2104F8 + dword_1EF2104F8);
  v5 = v4;
  v6 = v3;
  v7 = v1;
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  *v8 = v0;
  v8[1] = sub_1B8F6C1C0;
  return v10(v0[2]);
}

uint64_t sub_1B8FF2FB4(void *a1)
{
  char *v1;
  char *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v2 = v1;
  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for ActionGridViewController();
  objc_msgSendSuper2(&v11, sel_configureWithAccessoryControlViewController_, a1);
  if ((objc_msgSend((id)objc_opt_self(), sel_isAMac) & 1) == 0)
  {
    objc_msgSend(a1, sel_setModalPresentationStyle_, 2);
    objc_msgSend(a1, sel_setModalTransitionStyle_, objc_msgSend((id)objc_opt_self(), sel_accessoryControlsCustomTransitionStyle));
    v4 = objc_msgSend(a1, sel_presentationController);
    if (v4)
    {
      v5 = v4;
      objc_opt_self();
      v6 = (void *)swift_dynamicCastObjCClass();
      if (v6)
        objc_msgSend(v6, sel__setWantsFullScreen_, 1);

    }
  }
  v7 = OBJC_IVAR____TtC6HomeUI24ActionGridViewController_dataModelObserverCancelable;
  if (*(_QWORD *)&v2[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_dataModelObserverCancelable])
  {
    swift_retain();
    sub_1B93ED124();
    swift_release();
  }
  type metadata accessor for ActionSetDeviceDataModel();
  sub_1B8F9AAD0();
  sub_1B93ED130();
  *(_QWORD *)(swift_allocObject() + 16) = v2;
  sub_1B93ED148();
  v8 = v2;
  v9 = sub_1B93ED184();
  swift_release();
  swift_release();
  *(_QWORD *)&v2[v7] = v9;
  return swift_release();
}

void sub_1B8FF3170(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  unint64_t v7;
  uint64_t v8;
  __int128 v9[2];
  _QWORD v10[4];

  v2 = *(_QWORD *)(a2 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
  if (v2)
  {
    sub_1B8E2D0BC(v2 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer, (uint64_t)v9);
    sub_1B8E35A58(v9, (uint64_t)v10);
    v4 = a2 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate;
    swift_beginAccess();
    if (MEMORY[0x1BCCC1DA8](v4))
    {
      v5 = *(_QWORD *)(v4 + 8);
      ObjectType = swift_getObjectType();
      __swift_project_boxed_opaque_existential_1(v10, v10[3]);
      v7 = sub_1B93EC9B0();
      v8 = sub_1B8E937A4(v7);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))(v5 + 8))(a2, v8, v10, ObjectType, v5);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
}

id sub_1B8FF3450(uint64_t a1, void *a2)
{
  char *v2;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  char *v11;
  char *v12;
  objc_super v13;

  v5 = *(void **)&v2[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController];
  if (!v5)
    goto LABEL_8;
  v6 = v5;
  v7 = objc_msgSend(a2, sel_item);
  objc_opt_self();
  v8 = (void *)swift_dynamicCastObjCClass();
  if (!v8)
  {

    goto LABEL_6;
  }
  v9 = objc_msgSend(v8, sel_containingItem);
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {

LABEL_6:
    return 0;
  }

  v11 = (char *)objc_msgSend(v6, sel_module);
  v12 = &v11[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config];
  swift_beginAccess();
  LODWORD(v12) = v12[16];

  if ((_DWORD)v12 != 1)
    return 0;
LABEL_8:
  v13.receiver = v2;
  v13.super_class = (Class)type metadata accessor for ActionGridViewController();
  return objc_msgSendSuper2(&v13, sel_presentationCoordinator_shouldBeginPresentationWithContext_, a1, a2);
}

id ActionGridViewController.__allocating_init(itemManager:collectionViewLayout:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithItemManager_collectionViewLayout_, a1, a2);

  return v5;
}

void ActionGridViewController.init(itemManager:collectionViewLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActionGridViewController.__allocating_init(usingCompositionalLayoutWith:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initUsingCompositionalLayoutWithItemManager_, a1);

  return v3;
}

void ActionGridViewController.init(usingCompositionalLayoutWith:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActionGridViewController.__deallocating_deinit()
{
  return sub_1B8F0B3F0(type metadata accessor for ActionGridViewController);
}

void sub_1B8FF3900()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  char v34;
  char v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  objc_super v39;

  v1 = &v0[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig];
  swift_beginAccess();
  *((_QWORD *)v1 + 4) = 4;
  v2 = OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule;
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule];
  if (v3)
  {
    v4 = *(_QWORD *)v1;
    v5 = *((_QWORD *)v1 + 1);
    v6 = v1[16];
    v7 = *((_QWORD *)v1 + 3);
    v36 = *((_QWORD *)v1 + 5);
    v35 = v1[48];
    v34 = v1[49];
    v8 = v3 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
    swift_beginAccess();
    *(_QWORD *)v8 = v4;
    *(_QWORD *)(v8 + 8) = v5;
    *(_BYTE *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    *(_QWORD *)(v8 + 32) = 4;
    *(_QWORD *)(v8 + 40) = v36;
    *(_BYTE *)(v8 + 48) = v35;
    *(_BYTE *)(v8 + 49) = v34;
    sub_1B93ECF74();
    sub_1B93ECF74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *((_QWORD *)v1 + 5) = 2;
  v1[48] = 0;
  v9 = *(_QWORD *)&v0[v2];
  if (v9)
  {
    v10 = *(_QWORD *)v1;
    v11 = *((_QWORD *)v1 + 1);
    v12 = v1[16];
    v14 = *((_QWORD *)v1 + 3);
    v13 = *((_QWORD *)v1 + 4);
    v37 = v1[49];
    v15 = v9 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
    swift_beginAccess();
    *(_QWORD *)v15 = v10;
    *(_QWORD *)(v15 + 8) = v11;
    *(_BYTE *)(v15 + 16) = v12;
    *(_QWORD *)(v15 + 24) = v14;
    *(_QWORD *)(v15 + 32) = v13;
    *(_QWORD *)(v15 + 40) = 2;
    *(_BYTE *)(v15 + 48) = 0;
    *(_BYTE *)(v15 + 49) = v37;
    sub_1B93ECF74();
    sub_1B93ECF74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v1[49] = 1;
  v16 = *(_QWORD *)&v0[v2];
  if (v16)
  {
    v17 = *(_QWORD *)v1;
    v18 = *((_QWORD *)v1 + 1);
    v19 = v1[16];
    v38 = *(_OWORD *)(v1 + 24);
    v20 = *((_QWORD *)v1 + 5);
    v21 = v1[48];
    v22 = v16 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
    swift_beginAccess();
    *(_QWORD *)v22 = v17;
    *(_QWORD *)(v22 + 8) = v18;
    *(_BYTE *)(v22 + 16) = v19;
    *(_OWORD *)(v22 + 24) = v38;
    *(_QWORD *)(v22 + 40) = v20;
    *(_BYTE *)(v22 + 48) = v21;
    *(_BYTE *)(v22 + 49) = 1;
    sub_1B93ECF74();
    sub_1B93ECF74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v39.receiver = v0;
  v39.super_class = (Class)type metadata accessor for EmbeddedActionGridViewController();
  objc_msgSendSuper2(&v39, sel_viewDidLoad);
  v23 = objc_msgSend(v0, sel_collectionView);
  if (!v23)
  {
    __break(1u);
    goto LABEL_13;
  }
  v24 = v23;
  objc_msgSend(v23, sel__setShouldDeriveVisibleBoundsFromContainingScrollView_, 1);

  v25 = objc_msgSend(v0, sel_collectionView);
  if (!v25)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v26 = v25;
  objc_msgSend(v25, sel_setScrollEnabled_, 0);

  v27 = objc_msgSend(v0, sel_collectionView);
  if (!v27)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v28 = v27;
  v29 = (void *)objc_opt_self();
  v30 = objc_msgSend(v29, sel_clearColor);
  objc_msgSend(v28, sel_setBackgroundColor_, v30);

  v31 = objc_msgSend(v0, sel_view);
  if (v31)
  {
    v32 = v31;
    v33 = objc_msgSend(v29, sel_clearColor);
    objc_msgSend(v32, sel_setBackgroundColor_, v33);

    return;
  }
LABEL_15:
  __break(1u);
}

id EmbeddedActionGridViewController.__allocating_init(actionBuilderContainer:home:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a1, v6);
  v9 = sub_1B8FF3FE4(v8, a2, v5, v6, v7);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

id EmbeddedActionGridViewController.__deallocating_deinit()
{
  return sub_1B8F0B3F0(type metadata accessor for EmbeddedActionGridViewController);
}

id sub_1B8FF3D1C(uint64_t a1, void *a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  char *v10;
  uint64_t v11;
  id v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28[2];
  objc_super v29;
  uint64_t v30[5];

  v30[3] = a4;
  v30[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v10 = &a3[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  *(_OWORD *)(v10 + 24) = xmmword_1B943DF30;
  *((_QWORD *)v10 + 5) = 0;
  *((_WORD *)v10 + 24) = 1;
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_dataModelObserverCancelable] = 0;
  sub_1B8E2D0BC((uint64_t)v30, (uint64_t)&v23);
  type metadata accessor for ActionSetDeviceDataModel();
  v11 = swift_allocObject();
  sub_1B8E35A58(&v23, v11 + 16);
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI24ActionGridViewController_accessoryControlDataModel] = v11;
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31810]), sel_initWithDelegate_, 0);
  v13 = (objc_class *)type metadata accessor for ActionGridViewController();
  v29.receiver = a3;
  v29.super_class = v13;
  v14 = objc_msgSendSuper2(&v29, sel_initUsingCompositionalLayoutWithItemManager_, v12);
  objc_msgSend(v12, sel_setDelegate_, v14);
  v15 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a2;
    v26 = sub_1B8FF4A00;
    v27 = v16;
    *(_QWORD *)&v23 = v15;
    *((_QWORD *)&v23 + 1) = 1107296256;
    v24 = sub_1B8E36AA4;
    v25 = &block_descriptor_34_0;
    v17 = _Block_copy(&v23);
    v18 = a2;
    swift_release();
    objc_msgSend(v12, sel_setHomeCreator_, v17);
    _Block_release(v17);

  }
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1B8E2D0BC((uint64_t)v30, (uint64_t)v28);
  v20 = swift_allocObject();
  sub_1B8E35A58(v28, v20 + 16);
  *(_QWORD *)(v20 + 56) = v19;
  v26 = sub_1B8F5B1F4;
  v27 = v20;
  *(_QWORD *)&v23 = v15;
  *((_QWORD *)&v23 + 1) = 1107296256;
  v24 = sub_1B8ED0F64;
  v25 = &block_descriptor_43;
  v21 = _Block_copy(&v23);
  swift_release();
  objc_msgSend(v12, sel_setItemModuleCreator_, v21);

  _Block_release(v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v14;
}

id sub_1B8FF3FE4(uint64_t a1, void *a2, char *a3, uint64_t a4, uint64_t a5)
{
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v9 = MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v11, v9);
  return sub_1B8FF3D1C((uint64_t)v11, a2, a3, a4, a5);
}

uint64_t type metadata accessor for ActionGridViewController()
{
  return objc_opt_self();
}

uint64_t sub_1B8FF4098(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[8] = a1;
  v2[9] = v1;
  sub_1B93EE06C();
  v2[10] = sub_1B93EE060();
  sub_1B93EE018();
  return swift_task_switch();
}

uint64_t sub_1B8FF4104()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(void **)(v0 + 64);
  swift_release();
  type metadata accessor for ItemCollectionViewControlsTransitionHelper();
  v3 = swift_allocObject();
  v4 = v3 + qword_1EF20B740;
  *(_QWORD *)(v3 + qword_1EF20B740 + 8) = 0;
  swift_unknownObjectWeakInit();
  v5 = v3 + qword_1EF20B750;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_BYTE *)(v5 + 32) = 1;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = &protocol witness table for HUControllableItemCollectionViewController;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(v3 + qword_1EF20B748) = v2;
  v6 = v2;
  v7 = sub_1B93EC68C();
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_accessoryControlDataModel);
  objc_allocWithZone((Class)type metadata accessor for ActionSetAccessoryControlViewController(0));
  v9 = v6;
  swift_retain();
  swift_retain();
  sub_1B8F2993C(v9, v8, v7);
  v11 = v10;
  v12 = *(void **)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (!v12)
    goto LABEL_9;
  v13 = *(void **)(v0 + 64);
  v14 = v12;
  if ((sub_1B8E75FCC(v13) & 1) == 0)
  {
    swift_release();

    return (*(uint64_t (**)(void *))(v0 + 8))(v11);
  }
  v15 = *(void **)(v0 + 64);
  v16 = v11;
  sub_1B8E7634C(v15);
  sub_1B93EC494();

  v17 = v16;
  v18 = (void *)sub_1B93EC488();

  if (!v18)
  {

LABEL_9:
    swift_release();
    return (*(uint64_t (**)(void *))(v0 + 8))(v11);
  }
  type metadata accessor for ContainedAccessoryElementsGridViewController();
  v19 = swift_dynamicCastClass();
  if (v19)
  {
    v20 = (uint64_t *)(v19 + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_actionSetDataModel);
    swift_beginAccess();
    *v20 = v8;
    swift_retain_n();
    swift_release();
    sub_1B8F96C20();
    swift_release();
    swift_release();

  }
  else
  {

    swift_release();
  }

  return (*(uint64_t (**)(void *))(v0 + 8))(v11);
}

uint64_t sub_1B8FF4354()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B8FF4378(uint64_t a1)
{
  uint64_t v1;

  sub_1B8FF3170(a1, *(_QWORD *)(v1 + 16));
}

void sub_1B8FF4380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  unint64_t v6;
  uint64_t v7;
  __int128 v8[2];
  _QWORD v9[4];

  v1 = v0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule);
  if (v2)
  {
    sub_1B8E2D0BC(v2 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer, (uint64_t)v8);
    sub_1B8E35A58(v8, (uint64_t)v9);
    v3 = v0 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate;
    swift_beginAccess();
    if (MEMORY[0x1BCCC1DA8](v3))
    {
      v4 = *(_QWORD *)(v3 + 8);
      ObjectType = swift_getObjectType();
      __swift_project_boxed_opaque_existential_1(v9, v9[3]);
      v6 = sub_1B93EC9B0();
      v7 = sub_1B8E937A4(v6);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))(v4 + 8))(v1, v7, v9, ObjectType, v4);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_dataModelObserverCancelable))
  {
    swift_retain();
    sub_1B93ED124();
    swift_release();
  }
}

uint64_t type metadata accessor for EmbeddedActionGridViewController()
{
  return objc_opt_self();
}

uint64_t sub_1B8FF44DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate;
  swift_beginAccess();
  result = MEMORY[0x1BCCC1DA8](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1B8FF4534(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1B8FF459C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_1B8FF45EC(char *a1)
{
  return sub_1B8FF16EC(*a1);
}

uint64_t sub_1B8FF4610@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig);
  swift_beginAccess();
  *a2 = *v3;
  return sub_1B93ECF74();
}

uint64_t sub_1B8FF4664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, sub_1B8FF1994);
}

uint64_t sub_1B8FF4670@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 8);
  return sub_1B93ECF74();
}

uint64_t sub_1B8FF46C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, sub_1B8FF1D08);
}

uint64_t keypath_set_7Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6;

  v6 = sub_1B93ECF74();
  return a5(v6);
}

uint64_t dispatch thunk of ActionGridViewControllerDelegate.actionGridViewController(_:didUpdate:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t method lookup function for ActionGridViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActionGridViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActionGridViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActionGridViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActionGridViewController.actionGridConfig.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActionGridViewController.actionGridConfig.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActionGridViewController.actionGridConfig.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActionGridViewController.allowsEditing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActionGridViewController.allowsEditing.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActionGridViewController.allowsEditing.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActionGridViewController.denylistedAccessories.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ActionGridViewController.denylistedAccessories.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActionGridViewController.denylistedAccessories.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActionGridViewController.allowlistedAccessories.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActionGridViewController.allowlistedAccessories.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActionGridViewController.allowlistedAccessories.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActionGridViewController.__allocating_init(actionBuilderContainer:home:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of ActionGridViewController.actionGridItemModuleController(_:didUpdate:in:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of ActionGridViewController.actionSetDeviceDataModelUpdated()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t sub_1B8FF48F4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1B8FF4930()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1B8E93FE8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EF210560 + dword_1EF210560))(v2, v3, v5, v4);
}

uint64_t sub_1B8FF49B0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B8FF49D4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

id sub_1B8FF4A00()
{
  uint64_t v0;

  return objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, *(_QWORD *)(v0 + 16));
}

uint64_t sub_1B8FF4A48(unint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  char **v4;
  void *v7;
  void *v8;
  HUGridLayoutOptions *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t result;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  CGSize_optional v66;

  v7 = *(void **)(v3 + OBJC_IVAR___HUCollectionLayoutManager_layoutOptions);
  if (v7)
  {
    v8 = *(void **)(v3 + OBJC_IVAR___HUCollectionLayoutManager_layoutOptions);
  }
  else
  {
    swift_getObjectType();
    v66.is_nil = 0;
    NSCollectionLayoutEnvironment.layoutOptions(overrideContentSize:)(v9, v66);
    v8 = v10;
    v7 = 0;
  }
  v11 = v7;
  objc_msgSend(v8, sel_sectionLeadingMargin);
  v13 = v12;
  objc_msgSend(v8, sel_sectionTrailingMargin);
  v15 = v13 + v14;
  objc_msgSend(a3, sel_interItemSpacing);
  v17 = v16;
  objc_msgSend(objc_msgSend(a2, sel_container), sel_effectiveContentSize);
  v19 = v18;
  swift_unknownObjectRelease();
  v20 = v19 - v15;
  objc_msgSend(a3, sel_cameraCellWidth);
  v22 = v21;
  objc_msgSend(a3, sel_interItemSpacing);
  v62 = objc_msgSend(a3, sel_numColumnsForContainerWidth_minimumCameraCellWidth_padding_, v20, v22, v23);
  v24 = (void *)objc_opt_self();
  objc_msgSend(v24, sel_columnWidthForContainerWidth_numberOfColumns_padding_, v62, v20, v17);
  objc_msgSend(v24, sel_heightForWidth_);
  v26 = v25;
  if (a1 >> 62)
  {
LABEL_29:
    sub_1B93ECF74();
    v27 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v28 = sub_1B8FF5270(v27, v26);
  v29 = MEMORY[0x1E0DEE9D8];
  v64 = 0;
  v65 = MEMORY[0x1E0DEE9D8];
  v30 = (void *)objc_opt_self();
  v31 = objc_msgSend(v30, sel_fractionalWidthDimension_, 1.0);
  v32 = objc_msgSend(v30, sel_absoluteDimension_, v26);
  v33 = (void *)objc_opt_self();
  v63 = objc_msgSend(v33, sel_sizeWithWidthDimension_heightDimension_, v31, v32);

  if (!((unint64_t)v28 >> 62))
  {
    v34 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
    v59 = v33;
    v60 = v30;
    if (v34)
      goto LABEL_8;
LABEL_34:
    swift_bridgeObjectRelease();
LABEL_35:
    v4 = &selRef_shouldShowAccessoryControlForItem_;
    goto LABEL_36;
  }
  if (v28 < 0)
    v31 = (id)v28;
  else
    v31 = (id)(v28 & 0xFFFFFFFFFFFFFF8);
  sub_1B93ECF74();
  v34 = sub_1B93EE9F0();
  swift_bridgeObjectRelease();
  v59 = v33;
  v60 = v30;
  if (!v34)
    goto LABEL_34;
LABEL_8:
  if (v62)
  {
    v58 = v8;
    v8 = 0;
    v4 = (char **)(v28 & 0xC000000000000001);
    v35 = (uint64_t)v62;
    do
    {
      if (v4)
        v36 = (id)MEMORY[0x1BCCC05FC](v8, v28);
      else
        v36 = *(id *)(v28 + 8 * (_QWORD)v8 + 32);
      v37 = v64;
      if (!v64)
        v37 = v29;
      v64 = v37;
      v38 = v36;
      MEMORY[0x1BCCBFCCC]();
      if (*(_QWORD *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B93EDF7C();
      sub_1B93EDFB8();
      result = sub_1B93EDF64();
      if (((uint64_t)v8 + 1) % v35)
      {

      }
      else
      {
        if (!v64)
        {
          __break(1u);
          return result;
        }
        v40 = (void *)objc_opt_self();
        sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E680);
        sub_1B93ECF74();
        v41 = (void *)sub_1B93EDF34();
        swift_bridgeObjectRelease();
        v42 = objc_msgSend(v40, sel_horizontalGroupWithLayoutSize_subitems_, v63, v41);

        v43 = (void *)objc_opt_self();
        objc_msgSend(a3, sel_interItemSpacing);
        v44 = objc_msgSend(v43, sel_fixedSpacing_);
        objc_msgSend(v42, sel_setInterItemSpacing_, v44);

        v45 = v42;
        MEMORY[0x1BCCBFCCC]();
        if (*(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B93EDF7C();
        sub_1B93EDFB8();
        sub_1B93EDF64();

        v64 = 0;
        swift_bridgeObjectRelease();
        v35 = (uint64_t)v62;
      }
      if (v8 == (void *)0x7FFFFFFFFFFFFFFELL)
      {
        __break(1u);
        goto LABEL_29;
      }
      v8 = (char *)v8 + 1;
    }
    while ((void *)v34 != v8);
    swift_bridgeObjectRelease();
    v8 = v58;
    if (!v64)
      goto LABEL_35;
    v46 = (void *)objc_opt_self();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E680);
    sub_1B93ECF74();
    v47 = (void *)sub_1B93EDF34();
    swift_bridgeObjectRelease();
    v48 = objc_msgSend(v46, sel_horizontalGroupWithLayoutSize_subitems_, v63, v47);

    v31 = v48;
    MEMORY[0x1BCCBFCCC]();
    v4 = &selRef_shouldShowAccessoryControlForItem_;
    if (*(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_27;
  }
  else
  {
    __break(1u);
  }
  sub_1B93EDF7C();
LABEL_27:
  sub_1B93EDFB8();
  sub_1B93EDF64();

LABEL_36:
  if (v65 >> 62)
  {
    sub_1B93ECF74();
    v49 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v49 = *(_QWORD *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v50 = objc_msgSend(v60, sel_fractionalWidthDimension_, 1.0, v58);
  v51 = objc_msgSend(v60, sel_estimatedDimension_, (v17 + v26) * (double)v49);
  v52 = objc_msgSend(v59, v4[182], v50, v51);

  if (v65 >> 62)
  {
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E680);
    sub_1B93ECF74();
    sub_1B93EE9E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B93ECF74();
    sub_1B93EEB1C();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E680);
  }
  swift_bridgeObjectRelease();
  v53 = (void *)objc_opt_self();
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E680);
  v54 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  v55 = objc_msgSend(v53, sel_verticalGroupWithLayoutSize_subitems_, v52, v54);

  v56 = objc_msgSend((id)objc_opt_self(), sel_fixedSpacing_, v17);
  objc_msgSend(v55, sel_setInterItemSpacing_, v56);

  v57 = objc_msgSend((id)objc_opt_self(), sel_sectionWithGroup_, v55);
  swift_bridgeObjectRelease();
  return (uint64_t)v57;
}

uint64_t sub_1B8FF5270(uint64_t a1, double a2)
{
  uint64_t result;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  result = MEMORY[0x1E0DEE9D8];
  if (a1 >= 1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    v5 = (void *)objc_opt_self();
    v6 = (void *)objc_opt_self();
    v7 = (void *)objc_opt_self();
    v8 = (void *)objc_opt_self();
    do
    {
      objc_msgSend(v5, sel_widthForHeight_, a2);
      v9 = objc_msgSend(v6, sel_absoluteDimension_);
      v10 = objc_msgSend(v6, sel_absoluteDimension_, a2);
      v11 = objc_msgSend(v7, sel_sizeWithWidthDimension_heightDimension_, v9, v10);

      v12 = objc_msgSend(v8, sel_itemWithLayoutSize_, v11);
      v13 = v12;
      MEMORY[0x1BCCBFCCC]();
      if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B93EDF7C();
      sub_1B93EDFB8();
      sub_1B93EDF64();

      --a1;
    }
    while (a1);
    return v14;
  }
  return result;
}

id HUProcessedWallpaperFactory.applyCustomFilter(for:image:)(void *a1, void *a2)
{
  return sub_1B8FF57D4(a2, objc_msgSend(a1, sel_type) == (id)6);
}

id sub_1B8FF54C4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _OWORD v15[2];
  _OWORD v16[2];
  _OWORD v17[2];
  _OWORD v18[2];
  _OWORD v19[2];

  v2 = (void *)sub_1B93EDD84();
  v3 = objc_msgSend((id)objc_opt_self(), sel_filterWithName_, v2);

  if (v3)
  {
    objc_msgSend(v3, sel_setValue_forKey_, a1, *MEMORY[0x1E0C9E1F8]);
    v19[0] = xmmword_1B9441040;
    v19[1] = xmmword_1B9441050;
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DDF8]), sel_initWithValues_count_, v19, 4);
    v5 = (void *)sub_1B93EDD84();
    objc_msgSend(v3, sel_setValue_forKey_, v4, v5);

    v18[0] = xmmword_1B9441060;
    v18[1] = xmmword_1B9441050;
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DDF8]), sel_initWithValues_count_, v18, 4);
    v7 = (void *)sub_1B93EDD84();
    objc_msgSend(v3, sel_setValue_forKey_, v6, v7);

    v17[0] = xmmword_1B9441070;
    v17[1] = xmmword_1B9441080;
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DDF8]), sel_initWithValues_count_, v17, 4);
    v9 = (void *)sub_1B93EDD84();
    objc_msgSend(v3, sel_setValue_forKey_, v8, v9);

    v16[0] = xmmword_1B9441090;
    v16[1] = xmmword_1B94410A0;
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DDF8]), sel_initWithValues_count_, v16, 4);
    v11 = (void *)sub_1B93EDD84();
    objc_msgSend(v3, sel_setValue_forKey_, v10, v11);

    memset(v15, 0, sizeof(v15));
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DDF8]), sel_initWithValues_count_, v15, 4);
    v13 = (void *)sub_1B93EDD84();
    objc_msgSend(v3, sel_setValue_forKey_, v12, v13);

  }
  return v3;
}

id sub_1B8FF57D4(void *a1, char a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DDC8]), sel_initWithImage_, a1);
  if (!v3)
    return a1;
  v4 = v3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v3, sel_extent);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(v4, sel_imageByClampingToExtent);

    v14 = objc_msgSend(v13, sel_imageByApplyingGaussianBlurWithSigma_, 10.0);
    v15 = objc_msgSend(v14, sel_imageByCroppingToRect_, v6, v8, v10, v12);
  }
  else
  {
    v14 = v3;
    v17 = sub_1B8FF54C4((uint64_t)v14);
    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend(v17, sel_outputImage);

      if (v19)
      {

        v14 = v19;
      }
      v20 = v14;
      v21 = objc_msgSend(v20, sel_imageByUnpremultiplyingAlpha);
      objc_msgSend(v20, sel_extent);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      v30 = objc_msgSend(v21, sel_imageBySettingAlphaOneInExtent_, v23, v25, v27, v29);
      v31 = (void *)objc_opt_self();
      v14 = v30;
      v32 = objc_msgSend(v31, sel_redImage);
      objc_msgSend(v14, sel_extent);
      v33 = objc_msgSend(v32, sel_imageByCroppingToRect_);

      v15 = objc_msgSend(v14, sel_imageByCompositingOverImage_, v33);
    }
    else
    {
      v15 = v14;
    }
  }

  objc_msgSend(a1, sel_scale);
  v35 = v34;
  v36 = objc_msgSend(a1, sel_imageOrientation);
  v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9DD90]), sel_init);
  objc_msgSend(v15, sel_extent);
  v38 = objc_msgSend(v37, sel_createCGImage_fromRect_, v15);
  if (v38)
  {
    v39 = v38;
    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA638]), sel_initWithCGImage_scale_orientation_, v38, v36, v35);

  }
  else
  {

    v40 = a1;
  }
  return v40;
}

void sub_1B8FF5AFC(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;
  v5 = v2;

}

id sub_1B8FF5B50()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 16);
}

void sub_1B8FF5B80(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t (*sub_1B8FF5BC4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ServiceGroupSelectionController.__allocating_init(serviceGroupBuilder:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t ServiceGroupSelectionController.init(serviceGroupBuilder:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_1B8FF5C3C(uint64_t a1, void *a2)
{
  return sub_1B8FF5C54(a1, a2, (SEL *)&selRef_addService_);
}

uint64_t sub_1B8FF5C48(uint64_t a1, void *a2)
{
  return sub_1B8FF5C54(a1, a2, (SEL *)&selRef_removeService_);
}

uint64_t sub_1B8FF5C54(uint64_t a1, void *a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t inited;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v16;

  v5 = v3;
  swift_getObjectType();
  v7 = sub_1B93EE3A8();
  swift_retain();
  sub_1B8FF63F8(v7, v5, a3);
  swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B9436B60;
  *(_QWORD *)(inited + 32) = a2;
  v16 = inited;
  sub_1B93EDF64();
  if (v16 >> 62)
  {
    v13 = a2;
    sub_1B93ECF74();
    v14 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_3;
LABEL_5:
    v12 = MEMORY[0x1E0DEE9E8];
    goto LABEL_6;
  }
  v9 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  v10 = a2;
  if (!v9)
    goto LABEL_5;
LABEL_3:
  sub_1B8E93470(v16);
  v12 = v11;
LABEL_6:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1B8FF5D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_1B93EE3A8();
  swift_retain();
  sub_1B8FF5F80(v2, v1);
  v4 = v3;
  swift_bridgeObjectRelease();
  swift_release();
  return v4 & 1;
}

uint64_t ServiceGroupSelectionController.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ServiceGroupSelectionController.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1B8FF5E18(uint64_t a1, void *a2)
{
  return sub_1B8FF5C3C(a1, a2);
}

uint64_t sub_1B8FF5E3C(uint64_t a1, void *a2)
{
  return sub_1B8FF5C48(a1, a2);
}

uint64_t sub_1B8FF5E60()
{
  MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for ServiceGroupSelectionController);
  return sub_1B93ECBCC();
}

uint64_t sub_1B8FF5EAC()
{
  MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for ServiceGroupSelectionController);
  return sub_1B93ECBD8();
}

uint64_t sub_1B8FF5EF8()
{
  MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for ServiceGroupSelectionController);
  return sub_1B93ECBA8();
}

uint64_t sub_1B8FF5F38()
{
  MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for ServiceGroupSelectionController);
  return sub_1B93ECBC0();
}

void sub_1B8FF5F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  char v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  id *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8FF67D0();
    sub_1B8E464E4((unint64_t *)&qword_1EF20ADA0, 255, (uint64_t (*)(uint64_t))sub_1B8FF67D0, MEMORY[0x1E0DEFCF8]);
    sub_1B93EE138();
    v3 = v36;
    v32 = v37;
    v4 = v38;
    v5 = v39;
    v6 = v40;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v32 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v4 = v8;
    v5 = 0;
  }
  v31 = (unint64_t)(v4 + 64) >> 6;
  v34 = (id *)(a2 + 16);
  v33 = v3;
  while (1)
  {
    v11 = v5;
    if (v3 < 0)
    {
      if (!sub_1B93EE7A4())
        goto LABEL_53;
      sub_1B8FF67D0();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v14 = v41;
      swift_unknownObjectRelease();
      v12 = v6;
      if (!v41)
        goto LABEL_53;
    }
    else
    {
      if (v6)
      {
        v12 = (v6 - 1) & v6;
        v13 = __clz(__rbit64(v6)) | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_56;
        if (v15 >= v31)
          goto LABEL_53;
        v16 = *(_QWORD *)(v32 + 8 * v15);
        ++v5;
        if (!v16)
        {
          v5 = v11 + 2;
          if (v11 + 2 >= v31)
            goto LABEL_53;
          v16 = *(_QWORD *)(v32 + 8 * v5);
          if (!v16)
          {
            v5 = v11 + 3;
            if (v11 + 3 >= v31)
              goto LABEL_53;
            v16 = *(_QWORD *)(v32 + 8 * v5);
            if (!v16)
            {
              v5 = v11 + 4;
              if (v11 + 4 >= v31)
                goto LABEL_53;
              v16 = *(_QWORD *)(v32 + 8 * v5);
              if (!v16)
              {
                v5 = v11 + 5;
                if (v11 + 5 >= v31)
                  goto LABEL_53;
                v16 = *(_QWORD *)(v32 + 8 * v5);
                if (!v16)
                {
                  v17 = v11 + 6;
                  while (v31 != v17)
                  {
                    v16 = *(_QWORD *)(v32 + 8 * v17++);
                    if (v16)
                    {
                      v5 = v17 - 1;
                      goto LABEL_30;
                    }
                  }
                  goto LABEL_53;
                }
              }
            }
          }
        }
LABEL_30:
        v12 = (v16 - 1) & v16;
        v13 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v14 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      if (!v14)
        goto LABEL_53;
    }
    v35 = v12;
    swift_beginAccess();
    v18 = objc_msgSend(*v34, sel_services);
    sub_1B8FF67D0();
    v19 = sub_1B93EDF4C();

    if (v19 >> 62)
    {
      sub_1B93ECF74();
      v20 = sub_1B93EE9F0();
      if (!v20)
        goto LABEL_8;
    }
    else
    {
      v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
      sub_1B93ECF74();
      if (!v20)
        goto LABEL_8;
    }
    if ((v19 & 0xC000000000000001) != 0)
      v21 = (id)MEMORY[0x1BCCC05FC](0, v19);
    else
      v21 = *(id *)(v19 + 32);
    v22 = v21;
    v23 = sub_1B93EE4EC();

    if ((v23 & 1) != 0)
    {
LABEL_52:

      swift_bridgeObjectRelease_n();
LABEL_53:
      sub_1B8E7A20C();
      return;
    }
    if (v20 != 1)
      break;
LABEL_8:

    swift_bridgeObjectRelease_n();
    v3 = v33;
    v6 = v35;
  }
  if ((v19 & 0xC000000000000001) != 0)
  {
    v24 = 1;
    while (1)
    {
      MEMORY[0x1BCCC05FC](v24, v19);
      v25 = v24 + 1;
      if (__OFADD__(v24, 1))
        break;
      v26 = sub_1B93EE4EC();
      swift_unknownObjectRelease();
      if ((v26 & 1) != 0)
        goto LABEL_52;
      ++v24;
      if (v25 == v20)
        goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    v27 = 5;
    while (1)
    {
      v28 = v27 - 3;
      if (__OFADD__(v27 - 4, 1))
        break;
      v29 = *(id *)(v19 + 8 * v27);
      v30 = sub_1B93EE4EC();

      if ((v30 & 1) != 0)
        goto LABEL_52;
      ++v27;
      if (v28 == v20)
        goto LABEL_8;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
}

void sub_1B8FF63F8(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;

  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8FF67D0();
    sub_1B8E464E4((unint64_t *)&qword_1EF20ADA0, 255, (uint64_t (*)(uint64_t))sub_1B8FF67D0, MEMORY[0x1E0DEFCF8]);
    sub_1B93EE138();
    v5 = v22;
    v21 = v23;
    v6 = v24;
    v7 = v25;
    v8 = v26;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v21 = a1 + 56;
    v6 = ~v9;
    v10 = -v9;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v8 = v11 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v7 = 0;
  }
  v20 = (unint64_t)(v6 + 64) >> 6;
  v12 = (id *)(a2 + 16);
  if (v5 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v8)
    {
      v13 = (v8 - 1) & v8;
      v14 = __clz(__rbit64(v8)) | (v7 << 6);
      v15 = v7;
      goto LABEL_29;
    }
    v17 = v7 + 1;
    if (__OFADD__(v7, 1))
      break;
    if (v17 >= v20)
      goto LABEL_32;
    v18 = *(_QWORD *)(v21 + 8 * v17);
    v15 = v7 + 1;
    if (!v18)
    {
      v15 = v7 + 2;
      if (v7 + 2 >= v20)
        goto LABEL_32;
      v18 = *(_QWORD *)(v21 + 8 * v15);
      if (!v18)
      {
        v15 = v7 + 3;
        if (v7 + 3 >= v20)
          goto LABEL_32;
        v18 = *(_QWORD *)(v21 + 8 * v15);
        if (!v18)
        {
          v15 = v7 + 4;
          if (v7 + 4 >= v20)
            goto LABEL_32;
          v18 = *(_QWORD *)(v21 + 8 * v15);
          if (!v18)
          {
            v15 = v7 + 5;
            if (v7 + 5 >= v20)
              goto LABEL_32;
            v18 = *(_QWORD *)(v21 + 8 * v15);
            if (!v18)
            {
              v19 = v7 + 6;
              while (v20 != v19)
              {
                v18 = *(_QWORD *)(v21 + 8 * v19++);
                if (v18)
                {
                  v15 = v19 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1B8E7A20C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v13 = (v18 - 1) & v18;
    v14 = __clz(__rbit64(v18)) + (v15 << 6);
LABEL_29:
    v16 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v14);
    if (!v16)
      goto LABEL_32;
    while (1)
    {
      swift_beginAccess();
      objc_msgSend(*v12, *a3, v16);

      v7 = v15;
      v8 = v13;
      if ((v5 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_1B93EE7A4())
      {
        sub_1B8FF67D0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v16 = v27;
        swift_unknownObjectRelease();
        v15 = v7;
        v13 = v8;
        if (v27)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_1B8FF66E0(uint64_t a1, uint64_t a2)
{
  return sub_1B8E464E4(&qword_1EF210578, a2, (uint64_t (*)(uint64_t))type metadata accessor for ServiceGroupSelectionController, (uint64_t)&protocol conformance descriptor for ServiceGroupSelectionController);
}

uint64_t type metadata accessor for ServiceGroupSelectionController()
{
  return objc_opt_self();
}

id sub_1B8FF672C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *a2 = v4;
  return v4;
}

uint64_t method lookup function for ServiceGroupSelectionController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.serviceGroupBuilder.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.serviceGroupBuilder.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.serviceGroupBuilder.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.__allocating_init(serviceGroupBuilder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.select(accessoryRepresentableObject:in:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.deselect(accessoryRepresentableObject:in:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ServiceGroupSelectionController.isSelected(accessoryRepresentableObject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

unint64_t sub_1B8FF67D0()
{
  unint64_t result;

  result = qword_1EF2082C0;
  if (!qword_1EF2082C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF2082C0);
  }
  return result;
}

void sub_1B8FF680C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_1B8FF686C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

uint64_t sub_1B8FF6900()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  return MEMORY[0x1BCCC1DA8](v1);
}

BOOL TileCellBackgroundView.MaterialStyle.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_1B8FF69BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___HUTileCellBackgroundView_materialStyle;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void sub_1B8FF6A00(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;
  sub_1B8FF6A74(v4);

}

void sub_1B8FF6A74(void *a1)
{
  char *v1;
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
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
  void *v18;
  uint64_t v19;

  if (a1)
    objc_msgSend(a1, sel_removeFromSuperview);
  v2 = (id *)&v1[OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView];
  swift_beginAccess();
  if (*v2)
  {
    v3 = *v2;
    objc_msgSend(v1, sel_addSubview_, v3);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v4 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1B9438CD0;
    v6 = objc_msgSend(v1, sel_leadingAnchor);
    v7 = objc_msgSend(v3, sel_leadingAnchor);
    v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

    *(_QWORD *)(v5 + 32) = v8;
    v9 = objc_msgSend(v1, sel_trailingAnchor);
    v10 = objc_msgSend(v3, sel_trailingAnchor);
    v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

    *(_QWORD *)(v5 + 40) = v11;
    v12 = objc_msgSend(v1, sel_topAnchor);
    v13 = objc_msgSend(v3, sel_topAnchor);
    v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

    *(_QWORD *)(v5 + 48) = v14;
    v15 = objc_msgSend(v1, sel_bottomAnchor);
    v16 = objc_msgSend(v3, sel_bottomAnchor);
    v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    *(_QWORD *)(v5 + 56) = v17;
    v19 = v5;
    sub_1B93EDF64();
    sub_1B8E4C518();
    v18 = (void *)sub_1B93EDF34();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_activateConstraints_, v18, v19);

  }
}

void *sub_1B8FF6D0C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1B8FF6D58(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;
  sub_1B8FF6A74(v4);

}

void (*sub_1B8FF6DC4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (void **)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return sub_1B8FF6E38;
}

void sub_1B8FF6E38(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)a1;
  v4 = (void **)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v7 = *(void **)(v6 + v5);
  *(_QWORD *)(v6 + v5) = *v4;
  if ((a2 & 1) != 0)
  {
    v8 = v3;
    sub_1B8FF6A74(v7);

    v7 = *v4;
  }
  else
  {
    v9 = v3;
    sub_1B8FF6A74(v7);

  }
  free(v2);
}

id sub_1B8FF6EC0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___controlCenterMaterialView;
  v2 = *(void **)(v0 + OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___controlCenterMaterialView);
  v3 = v2;
  if (v2 == (void *)1)
  {
    if (objc_msgSend((id)objc_opt_self(), sel_shouldUseControlCenterMaterials))
    {
      _s25ControlCenterMaterialViewCMa();
      v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    }
    else
    {
      v3 = 0;
    }
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_1B8E5F3FC(v4);
  }
  sub_1B8E5F294(v2);
  return v3;
}

id TileCellBackgroundView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TileCellBackgroundView.__allocating_init(effectIdentifier:effectGrouper:materialStyle:)(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = objc_msgSend(objc_allocWithZone(v3), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_beginAccess();
  v7 = swift_unknownObjectWeakAssign();
  v8 = (void *)MEMORY[0x1BCCC1DA8](v7);
  v9 = v6;
  sub_1B8FF7888(a1, v8, a3);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

id TileCellBackgroundView.init(effectIdentifier:effectGrouper:materialStyle:)(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_beginAccess();
  v7 = swift_unknownObjectWeakAssign();
  v8 = (void *)MEMORY[0x1BCCC1DA8](v7);
  v9 = v6;
  sub_1B8FF7888(a1, v8, a3);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

id TileCellBackgroundView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TileCellBackgroundView.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  *(_QWORD *)&v1[OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___HUTileCellBackgroundView_materialStyle] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___visualEffectView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___controlCenterMaterialView] = 1;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for TileCellBackgroundView();
  v3 = objc_msgSendSuper2(&v10, sel_initWithCoder_, a1);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = sub_1B8E5F2A4();
    objc_msgSend(v5, sel_addSubview_, v6);

    v7 = sub_1B8FF6EC0();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v5, sel_addSubview_, v7);

      v5 = a1;
      a1 = v8;
    }

  }
  return v4;
}

id TileCellBackgroundView.__deallocating_deinit()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  objc_super v5;

  v1 = sub_1B8E5F2A4();
  v2 = objc_msgSend(v1, sel__captureSource);

  if (v2)
  {
    v3 = sub_1B8E5F2A4();
    objc_msgSend(v2, sel__removeCaptureDependent_, v3);

  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TileCellBackgroundView();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

void sub_1B8FF7518()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  void **v4;
  void *v5;

  v1 = sub_1B8E5F2A4();
  v2 = objc_msgSend(v1, sel__captureSource);

  if (v2)
  {
    v3 = sub_1B8E5F2A4();
    objc_msgSend(v2, sel__removeCaptureDependent_, v3);

  }
  v4 = (void **)(v0 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  v5 = *v4;
  *v4 = 0;

}

uint64_t sub_1B8FF7664(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;

  v5 = v2 + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x1BCCC1DA8](v5);
  sub_1B8FF7888(a1, v6, a2);
  return swift_unknownObjectRelease();
}

void sub_1B8FF7770(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id v7;
  id v8;
  id v9;

  v3 = v1 + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  v4 = MEMORY[0x1BCCC1DA8](v3);
  v5 = (void *)v4;
  if (a1)
  {
    if (v4)
    {
      swift_unknownObjectRelease();
      if (v5 == a1)
        return;
    }
  }
  else
  {
    if (!v4)
      return;
    swift_unknownObjectRelease();
  }
  v6 = (id *)(v1 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  if (*v6)
  {
    v7 = *v6;
    sub_1B8FF7888(v7, a1, 0);
  }
  else
  {
    swift_unknownObjectWeakAssign();
    v8 = sub_1B8E5F2A4();
    v9 = objc_msgSend(v8, sel__captureSource);

    if (!v9)
      return;
    v7 = sub_1B8E5F2A4();
    objc_msgSend(v9, sel__removeCaptureDependent_, v7);

  }
}

void sub_1B8FF7888(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char **p_name;
  void **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void **v43;
  void *v44;
  id v45;
  void **v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _BYTE v62[24];
  ValueMetadata *v63;
  unint64_t v64;

  v4 = v3;
  v8 = v3 + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  v9 = MEMORY[0x1BCCC1DA8](v8);
  v10 = (void *)v9;
  p_name = (char **)(&stru_1E701DFF8 + 8);
  if (a2)
  {
    if (v9)
    {
      swift_unknownObjectRelease();
      if (v10 == a2)
        goto LABEL_12;
    }
  }
  else
  {
    if (!v9)
      goto LABEL_12;
    swift_unknownObjectRelease();
  }
  v12 = (void **)(v4 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  v13 = *v12;
  if (*v12)
  {
    v14 = MEMORY[0x1BCCC1DA8](v8);
    if (v14)
    {
      v15 = (void *)v14;
      v16 = a1;
      v17 = a3;
      v18 = v13;
      v19 = sub_1B8E5F2A4();
      objc_msgSend(v15, sel_backgroundEffectRemoveCaptureDependent_forBackgroundEffectIdentifier_, v19, v18);

      a3 = v17;
      a1 = v16;
      p_name = &stru_1E701DFF8.name;
      swift_unknownObjectRelease();
    }
  }
  swift_unknownObjectWeakAssign();
  v20 = *v12;
  *v12 = 0;

  v21 = sub_1B8E5F2A4();
  v22 = objc_msgSend(v21, p_name[395]);

  if (v22)
  {
    v23 = sub_1B8E5F2A4();
    objc_msgSend(v22, sel__removeCaptureDependent_, v23);

  }
LABEL_12:
  v24 = sub_1B8FF6EC0();
  if (!v24)
    goto LABEL_27;
  v25 = v24;
  _s25ControlCenterMaterialViewCMa();
  v26 = swift_dynamicCastClass();
  if (!v26)
  {
LABEL_26:

LABEL_27:
    v46 = (void **)(v4 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
    swift_beginAccess();
    v47 = *v46;
    if (!*v46)
      goto LABEL_33;
    v48 = sub_1B93EDDB4();
    v50 = v49;
    if (v48 == sub_1B93EDDB4() && v50 == v51)
    {
      v57 = v47;
      v58 = a1;

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v53 = sub_1B93EEB10();
      v54 = v47;
      v55 = a1;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v53 & 1) == 0)
      {
LABEL_33:
        if (!a2)
        {
          v56 = sub_1B8E5F2A4();
          objc_msgSend(v56, sel_hu_configureEffectForIdentifier_, a1);
LABEL_39:

LABEL_40:
          v44 = *v46;
          *v46 = a1;
          goto LABEL_41;
        }
LABEL_38:
        swift_unknownObjectRetain();
        v56 = sub_1B8E5F2A4();
        objc_msgSend(a2, sel_backgroundEffectAddCaptureDependent_forBackgroundEffectIdentifier_, v56, a1);
        swift_unknownObjectRelease();
        goto LABEL_39;
      }
    }
    v59 = sub_1B8E5F2A4();
    v60 = objc_msgSend(v59, p_name[395]);

    if (!a2 || v60)
      goto LABEL_40;
    goto LABEL_38;
  }
  v27 = (void *)v26;
  v63 = &type metadata for ControlCenterFeatures;
  v64 = sub_1B8FDE69C();
  v28 = sub_1B93EB960();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  if ((v28 & 1) != 0)
    goto LABEL_19;
  v29 = sub_1B93EDDB4();
  v31 = v30;
  if (v29 == sub_1B93EDDB4() && v31 == v32)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  v33 = sub_1B93EEB10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0)
  {
    objc_msgSend(v27, sel_setHidden_, 1);
    v45 = sub_1B8E5F2A4();
    objc_msgSend(v45, sel_setHidden_, 0);

    v25 = v45;
    p_name = &stru_1E701DFF8.name;
    goto LABEL_26;
  }
LABEL_19:
  objc_msgSend(v27, sel_setHidden_, 0);
  v34 = sub_1B93EDDB4();
  v36 = v35;
  if (v34 != sub_1B93EDDB4() || (v38 = 0, v36 != v37))
    v38 = sub_1B93EEB10() ^ 1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8FDE538(v38 & 1, a3 == 1);
  v39 = sub_1B8E5F2A4();
  objc_msgSend(v39, sel_setHidden_, 1);

  v40 = sub_1B8E5F2A4();
  v41 = objc_msgSend(v40, sel__captureSource);

  if (v41)
  {
    v42 = sub_1B8E5F2A4();
    objc_msgSend(v41, sel__removeCaptureDependent_, v42);

  }
  v43 = (void **)(v4 + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  v44 = *v43;
  *v43 = a1;
LABEL_41:
  v61 = a1;

}

unint64_t sub_1B8FF7DAC()
{
  unint64_t result;

  result = qword_1EF210688;
  if (!qword_1EF210688)
  {
    result = MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for TileCellBackgroundView.MaterialStyle, &type metadata for TileCellBackgroundView.MaterialStyle);
    atomic_store(result, (unint64_t *)&qword_1EF210688);
  }
  return result;
}

id sub_1B8FF7DF0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_20Tm(a1, &OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier, a2);
}

uint64_t sub_1B8FF7E00@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  result = MEMORY[0x1BCCC1DA8](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1B8FF7E54()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1B8FF7EA8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___HUTileCellBackgroundView_materialStyle);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1B8FF7EF8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___HUTileCellBackgroundView_materialStyle);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

id sub_1B8FF7F44@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_20Tm(a1, &OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView, a2);
}

uint64_t method lookup function for TileCellBackgroundView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TileCellBackgroundView.currentEffectIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TileCellBackgroundView.effectGrouper.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TileCellBackgroundView.materialStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TileCellBackgroundView.dashedBorderView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TileCellBackgroundView.dashedBorderView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TileCellBackgroundView.dashedBorderView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TileCellBackgroundView.prepareForReuse()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of TileCellBackgroundView.update(with:materialStyle:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TileCellBackgroundView.update(with:effectGrouper:materialStyle:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

ValueMetadata *type metadata accessor for TileCellBackgroundView.MaterialStyle()
{
  return &type metadata for TileCellBackgroundView.MaterialStyle;
}

char *sub_1B8FF8088(void *a1, void *a2)
{
  char *v2;
  id v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  *(_QWORD *)&v2[OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule] = 0;
  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for AccessoryDetailsSuggestedAutomationsItemManager();
  v5 = objc_msgSendSuper2(&v16, sel_initWithDelegate_sourceItem_, 0, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v6 + 32) = a1;
  sub_1B93EDF64();
  v7 = (void *)objc_opt_self();
  v8 = (char *)v5;
  v9 = a1;
  v10 = objc_msgSend(v7, sel_defaultContext);
  v11 = objc_allocWithZone((Class)HUAvailableRelatedTriggerItemModule);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2106C0);
  v12 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithItems_itemUpdater_home_context_, v12, v8, a2, v10);

  v14 = *(void **)&v8[OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule];
  *(_QWORD *)&v8[OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule] = v13;

  return v8;
}

uint64_t sub_1B8FF8268()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  os_log_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_1B93EC884();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)&v0[OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule];
  if (v5)
  {
    v24 = MEMORY[0x1E0DEE9D8];
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E34E3C();
    v6 = v5;
    v7 = (void *)sub_1B93EE0D8();
    v8 = objc_msgSend(v6, sel_buildSectionsWithDisplayedItems_, v7);

    sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
    v9 = sub_1B93EDF4C();

    sub_1B8EFA988(v9);
    return v24;
  }
  else
  {
    sub_1B93EC860();
    v11 = v0;
    v12 = sub_1B93EC86C();
    v13 = sub_1B93EE21C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v20 = (_QWORD *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v23 = (uint64_t)v11;
      v24 = v22;
      *(_DWORD *)v14 = 138412546;
      v21 = v12;
      v15 = v11;
      sub_1B93EE600();
      v16 = v20;
      *v20 = v11;

      *(_WORD *)(v14 + 12) = 2080;
      v23 = sub_1B8E3489C(0xD000000000000023, 0x80000001B9450490, &v24);
      sub_1B93EE600();
      v17 = v21;
      _os_log_impl(&dword_1B8E1E000, v21, v13, "%@ - %s cannot build sections without a trigger module.", (uint8_t *)v14, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v16, -1, -1);
      v18 = v22;
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v18, -1, -1);
      MEMORY[0x1BCCC1CD0](v14, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return MEMORY[0x1E0DEE9D8];
  }
}

void sub_1B8FF8614(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  char *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  uint64_t v35;
  int v36;
  os_log_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v42 = sub_1B93EC884();
  v3 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)&v1[OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule];
  if (v6)
  {
    v7 = v6;
    sub_1B93ECF74();
    v8 = objc_msgSend(v7, sel_allItems);
    v9 = sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E34E3C();
    v10 = v5;
    v11 = sub_1B93EE0FC();

    sub_1B8F0EB50(v11, a1);
    swift_bridgeObjectRelease();
    v12 = (void *)sub_1B93EE0D8();
    v41 = v7;
    v13 = objc_msgSend(v7, sel_itemsToHideInSet_, v12);

    sub_1B93EE0FC();
    v14 = v10;
    sub_1B93EC860();
    v15 = v1;
    swift_bridgeObjectRetain_n();
    v16 = v15;
    swift_retain();
    v17 = sub_1B93EC86C();
    v18 = sub_1B93EE204();
    v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v20 = swift_slowAlloc();
      v40 = v3;
      v21 = v20;
      v22 = swift_slowAlloc();
      v34[1] = v9;
      v35 = v22;
      v23 = (_QWORD *)v22;
      v38 = swift_slowAlloc();
      v43 = (uint64_t)v16;
      v44 = v38;
      *(_DWORD *)v21 = 138413058;
      v37 = v17;
      v39 = v14;
      v36 = v19;
      v24 = v16;
      sub_1B93EE600();
      *v23 = v16;

      *(_WORD *)(v21 + 12) = 2080;
      v43 = sub_1B8E3489C(0xD000000000000011, 0x80000001B94504C0, &v44);
      sub_1B93EE600();
      *(_WORD *)(v21 + 22) = 2080;
      swift_retain();
      v25 = sub_1B93EE108();
      v27 = v26;
      swift_release();
      v43 = sub_1B8E3489C(v25, v27, &v44);
      sub_1B93EE600();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 32) = 2080;
      sub_1B93ECF74();
      v28 = sub_1B93EE108();
      v30 = v29;
      swift_bridgeObjectRelease();
      v43 = sub_1B8E3489C(v28, v30, &v44);
      sub_1B93EE600();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v31 = v37;
      _os_log_impl(&dword_1B8E1E000, v37, (os_log_type_t)v36, "%@ - %s moduleItems: %s, itemsToHide: %s", (uint8_t *)v21, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
      v32 = v35;
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v32, -1, -1);
      v33 = v38;
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v33, -1, -1);
      MEMORY[0x1BCCC1CD0](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v42);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v42);
    }
  }
  else if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1B93EE9F0())
  {
    sub_1B8E93470(MEMORY[0x1E0DEE9D8]);
  }
}

id AccessoryDetailsSuggestedAutomationsItemManager.__allocating_init(delegate:sourceItem:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithDelegate_sourceItem_, a1, a2);
  swift_unknownObjectRelease();

  return v4;
}

void AccessoryDetailsSuggestedAutomationsItemManager.init(delegate:sourceItem:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccessoryDetailsSuggestedAutomationsItemManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryDetailsSuggestedAutomationsItemManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8FF8C5C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  os_log_t v16;
  uint64_t v17;
  id v18;
  _QWORD *v20;
  os_log_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_1B93EC884();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)&v0[OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule];
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B9436B60;
    *(_QWORD *)(v6 + 32) = v5;
    v25 = v6;
    sub_1B93EDF64();
    v7 = v25;
  }
  else
  {
    sub_1B93EC860();
    v8 = v0;
    v9 = sub_1B93EC86C();
    v10 = sub_1B93EE21C();
    v11 = v10;
    if (os_log_type_enabled(v9, v10))
    {
      v12 = swift_slowAlloc();
      v22 = v11;
      v13 = v12;
      v20 = (_QWORD *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v24 = (uint64_t)v8;
      v25 = v23;
      *(_DWORD *)v13 = 138412546;
      v21 = v9;
      v14 = v8;
      sub_1B93EE600();
      v15 = v20;
      *v20 = v8;

      *(_WORD *)(v13 + 12) = 2080;
      v24 = sub_1B8E3489C(0xD000000000000017, 0x80000001B9450570, &v25);
      sub_1B93EE600();
      v16 = v21;
      _os_log_impl(&dword_1B8E1E000, v21, (os_log_type_t)v22, "%@ - %s cannot build item modules without a trigger module.", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v15, -1, -1);
      v17 = v23;
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v17, -1, -1);
      MEMORY[0x1BCCC1CD0](v13, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v7 = MEMORY[0x1E0DEE9D8];
  }
  v18 = v5;
  return v7;
}

uint64_t type metadata accessor for AccessoryDetailsSuggestedAutomationsItemManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for AccessoryDetailsSuggestedAutomationsItemManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B8FF8F14(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x1E0DEE9D8];
    if (!v2)
      return v3;
    v11 = MEMORY[0x1E0DEE9D8];
    result = sub_1B8E90B1C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v11;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1BCCC05FC](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      if (objc_msgSend(v6, sel_localObject))
      {
        sub_1B93EE69C();

        swift_unknownObjectRelease();
      }
      else
      {
        memset(v10, 0, sizeof(v10));

      }
      v11 = v3;
      v9 = *(_QWORD *)(v3 + 16);
      v8 = *(_QWORD *)(v3 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_1B8E90B1C(v8 > 1, v9 + 1, 1);
        v3 = v11;
      }
      ++v5;
      *(_QWORD *)(v3 + 16) = v9 + 1;
      sub_1B8EA328C((uint64_t)v10, v3 + 32 * v9 + 32, (uint64_t *)&unk_1ED57EC00);
      if (v2 == v5)
        return v3;
    }
    __break(1u);
LABEL_18:
    sub_1B93ECF74();
    v2 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B8FF90B4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x1E0DEE9D8];
    if (!v2)
      return v3;
    v10 = MEMORY[0x1E0DEE9D8];
    result = sub_1B8E90B1C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v10;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x1BCCC05FC](v5, a1);
      else
        swift_unknownObjectRetain();
      v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_dragItem);
      if (objc_msgSend(v6, sel_localObject))
      {
        sub_1B93EE69C();
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
      }
      else
      {
        memset(v9, 0, sizeof(v9));
        swift_unknownObjectRelease();

      }
      swift_unknownObjectRelease();
      v10 = v3;
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1B8E90B1C(v7 > 1, v8 + 1, 1);
        v3 = v10;
      }
      ++v5;
      *(_QWORD *)(v3 + 16) = v8 + 1;
      sub_1B8EA328C((uint64_t)v9, v3 + 32 * v8 + 32, (uint64_t *)&unk_1ED57EC00);
      if (v2 == v5)
        return v3;
    }
    __break(1u);
LABEL_18:
    sub_1B93ECF74();
    v2 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B8FF9290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = MEMORY[0x1E0DEE9D8];
  v1 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = sub_1B93ECF74();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5)
      goto LABEL_23;
    v10 = *(_QWORD *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      v7 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_23;
      v10 = *(_QWORD *)(v1 + 8 * v7);
      if (!v10)
      {
        v7 = v9 + 2;
        if (v9 + 2 >= v5)
          goto LABEL_23;
        v10 = *(_QWORD *)(v1 + 8 * v7);
        if (!v10)
        {
          v7 = v9 + 3;
          if (v9 + 3 >= v5)
            goto LABEL_23;
          v10 = *(_QWORD *)(v1 + 8 * v7);
          if (!v10)
            break;
        }
      }
    }
LABEL_22:
    v4 = (v10 - 1) & v10;
LABEL_5:
    v8 = sub_1B93ECF74();
    result = sub_1B8EFB130(v8);
  }
  v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return v12;
  }
  v10 = *(_QWORD *)(v1 + 8 * v11);
  if (v10)
  {
    v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v7 >= v5)
      goto LABEL_23;
    v10 = *(_QWORD *)(v1 + 8 * v7);
    ++v11;
    if (v10)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B8FF93FC@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, _OWORD *a7@<X8>)
{
  uint64_t *v7;
  char *v8;
  _QWORD *v9;
  uint64_t *v10;
  char *v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  id *v34;
  char *v35;
  char *v36;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  unint64_t v48;
  int8x8_t v49;
  unint64_t v50;
  unint64_t v51;
  int64x2_t v52;
  int64x2_t *v53;
  unint64_t v54;
  int64x2_t v55;
  int8x16_t v56;
  uint64_t v57;
  unint64_t v58;
  int8x8_t *v59;
  int8x8_t v60;
  int8x8_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  _QWORD *v69;
  int v70;
  char *v71;
  BOOL v72;
  uint64_t v73;
  BOOL v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  BOOL v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  id v91;
  char v92;
  id v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  char v99;
  unint64_t v100;
  char v101;
  __int128 v102;
  uint64_t v103;
  id v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t *v108;
  id v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  id v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t i;
  uint64_t *v125;
  id v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  id v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t *v146;
  void *v147;
  char *v148;
  id v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  char *v158;
  char v159;
  unint64_t v160;
  uint64_t result;
  uint64_t v162;
  uint64_t v163;
  unsigned __int8 v164;
  uint64_t v165;
  uint64_t v166;
  unsigned __int8 v167;
  _OWORD *v168;
  __int128 v169;
  _OWORD *v170;
  __int128 v171;
  char v172[8];
  uint64_t v173;
  id *v174;
  uint64_t *v175;
  _QWORD *v176;
  uint64_t v177;
  unint64_t v178;
  id *v179;
  uint64_t v180;
  uint64_t v181;
  _OWORD *v182;
  uint64_t *v183;
  uint64_t v184;
  char *v185;
  __int128 v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _QWORD *v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  id v194;
  id v195;
  uint64_t v196;
  char *v197;
  char *v198;
  uint64_t v199;
  char *v200;
  uint64_t v201[5];
  __int128 v202;
  uint64_t v203;
  uint64_t v204;
  unsigned __int8 v205;
  _QWORD *v206;
  uint64_t v207;
  unsigned __int8 v208;
  uint64_t v209;
  char *v210;
  __int128 v211;
  uint64_t v212;
  uint64_t v213;
  unsigned __int8 v214;
  uint64_t *v215;
  uint64_t v216;
  unsigned __int8 v217;
  uint64_t v218;

  v10 = v7;
  v185 = (char *)a5;
  v182 = a7;
  v210 = a1;
  if ((a6 & 1) != 0)
  {
    a4 = *v10;
    if (!*(_QWORD *)(*v10 + 16))
    {
LABEL_316:
      __break(1u);
LABEL_317:
      __break(1u);
LABEL_318:
      __break(1u);
LABEL_319:
      __break(1u);
LABEL_320:
      __break(1u);
      goto LABEL_321;
    }
    v15 = a1;
    v16 = sub_1B8E41A8C((uint64_t)v15);
    if ((v17 & 1) == 0)
      goto LABEL_317;
    v18 = *(_QWORD *)(a4 + 56) + 32 * v16;
    a4 = *(_QWORD *)(v18 + 16);
    v185 = *(char **)(v18 + 24);

  }
  v19 = floor((double)a3 * 0.5);
  v20 = v19 + v19;
  if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
    goto LABEL_303;
  if (v20 <= -9.22337204e18)
  {
LABEL_304:
    __break(1u);
    goto LABEL_305;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_305:
    __break(1u);
    goto LABEL_306;
  }
  v21 = *(_QWORD *)(v10[5] + 16);
  v22 = __OFSUB__(v21, a4);
  v23 = v21 - a4;
  if (v22)
  {
LABEL_306:
    __break(1u);
LABEL_307:
    __break(1u);
LABEL_308:
    __break(1u);
LABEL_309:
    __break(1u);
    goto LABEL_310;
  }
  v184 = a4;
  v24 = (uint64_t)v20;
  if (v23 >= a2)
    v25 = a2;
  else
    v25 = v23;
  v26 = *v10;
  v27 = v10[1];
  if (*(_QWORD *)(*v10 + 16))
  {
    v28 = sub_1B8E41A8C((uint64_t)a1);
    if ((v29 & 1) != 0)
    {
      v30 = *(_QWORD *)(v26 + 56);
      v31 = (_QWORD *)(v30 + 32 * v28);
      if (*v31 == v25
        && v31[1] == v24
        && *(_QWORD *)(v30 + 32 * v28 + 16) == v184
        && *(_QWORD *)(v30 + 32 * v28 + 24) == (_QWORD)v185)
      {
        v169 = *((_OWORD *)v10 + 3);
        v170 = v182;
        v182[2] = *((_OWORD *)v10 + 2);
        v170[3] = v169;
        *((_QWORD *)v170 + 8) = v10[8];
        v171 = *((_OWORD *)v10 + 1);
        *v170 = *(_OWORD *)v10;
        v170[1] = v171;
        return sub_1B8EA31E4((uint64_t)v10);
      }
    }
  }
  v33 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v202 = sub_1B8E3A45C(MEMORY[0x1E0DEE9D8]);
  *((_QWORD *)&v202 + 1) = v27;
  v203 = sub_1B8E3A374(0, v27);
  v204 = 0;
  v205 = 1;
  v206 = (_QWORD *)v33;
  v207 = 0;
  v208 = 1;
  v209 = v33;
  v201[0] = (uint64_t)a1;
  *(_QWORD *)&v211 = v25;
  *((_QWORD *)&v211 + 1) = v24;
  v8 = v185;
  v212 = v184;
  v213 = (uint64_t)v185;
  MEMORY[0x1E0C80A78](v203);
  v179 = v34;
  v174 = v34;
  v175 = v201;
  v35 = a1;
  sub_1B8E41BE8((uint64_t)sub_1B9001220);

  v36 = v210;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v211 = v202;
  *(_QWORD *)&v202 = 0x8000000000000000;
  v180 = v25;
  v181 = v24;
  sub_1B8E41934(v25, v24, v184, (uint64_t)v185, v36, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)&v202 = v211;

  v38 = swift_bridgeObjectRelease();
  v39 = v10[8];
  MEMORY[0x1E0C80A78](v38);
  v174 = (id *)&v210;
  v175 = v10;
  sub_1B93ECF74();
  v40 = sub_1B8EDA254((void (*)(uint64_t *__return_ptr, id *))sub_1B9001228, (uint64_t)v172, v39);
  v177 = 0;
  v178 = v39;
  swift_bridgeObjectRelease();
  v188 = v40[2];
  if (!v188)
  {
    swift_bridgeObjectRelease();
    goto LABEL_237;
  }
  v183 = &v209;
  v190 = v40 + 4;
  v176 = v40;
  sub_1B93ECF74();
  v41 = 0;
  while (2)
  {
    v44 = &v190[3 * v41];
    v45 = *(_OWORD *)(v44 + 1);
    v46 = *((_QWORD *)&v202 + 1);
    a4 = v44[2];
    if (*((uint64_t *)&v202 + 1) < a4)
      goto LABEL_27;
    v47 = (uint64_t *)v203;
    v48 = *(_QWORD *)(v203 + 16);
    if (v48)
    {
      v49 = *(int8x8_t *)(v203 + 32);
      v50 = v48 - 1;
      if (v48 != 1)
      {
        if (v48 < 5)
        {
          v51 = 1;
          goto LABEL_37;
        }
        v51 = v50 & 0xFFFFFFFFFFFFFFFCLL | 1;
        v52 = vdupq_n_s64(*(_QWORD *)&v49);
        v53 = (int64x2_t *)(v203 + 56);
        v54 = v50 & 0xFFFFFFFFFFFFFFFCLL;
        v55 = v52;
        do
        {
          v52 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v52, v53[-1]), (int8x16_t)v53[-1], (int8x16_t)v52);
          v55 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v55, *v53), *(int8x16_t *)v53, (int8x16_t)v55);
          v53 += 2;
          v54 -= 4;
        }
        while (v54);
        v56 = vbslq_s8((int8x16_t)vcgtq_s64(v55, v52), (int8x16_t)v52, (int8x16_t)v55);
        v57 = vextq_s8(v56, v56, 8uLL).u64[0];
        v49 = vbsl_s8((int8x8_t)vcgtd_s64(v57, v56.i64[0]), *(int8x8_t *)v56.i8, (int8x8_t)v57);
        if (v50 != (v50 & 0xFFFFFFFFFFFFFFFCLL))
        {
LABEL_37:
          v58 = v48 - v51;
          v59 = (int8x8_t *)(v203 + 8 * v51 + 32);
          do
          {
            v61 = *v59++;
            v60 = v61;
            if (*(_QWORD *)&v61 < *(_QWORD *)&v49)
              v49 = v60;
            --v58;
          }
          while (v58);
        }
      }
    }
    else
    {
      v49 = 0;
    }
    v9 = v206;
    v10 = (uint64_t *)v206[2];
    v62 = (char *)v10 + 5;
    if (__OFADD__(v10, 5))
      goto LABEL_292;
    v189 = v41;
    v195 = (id)*v44;
    v63 = v204;
    v64 = v207;
    v186 = v45;
    v8 = (char *)v45;
    LODWORD(v198) = v208;
    LODWORD(v199) = v205;
    v65 = (uint64_t)v49;
    if ((sub_1B8EA0B5C(*(_QWORD *)&v49, 0, v45, a4, *((uint64_t *)&v202 + 1), v204, v205, (uint64_t)v206) & 1) == 0)
    {
      v67 = 0;
      v71 = &v8[v65];
      v72 = __OFADD__(v65, v8);
      v66 = v65;
      if (v72)
        goto LABEL_300;
      goto LABEL_129;
    }
    if (v65 >= (uint64_t)v62)
      goto LABEL_26;
    v66 = v65;
    v67 = 0;
    v68 = __OFSUB__(v64, 1);
    v69 = v9 + 4;
    v41 = v189;
    v70 = (int)v198;
    while (1)
    {
      if (v70)
      {
        if (__OFADD__(v67, 1))
          goto LABEL_293;
        if (v67 + 1 < v46)
        {
          ++v67;
        }
        else
        {
          ++v66;
          v67 = 0;
        }
        if ((v199 & 1) != 0)
          goto LABEL_82;
        goto LABEL_76;
      }
      if (!v64)
        goto LABEL_294;
      if (v64 == -1 && v66 == 0x8000000000000000)
        goto LABEL_307;
      if (v68)
        goto LABEL_295;
      v73 = v66 % v64;
      if (v66 % v64 < v64 - 1)
      {
        ++v66;
        if ((v199 & 1) != 0)
          goto LABEL_82;
        goto LABEL_76;
      }
      v22 = __OFADD__(v67++, 1);
      if (v22)
        goto LABEL_308;
      v22 = __OFSUB__(v66, v73);
      v66 -= v73;
      v74 = v22;
      if (v67 >= v46)
        break;
      if (v74)
        goto LABEL_318;
      if ((v199 & 1) != 0)
        goto LABEL_82;
LABEL_76:
      if (!v63)
        goto LABEL_296;
      if (v63 == -1 && v66 == 0x8000000000000000)
        goto LABEL_309;
      v75 = &v8[v66 % v63];
      if (__OFADD__(v66 % v63, v8))
        goto LABEL_297;
      v22 = __OFSUB__(v75, 1);
      v76 = (uint64_t)(v75 - 1);
      if (v22)
        goto LABEL_299;
      if (v76 < v63)
        goto LABEL_82;
LABEL_54:
      if (v66 >= (uint64_t)v62)
        goto LABEL_27;
    }
    if (v74)
      goto LABEL_319;
    v22 = __OFADD__(v66, v64);
    v66 += v64;
    if (v22)
      goto LABEL_320;
    v67 = 0;
    if ((v199 & 1) == 0)
      goto LABEL_76;
LABEL_82:
    if (v66 < 0 || v67 < 0)
      goto LABEL_54;
    v77 = v67 + a4;
    if (__OFADD__(v67, a4))
      goto LABEL_298;
    if (v46 < v77)
      goto LABEL_54;
    v78 = &v8[v66];
    v79 = __OFADD__(v66, v8);
    if (__OFADD__(v66, v8))
    {
LABEL_310:
      __break(1u);
      goto LABEL_311;
    }
    if ((uint64_t)v78 < v66)
    {
LABEL_311:
      __break(1u);
LABEL_312:
      __break(1u);
      goto LABEL_313;
    }
    v80 = &v8[v66];
    if ((char *)v66 != v78)
    {
      if (v77 >= v67)
      {
        if (v66 >= (uint64_t)v78)
          goto LABEL_276;
        v81 = v67 + 1;
        v82 = v66;
        while (1)
        {
          v83 = v82 + 1;
          if (v67 == v77)
          {
            if ((char *)v83 == v80)
              goto LABEL_128;
          }
          else
          {
            if (v67 >= v77)
              goto LABEL_278;
            if (v82 < (uint64_t)v10)
            {
              if (v82 < 0)
                goto LABEL_281;
              v84 = v69[v82];
              if (v67 >= *(_QWORD *)(v84 + 16))
                goto LABEL_282;
              if (*(_QWORD *)(v84 + 8 * v67 + 32))
              {
LABEL_53:
                v41 = v189;
                v70 = (int)v198;
                goto LABEL_54;
              }
            }
            if (v81 != v77)
            {
              if (v81 >= v77)
                goto LABEL_283;
              if (v82 < (uint64_t)v10)
              {
                v85 = v69[v82];
                if ((unint64_t)v81 >= *(_QWORD *)(v85 + 16))
                  goto LABEL_302;
                if (*(_QWORD *)(v85 + 8 * v81 + 32))
                  goto LABEL_53;
              }
              v86 = v67 + 6;
              v87 = a4 - 2;
              if (v67 + 2 != v77)
              {
                while (1)
                {
                  v88 = v86 - 4;
                  if (v67 > 0x7FFFFFFFFFFFFFFDLL || v88 >= v77)
                    break;
                  if (v82 < (uint64_t)v10)
                  {
                    if (v88 < 0)
                      goto LABEL_274;
                    v90 = v69[v82];
                    if ((unint64_t)v88 >= *(_QWORD *)(v90 + 16))
                      goto LABEL_275;
                    if (*(_QWORD *)(v90 + 8 * v86))
                      goto LABEL_53;
                  }
                  ++v86;
                  if (!--v87)
                    goto LABEL_109;
                }
LABEL_271:
                __break(1u);
LABEL_272:
                __break(1u);
LABEL_273:
                __break(1u);
LABEL_274:
                __break(1u);
LABEL_275:
                __break(1u);
LABEL_276:
                __break(1u);
LABEL_277:
                __break(1u);
LABEL_278:
                __break(1u);
LABEL_279:
                __break(1u);
LABEL_280:
                __break(1u);
LABEL_281:
                __break(1u);
LABEL_282:
                __break(1u);
LABEL_283:
                __break(1u);
LABEL_284:
                __break(1u);
LABEL_285:
                __break(1u);
LABEL_286:
                __break(1u);
LABEL_287:
                __break(1u);
LABEL_288:
                __break(1u);
LABEL_289:
                __break(1u);
LABEL_290:
                __break(1u);
LABEL_291:
                __break(1u);
LABEL_292:
                __break(1u);
LABEL_293:
                __break(1u);
LABEL_294:
                __break(1u);
LABEL_295:
                __break(1u);
LABEL_296:
                __break(1u);
LABEL_297:
                __break(1u);
LABEL_298:
                __break(1u);
LABEL_299:
                __break(1u);
LABEL_300:
                __break(1u);
LABEL_301:
                __break(1u);
LABEL_302:
                __break(1u);
LABEL_303:
                __break(1u);
                goto LABEL_304;
              }
            }
LABEL_109:
            if ((char *)v83 == v80)
              goto LABEL_128;
          }
          if (v83 >= v66)
          {
            ++v82;
            if (v83 < (uint64_t)v80)
              continue;
          }
          goto LABEL_276;
        }
      }
LABEL_313:
      __break(1u);
LABEL_314:
      __break(1u);
      goto LABEL_315;
    }
LABEL_128:
    v71 = &v8[v66];
    if (v79)
      goto LABEL_300;
LABEL_129:
    if ((uint64_t)v71 < v66)
      goto LABEL_301;
    v187 = v66;
    v199 = v67;
    if ((char *)v66 != v71)
    {
      v22 = __OFADD__(v67, a4);
      a4 += v67;
      if (v22)
        goto LABEL_314;
      if (a4 >= v67)
      {
        v10 = v47;
        v191 = v67 + 1;
        v8 = (char *)(8 * v46 - 8);
        v192 = v71;
        v104 = v195;
        v105 = v192;
        v193 = a4;
        v194 = v104;
        v196 = v187 + 1;
        v106 = (char *)v187;
        v107 = a4;
        while ((uint64_t)v106 < (uint64_t)v105)
        {
          v197 = v106;
          v198 = v106 + 1;
          if (v199 != v107)
          {
            if (v199 >= v107)
              goto LABEL_280;
            if (v199 < v46)
            {
              v108 = v10;
              v10 = (uint64_t *)v9[2];
              a4 = v198 - (char *)v10;
              if (__OFSUB__(v198, v10))
                goto LABEL_284;
              v109 = v194;
              if (a4 >= 1)
              {
                v110 = (v196 - (_QWORD)v10) & ~((v196 - (uint64_t)v10) >> 63);
                v10 = v108;
                while ((v46 & 0x8000000000000000) == 0)
                {
                  if (v46)
                  {
                    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57EAB0);
                    v111 = (_QWORD *)sub_1B93EDFA0();
                    v111[2] = v46;
                    *(_QWORD *)&v211 = v111;
                    v111[4] = 0;
                    if (v46 != 1)
                      bzero(v111 + 5, 8 * v46 - 8);
                  }
                  else
                  {
                    *(_QWORD *)&v211 = MEMORY[0x1E0DEE9D8];
                  }
                  sub_1B93EDF64();
                  v112 = v211;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v9 = sub_1B8E42070(0, v9[2] + 1, 1, v9);
                  v114 = v9[2];
                  v113 = v9[3];
                  a4 = v114 + 1;
                  if (v114 >= v113 >> 1)
                    v9 = sub_1B8E42070((_QWORD *)(v113 > 1), v114 + 1, 1, v9);
                  v9[2] = a4;
                  v9[v114 + 4] = v112;
                  if (!--v110)
                    goto LABEL_160;
                }
LABEL_324:
                LODWORD(v174) = 0;
                v173 = 936;
                v172[0] = 2;
                sub_1B93EE9C0();
                __break(1u);
                goto LABEL_325;
              }
              v10 = v108;
LABEL_160:
              v115 = v109;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v9 = sub_1B8EA0224(v9);
              if (((unint64_t)v197 & 0x8000000000000000) != 0)
                goto LABEL_285;
              if ((unint64_t)v197 >= v9[2])
                goto LABEL_286;
              a4 = (uint64_t)&v9[(_QWORD)v197 + 4];
              v116 = *(_QWORD *)a4;
              v117 = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)a4 = v116;
              if ((v117 & 1) == 0)
                sub_1B8EA0210();
              if (v199 < 0)
                goto LABEL_287;
              if ((unint64_t)v199 >= *(_QWORD *)(v116 + 16))
                goto LABEL_288;
              v118 = v116 + 8 * v199;
              v119 = *(void **)(v118 + 32);
              *(_QWORD *)(v118 + 32) = v195;

              sub_1B93EDF64();
              v206 = v9;
              if (v199 >= (unint64_t)v10[2])
                goto LABEL_289;
              a4 = v10[v199 + 4];
              v120 = v9[2];
              if (v120 < a4)
                goto LABEL_290;
              if (a4 < v120)
              {
                v121 = v10[v199 + 4];
                while ((a4 & 0x8000000000000000) == 0)
                {
                  v122 = v9[v121 + 4];
                  if (v199 >= *(_QWORD *)(v122 + 16))
                    goto LABEL_273;
                  if (!*(_QWORD *)(v122 + 8 * v199 + 32))
                  {
                    a4 = v121;
                    goto LABEL_177;
                  }
                  if (v120 == ++v121)
                  {
                    a4 = v9[2];
                    goto LABEL_177;
                  }
                }
                goto LABEL_272;
              }
LABEL_177:
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v10 = sub_1B8EA01FC(v10);
              if (v199 >= v10[2])
                goto LABEL_291;
              v10[v199 + 4] = a4;

              v203 = (uint64_t)v10;
            }
            for (i = v191; i != v107; ++i)
            {
              if (v199 == 0x7FFFFFFFFFFFFFFFLL || i >= v107)
              {
LABEL_260:
                __break(1u);
LABEL_261:
                __break(1u);
LABEL_262:
                __break(1u);
LABEL_263:
                __break(1u);
LABEL_264:
                __break(1u);
LABEL_265:
                __break(1u);
LABEL_266:
                __break(1u);
LABEL_267:
                __break(1u);
LABEL_268:
                __break(1u);
LABEL_269:
                __break(1u);
LABEL_270:
                __break(1u);
                goto LABEL_271;
              }
              if (i < v46)
              {
                v125 = v10;
                v10 = (uint64_t *)v9[2];
                a4 = v198 - (char *)v10;
                if (__OFSUB__(v198, v10))
                  goto LABEL_263;
                v126 = v194;
                if (a4 >= 1)
                {
                  v127 = (v196 - (_QWORD)v10) & ~((v196 - (uint64_t)v10) >> 63);
                  while ((v46 & 0x8000000000000000) == 0)
                  {
                    if (v46)
                    {
                      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57EAB0);
                      v128 = (_QWORD *)sub_1B93EDFA0();
                      v128[2] = v46;
                      *(_QWORD *)&v211 = v128;
                      v128[4] = 0;
                      if (v46 != 1)
                        bzero(v128 + 5, 8 * v46 - 8);
                    }
                    else
                    {
                      *(_QWORD *)&v211 = MEMORY[0x1E0DEE9D8];
                    }
                    sub_1B93EDF64();
                    v129 = v211;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                      v9 = sub_1B8E42070(0, v9[2] + 1, 1, v9);
                    v131 = v9[2];
                    v130 = v9[3];
                    a4 = v131 + 1;
                    if (v131 >= v130 >> 1)
                      v9 = sub_1B8E42070((_QWORD *)(v130 > 1), v131 + 1, 1, v9);
                    v9[2] = a4;
                    v9[v131 + 4] = v129;
                    if (!--v127)
                      goto LABEL_204;
                  }
                  goto LABEL_324;
                }
LABEL_204:
                v132 = v126;
                v10 = v125;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v9 = sub_1B8EA0224(v9);
                v107 = v193;
                if (((unint64_t)v197 & 0x8000000000000000) != 0)
                  goto LABEL_264;
                if ((unint64_t)v197 >= v9[2])
                  goto LABEL_265;
                a4 = (uint64_t)&v9[(_QWORD)v197 + 4];
                v133 = *(_QWORD *)a4;
                v134 = swift_isUniquelyReferenced_nonNull_native();
                *(_QWORD *)a4 = v133;
                if ((v134 & 1) == 0)
                  sub_1B8EA0210();
                if (i < 0)
                  goto LABEL_266;
                if ((unint64_t)i >= *(_QWORD *)(v133 + 16))
                  goto LABEL_267;
                v135 = v133 + 8 * i;
                v136 = *(void **)(v135 + 32);
                *(_QWORD *)(v135 + 32) = v195;

                sub_1B93EDF64();
                v206 = v9;
                if (i >= (unint64_t)v10[2])
                  goto LABEL_268;
                a4 = v10[i + 4];
                v137 = v9[2];
                if (v137 < a4)
                  goto LABEL_269;
                if (a4 < v137)
                {
                  v138 = v10[i + 4];
                  while ((a4 & 0x8000000000000000) == 0)
                  {
                    v139 = v9[v138 + 4];
                    if (i >= *(_QWORD *)(v139 + 16))
                      goto LABEL_235;
                    if (!*(_QWORD *)(v139 + 8 * i + 32))
                    {
                      a4 = v138;
                      goto LABEL_221;
                    }
                    if (v137 == ++v138)
                    {
                      a4 = v9[2];
                      goto LABEL_221;
                    }
                  }
                  __break(1u);
LABEL_235:
                  __break(1u);
                  goto LABEL_236;
                }
LABEL_221:
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v10 = sub_1B8EA01FC(v10);
                if (i >= v10[2])
                  goto LABEL_270;
                v10[i + 4] = a4;

                v203 = (uint64_t)v10;
              }
            }
          }
          ++v196;
          v106 = v198;
          v105 = v192;
          if (v198 == v192)
            goto LABEL_132;
        }
        goto LABEL_277;
      }
LABEL_315:
      __break(1u);
      goto LABEL_316;
    }
    v91 = v195;
LABEL_132:
    v92 = swift_isUniquelyReferenced_nonNull_native();
    a4 = v202;
    *(_QWORD *)&v211 = v202;
    *(_QWORD *)&v202 = 0x8000000000000000;
    v93 = v195;
    v95 = sub_1B8E41A8C((uint64_t)v195);
    v96 = *(_QWORD *)(a4 + 16);
    v97 = (v94 & 1) == 0;
    v98 = v96 + v97;
    if (__OFADD__(v96, v97))
      goto LABEL_312;
    v99 = v94;
    if (*(_QWORD *)(a4 + 24) >= v98)
    {
      v102 = v186;
      v103 = v187;
      if ((v92 & 1) != 0)
      {
        a4 = v211;
        if ((v94 & 1) == 0)
          goto LABEL_229;
      }
      else
      {
        sub_1B8E9E13C();
        v103 = v187;
        v102 = v186;
        a4 = v211;
        if ((v99 & 1) == 0)
          goto LABEL_229;
      }
      goto LABEL_22;
    }
    sub_1B8E41D9C(v98, v92);
    v100 = sub_1B8E41A8C((uint64_t)v93);
    if ((v99 & 1) != (v101 & 1))
    {
LABEL_325:
      sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
      result = sub_1B93EEB64();
      __break(1u);
      return result;
    }
    v95 = v100;
    v102 = v186;
    v103 = v187;
    a4 = v211;
    if ((v99 & 1) != 0)
    {
LABEL_22:
      v42 = *(_QWORD *)(a4 + 56) + 32 * v95;
      *(_QWORD *)v42 = v103;
      *(_QWORD *)(v42 + 8) = v199;
      *(_OWORD *)(v42 + 16) = v102;
      goto LABEL_23;
    }
LABEL_229:
    *(_QWORD *)(a4 + 8 * (v95 >> 6) + 64) |= 1 << v95;
    *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v95) = v93;
    v140 = *(_QWORD *)(a4 + 56) + 32 * v95;
    *(_QWORD *)v140 = v103;
    *(_QWORD *)(v140 + 8) = v199;
    *(_OWORD *)(v140 + 16) = v102;
    v141 = *(_QWORD *)(a4 + 16);
    v22 = __OFADD__(v141, 1);
    v142 = v141 + 1;
    if (v22)
    {
LABEL_321:
      __break(1u);
      goto LABEL_322;
    }
    *(_QWORD *)(a4 + 16) = v142;
    v143 = v93;
LABEL_23:
    *(_QWORD *)&v202 = a4;

    swift_bridgeObjectRelease();
    v43 = v93;
    MEMORY[0x1BCCBFCCC]();
    if (*(_QWORD *)((v209 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v209 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B93EDF7C();
    sub_1B93EDFB8();
    sub_1B93EDF64();

LABEL_26:
    v41 = v189;
LABEL_27:
    if (++v41 != v188)
      continue;
    break;
  }
LABEL_236:
  swift_bridgeObjectRelease_n();
LABEL_237:
  v8 = v210;
  v10 = v206;
  a4 = v206[2];
  if (a4)
  {
    v9 = (_QWORD *)*((_QWORD *)&v202 + 1);
    if ((*((_QWORD *)&v202 + 1) & 0x8000000000000000) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
LABEL_240:
        v144 = 0;
        v198 = (char *)(v10 + 4);
        v199 = a4;
        do
        {
          if (v144 == a4)
            goto LABEL_279;
          if (v9)
          {
            v145 = 0;
            v146 = (uint64_t *)&v198[8 * v144];
            while (v144 < v10[2])
            {
              if (v145 >= *(_QWORD *)(*v146 + 16))
                goto LABEL_259;
              v147 = *(void **)(*v146 + 8 * v145 + 32);
              if (v147)
              {
                sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
                v148 = v8;
                v149 = v147;
                a4 = sub_1B93EE4EC();

                if ((a4 & 1) != 0)
                {
                  if (v144 >= v10[2])
                    goto LABEL_261;
                  a4 = *v146;
                  v150 = swift_isUniquelyReferenced_nonNull_native();
                  *v146 = a4;
                  if ((v150 & 1) == 0)
                    sub_1B8EA0210();
                  if (v145 >= *(_QWORD *)(a4 + 16))
                    goto LABEL_262;
                  v151 = a4 + 8 * v145;

                  *(_QWORD *)(v151 + 32) = 0;
                  a4 = (uint64_t)v146;
                  sub_1B93EDF64();
                }
              }
              if (v9 == (_QWORD *)++v145)
                goto LABEL_241;
            }
            __break(1u);
LABEL_259:
            __break(1u);
            goto LABEL_260;
          }
LABEL_241:
          ++v144;
          a4 = v199;
        }
        while (v144 != v199);
        v206 = v10;
        goto LABEL_256;
      }
LABEL_323:
      v10 = sub_1B8EA0224(v10);
      goto LABEL_240;
    }
LABEL_322:
    __break(1u);
    goto LABEL_323;
  }
LABEL_256:
  v211 = v202;
  v212 = v203;
  v213 = v204;
  v214 = v205;
  v215 = v10;
  v216 = v207;
  v217 = v208;
  v218 = v209;
  v152 = sub_1B8FFA86C(v180, v181, v184, (uint64_t)v185, v201);
  v153 = v201[0];
  v154 = v201[1];
  v155 = v201[2];
  v156 = v201[3];
  v200 = v8;
  MEMORY[0x1E0C80A78](v152);
  v174 = v179;
  v175 = (uint64_t *)&v200;
  v157 = v8;
  sub_1B8E41BE8((uint64_t)sub_1B90012C0);

  v158 = v210;
  v159 = swift_isUniquelyReferenced_nonNull_native();
  v201[0] = v202;
  *(_QWORD *)&v202 = 0x8000000000000000;
  sub_1B8E41934(v153, v154, v155, v156, v158, v159);
  *(_QWORD *)&v202 = v201[0];

  swift_bridgeObjectRelease();
  v160 = v178;
  sub_1B93ECF74();
  result = swift_bridgeObjectRelease();
  v162 = v203;
  v163 = v204;
  v164 = v205;
  v165 = (uint64_t)v206;
  v166 = v207;
  v167 = v208;
  v168 = v182;
  *v182 = v202;
  *((_QWORD *)v168 + 2) = v162;
  *((_QWORD *)v168 + 3) = v163;
  *((_BYTE *)v168 + 32) = v164;
  *((_QWORD *)v168 + 5) = v165;
  *((_QWORD *)v168 + 6) = v166;
  *((_BYTE *)v168 + 56) = v167;
  *((_QWORD *)v168 + 8) = v160;
  return result;
}

unint64_t sub_1B8FFA7C0(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  id v6;
  char v7;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  result = sub_1B93EE4EC();
  v6 = 0;
  if ((result & 1) != 0)
    return (unint64_t)v6;
  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
  {
    v6 = a1;
    result = sub_1B8E41A8C((uint64_t)v6);
    if ((v7 & 1) != 0)
      return (unint64_t)v6;
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B8FFA86C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a2;
  v9 = result;
  v10 = *(_QWORD *)(v5 + 8);
  v11 = *(_QWORD *)(v5 + 24);
  v12 = *(_QWORD *)(v5 + 40);
  v13 = *(_BYTE *)(v5 + 32) & 1;
  v14 = a2 + a4;
  v15 = __OFADD__(a2, a4);
  do
  {
    v16 = __OFSUB__(v9--, 1);
    if (v16)
    {
      __break(1u);
      goto LABEL_39;
    }
    if (!v13)
    {
      if (!v11)
        goto LABEL_42;
      if (v11 == -1 && v9 == 0x8000000000000000)
        goto LABEL_47;
      v17 = v9 % v11 + a3;
      if (__OFADD__(v9 % v11, a3))
        goto LABEL_43;
      v16 = __OFSUB__(v17, 1);
      v18 = v17 - 1;
      if (v16)
        goto LABEL_44;
      if (v18 >= v11)
        break;
    }
    if (v9 < 0 || v8 < 0)
      break;
    if (v15)
      goto LABEL_40;
    if (v10 < v14)
      break;
    result = sub_1B8EA0B5C(v9, v8, a3, a4, v10, v11, v13, v12);
  }
  while ((result & 1) == 0);
  v16 = __OFADD__(v9, 1);
  v19 = v9 + 1;
  if (v16)
    goto LABEL_49;
  v21 = v11 == -1 && v19 == 0x8000000000000000;
  v22 = v19 % v11;
  while (1)
  {
    v16 = __OFSUB__(v8--, 1);
    if (v16)
      break;
    if (v13)
      goto LABEL_53;
    if (v21)
      goto LABEL_48;
    v23 = v22 + a3;
    if (__OFADD__(v22, a3))
      goto LABEL_45;
    v16 = __OFSUB__(v23, 1);
    v24 = v23 - 1;
    if (v16)
      goto LABEL_46;
    if (v24 < v11)
    {
LABEL_53:
      if ((v19 & 0x8000000000000000) == 0 && (v8 & 0x8000000000000000) == 0)
      {
        if (__OFADD__(v8, a4))
          goto LABEL_41;
        if (v10 >= v8 + a4)
        {
          result = sub_1B8EA0B5C(v19, v8, a3, a4, v10, v11, v13, v12);
          if ((result & 1) == 0)
            continue;
        }
      }
    }
    if (__OFADD__(v8, 1))
      goto LABEL_50;
    *a5 = v19;
    a5[1] = v8 + 1;
    a5[2] = a3;
    a5[3] = a4;
    return result;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_1B8FFAA34()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  char v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint8_t *v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  unint64_t v59;
  _OWORD v60[4];
  unint64_t v61;

  v1 = swift_allocObject();
  v2 = MEMORY[0x1E0DEE9D8];
  v39 = v1;
  *(_QWORD *)(v1 + 16) = MEMORY[0x1E0DEE9D8];
  v3 = v0[1];
  v4 = v0[6];
  v44 = (_QWORD *)(v1 + 16);
  v45 = v0[5];
  v40 = v0;
  v5 = *((unsigned __int8 *)v0 + 56);
  v6 = sub_1B8E7F914(v2);
  if (v5)
    v7 = 0;
  else
    v7 = v4;
  *(_QWORD *)&v55 = v6;
  *((_QWORD *)&v55 + 1) = v3;
  v41 = v3;
  *(_QWORD *)&v56 = sub_1B8E3A374(0, v3);
  *((_QWORD *)&v56 + 1) = v7;
  LOBYTE(v57) = v5;
  *((_QWORD *)&v57 + 1) = v2;
  *(_QWORD *)&v58 = v4;
  BYTE8(v58) = v5;
  v59 = v2;
  if (v2 >> 62)
    goto LABEL_53;
  v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_6:
  v47 = *v40;
  if (v8 < *(_QWORD *)(*v40 + 16))
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v44;
    v14 = &unk_1EF226000;
    v15 = 1;
    do
    {
      v60[1] = v56;
      v60[2] = v57;
      v60[3] = v58;
      v61 = v59;
      v60[0] = v55;
      sub_1B8EA31E4((uint64_t)v60);
      sub_1B8E9A2A4(1, 1, (uint64_t)&v50);
      sub_1B8EA3238((uint64_t)v60);
      if ((v54 & 1) != 0)
      {
        sub_1B8EA3238((uint64_t)v60);
        sub_1B8FFB058(v39);
LABEL_45:
        swift_beginAccess();
        v35 = sub_1B93ECF74();
        sub_1B8FFB2E0(v35);
        v37 = v36;
        swift_release();
        swift_bridgeObjectRelease();
        return v37;
      }
      v46 = v10;
      v42 = v12;
      v43 = v11;
      v16 = v50;
      v17 = v51;
      v48 = v53;
      v49 = v52;
      v18 = *(_QWORD *)(v45 + 16);
      if (v50 >= v18 || v51 >= v41)
        goto LABEL_21;
      if (v50 < 0)
      {
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        sub_1B93ECF74();
        v8 = sub_1B93EE9F0();
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      if (v51 < 0)
        goto LABEL_49;
      v19 = *(_QWORD *)(v45 + 32 + 8 * v50);
      if ((unint64_t)v51 >= *(_QWORD *)(v19 + 16))
        goto LABEL_50;
      v20 = *(void **)(v19 + 8 * v51 + 32);
      if (v20)
      {
        sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
        sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
        v21 = v20;
        sub_1B93EE7EC();
        if (!*(_QWORD *)(v47 + 16))
          goto LABEL_51;
        v22 = sub_1B8E41A8C((uint64_t)v21);
        if ((v23 & 1) == 0)
          goto LABEL_52;
        sub_1B8F1CCC4((uint64_t)&v50, *(_QWORD *)(*(_QWORD *)(v47 + 56) + 32 * v22), *(_QWORD *)(*(_QWORD *)(v47 + 56) + 32 * v22 + 8), *(_QWORD *)(*(_QWORD *)(v47 + 56) + 32 * v22 + 16), *(_QWORD *)(*(_QWORD *)(v47 + 56) + 32 * v22 + 24));
        sub_1B8E963DC((uint64_t)&v50);
        v24 = v21;
        MEMORY[0x1BCCBFCCC]();
        if (*(_QWORD *)((*v44 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v44 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B93EDF7C();
        sub_1B93EDFB8();
        sub_1B93EDF64();

        v13 = v44;
        v14 = &unk_1EF226000;
        if ((v15 & 1) != 0)
        {
LABEL_36:
          if (v18 < v16)
            goto LABEL_44;
          goto LABEL_37;
        }
      }
      else
      {
LABEL_21:
        if (qword_1EF2077E8 != -1)
          swift_once();
        v25 = *((_QWORD *)v14 + 441);
        sub_1B93EE21C();
        sub_1B93EC824();
        v26 = sub_1B93EE234();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = swift_slowAlloc();
          *(_DWORD *)v27 = 134218240;
          *(_QWORD *)(v27 + 4) = v16;
          *(_WORD *)(v27 + 12) = 2048;
          *(_QWORD *)(v27 + 14) = v17;
          _os_log_impl(&dword_1B8E1E000, v25, v26, "AdaptiveTileLayout: position %ld,%ld", (uint8_t *)v27, 0x16u);
          v28 = v27;
          v13 = v44;
          MEMORY[0x1BCCC1CD0](v28, -1, -1);
        }
        v29 = *((_QWORD *)v14 + 441);
        v30 = sub_1B93EE234();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_1B8E1E000, v29, v30, "AdaptiveTileLayout: filling space and continuing", v31, 2u);
          v32 = v31;
          v13 = v44;
          MEMORY[0x1BCCC1CD0](v32, -1, -1);
        }
        sub_1B93EE7EC();
        sub_1B8F1CCC4((uint64_t)&v50, v16, v17, v49, v48);
        sub_1B8E963DC((uint64_t)&v50);
        if ((v15 & 1) != 0)
          goto LABEL_36;
      }
      if (v9 != v16 || v46 != v17)
        goto LABEL_36;
      v33 = v42 == v48 && v43 == v49;
      if (v33 || v18 < v9)
      {
LABEL_44:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1B8FFB058(v39);
        goto LABEL_45;
      }
LABEL_37:
      if (*v13 >> 62)
      {
        sub_1B93ECF74();
        v34 = sub_1B93EE9F0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v34 = *(_QWORD *)((*v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v15 = 0;
      v9 = v16;
      v10 = v17;
      v12 = v48;
      v11 = v49;
    }
    while (v34 < *(_QWORD *)(v47 + 16));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v37 = *(_QWORD *)(v39 + 16);
  sub_1B93ECF74();
  swift_release();
  return v37;
}

uint64_t sub_1B8FFB058(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v1 = (uint64_t *)(a1 + 16);
  if (qword_1EF2077E8 != -1)
    swift_once();
  sub_1B93EE21C();
  sub_1B93EC824();
  sub_1B93EE21C();
  sub_1B93EC824();
  swift_beginAccess();
  v2 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = sub_1B93ECF74();
    if (v3)
      goto LABEL_5;
LABEL_12:
    swift_bridgeObjectRelease();
    sub_1B93EE21C();
    return sub_1B93EC824();
  }
  sub_1B93ECF74();
  result = sub_1B93EE9F0();
  v3 = result;
  if (!result)
    goto LABEL_12;
LABEL_5:
  if (v3 >= 1)
  {
    v5 = 0;
    v15 = v2 & 0xC000000000000001;
    v6 = v2;
    do
    {
      if (v15)
        v7 = (id)MEMORY[0x1BCCC05FC](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      ++v5;
      sub_1B93EE21C();
      __swift_instantiateConcreteTypeFromMangledName(qword_1ED57EF30);
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1B9438C30;
      v10 = v8;
      v11 = objc_msgSend(v10, sel_description);
      v12 = sub_1B93EDDB4();
      v14 = v13;

      *(_QWORD *)(v9 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v9 + 64) = sub_1B8E600D4();
      *(_QWORD *)(v9 + 32) = v12;
      *(_QWORD *)(v9 + 40) = v14;
      sub_1B93EC824();

      swift_bridgeObjectRelease();
      v2 = v6;
    }
    while (v3 != v5);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void sub_1B8FFB2E0(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  id v17;
  unint64_t v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  char v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  unint64_t v37;
  uint64_t v38;

  v3 = v1[1];
  v4 = v1[5];
  v5 = sub_1B93ECF74();
  v6 = sub_1B8E93740(v5);
  swift_bridgeObjectRelease();
  v37 = a1;
  v38 = v6;
  if (v3 < 0)
    goto LABEL_39;
  if (!v3)
  {
    sub_1B93ECF74();
LABEL_36:
    swift_bridgeObjectRelease();
    return;
  }
  v7 = *v1;
  v8 = *(_QWORD *)(v4 + 16);
  v9 = v4 + 32;
  sub_1B93ECF74();
  v10 = 0;
  v30 = v3;
  v31 = v8;
  v32 = v7;
  v33 = v4 + 32;
  while (1)
  {
    if (v10 == v3)
      goto LABEL_38;
    if (v8)
      break;
LABEL_4:
    ++v10;
    v3 = v30;
    if (v10 == v30)
      goto LABEL_36;
  }
  v11 = 0;
  while (1)
  {
    v12 = *(_QWORD *)(v9 + 8 * v11);
    if (v10 >= *(_QWORD *)(v12 + 16))
      break;
    v13 = *(void **)(v12 + 8 * v10 + 32);
    if (!v13)
      goto LABEL_28;
    v14 = v38;
    if ((v38 & 0xC000000000000001) != 0)
    {
      v15 = v13;
      sub_1B93ECF74();
      v16 = sub_1B93EE7B0();
      swift_bridgeObjectRelease();

      if ((v16 & 1) != 0)
      {

        goto LABEL_28;
      }
    }
    else if (*(_QWORD *)(v38 + 16))
    {
      v17 = v13;
      sub_1B93ECF74();
      v18 = sub_1B93EE4E0() & ~(-1 << *(_BYTE *)(v14 + 32));
      if (((*(_QWORD *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
      {
        v34 = -1 << *(_BYTE *)(v14 + 32);
        sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
        v19 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * v18);
        v20 = sub_1B93EE4EC();

        if ((v20 & 1) != 0)
        {
LABEL_16:

          swift_bridgeObjectRelease();
          v8 = v31;
          v7 = v32;
          v9 = v33;
          goto LABEL_28;
        }
        v22 = ~v34;
        v23 = v18 + 1;
        for (i = ~v34; ; v22 = i)
        {
          v24 = v23 & v22;
          if (((*(_QWORD *)(v14 + 56 + (((v23 & v22) >> 3) & 0xFFFFFFFFFFFFF8)) >> (v23 & v22)) & 1) == 0)
            break;
          v25 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * v24);
          v26 = sub_1B93EE4EC();

          if ((v26 & 1) != 0)
            goto LABEL_16;
          v23 = v24 + 1;
        }
        swift_bridgeObjectRelease();
        v8 = v31;
        v7 = v32;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v9 = v33;
    }
    else
    {
      v21 = v13;
    }
    v27 = v13;
    sub_1B8E8BA24(&v36, v27);

    v28 = v27;
    MEMORY[0x1BCCBFCCC]();
    if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B93EDF7C();
    sub_1B93EDFB8();
    sub_1B93EDF64();

    a1 = v37;
LABEL_28:
    if (a1 >> 62)
    {
      sub_1B93ECF74();
      v29 = sub_1B93EE9F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v29 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v29 >= *(_QWORD *)(v7 + 16))
      goto LABEL_36;
    if (++v11 == v8)
      goto LABEL_4;
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

UICollectionViewCompositionalLayoutConfiguration __swiftcall HUDashboardViewController.compositionalLayoutConfiguration(for:)(UITraitCollection a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend(v1, sel_layoutManager);
  v3 = objc_msgSend(v1, sel_context);
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultConfiguration);
  objc_msgSend(v4, sel_setContentInsetsReference_, 3);
  objc_msgSend(v4, sel_setInterSectionSpacing_, 20.0);

  return (UICollectionViewCompositionalLayoutConfiguration)v4;
}

uint64_t HUDashboardViewController.displayedItems(inSection:)()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_itemManager);
  v2 = (void *)sub_1B93EDD84();
  v3 = objc_msgSend(v1, sel_displayedItemsInSectionWithIdentifier_, v2);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  v4 = sub_1B93EDF4C();

  return v4;
}

void __swiftcall HUDashboardViewController.transform(_:)(HUGridLayoutOptions *__return_ptr retstr, HUGridLayoutOptions *a2)
{
  HUGridLayoutOptions *v2;

  -[HUGridLayoutOptions setSectionLeadingMargin:](a2, sel_setSectionLeadingMargin_, 0.0);
  -[HUGridLayoutOptions setSectionTrailingMargin:](a2, sel_setSectionTrailingMargin_, 0.0);
  v2 = a2;
}

uint64_t HUDashboardViewController.collectionView(_:itemsForAddingTo:at:point:)()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1B8FFB7D8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, unint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  id v34;
  uint64_t v35;
  id v36;
  char isUniquelyReferenced_nonNull_native;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t i;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;

  v4 = v2;
  v5 = v1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&i - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B93EB900();
  v49 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v45 = (char *)&i - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](v12).n128_u64[0];
  v48 = (char *)&i - v14;
  v15 = objc_msgSend(a1, sel_items, v13);
  sub_1B8E23A60(0, &qword_1EF2106E8);
  v16 = sub_1B93EDF4C();

  v17 = sub_1B8FF8F14(v16);
  swift_bridgeObjectRelease();
  v18 = sub_1B8F2C2A4(v17);
  swift_bridgeObjectRelease();
  if (v18)
  {
    if (v18 >> 62)
      goto LABEL_27;
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    for (i = v2; v19; i = v4)
    {
      v47 = v10;
      v44 = v18 & 0xC000000000000001;
      v3 = MEMORY[0x1E0DEE9E0];
      v10 = 4;
      v42 = v9;
      v43 = v18;
      while (1)
      {
        v20 = v44 ? (id)MEMORY[0x1BCCC05FC](v10 - 4, v18) : *(id *)(v18 + 8 * v10);
        v50 = v20;
        v18 = v47;
        if (__OFADD__(v10 - 4, 1))
          break;
        v21 = objc_msgSend(v5, sel_itemManager);
        v22 = objc_msgSend(v21, sel_indexPathForItem_, v50);

        if (!v22)
        {
          (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(v49 + 56))(v9, 1, 1, v18);
LABEL_23:
          swift_bridgeObjectRelease();
          sub_1B8E26870((uint64_t)v9, &qword_1ED57E7B0);
LABEL_25:
          sub_1B9000070();
          swift_allocError();
          *v39 = 7;
          swift_willThrow();
          swift_bridgeObjectRelease();

          return v3;
        }
        v46 = v10 - 3;
        v23 = v19;
        v24 = v45;
        sub_1B93EB8C4();

        v25 = v49;
        v26 = *(void (**)(char *, char *, unint64_t))(v49 + 32);
        v26(v9, v24, v18);
        (*(void (**)(char *, _QWORD, uint64_t, unint64_t))(v25 + 56))(v9, 0, 1, v18);
        if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v25 + 48))(v9, 1, v18) == 1)
          goto LABEL_23;
        v26(v48, v9, v18);
        v4 = sub_1B93EB8F4();
        v27 = v5;
        v28 = objc_msgSend(v5, sel_itemManager);
        v29 = objc_msgSend(v28, sel_displayedSectionIdentifierForSectionIndex_, v4);

        if (!v29)
        {
          (*(void (**)(char *, unint64_t))(v49 + 8))(v48, v47);
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        if (*(_QWORD *)(v3 + 16))
        {
          v30 = v29;
          v31 = sub_1B8E8E06C(v4, v30);
          v32 = MEMORY[0x1E0DEE9D8];
          if ((v33 & 1) != 0)
          {
            v32 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v31);
            sub_1B93ECF74();
          }

        }
        else
        {
          v32 = MEMORY[0x1E0DEE9D8];
        }
        v52 = v32;
        v34 = v50;
        MEMORY[0x1BCCBFCCC]();
        if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B93EDF7C();
        sub_1B93EDFB8();
        sub_1B93EDF64();
        v35 = v52;
        v36 = v29;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v51 = v3;
        sub_1B8E904C4(v35, v4, v36, isUniquelyReferenced_nonNull_native);
        v3 = v51;

        swift_bridgeObjectRelease();
        (*(void (**)(char *, unint64_t))(v49 + 8))(v48, v47);
        ++v10;
        v19 = v23;
        v5 = v27;
        v9 = v42;
        v18 = v43;
        if (v46 == v23)
          goto LABEL_29;
      }
      __break(1u);
LABEL_27:
      sub_1B93ECF74();
      v19 = sub_1B93EE9F0();
      swift_bridgeObjectRelease();
    }
    v3 = MEMORY[0x1E0DEE9E0];
LABEL_29:
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B9000070();
    swift_allocError();
    *v38 = 1;
    swift_willThrow();
  }
  return v3;
}

void HUDashboardViewController.collectionView(_:dragSessionWillBegin:)()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(v0, sel_setItemShowingSizeToggleButton_animated_, 0, 1);
  v1 = objc_msgSend(v0, sel_itemManager);
  v2 = (id)sub_1B93EDD84();
  objc_msgSend(v1, sel_disableExternalUpdatesWithReason_, v2);

}

void HUDashboardViewController.collectionView(_:dragSessionDidEnd:)()
{
  void *v0;
  id v1;
  id v2;

  v1 = objc_msgSend(v0, sel_itemManager);
  v2 = (id)sub_1B93EDD84();
  objc_msgSend(v1, sel_endDisableExternalUpdatesWithReason_, v2);

}

uint64_t HUDashboardViewController.collectionView(_:canHandle:)(int a1, id a2)
{
  id v3;

  v3 = objc_msgSend(a2, sel_localDragSession);
  swift_unknownObjectRelease();
  if (v3)
    return 1;
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF2106D0);
  return (uint64_t)objc_msgSend(a2, sel_canLoadObjectsOfClass_, swift_getObjCClassFromMetadata());
}

id HUDashboardViewController.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:)(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  _BYTE *v36;
  NSObject *v37;
  id v38;
  id v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  id v51;
  char *v52;
  char *v53;
  void *v54;
  char *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B93EB900();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF2106D0);
  if (objc_msgSend(a2, sel_canLoadObjectsOfClass_, swift_getObjCClassFromMetadata()))
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 2);
  objc_msgSend(a2, sel_locationInView_, a1);
  sub_1B8FFC840(v15, v16);
  if (!v18)
    goto LABEL_7;
  v19 = v18;
  v62 = a3;
  v63 = v17;
  v20 = objc_msgSend(a2, sel_items);
  sub_1B8E23A60(0, &qword_1EF2106E8);
  v21 = sub_1B93EDF4C();

  v22 = sub_1B8FF8F14(v21);
  swift_bridgeObjectRelease();
  v23 = sub_1B8F2C2A4(v22);
  swift_bridgeObjectRelease();
  if (!v23)
  {

LABEL_7:
    sub_1B9000070();
    v25 = (void *)swift_allocError();
    *v26 = 4;
    swift_willThrow();
LABEL_16:
    if (qword_1EF2077E8 != -1)
      swift_once();
    v37 = qword_1EF226DC8;
    v38 = v25;
    v39 = v25;
    v40 = sub_1B93EE234();
    if (os_log_type_enabled(v37, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v66 = v42;
      *(_DWORD *)v41 = 136315138;
      swift_getErrorValue();
      v43 = sub_1B93EEBA0();
      v65 = sub_1B8E3489C(v43, v44, &v66);
      sub_1B93EE600();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B8E1E000, v37, v40, "Drop session not allowed with error %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v42, -1, -1);
      MEMORY[0x1BCCC1CD0](v41, -1, -1);
    }
    else
    {

    }
    v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 0);

    return v45;
  }
  v64 = v19;
  v24 = v3;
  v27 = sub_1B90005DC(v23, v24);
  v61 = v24;

  v28 = sub_1B8E93998(v27);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v28 + 16) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = v64;
LABEL_15:
    sub_1B9000070();
    v25 = (void *)swift_allocError();
    *v36 = 2;
    swift_willThrow();

    goto LABEL_16;
  }
  v60 = (id)sub_1B8F2BE38(v28);
  v30 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = v64;
  if ((v30 & 1) != 0 || v60 != v63)
    goto LABEL_15;
  v32 = v61;
  v60 = objc_msgSend(v61, sel_layoutManager);
  v33 = v31;
  v34 = objc_msgSend(v32, sel_context);
  LOBYTE(v32) = sub_1B8EA6D34((uint64_t)v33, (uint64_t)v34);

  if ((v32 & 1) != 0)
  {
    v35 = (uint64_t)v63;
    if ((sub_1B8FFC998(a2, (uint64_t)v63) & 1) != 0)
    {
      sub_1B8FFCB30(a2, v35, v33);
      v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 3);
    }
    else
    {
      v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 0);
    }
    v45 = v58;

    return v45;
  }
  v60 = v33;
  v46 = sub_1B93EDDB4();
  v48 = v47;
  if (v46 == sub_1B93EDDB4() && v48 == v49)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v50 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v50 & 1) == 0)
      goto LABEL_30;
  }
  sub_1B8E44A8C(v62, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    v56 = a2;
    v57 = v60;
    v45 = sub_1B8FFCEF8(v56, (uint64_t)v63, v60);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

    return v45;
  }
  sub_1B8E26870((uint64_t)v9, &qword_1ED57E7B0);
LABEL_30:
  v51 = v61;
  v52 = (char *)objc_msgSend(v61, sel_layoutManager);
  v53 = &v52[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
  v54 = *(void **)&v52[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
  *((_QWORD *)v53 + 1) = 0;
  *((_QWORD *)v53 + 2) = 0;
  *(_QWORD *)v53 = 0;

  v55 = (char *)objc_msgSend(v51, sel_layoutManager);
  *(_QWORD *)&v55[OBJC_IVAR___HUDashboardLayoutManager_adaptiveTileDragInteractionLayouts] = 0;

  swift_bridgeObjectRelease();
  v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_intent_, 3, 1);

  return v45;
}

void sub_1B8FFC840(CGFloat a1, CGFloat a2)
{
  void *v2;
  id v5;
  unint64_t v6;
  char *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  CGPoint v18;
  CGRect v19;

  v5 = objc_msgSend(v2, sel_itemManager);
  v6 = (unint64_t)objc_msgSend(v5, sel_numberOfSections);

  if ((v6 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    return;
  }
  if (v6)
  {
    v7 = 0;
    while ((char *)v6 != v7)
    {
      v8 = objc_msgSend(v2, sel_collectionViewLayout);
      objc_msgSend(v8, sel__layoutFrameForSection_, v7);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      v19.origin.x = v10;
      v19.origin.y = v12;
      v19.size.width = v14;
      v19.size.height = v16;
      v18.x = a1;
      v18.y = a2;
      if (CGRectContainsPoint(v19, v18))
      {
        v17 = objc_msgSend(v2, sel_itemManager);
        objc_msgSend(v17, sel_displayedSectionIdentifierForSectionIndex_, v7);

        return;
      }
      if ((char *)v6 == ++v7)
        return;
    }
    __break(1u);
    goto LABEL_10;
  }
}

uint64_t sub_1B8FFC998(void *a1, uint64_t a2)
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = objc_msgSend(a1, sel_items);
  sub_1B8E23A60(0, &qword_1EF2106E8);
  v5 = sub_1B93EDF4C();

  if (v5 >> 62)
  {
    sub_1B93ECF74();
    v6 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6 != 1)
    goto LABEL_12;
  v7 = sub_1B8FFB7D8(a1);
  v8 = sub_1B8F2BEB0(v7);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v10 = v8;
  v11 = v9;
  v12 = *(_QWORD *)(v7 + 16);
  swift_bridgeObjectRelease();
  if (v12 != 1 || v10 != a2)
  {

LABEL_12:
    v17 = 0;
    return v17 & 1;
  }
  v13 = sub_1B93EDDB4();
  v15 = v14;
  if (v13 == sub_1B93EDDB4() && v15 == v16)
    v17 = 1;
  else
    v17 = sub_1B93EEB10();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17 & 1;
}

void sub_1B8FFCB30(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  id v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char *v29;
  char *v30;
  void *v31;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;

  v8 = objc_msgSend(v3, sel_layoutManager);
  v9 = objc_msgSend(v3, sel_context);
  sub_1B8E3DE78((uint64_t)v9, (uint64_t)&v42);

  if (v44 < 2u || v42 ^ 3 | v43)
  {
    sub_1B8E3EF7C(v42, v43, v44);
    sub_1B8E3EF7C(3, 0, 2);
    sub_1B9000070();
    swift_allocError();
    v19 = 6;
LABEL_7:
    *v18 = v19;
    swift_willThrow();
    return;
  }
  sub_1B8E3EF7C(v42, v43, 2);
  sub_1B8E3EF7C(3, 0, 2);
  v10 = objc_msgSend(a1, sel_items);
  sub_1B8E23A60(0, &qword_1EF2106E8);
  v11 = sub_1B93EDF4C();

  v12 = sub_1B8FF8F14(v11);
  swift_bridgeObjectRelease();
  v13 = sub_1B8F2C2A4(v12);
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_1B9000070();
    swift_allocError();
    v19 = 4;
    goto LABEL_7;
  }
  sub_1B9000C4C(a1, a2, (uint64_t)a3);
  if (v4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = v16;
    v41 = v17;
    v38 = v14;
    v21 = v15;
    v22 = (char *)objc_msgSend(v3, sel_layoutManager);
    v23 = *(void **)&v22[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
    v36 = *(_QWORD *)&v22[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition + 16];
    v37 = *(_QWORD *)&v22[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition + 8];
    v39 = v23;

    v40 = v21;
    if (v23
      && ((v24 = sub_1B93EDDB4(), v26 = v25, v24 != sub_1B93EDDB4()) || v26 != v27 ? (v28 = sub_1B93EEB10()) : (v28 = 1),
          (swift_bridgeObjectRelease(), swift_bridgeObjectRelease(), (v28 & 1) != 0) && v37 == v20 && v36 == v41))
    {
      swift_bridgeObjectRelease();

    }
    else
    {
      v29 = (char *)objc_msgSend(v3, sel_layoutManager, v36);
      v30 = &v29[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
      v31 = *(void **)&v29[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
      *(_QWORD *)v30 = a3;
      *((_QWORD *)v30 + 1) = v20;
      *((_QWORD *)v30 + 2) = v41;
      v32 = a3;

      v33 = (char *)objc_msgSend(v3, sel_layoutManager);
      sub_1B8FFF110(v13, v38, v40, v20, v41);
      v35 = v34;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v33[OBJC_IVAR___HUDashboardLayoutManager_adaptiveTileDragInteractionLayouts] = v35;

      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_reloadLayoutAnimated_fastUpdate_, 1, 1);

    }
  }
}

id sub_1B8FFCEF8(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  _BYTE *v23;
  id v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  id v30;

  v5 = v3;
  v8 = sub_1B8FFB7D8(a1);
  if (v4)
  {

LABEL_11:
    sub_1B9000070();
    swift_allocError();
    *v23 = 2;
    return (id)swift_willThrow();
  }
  v9 = v8;
  if (*(_QWORD *)(v8 + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v10 = a3;
  sub_1B8E8E06C(a2, v10);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();

    goto LABEL_11;
  }

  v12 = objc_msgSend(v5, sel_itemManager);
  sub_1B93EDDB4();
  v13 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_itemModuleForSectionIdentifier_, v13);

  if (!v14)
    goto LABEL_13;
  objc_opt_self();
  v15 = swift_dynamicCastObjCClass();
  if (!v15)
  {

LABEL_13:
    swift_bridgeObjectRelease();
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 0);
  }
  v16 = (void *)v15;
  v17 = sub_1B8FF9290(v9);
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_predictedActionSetItems);
  sub_1B8E23A60(0, &qword_1EF20C180);
  sub_1B8E48724(&qword_1EF20FC50, &qword_1EF20C180);
  v19 = sub_1B93EE0FC();

  v20 = sub_1B8FC31D0(v19);
  swift_bridgeObjectRelease();
  sub_1B93ECF74();
  sub_1B900014C(v20, v17);
  LOBYTE(v18) = v21;
  swift_bridgeObjectRelease_n();
  if ((v18 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 0);
  }
  else
  {
    v25 = objc_msgSend(v5, sel_itemManager);
    v26 = (void *)sub_1B93EB8B8();
    v27 = objc_msgSend(v25, sel_displayedItemAtIndexPath_, v26);

    if (v27)
    {
      v28 = sub_1B8F83B80(v27, v20);
      swift_bridgeObjectRelease();
      if ((v28 & 1) != 0)
      {
        v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_, 0);

        return v29;
      }

    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA448]), sel_initWithDropOperation_intent_, 3, 1);
  }
  v30 = v22;

  return v30;
}

void HUDashboardViewController.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  char *v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;

  v4 = v3;
  v41 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v7);
  v38 = (uint64_t)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B93EB900();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v37 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v36 - v13;
  v15 = (void *)sub_1B93EB8B8();
  v16 = (void *)sub_1B93EB8B8();
  v40 = a2;
  v17 = (void *)sub_1B93EB8B8();
  v42.receiver = v4;
  v42.super_class = (Class)HUDashboardViewController;
  v18 = objc_msgSendSuper2(&v42, sel_collectionView_targetIndexPathForMoveOfItemFromOriginalIndexPath_atCurrentIndexPath_toProposedIndexPath_, a1, v15, v16, v17);

  sub_1B93EB8C4();
  v19 = objc_msgSend(v4, sel_itemManager);
  v20 = (void *)sub_1B93EB8B8();
  v21 = objc_msgSend(v19, sel_displayedItemAtIndexPath_, v20);

  if (!v21)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v41, v14, v9);
    return;
  }
  v39 = v10;
  v22 = sub_1B93EB8F4();
  v23 = objc_msgSend(v4, sel_itemManager);
  v24 = objc_msgSend(v23, sel_displayedSectionIdentifierForSectionIndex_, v22);

  if (!v24)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v41, v14, v9);

    return;
  }
  v25 = sub_1B93EDDB4();
  v27 = v26;
  if (v25 == sub_1B93EDDB4() && v27 == v28)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v29 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0)
      goto LABEL_10;
  }
  sub_1B8FC85EC();
  if ((sub_1B93EDD78() & 1) == 0)
  {
    v32 = v38;
    sub_1B8FFD710(v21, v22, v38);

    v31 = v39;
    v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v32, 1, v9);
    v34 = v37;
    if (v33 == 1)
    {
      v35 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v35(v37, v14, v9);
      sub_1B8E26870(v32, &qword_1ED57E7B0);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v9);
      v35 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v35(v34, (char *)v32, v9);
    }
    v35(v14, v34, v9);
    v30 = v41;
    goto LABEL_15;
  }
LABEL_10:

  v30 = v41;
  v31 = v39;
LABEL_15:
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v30, v14, v9);
}

uint64_t sub_1B8FFD710@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  void *v4;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = v3;
  if (sub_1B93EB8F4() != a2)
  {
    if (sub_1B93EB8F4() <= a2)
    {
      v23 = 0;
    }
    else
    {
      v19 = objc_msgSend(v3, sel_itemManager);
      v20 = objc_msgSend(v19, sel_displayedItemsInSection_, a2);

      sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
      v21 = sub_1B93EDF4C();

      if (v21 >> 62)
      {
        sub_1B93ECF74();
        v22 = sub_1B93EE9F0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v23 = v22;
    }
    MEMORY[0x1BCCBD698](v23, a2);
    goto LABEL_15;
  }
  v8 = objc_msgSend(v3, sel_itemManager);
  v9 = (void *)sub_1B93EB8B8();
  v10 = objc_msgSend(v8, sel_displayedItemAtIndexPath_, v9);

  if (!v10)
  {
LABEL_18:
    v24 = sub_1B93EB900();
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
    v26 = a3;
    v27 = 1;
    return v25(v26, v27, 1, v24);
  }
  v11 = objc_msgSend(v4, sel_itemManager);
  sub_1B93EDDB4();
  v12 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_itemModuleForSectionIdentifier_, v12);

  if (!v13)
  {
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_self();
  v14 = (void *)swift_dynamicCastObjCClass();
  if (!v14)
  {

    goto LABEL_17;
  }
  v15 = objc_msgSend(v14, sel_predictedActionSetItems);
  sub_1B8E23A60(0, &qword_1EF20C180);
  sub_1B8E48724(&qword_1EF20FC50, &qword_1EF20C180);
  v16 = sub_1B93EE0FC();

  v17 = sub_1B8FC31D0(v16);
  swift_bridgeObjectRelease();
  if ((sub_1B8F83B80(a1, v17) & 1) != 0 || (sub_1B8F83B80(v10, v17) & 1) != 0)
  {
    if ((v17 & 0xC000000000000001) != 0)
      v18 = sub_1B93EE780();
    else
      v18 = *(_QWORD *)(v17 + 16);
    swift_bridgeObjectRelease();
    MEMORY[0x1BCCBD698](v18, a2);

LABEL_15:
    v24 = sub_1B93EB900();
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
    v26 = a3;
    v27 = 0;
    return v25(v26, v27, 1, v24);
  }
  v29 = sub_1B93EB900();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(a3, 1, 1, v29);

  return swift_bridgeObjectRelease();
}

uint64_t HUDashboardViewController.collectionView(_:performDropWith:)(uint64_t a1, void *a2)
{
  void *v2;
  id v5;
  unsigned int v6;
  id v7;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  char *v21;
  char *v22;
  void *v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  swift_getObjectType();
  v5 = objc_msgSend(a2, sel_session);
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF2106D0);
  v6 = objc_msgSend(v5, sel_canLoadObjectsOfClass_, swift_getObjCClassFromMetadata());
  swift_unknownObjectRelease();
  v7 = objc_msgSend(a2, sel_session);
  if (v6)
  {
    sub_1B8FFE028(v7);
    return swift_unknownObjectRelease();
  }
  else
  {
    objc_msgSend(v7, sel_locationInView_, a1);
    v10 = v9;
    v12 = v11;
    swift_unknownObjectRelease();
    sub_1B8FFC840(v10, v12);
    if (v14)
    {
      v15 = v13;
      v16 = v14;
      v17 = objc_msgSend(v2, sel_layoutManager);
      v18 = v16;
      v19 = objc_msgSend(v2, sel_context);
      v20 = sub_1B8EA6D34((uint64_t)v18, (uint64_t)v19);

      if (v20)
        sub_1B8FFE2AC(a2, v15, v18);
      v21 = (char *)objc_msgSend(v2, sel_layoutManager);
      v22 = &v21[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
      v23 = *(void **)&v21[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
      *((_QWORD *)v22 + 1) = 0;
      *((_QWORD *)v22 + 2) = 0;
      *(_QWORD *)v22 = 0;

      v24 = (char *)objc_msgSend(v2, sel_layoutManager);
      *(_QWORD *)&v24[OBJC_IVAR___HUDashboardLayoutManager_adaptiveTileDragInteractionLayouts] = 0;

      return swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_1EF2077E8 != -1)
        swift_once();
      v25 = qword_1EF226DC8;
      swift_unknownObjectRetain_n();
      v26 = sub_1B93EE234();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = swift_slowAlloc();
        v28 = swift_slowAlloc();
        v36 = v28;
        *(_DWORD *)v27 = 136315650;
        v29 = sub_1B93EEC6C();
        sub_1B8E3489C(v29, v30, &v36);
        sub_1B93EE600();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2080;
        v35 = sub_1B8E3489C(0xD000000000000022, 0x80000001B94505C0, &v36);
        sub_1B93EE600();
        *(_WORD *)(v27 + 22) = 2080;
        v31 = objc_msgSend(a2, sel_description, v35, v36);
        v32 = sub_1B93EDDB4();
        v34 = v33;

        sub_1B8E3489C(v32, v34, &v36);
        sub_1B93EE600();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B8E1E000, v25, v26, "%s %s: Failed to get the destination section %s", (uint8_t *)v27, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1BCCC1CD0](v28, -1, -1);
        return MEMORY[0x1BCCC1CD0](v27, -1, -1);
      }
      else
      {
        return swift_unknownObjectRelease_n();
      }
    }
  }
}

void sub_1B8FFE028(void *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t ObjCClassFromMetadata;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD v16[6];

  v2 = objc_msgSend(a1, sel_items);
  sub_1B8E23A60(0, &qword_1EF2106E8);
  v3 = sub_1B93EDF4C();

  if (!(v3 >> 62))
  {
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_1B93ECF74();
  v12 = sub_1B93EE9F0();
  swift_bridgeObjectRelease();
  if (!v12)
    goto LABEL_9;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1BCCC05FC](0, v3);
LABEL_6:
    v5 = v4;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v5, sel_itemProvider);

    if (v6)
    {
      sub_1B8E23A60(0, (unint64_t *)&unk_1EF2106D0);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = v1;
      v16[4] = sub_1B90011F4;
      v16[5] = v8;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 1107296256;
      v16[2] = sub_1B8FFFDC4;
      v16[3] = &block_descriptor_44;
      v9 = _Block_copy(v16);
      v10 = v1;
      swift_release();
      v11 = objc_msgSend(v6, sel_loadObjectOfClass_completionHandler_, ObjCClassFromMetadata, v9);
      _Block_release(v9);

      return;
    }
LABEL_10:
    if (qword_1EF207840 == -1)
      goto LABEL_11;
    goto LABEL_16;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v3 + 32);
    goto LABEL_6;
  }
  __break(1u);
LABEL_16:
  swift_once();
LABEL_11:
  v13 = qword_1EF226E10;
  v14 = sub_1B93EE234();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1B8E1E000, v13, v14, "Cannot found NSItemProvider for external image drop session", v15, 2u);
    JUMPOUT(0x1BCCC1CD0);
  }
}

void sub_1B8FFE2AC(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  NSObject *v60;
  id v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  unint64_t v68;
  uint64_t inited;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  _QWORD v80[4];
  uint64_t v81;
  _OWORD v82[4];
  uint64_t v83;

  v4 = v3;
  swift_getObjectType();
  v21 = sub_1B8FFB7D8(objc_msgSend(a1, sel_session));
  swift_unknownObjectRelease();
  v22 = objc_msgSend(a1, sel_items);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210760);
  v23 = sub_1B93EDF4C();

  v24 = sub_1B8FF90B4(v23);
  swift_bridgeObjectRelease();
  v25 = sub_1B8F2C2A4(v24);
  swift_bridgeObjectRelease();
  if (!v25)
  {
    swift_bridgeObjectRelease();
    if (qword_1EF2077E8 != -1)
      swift_once();
    v8 = qword_1EF226DC8;
    swift_unknownObjectRetain_n();
    v9 = sub_1B93EE234();
    if (!os_log_type_enabled(v8, v9))
    {
      swift_unknownObjectRelease_n();
      return;
    }
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    *(_QWORD *)&v82[0] = v11;
    *(_DWORD *)v10 = 136315650;
    v12 = sub_1B93EEC6C();
    sub_1B8E3489C(v12, v13, (uint64_t *)v82);
    sub_1B93EE600();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_1B8E3489C(0xD000000000000026, 0x80000001B9450640, (uint64_t *)v82);
    sub_1B93EE600();
    *(_WORD *)(v10 + 22) = 2080;
    v14 = objc_msgSend(a1, sel_items);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210760);
    v16 = sub_1B93EDF4C();

    v17 = MEMORY[0x1BCCBFD08](v16, v15);
    v19 = v18;
    swift_bridgeObjectRelease();
    v80[0] = sub_1B8E3489C(v17, v19, (uint64_t *)v82);
    sub_1B93EE600();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B8E1E000, v8, v9, "%s %s: Dropped items without HFItem local objects %s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    v20 = v11;
    goto LABEL_6;
  }
  v26 = sub_1B8F2BEB0(v21);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v28 = v26;

  v29 = *(_QWORD *)(v21 + 16);
  swift_bridgeObjectRelease();
  if (v29 != 1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    if (qword_1EF2077E8 != -1)
      swift_once();
    v30 = qword_1EF226DC8;
    v31 = sub_1B93EE234();
    if (!os_log_type_enabled(v30, v31))
      return;
    v10 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    *(_QWORD *)&v82[0] = v32;
    *(_DWORD *)v10 = 136315394;
    v33 = sub_1B93EEC6C();
    sub_1B8E3489C(v33, v34, (uint64_t *)v82);
    sub_1B93EE600();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    v80[0] = sub_1B8E3489C(0xD000000000000026, 0x80000001B9450640, (uint64_t *)v82);
    sub_1B93EE600();
    _os_log_impl(&dword_1B8E1E000, v30, v31, "%s %s: Tried to drop items coming from multiple sections which is not supported", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    v20 = v32;
LABEL_6:
    MEMORY[0x1BCCC1CD0](v20, -1, -1);
    MEMORY[0x1BCCC1CD0](v10, -1, -1);
    return;
  }
  if (v28 != a2)
  {
    swift_bridgeObjectRelease();
    return;
  }
  sub_1B9000C4C(objc_msgSend(a1, sel_session), a2, (uint64_t)a3);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  swift_unknownObjectRelease();
  sub_1B8FFF110(v25, v36, v42, v38, v40);
  v44 = v43;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v44 + 16))
    goto LABEL_44;
  v73 = a3;
  v45 = sub_1B8E36AA0(v73);
  if ((v46 & 1) == 0)
  {

LABEL_44:
    swift_bridgeObjectRelease();

    return;
  }
  v72 = v42;
  v47 = *(_QWORD *)(v44 + 56) + 72 * v45;
  v82[0] = *(_OWORD *)v47;
  v49 = *(_OWORD *)(v47 + 32);
  v48 = *(_OWORD *)(v47 + 48);
  v50 = *(_QWORD *)(v47 + 64);
  v82[1] = *(_OWORD *)(v47 + 16);
  v82[2] = v49;
  v83 = v50;
  v82[3] = v48;
  sub_1B8EA31E4((uint64_t)v82);

  swift_bridgeObjectRelease();
  v51 = sub_1B8FFAA34();
  sub_1B8EA3238((uint64_t)v82);
  if (qword_1EF2077E8 != -1)
    swift_once();
  v52 = &unk_1EF226000;
  v53 = qword_1EF226DC8;
  v54 = sub_1B93EE234();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_1B8E1E000, v53, v54, "TILE REORDER: dropped item order:", v55, 2u);
    MEMORY[0x1BCCC1CD0](v55, -1, -1);
  }
  if (v51 >> 62)
  {
    sub_1B93ECF74();
    v56 = sub_1B93EE9F0();
    if (v56)
      goto LABEL_29;
LABEL_46:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210768);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B9438C30;
    *(_QWORD *)(inited + 32) = sub_1B93EDDB4();
    *(_QWORD *)(inited + 40) = v70;
    *(_QWORD *)(inited + 48) = v51;
    sub_1B8E801F0(inited);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210770);
    v71 = (void *)sub_1B93EDCE8();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_didReorderItemWithSortedItemsBySectionID_, v71);

    return;
  }
  v56 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_1B93ECF74();
  if (!v56)
    goto LABEL_46;
LABEL_29:
  if (v56 >= 1)
  {
    v57 = 0;
    v58 = v51 & 0xC000000000000001;
    v75 = *MEMORY[0x1E0D30D18];
    v74 = v51;
    v76 = v51 & 0xC000000000000001;
    v77 = v56;
    while (1)
    {
      v59 = v58 ? (id)MEMORY[0x1BCCC05FC](v57, v51) : *(id *)(v51 + 8 * v57 + 32);
      v60 = *((_QWORD *)v52 + 441);
      v61 = v59;
      v62 = sub_1B93EE234();
      if (os_log_type_enabled(v60, v62))
        break;

LABEL_32:
      if (v56 == ++v57)
        goto LABEL_46;
    }
    v63 = swift_slowAlloc();
    v64 = swift_slowAlloc();
    v81 = v64;
    *(_DWORD *)v63 = 136315138;
    MEMORY[0x1BCCC01F4](v80, v75);
    if (v80[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v66 = v78;
        v65 = v79;
LABEL_42:
        *(_QWORD *)(v63 + 4) = sub_1B8E3489C(v66, v65, &v81);

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B8E1E000, v60, v62, "TILE REORDER:    %s", (uint8_t *)v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCC1CD0](v64, -1, -1);
        MEMORY[0x1BCCC1CD0](v63, -1, -1);

        v52 = &unk_1EF226000;
        v58 = v76;
        v56 = v77;
        goto LABEL_32;
      }
    }
    else
    {
      sub_1B8E26870((uint64_t)v80, (uint64_t *)&unk_1ED57EC00);
    }
    v67 = objc_msgSend(v61, sel_description, v72);
    v66 = sub_1B93EDDB4();
    v65 = v68;

    v51 = v74;
    goto LABEL_42;
  }
  __break(1u);
}

void HUDashboardViewController.collectionView(_:dropSessionDidEnd:)(uint64_t a1, void *a2)
{
  sub_1B9000F94(a2);
}

void sub_1B8FFEE4C(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v2 = sub_1B8FFB7D8(a1);
  sub_1B8F2BEB0(v2);
  if (!v3)
    goto LABEL_17;
  v4 = v3;
  if (*(_QWORD *)(v2 + 16) != 1)
    goto LABEL_16;
  v5 = sub_1B8F2BF28(v2);
  if (!v5)
    goto LABEL_27;
  v6 = v5 >> 62 ? sub_1B93EE9F0() : *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (v6 != 1)
  {
LABEL_16:

LABEL_17:
    swift_bridgeObjectRelease();
    return;
  }
  v7 = objc_msgSend(v1, sel_layoutManager);
  v16 = v4;
  v8 = objc_msgSend(v1, sel_context);
  v9 = sub_1B8EA6D34((uint64_t)v16, (uint64_t)v8);

  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v10 = sub_1B8F2BF28(v2);
  swift_bridgeObjectRelease();
  if (!v10)
  {
LABEL_19:

    return;
  }
  if (!(v10 >> 62))
  {
    v11 = v16;
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_11;
    goto LABEL_24;
  }
  sub_1B93ECF74();
  v15 = sub_1B93EE9F0();
  swift_bridgeObjectRelease();
  v11 = v16;
  if (!v15)
  {
LABEL_24:

    goto LABEL_17;
  }
LABEL_11:
  if ((v10 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      v12 = *(id *)(v10 + 32);
      goto LABEL_14;
    }
    __break(1u);
LABEL_27:
    __break(1u);
    return;
  }
  v12 = (id)MEMORY[0x1BCCC05FC](0, v10);
LABEL_14:
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = swift_dynamicCastObjCProtocolConditional();
  if (v14)
  {
    objc_msgSend(v1, sel_setItemShowingSizeToggleButton_animated_, v14, 1);

  }
  else
  {

  }
}

void sub_1B8FFF110(unint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  char *v19;
  id v20;
  char isUniquelyReferenced_nonNull_native;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  id v59;
  id v60;
  id v61;
  unint64_t v62;
  NSObject *v63;
  id v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  void **v85;
  void *v86;
  unint64_t v87;
  _OWORD v88[2];
  char v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  _OWORD v99[4];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  unint64_t v110;

  swift_getObjectType();
  v12 = v5;
  v13 = a1;
  v14 = v12;
  sub_1B90008E8(v13, v12);
  v16 = v15;

  if (v6)
    return;
  v82 = a4;
  v80 = a5;
  v110 = MEMORY[0x1E0DEE9E0];
  v17 = *(_QWORD *)(v16 + 16);
  if (!v17)
  {
    swift_bridgeObjectRelease();
LABEL_40:
    swift_beginAccess();
    return;
  }
  v72 = 0;
  v73 = v16;
  v18 = (void **)(v16 + 48);
  v74 = MEMORY[0x1E0DEE9B8] + 8;
  v81 = a3;
  v78 = a2;
  v79 = v14;
  while (1)
  {
    v22 = a3;
    v23 = a2;
    v24 = (uint64_t)*(v18 - 2);
    v85 = v18;
    v25 = *v18;
    v26 = *(v18 - 1);
    v27 = v25;
    v28 = objc_msgSend(v14, sel_layoutManager);
    v29 = v26;
    v30 = objc_msgSend(v14, sel_context);
    sub_1B8E3DE78((uint64_t)v30, (uint64_t)&v94);

    v86 = v29;
    v31 = v95;
    if (v95 < 2u || (v31 = 2, (unint64_t)v94 ^ 3 | *((_QWORD *)&v94 + 1)))
    {
      sub_1B8E3EF7C(v94, *((uint64_t *)&v94 + 1), v31);
      sub_1B8E3EF7C(3, 0, 2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B9000070();
      swift_allocError();
      v71 = 6;
LABEL_37:
      *v70 = v71;
      swift_willThrow();

      return;
    }
    sub_1B8E3EF7C(v94, *((uint64_t *)&v94 + 1), 2);
    sub_1B8E3EF7C(3, 0, 2);
    if (v24 != v23)
      goto LABEL_36;
    v32 = v23;
    v33 = v22;
    v34 = sub_1B93EDDB4();
    v36 = v35;
    if (v34 == sub_1B93EDDB4() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_14;
    }
    v38 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v38 & 1) == 0)
    {
LABEL_36:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B9000070();
      swift_allocError();
      v71 = 2;
      goto LABEL_37;
    }
LABEL_14:
    v83 = v17;
    v39 = objc_msgSend(v14, sel_layoutManager, v72, v73, v74);
    v40 = sub_1B8EA02B8(v27);
    v42 = v41;

    swift_beginAccess();
    v43 = v110;
    v84 = (char *)v27;
    if (*(_QWORD *)(v110 + 16))
    {
      v44 = v33;
      v45 = sub_1B8E36AA0(v44);
      if ((v46 & 1) != 0)
      {
        v47 = *(_QWORD *)(v43 + 56) + 72 * v45;
        v48 = *(_QWORD *)v47;
        v49 = *(_QWORD *)(v47 + 8);
        v50 = *(_QWORD *)(v47 + 16);
        v51 = *(_QWORD *)(v47 + 24);
        v52 = *(_BYTE *)(v47 + 32);
        v77 = v40;
        v53 = v42;
        v54 = *(_QWORD *)(v47 + 40);
        v76 = *(_QWORD *)(v47 + 48);
        v75 = *(_BYTE *)(v47 + 56);
        v55 = *(_QWORD *)(v47 + 64);
        swift_endAccess();
        sub_1B93ECF74();
        sub_1B93ECF74();
        sub_1B93ECF74();
        sub_1B93ECF74();

        *(_QWORD *)&v94 = v48;
        *((_QWORD *)&v94 + 1) = v49;
        *(_QWORD *)&v95 = v50;
        *((_QWORD *)&v95 + 1) = v51;
        LOBYTE(v96) = v52;
        *((_QWORD *)&v96 + 1) = v54;
        v42 = v53;
        v40 = v77;
        *(_QWORD *)&v97 = v76;
        BYTE8(v97) = v75;
        v98 = v55;
        if ((v52 & 1) != 0)
          goto LABEL_26;
        goto LABEL_17;
      }

    }
    swift_endAccess();
    v59 = objc_msgSend(v14, sel_layoutManager);
    v60 = objc_msgSend(v14, sel_itemManager);
    v61 = objc_msgSend(v60, sel_displayedItemsInSection_, v32);

    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    v62 = sub_1B93EDF4C();

    sub_1B8E97900(v62, 0, (unint64_t *)&v94);
    swift_bridgeObjectRelease();
    v49 = *((_QWORD *)&v94 + 1);
    v51 = *((_QWORD *)&v95 + 1);
    if ((v96 & 1) != 0)
    {
LABEL_26:
      v57 = v80;
      v56 = v82;
      if (v82 < 0)
        goto LABEL_30;
      v58 = 1;
      if (v80 < 0)
        goto LABEL_30;
      goto LABEL_28;
    }
LABEL_17:
    v56 = v82;
    if (!v51)
      break;
    if (v82 == 0x8000000000000000 && v51 == -1)
      goto LABEL_42;
    v57 = v80;
    if (v51 < 0 || v82 < 0 || (v58 = 0, v80 < 0))
    {
LABEL_30:
      if (qword_1EF2077E8 != -1)
        swift_once();
      v63 = qword_1EF226DC8;
      a3 = v81;
      v64 = v81;
      v65 = sub_1B93EE234();
      if (os_log_type_enabled(v63, v65))
      {
        v66 = swift_slowAlloc();
        v67 = swift_slowAlloc();
        *(_QWORD *)&v88[0] = v67;
        *(_DWORD *)v66 = 136315906;
        v68 = sub_1B93EEC6C();
        sub_1B8E3489C(v68, v69, (uint64_t *)v88);
        sub_1B93EE600();
        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 12) = 2080;
        sub_1B8E3489C(0xD000000000000029, 0x80000001B9450670, (uint64_t *)v88);
        a3 = v81;
        sub_1B93EE600();
        *(_WORD *)(v66 + 22) = 2048;

        sub_1B93EE600();
        *(_WORD *)(v66 + 32) = 2048;

        sub_1B93EE600();
        _os_log_impl(&dword_1B8E1E000, v63, v65, "%s %s: Invalid (ignored) drop position: (row: %ld, column: %ld)", (uint8_t *)v66, 0x2Au);
        swift_arrayDestroy();
        MEMORY[0x1BCCC1CD0](v67, -1, -1);
        MEMORY[0x1BCCC1CD0](v66, -1, -1);
      }
      else
      {

      }
      a2 = v78;
      v19 = v84;
      goto LABEL_6;
    }
LABEL_28:
    if (v49 < v57)
      goto LABEL_30;
    v101 = v94;
    v102 = v49;
    v103 = v95;
    v104 = v51;
    v105 = v58;
    v106 = *((_QWORD *)&v96 + 1);
    v107 = v97;
    v108 = BYTE8(v97);
    v109 = v98;
    v19 = v84;
    sub_1B8FF93FC(v84, v56, v57, v40, v42, 0, v88);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v94 = v88[0];
    v95 = v88[1];
    LOBYTE(v96) = v89;
    *((_QWORD *)&v96 + 1) = v90;
    *(_QWORD *)&v97 = v91;
    BYTE8(v97) = v92;
    v98 = v93;
    a3 = v81;
    a2 = v78;
LABEL_6:
    v99[2] = v96;
    v99[3] = v97;
    v100 = v98;
    v99[0] = v94;
    v99[1] = v95;
    swift_beginAccess();
    v20 = a3;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v87 = v110;
    v110 = 0x8000000000000000;
    sub_1B8E905FC((uint64_t)v99, v20, isUniquelyReferenced_nonNull_native);
    v110 = v87;

    swift_bridgeObjectRelease();
    swift_endAccess();

    v18 = v85 + 3;
    v17 = v83 - 1;
    v14 = v79;
    if (v83 == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
}

void sub_1B8FFF944(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD v13[6];

  if (a1 && (objc_opt_self(), (v1 = swift_dynamicCastObjCClass()) != 0))
  {
    v2 = v1;
    v3 = objc_allocWithZone(MEMORY[0x1E0CB3A28]);
    swift_unknownObjectRetain();
    v4 = objc_msgSend(v3, sel_init);
    v5 = objc_msgSend(v4, sel_UUIDString);

    if (!v5)
    {
      sub_1B93EDDB4();
      v5 = (id)sub_1B93EDD84();
      swift_bridgeObjectRelease();
    }
    v6 = objc_msgSend((id)objc_opt_self(), sel_customWallpaperWithAssetIdentifier_, v5);

    v7 = sub_1B8FFFB6C((uint64_t)v6, v2);
    v13[4] = sub_1B8ED26CC;
    v13[5] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 1107296256;
    v13[2] = sub_1B8EB2008;
    v13[3] = &block_descriptor_3;
    v8 = _Block_copy(v13);
    v9 = objc_msgSend(v7, sel_addFailureBlock_, v8);
    _Block_release(v8);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_1EF207840 != -1)
      swift_once();
    v10 = qword_1EF226E10;
    v11 = sub_1B93EE234();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B8E1E000, v10, v11, "Cannot decode image for external image drop session", v12, 2u);
      JUMPOUT(0x1BCCC1CD0);
    }
  }
}

id sub_1B8FFFB6C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char *v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  char *v19;
  id v20;
  id v21;
  void *v22;

  v3 = v2;
  v6 = (char *)objc_msgSend(v3, sel_context);
  v7 = *(void **)&v6[OBJC_IVAR___HUDashboardContext_room];
  v8 = v7;

  if (v7)
  {
    v9 = v8;
    v10 = (char *)objc_msgSend(v3, sel_context);
    v11 = *(id *)&v10[OBJC_IVAR___HUDashboardContext_home];

    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31700]), sel_initWithExistingObject_inHome_, v9, v11);
    v13 = objc_msgSend(v12, sel_wallpaperBuilder);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, sel_setWallpaper_image_, a1, a2);

    }
    v15 = objc_msgSend(v12, sel_commitItem);
    v16 = objc_msgSend(v15, sel_asGeneric);

  }
  else
  {
    v17 = (char *)objc_msgSend(v3, sel_context);
    v18 = *(id *)&v17[OBJC_IVAR___HUDashboardContext_home];

    v19 = (char *)objc_msgSend(v3, sel_context);
    v20 = *(id *)&v19[OBJC_IVAR___HUDashboardContext_home];

    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31410]), sel_initWithExistingObject_inHome_, v18, v20);
    v21 = objc_msgSend(v12, sel_wallpaperBuilder);
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, sel_setWallpaper_image_, a1, a2);

    }
    v15 = objc_msgSend(v12, sel_commitItem);
    v16 = objc_msgSend(v15, sel_asGeneric);
  }

  return v16;
}

uint64_t sub_1B8FFFDC4(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_1B8FFFE2C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  sub_1B93EEBF4();
  sub_1B93EEC00();
  sub_1B93EDDB4();
  v2 = v1;
  sub_1B93EDE14();

  swift_bridgeObjectRelease();
  return sub_1B93EEC24();
}

uint64_t sub_1B8FFFEAC()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  sub_1B93EEC00();
  sub_1B93EDDB4();
  v2 = v1;
  sub_1B93EDE14();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8FFFF0C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  sub_1B93EEBF4();
  sub_1B93EEC00();
  sub_1B93EDDB4();
  v2 = v1;
  sub_1B93EDE14();

  swift_bridgeObjectRelease();
  return sub_1B93EEC24();
}

uint64_t sub_1B8FFFF88(uint64_t *a1, uint64_t *a2)
{
  return sub_1B90000B4(*a1, a1[1], *a2);
}

Swift::String_optional __swiftcall HUDashboardViewController.contextTypeDescriptionForAnalytics()()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Swift::String_optional result;

  v1 = objc_msgSend(v0, sel_context);
  v2 = sub_1B8E724D8();
  v4 = v3;

  v5 = v2;
  v6 = v4;
  result.value._object = v6;
  result.value._countAndFlagsBits = v5;
  return result;
}

unint64_t sub_1B9000070()
{
  unint64_t result;

  result = qword_1EF2106E0;
  if (!qword_1EF2106E0)
  {
    result = MEMORY[0x1BCCC1BE0](&unk_1B9441330, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_1EF2106E0);
  }
  return result;
}

uint64_t sub_1B90000B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1 == a3)
  {
    v3 = sub_1B93EDDB4();
    v5 = v4;
    if (v3 == sub_1B93EDDB4() && v5 == v6)
      v7 = 1;
    else
      v7 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

void sub_1B900014C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  id v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  unint64_t v38;
  void *v39;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
    sub_1B93EE138();
    v3 = v34;
    v4 = v35;
    v5 = v36;
    v6 = v37;
    v7 = v38;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v4 = a1 + 56;
    v9 = ~v8;
    v10 = -v8;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v7 = v11 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v5 = v9;
    v6 = 0;
  }
  v32 = (unint64_t)(v5 + 64) >> 6;
  v33 = a2 & 0xC000000000000001;
  v31 = v3;
  v30 = v4;
  while (1)
  {
LABEL_9:
    if (v3 < 0)
    {
      if (!sub_1B93EE7A4())
        goto LABEL_55;
      sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v39;
      swift_unknownObjectRelease();
      v14 = v6;
      v12 = v7;
      if (!v39)
        goto LABEL_55;
    }
    else
    {
      if (v7)
      {
        v12 = (v7 - 1) & v7;
        v13 = __clz(__rbit64(v7)) | (v6 << 6);
        v14 = v6;
      }
      else
      {
        v14 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_58;
        if (v14 >= v32)
          goto LABEL_55;
        v16 = *(_QWORD *)(v4 + 8 * v14);
        if (!v16)
        {
          v17 = v6 + 2;
          if (v6 + 2 >= v32)
            goto LABEL_55;
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_24;
          v17 = v6 + 3;
          if (v6 + 3 >= v32)
            goto LABEL_55;
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_24;
          v17 = v6 + 4;
          if (v6 + 4 >= v32)
            goto LABEL_55;
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
          {
LABEL_24:
            v14 = v17;
          }
          else
          {
            v14 = v6 + 5;
            if (v6 + 5 >= v32)
              goto LABEL_55;
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (!v16)
            {
              v29 = v6 + 6;
              while (v32 != v29)
              {
                v16 = *(_QWORD *)(v4 + 8 * v29++);
                if (v16)
                {
                  v14 = v29 - 1;
                  goto LABEL_25;
                }
              }
              goto LABEL_55;
            }
          }
        }
LABEL_25:
        v12 = (v16 - 1) & v16;
        v13 = __clz(__rbit64(v16)) + (v14 << 6);
      }
      v15 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      if (!v15)
        goto LABEL_55;
    }
    if (a2 >> 62)
    {
      sub_1B93ECF74();
      v18 = sub_1B93EE9F0();
      if (!v18)
        goto LABEL_8;
    }
    else
    {
      v18 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      sub_1B93ECF74();
      if (!v18)
        goto LABEL_8;
    }
    if (v33)
      v19 = (id)MEMORY[0x1BCCC05FC](0, a2);
    else
      v19 = *(id *)(a2 + 32);
    v20 = v19;
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    v21 = sub_1B93EE4EC();

    if ((v21 & 1) != 0)
    {
LABEL_53:

      swift_bridgeObjectRelease();
LABEL_55:
      sub_1B8E7A20C();
      return;
    }
    if (v18 != 1)
      break;
LABEL_8:

    swift_bridgeObjectRelease();
    v6 = v14;
    v7 = v12;
  }
  if (v33)
  {
    v22 = 1;
    while (1)
    {
      MEMORY[0x1BCCC05FC](v22, a2);
      v23 = v22 + 1;
      if (__OFADD__(v22, 1))
        break;
      v24 = sub_1B93EE4EC();
      swift_unknownObjectRelease();
      if ((v24 & 1) != 0)
        goto LABEL_53;
      ++v22;
      if (v23 == v18)
        goto LABEL_43;
    }
    __break(1u);
  }
  else
  {
    v25 = 5;
    while (1)
    {
      v26 = v25 - 3;
      if (__OFADD__(v25 - 4, 1))
        break;
      v27 = *(id *)(a2 + 8 * v25);
      v28 = sub_1B93EE4EC();

      if ((v28 & 1) != 0)
        goto LABEL_53;
      ++v25;
      if (v26 == v18)
      {
LABEL_43:

        swift_bridgeObjectRelease();
        v6 = v14;
        v7 = v12;
        v4 = v30;
        v3 = v31;
        goto LABEL_9;
      }
    }
  }
  __break(1u);
LABEL_58:
  __break(1u);
}

uint64_t sub_1B90005DC(unint64_t a1, void *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;

  v3 = v2;
  v30 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - v9;
  if (a1 >> 62)
    goto LABEL_21;
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    if (!v11)
      return v12;
    v31 = MEMORY[0x1E0DEE9D8];
    result = sub_1B8E90B38(0, v11 & ~(v11 >> 63), 0);
    if (v11 < 0)
      break;
    v27 = v3;
    v28 = v11;
    v14 = 0;
    v12 = v31;
    v29 = a1 & 0xC000000000000001;
    while (v11 != v14)
    {
      if (v29)
        v15 = (id)MEMORY[0x1BCCC05FC](v14, a1);
      else
        v15 = *(id *)(a1 + 8 * v14 + 32);
      v16 = v15;
      v17 = objc_msgSend(v30, sel_itemManager, v27);
      v18 = objc_msgSend(v17, sel_indexPathForItem_, v16);

      if (v18)
      {
        sub_1B93EB8C4();

        v19 = sub_1B93EB900();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 0, 1, v19);
      }
      else
      {
        v19 = sub_1B93EB900();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 1, 1, v19);
      }
      sub_1B8EA328C((uint64_t)v7, (uint64_t)v10, &qword_1ED57E7B0);
      sub_1B93EB900();
      v20 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) == 1)
      {
        sub_1B8E26870((uint64_t)v10, &qword_1ED57E7B0);
        sub_1B9000070();
        swift_allocError();
        *v26 = 7;
        swift_willThrow();
        swift_release();

        return v12;
      }
      v21 = v10;
      v22 = v7;
      v23 = a1;
      v24 = sub_1B93EB8F4();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);

      v31 = v12;
      v3 = *(_QWORD *)(v12 + 16);
      v25 = *(_QWORD *)(v12 + 24);
      if (v3 >= v25 >> 1)
      {
        sub_1B8E90B38(v25 > 1, v3 + 1, 1);
        v12 = v31;
      }
      ++v14;
      *(_QWORD *)(v12 + 16) = v3 + 1;
      *(_QWORD *)(v12 + 8 * v3 + 32) = v24;
      v11 = v28;
      a1 = v23;
      v7 = v22;
      v10 = v21;
      if (v28 == v14)
        return v12;
    }
    __break(1u);
LABEL_21:
    sub_1B93ECF74();
    v11 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_1B90008E8(unint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  char v29;
  char *v30;
  id v31;
  unint64_t v32;
  char *v33;
  char *v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v31 - v10;
  if (a1 >> 62)
    goto LABEL_24;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v12)
  {
    v39 = MEMORY[0x1E0DEE9D8];
    sub_1B8E90B54(0, v12 & ~(v12 >> 63), 0);
    if (v12 < 0)
    {
      __break(1u);
      return;
    }
    v31 = v3;
    v32 = a1;
    v13 = 0;
    v14 = v39;
    v35 = a2;
    v36 = a1 & 0xC000000000000001;
    v33 = v8;
    v34 = v11;
    while (v12 != v13)
    {
      v37 = v13;
      v38 = v14;
      if (v36)
        v15 = (id)MEMORY[0x1BCCC05FC](v13, a1);
      else
        v15 = *(id *)(a1 + 8 * v13 + 32);
      v16 = v15;
      v17 = objc_msgSend(a2, sel_itemManager, v31);
      v18 = objc_msgSend(v17, sel_indexPathForItem_, v16);

      if (v18)
      {
        sub_1B93EB8C4();

        v19 = sub_1B93EB900();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 0, 1, v19);
      }
      else
      {
        v19 = sub_1B93EB900();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
      }
      sub_1B8EA328C((uint64_t)v8, (uint64_t)v11, &qword_1ED57E7B0);
      sub_1B93EB900();
      v20 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 1, v19) == 1)
      {
        sub_1B8E26870((uint64_t)v11, &qword_1ED57E7B0);
        v29 = 7;
LABEL_21:
        sub_1B9000070();
        swift_allocError();
        *v30 = v29;
        swift_willThrow();
        swift_release();

        return;
      }
      v21 = v12;
      v22 = sub_1B93EB8F4();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v19);
      v23 = v35;
      v24 = objc_msgSend(v35, sel_itemManager);
      v3 = objc_msgSend(v24, sel_displayedSectionIdentifierForSectionIndex_, v22);

      if (!v3)
      {
        v29 = 5;
        goto LABEL_21;
      }
      v25 = v23;
      v14 = v38;
      v39 = v38;
      v27 = *(_QWORD *)(v38 + 16);
      v26 = *(_QWORD *)(v38 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_1B8E90B54(v26 > 1, v27 + 1, 1);
        v14 = v39;
      }
      v13 = v37 + 1;
      *(_QWORD *)(v14 + 16) = v27 + 1;
      v28 = (_QWORD *)(v14 + 24 * v27);
      v28[4] = v22;
      v28[5] = v3;
      v28[6] = v16;
      v12 = v21;
      a2 = v25;
      a1 = v32;
      v8 = v33;
      v11 = v34;
      if (v21 == v13)
        return;
    }
    __break(1u);
LABEL_24:
    sub_1B93ECF74();
    v12 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
  }
}

void sub_1B9000C4C(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  _BYTE *v36;
  char *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  char v42;
  char v43;
  _BYTE *v44;
  _QWORD v45[8];
  CGPoint v46;
  CGRect v47;

  v4 = v3;
  v45[7] = a3;
  v7 = sub_1B93EB900();
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](v7).n128_u64[0];
  v11 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(v4, sel_collectionView, v9);
  if (!v12)
  {
    __break(1u);
    goto LABEL_14;
  }
  v13 = v12;
  objc_msgSend(a1, sel_locationInView_, v12);
  v15 = v14;
  v17 = v16;

  v18 = objc_msgSend(v4, sel_collectionView);
  if (!v18)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, sel_collectionViewLayout);

  objc_msgSend(v20, sel__layoutFrameForSection_, a2);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v47.origin.x = v22;
  v47.origin.y = v24;
  v47.size.width = v26;
  v47.size.height = v28;
  v46.x = v15;
  v46.y = v17;
  if (!CGRectContainsPoint(v47, v46))
  {
    sub_1B9000070();
    swift_allocError();
    *v36 = 0;
    swift_willThrow();
    return;
  }
  v29 = objc_msgSend(v4, sel_collectionView);
  if (!v29)
    goto LABEL_15;
  v30 = v29;
  v31 = (id)*MEMORY[0x1E0CEB3B8];
  MEMORY[0x1BCCBD680](0, a2);
  v32 = (void *)sub_1B93EB8B8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v33 = objc_msgSend(v30, sel_layoutAttributesForSupplementaryElementOfKind_atIndexPath_, v31, v32);

  if (v33)
  {
    objc_msgSend(v33, sel_size);
    v35 = v34;
  }
  else
  {
    v35 = 0.0;
  }
  v37 = (char *)objc_msgSend(v4, sel_layoutManager);
  v38 = *(void **)&v37[OBJC_IVAR___HUCollectionLayoutManager_layoutOptions];
  v39 = v38;

  if (!v38)
    goto LABEL_16;
  v40 = objc_msgSend(v4, sel_traitCollection);
  v41 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CollectionLayoutManager()), sel_init);
  sub_1B8E999D0(v39, v40, v15 - v22, v17 - v24 - v35);
  v43 = v42;

  if ((v43 & 1) != 0)
  {
    sub_1B9000070();
    swift_allocError();
    *v44 = 0;
    swift_willThrow();
  }

}

void sub_1B9000F94(void *a1)
{
  void *v1;
  char *v3;
  char *v4;
  void *v5;
  char *v6;

  v3 = (char *)objc_msgSend(v1, sel_layoutManager);
  v4 = &v3[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
  v5 = *(void **)&v3[OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition];
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = 0;

  v6 = (char *)objc_msgSend(v1, sel_layoutManager);
  *(_QWORD *)&v6[OBJC_IVAR___HUDashboardLayoutManager_adaptiveTileDragInteractionLayouts] = 0;

  swift_bridgeObjectRelease();
  sub_1B8FFEE4C(a1);
}

uint64_t _s6ErrorsOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s6ErrorsOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9001108 + 4 * byte_1B94412B5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1B900113C + 4 * byte_1B94412B0[v4]))();
}

uint64_t sub_1B900113C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9001144(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B900114CLL);
  return result;
}

uint64_t sub_1B9001158(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9001160);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1B9001164(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B900116C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

unint64_t sub_1B900118C()
{
  unint64_t result;

  result = qword_1EF210758;
  if (!qword_1EF210758)
  {
    result = MEMORY[0x1BCCC1BE0](&unk_1B9441308, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_1EF210758);
  }
  return result;
}

uint64_t sub_1B90011D0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B90011F4(uint64_t a1)
{
  sub_1B8FFF944(a1);
}

uint64_t sub_1B90011FC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B9001220(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1B8EA0288(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD ***)(v2 + 24));
}

unint64_t sub_1B9001228@<X0>(void **a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  unint64_t v6;
  unint64_t v7;

  result = sub_1B8FFA7C0(*a1, **(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24));
  if (!v3)
  {
    *a2 = result;
    a2[1] = v6;
    a2[2] = v7;
  }
  return result;
}

ValueMetadata *_s12SectionTupleVMa()
{
  return &_s12SectionTupleVN;
}

unint64_t sub_1B9001274()
{
  unint64_t result;

  result = qword_1EF210778;
  if (!qword_1EF210778)
  {
    result = MEMORY[0x1BCCC1BE0](&unk_1B9441388, &_s12SectionTupleVN);
    atomic_store(result, (unint64_t *)&qword_1EF210778);
  }
  return result;
}

id EmbeddedActionSetContainerSummaryGridViewController.init(actionSetBuilderContainer:home:)(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  v8 = sub_1B900244C(v7, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

__n128 sub_1B9001324@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(v1 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig);
  swift_beginAccess();
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_1B9001378(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = v1 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig;
  result = swift_beginAccess();
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = v3;
  *(_BYTE *)(v5 + 16) = v4;
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module);
  if (v7)
  {
    v8 = v7 + OBJC_IVAR____TtC6HomeUI39ActionSetContainerSummaryGridItemModule_config;
    result = swift_beginAccess();
    *(_QWORD *)v8 = v2;
    *(_QWORD *)(v8 + 8) = v3;
    *(_BYTE *)(v8 + 16) = v4;
  }
  return result;
}

void (*sub_1B9001414(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1B900146C;
}

void sub_1B900146C(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(_QWORD *)(v4 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module);
    if (v5)
    {
      v6 = (uint64_t *)(v4 + v3[4]);
      v7 = *v6;
      v8 = v6[1];
      v9 = *((_BYTE *)v6 + 16);
      v10 = v5 + OBJC_IVAR____TtC6HomeUI39ActionSetContainerSummaryGridItemModule_config;
      swift_beginAccess();
      *(_QWORD *)v10 = v7;
      *(_QWORD *)(v10 + 8) = v8;
      *(_BYTE *)(v10 + 16) = v9;
    }
  }
  free(v3);
}

uint64_t sub_1B90014FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *a2;
  v6 = *a2 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig;
  result = swift_beginAccess();
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = v3;
  *(_BYTE *)(v6 + 16) = v4;
  v8 = *(_QWORD *)(v5 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC6HomeUI39ActionSetContainerSummaryGridItemModule_config;
    result = swift_beginAccess();
    *(_QWORD *)v9 = v2;
    *(_QWORD *)(v9 + 8) = v3;
    *(_BYTE *)(v9 + 16) = v4;
  }
  return result;
}

id ActionSetContainerSummaryGridViewController.__allocating_init(actionSetBuilderContainer:home:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a1, v6);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v11, v9);
  v13 = sub_1B90021F0((uint64_t)v11, a2, v5, v6, v7);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v13;
}

id ActionSetContainerSummaryGridViewController.init(actionSetBuilderContainer:home:)(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v10, v8);
  v12 = sub_1B90021F0((uint64_t)v10, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v12;
}

uint64_t sub_1B90016FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  _BYTE v23[40];

  v6 = a4 + 16;
  sub_1B8E2D0BC(a3, (uint64_t)v23);
  objc_allocWithZone((Class)type metadata accessor for ActionSetContainerSummaryGridItemModule());
  v7 = a1;
  swift_unknownObjectRetain();
  v8 = sub_1B8FB5C3C((uint64_t)v23, v7, a2);
  swift_beginAccess();
  v9 = MEMORY[0x1BCCC1DA8](v6);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = v9 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig;
    swift_beginAccess();
    v13 = *(_QWORD *)v11;
    v12 = *(_QWORD *)(v11 + 8);
    v14 = *(_BYTE *)(v11 + 16);

  }
  else
  {
    v12 = 0;
    v14 = 1;
    v13 = 15;
  }
  v15 = &v8[OBJC_IVAR____TtC6HomeUI39ActionSetContainerSummaryGridItemModule_config];
  swift_beginAccess();
  *(_QWORD *)v15 = v13;
  *((_QWORD *)v15 + 1) = v12;
  v15[16] = v14;
  swift_beginAccess();
  v16 = MEMORY[0x1BCCC1DA8](v6);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = *(void **)(v16 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module);
    *(_QWORD *)(v16 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module) = v8;
    v19 = v8;

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v20 + 32) = v8;
  v22 = v20;
  sub_1B93EDF64();
  return v22;
}

id sub_1B9001880(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  type metadata accessor for ActionSetContainerSummaryGridItemModule();
  v3 = swift_dynamicCastClass();
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_allocWithZone((Class)type metadata accessor for ActionSetContainerSummaryGridItemModuleController());
  v6 = a1;
  v7 = objc_msgSend(v5, sel_initWithModule_, v4);
  swift_unknownObjectWeakAssign();
  v8 = *(void **)(v1 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController) = v7;
  v9 = v7;

  v10 = objc_msgSend(v9, sel_asGeneric);
  return v10;
}

id sub_1B90019C8(uint64_t a1, void *a2)
{
  char *v2;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v5 = *(void **)&v2[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController];
  if (v5 && (objc_opt_self(), (v6 = swift_dynamicCastObjCClass()) != 0))
  {
    v7 = (void *)v6;
    v8 = v5;
    v9 = a2;
    v10 = objc_msgSend(v7, sel_actionSet);
    v11 = (char *)objc_msgSend(v8, sel_module);
    v12 = *(id *)&v11[OBJC_IVAR___HUActionSetItemModule_home];

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31140]), sel_initWithExistingObject_inHome_, v10, v12);
    v14 = objc_msgSend(objc_allocWithZone((Class)HUSceneActionEditorViewController), sel_initWithActionSetBuilder_mode_, v13, 3);
    objc_msgSend(v14, sel_setShowCancelButton_, 0);
    objc_msgSend(v14, sel_setSceneEditorDelegate_, v8);

    return v14;
  }
  else
  {
    v16.receiver = v2;
    v16.super_class = (Class)type metadata accessor for ActionSetContainerSummaryGridViewController();
    return objc_msgSendSuper2(&v16, sel_detailsViewControllerForPresentationCoordinator_item_, a1, a2);
  }
}

id sub_1B9001BB4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char *v4;
  void *v9;
  id v10;
  char *v11;
  id v12;
  objc_super v14;

  v9 = *(void **)&v4[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController];
  if (v9)
  {
    v10 = v9;
    v11 = (char *)objc_msgSend(v10, sel_module);
    v12 = *(id *)&v11[OBJC_IVAR___HUActionSetItemModule_home];

    LODWORD(v11) = objc_msgSend(v12, sel_hf_currentUserIsAdministrator);
    if (!(_DWORD)v11)
      return 0;
  }
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ActionSetContainerSummaryGridViewController();
  return objc_msgSendSuper2(&v14, sel_presentationCoordinator_shouldBeginInteractivePresentationWithTouchLocation_view_, a1, a2, a3, a4);
}

id ActionSetContainerSummaryGridViewController.__allocating_init(itemManager:collectionViewLayout:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithItemManager_collectionViewLayout_, a1, a2);

  return v5;
}

void ActionSetContainerSummaryGridViewController.init(itemManager:collectionViewLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActionSetContainerSummaryGridViewController.__allocating_init(usingCompositionalLayoutWith:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initUsingCompositionalLayoutWithItemManager_, a1);

  return v3;
}

void ActionSetContainerSummaryGridViewController.init(usingCompositionalLayoutWith:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActionSetContainerSummaryGridViewController.__deallocating_deinit()
{
  return sub_1B8F0B3F0(type metadata accessor for ActionSetContainerSummaryGridViewController);
}

void sub_1B9001EAC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  objc_super v20;

  v1 = &v0[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig];
  swift_beginAccess();
  *(_QWORD *)v1 = 4;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module];
  swift_beginAccess();
  if (v2)
  {
    v3 = *((_QWORD *)v1 + 1);
    v4 = v1[16];
    v5 = v2 + OBJC_IVAR____TtC6HomeUI39ActionSetContainerSummaryGridItemModule_config;
    swift_beginAccess();
    *(_QWORD *)v5 = 4;
    *(_QWORD *)(v5 + 8) = v3;
    *(_BYTE *)(v5 + 16) = v4;
    swift_beginAccess();
    *((_QWORD *)v1 + 1) = 2;
    v1[16] = 0;
    v6 = *(_QWORD *)v1;
    v1 = (char *)(v2 + OBJC_IVAR____TtC6HomeUI39ActionSetContainerSummaryGridItemModule_config);
    swift_beginAccess();
    *(_QWORD *)v1 = v6;
  }
  *((_QWORD *)v1 + 1) = 2;
  v1[16] = 0;
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for EmbeddedActionSetContainerSummaryGridViewController();
  objc_msgSendSuper2(&v20, sel_viewDidLoad);
  v7 = objc_msgSend(v0, sel_collectionView);
  if (!v7)
  {
    __break(1u);
    goto LABEL_10;
  }
  v8 = v7;
  objc_msgSend(v7, sel__setShouldDeriveVisibleBoundsFromContainingScrollView_, 1);

  v9 = objc_msgSend(v0, sel_collectionView);
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v10 = v9;
  objc_msgSend(v9, sel_setScrollEnabled_, 0);

  v11 = objc_msgSend(v0, sel_collectionView);
  if (!v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v12 = v11;
  objc_msgSend(v11, sel_setClipsToBounds_, 0);

  v13 = objc_msgSend(v0, sel_collectionView);
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v14 = v13;
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_clearColor);
  objc_msgSend(v14, sel_setBackgroundColor_, v16);

  v17 = objc_msgSend(v0, sel_view);
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v15, sel_clearColor);
    objc_msgSend(v18, sel_setBackgroundColor_, v19);

    return;
  }
LABEL_13:
  __break(1u);
}

id EmbeddedActionSetContainerSummaryGridViewController.__allocating_init(actionSetBuilderContainer:home:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a1, v6);
  v9 = sub_1B900244C(v8, a2, v5, v6, v7);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

id EmbeddedActionSetContainerSummaryGridViewController.__deallocating_deinit()
{
  return sub_1B8F0B3F0(type metadata accessor for EmbeddedActionSetContainerSummaryGridViewController);
}

id sub_1B90021F0(uint64_t a1, void *a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27[2];
  objc_super v28;
  uint64_t v29[5];

  v29[3] = a4;
  v29[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_module] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_moduleController] = 0;
  v10 = &a3[OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig];
  *(_OWORD *)v10 = xmmword_1B9438ED0;
  v10[16] = 1;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31810]), sel_initWithDelegate_, 0);
  v28.receiver = a3;
  v28.super_class = (Class)type metadata accessor for ActionSetContainerSummaryGridViewController();
  v12 = objc_msgSendSuper2(&v28, sel_initUsingCompositionalLayoutWithItemManager_, v11);
  objc_msgSend(v11, sel_setDelegate_, v12);
  v13 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a2;
    v25 = sub_1B8FF4A00;
    v26 = v14;
    v21 = v13;
    v22 = 1107296256;
    v23 = sub_1B8E36AA4;
    v24 = &block_descriptor_10_5;
    v15 = _Block_copy(&v21);
    v16 = a2;
    swift_release();
    objc_msgSend(v11, sel_setHomeCreator_, v15);
    _Block_release(v15);

  }
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1B8E2D0BC((uint64_t)v29, (uint64_t)v27);
  v18 = swift_allocObject();
  sub_1B8E35A58(v27, v18 + 16);
  *(_QWORD *)(v18 + 56) = v17;
  v25 = sub_1B8EA6338;
  v26 = v18;
  v21 = v13;
  v22 = 1107296256;
  v23 = sub_1B8ED0F64;
  v24 = &block_descriptor_45;
  v19 = _Block_copy(&v21);
  swift_release();
  objc_msgSend(v11, sel_setItemModuleCreator_, v19);

  _Block_release(v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return v12;
}

id sub_1B900244C(uint64_t a1, void *a2, char *a3, uint64_t a4, uint64_t a5)
{
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v9 = MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v11, v9);
  return sub_1B90021F0((uint64_t)v11, a2, a3, a4, a5);
}

uint64_t type metadata accessor for ActionSetContainerSummaryGridViewController()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for EmbeddedActionSetContainerSummaryGridViewController()
{
  return objc_opt_self();
}

__n128 sub_1B9002520@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC6HomeUI43ActionSetContainerSummaryGridViewController_actionSetGridConfig);
  swift_beginAccess();
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t method lookup function for ActionSetContainerSummaryGridViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActionSetContainerSummaryGridViewController.actionSetGridConfig.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActionSetContainerSummaryGridViewController.actionSetGridConfig.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActionSetContainerSummaryGridViewController.actionSetGridConfig.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActionSetContainerSummaryGridViewController.__allocating_init(actionSetBuilderContainer:home:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_1B90025E4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B9002608()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B9002634()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t UIConfigurationState.isActive.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9002A8C(a1, a2, a3, &qword_1ED57EA70, (id *)&qword_1ED57E798);
}

uint64_t UIConfigurationState.hasActivity.getter(uint64_t a1, uint64_t a2)
{
  return sub_1B8E2B65C(a1, a2, &qword_1ED57EA48);
}

uint64_t UIConfigurationState.updated(with:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  id v8;
  _BOOL8 v9;
  id v11;
  _QWORD v12[3];
  uint64_t v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a4, v4, a2);
  if (sub_1B9002C40())
    goto LABEL_13;
  MEMORY[0x1BCCC01F4](v12, *MEMORY[0x1E0D30E20]);
  if (!v13)
  {
    sub_1B8E26870((uint64_t)v12, (uint64_t *)&unk_1ED57EC00);
    goto LABEL_6;
  }
  sub_1B8E2CB34();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v11;
  UIConfigurationState.isActive.setter(objc_msgSend(v8, sel_integerValue) == (id)2, a2, a3);

LABEL_7:
  MEMORY[0x1BCCC01F4](v12, *MEMORY[0x1E0D30D90]);
  if (v13)
  {
    sub_1B8E2CB34();
    if ((swift_dynamicCast() & 1) != 0)
    {
      if ((objc_msgSend(v11, sel_BOOLValue) & 1) == 0)
      {

        goto LABEL_13;
      }
      UIConfigurationState.isActive.setter(0, a2, a3);

    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v12, (uint64_t *)&unk_1ED57EC00);
  }

LABEL_13:
  UIConfigurationState.hasActivity.setter(((unint64_t)objc_msgSend(a1, sel_loadingState) >> 1) & 1, a2, a3);
  MEMORY[0x1BCCC01F4](v12, *MEMORY[0x1E0D30C40]);
  v9 = v13 != 0;
  sub_1B8E26870((uint64_t)v12, (uint64_t *)&unk_1ED57EC00);
  return UIConfigurationState.isDisabled.setter(v9, a2, a3);
}

uint64_t UIConfigurationState.borderStyle.setter(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  id v5;

  if (qword_1ED57EA38 != -1)
    swift_once();
  v3 = (void *)qword_1ED57E778;
  if ((a2 & 1) != 0)
  {
    v5 = (id)qword_1ED57E778;
  }
  else
  {
    type metadata accessor for HUTileCellBorderStyle(0);
    sub_1B8E2C710((unint64_t *)&unk_1ED57E9C0, (uint64_t (*)(uint64_t))type metadata accessor for HUTileCellBorderStyle, (uint64_t)&unk_1B9437DF4);
    v4 = v3;
    sub_1B93EE7EC();
  }
  return sub_1B93ECCF8();
}

uint64_t UIConfigurationState.backgroundDisplayStyle.setter(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  id v5;

  if (qword_1ED57EA60 != -1)
    swift_once();
  v3 = (void *)qword_1ED57E790;
  if ((a2 & 1) != 0)
  {
    v5 = (id)qword_1ED57E790;
  }
  else
  {
    type metadata accessor for HUTileCellBackgroundDisplayStyle(0);
    sub_1B8E2C710((unint64_t *)&unk_1ED57EA78, (uint64_t (*)(uint64_t))type metadata accessor for HUTileCellBackgroundDisplayStyle, (uint64_t)&unk_1B9437DB0);
    v4 = v3;
    sub_1B93EE7EC();
  }
  return sub_1B93ECCF8();
}

uint64_t UIConfigurationState.isToggleable.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9002A8C(a1, a2, a3, &qword_1ED57EA58, (id *)&qword_1ED57E788);
}

uint64_t sub_1B9002A8C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, id *a5)
{
  id v6;

  if (*a4 != -1)
    swift_once();
  v6 = *a5;
  sub_1B93EE7EC();
  return sub_1B93ECCF8();
}

id static UIConfigurationStateCustomKey.hasActivity.getter()
{
  return sub_1B8E9918C(&qword_1ED57EA48, (id *)&qword_1ED57E780);
}

id static UIConfigurationStateCustomKey.isActive.getter()
{
  return sub_1B8E9918C(&qword_1ED57EA70, (id *)&qword_1ED57E798);
}

id static UIConfigurationStateCustomKey.borderStyle.getter()
{
  return sub_1B8E9918C(&qword_1ED57EA38, (id *)&qword_1ED57E778);
}

id static UIConfigurationStateCustomKey.backgroundDisplayStyle.getter()
{
  return sub_1B8E9918C(&qword_1ED57EA60, (id *)&qword_1ED57E790);
}

id static UIConfigurationStateCustomKey.isToggleable.getter()
{
  return sub_1B8E9918C(&qword_1ED57EA58, (id *)&qword_1ED57E788);
}

id static UIConfigurationStateCustomKey.isDisabled.getter()
{
  return sub_1B8E9918C(&qword_1ED57EA30, (id *)&qword_1ED57E770);
}

uint64_t (*UIConfigurationState.isActive.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 24) = UIConfigurationState.isActive.getter(a2, a3) & 1;
  return sub_1B9002C18;
}

uint64_t sub_1B9002C18(uint64_t a1)
{
  return UIConfigurationState.isActive.setter(*(unsigned __int8 *)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

BOOL sub_1B9002C40()
{
  _BOOL8 v0;
  _BYTE v2[24];
  uint64_t v3;

  if (qword_1ED57EA70 != -1)
    swift_once();
  sub_1B93ECCEC();
  v0 = v3 != 0;
  sub_1B8E26870((uint64_t)v2, &qword_1ED57EB50);
  return v0;
}

void (*UIConfigurationState.borderStyle.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD **a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v7;
  char v8;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[3] = a3;
  v7[4] = v3;
  v7[2] = a2;
  *v7 = UIConfigurationState.borderStyle.getter(a2, a3);
  *((_BYTE *)v7 + 8) = v8 & 1;
  return sub_1B9002D40;
}

void sub_1B9002D40(_QWORD **a1, uint64_t a2)
{
  sub_1B9002DC8(a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))UIConfigurationState.borderStyle.setter);
}

void (*UIConfigurationState.backgroundDisplayStyle.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD **a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v7;
  char v8;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[3] = a3;
  v7[4] = v3;
  v7[2] = a2;
  *v7 = UIConfigurationState.backgroundDisplayStyle.getter(a2, a3);
  *((_BYTE *)v7 + 8) = v8 & 1;
  return sub_1B9002DBC;
}

void sub_1B9002DBC(_QWORD **a1, uint64_t a2)
{
  sub_1B9002DC8(a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))UIConfigurationState.backgroundDisplayStyle.setter);
}

void sub_1B9002DC8(_QWORD **a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  v3 = *a1;
  a3(**a1, *((unsigned __int8 *)*a1 + 8), (*a1)[2], (*a1)[3]);
  free(v3);
}

uint64_t UIConfigurationState.hasActivity.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9002A8C(a1, a2, a3, &qword_1ED57EA48, (id *)&qword_1ED57E780);
}

uint64_t (*UIConfigurationState.hasActivity.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 24) = UIConfigurationState.hasActivity.getter(a2, a3) & 1;
  return sub_1B9002E60;
}

uint64_t sub_1B9002E60(uint64_t a1)
{
  return UIConfigurationState.hasActivity.setter(*(unsigned __int8 *)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t (*UIConfigurationState.isToggleable.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 24) = UIConfigurationState.isToggleable.getter(a2, a3) & 1;
  return sub_1B9002ECC;
}

uint64_t sub_1B9002ECC(uint64_t a1)
{
  return UIConfigurationState.isToggleable.setter(*(unsigned __int8 *)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t UIConfigurationState.isDisabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9002A8C(a1, a2, a3, &qword_1ED57EA30, (id *)&qword_1ED57E770);
}

uint64_t (*UIConfigurationState.isDisabled.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 24) = UIConfigurationState.isDisabled.getter(a2, a3) & 1;
  return sub_1B9002F54;
}

uint64_t sub_1B9002F54(uint64_t a1)
{
  return UIConfigurationState.isDisabled.setter(*(unsigned __int8 *)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t sub_1B9002F7C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  return keypath_getTm_2(a1, a2, UIConfigurationState.isActive.getter, a3);
}

uint64_t sub_1B9002F88(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UIConfigurationState.isActive.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1B9002FB4()
{
  return 16;
}

__n128 sub_1B9002FC0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1B9002FCC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return keypath_get_1Tm_0(a1, a2, UIConfigurationState.borderStyle.getter, a3);
}

uint64_t sub_1B9002FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))UIConfigurationState.borderStyle.setter);
}

uint64_t sub_1B9002FE4()
{
  return 16;
}

__n128 sub_1B9002FF0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1B9002FFC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return keypath_get_1Tm_0(a1, a2, UIConfigurationState.backgroundDisplayStyle.getter, a3);
}

uint64_t keypath_get_1Tm_0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (*a3)(_QWORD, _QWORD)@<X3>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = a3(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t sub_1B9003040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))UIConfigurationState.backgroundDisplayStyle.setter);
}

uint64_t keypath_set_2Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1B9003080()
{
  return 16;
}

__n128 sub_1B900308C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1B9003098@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  return keypath_getTm_2(a1, a2, UIConfigurationState.hasActivity.getter, a3);
}

uint64_t sub_1B90030A4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UIConfigurationState.hasActivity.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1B90030D0()
{
  return 16;
}

__n128 sub_1B90030DC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1B90030E8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  return keypath_getTm_2(a1, a2, UIConfigurationState.isToggleable.getter, a3);
}

uint64_t sub_1B90030F4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UIConfigurationState.isToggleable.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1B9003120()
{
  return 16;
}

__n128 sub_1B900312C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1B9003138@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  return keypath_getTm_2(a1, a2, UIConfigurationState.isDisabled.getter, a3);
}

uint64_t keypath_getTm_2@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (*a3)(_QWORD, _QWORD)@<X3>, _BYTE *a4@<X8>)
{
  uint64_t result;

  result = a3(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a4 = result & 1;
  return result;
}

uint64_t sub_1B9003178(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UIConfigurationState.isDisabled.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1B90031A4()
{
  return 16;
}

__n128 sub_1B90031B0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void static HUGraphicsUtilities.setRearrangingAnimation(rearranging:layer:frame:)(char a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGRect v12;

  CGRectGetHeight(*(CGRect *)&a3);
  v12.origin.x = a3;
  v12.origin.y = a4;
  v12.size.width = a5;
  v12.size.height = a6;
  CGRectGetWidth(v12);
  sub_1B8E33EF8(a1, a2);
}

id sub_1B900324C()
{
  id v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CD27D0]);
  LODWORD(v1) = 1052266988;
  LODWORD(v2) = 1059145646;
  LODWORD(v3) = 0;
  LODWORD(v4) = 1.0;
  result = objc_msgSend(v0, sel_initWithControlPoints__::, v1, v3, v2, v4);
  qword_1EF2107E8 = (uint64_t)result;
  return result;
}

id sub_1B9003350()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2710]), sel_init);
  v1 = (void *)sub_1B93EDD84();
  objc_msgSend(v0, sel_setKeyPath_, v1);

  objc_msgSend(v0, sel_setDuration_, 0.134);
  v2 = v0;
  objc_msgSend(v2, sel_setBeginTime_, (double)arc4random_uniform(0x64u) / 100.0);

  v3 = (void *)sub_1B93EB954();
  objc_msgSend(v2, sel_setFromValue_, v3);

  v4 = (void *)sub_1B93EB954();
  objc_msgSend(v2, sel_setToValue_, v4);

  v5 = qword_1EF207848;
  v6 = v2;
  if (v5 != -1)
    swift_once();
  objc_msgSend(v6, sel_setTimingFunction_, qword_1EF2107E8);

  LODWORD(v7) = 2139095039;
  objc_msgSend(v6, sel_setRepeatCount_, v7);
  objc_msgSend(v6, sel_setAutoreverses_, 1);
  objc_msgSend(v6, sel_setRemovedOnCompletion_, 0);
  return v6;
}

id sub_1B90034F4()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2710]), sel_init);
  v1 = (void *)sub_1B93EDD84();
  objc_msgSend(v0, sel_setKeyPath_, v1);

  objc_msgSend(v0, sel_setDuration_, 0.128);
  v2 = v0;
  objc_msgSend(v2, sel_setBeginTime_, (double)arc4random_uniform(0x64u) / 100.0);

  v3 = (void *)sub_1B93EB954();
  objc_msgSend(v2, sel_setFromValue_, v3);

  v4 = (void *)sub_1B93EB954();
  objc_msgSend(v2, sel_setToValue_, v4);

  v5 = qword_1EF207848;
  v6 = v2;
  if (v5 != -1)
    swift_once();
  objc_msgSend(v6, sel_setTimingFunction_, qword_1EF2107E8);

  LODWORD(v7) = 2139095039;
  objc_msgSend(v6, sel_setRepeatCount_, v7);
  objc_msgSend(v6, sel_setAutoreverses_, 1);
  objc_msgSend(v6, sel_setRemovedOnCompletion_, 0);
  return v6;
}

uint64_t OnChangeAfterInitialSetupModifier.propertyToObserve.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B93EDB80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t OnChangeAfterInitialSetupModifier.propertyToObserve.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B93EDB80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*OnChangeAfterInitialSetupModifier.propertyToObserve.modify())()
{
  return CGSizeMake;
}

uint64_t OnChangeAfterInitialSetupModifier.initialValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t OnChangeAfterInitialSetupModifier.onChangeHandler.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 40));
  swift_retain();
  return v2;
}

uint64_t sub_1B9003770()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E628);
  sub_1B93EDAE4();
  return v1;
}

uint64_t sub_1B90037C4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E628);
  return sub_1B93EDAF0();
}

uint64_t OnChangeAfterInitialSetupModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(unint64_t, char *, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, uint64_t);
  _QWORD v42[2];
  void (*v43)(char *, uint64_t, uint64_t, __n128);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  _QWORD v58[4];
  _QWORD v59[3];

  v4 = v3;
  v53 = a1;
  v57 = a3;
  v6 = *(_QWORD *)(a2 + 16);
  v56 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](a1);
  v54 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v12 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for OnChangeAfterInitialSetupModifier<A>, v12);
  v13 = sub_1B93ED5E0();
  v45 = v13;
  v14 = sub_1B93ED334();
  v55 = *(_QWORD *)(v14 - 8);
  v49 = v14;
  v15 = MEMORY[0x1E0C80A78](v14);
  v46 = (char *)v42 - v16;
  v44 = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CDBF10], v13, v15);
  v59[0] = v44;
  v59[1] = MEMORY[0x1E0CDC8B0];
  v50 = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CD9C20], v14, v59);
  v17 = *(_QWORD *)(a2 + 24);
  v58[0] = v14;
  v58[1] = v6;
  v18 = v6;
  v58[2] = v50;
  v58[3] = v17;
  v19 = v17;
  v42[0] = v17;
  v20 = MEMORY[0x1BCCC1B98](0, v58, MEMORY[0x1E0CDF160], 0);
  v51 = *(_QWORD *)(v20 - 8);
  v52 = v20;
  MEMORY[0x1E0C80A78](v20);
  v47 = (char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v22);
  v48 = (char *)v42 - v24;
  v43 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v9 + 16);
  v43((char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a2, v23);
  v25 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v6;
  *(_QWORD *)(v26 + 24) = v19;
  v27 = *(void (**)(unint64_t, char *, uint64_t))(v9 + 32);
  v28 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27(v26 + v25, v28, a2);
  v29 = v46;
  sub_1B93ED97C();
  swift_release();
  v30 = sub_1B93EDB80();
  v31 = v54;
  v32 = v42[1];
  MEMORY[0x1BCCBF900](v30);
  ((void (*)(char *, uint64_t, uint64_t))v43)(v28, v32, a2);
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v18;
  *(_QWORD *)(v33 + 24) = v42[0];
  v27(v33 + v25, v28, a2);
  v34 = v47;
  v35 = v49;
  sub_1B93ED988();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v31, v18);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v29, v35);
  v36 = v51;
  v37 = v52;
  v38 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  v39 = v48;
  v38(v48, v34, v52);
  v40 = *(void (**)(char *, uint64_t))(v36 + 8);
  v40(v34, v37);
  v38(v57, v39, v37);
  return ((uint64_t (*)(char *, uint64_t))v40)(v39, v37);
}

uint64_t sub_1B9003BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  _QWORD v18[2];

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v18 - v10;
  v18[1] = sub_1B93EDB80();
  MEMORY[0x1BCCBF900]();
  v13 = a1 + *(int *)(type metadata accessor for OnChangeAfterInitialSetupModifier(0, a2, a3, v12) + 36);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v8, v13, a2);
  v15 = sub_1B93EDD78();
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v8, a2);
  v16(v11, a2);
  if ((v15 & 1) != 0)
    return sub_1B90037C4();
  v14(v11, v13, a2);
  return sub_1B93EDB5C();
}

uint64_t type metadata accessor for OnChangeAfterInitialSetupModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OnChangeAfterInitialSetupModifier);
}

uint64_t sub_1B9003D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B9003E58(sub_1B9003BBC, a2, a3, a4);
}

uint64_t sub_1B9003D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = type metadata accessor for OnChangeAfterInitialSetupModifier(0, a2, a3, a4);
  if ((sub_1B9003770() & 1) != 0)
    return (*(uint64_t (**)(void))(a1 + *(int *)(v5 + 40)))();
  else
    return sub_1B90037C4();
}

uint64_t objectdestroyTm_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for OnChangeAfterInitialSetupModifier(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  swift_release();
  swift_release();
  v9 = sub_1B93EDB80();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v10(v8 + *(int *)(v9 + 32), v5);
  v10(v8 + *(int *)(v6 + 36), v5);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B9003E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B9003E58((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B9003D24, a2, a3, a4);
}

uint64_t sub_1B9003E58(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for OnChangeAfterInitialSetupModifier(0, v5, v6, a4) - 8)
                          + 80);
  return a1(v4 + ((v7 + 32) & ~v7), v5, v6);
}

uint64_t sub_1B9003EB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B9003EF4()
{
  return sub_1B93ED2A4();
}

uint64_t sub_1B9003F10()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1B93EDB80();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1B9003FB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;

  v3 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = ((v5 + 16) & ~v5) + v6 + v5;
  v8 = v6 + 7;
  v9 = *(_DWORD *)(v4 + 80) & 0x100000;
  v10 = *a2;
  *a1 = *a2;
  if (v5 > 7
    || v9 != 0
    || ((((v6 + 7 + (v7 & ~v5)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v14 = (uint64_t *)(v10 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
  }
  else
  {
    v14 = a1;
    v15 = ~v5;
    v16 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v16 = *v17;
    v27 = ((unint64_t)v16 + v5 + 8) & ~v5;
    v18 = ((unint64_t)v17 + v5 + 8) & ~v5;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    swift_retain();
    swift_retain();
    v19(v27, v18, v3);
    v20 = ((unint64_t)a2 + v7) & v15;
    v19(((unint64_t)v14 + v7) & v15, v20, v3);
    v21 = (_QWORD *)((v8 + (((unint64_t)v14 + v7) & v15)) & 0xFFFFFFFFFFFFFFF8);
    v22 = (_QWORD *)((v8 + v20) & 0xFFFFFFFFFFFFFFF8);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = ((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8;
    v25 = ((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v24 = *(_BYTE *)v25;
    *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
    swift_retain();
  }
  swift_retain();
  return v14;
}

uint64_t sub_1B9004134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(unint64_t, uint64_t);

  v4 = a1 + 15;
  swift_release();
  swift_release();
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((v4 & 0xFFFFFFFFFFFFFFF8) + v7 + 8) & ~v7;
  v9 = *(void (**)(unint64_t, uint64_t))(v6 + 8);
  v9(v8, v5);
  v9((v7 + a1 + *(_QWORD *)(v6 + 64) + ((v7 + 16) & ~v7)) & ~v7, v5);
  swift_release();
  return swift_release();
}

_QWORD *sub_1B90041E8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v5 + v9 + 8) & ~v9;
  v11 = ((unint64_t)v6 + v9 + 8) & ~v9;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  swift_retain();
  swift_retain();
  v12(v10, v11, v7);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = ((v9 + 16) & ~v9) + v13 + v9;
  v15 = ((unint64_t)a1 + v14) & ~v9;
  v16 = ((unint64_t)a2 + v14) & ~v9;
  v12(v15, v16, v7);
  v17 = (_QWORD *)((v13 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)((v13 + 7 + v16) & 0xFFFFFFFFFFFFFFF8);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = ((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  v21 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_1B9004308(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(unint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  v7 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  *v7 = *(_QWORD *)v6;
  swift_retain();
  swift_release();
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (v10 + 8 + v6) & ~v10;
  v12 = *(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 24);
  v12(((unint64_t)v7 + v10 + 8) & ~v10, v11, v8);
  v13 = *(_QWORD *)(v9 + 64);
  v14 = ((v10 + 16) & ~v10) + v13 + v10;
  v15 = ((unint64_t)a1 + v14) & ~v10;
  v16 = ((unint64_t)a2 + v14) & ~v10;
  v12(v15, v16, v8);
  v17 = (_QWORD *)((v13 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)((v13 + 7 + v16) & 0xFFFFFFFFFFFFFFF8);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  v20 = ((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  v21 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_1B9004444(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(unint64_t, unint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  _OWORD *v16;

  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32);
  v10(((unint64_t)v5 + v9 + 8) & ~v9, ((unint64_t)v6 + v9 + 8) & ~v9, v7);
  v11 = *(_QWORD *)(v8 + 64);
  v12 = ((v9 + 16) & ~v9) + v11 + v9;
  v13 = ((unint64_t)a1 + v12) & ~v9;
  v14 = ((unint64_t)a2 + v12) & ~v9;
  v10(v13, v14, v7);
  v15 = (_OWORD *)((v11 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  v16 = (_OWORD *)((v11 + 7 + v14) & 0xFFFFFFFFFFFFF8);
  *v15 = *v16;
  *(_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_1B900452C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, unint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _OWORD *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_release();
  v7 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  *v7 = *(_QWORD *)v6;
  swift_release();
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)v7 + v10 + 8) & ~v10;
  v12 = *(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 40);
  v12(v11, (v10 + 8 + v6) & ~v10, v8);
  v13 = *(_QWORD *)(v9 + 64);
  v14 = ((v10 + 16) & ~v10) + v13 + v10;
  v15 = ((unint64_t)a1 + v14) & ~v10;
  v16 = ((unint64_t)a2 + v14) & ~v10;
  v12(v15, v16, v8);
  v17 = (_OWORD *)((v13 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  v18 = v13 + 7 + v16;
  v19 = (v18 & 0xFFFFFFFFFFFFF8) + 23;
  *v17 = *(_OWORD *)(v18 & 0xFFFFFFFFFFFFF8);
  swift_release();
  v20 = ((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v20 = *(_BYTE *)(v19 & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)(v20 + 8) = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  return a1;
}

uint64_t sub_1B9004644(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t *v12;
  unint64_t v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    v12 = (unint64_t *)((a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v12 + v7 + 8) & ~v7);
    }
    else
    {
      v13 = *v12;
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
  }
  else
  {
    if (((((((*(_QWORD *)(v4 + 64) + ((*(_QWORD *)(v4 + 64) + v7 + ((v7 + 16) & ~v7)) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1B90046E4 + 4 * byte_1B94414A0[v10]))();
  }
}

void sub_1B900476C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64)
           + ((*(_DWORD *)(v5 + 64)
             + *(unsigned __int8 *)(v5 + 80)
             + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~*(unsigned __int8 *)(v5 + 80))) & ~*(unsigned __int8 *)(v5 + 80))
           + 7) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X13 }
  }
  if (((((*(_DWORD *)(v5 + 64)
         + ((*(_DWORD *)(v5 + 64)
           + *(unsigned __int8 *)(v5 + 80)
           + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~*(unsigned __int8 *)(v5 + 80))) & ~*(unsigned __int8 *)(v5 + 80))
         + 7) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64)+ ((*(_QWORD *)(v5 + 64)+ *(unsigned __int8 *)(v5 + 80)+ ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_1B9004888()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x1B90048F8);
}

void sub_1B9004890(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x1B9004898);
  JUMPOUT(0x1B90048F8);
}

void sub_1B90048B0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x1B90048F8);
}

void sub_1B90048B8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x1B90048F8);
}

void sub_1B90048C0(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((a2 & 0x80000000) == 0)
        JUMPOUT(0x1B90048F4);
      JUMPOUT(0x1B90048F0);
    }
    JUMPOUT(0x1B90048CCLL);
  }
  JUMPOUT(0x1B90048F8);
}

uint64_t sub_1B9004910(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v4 = type metadata accessor for OnChangeAfterInitialSetupModifier(255, *a1, a1[1], a4);
  MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for OnChangeAfterInitialSetupModifier<A>, v4);
  v5 = sub_1B93ED5E0();
  v6 = sub_1B93ED334();
  v8[0] = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CDBF10], v5);
  v8[1] = MEMORY[0x1E0CDC8B0];
  MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CD9C20], v6, v8);
  return swift_getOpaqueTypeConformance2();
}

void UIBackgroundConfiguration.TileCellBackgroundBuilder.build(configuration:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = v2;
  v6 = sub_1B93ECDD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  v7 = (void *)sub_1B93ECCE0();
  v8 = objc_msgSend(v7, sel_preferredContentSizeCategory);

  sub_1B93EE360();
  sub_1B93ECD7C();
  sub_1B8E5EC7C(a2);
  sub_1B8E5E728(a2);
}

Swift::Void __swiftcall UIBackgroundConfiguration.addDashedBorderIfNeeded()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void **v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
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
  void *v37;
  _QWORD v38[4];

  v1 = v0;
  v2 = sub_1B93ECDD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B93ECD40();
  if (v6)
  {
    v7 = (void *)v6;
    type metadata accessor for TileCellDashedBorderView();
    v8 = swift_dynamicCastClass();
    if (v8)
    {
      v9 = (void *)v8;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

      return;
    }

  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v10 = (void *)sub_1B8E5EB28();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  if (!v10)
  {
    sub_1B93ECD70();
    v12 = v11;
    v13 = objc_allocWithZone((Class)type metadata accessor for TileCellDashedBorderView());
    v14 = TileCellDashedBorderView.init(frame:cornerRadius:)(0.0, 0.0, 0.0, 0.0, v12);
    v15 = sub_1B93ECD40();
    if (v15)
    {
      v16 = (void *)v15;
      type metadata accessor for TileCellBackgroundView();
      v17 = swift_dynamicCastClass();
      if (v17)
      {
        v18 = (void **)(v17 + OBJC_IVAR___HUTileCellBackgroundView_dashedBorderView);
        swift_beginAccess();
        v19 = *v18;
        *v18 = v14;
        v20 = v14;
        sub_1B8FF6A74(v19);

        return;
      }

    }
    v21 = (void *)sub_1B93ECD40();
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, sel_addSubview_, v14);
      objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v23 = (void *)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_1B9438CD0;
      v25 = objc_msgSend(v14, sel_leadingAnchor);
      v26 = objc_msgSend(v22, sel_leadingAnchor);
      v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v26);

      *(_QWORD *)(v24 + 32) = v27;
      v28 = objc_msgSend(v14, sel_trailingAnchor);
      v29 = objc_msgSend(v22, sel_trailingAnchor);
      v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

      *(_QWORD *)(v24 + 40) = v30;
      v31 = objc_msgSend(v14, sel_topAnchor);
      v32 = objc_msgSend(v22, sel_topAnchor);
      v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

      *(_QWORD *)(v24 + 48) = v33;
      v34 = objc_msgSend(v14, sel_bottomAnchor);
      v35 = objc_msgSend(v22, sel_bottomAnchor);
      v36 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v35);

      *(_QWORD *)(v24 + 56) = v36;
      v38[1] = v24;
      sub_1B93EDF64();
      sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E9A0);
      v37 = (void *)sub_1B93EDF34();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_activateConstraints_, v37);

    }
    else
    {
      sub_1B93ECD4C();
    }
  }
}

uint64_t _s25TileCellBackgroundBuilderVwca(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t _s25TileCellBackgroundBuilderVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t _s25TileCellBackgroundBuilderVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s25TileCellBackgroundBuilderVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UIBackgroundConfiguration.TileCellBackgroundBuilder()
{
  return &type metadata for UIBackgroundConfiguration.TileCellBackgroundBuilder;
}

uint64_t sub_1B900503C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1B8E382C8((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_1B8E8FD04((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B8E29EA8(a1);
    sub_1B8E8E908(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1B8E29EA8((uint64_t)v9);
  }
}

uint64_t sub_1B9005140()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_1B90051EC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1B900523C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1B90052A4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id UtilityOnboardingTermsViewController.__allocating_init(context:)(char *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return UtilityOnboardingTermsViewController.init(context:)(a1);
}

id UtilityOnboardingTermsViewController.init(context:)(char *a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  void **v8;
  void *v9;
  id v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t *v18;
  id v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id result;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  objc_super v28;
  objc_super v29;
  uint64_t v30;
  unint64_t v31;

  v2 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___HUUtilityOnboardingTermsViewController_agreeButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___HUUtilityOnboardingTermsViewController_onboardingContext] = a1;
  v4 = &a1[OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID];
  swift_beginAccess();
  if (*((_QWORD *)v4 + 1))
  {
    v5 = *(_QWORD *)v4;
    v6 = *((_QWORD *)v4 + 1);
  }
  else
  {
    v5 = 0;
    v6 = 0xE000000000000000;
  }
  v7 = &v1[OBJC_IVAR___HUUtilityOnboardingTermsViewController_utilityID];
  *(_QWORD *)v7 = v5;
  *((_QWORD *)v7 + 1) = v6;
  v8 = (void **)&a1[OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_config];
  swift_beginAccess();
  v9 = *v8;
  if (v9)
  {
    sub_1B93ECF74();
    v10 = v9;
    v11 = v1;
    v12 = a1;
    v13 = sub_1B93EC164();
    v15 = v14;

    if (v15)
      goto LABEL_9;
  }
  else
  {
    sub_1B93ECF74();
    v16 = v1;
    v17 = a1;
  }
  swift_bridgeObjectRelease();
  v13 = 0;
  v15 = 0xE000000000000000;
LABEL_9:
  v18 = (uint64_t *)&v2[OBJC_IVAR___HUUtilityOnboardingTermsViewController_termsAndConditions];
  *v18 = v13;
  v18[1] = v15;
  sub_1B93ECF74();

  v30 = v13;
  v31 = v15;
  v19 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EF210898));
  v20 = (void *)sub_1B93ED4FC();
  v21 = (void *)sub_1B93EDD84();
  v22 = HULocalizedString(v21);

  if (!v22)
  {
    sub_1B93EDDB4();
    v22 = (__CFString *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  result = objc_msgSend(v20, sel_view);
  if (result)
  {
    v24 = result;
    v25 = (objc_class *)type metadata accessor for UtilityOnboardingTermsViewController();
    v29.receiver = v2;
    v29.super_class = v25;
    v26 = objc_msgSendSuper2(&v29, sel_initWithTitle_detailText_icon_contentView_, v22, 0, 0, v24);

    v28.receiver = v26;
    v28.super_class = v25;
    v27 = v26;
    objc_msgSendSuper2(&v28, sel_setContentMode_, 0);

    return v27;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for UtilityOnboardingTermsViewController()
{
  return objc_opt_self();
}

uint64_t sub_1B90055B8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2108A0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B93EBA2C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for UtilityOnboardingTermsViewController();
  v15.receiver = v0;
  v15.super_class = v8;
  objc_msgSendSuper2(&v15, sel_viewDidLoad);
  sub_1B90058E8();
  sub_1B8E7F26C((uint64_t)&unk_1E6F3FBD0);
  v9 = objc_msgSend(v0, sel_headerView);
  v10 = objc_msgSend(v9, sel_subviews);

  if (!v10)
  {
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57EAE0);
    sub_1B93EDF4C();
    v10 = (id)sub_1B93EDF34();
    swift_bridgeObjectRelease();
  }
  v11 = (void *)objc_opt_self();
  v12 = (void *)sub_1B93EDCE8();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setAccessibilityIDForViews_withIDDictionary_, v10, v12);

  objc_msgSend(v0, sel_updateViewConstraints);
  sub_1B93EB9A8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0D32B88], v4);
  sub_1B93ECF74();
  sub_1B93EBA14();
  v13 = sub_1B93EBA20();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v3, 0, 1, v13);
  sub_1B93EB9F0();
  swift_allocObject();
  sub_1B93EB9E4();
  MEMORY[0x1BCCBD74C]();
  return swift_release();
}

void sub_1B90058E8()
{
  void *v0;
  void *v1;
  id v2;
  unint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[3];
  uint64_t v46;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_navigationItem);
  v3 = 0x1E0CEA000uLL;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, sel_cancelOnboardingWithSender_);
  objc_msgSend(v2, sel_setLeftBarButtonItem_, v4);

  v5 = objc_msgSend(v1, sel_navigationItem);
  v6 = objc_msgSend(v5, sel_leftBarButtonItem);

  if (v6)
  {
    v7 = (void *)sub_1B93EDD84();
    objc_msgSend(v6, sel_setAccessibilityIdentifier_, v7);

  }
  v8 = (void *)sub_1B93EDD84();
  v9 = HULocalizedString(v8);

  sub_1B93EDDB4();
  v10 = type metadata accessor for UtilityOnboardingTermsViewController();
  v46 = v10;
  v45[0] = v1;
  v11 = v1;
  v12 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  if (v10)
  {
    v13 = __swift_project_boxed_opaque_existential_1(v45, v10);
    v14 = *(_QWORD *)(v10 - 8);
    v15 = MEMORY[0x1E0C80A78](v13);
    v17 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v14 + 16))(v17, v15);
    v18 = sub_1B93EEAF8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v10);
    v3 = 0x1E0CEA000;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_allocWithZone(*(Class *)(v3 + 896));
  v20 = objc_msgSend(v19, sel_initWithTitle_style_target_action_, v12, 0, v18, sel_cancelOnboardingWithSender_, v45[0]);

  swift_unknownObjectRelease();
  v21 = v20;
  v22 = (void *)sub_1B93EDD84();
  objc_msgSend(v21, sel_setAccessibilityIdentifier_, v22);

  v23 = objc_msgSend(objc_allocWithZone(*(Class *)(v3 + 896)), sel_initWithBarButtonSystemItem_target_action_, 5, v11, 0);
  v24 = (void *)sub_1B93EDD84();
  v25 = HULocalizedString(v24);

  sub_1B93EDDB4();
  v46 = v10;
  v45[0] = v11;
  v26 = v11;
  v27 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  v28 = v46;
  if (v46)
  {
    v29 = __swift_project_boxed_opaque_existential_1(v45, v46);
    v30 = *(_QWORD *)(v28 - 8);
    v31 = MEMORY[0x1E0C80A78](v29);
    v33 = (char *)v45 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v30 + 16))(v33, v31);
    v34 = sub_1B93EEAF8();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
  else
  {
    v34 = 0;
  }
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithTitle_style_target_action_, v27, 0, v34, sel_didAcceptConsentWithSender_);

  swift_unknownObjectRelease();
  v36 = v35;
  v37 = (void *)sub_1B93EDD84();
  objc_msgSend(v36, sel_setAccessibilityIdentifier_, v37);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_1B9439D40;
  *(_QWORD *)(v38 + 32) = v21;
  *(_QWORD *)(v38 + 40) = v23;
  *(_QWORD *)(v38 + 48) = v36;
  v45[0] = v38;
  sub_1B93EDF64();
  sub_1B8E23A60(0, &qword_1EF2108D0);
  v39 = v21;
  v40 = v36;
  v41 = v23;
  v42 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_setToolbarItems_animated_, v42, 1);

  v43 = objc_msgSend(v26, sel_navigationController);
  if (v43)
  {
    v44 = v43;
    objc_msgSend(v43, sel_setToolbarHidden_, 0);

  }
}

uint64_t sub_1B9005E10()
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
  uint64_t v10;
  char *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  void **v22;
  uint64_t result;
  void *v24;
  uint64_t inited;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2108A0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B93EBA2C();
  v32 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B93EC884();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF2077F0 != -1)
    swift_once();
  v12 = (id)qword_1EF226DD0;
  sub_1B93EC890();
  v13 = sub_1B93EC86C();
  v14 = sub_1B93EE234();
  if (os_log_type_enabled(v13, v14))
  {
    v31 = v1;
    v15 = swift_slowAlloc();
    v29 = v5;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v30 = v7;
    v18 = v17;
    v35[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v33 = sub_1B8E3489C(0xD000000000000019, 0x80000001B9450A20, v35);
    v1 = v31;
    sub_1B93EE600();
    _os_log_impl(&dword_1B8E1E000, v13, v14, "%s User tapped button to cancel onboarding", v16, 0xCu);
    swift_arrayDestroy();
    v19 = v18;
    v7 = v30;
    MEMORY[0x1BCCC1CD0](v19, -1, -1);
    v20 = v16;
    v5 = v29;
    MEMORY[0x1BCCC1CD0](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_1B93EB9A8();
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v7, *MEMORY[0x1E0D32B50], v5);
  sub_1B93ECF74();
  sub_1B93EBA14();
  v21 = sub_1B93EBA20();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 0, 1, v21);
  sub_1B93EB9F0();
  swift_allocObject();
  sub_1B93EB9E4();
  MEMORY[0x1BCCBD74C]();
  swift_release();
  v22 = (void **)(v1 + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  result = swift_beginAccess();
  v24 = *v22;
  if (*v22)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF20B8F0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B9438C30;
    v33 = sub_1B93EDDB4();
    v34 = v26;
    swift_unknownObjectRetain();
    sub_1B93EE7EC();
    *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEBB98];
    *(_QWORD *)(inited + 72) = 5;
    sub_1B8E7F7D4(inited);
    v27 = (void *)sub_1B93EDCE8();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_viewController_didFinishWithConfigurationResults_, v1, v27);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1B90062A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void **v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  _OWORD v41[2];
  __int128 v42;
  uint64_t v43;
  unint64_t v44;

  v0 = sub_1B93EC884();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v36 - v5;
  if (qword_1EF2077F0 != -1)
    swift_once();
  v7 = (id)qword_1EF226DD0;
  sub_1B93EC890();
  v8 = sub_1B93EC86C();
  v9 = sub_1B93EE234();
  v10 = os_log_type_enabled(v8, v9);
  v38 = v3;
  if (v10)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = v0;
    v13 = swift_slowAlloc();
    *(_QWORD *)&v42 = v13;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)&v41[0] = sub_1B8E3489C(0xD000000000000019, 0x80000001B9450A00, (uint64_t *)&v42);
    sub_1B93EE600();
    _os_log_impl(&dword_1B8E1E000, v8, v9, "%s user tapped agree button", v11, 0xCu);
    swift_arrayDestroy();
    v14 = v13;
    v0 = v12;
    v3 = v38;
    MEMORY[0x1BCCC1CD0](v14, -1, -1);
    MEMORY[0x1BCCC1CD0](v11, -1, -1);
  }

  v15 = *(void (**)(char *, uint64_t))(v1 + 8);
  v15(v6, v0);
  v16 = sub_1B93EDDB4();
  v18 = v17;
  v43 = MEMORY[0x1E0DEB418];
  *(_QWORD *)&v42 = 0;
  sub_1B8E382C8(&v42, v41);
  v19 = MEMORY[0x1E0DEE9E0];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v40 = v19;
  v44 = 0x8000000000000000;
  sub_1B8E8FD04((uint64_t)v41, v16, v18, isUniquelyReferenced_nonNull_native);
  v44 = v40;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21 = (id)qword_1EF226DD0;
  sub_1B93EC890();
  v22 = sub_1B93EC86C();
  v23 = sub_1B93EE234();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_QWORD *)&v42 = v25;
    *(_DWORD *)v24 = 136315394;
    v37 = v0;
    *(_QWORD *)&v41[0] = sub_1B8E3489C(0xD000000000000019, 0x80000001B9450A00, (uint64_t *)&v42);
    sub_1B93EE600();
    *(_WORD *)(v24 + 12) = 2080;
    swift_beginAccess();
    sub_1B93ECF74();
    v26 = sub_1B93EDD0C();
    v36 = v15;
    v27 = v26;
    v29 = v28;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v41[0] = sub_1B8E3489C(v27, v29, (uint64_t *)&v42);
    sub_1B93EE600();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B8E1E000, v22, v23, "%s Finished with results %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v25, -1, -1);
    MEMORY[0x1BCCC1CD0](v24, -1, -1);

    v36(v38, v37);
  }
  else
  {

    v15(v3, v0);
  }
  v30 = v39;
  v31 = (void **)(v39 + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  swift_beginAccess();
  v32 = *v31;
  if (*v31)
  {
    swift_beginAccess();
    swift_unknownObjectRetain();
    v33 = sub_1B93ECF74();
    sub_1B8E37F04(v33);
    swift_bridgeObjectRelease();
    v34 = (void *)sub_1B93EDCE8();
    swift_bridgeObjectRelease();
    objc_msgSend(v32, sel_viewController_didFinishWithConfigurationResults_, v30, v34);

    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

id UtilityOnboardingTermsViewController.__allocating_init(title:detailText:icon:contentView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v11;
  void *v12;
  id v13;

  v7 = v6;
  v11 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentView_, v11, v12, a5, a6);

  return v13;
}

void UtilityOnboardingTermsViewController.init(title:detailText:icon:contentView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UtilityOnboardingTermsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UtilityOnboardingTermsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B9006918@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for UtilityOnboardingTermsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UtilityOnboardingTermsViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of UtilityOnboardingTermsViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of UtilityOnboardingTermsViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of UtilityOnboardingTermsViewController.__allocating_init(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of UtilityOnboardingTermsViewController.onboardingFlowClass()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

ValueMetadata *type metadata accessor for TermsAndConditionsView()
{
  return &type metadata for TermsAndConditionsView;
}

uint64_t sub_1B9006A74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B9006A84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v2 = sub_1B93EDD84();
  v3 = HULocalizedString((void *)v2);

  sub_1B93EDDB4();
  sub_1B8E49E1C();
  v4 = sub_1B93ED898();
  v6 = v5;
  v8 = v7 & 1;
  sub_1B93ED82C();
  v9 = sub_1B93ED880();
  v30 = v10;
  v31 = v9;
  v32 = v11;
  LOBYTE(v2) = v12;
  swift_release();
  v13 = v2 & 1;
  sub_1B8EB25E8(v4, v6, v8);
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1B93EDD84();
  v15 = HULocalizedString(v14);

  sub_1B93EDDB4();
  v16 = sub_1B93ED898();
  v18 = v17;
  v20 = v19;
  LOBYTE(v4) = v21 & 1;
  sub_1B93ECF74();
  sub_1B93ED484();
  v22 = sub_1B93ED88C();
  v24 = v23;
  v25 = v13;
  v33 = v13;
  v27 = v26 & 1;
  *(_QWORD *)a1 = v31;
  *(_QWORD *)(a1 + 8) = v32;
  *(_BYTE *)(a1 + 16) = v25;
  *(_QWORD *)(a1 + 24) = v30;
  *(_QWORD *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = v18;
  *(_BYTE *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v20;
  *(_QWORD *)(a1 + 64) = 0x403E000000000000;
  *(_BYTE *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = v22;
  *(_QWORD *)(a1 + 88) = v23;
  *(_BYTE *)(a1 + 96) = v26 & 1;
  *(_QWORD *)(a1 + 104) = v28;
  sub_1B8EB2DC8(v31, v32, v25);
  sub_1B93ECF74();
  sub_1B8EB2DC8(v16, v18, v4);
  sub_1B93ECF74();
  sub_1B8EB2DC8(v22, v24, v27);
  sub_1B93ECF74();
  sub_1B8EB25E8(v22, v24, v27);
  swift_bridgeObjectRelease();
  sub_1B8EB25E8(v16, v18, v4);
  swift_bridgeObjectRelease();
  sub_1B8EB25E8(v31, v32, v33);
  return swift_bridgeObjectRelease();
}

__n128 sub_1B9006D18@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  __n128 result;
  __int128 v12;
  __int128 v13;
  __n128 v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  char v23;
  uint64_t v24;

  v2 = sub_1B93ED4CC();
  sub_1B9006A84((uint64_t)&v14);
  v3 = v15;
  v4 = v16;
  v5 = v18;
  v6 = v19;
  v7 = v20;
  v8 = v21;
  v9 = v23;
  v10 = v24;
  result = v14;
  v12 = v17;
  v13 = v22;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = v12;
  *(_BYTE *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = v6;
  *(_QWORD *)(a1 + 88) = v7;
  *(_BYTE *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 104) = v13;
  *(_BYTE *)(a1 + 120) = v9;
  *(_QWORD *)(a1 + 128) = v10;
  *(_WORD *)(a1 + 136) = 256;
  return result;
}

unint64_t sub_1B9006DDC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EF2108D8;
  if (!qword_1EF2108D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF2108E0);
    v2[0] = sub_1B9006E48();
    v2[1] = MEMORY[0x1E0CDA1F0];
    result = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EF2108D8);
  }
  return result;
}

unint64_t sub_1B9006E48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2108E8;
  if (!qword_1EF2108E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EF2108F0);
    result = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CDFCC0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2108E8);
  }
  return result;
}

id sub_1B9006EEC()
{
  return sub_1B8F0B3F0(type metadata accessor for SolidColorSectionBackgroundDecorationView);
}

id sub_1B9006F50()
{
  return sub_1B8F0B3F0(type metadata accessor for TransparentBlackBackgroundDecorationView);
}

id static DashboardPresentationManager.shared.getter()
{
  if (qword_1ED57E840 != -1)
    swift_once();
  return (id)qword_1ED57E760;
}

uint64_t sub_1B9006F9C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_1B9007050(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR___HUDashboardPresentationManager_delegate;
  swift_beginAccess();
  sub_1B90070F0((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_1B9007000@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___HUDashboardPresentationManager_delegate;
  swift_beginAccess();
  return sub_1B9007050(v3, a1);
}

uint64_t sub_1B9007050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9007098(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___HUDashboardPresentationManager_delegate;
  swift_beginAccess();
  sub_1B90070F0(a1, v3);
  return swift_endAccess();
}

uint64_t sub_1B90070F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1B9007138())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id DashboardPresentationManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardPresentationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall DashboardPresentationManager._navigationControllerShouldUseBuiltinInteractionController(_:)(UINavigationController *a1)
{
  return 1;
}

void sub_1B9007260(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[24];
  ValueMetadata *v19;
  unint64_t v20;

  v19 = &type metadata for UIKitFeatures;
  v20 = sub_1B8F3D78C();
  v6 = sub_1B93EB960();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  if ((v6 & 1) != 0
    && (v19 = &type metadata for HomeAppFeatures,
        v20 = sub_1B8EA6E84(),
        v18[0] = 5,
        v7 = sub_1B93EB960(),
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v18),
        (v7 & 1) != 0))
  {
    v8 = v3 + OBJC_IVAR___HUDashboardPresentationManager_delegate;
    swift_beginAccess();
    sub_1B9007050(v8, (uint64_t)v18);
    if (v19)
    {
      sub_1B8E2D0BC((uint64_t)v18, (uint64_t)v15);
      sub_1B9007804((uint64_t)v18);
      v9 = v16;
      v10 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 8))(a2, v9, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    }
    else
    {
      sub_1B9007804((uint64_t)v18);
    }
  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
    objc_msgSend(v11, sel_setCurrentContext_, a2);

  }
  objc_opt_self();
  v12 = (void *)swift_dynamicCastObjCClass();
  if (v12)
  {
    v13 = objc_msgSend(v12, sel_filterBarController);
    if (v13)
    {
      v14 = v13;
      sub_1B8E444D0(a2, a3 & 1);

    }
  }
}

id _s6HomeUI28DashboardPresentationManagerC20navigationController_09animationG3For4from2toSo06UIViewG21AnimatedTransitioning_pSgSo012UINavigationG0C_So0oG9OperationVSo0lG0CAOtF_0(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  objc_class *v16;
  _BYTE *v17;
  char *v18;
  _OWORD *v19;
  __int128 v20;
  id v21;
  objc_class *v22;
  _BYTE *v23;
  char *v24;
  _OWORD *v25;
  __int128 v26;
  objc_class *v27;
  _BYTE *v28;
  char *v29;
  _OWORD *v30;
  __int128 v31;
  id v32;
  objc_super v34;
  objc_super v35;
  objc_super v36;

  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (!v8)
    return 0;
  v9 = (void *)v8;
  objc_opt_self();
  v10 = swift_dynamicCastObjCClass();
  if (!v10)
    return 0;
  v11 = (void *)v10;
  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v9, sel_isOverlay);
  v15 = objc_msgSend(v11, sel_isOverlay);
  if (a2 == 2)
  {
    if (v14)
    {
      if ((v15 & 1) == 0)
      {
        v22 = (objc_class *)type metadata accessor for DashboardAnimator();
        v23 = objc_allocWithZone(v22);
        swift_unknownObjectWeakInit();
        v24 = &v23[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetCollectionViewFrame];
        *(_OWORD *)v24 = 0u;
        *((_OWORD *)v24 + 1) = 0u;
        v24[32] = 1;
        *(_QWORD *)&v23[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetCollectionViewLayout] = 0;
        v25 = &v23[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetContentInset];
        v26 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
        *v25 = *MEMORY[0x1E0CEB4B0];
        v25[1] = v26;
        *(_QWORD *)&v23[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetNavigationBarAppearance] = 0;
        v23[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_style] = 1;
        v21 = objc_msgSendSuper2(&v36, sel_init, v34.receiver, v34.super_class, v35.receiver, v35.super_class, v23, v22);
        goto LABEL_13;
      }
    }
    else if ((v15 & 1) == 0)
    {
      sub_1B8E6EB50(1, a1);

      return 0;
    }
    goto LABEL_15;
  }
  if (a2 != 1)
    goto LABEL_15;
  if ((v14 & 1) == 0)
  {
    if (v15)
    {
      v27 = (objc_class *)type metadata accessor for DashboardAnimator();
      v28 = objc_allocWithZone(v27);
      swift_unknownObjectWeakInit();
      v29 = &v28[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetCollectionViewFrame];
      *(_OWORD *)v29 = 0u;
      *((_OWORD *)v29 + 1) = 0u;
      v29[32] = 1;
      *(_QWORD *)&v28[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetCollectionViewLayout] = 0;
      v30 = &v28[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetContentInset];
      v31 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      *v30 = *MEMORY[0x1E0CEB4B0];
      v30[1] = v31;
      *(_QWORD *)&v28[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetNavigationBarAppearance] = 0;
      v28[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_style] = 0;
      v21 = objc_msgSendSuper2(&v35, sel_init, v34.receiver, v34.super_class, v28, v27, v36.receiver, v36.super_class);
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  if (!v15)
  {
LABEL_15:

    return 0;
  }
  v16 = (objc_class *)type metadata accessor for DashboardAnimator();
  v17 = objc_allocWithZone(v16);
  swift_unknownObjectWeakInit();
  v18 = &v17[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetCollectionViewFrame];
  *(_OWORD *)v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  v18[32] = 1;
  *(_QWORD *)&v17[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetCollectionViewLayout] = 0;
  v19 = &v17[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetContentInset];
  v20 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  *v19 = *MEMORY[0x1E0CEB4B0];
  v19[1] = v20;
  *(_QWORD *)&v17[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_targetNavigationBarAppearance] = 0;
  v17[OBJC_IVAR____TtC6HomeUI17DashboardAnimator_style] = 2;
  v21 = objc_msgSendSuper2(&v34, sel_init, v17, v16, v35.receiver, v35.super_class, v36.receiver, v36.super_class);
LABEL_13:
  v32 = v21;

  return v32;
}

uint64_t sub_1B90076F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR___HUDashboardPresentationManager_delegate;
  swift_beginAccess();
  return sub_1B9007050(v3, a2);
}

uint64_t dispatch thunk of DashboardPresentationManagerDelegate.didUpdateDashboarContext(dashboardContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t method lookup function for DashboardPresentationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DashboardPresentationManager.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of DashboardPresentationManager.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of DashboardPresentationManager.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of DashboardPresentationManager.navigationController(_:willPushItem:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DashboardPresentationManager.navigationController(_:didPushItem:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DashboardPresentationManager.navigationController(_:didUpdatePreferredPaletteHeight:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t sub_1B9007804(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F600);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1B9007844(double *a1, void **a2)
{
  double v2;
  void *v3;
  double *v4;
  id result;
  double v6;

  v2 = *a1;
  v3 = *a2;
  v4 = (double *)((char *)*a2 + OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension);
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = v2;
  if (v2 != v6)
    return objc_msgSend(v3, sel_setNeedsUpdateConstraints);
  return result;
}

double sub_1B90078B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_1B90078F8(double a1)
{
  char *v1;
  double *v3;
  id result;
  double v5;

  v3 = (double *)&v1[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension];
  result = (id)swift_beginAccess();
  v5 = *v3;
  *v3 = a1;
  if (v5 != a1)
    return objc_msgSend(v1, sel_setNeedsUpdateConstraints);
  return result;
}

void (*sub_1B9007964(_QWORD *a1))(id **a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_1B90079D0;
}

void sub_1B90079D0(id **a1)
{
  id *v1;
  double v2;
  char *v3;
  id v4;
  double v5;

  v1 = *a1;
  v2 = *((double *)*a1 + 3);
  v4 = (*a1)[4];
  v3 = (char *)(*a1)[5];
  v5 = *(double *)&v3[(_QWORD)v4];
  *(double *)&v3[(_QWORD)v4] = v2;
  if (v2 != v5)
    objc_msgSend(v1[4], sel_setNeedsUpdateConstraints);
  free(v1);
}

id IconRoundButtonView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IconRoundButtonView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_1B9007AC8@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t method lookup function for IconRoundButtonView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IconRoundButtonView.dimension.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of IconRoundButtonView.dimension.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of IconRoundButtonView.dimension.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of IconRoundButtonView.configure(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

void sub_1B9007B98()
{
  _BYTE *v0;
  uint64_t v1;

  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_iconConstraints] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_iconDescriptor] = 0;
  v0[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_useIntrinsicContentSizeFromAsset] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension] = 0x4045000000000000;
  v1 = OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_iconView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D33720]), sel_initWithFrame_contentMode_, 4, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_backgroundView] = 0;

  sub_1B93EE9CC();
  __break(1u);
}

id static UIColor.climate.getter()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemCyanColor);
}

id sub_1B9007CA4()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1B93ED9E8();
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, __n128))(v4 + 104))(v3, *MEMORY[0x1E0CDF3E0], v1);
  MEMORY[0x1BCCBF804](v3, 0.0156862745, 0.870588235, 0.443137255, 1.0);
  sub_1B9007DFC();
  return (id)sub_1B93EE480();
}

uint64_t static UIColor.energy.getter()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1B93ED9E8();
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, __n128))(v4 + 104))(v3, *MEMORY[0x1E0CDF3E0], v1);
  MEMORY[0x1BCCBF804](v3, 0.0156862745, 0.870588235, 0.443137255, 1.0);
  sub_1B9007DFC();
  return sub_1B93EE480();
}

unint64_t sub_1B9007DFC()
{
  unint64_t result;

  result = qword_1ED57EAF0;
  if (!qword_1ED57EAF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED57EAF0);
  }
  return result;
}

id static UIColor.lighting.getter()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemYellowColor);
}

id sub_1B9007E60()
{
  id v0;
  void *v1;
  id v2;
  _QWORD v4[6];

  v0 = objc_allocWithZone(MEMORY[0x1E0CEA478]);
  v4[4] = sub_1B9007FA0;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1B8F60040;
  v4[3] = &block_descriptor_3_0;
  v1 = _Block_copy(v4);
  v2 = objc_msgSend(v0, sel_initWithDynamicProvider_, v1);
  _Block_release(v1);
  swift_release();
  return v2;
}

id static UIColor.media.getter()
{
  id v0;
  void *v1;
  id v2;
  _QWORD v4[6];

  v0 = objc_allocWithZone(MEMORY[0x1E0CEA478]);
  v4[4] = sub_1B9007FA0;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1B8F60040;
  v4[3] = &block_descriptor_46;
  v1 = _Block_copy(v4);
  v2 = objc_msgSend(v0, sel_initWithDynamicProvider_, v1);
  _Block_release(v1);
  swift_release();
  return v2;
}

id sub_1B9007FA0(void *a1)
{
  id v1;
  void *v2;
  char **v3;

  v1 = objc_msgSend(a1, sel_userInterfaceStyle);
  v2 = (void *)objc_opt_self();
  v3 = &selRef_blackColor;
  if (v1 != (id)1)
    v3 = &selRef_whiteColor;
  return objc_msgSend(v2, *v3);
}

id static UIColor.security.getter()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemMintColor);
}

id static UIColor.water.getter()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemBlueColor);
}

uint64_t sub_1B9008050()
{
  uint64_t v0;

  v0 = sub_1B93EC884();
  __swift_allocate_value_buffer(v0, qword_1EF226E18);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF226E18);
  return sub_1B93EC878();
}

unint64_t static GridStatusCell.layoutOptionsClass()()
{
  return sub_1B90080D8();
}

unint64_t sub_1B90080D8()
{
  unint64_t result;

  result = qword_1EF2109C0;
  if (!qword_1EF2109C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF2109C0);
  }
  return result;
}

uint64_t sub_1B9008170()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B90081FC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1B9008244())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_1B9008294()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___HUGridStatusCell_layoutOptions);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1B900833C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___HUGridStatusCell_layoutOptions);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_1B900838C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___HUGridStatusCell_layoutOptions);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_1B90083EC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1B900843C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___HUGridStatusCell_item);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1B9008510(void *a1)
{
  char *v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)&v1[OBJC_IVAR___HUGridStatusCell_item];
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  objc_msgSend(v1, sel_setNeedsUpdateConfiguration);
}

void sub_1B9008584(void **a1, void **a2)
{
  void *v2;
  void *v3;
  void **v4;
  void *v5;
  id v6;

  v2 = *a1;
  v3 = *a2;
  v4 = (void **)((char *)*a2 + OBJC_IVAR___HUGridStatusCell_item);
  swift_beginAccess();
  v5 = *v4;
  *v4 = v2;
  v6 = v2;

  objc_msgSend(v3, sel_setNeedsUpdateConfiguration);
}

id (*sub_1B9008600(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1B8EA99C4;
}

id GridStatusCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id GridStatusCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  id v9;
  id v10;
  void *v11;
  id v12;
  objc_super v14;

  v4[OBJC_IVAR___HUGridStatusCell_areCellContentsHidden] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___HUGridStatusCell_layoutOptions] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___HUGridStatusCell_item] = 0;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for GridStatusCell();
  v9 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  v10 = objc_msgSend(v9, sel_backgroundView);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v11, sel_setBackgroundColor_, v12);

  }
  return v9;
}

uint64_t type metadata accessor for GridStatusCell()
{
  return objc_opt_self();
}

id GridStatusCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void GridStatusCell.init(coder:)()
{
  _BYTE *v0;

  v0[OBJC_IVAR___HUGridStatusCell_areCellContentsHidden] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___HUGridStatusCell_layoutOptions] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___HUGridStatusCell_item] = 0;

  sub_1B93EE9CC();
  __break(1u);
}

void sub_1B9008990(uint64_t a1)
{
  char *v1;
  char *v2;
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
  void *v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_1;
  void **v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41[3];
  uint64_t v42;
  unint64_t v43;
  objc_super v44;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF2109E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B93ECDD0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7E0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (void *)sub_1B93ECD1C();
  v16 = (objc_class *)type metadata accessor for GridStatusCell();
  v44.receiver = v2;
  v44.super_class = v16;
  objc_msgSendSuper2(&v44, sel__bridgedUpdateConfigurationUsingState_, v15);

  sub_1B93ECDB8();
  v17 = sub_1B93ECD34();
  v42 = v17;
  v43 = MEMORY[0x1E0CE9BA8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(boxed_opaque_existential_1, a1, v17);
  sub_1B93ECDC4();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  MEMORY[0x1BCCC00EC](v14);
  v19 = (void **)&v2[OBJC_IVAR___HUGridStatusCell_item];
  swift_beginAccess();
  v20 = *v19;
  if (*v19)
  {
    objc_opt_self();
    v21 = (void *)swift_dynamicCastObjCClass();
    if (v21)
      v22 = v20;
    v23 = objc_msgSend(v21, sel_itemUpdateFromLatestResults);

    if (v23)
    {
      v24 = qword_1EF207858;
      v25 = v23;
      if (v24 != -1)
        swift_once();
      v40 = v7;
      v26 = sub_1B93EC884();
      __swift_project_value_buffer(v26, (uint64_t)qword_1EF226E18);
      v27 = v25;
      v28 = sub_1B93EC86C();
      v29 = sub_1B93EE234();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        v37 = (_QWORD *)swift_slowAlloc();
        v38 = v5;
        *(_DWORD *)v30 = 138412290;
        v41[0] = (uint64_t)v27;
        v31 = v27;
        v39 = v4;
        v32 = v31;
        v5 = v38;
        sub_1B93EE600();
        v33 = v37;
        *v37 = v23;

        v4 = v39;
        _os_log_impl(&dword_1B8E1E000, v28, v29, "Updating status cell: %@", v30, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
        swift_arrayDestroy();
        MEMORY[0x1BCCC1CD0](v33, -1, -1);
        MEMORY[0x1BCCC1CD0](v30, -1, -1);
      }
      else
      {

        v28 = v27;
      }

      MEMORY[0x1E0C80A78](v34);
      *(&v37 - 2) = &v27->isa;
      *(&v37 - 1) = v2;
      type metadata accessor for StatusContentView(0);
      sub_1B8E2C710(&qword_1EF2109F0, type metadata accessor for StatusContentView, (uint64_t)&unk_1B9439488);
      v35 = v40;
      sub_1B93ED610();
      v42 = v4;
      v43 = sub_1B9008F2C();
      v36 = __swift_allocate_boxed_opaque_existential_1(v41);
      (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(v36, v35, v4);
      MEMORY[0x1BCCC00D4](v41);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v35, v4);
    }
  }
}

uint64_t sub_1B9008DCC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v6 = type metadata accessor for StatusContentView(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (void **)(a2 + OBJC_IVAR___HUGridStatusCell_layoutOptions);
  swift_beginAccess();
  v10 = *v9;
  if (*v9)
  {
    objc_opt_self();
    v11 = swift_dynamicCastObjCClass();
    if (v11)
      v12 = v10;
  }
  else
  {
    v11 = 0;
  }
  *(uint64_t *)((char *)v8 + *(int *)(v6 + 20)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20A2C0);
  swift_storeEnumTagMultiPayload();
  sub_1B93EC908();
  sub_1B8E2C710((unint64_t *)&unk_1EF210A00, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2FCF8], MEMORY[0x1E0D2FCF0]);
  v13 = a1;
  *v8 = sub_1B93ED2D4();
  v8[1] = v14;
  *(uint64_t *)((char *)v8 + *(int *)(v6 + 24)) = v11;
  return sub_1B9009660((uint64_t)v8, a3);
}

uint64_t sub_1B9008F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B9008DCC(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1B9008F2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2109F8;
  if (!qword_1EF2109F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EF2109E0);
    result = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0CDC120], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2109F8);
  }
  return result;
}

id GridStatusCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GridStatusCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::String_optional __swiftcall GridStatusCell.prefixString()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = 0;
  v1 = 0;
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::String_optional __swiftcall GridStatusCell.primaryString()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = 0;
  v1 = 0;
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::String_optional __swiftcall GridStatusCell.secondaryString()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = 0;
  v1 = 0;
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

NSAttributedString_optional __swiftcall GridStatusCell.secondaryAttributedString()()
{
  objc_class *v0;
  NSAttributedString_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

__C::CGRect __swiftcall GridStatusCell.iconViewTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = 0.0;
  v1 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

__C::CGRect __swiftcall GridStatusCell.prefixLabelTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = 0.0;
  v1 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

__C::CGRect __swiftcall GridStatusCell.primaryLabelTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = 0.0;
  v1 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

__C::CGRect __swiftcall GridStatusCell.secondaryLabelTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = 0.0;
  v1 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

Swift::Bool __swiftcall GridStatusCell.prefixLabelShouldFeather()()
{
  return 0;
}

Swift::Bool __swiftcall GridStatusCell.primaryLabelShouldFeather()()
{
  return 0;
}

Swift::Bool __swiftcall GridStatusCell.secondaryLabelShouldFeather()()
{
  return 0;
}

UIFont_optional __swiftcall GridStatusCell.prefixLabelFont()()
{
  objc_class *v0;
  UIFont_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

UIFont_optional __swiftcall GridStatusCell.primaryLabelFont()()
{
  objc_class *v0;
  UIFont_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

UIFont_optional __swiftcall GridStatusCell.secondaryLabelFont()()
{
  objc_class *v0;
  UIFont_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

UIColor_optional __swiftcall GridStatusCell.prefixLabelTextColor()()
{
  objc_class *v0;
  UIColor_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

UIColor_optional __swiftcall GridStatusCell.primaryLabelTextColor()()
{
  objc_class *v0;
  UIColor_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

UIColor_optional __swiftcall GridStatusCell.secondaryLabelTextColor()()
{
  objc_class *v0;
  UIColor_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

__C::CGRect __swiftcall GridStatusCell.tileFrame()()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  __C::CGRect result;

  objc_msgSend(v0, sel_frame);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

double GridStatusCell.backgroundCornerRadius()()
{
  return 0.0;
}

uint64_t GridStatusCell.backgroundDisplayStyle.getter()
{
  return 0;
}

Swift::Bool __swiftcall GridStatusCell.recognizeDoubleClickGesture()()
{
  return 1;
}

void GridStatusCell.baseIconViewConfiguration()(uint64_t a1@<X8>)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  objc_class *v6;
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  objc_super v16;
  _OWORD v17[2];
  uint64_t v18;
  _BYTE v19[136];
  _BYTE v20[136];
  _OWORD v21[8];
  uint64_t v22;

  v3 = (void **)(v1 + OBJC_IVAR___HUGridStatusCell_item);
  swift_beginAccess();
  v4 = *v3;
  if (!*v3)
    goto LABEL_4;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  v5 = v4;
  BaseIconView.Configuration.init(item:appearance:configurationState:)(v5, 3, (uint64_t)v17, (uint64_t)v19);
  sub_1B8F4E76C((uint64_t)v19, (uint64_t)v20);
  sub_1B8F4E76C((uint64_t)v20, (uint64_t)v21);
  if (sub_1B8ECA364((uint64_t)v21) == 1)
  {

LABEL_4:
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return;
  }
  v6 = (objc_class *)type metadata accessor for BaseIconView.__Configuration();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___HUBaseIconViewConfiguration_configuration];
  *(_OWORD *)v8 = v21[0];
  v9 = v21[5];
  v10 = v21[6];
  v11 = v21[7];
  *((_QWORD *)v8 + 16) = v22;
  *((_OWORD *)v8 + 6) = v10;
  *((_OWORD *)v8 + 7) = v11;
  *((_OWORD *)v8 + 5) = v9;
  v12 = v21[1];
  v13 = v21[2];
  v14 = v21[4];
  *((_OWORD *)v8 + 3) = v21[3];
  *((_OWORD *)v8 + 4) = v14;
  *((_OWORD *)v8 + 1) = v12;
  *((_OWORD *)v8 + 2) = v13;
  sub_1B8F4E76C((uint64_t)v20, (uint64_t)v17);
  sub_1B8F4E7B4((uint64_t)v17);
  v16.receiver = v7;
  v16.super_class = v6;
  v15 = objc_msgSendSuper2(&v16, sel_init);
  *(_QWORD *)(a1 + 24) = v6;

  sub_1B8F73334((uint64_t)v20);
  *(_QWORD *)a1 = v15;
}

uint64_t sub_1B9009478@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1B90094C8(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

id sub_1B9009514@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_20Tm(a1, &OBJC_IVAR___HUGridStatusCell_layoutOptions, a2);
}

id sub_1B9009524@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_20Tm(a1, &OBJC_IVAR___HUGridStatusCell_item, a2);
}

uint64_t method lookup function for GridStatusCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GridStatusCell.areCellContentsHidden.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of GridStatusCell.areCellContentsHidden.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of GridStatusCell.areCellContentsHidden.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GridStatusCell.layoutOptions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of GridStatusCell.layoutOptions.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of GridStatusCell.layoutOptions.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of GridStatusCell.item.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of GridStatusCell.item.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GridStatusCell.item.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of GridStatusCell.updateUI(withAnimation:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t sub_1B9009660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StatusContentView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_1B90096A4(void *a1, void *a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char *v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  os_log_t v35;
  uint64_t v36;
  uint64_t v38;
  id v39;
  os_log_t v40;
  int v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;
  id v50;
  uint64_t v51[4];

  v4 = v3;
  v45 = sub_1B93EC884();
  v47 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_triggerModuleController] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_home] = a2;
  v48 = a3;
  sub_1B8E2D0BC(a3, (uint64_t)&v4[OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_viewCoordinator]);
  v10 = a2;
  objc_msgSend(a1, sel_copy);
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF210A60);
  v44 = MEMORY[0x1E0DEE9B8] + 8;
  swift_dynamicCast();
  v11 = v50;
  v12 = objc_allocWithZone((Class)type metadata accessor for AccessoryDetailsSuggestedAutomationsItemManager());
  v13 = v10;
  v14 = sub_1B8FF8088(v11, v13);
  v15 = (objc_class *)type metadata accessor for AccessoryDetailsSuggestedAutomationsViewController();
  v49.receiver = v4;
  v49.super_class = v15;
  v16 = objc_msgSendSuper2(&v49, sel_initWithItemManager_tableViewStyle_, v14, 1);
  objc_msgSend(v14, sel_setDelegate_, v16);
  objc_msgSend(v14, sel_resetItemProvidersAndModules);

  sub_1B93EC860();
  v17 = v13;
  v18 = v16;
  v19 = a1;
  v20 = v14;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v46 = v9;
  v25 = sub_1B93EC86C();
  v26 = sub_1B93EE234();
  v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    v28 = swift_slowAlloc();
    v29 = (_QWORD *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v50 = v22;
    v51[0] = v42;
    *(_DWORD *)v28 = 138413314;
    v39 = v21;
    v40 = v25;
    v41 = v27;
    v30 = v22;
    v43 = v30;
    sub_1B93EE600();
    *v29 = v22;

    *(_WORD *)(v28 + 12) = 2080;
    v50 = (id)sub_1B8E3489C(0xD000000000000020, 0x80000001B9450F60, v51);
    sub_1B93EE600();
    *(_WORD *)(v28 + 22) = 2112;
    v50 = v23;
    v31 = v23;
    sub_1B93EE600();
    v29[1] = v23;

    *(_WORD *)(v28 + 32) = 2112;
    v32 = v39;
    v50 = v39;
    v33 = v39;
    sub_1B93EE600();
    v29[2] = v32;

    *(_WORD *)(v28 + 42) = 2112;
    v50 = v24;
    v34 = v24;
    sub_1B93EE600();
    v29[3] = v24;

    v35 = v40;
    _os_log_impl(&dword_1B8E1E000, v40, (os_log_type_t)v41, "%@ - %s item: %@, home: %@, itemManager: %@", (uint8_t *)v28, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v29, -1, -1);
    v36 = v42;
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v36, -1, -1);
    MEMORY[0x1BCCC1CD0](v28, -1, -1);

  }
  else
  {

  }
  __swift_destroy_boxed_opaque_existential_1(v48);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v45);
  return v22;
}

unint64_t sub_1B9009B50()
{
  unint64_t result;

  result = qword_1EF210A10;
  if (!qword_1EF210A10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF210A10);
  }
  return result;
}

void sub_1B9009C1C()
{
  void *v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(v0, sel_tableView);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_contentSize);

  }
  else
  {
    __break(1u);
  }
}

id sub_1B9009C78()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  id result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[4];

  v1 = v0;
  v2 = sub_1B93EC884();
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)&v4 = MEMORY[0x1E0C80A78](v2).n128_u64[0];
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v1, sel_tableView, v4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, sel_contentSize);
    v10 = v9;

    sub_1B93EC860();
    v11 = v1;
    v12 = sub_1B93EC86C();
    v13 = sub_1B93EE204();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v22 = v3;
      v15 = v14;
      v16 = (_QWORD *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v23 = (uint64_t)v11;
      v24[0] = v20;
      *(_DWORD *)v15 = 138412802;
      v21 = v2;
      v17 = v11;
      sub_1B93EE600();
      *v16 = v11;

      *(_WORD *)(v15 + 12) = 2080;
      v23 = sub_1B8E3489C(0x6548657461647075, 0xEE00292874686769, v24);
      sub_1B93EE600();
      *(_WORD *)(v15 + 22) = 2048;
      v23 = v10;
      sub_1B93EE600();
      _os_log_impl(&dword_1B8E1E000, v12, v13, "%@ - %s: updating height: %f", (uint8_t *)v15, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v16, -1, -1);
      v18 = v20;
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v18, -1, -1);
      MEMORY[0x1BCCC1CD0](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v21);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    sub_1B8E2D0BC((uint64_t)v11 + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_viewCoordinator, (uint64_t)v24);
    __swift_project_boxed_opaque_existential_1(v24, v24[3]);
    sub_1B93ED1D8();
    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B9009F50()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v1 = sub_1B93EC884();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EC860();
  v5 = v0;
  v6 = sub_1B93EC86C();
  v7 = sub_1B93EE204();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v18 = v2;
    v9 = v8;
    v10 = (_QWORD *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v19 = (uint64_t)v5;
    v20 = v16;
    *(_DWORD *)v9 = 138412546;
    v17 = v1;
    v11 = v5;
    sub_1B93EE600();
    *v10 = v5;

    *(_WORD *)(v9 + 12) = 2080;
    v19 = sub_1B8E3489C(0xD000000000000017, 0x80000001B9450E70, &v20);
    sub_1B93EE600();
    _os_log_impl(&dword_1B8E1E000, v6, v7, "%@ - %s", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v10, -1, -1);
    v12 = v16;
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v12, -1, -1);
    MEMORY[0x1BCCC1CD0](v9, -1, -1);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v13 = (objc_class *)type metadata accessor for AccessoryDetailsSuggestedAutomationsViewController();
  v21.receiver = v5;
  v21.super_class = v13;
  objc_msgSendSuper2(&v21, sel_viewDidLayoutSubviews);
  return sub_1B9009C78();
}

uint64_t type metadata accessor for AccessoryDetailsSuggestedAutomationsViewController()
{
  return objc_opt_self();
}

void *sub_1B900A1F4(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  id v17;
  os_log_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = sub_1B93EC884();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EC860();
  v7 = v1;
  v8 = a1;
  v9 = (char *)v7;
  v10 = v8;
  v11 = sub_1B93EC86C();
  v12 = sub_1B93EE204();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v35 = (uint64_t)v9;
    v36 = v32;
    *(_DWORD *)v13 = 138412802;
    v31 = v11;
    v34 = v3;
    v15 = v9;
    v33 = v4;
    v16 = v15;
    sub_1B93EE600();
    *v14 = v9;

    *(_WORD *)(v13 + 12) = 2080;
    v35 = sub_1B8E3489C(0xD00000000000001FLL, 0x80000001B9450E90, &v36);
    sub_1B93EE600();
    *(_WORD *)(v13 + 22) = 2112;
    v35 = (uint64_t)v10;
    v17 = v10;
    sub_1B93EE600();
    v14[1] = v10;

    v18 = v31;
    _os_log_impl(&dword_1B8E1E000, v31, v12, "%@ - %s itemModule: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v14, -1, -1);
    v19 = v32;
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v19, -1, -1);
    MEMORY[0x1BCCC1CD0](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v34);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  objc_opt_self();
  v20 = (void *)swift_dynamicCastObjCClass();
  if (v20)
  {
    v21 = OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_triggerModuleController;
    v22 = *(void **)&v9[OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_triggerModuleController];
    v23 = objc_allocWithZone((Class)HUAvailableRelatedTriggerItemModuleController);
    v24 = v22;
    v25 = v10;
    v26 = objc_msgSend(v23, sel_initWithModule_, v20);
    v27 = *(void **)&v9[v21];
    *(_QWORD *)&v9[v21] = v26;

    v20 = *(void **)&v9[v21];
    if (v20)
    {
      v28 = v20;
      objc_msgSend(v28, sel_setHost_, v9);
      v29 = v24;
      objc_msgSend(v29, sel_updatePresentedViewControllerForNewModuleController_, v28);

      v24 = v25;
    }
    else
    {
      v29 = v25;
    }

  }
  return v20;
}

id AccessoryDetailsSuggestedAutomationsViewController.__allocating_init(itemManager:tableViewStyle:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithItemManager_tableViewStyle_, a1, a2);

  return v4;
}

void AccessoryDetailsSuggestedAutomationsViewController.init(itemManager:tableViewStyle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccessoryDetailsSuggestedAutomationsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryDetailsSuggestedAutomationsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AccessoryDetailsSuggestedAutomationsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryDetailsSuggestedAutomationsViewController.heightOfTableVIew()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

id ActionGridItemModule.__allocating_init(actionBuilderContainer:home:itemUpdater:)(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  char *v8;
  char *v9;
  char *v10;
  objc_class *v11;
  id v12;
  objc_super v14;

  v4 = v3;
  v8 = (char *)objc_allocWithZone(v4);
  v9 = &v8[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  *(_OWORD *)(v9 + 24) = xmmword_1B943DF30;
  *((_QWORD *)v9 + 5) = 0;
  *((_WORD *)v9 + 24) = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_1B8E2D0BC(a1, (uint64_t)&v8[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer]);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v8[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType] = 1;
  swift_unknownObjectWeakAssign();
  v10 = &v8[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_itemProviderBlock];
  v11 = (objc_class *)type metadata accessor for AccessoryItemModule();
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v14.receiver = v8;
  v14.super_class = v11;
  v12 = objc_msgSendSuper2(&v14, sel_initWithItemUpdater_, a3);
  __swift_destroy_boxed_opaque_existential_1(a1);

  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_1B900A804@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;

  v3 = *a1 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_BYTE *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 40);
  v7 = *(_BYTE *)(v3 + 48);
  v8 = *(_BYTE *)(v3 + 49);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(v3 + 24);
  *(_QWORD *)(a2 + 40) = v6;
  *(_BYTE *)(a2 + 48) = v7;
  *(_BYTE *)(a2 + 49) = v8;
  sub_1B93ECF74();
  return sub_1B93ECF74();
}

uint64_t sub_1B900A890(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  __int128 v10;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v10 = *(_OWORD *)(a1 + 3);
  v5 = a1[5];
  v6 = *((_BYTE *)a1 + 48);
  v7 = *((_BYTE *)a1 + 49);
  v8 = *a2 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
  swift_beginAccess();
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = v3;
  *(_BYTE *)(v8 + 16) = v4;
  *(_OWORD *)(v8 + 24) = v10;
  *(_QWORD *)(v8 + 40) = v5;
  *(_BYTE *)(v8 + 48) = v6;
  *(_BYTE *)(v8 + 49) = v7;
  sub_1B93ECF74();
  sub_1B93ECF74();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B900A950@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;

  v3 = v1 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_BYTE *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 40);
  v7 = *(_BYTE *)(v3 + 48);
  v8 = *(_BYTE *)(v3 + 49);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v3 + 24);
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 49) = v8;
  sub_1B93ECF74();
  return sub_1B93ECF74();
}

uint64_t sub_1B900A9D8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  __int128 v10;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v10 = *(_OWORD *)(a1 + 3);
  v5 = a1[5];
  v6 = *((_BYTE *)a1 + 48);
  v7 = *((_BYTE *)a1 + 49);
  v8 = v1 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
  swift_beginAccess();
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = v3;
  *(_BYTE *)(v8 + 16) = v4;
  *(_OWORD *)(v8 + 24) = v10;
  *(_QWORD *)(v8 + 40) = v5;
  *(_BYTE *)(v8 + 48) = v6;
  *(_BYTE *)(v8 + 49) = v7;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B900AA78())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ActionGridItemModule.actionBuilderContainer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B8E2D0BC(v1 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer, a1);
}

id ActionGridItemModule.init(actionBuilderContainer:home:itemUpdater:)(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  v4 = sub_1B900B484(a1, (uint64_t)a2, a3);

  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_1B900AB10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t inited;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = MEMORY[0x1BCCC1DA8](v0 + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_home);
  if (v2)
  {
    v3 = (void *)v2;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer), *(_QWORD *)(v0 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer + 24));
    v4 = v3;
    v5 = (void *)sub_1B93EC9BC();
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31798]), sel_initWithHome_actionSetBuilder_, v4, v5);

    objc_msgSend(v6, sel_setActionSetValueSourceDelegate_, v1);
    v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1B900B5AC;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B8F0AE9C;
    aBlock[3] = &block_descriptor_47;
    v8 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v6, sel_setFilter_, v8);
    _Block_release(v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B9436B60;
    *(_QWORD *)(inited + 32) = v6;
    aBlock[0] = inited;
    sub_1B93EDF64();
    v10 = aBlock[0];
    if (aBlock[0] >> 62)
    {
      v15 = v6;
      sub_1B93ECF74();
      v16 = sub_1B93EE9F0();
      swift_bridgeObjectRelease();
      if (v16)
        goto LABEL_4;
    }
    else
    {
      v11 = *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFF8) + 0x10);
      v12 = v6;
      if (v11)
      {
LABEL_4:
        sub_1B8E94FC0(v10);
        v14 = v13;
LABEL_8:
        swift_bridgeObjectRelease();

        return v14;
      }
    }
    v14 = MEMORY[0x1E0DEE9E8];
    goto LABEL_8;
  }
  return MEMORY[0x1E0DEE9E8];
}

BOOL sub_1B900AD14(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1BCCC1DA8](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = sub_1B900AF28(a1);

  }
  else
  {
    return 0;
  }
  return v6;
}

uint64_t sub_1B900AE08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = MEMORY[0x1BCCC1DA8](v2 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate);
  if (result)
  {
    sub_1B8E78E1C(a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

BOOL sub_1B900AF28(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  char v19;
  char v20;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_containingItem);
  v5 = objc_msgSend(v4, sel_services);

  sub_1B8FF67D0();
  sub_1B8F2A4E0();
  v6 = sub_1B93EE0FC();

  v7 = objc_msgSend(a1, sel_containingItem);
  objc_opt_self();
  v8 = (void *)swift_dynamicCastObjCClass();
  v9 = v8;
  if (!v8)
  {

    goto LABEL_9;
  }
  v10 = objc_msgSend(v8, sel_mediaProfileContainer);
  if (!v10)
    goto LABEL_9;
  v11 = v10;
  v12 = (_QWORD *)(v2 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config);
  swift_beginAccess();
  if (v12[1])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1B9436B60;
    *(_QWORD *)(v13 + 32) = v11;
    sub_1B93EDF64();
    sub_1B93ECF74();
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B18);
    sub_1B8E23178(&qword_1EF210B20, &qword_1EF210B18, MEMORY[0x1E0DEAF38]);
    v14 = sub_1B93EDEBC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_unknownObjectRelease();
      return 0;
    }
  }
  if (!*v12)
  {
    swift_unknownObjectRelease();
    if ((v6 & 0xC000000000000001) != 0)
    {
LABEL_10:
      if (!sub_1B93EE780())
        goto LABEL_20;
LABEL_15:
      v17 = (_QWORD *)(v2 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config);
      swift_beginAccess();
      if (v17[1])
      {
        sub_1B93ECF74();
        v18 = sub_1B93ECF74();
        sub_1B8E91570(v18);
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B18);
        sub_1B8E23178(&qword_1EF210B20, &qword_1EF210B18, MEMORY[0x1E0DEAF38]);
        v19 = sub_1B93EDEC8();
        swift_bridgeObjectRelease();
        swift_release();
        if ((v19 & 1) == 0)
        {
          swift_bridgeObjectRelease();

          return 0;
        }
      }
      if (*v17)
      {
        sub_1B93ECF74();
        sub_1B8E91570(v6);
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B18);
        sub_1B8E23178(&qword_1EF210B20, &qword_1EF210B18, MEMORY[0x1E0DEAF38]);
        v20 = sub_1B93EDEC8();
        swift_bridgeObjectRelease();
        swift_release();

        return (v20 & 1) == 0;
      }
LABEL_20:
      swift_bridgeObjectRelease();

      return 1;
    }
LABEL_14:
    if (!*(_QWORD *)(v6 + 16))
      goto LABEL_20;
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v15 + 32) = v11;
  sub_1B93EDF64();
  swift_unknownObjectRetain();
  sub_1B93ECF74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B18);
  sub_1B8E23178(&qword_1EF210B20, &qword_1EF210B18, MEMORY[0x1E0DEAF38]);
  v16 = sub_1B93EDEBC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if ((v16 & 1) == 0)
  {
LABEL_9:
    if ((v6 & 0xC000000000000001) != 0)
      goto LABEL_10;
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();

  return 0;
}

void ActionGridItemModule.__allocating_init(home:itemUpdater:itemProviderBlock:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ActionGridItemModule.init(home:itemUpdater:itemProviderBlock:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1B900B3B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer);
  return sub_1B8E7A1E8(v0 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate);
}

id ActionGridItemModule.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActionGridItemModule();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B900B484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v6;
  char *v7;
  objc_class *v8;
  id v9;
  objc_super v11;

  v6 = &v3[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  *(_OWORD *)(v6 + 24) = xmmword_1B943DF30;
  *((_QWORD *)v6 + 5) = 0;
  *((_WORD *)v6 + 24) = 1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_1B8E2D0BC(a1, (uint64_t)&v3[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer]);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType] = 1;
  swift_unknownObjectWeakAssign();
  v7 = &v3[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_itemProviderBlock];
  v8 = (objc_class *)type metadata accessor for AccessoryItemModule();
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v11.receiver = v3;
  v11.super_class = v8;
  v9 = objc_msgSendSuper2(&v11, sel_initWithItemUpdater_, a3);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t sub_1B900B588()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

BOOL sub_1B900B5AC(void *a1)
{
  uint64_t v1;

  return sub_1B900AD14(a1, v1);
}

uint64_t type metadata accessor for ActionGridItemModule()
{
  return objc_opt_self();
}

uint64_t method lookup function for ActionGridItemModule()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActionGridItemModule.config.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActionGridItemModule.config.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActionGridItemModule.config.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActionGridItemModule.__allocating_init(actionBuilderContainer:home:itemUpdater:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of ActionGridItemModule.actionSetValueSource(_:didUpdateValuesFor:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t destroy for ActionGridItemModule.Config()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActionGridItemModule.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  sub_1B93ECF74();
  sub_1B93ECF74();
  return a1;
}

uint64_t assignWithCopy for ActionGridItemModule.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  sub_1B93ECF74();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_1B93ECF74();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ActionGridItemModule.Config(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionGridItemModule.Config(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 50))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ActionGridItemModule.Config(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 50) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 50) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActionGridItemModule.Config()
{
  return &type metadata for ActionGridItemModule.Config;
}

id HUBlurButton.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void HUBlurButton.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI12HUBlurButton_horizontalPadding] = 0x4034000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI12HUBlurButton_verticalPadding] = 0x4014000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI12HUBlurButton_cornerRadius] = 0x4034000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6HomeUI12HUBlurButton_blurBackgroundView] = 0;

  sub_1B93EE9CC();
  __break(1u);
}

id HUBlurButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *HUBlurButton.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  id v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
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
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char *v32;
  id v33;
  objc_super v35;

  *(_QWORD *)&v4[OBJC_IVAR____TtC6HomeUI12HUBlurButton_horizontalPadding] = 0x4034000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6HomeUI12HUBlurButton_verticalPadding] = 0x4014000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6HomeUI12HUBlurButton_cornerRadius] = 0x4034000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC6HomeUI12HUBlurButton_blurBackgroundView] = 0;
  v35.receiver = v4;
  v35.super_class = (Class)type metadata accessor for HUBlurButton();
  v9 = objc_msgSendSuper2(&v35, sel_initWithFrame_, a1, a2, a3, a4);
  v10 = (void *)objc_opt_self();
  v11 = (char *)v9;
  v12 = objc_msgSend(v10, sel_effectWithStyle_, 1);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABE8]), sel_initWithEffect_, v12);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v11, sel_addSubview_, v13);
  v14 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1B9438CD0;
  v16 = objc_msgSend(v11, sel_topAnchor);
  v17 = objc_msgSend(v13, sel_topAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, 5.0);

  *(_QWORD *)(v15 + 32) = v18;
  v19 = objc_msgSend(v11, sel_bottomAnchor);
  v20 = objc_msgSend(v13, sel_bottomAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, -5.0);

  *(_QWORD *)(v15 + 40) = v21;
  v22 = objc_msgSend(v11, sel_leadingAnchor);
  v23 = objc_msgSend(v13, sel_leadingAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, 20.0);

  *(_QWORD *)(v15 + 48) = v24;
  v25 = objc_msgSend(v11, sel_trailingAnchor);
  v26 = objc_msgSend(v13, sel_trailingAnchor);
  v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, -20.0);

  *(_QWORD *)(v15 + 56) = v27;
  sub_1B93EDF64();
  sub_1B8E4C518();
  v28 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_activateConstraints_, v28);

  v29 = *(void **)&v11[OBJC_IVAR____TtC6HomeUI12HUBlurButton_blurBackgroundView];
  *(_QWORD *)&v11[OBJC_IVAR____TtC6HomeUI12HUBlurButton_blurBackgroundView] = v13;
  v30 = v13;

  objc_msgSend(v11, sel__setContinuousCornerRadius_, 20.0);
  objc_msgSend(v30, sel__setContinuousCornerRadius_, 20.0);
  v31 = (void *)objc_opt_self();
  v32 = v11;
  v33 = objc_msgSend(v31, sel_blackColor);
  objc_msgSend(v32, sel_setTitleColor_forState_, v33, 0);

  return v32;
}

uint64_t type metadata accessor for HUBlurButton()
{
  return objc_opt_self();
}

id HUBlurButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HUBlurButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HUBlurButton()
{
  return swift_lookUpClassMethod();
}

uint64_t static TAFFieldName.name.getter()
{
  return 1701667150;
}

uint64_t static TAFFieldName.firstName.getter()
{
  return 0x6D614E7473726946;
}

uint64_t static TAFFieldName.lastName.getter()
{
  return 0x656D614E7473614CLL;
}

uint64_t static TAFFieldName.phone.getter()
{
  return 0x656E6F6850;
}

uint64_t static TAFFieldName.email.getter()
{
  return 0x6C69616D45;
}

uint64_t static TAFFieldName.addressLine1.getter()
{
  return 0x4C73736572646441;
}

uint64_t static TAFFieldName.addressLine2.getter()
{
  return 0x4C73736572646441;
}

uint64_t static TAFFieldName.addressLine3.getter()
{
  return 0x4C73736572646441;
}

uint64_t static TAFFieldName.city.getter()
{
  return 2037672259;
}

uint64_t static TAFFieldName.state.getter()
{
  return 0x6574617453;
}

uint64_t static TAFFieldName.postalCode.getter()
{
  return 0x6F436C6174736F50;
}

uint64_t static TAFFieldName.country.getter()
{
  return 0x7972746E756F43;
}

id TAFFieldName.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TAFFieldName.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TAFFieldName();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for TAFFieldName()
{
  return objc_opt_self();
}

id TAFFieldName.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TAFFieldName();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id AccountDetailsDataModel.__allocating_init(meContact:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AccountDetailsDataModel.init(meContact:)(a1);
}

Swift::String_optional __swiftcall AccountDetailsDataModel.getInfo(tafFieldKey:)(Swift::String tafFieldKey)
{
  uint64_t v1;
  BOOL v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  Swift::String_optional result;

  v2 = tafFieldKey._countAndFlagsBits == 1701667150 && tafFieldKey._object == (void *)0xE400000000000000;
  if (v2
    || (object = tafFieldKey._object, countAndFlagsBits = tafFieldKey._countAndFlagsBits, (sub_1B93EEB10() & 1) != 0))
  {
    v5 = sub_1B900C750();
LABEL_7:
    v7 = v5;
    v8 = v6;
    goto LABEL_8;
  }
  if (countAndFlagsBits == 0x6D614E7473726946 && object == (void *)0xE900000000000065 || (sub_1B93EEB10() & 1) != 0)
  {
    v5 = sub_1B900E2C0();
    goto LABEL_7;
  }
  if (countAndFlagsBits == 0x656D614E7473614CLL && object == (void *)0xE800000000000000 || (sub_1B93EEB10() & 1) != 0)
  {
    v5 = sub_1B900E3E8();
    goto LABEL_7;
  }
  if (countAndFlagsBits == 0x656E6F6850 && object == (void *)0xE500000000000000 || (sub_1B93EEB10() & 1) != 0)
  {
    v5 = sub_1B900DC38();
    goto LABEL_7;
  }
  if (countAndFlagsBits == 0x6C69616D45 && object == (void *)0xE500000000000000 || (sub_1B93EEB10() & 1) != 0)
  {
    v5 = sub_1B900D938();
    goto LABEL_7;
  }
  if (countAndFlagsBits == 0x4C73736572646441 && object == (void *)0xEC00000031656E69 || (sub_1B93EEB10() & 1) != 0)
  {
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress1;
  }
  else if (countAndFlagsBits == 0x4C73736572646441 && object == (void *)0xEC00000032656E69
         || (sub_1B93EEB10() & 1) != 0)
  {
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress2;
  }
  else if (countAndFlagsBits == 0x4C73736572646441 && object == (void *)0xEC00000033656E69
         || (sub_1B93EEB10() & 1) != 0)
  {
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress3;
  }
  else if (countAndFlagsBits == 2037672259 && object == (void *)0xE400000000000000 || (sub_1B93EEB10() & 1) != 0)
  {
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_city;
  }
  else if (countAndFlagsBits == 0x6574617453 && object == (void *)0xE500000000000000 || (sub_1B93EEB10() & 1) != 0)
  {
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_state;
  }
  else if (countAndFlagsBits == 0x7972746E756F43 && object == (void *)0xE700000000000000
         || (sub_1B93EEB10() & 1) != 0)
  {
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_country;
  }
  else
  {
    if ((countAndFlagsBits != 0x6F436C6174736F50 || object != (void *)0xEA00000000006564)
      && (sub_1B93EEB10() & 1) == 0)
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_8;
    }
    v11 = OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_zipCode;
  }
  v12 = (uint64_t *)(v1 + v11);
  v7 = *v12;
  v8 = (void *)v12[1];
  sub_1B93ECF74();
LABEL_8:
  v9 = v7;
  v10 = v8;
  result.value._object = v10;
  result.value._countAndFlagsBits = v9;
  return result;
}

uint64_t sub_1B900C750()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  if (!v4)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v4, 0);
  if (!v0)
  {

    return 0;
  }
  v1 = v0;
  v2 = sub_1B93EDDB4();

  return v2;
}

uint64_t sub_1B900C820()
{
  uint64_t inited;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E720);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B9438CC0;
  v1 = sub_1B900D938();
  v3 = v2;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v2;
  v5 = sub_1B900DC38();
  v6 = v4;
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = v4;
  if (!v3)
    goto LABEL_9;
  v7 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v7 = v1 & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
LABEL_9:
    v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if (!v4)
      goto LABEL_18;
    goto LABEL_10;
  }
  sub_1B93ECF74();
  v8 = sub_1B8E49D10(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v10 = v8[2];
  v9 = v8[3];
  if (v10 >= v9 >> 1)
    v8 = sub_1B8E49D10((_QWORD *)(v9 > 1), v10 + 1, 1, v8);
  v8[2] = v10 + 1;
  v11 = &v8[2 * v10];
  v11[4] = v1;
  v11[5] = v3;
  if (v6)
  {
LABEL_10:
    v12 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v12 = v5 & 0xFFFFFFFFFFFFLL;
    if (v12)
    {
      sub_1B93ECF74();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_1B8E49D10(0, v8[2] + 1, 1, v8);
      v14 = v8[2];
      v13 = v8[3];
      if (v14 >= v13 >> 1)
        v8 = sub_1B8E49D10((_QWORD *)(v13 > 1), v14 + 1, 1, v8);
      v8[2] = v14 + 1;
      v15 = &v8[2 * v14];
      v15[4] = v5;
      v15[5] = v6;
    }
  }
LABEL_18:
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E8D0);
  sub_1B8E49F50();
  v16 = sub_1B93EDD6C();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1B900C9FC()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B900CA6C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  return v1;
}

id AccountDetailsDataModel.init(meContact:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  id v23;
  id v24;
  uint64_t v26;
  objc_class *ObjectType;
  objc_super v28;
  void *v29;
  uint64_t v30;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EBE8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B98);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__contact];
  v30 = 0;
  v13 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BA8);
  sub_1B93ED154();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v14 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__didSubmitInfo];
  LOBYTE(v30) = 0;
  sub_1B93ED154();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v7, v4);
  v15 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress1];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress2];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress3];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_city];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v19 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_state];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_country];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  v21 = &v13[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_zipCode];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  swift_beginAccess();
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23 = a1;
  v22(v12, v8);
  v29 = a1;
  sub_1B93ED154();
  swift_endAccess();

  v28.receiver = v13;
  v28.super_class = ObjectType;
  v24 = objc_msgSendSuper2(&v28, sel_init);
  sub_1B900CD18();

  return v24;
}

id sub_1B900CD18()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;

  v1 = v0;
  result = sub_1B900E034();
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, sel_street);
    v5 = sub_1B93EDDB4();
    v7 = v6;

    v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0)
      v8 = v5 & 0xFFFFFFFFFFFFLL;
    if (v8)
    {
      sub_1B8E49E1C();
      v9 = sub_1B93EE618();
      swift_bridgeObjectRelease();
      v10 = *(_QWORD *)(v9 + 16);
      if (v10)
      {
        v11 = 0;
        v12 = (_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress3);
        v13 = (_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress2);
        v14 = (_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress1);
        v15 = (uint64_t *)(v9 + 40);
        do
        {
          v16 = *v15;
          v17 = v12;
          if (v11 != 2)
          {
            v17 = v13;
            if (v11 != 1)
            {
              if (v11)
                goto LABEL_8;
              v17 = v14;
            }
          }
          *v17 = *(v15 - 1);
          v17[1] = v16;
          sub_1B93ECF74();
          swift_bridgeObjectRelease();
LABEL_8:
          ++v11;
          v15 += 2;
        }
        while (v10 != v11);
      }
    }
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v3, sel_city);
    v19 = sub_1B93EDDB4();
    v21 = v20;

    v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0)
      v22 = v19 & 0xFFFFFFFFFFFFLL;
    if (v22)
    {
      v23 = (uint64_t *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_city);
      *v23 = v19;
      v23[1] = v21;
    }
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v3, sel_state);
    v25 = sub_1B93EDDB4();
    v27 = v26;

    v28 = HIBYTE(v27) & 0xF;
    if ((v27 & 0x2000000000000000) == 0)
      v28 = v25 & 0xFFFFFFFFFFFFLL;
    if (v28)
    {
      v29 = (uint64_t *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_state);
      *v29 = v25;
      v29[1] = v27;
    }
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v3, sel_country);
    v31 = sub_1B93EDDB4();
    v33 = v32;

    v34 = HIBYTE(v33) & 0xF;
    if ((v33 & 0x2000000000000000) == 0)
      v34 = v31 & 0xFFFFFFFFFFFFLL;
    if (v34)
    {
      v35 = (uint64_t *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_country);
      *v35 = v31;
      v35[1] = v33;
    }
    swift_bridgeObjectRelease();
    v36 = objc_msgSend(v3, sel_postalCode);
    v37 = sub_1B93EDDB4();
    v39 = v38;

    v40 = HIBYTE(v39) & 0xF;
    if ((v39 & 0x2000000000000000) == 0)
      v40 = v37 & 0xFFFFFFFFFFFFLL;
    if (v40)
    {
      v41 = (uint64_t *)(v1 + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_zipCode);
      *v41 = v37;
      v41[1] = v39;
    }
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall AccountDetailsDataModel.deserialize(results:)(Swift::OpaquePointer results)
{
  char *v1;
  char *v2;
  id v4;
  char v5;
  void *v6;
  char **v7;
  char v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  char v31;
  uint64_t *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;

  v2 = v1;
  swift_getObjectType();
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97360]), sel_init);
  if (!*((_QWORD *)results._rawValue + 2))
  {
LABEL_20:
    v27 = 0;
    v28 = 0;
    goto LABEL_21;
  }
  sub_1B8E268AC(1701667150, 0xE400000000000000);
  if ((v5 & 1) != 0)
  {
    sub_1B93ECF74();
    v6 = (void *)sub_1B93EDD84();
    v7 = &selRef_setGivenName_;
LABEL_4:
    swift_bridgeObjectRelease();
    objc_msgSend(v4, *v7, v6);

    goto LABEL_5;
  }
  if (!*((_QWORD *)results._rawValue + 2))
    goto LABEL_20;
  sub_1B8E268AC(0x6D614E7473726946, 0xE900000000000065);
  if ((v29 & 1) != 0)
  {
    sub_1B93ECF74();
    v30 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setGivenName_, v30);

  }
  if (!*((_QWORD *)results._rawValue + 2))
    goto LABEL_20;
  sub_1B8E268AC(0x656D614E7473614CLL, 0xE800000000000000);
  if ((v31 & 1) != 0)
  {
    sub_1B93ECF74();
    v6 = (void *)sub_1B93EDD84();
    v7 = &selRef_setFamilyName_;
    goto LABEL_4;
  }
LABEL_5:
  if (!*((_QWORD *)results._rawValue + 2))
    goto LABEL_20;
  sub_1B8E268AC(0x656E6F6850, 0xE500000000000000);
  if ((v8 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1B9436B60;
    sub_1B93EDDB4();
    v10 = objc_allocWithZone(MEMORY[0x1E0C97398]);
    sub_1B93ECF74();
    v11 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, sel_initWithStringValue_, v11);

    v13 = objc_allocWithZone(MEMORY[0x1E0C97338]);
    v14 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v13, sel_initWithLabel_value_, v14, v12);

    *(_QWORD *)(v9 + 32) = v15;
    sub_1B93EDF64();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
    v16 = (void *)sub_1B93EDF34();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setPhoneNumbers_, v16);

  }
  if (!*((_QWORD *)results._rawValue + 2))
    goto LABEL_20;
  sub_1B8E268AC(0x6C69616D45, 0xE500000000000000);
  if ((v17 & 1) != 0)
  {
    sub_1B93ECF74();
    v18 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1B9436B60;
    sub_1B93EDDB4();
    v20 = objc_allocWithZone(MEMORY[0x1E0C97338]);
    v21 = v18;
    v22 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v20, sel_initWithLabel_value_, v22, v21);

    *(_QWORD *)(v19 + 32) = v23;
    sub_1B93EDF64();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
    v24 = (void *)sub_1B93EDF34();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setEmailAddresses_, v24);

  }
  if (!*((_QWORD *)results._rawValue + 2))
    goto LABEL_20;
  v25 = sub_1B8E268AC(0x4C73736572646441, 0xEC00000031656E69);
  if ((v26 & 1) == 0)
    goto LABEL_20;
  v27 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v25);
  v28 = sub_1B93ECF74();
LABEL_21:
  v32 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress1];
  *v32 = v27;
  v32[1] = v28;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)results._rawValue + 2)
    && (v33 = sub_1B8E268AC(0x4C73736572646441, 0xEC00000032656E69), (v34 & 1) != 0))
  {
    v35 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v33);
    v36 = sub_1B93ECF74();
  }
  else
  {
    v35 = 0;
    v36 = 0;
  }
  v37 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress2];
  *v37 = v35;
  v37[1] = v36;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)results._rawValue + 2)
    && (v38 = sub_1B8E268AC(0x4C73736572646441, 0xEC00000033656E69), (v39 & 1) != 0))
  {
    v40 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v38);
    v41 = sub_1B93ECF74();
  }
  else
  {
    v40 = 0;
    v41 = 0;
  }
  v42 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress3];
  *v42 = v40;
  v42[1] = v41;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)results._rawValue + 2) && (v43 = sub_1B8E268AC(2037672259, 0xE400000000000000), (v44 & 1) != 0))
  {
    v45 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v43);
    v46 = sub_1B93ECF74();
  }
  else
  {
    v45 = 0;
    v46 = 0;
  }
  v47 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_city];
  *v47 = v45;
  v47[1] = v46;
  swift_bridgeObjectRelease();
  v88 = v4;
  if (*((_QWORD *)results._rawValue + 2) && (v48 = sub_1B8E268AC(0x6574617453, 0xE500000000000000), (v49 & 1) != 0))
  {
    v50 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v48);
    v51 = sub_1B93ECF74();
  }
  else
  {
    v50 = 0;
    v51 = 0;
  }
  v52 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_state];
  *v52 = v50;
  v52[1] = v51;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)results._rawValue + 2)
    && (v53 = sub_1B8E268AC(0x6F436C6174736F50, 0xEA00000000006564), (v54 & 1) != 0))
  {
    v55 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v53);
    v56 = sub_1B93ECF74();
  }
  else
  {
    v55 = 0;
    v56 = 0;
  }
  v57 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_zipCode];
  *v57 = v55;
  v57[1] = v56;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)results._rawValue + 2)
    && (v58 = sub_1B8E268AC(0x7972746E756F43, 0xE700000000000000), (v59 & 1) != 0))
  {
    v60 = *(_QWORD *)(*((_QWORD *)results._rawValue + 7) + 16 * v58);
    v61 = sub_1B93ECF74();
  }
  else
  {
    v60 = 0;
    v61 = 0;
  }
  v62 = (uint64_t *)&v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_country];
  *v62 = v60;
  v62[1] = v61;
  swift_bridgeObjectRelease();
  v63 = *v32;
  v64 = v32[1];
  v85 = *v37;
  v86 = v63;
  v87 = v2;
  v65 = v37[1];
  v66 = v42[1];
  v67 = *v47;
  v68 = v47[1];
  v83 = v67;
  v84 = *v42;
  v69 = v52[1];
  v82 = *v52;
  v71 = *v57;
  v70 = v57[1];
  v73 = *v62;
  v72 = v62[1];
  sub_1B93ECF74();
  sub_1B93ECF74();
  sub_1B93ECF74();
  sub_1B93ECF74();
  sub_1B93ECF74();
  sub_1B93ECF74();
  sub_1B93ECF74();
  v74 = sub_1B8EBF964(v86, v64, v85, v65, v84, v66, v83, v68, v82, v69, v71, v70, v73, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = xmmword_1B9436B60;
  sub_1B93EDDB4();
  v76 = objc_allocWithZone(MEMORY[0x1E0C97338]);
  v77 = v74;
  v78 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  v79 = objc_msgSend(v76, sel_initWithLabel_value_, v78, v77);

  *(_QWORD *)(v75 + 32) = v79;
  sub_1B93EDF64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
  v80 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  objc_msgSend(v88, sel_setPostalAddresses_, v80);

  swift_getKeyPath();
  swift_getKeyPath();
  v81 = v88;
  v87;
  sub_1B93ED16C();
  sub_1B8F58A9C();
  sub_1B93ED130();
  sub_1B93ED13C();

  swift_release();
}

uint64_t sub_1B900D938()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t result;
  id v18;
  id v19;
  void *v20;
  id v21;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  v0 = v21;
  if (!v21)
    return (uint64_t)v0;
  if (!objc_msgSend(v21, sel_isKeyAvailable_, *MEMORY[0x1E0C966A8]))
  {

    return 0;
  }
  v1 = objc_msgSend(v21, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
  v2 = sub_1B93EDF4C();

  if (v2 >> 62)
  {
LABEL_33:
    sub_1B93ECF74();
    v3 = sub_1B93EE9F0();
    if (v3)
      goto LABEL_5;
    goto LABEL_34;
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_1B93ECF74();
  if (!v3)
  {
LABEL_34:

    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_5:
  v20 = v0;
  v4 = v2 & 0xC000000000000001;
  v5 = 4;
  do
  {
    if (v4)
      v6 = (id)MEMORY[0x1BCCC05FC](v5 - 4, v2);
    else
      v6 = *(id *)(v2 + 8 * v5);
    v7 = v6;
    v0 = (void *)(v5 - 3);
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    v8 = objc_msgSend(v6, sel_label);
    if (!v8)
    {
      sub_1B93EDDB4();
LABEL_7:

      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    v9 = v8;
    v10 = sub_1B93EDDB4();
    v12 = v11;

    v13 = sub_1B93EDDB4();
    if (!v12)
      goto LABEL_7;
    if (v10 == v13 && v12 == v14)
    {
      swift_bridgeObjectRelease_n();
LABEL_25:
      swift_bridgeObjectRelease_n();
      goto LABEL_29;
    }
    v16 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      goto LABEL_25;

LABEL_8:
    ++v5;
  }
  while (v0 != (void *)v3);
  result = swift_bridgeObjectRelease();
  if (v4)
  {
    v18 = (id)MEMORY[0x1BCCC05FC](0, v2);
  }
  else
  {
    if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    v18 = *(id *)(v2 + 32);
  }
  v7 = v18;
  swift_bridgeObjectRelease();
LABEL_29:
  v19 = objc_msgSend(v7, sel_value);
  if (v19)
  {
    sub_1B93EDDA8();

    v0 = 0;
  }
  else
  {

    return 0;
  }
  return (uint64_t)v0;
}

uint64_t sub_1B900DC38()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t result;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  v0 = (uint64_t)v34;
  if (!v34)
    return 0;
  if (!objc_msgSend(v34, sel_isKeyAvailable_, *MEMORY[0x1E0C967C0]))
    goto LABEL_47;
  v1 = objc_msgSend(v34, sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
  v2 = sub_1B93EDF4C();

  if (v2 >> 62)
    goto LABEL_52;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_1B93ECF74();
  if (!v3)
  {
LABEL_53:

    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_5:
  v33 = v0;
  v4 = v2 & 0xC000000000000001;
  v0 = 4;
  do
  {
    if (v4)
      v5 = (id)MEMORY[0x1BCCC05FC](v0 - 4, v2);
    else
      v5 = *(id *)(v2 + 8 * v0);
    v6 = v5;
    v7 = v0 - 3;
    if (__OFADD__(v0 - 4, 1))
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      sub_1B93ECF74();
      v3 = sub_1B93EE9F0();
      if (!v3)
        goto LABEL_53;
      goto LABEL_5;
    }
    v8 = objc_msgSend(v5, sel_label);
    if (!v8)
    {
      sub_1B93EDDB4();
LABEL_7:

      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    v9 = v8;
    v10 = sub_1B93EDDB4();
    v12 = v11;

    v13 = sub_1B93EDDB4();
    if (!v12)
      goto LABEL_7;
    if (v10 == v13 && v12 == v14)
    {
LABEL_37:
      swift_bridgeObjectRelease_n();
LABEL_38:
      swift_bridgeObjectRelease_n();
LABEL_44:
      v0 = v33;
      v30 = objc_msgSend(v6, sel_value, v33);
      v31 = objc_msgSend(v30, sel_formattedStringValue);

      if (v31)
      {
        v32 = sub_1B93EDDB4();

        return v32;
      }

LABEL_47:
      return 0;
    }
    v16 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      goto LABEL_38;

LABEL_8:
    ++v0;
  }
  while (v7 != v3);
  v0 = 4;
  do
  {
    if (v4)
      v17 = (id)MEMORY[0x1BCCC05FC](v0 - 4, v2);
    else
      v17 = *(id *)(v2 + 8 * v0);
    v6 = v17;
    v18 = v0 - 3;
    if (__OFADD__(v0 - 4, 1))
      goto LABEL_51;
    v19 = objc_msgSend(v17, sel_label);
    if (!v19)
    {
      sub_1B93EDDB4();
LABEL_23:

      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
    v20 = v19;
    v21 = sub_1B93EDDB4();
    v23 = v22;

    v24 = sub_1B93EDDB4();
    if (!v23)
      goto LABEL_23;
    if (v21 == v24 && v23 == v25)
      goto LABEL_37;
    v27 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
      goto LABEL_38;

LABEL_24:
    ++v0;
  }
  while (v18 != v3);
  result = swift_bridgeObjectRelease();
  if (v4)
  {
    v29 = (id)MEMORY[0x1BCCC05FC](0, v2);
LABEL_43:
    v6 = v29;
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v29 = *(id *)(v2 + 32);
    goto LABEL_43;
  }
  __break(1u);
  return result;
}

id sub_1B900E034()
{
  id v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  id v16;
  id v18;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  if (v18)
  {
    if (objc_msgSend(v18, sel_isKeyAvailable_, *MEMORY[0x1E0C967F0]))
    {
      v0 = objc_msgSend(v18, sel_postalAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
      v1 = sub_1B93EDF4C();

      if (v1 >> 62)
        goto LABEL_25;
      v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      sub_1B93ECF74();
      for (; v2; v2 = sub_1B93EE9F0())
      {
        v3 = 4;
        while (1)
        {
          v4 = (v1 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x1BCCC05FC](v3 - 4, v1)
             : *(id *)(v1 + 8 * v3);
          v5 = v4;
          v6 = v3 - 3;
          if (__OFADD__(v3 - 4, 1))
            break;
          v7 = objc_msgSend(v4, sel_label);
          if (!v7)
          {
            sub_1B93EDDB4();
LABEL_7:

            swift_bridgeObjectRelease();
            goto LABEL_8;
          }
          v8 = v7;
          v9 = sub_1B93EDDB4();
          v11 = v10;

          v12 = sub_1B93EDDB4();
          if (!v11)
            goto LABEL_7;
          if (v9 == v12 && v11 == v13)
          {
            swift_bridgeObjectRelease_n();
LABEL_23:
            swift_bridgeObjectRelease_n();
            v16 = objc_msgSend(v5, sel_value);

            return v16;
          }
          v15 = sub_1B93EEB10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v15 & 1) != 0)
            goto LABEL_23;

LABEL_8:
          ++v3;
          if (v6 == v2)
            goto LABEL_26;
        }
        __break(1u);
LABEL_25:
        sub_1B93ECF74();
      }
LABEL_26:
      swift_bridgeObjectRelease_n();

    }
    else
    {

    }
  }
  return 0;
}

uint64_t sub_1B900E2C0()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v8;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  if (!v8)
    return 0;
  if (!objc_msgSend(v8, sel_isKeyAvailable_, *MEMORY[0x1E0C966D0]))
    goto LABEL_7;
  v0 = objc_msgSend(v8, sel_givenName);
  v1 = sub_1B93EDDB4();
  v3 = v2;

  swift_bridgeObjectRelease();
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = v1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
  {
LABEL_7:

    return 0;
  }
  v5 = objc_msgSend(v8, sel_givenName);
  v6 = sub_1B93EDDB4();

  return v6;
}

uint64_t sub_1B900E3E8()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v8;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  if (!v8)
    return 0;
  if (!objc_msgSend(v8, sel_isKeyAvailable_, *MEMORY[0x1E0C966C0]))
    goto LABEL_7;
  v0 = objc_msgSend(v8, sel_familyName);
  v1 = sub_1B93EDDB4();
  v3 = v2;

  swift_bridgeObjectRelease();
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = v1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
  {
LABEL_7:

    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  v5 = objc_msgSend(v8, sel_familyName);

  v6 = sub_1B93EDDB4();
  return v6;
}

uint64_t AccountDetailsDataModel.phoneNumberServer.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[3];
  id v20;

  v0 = sub_1B93EC884();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  swift_release();
  v4 = v20;
  if (!v20)
    return 0;
  if (!objc_msgSend(v20, sel_isKeyAvailable_, *MEMORY[0x1E0C967C0]))
    goto LABEL_15;
  v5 = objc_msgSend(v4, sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BB8);
  v6 = sub_1B93EDF4C();

  if (!(v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_17:

    swift_bridgeObjectRelease();
    return 0;
  }
  sub_1B93ECF74();
  v17 = sub_1B93EE9F0();
  swift_bridgeObjectRelease();
  if (!v17)
    goto LABEL_17;
LABEL_5:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x1BCCC05FC](0, v6);
  }
  else
  {
    if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    v7 = *(id *)(v6 + 32);
  }
  v8 = v7;
  swift_bridgeObjectRelease();
  v6 = (unint64_t)objc_msgSend(v8, sel_value);

  if (!v6)
  {
LABEL_15:

    return 0;
  }
  v9 = objc_msgSend((id)v6, sel_fullyQualifiedDigits);
  if (!v9)
  {
    if (qword_1ED57E6C8 == -1)
    {
LABEL_11:
      v10 = (id)qword_1ED580E70;
      sub_1B93EC890();
      v11 = sub_1B93EC86C();
      v12 = sub_1B93EE234();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        v14 = (void *)swift_slowAlloc();
        v20 = v14;
        *(_DWORD *)v13 = 136315138;
        v19[1] = v13 + 4;
        v19[2] = sub_1B8E3489C(0xD000000000000011, 0x80000001B9451140, (uint64_t *)&v20);
        sub_1B93EE600();
        _os_log_impl(&dword_1B8E1E000, v11, v12, "%s could not get fullyQualifiedDigits", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCC1CD0](v14, -1, -1);
        MEMORY[0x1BCCC1CD0](v13, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      v9 = objc_msgSend((id)v6, sel_digits);
      goto LABEL_14;
    }
LABEL_22:
    swift_once();
    goto LABEL_11;
  }
LABEL_14:
  v15 = v9;
  v16 = sub_1B93EDDB4();

  return v16;
}

id AccountDetailsDataModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AccountDetailsDataModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccountDetailsDataModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B900EBE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_1B93ED130();
  *a1 = result;
  return result;
}

uint64_t sub_1B900EC1C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B93ED160();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1B900EC98(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_1B93ED16C();
}

uint64_t type metadata accessor for AccountDetailsDataModel()
{
  uint64_t result;

  result = qword_1EF210BE8;
  if (!qword_1EF210BE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B900ED4C()
{
  return type metadata accessor for AccountDetailsDataModel();
}

void sub_1B900ED54()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B900EE04();
  if (v0 <= 0x3F)
  {
    sub_1B900EE5C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AccountDetailsDataModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountDetailsDataModel.__allocating_init(meContact:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

void sub_1B900EE04()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF210BF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF210BA8);
    v0 = sub_1B93ED178();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF210BF8);
  }
}

void sub_1B900EE5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF20E9D0)
  {
    v0 = sub_1B93ED178();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF20E9D0);
  }
}

id sub_1B900EEB8(Swift::OpaquePointer a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  id v23;
  uint64_t v25;
  objc_super v26;
  uint64_t v27;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EBE8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B98);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v2[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__contact];
  v27 = 0;
  v14 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210BA8);
  sub_1B93ED154();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  v15 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__didSubmitInfo];
  LOBYTE(v27) = 0;
  sub_1B93ED154();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v8, v5);
  v16 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress1];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress2];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_streetAddress3];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v19 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_city];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_state];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  v21 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_country];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  v22 = &v14[OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel_zipCode];
  *(_QWORD *)v22 = 0;
  *((_QWORD *)v22 + 1) = 0;

  v26.receiver = v14;
  v26.super_class = ObjectType;
  v23 = objc_msgSendSuper2(&v26, sel_init);
  AccountDetailsDataModel.deserialize(results:)(a1);

  return v23;
}

uint64_t type metadata accessor for CameraDashboardMosaicElementBuilder()
{
  return objc_opt_self();
}

uint64_t sub_1B900F0C4(uint64_t a1, char a2)
{
  int v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = a2 & 1;
  if (a1 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2092A0);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B9438CC0;
    *(_BYTE *)(v4 + 32) = v2 | 0x80;
    *(_BYTE *)(v4 + 33) = v2 | 0x80;
  }
  else if (a1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2092A0);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B9438C30;
    *(_BYTE *)(v4 + 32) = v2 | 0x80;
  }
  else
  {
    v4 = (uint64_t)sub_1B8E8AC54(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v6 = *(_QWORD *)(v4 + 16);
    v5 = *(_QWORD *)(v4 + 24);
    if (v6 >= v5 >> 1)
      goto LABEL_11;
    while (1)
    {
      v5 = v2 | 0x60u;
      *(_QWORD *)(v4 + 16) = v6 + 1;
      *(_BYTE *)(v4 + v6 + 32) = v2 | 0x60;
      v9 = v4;
      if (!__OFSUB__(a1, 3))
        break;
      __break(1u);
LABEL_11:
      v4 = (uint64_t)sub_1B8E8AC54((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
    }
    if (a1 - 3 >= 1)
    {
      v7 = sub_1B900F0C4();
      sub_1B8EFA994(v7);
      return v9;
    }
  }
  return v4;
}

id AccessoryEventPickerViewController.eventBuilderItem.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem);
}

id AccessoryEventPickerViewController.triggerBuilder.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder);
}

uint64_t AccessoryEventPickerViewController.mode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_mode);
}

uint64_t AccessoryEventPickerViewController.source.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_source);
}

uint64_t sub_1B900F2C0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x1BCCC1DA8](v1);
}

uint64_t sub_1B900F358()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1B900F3B0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___HUAccessoryEventPickerViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BCCC1DA8](v5);
  return sub_1B8E7B1B4;
}

uint64_t sub_1B900F4D0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  v2 = *v1;
  sub_1B8ED4C10(*v1);
  return v2;
}

uint64_t sub_1B900F5BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_1B8E6FE50(v6);
}

uint64_t sub_1B900F618@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, _BYTE *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1B8F11280;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_1B8ED4C10(v4);
}

uint64_t sub_1B900F6AC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1B8F11244;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1B8ED4C10(v3);
  return sub_1B8E6FE50(v8);
}

uint64_t (*sub_1B900F764())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id AccessoryEventPickerViewController.__allocating_init(eventBuilderItem:triggerBuilder:mode:source:delegate:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return AccessoryEventPickerViewController.init(eventBuilderItem:triggerBuilder:mode:source:delegate:)(a1, a2, a3, a4);
}

id AccessoryEventPickerViewController.init(eventBuilderItem:triggerBuilder:mode:source:delegate:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v9;
  id v10;
  id v11;
  char *v12;
  id v13;
  _BYTE *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  _BYTE *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t aBlock;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  objc_super v39;

  *(_QWORD *)&v4[OBJC_IVAR___HUAccessoryEventPickerViewController_accessoryElementModule] = 0;
  swift_unknownObjectWeakInit();
  v9 = &v4[OBJC_IVAR___HUAccessoryEventPickerViewController_filter];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem] = a1;
  *(_QWORD *)&v4[OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder] = a2;
  *(_QWORD *)&v4[OBJC_IVAR___HUAccessoryEventPickerViewController_mode] = a3;
  *(_QWORD *)&v4[OBJC_IVAR___HUAccessoryEventPickerViewController_source] = a4;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  objc_allocWithZone((Class)type metadata accessor for AccessoryEventItemSelectionController());
  v10 = a1;
  v11 = a2;
  v12 = v4;
  v13 = sub_1B8F8714C(v11, 0, 0, v10);
  *(_QWORD *)&v12[OBJC_IVAR___HUAccessoryEventPickerViewController_selectionController] = v13;
  v14 = v13;

  v14[OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_allowsDeselecting] = a3 == 0;
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31810]), sel_initWithDelegate_, 0);
  v39.receiver = v12;
  v39.super_class = (Class)type metadata accessor for AccessoryEventPickerViewController();
  v16 = objc_msgSendSuper2(&v39, sel_initUsingCompositionalLayoutWithItemManager_, v15);
  objc_msgSend(v15, sel_setDelegate_, v16);
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v37 = sub_1B90118CC;
  v38 = v17;
  v18 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v34 = 1107296256;
  v35 = sub_1B8E36AA4;
  v36 = &block_descriptor_48;
  v19 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v15, sel_setHomeCreator_, v19);
  _Block_release(v19);
  if (a4)
    v20 = 2;
  else
    v20 = 4;
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D315E8]), sel_init);
  v22 = objc_allocWithZone((Class)type metadata accessor for AccessoryRepresentableItemModule.Context());
  v23 = (char *)sub_1B8ED4880(v20, 0, 1, 1, 0, v21, 0, 0, 0, 0, v22);

  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = a4;
  *(_QWORD *)(v25 + 24) = v24;
  v26 = (uint64_t *)&v23[OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter];
  swift_beginAccess();
  v27 = *v26;
  *v26 = (uint64_t)sub_1B90118D4;
  v26[1] = v25;
  sub_1B8E6FE50(v27);
  v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v23;
  *(_QWORD *)(v29 + 24) = v28;
  v37 = sub_1B9011908;
  v38 = v29;
  aBlock = v18;
  v34 = 1107296256;
  v35 = sub_1B8ED0F64;
  v36 = &block_descriptor_11;
  v30 = _Block_copy(&aBlock);
  v31 = v23;
  swift_release();
  objc_msgSend(v15, sel_setItemModuleCreator_, v30);

  swift_unknownObjectRelease();
  _Block_release(v30);

  return v16;
}

id sub_1B900FBE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1BCCC1DA8](v1);
  if (v2
    && (v3 = (void *)v2,
        v4 = *(id *)(v2 + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder),
        v3,
        v5 = objc_msgSend(v4, sel_home),
        v4,
        v5))
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, v5);
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_hf_errorWithCode_, 59);
    v7 = (void *)sub_1B93EB6F0();
    v6 = objc_msgSend((id)objc_opt_self(), sel_futureWithError_, v7);

  }
  return v6;
}

uint64_t sub_1B900FCFC(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char *v15;
  id v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;

  v7 = a4 + 16;
  v8 = (char *)objc_allocWithZone((Class)type metadata accessor for EventAccessoryItemModule());
  swift_getObjectType();
  v9 = a3;
  v10 = a1;
  swift_unknownObjectRetain();
  v11 = sub_1B8F10218(v9, v10, a2, v8);
  swift_beginAccess();
  v12 = MEMORY[0x1BCCC1DA8](v7);
  v13 = (void *)v12;
  if (v12)
  {
    v14 = *(void **)(v12 + OBJC_IVAR___HUAccessoryEventPickerViewController_selectionController);
    v15 = v11;
    v16 = v14;

    v13 = (void *)sub_1B8E2C710(&qword_1EF210D10, (uint64_t (*)(uint64_t))type metadata accessor for AccessoryEventItemSelectionController, (uint64_t)&protocol conformance descriptor for AccessoryEventItemSelectionController);
  }
  else
  {
    v17 = v11;
    v16 = 0;
  }
  v18 = &v11[OBJC_IVAR___HUAccessoryRepresentableItemModule_selectionController];
  swift_beginAccess();
  *(_QWORD *)v18 = v16;
  *((_QWORD *)v18 + 1) = v13;

  swift_unknownObjectRelease();
  swift_beginAccess();
  v19 = MEMORY[0x1BCCC1DA8](v7);
  if (v19)
  {
    v20 = (void *)v19;
    v21 = *(void **)(v19 + OBJC_IVAR___HUAccessoryEventPickerViewController_accessoryElementModule);
    *(_QWORD *)(v19 + OBJC_IVAR___HUAccessoryEventPickerViewController_accessoryElementModule) = v11;
    v22 = v11;

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v23 + 32) = v11;
  v25 = v23;
  sub_1B93EDF64();
  return v25;
}

uint64_t sub_1B900FF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
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
  char *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t ObjectType;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  id v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t *v43;
  uint64_t (*v44)(uint64_t);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;

  v6 = sub_1B93ECB60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v46 - v11;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v46 - v14;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v46 - v17;
  v56 = &unk_1EF347348;
  result = swift_dynamicCastObjCProtocolConditional();
  if (result)
  {
    v20 = result;
    v51 = a2;
    swift_getObjectType();
    v21 = swift_conformsToProtocol2();
    if (v21)
      v22 = v21;
    else
      v22 = 0;
    if (v21)
      v23 = v20;
    else
      v23 = 0;
    if (!v23)
      return 0;
    v48 = a3;
    v24 = v22;
    ObjectType = swift_getObjectType();
    v26 = a1;
    v27 = ObjectType;
    v54 = v23;
    v52 = v26;
    swift_unknownObjectRetain();
    v49 = v24;
    v50 = v27;
    sub_1B93ECB9C();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF20D280);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1B9438CC0;
    sub_1B93ECB30();
    sub_1B93ECB48();
    v54 = v28;
    sub_1B8E2C710((unint64_t *)&qword_1EF20AE48, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2FF28], MEMORY[0x1E0D2FF40]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20D290);
    sub_1B8E35A0C();
    sub_1B93EE708();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v18, v6);
    sub_1B93EE6E4();
    LOBYTE(v28) = sub_1B93EE6F0();
    v29 = *(void (**)(char *, uint64_t))(v7 + 8);
    v29(v12, v6);
    v29(v15, v6);
    v29(v18, v6);
    if ((v28 & 1) == 0)
    {
      v30 = objc_msgSend((id)objc_opt_self(), sel_hiddenFromScenesAndAutomationsAccessoryTypeGroup);
      v31 = (void *)sub_1B93EE378();
      v32 = objc_msgSend(v30, sel_containsType_, v31);

      if ((v32 & 1) == 0)
      {
        v33 = (void *)objc_opt_self();
        v47 = v23;
        sub_1B93EE3A8();
        sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
        sub_1B8E48724((unint64_t *)&qword_1EF20ADA0, (unint64_t *)&qword_1EF2082C0);
        v34 = (void *)sub_1B93EE0D8();
        swift_bridgeObjectRelease();
        v35 = objc_msgSend(v33, sel_hasOptionsForServices_outCharacteristicType_, v34, 0);

        if (v35)
        {
          v36 = v51;
          if (v51 != 1)
          {
            if (v51)
            {
              v54 = 0;
              v55 = 0xE000000000000000;
              sub_1B93EE828();
              sub_1B93EDE44();
              v53 = v36;
              type metadata accessor for HUCharacteristicTriggerServicePickerSource(0);
              sub_1B93EE948();
              result = sub_1B93EE9CC();
              __break(1u);
              return result;
            }
            v37 = v47;
            v54 = v47;
            sub_1B93ECB9C();
            sub_1B93ECB48();
LABEL_18:
            v39 = sub_1B93EE6D8();
            v29(v15, v6);
            v29(v18, v6);
            if ((v39 & 1) != 0)
            {
              v40 = v48 + 16;
              swift_beginAccess();
              v41 = MEMORY[0x1BCCC1DA8](v40);
              if (!v41
                || (v42 = (void *)v41,
                    v43 = (uint64_t *)(v41 + OBJC_IVAR___HUAccessoryEventPickerViewController_filter),
                    swift_beginAccess(),
                    v44 = (uint64_t (*)(uint64_t))*v43,
                    sub_1B8ED4C10(*v43),
                    v42,
                    !v44))
              {
                swift_unknownObjectRelease();
                return 1;
              }
              swift_unknownObjectRetain();
              v45 = v44(v37);
              sub_1B8E6FE50((uint64_t)v44);
              swift_unknownObjectRelease_n();
              return (v45 & 1) != 0;
            }
            goto LABEL_23;
          }
          v37 = v47;
          v54 = v47;
          sub_1B93ECB9C();
          sub_1B93ECB48();
          v38 = sub_1B93EE6D8();
          v29(v15, v6);
          v29(v18, v6);
          if ((v38 & 1) == 0)
          {
            v54 = v37;
            sub_1B93ECB9C();
            sub_1B93ECB30();
            goto LABEL_18;
          }
        }
      }
    }
LABEL_23:
    swift_unknownObjectRelease();
    return 0;
  }
  return result;
}

void sub_1B90104D4()
{
  char *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;
  char *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  char *v23;
  objc_class *v24;
  objc_super v25;

  v1 = (objc_class *)type metadata accessor for AccessoryEventPickerViewController();
  v25.receiver = v0;
  v25.super_class = v1;
  objc_msgSendSuper2(&v25, sel_viewDidLoad);
  v2 = *(_QWORD *)&v0[OBJC_IVAR___HUAccessoryEventPickerViewController_source];
  if (v2 == 1)
  {
    v3 = (void *)sub_1B93EDD84();
    v4 = HULocalizedString(v3);

    if (!v4)
    {
      sub_1B93EDDB4();
      v4 = (__CFString *)sub_1B93EDD84();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (v2)
    {
      sub_1B93EE828();
      sub_1B93EDE44();
      type metadata accessor for HUCharacteristicTriggerServicePickerSource(0);
      sub_1B93EE948();
      sub_1B93EE9CC();
      __break(1u);
      return;
    }
    v5 = (void *)sub_1B93EDD84();
    v4 = HULocalizedString(v5);

    if (!v4)
    {
      sub_1B93EDDB4();
      v4 = (__CFString *)sub_1B93EDD84();
      swift_bridgeObjectRelease();
    }
  }
  objc_msgSend(v0, sel_setTitle_, v4);

  v6 = objc_msgSend(v0, sel_navigationItem);
  v7 = (void *)sub_1B93EDD84();
  v8 = HULocalizedString(v7);

  if (!v8)
  {
    sub_1B93EDDB4();
    v8 = (__CFString *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v6, sel_setPrompt_, v8);

  if (!*(_QWORD *)&v0[OBJC_IVAR___HUAccessoryEventPickerViewController_mode])
  {
    v9 = objc_msgSend(v0, sel_navigationItem);
    v10 = (void *)sub_1B93EDD84();
    v11 = HULocalizedString(v10);

    sub_1B93EDDB4();
    v24 = v1;
    v23 = v0;
    v12 = v0;
    v13 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
    v14 = (uint64_t)v24;
    if (v24)
    {
      v15 = __swift_project_boxed_opaque_existential_1(&v23, (uint64_t)v24);
      v16 = *(_QWORD *)(v14 - 8);
      v17 = MEMORY[0x1E0C80A78](v15);
      v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v16 + 16))(v19, v17);
      v20 = sub_1B93EEAF8();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    }
    else
    {
      v20 = 0;
    }
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithTitle_style_target_action_, v13, 2, v20, sel_nextWithSender_);

    swift_unknownObjectRelease();
    objc_msgSend(v9, sel_setRightBarButtonItem_, v21);

  }
  sub_1B9010A6C();
}

void sub_1B9010A6C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  char v11;
  id v12;
  id v13;

  v1 = objc_msgSend(v0, sel_navigationItem);
  v12 = objc_msgSend(v1, sel_rightBarButtonItem);

  if (v12)
  {
    v2 = objc_msgSend(v0, sel_itemManager);
    v3 = objc_msgSend(v2, sel_allDisplayedItems);

    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
    v4 = sub_1B93EE0FC();

    if ((v4 & 0xC000000000000001) != 0)
      v5 = sub_1B93EE780();
    else
      v5 = *(_QWORD *)(v4 + 16);
    swift_bridgeObjectRelease();
    if (v5 < 1)
    {
      v11 = 0;
    }
    else
    {
      v6 = objc_msgSend(v0, sel_itemManager);
      v7 = objc_msgSend(v6, sel_allDisplayedItems);

      v8 = sub_1B93EE0FC();
      v9 = v0;
      sub_1B90112FC(v8, (uint64_t)v9);
      v11 = v10;
      swift_bridgeObjectRelease();

    }
    objc_msgSend(v12, sel_setEnabled_, v11 & 1, v12);

  }
}

void sub_1B9010C84()
{
  uint64_t v0;
  void **v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD aBlock[6];

  v1 = (void **)(*(_QWORD *)(v0 + OBJC_IVAR___HUAccessoryEventPickerViewController_selectionController)
               + OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_selectionCompleteFuture);
  swift_beginAccess();
  v2 = *v1;
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1B9011BB4;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8FFFDC4;
  aBlock[3] = &block_descriptor_17_2;
  v4 = _Block_copy(aBlock);
  v5 = v2;
  swift_release();
  v6 = objc_msgSend(v5, sel_addCompletionBlock_, v4);
  _Block_release(v4);

}

void sub_1B9010D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1BCCC1DA8](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(void **)(v4 + OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem);
    v7 = *(void **)(v4 + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder);
    v8 = *(_QWORD *)(v4 + OBJC_IVAR___HUAccessoryEventPickerViewController_mode);
    v9 = v4 + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate;
    swift_beginAccess();
    v10 = MEMORY[0x1BCCC1DA8](v9);
    if (v10)
    {
      v11 = v10;
      v12 = objc_allocWithZone((Class)HUCharacteristicTriggerEventViewController);
      v13 = v6;
      v14 = v7;
      v15 = objc_msgSend(v12, sel_initWithCharacteristicEventBuilderItem_triggerBuilder_mode_delegate_, v13, v14, v8, v11);

      swift_unknownObjectRelease();
      v16 = objc_msgSend(v5, sel_navigationController);
      if (v16)
      {
        v17 = v16;

        v18 = v15;
      }
      else
      {
        v18 = v5;
        v5 = v15;
      }

    }
    else
    {
      __break(1u);
    }
  }
}

id AccessoryEventPickerViewController.__allocating_init(itemManager:collectionViewLayout:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithItemManager_collectionViewLayout_, a1, a2);

  return v5;
}

void AccessoryEventPickerViewController.init(itemManager:collectionViewLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccessoryEventPickerViewController.__allocating_init(usingCompositionalLayoutWith:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initUsingCompositionalLayoutWithItemManager_, a1);

  return v3;
}

void AccessoryEventPickerViewController.init(usingCompositionalLayoutWith:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccessoryEventPickerViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryEventPickerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1B90112FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  char v33;
  char v34;
  int64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;
  void *v49;

  v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
    sub_1B93EE138();
    v2 = v44;
    v38 = v45;
    v3 = v46;
    v4 = v47;
    v5 = v48;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v38 = a1 + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v4 = 0;
  }
  v36 = v3;
  v37 = (unint64_t)(v3 + 64) >> 6;
  v39 = v2;
  while (1)
  {
    v9 = v4;
    if (v2 < 0)
    {
      v12 = sub_1B93EE7A4();
      if (!v12)
        goto LABEL_47;
      v41 = (void *)v12;
      sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v13 = (id)v42;
      swift_unknownObjectRelease();
      if (!v13)
        goto LABEL_47;
      goto LABEL_27;
    }
    if (!v5)
      break;
    v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v11 = v10 | (v4 << 6);
LABEL_26:
    v13 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v11);
    if (!v13)
      goto LABEL_47;
LABEL_27:
    v16 = *(void **)(a2 + OBJC_IVAR___HUAccessoryEventPickerViewController_selectionController);
    v49 = &unk_1EF2AC0A8;
    v17 = swift_dynamicCastObjCProtocolConditional();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = v16;
      v20 = v13;
      v21 = objc_msgSend(v20, sel_latestResults);
      if (!v21)
      {
        v42 = 0u;
        v43 = 0u;
LABEL_38:
        sub_1B8E29EA8((uint64_t)&v42);
        goto LABEL_39;
      }
      v22 = v21;
      v23 = sub_1B93EDD00();

      v24 = sub_1B93EDDB4();
      if (*(_QWORD *)(v23 + 16) && (v26 = sub_1B8E268AC(v24, v25), (v27 & 1) != 0))
      {
        sub_1B8E269F0(*(_QWORD *)(v23 + 56) + 32 * v26, (uint64_t)&v42);
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v43 + 1))
        goto LABEL_38;
      sub_1B8E23A60(0, (unint64_t *)&unk_1EF208240);
      if (swift_dynamicCast())
      {
        v28 = objc_msgSend(*(id *)&v19[OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_eventBuilderItem], sel_characteristics);
        sub_1B8E48724((unint64_t *)&unk_1EF20BDA0, (unint64_t *)&unk_1EF208240);
        v29 = sub_1B93EE0FC();

        LOBYTE(v28) = sub_1B8F83A38(v41, v29);
        swift_bridgeObjectRelease();
        v2 = v39;
        if ((v28 & 1) != 0)
          goto LABEL_47;
      }
      else
      {
LABEL_39:
        v30 = objc_msgSend(*(id *)&v19[OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_eventBuilderItem], sel_characteristics, v36);
        sub_1B8E23A60(0, (unint64_t *)&unk_1EF208240);
        sub_1B8E48724((unint64_t *)&unk_1EF20BDA0, (unint64_t *)&unk_1EF208240);
        v31 = sub_1B93EE0FC();

        v32 = v20;
        sub_1B8F859A0(v31, v18);
        v34 = v33;

        swift_bridgeObjectRelease();
        v2 = v39;
        if ((v34 & 1) != 0)
          goto LABEL_47;
      }
    }
    else
    {

    }
  }
  ++v4;
  if (!__OFADD__(v9, 1))
  {
    if (v4 >= v37)
      goto LABEL_47;
    v14 = *(_QWORD *)(v38 + 8 * v4);
    if (!v14)
    {
      v15 = v9 + 2;
      if (v9 + 2 >= v37)
        goto LABEL_47;
      v14 = *(_QWORD *)(v38 + 8 * v15);
      if (v14)
        goto LABEL_24;
      v15 = v9 + 3;
      if (v9 + 3 >= v37)
        goto LABEL_47;
      v14 = *(_QWORD *)(v38 + 8 * v15);
      if (v14)
        goto LABEL_24;
      v15 = v9 + 4;
      if (v9 + 4 >= v37)
        goto LABEL_47;
      v14 = *(_QWORD *)(v38 + 8 * v15);
      if (v14)
      {
LABEL_24:
        v4 = v15;
      }
      else
      {
        v4 = v9 + 5;
        if (v9 + 5 >= v37)
          goto LABEL_47;
        v14 = *(_QWORD *)(v38 + 8 * v4);
        if (!v14)
        {
          v35 = v9 + 6;
          while (v37 != v35)
          {
            v14 = *(_QWORD *)(v38 + 8 * v35++);
            if (v14)
            {
              v4 = v35 - 1;
              goto LABEL_25;
            }
          }
LABEL_47:
          sub_1B8E7A20C();
          return;
        }
      }
    }
LABEL_25:
    v5 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v4 << 6);
    goto LABEL_26;
  }
  __break(1u);
}

uint64_t type metadata accessor for AccessoryEventPickerViewController()
{
  return objc_opt_self();
}

uint64_t sub_1B90118A8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_1B90118CC()
{
  uint64_t v0;

  return sub_1B900FBE0(v0);
}

uint64_t sub_1B90118D4(uint64_t a1)
{
  uint64_t v1;

  return sub_1B900FF18(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1B90118DC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B9011908(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B900FCFC(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

id sub_1B9011910(void *a1)
{
  id v2;
  objc_class *v3;
  char *v4;
  id v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  objc_super v11;

  type metadata accessor for AccessoryRepresentableItemModule();
  v2 = (id)swift_dynamicCastClass();
  if (v2)
  {
    v3 = (objc_class *)type metadata accessor for AccessoryListModuleController();
    v4 = (char *)objc_allocWithZone(v3);
    *(_QWORD *)&v4[OBJC_IVAR___HUAccessoryListModuleController_cellVerticalContentInset] = 0x4028000000000000;
    v5 = objc_allocWithZone((Class)type metadata accessor for CollectionLayoutManager());
    v6 = a1;
    v7 = v4;
    v8 = objc_msgSend(v5, sel_init);
    *(_QWORD *)&v7[OBJC_IVAR___HUAccessoryListModuleController_collectionLayoutManager] = v8;

    v11.receiver = v7;
    v11.super_class = v3;
    v9 = objc_msgSendSuper2(&v11, sel_initWithModule_, v2);
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v2 = objc_msgSend(v9, sel_asGeneric);

  }
  return v2;
}

uint64_t sub_1B9011A48@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate;
  swift_beginAccess();
  result = MEMORY[0x1BCCC1DA8](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1B9011A9C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t method lookup function for AccessoryEventPickerViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.filter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.filter.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.filter.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AccessoryEventPickerViewController.__allocating_init(eventBuilderItem:triggerBuilder:mode:source:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

void sub_1B9011BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B9010D8C(a1, a2, v2);
}

uint64_t sub_1B9011BBC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B9011BE0()
{
  swift_release();
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for HomeEnergyTip()
{
  return &type metadata for HomeEnergyTip;
}

uint64_t sub_1B9011C34()
{
  return sub_1B93EDA9C();
}

uint64_t sub_1B9011C50(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1B93ECF8C();
    result = MEMORY[0x1BCCC1BE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B9011C90()
{
  return sub_1B9011C50(&qword_1ED57E5E0, MEMORY[0x1E0CE9488]);
}

uint64_t sub_1B9011CB4()
{
  return sub_1B9011C50(&qword_1ED57E5D8, MEMORY[0x1E0CE9478]);
}

uint64_t sub_1B9011CD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E368);
  result = sub_1B93ED0B8();
  *a1 = result;
  return result;
}

uint64_t sub_1B9011D0C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)result + 16);
  return result;
}

Swift::String_optional __swiftcall TileCell.prefixString()()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  Swift::String_optional result;
  id v7[55];
  id v8[4];
  char v9;
  _BYTE v10[440];

  MEMORY[0x1BCCC00C8](v7);
  if (v7[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v10);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v7, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v10, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v10, (uint64_t)v7, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v8) == 1)
  {
LABEL_11:
    v1 = 0;
    v3 = 0;
    goto LABEL_12;
  }
  if ((v9 & 1) != 0 || !v8[0])
  {
    sub_1B8EC9FC4((uint64_t)v7);
    goto LABEL_11;
  }
  v0 = objc_msgSend(v8[0], sel_string);
  v1 = sub_1B93EDDB4();
  v3 = v2;

  sub_1B8EC9FC4((uint64_t)v7);
LABEL_12:
  v4 = v1;
  v5 = v3;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

Swift::String_optional __swiftcall TileCell.primaryString()()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  Swift::String_optional result;
  _QWORD v7[55];
  _BYTE v8[72];
  id v9;
  char v10;
  _BYTE v11[440];

  MEMORY[0x1BCCC00C8](v7);
  if (v7[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v11);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v7, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v11, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v7, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v8) == 1)
  {
LABEL_11:
    v1 = 0;
    v3 = 0;
    goto LABEL_12;
  }
  if ((v10 & 1) != 0 || !v9)
  {
    sub_1B8EC9FC4((uint64_t)v7);
    goto LABEL_11;
  }
  v0 = objc_msgSend(v9, sel_string);
  v1 = sub_1B93EDDB4();
  v3 = v2;

  sub_1B8EC9FC4((uint64_t)v7);
LABEL_12:
  v4 = v1;
  v5 = v3;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

Swift::String_optional __swiftcall TileCell.secondaryString()()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  Swift::String_optional result;
  _QWORD v7[55];
  _BYTE v8[144];
  id v9;
  char v10;
  _BYTE v11[440];

  MEMORY[0x1BCCC00C8](v7);
  if (v7[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v11);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v7, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v11, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v7, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v8) == 1)
  {
LABEL_11:
    v1 = 0;
    v3 = 0;
    goto LABEL_12;
  }
  if ((v10 & 1) != 0 || !v9)
  {
    sub_1B8EC9FC4((uint64_t)v7);
    goto LABEL_11;
  }
  v0 = objc_msgSend(v9, sel_string);
  v1 = sub_1B93EDDB4();
  v3 = v2;

  sub_1B8EC9FC4((uint64_t)v7);
LABEL_12:
  v4 = v1;
  v5 = v3;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

NSAttributedString_optional __swiftcall TileCell.secondaryAttributedString()()
{
  Swift::Bool v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  _QWORD v4[55];
  _BYTE v5[144];
  objc_class *v6;
  char v7;
  _BYTE v8[448];
  NSAttributedString_optional result;

  MEMORY[0x1BCCC00C8](v4);
  if (v4[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v8);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v4, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v5);
  sub_1B8EA328C((uint64_t)v5, (uint64_t)v8, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v4, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v4, (uint64_t)v5, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v5) == 1)
  {
    v1 = 0;
  }
  else
  {
    if ((v7 & 1) != 0)
    {
      v1 = 0;
    }
    else
    {
      v1 = v6;
      v2 = v6;
    }
    sub_1B8EC9FC4((uint64_t)v4);
  }
  v3 = v1;
  result.value.super.isa = v3;
  result.is_nil = v0;
  return result;
}

__C::CGRect __swiftcall TileCell.iconViewTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = sub_1B901224C(&OBJC_IVAR____TtC6HomeUI19TileCellContentView_iconView);
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

__C::CGRect __swiftcall TileCell.prefixLabelTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = sub_1B901224C(&OBJC_IVAR____TtC6HomeUI19TileCellContentView_prefixLabel);
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

__C::CGRect __swiftcall TileCell.primaryLabelTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = sub_1B901224C(&OBJC_IVAR____TtC6HomeUI19TileCellContentView_titleLabel);
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

__C::CGRect __swiftcall TileCell.secondaryLabelTileFrame()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  __C::CGRect result;

  v0 = sub_1B901224C(&OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel);
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v1;
  result.origin.x = v0;
  return result;
}

double sub_1B901224C(_QWORD *a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  double v5;
  double v6;

  v3 = objc_msgSend(v1, sel_contentView);
  type metadata accessor for TileCellContentView();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    objc_msgSend(*(id *)(v4 + *a1), sel_frame);
    v6 = v5;

  }
  else
  {

    return 0.0;
  }
  return v6;
}

double sub_1B9012310(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;

  v4 = a1;
  v5 = objc_msgSend(v4, sel_contentView);
  type metadata accessor for TileCellContentView();
  v6 = swift_dynamicCastClass();
  if (v6)
  {
    objc_msgSend(*(id *)(v6 + *a3), sel_frame);
    v8 = v7;

  }
  else
  {

    return 0.0;
  }
  return v8;
}

Swift::Bool __swiftcall TileCell.prefixLabelShouldFeather()()
{
  _QWORD v1[55];
  _BYTE v2[440];
  _BYTE v3[448];

  MEMORY[0x1BCCC00C8](v1);
  if (v1[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v3);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v1, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v2);
  sub_1B8EA328C((uint64_t)v2, (uint64_t)v3, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v3, (uint64_t)v1, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v1, (uint64_t)v2, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v2) == 1)
    return 0;
  sub_1B8EC9FC4((uint64_t)v1);
  return v2[33];
}

Swift::Bool __swiftcall TileCell.primaryLabelShouldFeather()()
{
  _QWORD v1[55];
  _BYTE v2[440];
  _BYTE v3[448];

  MEMORY[0x1BCCC00C8](v1);
  if (v1[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v3);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v1, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v2);
  sub_1B8EA328C((uint64_t)v2, (uint64_t)v3, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v3, (uint64_t)v1, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v1, (uint64_t)v2, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v2) == 1)
    return 0;
  sub_1B8EC9FC4((uint64_t)v1);
  return v2[105];
}

Swift::Bool __swiftcall TileCell.secondaryLabelShouldFeather()()
{
  _QWORD v1[55];
  _BYTE v2[440];
  _BYTE v3[448];

  MEMORY[0x1BCCC00C8](v1);
  if (v1[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v3);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v1, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v2);
  sub_1B8EA328C((uint64_t)v2, (uint64_t)v3, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v3, (uint64_t)v1, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v1, (uint64_t)v2, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v2) == 1)
    return 0;
  sub_1B8EC9FC4((uint64_t)v1);
  return v2[177];
}

UIFont_optional __swiftcall TileCell.prefixLabelFont()()
{
  Swift::Bool v0;
  id v1;
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;
  double v8;
  id v9;
  objc_class *v10;
  _QWORD v11[55];
  id v12[6];
  char v13;
  _BYTE v14[440];
  UIFont_optional result;

  MEMORY[0x1BCCC00C8](v11);
  if (v11[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v14);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v11, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v12);
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v14, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v14, (uint64_t)v11, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v12, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v12) == 1)
  {
    v1 = 0;
  }
  else
  {
    v2 = v12[1];
    v3 = v12[2];
    v4 = v12[5];
    v5 = v13;
    v6 = v12[0];
    v7 = v2;
    v1 = v3;
    sub_1B8EC9FC4((uint64_t)v11);
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v1, sel_pointSize);
      v9 = objc_msgSend(v1, sel_fontWithSize_, *(double *)&v4 * v8);

      v1 = v9;
    }

  }
  v10 = (objc_class *)v1;
  result.value.super.isa = v10;
  result.is_nil = v0;
  return result;
}

UIFont_optional __swiftcall TileCell.primaryLabelFont()()
{
  Swift::Bool v0;
  id v1;
  void *v2;
  void *v3;
  double v4;
  char v5;
  id v6;
  id v7;
  double v8;
  id v9;
  objc_class *v10;
  _QWORD v11[55];
  _BYTE v12[72];
  id v13;
  void *v14;
  void *v15;
  double v16;
  char v17;
  _BYTE v18[440];
  UIFont_optional result;

  MEMORY[0x1BCCC00C8](v11);
  if (v11[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v18);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v11, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v12);
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v18, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v18, (uint64_t)v11, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v12, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v12) == 1)
  {
    v1 = 0;
  }
  else
  {
    v2 = v14;
    v3 = v15;
    v4 = v16;
    v5 = v17;
    v6 = v13;
    v7 = v2;
    v1 = v3;
    sub_1B8EC9FC4((uint64_t)v11);
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v1, sel_pointSize);
      v9 = objc_msgSend(v1, sel_fontWithSize_, v4 * v8);

      v1 = v9;
    }

  }
  v10 = (objc_class *)v1;
  result.value.super.isa = v10;
  result.is_nil = v0;
  return result;
}

UIFont_optional __swiftcall TileCell.secondaryLabelFont()()
{
  Swift::Bool v0;
  id v1;
  void *v2;
  void *v3;
  double v4;
  char v5;
  id v6;
  id v7;
  double v8;
  id v9;
  objc_class *v10;
  _QWORD v11[55];
  _BYTE v12[144];
  id v13;
  void *v14;
  void *v15;
  double v16;
  char v17;
  _BYTE v18[440];
  UIFont_optional result;

  MEMORY[0x1BCCC00C8](v11);
  if (v11[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v18);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v11, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v12);
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v18, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v18, (uint64_t)v11, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v12, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v12) == 1)
  {
    v1 = 0;
  }
  else
  {
    v2 = v14;
    v3 = v15;
    v4 = v16;
    v5 = v17;
    v6 = v13;
    v7 = v2;
    v1 = v3;
    sub_1B8EC9FC4((uint64_t)v11);
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v1, sel_pointSize);
      v9 = objc_msgSend(v1, sel_fontWithSize_, v4 * v8);

      v1 = v9;
    }

  }
  v10 = (objc_class *)v1;
  result.value.super.isa = v10;
  result.is_nil = v0;
  return result;
}

UIColor_optional __swiftcall TileCell.prefixLabelTextColor()()
{
  Swift::Bool v0;
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  objc_class *v6;
  _QWORD v7[55];
  id v8[55];
  _BYTE v9[440];
  UIColor_optional result;

  MEMORY[0x1BCCC00C8](v7);
  if (v7[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v9);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v7, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v9, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v9, (uint64_t)v7, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v8) == 1)
  {
    v1 = 0;
  }
  else
  {
    v2 = v8[1];
    v3 = v8[2];
    v4 = v8[0];
    v1 = (objc_class *)v2;
    v5 = v3;
    sub_1B8EC9FC4((uint64_t)v7);

  }
  v6 = v1;
  result.value.super.isa = v6;
  result.is_nil = v0;
  return result;
}

UIColor_optional __swiftcall TileCell.primaryLabelTextColor()()
{
  Swift::Bool v0;
  objc_class *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  objc_class *v6;
  _QWORD v7[55];
  _BYTE v8[72];
  id v9;
  void *v10;
  void *v11;
  _BYTE v12[440];
  UIColor_optional result;

  MEMORY[0x1BCCC00C8](v7);
  if (v7[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v12);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v7, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v12, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v7, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v8) == 1)
  {
    v1 = 0;
  }
  else
  {
    v2 = v10;
    v3 = v11;
    v4 = v9;
    v1 = v2;
    v5 = v3;
    sub_1B8EC9FC4((uint64_t)v7);

  }
  v6 = v1;
  result.value.super.isa = v6;
  result.is_nil = v0;
  return result;
}

UIColor_optional __swiftcall TileCell.secondaryLabelTextColor()()
{
  Swift::Bool v0;
  objc_class *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  objc_class *v6;
  _QWORD v7[55];
  _BYTE v8[144];
  id v9;
  void *v10;
  void *v11;
  _BYTE v12[440];
  UIColor_optional result;

  MEMORY[0x1BCCC00C8](v7);
  if (v7[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v12);
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v7, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v12, &qword_1ED57E8B8);
LABEL_6:
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v7, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v8) == 1)
  {
    v1 = 0;
  }
  else
  {
    v2 = v10;
    v3 = v11;
    v4 = v9;
    v1 = v2;
    v5 = v3;
    sub_1B8EC9FC4((uint64_t)v7);

  }
  v6 = v1;
  result.value.super.isa = v6;
  result.is_nil = v0;
  return result;
}

uint64_t sub_1B9012F90@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18[5];
  _BYTE v19[440];
  _BYTE v20[440];
  _QWORD v21[55];
  _BYTE v22[440];
  _BYTE v23[440];

  v3 = v2;
  v6 = sub_1B93ECD34();
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)&v8 = MEMORY[0x1E0C80A78](v6).n128_u64[0];
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v3, sel__bridgedConfigurationState, v8);
  sub_1B93ECD28();

  if (qword_1ED57EA70 != -1)
    swift_once();
  v22[0] = a1 & 1;
  v12 = (id)qword_1ED57E798;
  sub_1B93EE7EC();
  v13 = MEMORY[0x1E0CE9BA8];
  v14 = sub_1B93ECCF8();
  MEMORY[0x1BCCC00C8](v21, v14);
  if (v21[3])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      CGSizeMake(v22);
      goto LABEL_8;
    }
  }
  else
  {
    sub_1B8E26870((uint64_t)v21, (uint64_t *)&unk_1ED57E7D0);
  }
  sub_1B8EC9F80((uint64_t)v23);
  sub_1B8EA328C((uint64_t)v23, (uint64_t)v22, &qword_1ED57E8B8);
LABEL_8:
  sub_1B8EA328C((uint64_t)v22, (uint64_t)v20, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v20, (uint64_t)v21, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v21) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v15 = v20;
  }
  else
  {
    memcpy(v19, v21, sizeof(v19));
    v18[3] = v6;
    v18[4] = v13;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v10, v6);
    TileCellContentConfiguration.updated(for:)(v18, v23);
    sub_1B8EC9FC4((uint64_t)v20);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    memcpy(v19, v23, sizeof(v19));
    CGSizeMake(v19);
    v15 = v19;
  }
  return sub_1B8EA328C((uint64_t)v15, a2, &qword_1ED57E8B8);
}

UIColor_optional __swiftcall TileCell.primaryLabelOnTextColor()()
{
  objc_class *v0;
  Swift::Bool v1;
  UIColor_optional result;

  v0 = (objc_class *)sub_1B901322C(1);
  result.value.super.isa = v0;
  result.is_nil = v1;
  return result;
}

UIColor_optional __swiftcall TileCell.primaryLabelOffTextColor()()
{
  objc_class *v0;
  Swift::Bool v1;
  UIColor_optional result;

  v0 = (objc_class *)sub_1B901322C(0);
  result.value.super.isa = v0;
  result.is_nil = v1;
  return result;
}

id sub_1B901322C(char a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  _BYTE v7[440];
  _BYTE v8[440];
  _BYTE v9[72];
  id v10;
  void *v11;
  void *v12;

  sub_1B9012F90(a1, (uint64_t)v7);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v9, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v9) == 1)
    return 0;
  v2 = v11;
  v3 = v12;
  v4 = v10;
  v1 = v2;
  v5 = v3;
  sub_1B8EC9FC4((uint64_t)v8);

  return v1;
}

id sub_1B90132DC(void *a1, uint64_t a2, char a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _BYTE v11[440];
  _BYTE v12[440];
  _BYTE v13[72];
  id v14;
  void *v15;
  void *v16;

  v4 = a1;
  sub_1B9012F90(a3, (uint64_t)v11);
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v12, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v13, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v13) == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = v15;
    v7 = v16;
    v8 = v14;
    v5 = v6;
    v9 = v7;
    sub_1B8EC9FC4((uint64_t)v12);

    v4 = v8;
  }

  return v5;
}

UIColor_optional __swiftcall TileCell.prefixLabelOnTextColor()()
{
  objc_class *v0;
  Swift::Bool v1;
  UIColor_optional result;

  v0 = (objc_class *)sub_1B90133BC(1);
  result.value.super.isa = v0;
  result.is_nil = v1;
  return result;
}

UIColor_optional __swiftcall TileCell.prefixLabelOffTextColor()()
{
  objc_class *v0;
  Swift::Bool v1;
  UIColor_optional result;

  v0 = (objc_class *)sub_1B90133BC(0);
  result.value.super.isa = v0;
  result.is_nil = v1;
  return result;
}

id sub_1B90133BC(char a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  _BYTE v7[440];
  _BYTE v8[440];
  id v9[55];

  sub_1B9012F90(a1, (uint64_t)v7);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v9, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v9) == 1)
    return 0;
  v2 = v9[1];
  v3 = v9[2];
  v4 = v9[0];
  v1 = v2;
  v5 = v3;
  sub_1B8EC9FC4((uint64_t)v8);

  return v1;
}

id sub_1B901346C(void *a1, uint64_t a2, char a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _BYTE v11[440];
  _BYTE v12[440];
  id v13[55];

  v4 = a1;
  sub_1B9012F90(a3, (uint64_t)v11);
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v12, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v13, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v13) == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = v13[1];
    v7 = v13[2];
    v8 = v13[0];
    v5 = v6;
    v9 = v7;
    sub_1B8EC9FC4((uint64_t)v12);

    v4 = v8;
  }

  return v5;
}

UIColor_optional __swiftcall TileCell.secondaryLabelOnTextColor()()
{
  objc_class *v0;
  Swift::Bool v1;
  UIColor_optional result;

  v0 = (objc_class *)sub_1B901354C(1);
  result.value.super.isa = v0;
  result.is_nil = v1;
  return result;
}

UIColor_optional __swiftcall TileCell.secondaryLabelOffTextColor()()
{
  objc_class *v0;
  Swift::Bool v1;
  UIColor_optional result;

  v0 = (objc_class *)sub_1B901354C(0);
  result.value.super.isa = v0;
  result.is_nil = v1;
  return result;
}

id sub_1B901354C(char a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  _BYTE v7[440];
  _BYTE v8[440];
  _BYTE v9[144];
  id v10;
  void *v11;
  void *v12;

  sub_1B9012F90(a1, (uint64_t)v7);
  sub_1B8EA328C((uint64_t)v7, (uint64_t)v8, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v8, (uint64_t)v9, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v9) == 1)
    return 0;
  v2 = v11;
  v3 = v12;
  v4 = v10;
  v1 = v2;
  v5 = v3;
  sub_1B8EC9FC4((uint64_t)v8);

  return v1;
}

id sub_1B90135FC(void *a1, uint64_t a2, char a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _BYTE v11[440];
  _BYTE v12[440];
  _BYTE v13[144];
  id v14;
  void *v15;
  void *v16;

  v4 = a1;
  sub_1B9012F90(a3, (uint64_t)v11);
  sub_1B8EA328C((uint64_t)v11, (uint64_t)v12, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v12, (uint64_t)v13, &qword_1ED57E8B8);
  if (sub_1B8ECA06C((uint64_t)v13) == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = v15;
    v7 = v16;
    v8 = v14;
    v5 = v6;
    v9 = v7;
    sub_1B8EC9FC4((uint64_t)v12);

    v4 = v8;
  }

  return v5;
}

uint64_t TileCell.backgroundColor.getter()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7E0);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1BCCC00E0](v1);
  v4 = sub_1B93ECDD0();
  v5 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
    v5 = sub_1B93ECD94();
  sub_1B8E26870((uint64_t)v3, &qword_1ED57E7E0);
  return v5;
}

void TileCell.backgroundColor.setter(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7E0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - v7;
  MEMORY[0x1BCCC00E0](v6);
  v9 = sub_1B93ECDD0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
  {
    sub_1B8E5E6E0((uint64_t)v8, (uint64_t)v4);
    MEMORY[0x1BCCC00EC](v4);

    sub_1B8E26870((uint64_t)v8, &qword_1ED57E7E0);
  }
  else
  {
    v10 = a1;
    sub_1B93ECDA0();
    MEMORY[0x1BCCC00EC](v8);

  }
}

__C::CGRect __swiftcall TileCell.tileFrame()()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  __C::CGRect result;

  objc_msgSend(v0, sel_bounds);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

double TileCell.backgroundCornerRadius()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  _BYTE *v15;
  id v16;
  double v17;
  _BYTE v19[24];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7E0);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = &v0[OBJC_IVAR___HUTileCell_appContext];
  v5 = swift_beginAccess();
  if (*v4 == 2)
  {
    v6 = (uint64_t *)&v0[OBJC_IVAR___HUTileCell__gridSize];
    if (v0[OBJC_IVAR___HUTileCell__gridSize + 16] == 1)
    {
      v7 = sub_1B8F89FD8(v0);
    }
    else
    {
      v7 = *v6;
      v8 = v6[1];
    }
    v12 = sub_1B8EFA388(v7, v8);
    v13 = MEMORY[0x1BCCC0A64]();
    if (v12)
    {
      CCUILayoutGutter();
      CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
      v10 = v14;
    }
    else
    {
      v10 = v13 * 0.33;
    }
    v15 = &v0[OBJC_IVAR___HUTileCell_contentScale];
    swift_beginAccess();
    if ((v15[8] & 1) == 0)
    {
      v16 = objc_msgSend(v0, sel_traitCollection);
      objc_msgSend(v16, sel_displayScale);

      MEMORY[0x1BCCC0A64]();
      UIRoundToScale();
      return v17;
    }
  }
  else
  {
    MEMORY[0x1BCCC00E0](v5);
    v9 = sub_1B93ECDD0();
    v10 = 0.0;
    if (!(*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v3, 1, v9))
    {
      sub_1B93ECD70();
      v10 = v11;
    }
    sub_1B8E26870((uint64_t)v3, &qword_1ED57E7E0);
  }
  return v10;
}

void __swiftcall TileCell.createBackgroundBlurView()(UIView_optional *__return_ptr retstr)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char *v6;
  id v7;
  char v8;
  __CFString **v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BYTE v15[16];
  char v16[24];
  uint64_t v17;

  v2 = sub_1B93ECD34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = &v1[OBJC_IVAR___HUTileCell_backgroundDisplayStyle];
  swift_beginAccess();
  if (*(_QWORD *)v6 == 1)
  {
    v7 = objc_msgSend(v1, sel__bridgedConfigurationState);
    sub_1B93ECD28();

    if (qword_1ED57EA70 != -1)
      swift_once();
    sub_1B93ECCEC();
    if (v17)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v8 = v15[15];
        (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
        if ((v8 & 1) != 0)
        {
          v9 = &HUSharedVisualEffectIdentifierTileOn;
LABEL_11:
          v10 = *v9;
          v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TileCellBackgroundView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
          swift_beginAccess();
          v12 = swift_unknownObjectWeakAssign();
          v13 = (void *)MEMORY[0x1BCCC1DA8](v12);
          v14 = v11;
          sub_1B8FF7888(v10, v13, 0);

          swift_unknownObjectRelease();
          return;
        }
LABEL_10:
        v9 = HUSharedVisualEffectIdentifierTileOff;
        goto LABEL_11;
      }
    }
    else
    {
      sub_1B8E26870((uint64_t)v16, &qword_1ED57EB50);
    }
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_10;
  }
}

Swift::Bool __swiftcall TileCell.recognizeDoubleClickGesture()()
{
  return objc_msgSend((id)objc_opt_self(), sel_isAnIPad);
}

uint64_t TileCell.baseIconViewConfiguration()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  objc_class *v3;
  char *v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;
  objc_super v13;
  _BYTE v14[136];
  _OWORD v15[8];
  uint64_t v16;
  _QWORD v17[55];
  _BYTE v18[232];
  _QWORD v19[26];
  _BYTE v20[440];

  MEMORY[0x1BCCC00C8](v17);
  if (!v17[3])
  {
    sub_1B8E26870((uint64_t)v17, (uint64_t *)&unk_1ED57E7D0);
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E7C0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    sub_1B8EC9F80((uint64_t)v18);
    sub_1B8EA328C((uint64_t)v18, (uint64_t)v20, &qword_1ED57E8B8);
    goto LABEL_6;
  }
  CGSizeMake(v20);
LABEL_6:
  sub_1B8EA328C((uint64_t)v20, (uint64_t)v17, &qword_1ED57E8B8);
  sub_1B8EA328C((uint64_t)v17, (uint64_t)v18, &qword_1ED57E8B8);
  result = sub_1B8ECA06C((uint64_t)v18);
  if ((_DWORD)result == 1
    || (sub_1B8ECA37C(v19, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B8E2B5B8), sub_1B8EC9FC4((uint64_t)v17), sub_1B8EA328C((uint64_t)v19, (uint64_t)v15, &qword_1ED57E800), result = sub_1B8ECA364((uint64_t)v15), (_DWORD)result == 1))
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    v3 = (objc_class *)type metadata accessor for BaseIconView.__Configuration();
    v4 = (char *)objc_allocWithZone(v3);
    v5 = &v4[OBJC_IVAR___HUBaseIconViewConfiguration_configuration];
    *(_OWORD *)v5 = v15[0];
    v6 = v15[5];
    v7 = v15[6];
    v8 = v15[7];
    *((_QWORD *)v5 + 16) = v16;
    *((_OWORD *)v5 + 6) = v7;
    *((_OWORD *)v5 + 7) = v8;
    *((_OWORD *)v5 + 5) = v6;
    v9 = v15[1];
    v10 = v15[2];
    v11 = v15[4];
    *((_OWORD *)v5 + 3) = v15[3];
    *((_OWORD *)v5 + 4) = v11;
    *((_OWORD *)v5 + 1) = v9;
    *((_OWORD *)v5 + 2) = v10;
    sub_1B8EA328C((uint64_t)v19, (uint64_t)v14, &qword_1ED57E800);
    sub_1B8F4E7B4((uint64_t)v14);
    v13.receiver = v4;
    v13.super_class = v3;
    v12 = objc_msgSendSuper2(&v13, sel_init);
    *(_QWORD *)(a1 + 24) = v3;
    result = (uint64_t)sub_1B8ECA37C(v19, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B8E2B514);
    *(_QWORD *)a1 = v12;
  }
  return result;
}

uint64_t sub_1B90140A0()
{
  _BYTE *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (uint64_t *)&v0[OBJC_IVAR___HUTileCell__gridSize];
  if (v0[OBJC_IVAR___HUTileCell__gridSize + 16] == 1)
  {
    v2 = sub_1B8F89FD8(v0);
  }
  else
  {
    v2 = *v1;
    v3 = v1[1];
  }
  if (v2 == 1 && v3 == 1)
    return 0;
  else
    return v0[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable];
}

id sub_1B9014124(id result)
{
  _BYTE *v1;
  int v2;

  v2 = v1[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable];
  v1[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable] = (_BYTE)result;
  if (v2 != (result & 1))
    return objc_msgSend(v1, sel_setNeedsUpdateConfiguration);
  return result;
}

_BYTE *(*sub_1B9014154(_QWORD *a1))(id *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  *a1 = v1;
  v2 = a1 + 1;
  v3 = (uint64_t *)&v1[OBJC_IVAR___HUTileCell__gridSize];
  if (v1[OBJC_IVAR___HUTileCell__gridSize + 16] == 1)
  {
    v4 = sub_1B8F89FD8(v1);
  }
  else
  {
    v4 = *v3;
    v5 = v3[1];
  }
  if (v4 == 1 && v5 == 1)
    v7 = 0;
  else
    v7 = v1[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable];
  *v2 = v7;
  return sub_1B90141CC;
}

_BYTE *sub_1B90141CC(id *a1)
{
  id *v1;
  _BYTE *result;
  int v3;

  v1 = a1;
  result = *a1;
  LODWORD(v1) = *((unsigned __int8 *)v1 + 8);
  v3 = result[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable];
  result[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable] = (_BYTE)v1;
  if ((_DWORD)v1 != v3)
    return objc_msgSend(result, sel_setNeedsUpdateConfiguration);
  return result;
}

uint64_t sub_1B9014200(uint64_t a1)
{
  char *v1;
  id v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  BOOL v8;

  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  LOBYTE(v3) = sub_1B93EE360();
  result = *(_QWORD *)&v1[OBJC_IVAR___HUTileCell__gridSize];
  v6 = *(_QWORD *)&v1[OBJC_IVAR___HUTileCell__gridSize + 8];
  if ((v3 & 1) == 0)
  {
    if (v1[OBJC_IVAR___HUTileCell__gridSize + 16])
      result = sub_1B8F89FD8(v1);
    v8 = result == 1 && v6 == 1;
    goto LABEL_18;
  }
  if (v1[OBJC_IVAR___HUTileCell__gridSize + 16])
    result = sub_1B8F89FD8(v1);
  if (result == 1 && v6 == 1)
  {
    v8 = 1;
LABEL_18:
    *(_BYTE *)(a1 + 176) = v8;
  }
  return result;
}

__CFString *sub_1B90142C0(CGFloat a1, CGFloat a2)
{
  _BYTE *v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v10;

  v5 = (uint64_t *)&v2[OBJC_IVAR___HUTileCell__gridSize];
  if (v2[OBJC_IVAR___HUTileCell__gridSize + 16] == 1)
  {
    v6 = sub_1B8F89FD8(v2);
  }
  else
  {
    v6 = *v5;
    v7 = v5[1];
  }
  if (v6 != 1 || v7 != 1)
    return sub_1B8F89324(a1, a2);
  v10 = CFSTR("HUTileCellTappableAreaGeneralToggleArea");
  return CFSTR("HUTileCellTappableAreaGeneralToggleArea");
}

id ControlCenterAccessoryTileCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id ControlCenterAccessoryTileCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  objc_super v10;

  v4[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

uint64_t type metadata accessor for ControlCenterAccessoryTileCell()
{
  return objc_opt_self();
}

id ControlCenterAccessoryTileCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ControlCenterAccessoryTileCell.init(coder:)(void *a1)
{
  _BYTE *v1;
  id v3;
  objc_super v5;

  v1[OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ControlCenterAccessoryTileCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ControlCenterAccessoryTileCell()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B9014608(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

id MediaSystemEditorViewController.__allocating_init(mediaSystemBuilder:staticAccessories:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MediaSystemEditorViewController.init(mediaSystemBuilder:staticAccessories:)(a1, a2);
}

uint64_t sub_1B901465C()
{
  return sub_1B8E7B048(&OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate);
}

uint64_t sub_1B9014674()
{
  return sub_1B8E7B0F0();
}

uint64_t (*sub_1B9014680(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BCCC1DA8](v5);
  return sub_1B8E7AFE8;
}

uint64_t sub_1B90146FC()
{
  return sub_1B8E7B048(&OBJC_IVAR___HUMediaSystemEditorViewController_delegate);
}

uint64_t sub_1B9014714()
{
  return sub_1B8E7B0F0();
}

uint64_t (*sub_1B9014720(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___HUMediaSystemEditorViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BCCC1DA8](v5);
  return sub_1B8E7AFE8;
}

id sub_1B90147A4()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)(v0 + OBJC_IVAR___HUMediaSystemEditorViewController_selectionController) + 16);
}

id sub_1B90147B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___HUMediaSystemEditorViewController____lazy_storage___helper;
  v2 = *(void **)(v0 + OBJC_IVAR___HUMediaSystemEditorViewController____lazy_storage___helper);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___HUMediaSystemEditorViewController____lazy_storage___helper);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)HUMediaSystemEditorHelper), sel_initWithDelegate_, v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id MediaSystemEditorViewController.__allocating_init(accessories:home:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = objc_allocWithZone(v2);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31550]), sel_initWithHome_, a2);
  sub_1B90172C0(a1, v6);
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
  sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
  v7 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithMediaSystemBuilder_staticAccessories_, v6, v7);

  return v8;
}

id MediaSystemEditorViewController.init(accessories:home:)(uint64_t a1, void *a2)
{
  void *v2;
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31550]), sel_initWithHome_, a2);
  sub_1B90172C0(a1, v5);
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
  sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
  v6 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v2, sel_initWithMediaSystemBuilder_staticAccessories_, v5, v6);

  return v7;
}

id MediaSystemEditorViewController.init(mediaSystemBuilder:staticAccessories:)(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _BYTE *v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  uint64_t aBlock;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  objc_super v32;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v2[OBJC_IVAR___HUMediaSystemEditorViewController_accessoryModule] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___HUMediaSystemEditorViewController____lazy_storage___helper] = 0;
  type metadata accessor for MediaSystemBuilderSelectionController();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 48) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_OWORD *)(v5 + 32) = xmmword_1B943DC60;
  *(_QWORD *)&v2[OBJC_IVAR___HUMediaSystemEditorViewController_selectionController] = v5;
  v6 = objc_allocWithZone(MEMORY[0x1E0D315E8]);
  v7 = a1;
  v8 = objc_msgSend(v6, sel_init);
  v9 = objc_allocWithZone((Class)type metadata accessor for AccessoryRepresentableItemModule.Context());
  v10 = (char *)sub_1B8ED4880(4, 0, 1, 1, 0, v8, 0, 0, 0, 0, v9);

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = (uint64_t *)&v10[OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter];
  swift_beginAccess();
  v13 = *v12;
  *v12 = (uint64_t)sub_1B90175D0;
  v12[1] = v11;
  v14 = v7;
  sub_1B8E6FE50(v13);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D31810]), sel_initWithDelegate_, 0);
  v32.receiver = v2;
  v32.super_class = (Class)type metadata accessor for MediaSystemEditorViewController();
  v16 = objc_msgSendSuper2(&v32, sel_initUsingCompositionalLayoutWithItemManager_, v15);
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v30 = sub_1B901761C;
  v31 = v17;
  v18 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v27 = 1107296256;
  v28 = sub_1B8E36AA4;
  v29 = &block_descriptor_49;
  v19 = _Block_copy(&aBlock);
  v20 = v16;
  swift_release();
  objc_msgSend(v15, sel_setHomeCreator_, v19);
  _Block_release(v19);
  v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v10;
  *(_QWORD *)(v22 + 24) = v21;
  v30 = sub_1B9017650;
  v31 = v22;
  aBlock = v18;
  v27 = 1107296256;
  v28 = sub_1B8ED0F64;
  v29 = &block_descriptor_10_6;
  v23 = _Block_copy(&aBlock);
  v24 = v10;
  swift_release();
  objc_msgSend(v15, sel_setItemModuleCreator_, v23);

  _Block_release(v23);
  return v20;
}

id sub_1B9014E54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1BCCC1DA8](v1);
  if (!v2)
    goto LABEL_4;
  v3 = (void *)v2;
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___HUMediaSystemEditorViewController_selectionController);
  swift_retain();

  v5 = *(id *)(v4 + 16);
  swift_release();
  v6 = objc_msgSend(v5, sel_home);

  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, v6);
  }
  else
  {
LABEL_4:
    v6 = objc_msgSend((id)objc_opt_self(), sel_hf_errorWithCode_, 59);
    v8 = (void *)sub_1B93EB6F0();
    v7 = objc_msgSend((id)objc_opt_self(), sel_futureWithError_, v8);

  }
  return v7;
}

uint64_t sub_1B9014F84(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;

  v7 = a4 + 16;
  v8 = (char *)objc_allocWithZone((Class)type metadata accessor for AccessoryRepresentableItemModule());
  swift_getObjectType();
  v9 = a3;
  v10 = a1;
  swift_unknownObjectRetain();
  v11 = sub_1B8F10218(v9, v10, a2, v8);
  swift_beginAccess();
  v12 = MEMORY[0x1BCCC1DA8](v7);
  v13 = (void *)v12;
  if (v12)
  {
    v14 = *(_QWORD *)(v12 + OBJC_IVAR___HUMediaSystemEditorViewController_selectionController);
    swift_retain();

    v13 = (void *)sub_1B9017B94();
  }
  else
  {
    v14 = 0;
  }
  v15 = &v11[OBJC_IVAR___HUAccessoryRepresentableItemModule_selectionController];
  swift_beginAccess();
  *(_QWORD *)v15 = v14;
  *((_QWORD *)v15 + 1) = v13;
  swift_unknownObjectRelease();
  swift_beginAccess();
  v16 = MEMORY[0x1BCCC1DA8](v7);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = *(void **)(v16 + OBJC_IVAR___HUMediaSystemEditorViewController_accessoryModule);
    *(_QWORD *)(v16 + OBJC_IVAR___HUMediaSystemEditorViewController_accessoryModule) = v11;
    v19 = v11;

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v20 + 32) = v11;
  v22 = v20;
  sub_1B93EDF64();
  return v22;
}

void sub_1B9015198()
{
  char *v0;
  void *v1;
  __CFString *v2;
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for MediaSystemEditorViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);

  v1 = (void *)sub_1B93EDD84();
  v2 = HULocalizedString(v1);

  sub_1B93EDDB4();
  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTitle_, v3);

  v4 = objc_msgSend(v0, sel_navigationItem);
  v5 = (void *)sub_1B93EDD84();
  v6 = HULocalizedString(v5);

  if (!v6)
  {
    sub_1B93EDDB4();
    v6 = (__CFString *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v4, sel_setPrompt_, v6);

  sub_1B9015334();
}

void sub_1B9015334()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v1 = objc_msgSend(v0, sel_navigationItem);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithBarButtonSystemItem_target_action_, 1, v0, sel_cancelWithSender_);
  objc_msgSend(v1, sel_setLeftBarButtonItem_, v2);

  v3 = objc_msgSend(v0, sel_navigationItem);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_doneWithSender_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1B9015E4C();
}

void sub_1B9015454(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = sub_1B90147B8();
  v3 = objc_msgSend(v2, sel_createMediaSystemWithAccessory_, a1);

  if (v3)
  {
    v5 = objc_msgSend(v3, sel_asGeneric);
    v4 = sub_1B9015698(v5);

  }
}

id sub_1B90155A4()
{
  id v0;
  id v1;
  id v2;
  id v3;

  v0 = sub_1B90147B8();
  v1 = objc_msgSend(v0, sel_createMediaSystem);

  v2 = objc_msgSend(v1, sel_asGeneric);
  v3 = sub_1B9015698(v2);

  return v3;
}

id sub_1B9015698(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = sub_1B9017B74;
  v18 = v2;
  v3 = MEMORY[0x1E0C809B0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 1107296256;
  v15 = sub_1B8F6D55C;
  v16 = &block_descriptor_26_1;
  v4 = _Block_copy(&v13);
  swift_release();
  v5 = objc_msgSend(a1, sel_flatMap_, v4);
  _Block_release(v4);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = sub_1B9017B7C;
  v18 = v6;
  v13 = v3;
  v14 = 1107296256;
  v15 = sub_1B8EB2008;
  v16 = &block_descriptor_30_0;
  v7 = _Block_copy(&v13);
  swift_release();
  v8 = objc_msgSend(v5, sel_addSuccessBlock_, v7);
  _Block_release(v7);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = sub_1B9017B84;
  v18 = v9;
  v13 = v3;
  v14 = 1107296256;
  v15 = sub_1B8EB2008;
  v16 = &block_descriptor_34_1;
  v10 = _Block_copy(&v13);
  swift_release();
  v11 = objc_msgSend(v8, sel_addFailureBlock_, v10);
  _Block_release(v10);

  return v5;
}

id sub_1B9015884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1BCCC1DA8](v2);
  if (v3
    && (v4 = (void *)v3,
        v5 = objc_retain(*(id *)(*(_QWORD *)(v3 + OBJC_IVAR___HUMediaSystemEditorViewController_selectionController)
                               + 16)),
        v4,
        v6 = objc_msgSend(v5, sel_mediaSystem),
        v5,
        v6))
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, v6);
    v8 = objc_msgSend(v7, sel_asGeneric);
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_hf_errorWithCode_, 30);
    v6 = (id)sub_1B93EB6F0();
    v8 = objc_msgSend((id)objc_opt_self(), sel_futureWithError_, v6);
  }
  v9 = v8;

  return v9;
}

void sub_1B90159B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char *v10;
  void *v11;
  id v12;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1BCCC1DA8](v3);
  if (v4)
  {
    v5 = (char *)v4;
    v6 = v4 + OBJC_IVAR___HUMediaSystemEditorViewController_delegate;
    swift_beginAccess();
    v7 = MEMORY[0x1BCCC1DA8](v6);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = v5;
      objc_msgSend(v8, sel_mediaSystemEditor_didCreate_, v9, a1);

      swift_unknownObjectRelease();
    }
    v10 = &v5[OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate];
    swift_beginAccess();
    v11 = (void *)MEMORY[0x1BCCC1DA8](v10);
    if (v11)
    {
      v12 = objc_msgSend(v11, sel_finishPresentation_animated_, v5, 1);
      swift_unknownObjectRelease();

    }
  }
}

void sub_1B9015AC4(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD aBlock[6];

  v18 = (id)sub_1B93EB6F0();
  v3 = objc_msgSend(v18, sel_domain);
  v4 = sub_1B93EDDB4();
  v6 = v5;

  if (v4 == sub_1B93EDDB4() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v9 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      goto LABEL_10;
  }
  if (objc_msgSend(v18, sel_code) == (id)-7003)
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_sharedHandler);
    v11 = (void *)sub_1B93EB6F0();
    v12 = (void *)sub_1B93EDD84();
    objc_msgSend(v10, sel_logError_operationDescription_, v11, v12);

    goto LABEL_13;
  }
LABEL_10:
  v13 = objc_msgSend(v18, sel_na_isCancelledError);
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedHandler);
  v15 = (void *)sub_1B93EB6F0();
  if (v13)
  {
    aBlock[4] = sub_1B9017B8C;
    aBlock[5] = a2;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B8EA3E34;
    aBlock[3] = &block_descriptor_37;
    v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_handleError_retryBlock_cancelBlock_, v15, v16, 0);

    _Block_release(v16);
    return;
  }
  v17 = (void *)sub_1B93EDD84();
  objc_msgSend(v14, sel_logError_operationDescription_, v15, v17);

LABEL_13:
}

void sub_1B9015D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1BCCC1DA8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = sub_1B90147B8();
    v5 = objc_msgSend(v4, sel_createMediaSystem);

    v6 = objc_msgSend(v5, sel_asGeneric);
    v7 = (void *)sub_1B9015698();

  }
}

void sub_1B9015E4C()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = objc_msgSend(v0, sel_navigationItem);
  v6 = objc_msgSend(v1, sel_rightBarButtonItem);

  if (v6)
  {
    v2 = *(void **)(*(_QWORD *)&v0[OBJC_IVAR___HUMediaSystemEditorViewController_selectionController] + 16);
    swift_retain();
    v3 = objc_msgSend(v2, sel_accessories);
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
    sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
    v4 = sub_1B93EE0FC();

    if ((v4 & 0xC000000000000001) != 0)
      v5 = sub_1B93EE780();
    else
      v5 = *(_QWORD *)(v4 + 16);
    swift_release();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setEnabled_, v5 > 1);

  }
}

uint64_t sub_1B9016238(uint64_t a1, void *a2)
{
  char v3;
  uint64_t v5;
  id v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;

  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
    swift_getObjectType();
    v5 = sub_1B93EE3C0();
    v6 = a2;
    sub_1B9016AD0(v5, v6);
    v8 = v7;
    swift_bridgeObjectRelease();

    if ((v8 & 1) != 0)
    {
      v3 = 1;
      return v3 & 1;
    }
    v9 = sub_1B93EE39C();
    sub_1B8F15C68(v9);
    v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
    {
      v12 = sub_1B93EE3C0();
      v13 = v6;
      sub_1B9016F84(v12, v13);
      v3 = v14;
      swift_bridgeObjectRelease();

      return v3 & 1;
    }
  }
  v3 = 0;
  return v3 & 1;
}

id MediaSystemEditorViewController.__allocating_init(itemManager:collectionViewLayout:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithItemManager_collectionViewLayout_, a1, a2);

  return v5;
}

void MediaSystemEditorViewController.init(itemManager:collectionViewLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MediaSystemEditorViewController.__allocating_init(usingCompositionalLayoutWith:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initUsingCompositionalLayoutWithItemManager_, a1);

  return v3;
}

void MediaSystemEditorViewController.init(usingCompositionalLayoutWith:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MediaSystemEditorViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaSystemEditorViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id MediaSystemEditorViewController.mediaSystemHelperPresentingViewController.getter()
{
  void *v0;

  return v0;
}

Swift::Void __swiftcall MediaSystemEditorViewController.mediaSystemEditorHelperDidEndCommitting(_:)(HUMediaSystemEditorHelper a1)
{
  void *v1;
  id v2;
  id v3;

  sub_1B9015334();
  v2 = objc_msgSend(v1, sel_view);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_setUserInteractionEnabled_, 1);

  }
  else
  {
    __break(1u);
  }
}

void MediaSystemEditorViewController.mediaSystemEditorHelper(_:didModifyMediaSystemBuilder:)()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_itemManager);
  objc_msgSend(v1, sel_recalculateVisibilityAndSortAllItems);

}

void MediaSystemEditorViewController.mediaSystemEditorHelper(_:needsToPresent:animated:completion:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v8;
  _QWORD v9[6];

  if (a4)
  {
    v9[4] = a4;
    v9[5] = a5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1B8EA3E34;
    v9[3] = &block_descriptor_13_4;
    v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, sel_presentViewController_animated_completion_, a2, a3 & 1, v8);
  _Block_release(v8);
}

Swift::Void __swiftcall MediaSystemEditorViewController.mediaSystemEditorHelper(_:didAbortForAccessoryNeedingUpdate:)(HUMediaSystemEditorHelper _, HMAccessory didAbortForAccessoryNeedingUpdate)
{
  sub_1B9017930((uint64_t)_._delegate);
}

void sub_1B9016AD0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  char v27;
  uint64_t v28;
  id v29;
  char v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
    sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
    sub_1B93EE138();
    v3 = v37;
    v35 = v38;
    v4 = v39;
    v5 = v40;
    v6 = v41;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v35 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v4 = v8;
    v5 = 0;
  }
  v31 = v4;
  v34 = (unint64_t)(v4 + 64) >> 6;
  v33 = v3;
  v32 = a2;
  v11 = v6;
  if ((v3 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_31:
  if (!sub_1B93EE7A4())
    goto LABEL_44;
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v20 = v42;
  swift_unknownObjectRelease();
  v16 = v5;
  v14 = v11;
  if (!v42)
    goto LABEL_44;
  while (1)
  {
    v36 = v16;
    v21 = objc_msgSend(a2, sel_accessories, v31);
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
    sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
    v22 = sub_1B93EE0FC();

    if ((v22 & 0xC000000000000001) != 0)
    {
      v12 = v20;
      v13 = sub_1B93EE7B0();
      swift_bridgeObjectRelease();

      v5 = v36;
      if ((v13 & 1) != 0)
        goto LABEL_44;
      v11 = v14;
      if (v3 < 0)
        goto LABEL_31;
    }
    else
    {
      if (*(_QWORD *)(v22 + 16))
      {
        v23 = sub_1B93EE4E0();
        v24 = -1 << *(_BYTE *)(v22 + 32);
        v25 = v23 & ~v24;
        if (((*(_QWORD *)(v22 + 56 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) != 0)
        {
          v26 = *(id *)(*(_QWORD *)(v22 + 48) + 8 * v25);
          v27 = sub_1B93EE4EC();

          if ((v27 & 1) != 0)
          {
LABEL_43:

            swift_bridgeObjectRelease();
            goto LABEL_44;
          }
          v28 = ~v24;
          while (1)
          {
            v25 = (v25 + 1) & v28;
            if (((*(_QWORD *)(v22 + 56 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
              break;
            v29 = *(id *)(*(_QWORD *)(v22 + 48) + 8 * v25);
            v30 = sub_1B93EE4EC();

            if ((v30 & 1) != 0)
              goto LABEL_43;
          }
        }
      }

      swift_bridgeObjectRelease();
      a2 = v32;
      v3 = v33;
      v5 = v36;
      v11 = v14;
      if (v33 < 0)
        goto LABEL_31;
    }
LABEL_11:
    if (!v11)
      break;
    v14 = (v11 - 1) & v11;
    v15 = __clz(__rbit64(v11)) | (v5 << 6);
    v16 = v5;
LABEL_29:
    v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v15);
    if (!v20)
      goto LABEL_44;
  }
  v17 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return;
  }
  if (v17 >= v34)
    goto LABEL_44;
  v18 = *(_QWORD *)(v35 + 8 * v17);
  v16 = v5 + 1;
  if (v18)
    goto LABEL_28;
  v16 = v5 + 2;
  if (v5 + 2 >= v34)
    goto LABEL_44;
  v18 = *(_QWORD *)(v35 + 8 * v16);
  if (v18)
    goto LABEL_28;
  v16 = v5 + 3;
  if (v5 + 3 >= v34)
    goto LABEL_44;
  v18 = *(_QWORD *)(v35 + 8 * v16);
  if (v18)
    goto LABEL_28;
  v16 = v5 + 4;
  if (v5 + 4 >= v34)
    goto LABEL_44;
  v18 = *(_QWORD *)(v35 + 8 * v16);
  if (v18)
    goto LABEL_28;
  v16 = v5 + 5;
  if (v5 + 5 >= v34)
    goto LABEL_44;
  v18 = *(_QWORD *)(v35 + 8 * v16);
  if (v18)
  {
LABEL_28:
    v14 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v16 << 6);
    goto LABEL_29;
  }
  v19 = v5 + 6;
  while (v34 != v19)
  {
    v18 = *(_QWORD *)(v35 + 8 * v19++);
    if (v18)
    {
      v16 = v19 - 1;
      goto LABEL_28;
    }
  }
LABEL_44:
  sub_1B8E7A20C();
}

void sub_1B9016F84(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
    sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
    sub_1B93EE138();
    v3 = v20;
    v19 = v21;
    v4 = v22;
    v5 = v23;
    v6 = v24;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v19 = a1 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v5 = 0;
  }
  v18 = (unint64_t)(v4 + 64) >> 6;
  while (1)
  {
    v10 = v5;
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!sub_1B93EE7A4())
      goto LABEL_35;
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v13 = v25;
    swift_unknownObjectRelease();
    if (!v25)
      goto LABEL_35;
LABEL_32:
    if (objc_msgSend((id)objc_opt_self(), sel_canSupportMediaSystem_, v13)
      && (objc_msgSend(a2, sel_shouldAllowAddingAccessory_, v13) & 1) != 0)
    {
      v17 = objc_msgSend(a2, sel_stereoPairVersionMatchesForAccessory_, v13);

      if (v17)
        goto LABEL_35;
    }
    else
    {

    }
  }
  if (v6)
  {
    v11 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v12 = v11 | (v5 << 6);
LABEL_31:
    v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    if (!v13)
      goto LABEL_35;
    goto LABEL_32;
  }
  v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 >= v18)
      goto LABEL_35;
    v15 = *(_QWORD *)(v19 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v10 + 2;
      if (v10 + 2 >= v18)
        goto LABEL_35;
      v15 = *(_QWORD *)(v19 + 8 * v5);
      if (!v15)
      {
        v5 = v10 + 3;
        if (v10 + 3 >= v18)
          goto LABEL_35;
        v15 = *(_QWORD *)(v19 + 8 * v5);
        if (!v15)
        {
          v5 = v10 + 4;
          if (v10 + 4 >= v18)
            goto LABEL_35;
          v15 = *(_QWORD *)(v19 + 8 * v5);
          if (!v15)
          {
            v5 = v10 + 5;
            if (v10 + 5 >= v18)
              goto LABEL_35;
            v15 = *(_QWORD *)(v19 + 8 * v5);
            if (!v15)
            {
              v16 = v10 + 6;
              while (v18 != v16)
              {
                v15 = *(_QWORD *)(v19 + 8 * v16++);
                if (v15)
                {
                  v5 = v16 - 1;
                  goto LABEL_30;
                }
              }
LABEL_35:
              sub_1B8E7A20C();
              return;
            }
          }
        }
      }
    }
LABEL_30:
    v6 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v5 << 6);
    goto LABEL_31;
  }
  __break(1u);
}

void sub_1B90172C0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
    sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
    sub_1B93EE138();
    v3 = v19;
    v18 = v20;
    v4 = v21;
    v5 = v22;
    v6 = v23;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v18 = a1 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v5 = 0;
  }
  v17 = (unint64_t)(v4 + 64) >> 6;
  if (v3 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v6)
    {
      v10 = (v6 - 1) & v6;
      v11 = __clz(__rbit64(v6)) | (v5 << 6);
      v12 = v5;
      goto LABEL_29;
    }
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v14 >= v17)
      goto LABEL_32;
    v15 = *(_QWORD *)(v18 + 8 * v14);
    v12 = v5 + 1;
    if (!v15)
    {
      v12 = v5 + 2;
      if (v5 + 2 >= v17)
        goto LABEL_32;
      v15 = *(_QWORD *)(v18 + 8 * v12);
      if (!v15)
      {
        v12 = v5 + 3;
        if (v5 + 3 >= v17)
          goto LABEL_32;
        v15 = *(_QWORD *)(v18 + 8 * v12);
        if (!v15)
        {
          v12 = v5 + 4;
          if (v5 + 4 >= v17)
            goto LABEL_32;
          v15 = *(_QWORD *)(v18 + 8 * v12);
          if (!v15)
          {
            v12 = v5 + 5;
            if (v5 + 5 >= v17)
              goto LABEL_32;
            v15 = *(_QWORD *)(v18 + 8 * v12);
            if (!v15)
            {
              v16 = v5 + 6;
              while (v17 != v16)
              {
                v15 = *(_QWORD *)(v18 + 8 * v16++);
                if (v15)
                {
                  v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1B8E7A20C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v11);
    if (!v13)
      goto LABEL_32;
    while (1)
    {
      objc_msgSend(a2, sel_addAccessory_, v13);

      v5 = v12;
      v6 = v10;
      if ((v3 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_1B93EE7A4())
      {
        sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v13 = v24;
        swift_unknownObjectRelease();
        v12 = v5;
        v10 = v6;
        if (v24)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_1B90175AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B90175D0(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9016238(a1, *(void **)(v1 + 16));
}

uint64_t type metadata accessor for MediaSystemEditorViewController()
{
  return objc_opt_self();
}

uint64_t sub_1B90175F8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_1B901761C()
{
  uint64_t v0;

  return sub_1B9014E54(v0);
}

uint64_t sub_1B9017624()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B9017650(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B9014F84(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1B9017658(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  id v6;
  id v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  uint64_t result;
  id v13;
  objc_super v14;

  type metadata accessor for AccessoryRepresentableItemModule();
  v2 = swift_dynamicCastClass();
  if (v2)
  {
    v3 = v2;
    v4 = (objc_class *)type metadata accessor for AccessoryListModuleController();
    v5 = (char *)objc_allocWithZone(v4);
    *(_QWORD *)&v5[OBJC_IVAR___HUAccessoryListModuleController_cellVerticalContentInset] = 0x4028000000000000;
    v6 = objc_allocWithZone((Class)type metadata accessor for CollectionLayoutManager());
    v7 = a1;
    v8 = v5;
    v9 = objc_msgSend(v6, sel_init);
    *(_QWORD *)&v8[OBJC_IVAR___HUAccessoryListModuleController_collectionLayoutManager] = v9;

    v14.receiver = v8;
    v14.super_class = v4;
    v10 = objc_msgSendSuper2(&v14, sel_initWithModule_, v3);
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v11 = objc_msgSend(v10, sel_asGeneric);

    return (uint64_t)v11;
  }
  else
  {
    sub_1B93EE828();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(a1, sel_description);
    sub_1B93EDDB4();

    sub_1B93EDE44();
    swift_bridgeObjectRelease();
    result = sub_1B93EE9CC();
    __break(1u);
  }
  return result;
}

void _s6HomeUI31MediaSystemEditorViewControllerC05mediadE24HelperDidBeginCommittingyySo07HUMediadeI0CF_0()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA2C8]), sel_initWithActivityIndicatorStyle_, 100);
  v2 = objc_msgSend(v0, sel_navigationItem);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithCustomView_, v1);
  objc_msgSend(v2, sel_setRightBarButtonItem_, v3);

  objc_msgSend(v1, sel_startAnimating);
  v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);

  }
  else
  {
    __break(1u);
  }
}

void sub_1B9017930(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = v1 + OBJC_IVAR___HUMediaSystemEditorViewController_delegate;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1BCCC1DA8](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_mediaSystemEditor_didAbortDueTo_, v1, a1);
    swift_unknownObjectRelease();
  }
  v5 = v1 + OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x1BCCC1DA8](v5);
  if (v6)
  {
    v7 = objc_msgSend(v6, sel_finishPresentation_animated_, v1, 1);
    swift_unknownObjectRelease();

  }
}

uint64_t sub_1B9017A04@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate, a2);
}

uint64_t sub_1B9017A10()
{
  return keypath_setTm();
}

uint64_t sub_1B9017A1C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___HUMediaSystemEditorViewController_delegate, a2);
}

uint64_t sub_1B9017A28()
{
  return keypath_setTm();
}

uint64_t method lookup function for MediaSystemEditorViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.presentationDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.presentationDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.presentationDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.mediaSystemBuilder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.__allocating_init(mediaSystemBuilder:staticAccessories:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.createMediaSystem(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MediaSystemEditorViewController.createMediaSystem()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t sub_1B9017B44()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B9017B68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_1B9017B74(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9015884(a1, v1);
}

void sub_1B9017B7C(uint64_t a1)
{
  uint64_t v1;

  sub_1B90159B4(a1, v1);
}

void sub_1B9017B84(uint64_t a1)
{
  uint64_t v1;

  sub_1B9015AC4(a1, v1);
}

void sub_1B9017B8C()
{
  uint64_t v0;

  sub_1B9015D58(v0);
}

unint64_t sub_1B9017B94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF20DC90;
  if (!qword_1EF20DC90)
  {
    v1 = type metadata accessor for MediaSystemBuilderSelectionController();
    result = MEMORY[0x1BCCC1BE0](&protocol conformance descriptor for MediaSystemBuilderSelectionController, v1);
    atomic_store(result, (unint64_t *)&qword_1EF20DC90);
  }
  return result;
}

id AccessoryGridModuleController.__allocating_init(module:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithModule_, a1);

  return v3;
}

__n128 sub_1B9017C50@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unint64_t v7;
  unsigned __int8 v8;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings);
  swift_beginAccess();
  v4 = v3[1].n128_u8[0];
  v5 = v3[1].n128_u8[1];
  v6 = v3[1].n128_u8[2];
  v7 = v3[1].n128_u64[1];
  v8 = v3[2].n128_u8[0];
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  a2[1].n128_u8[1] = v5;
  a2[1].n128_u8[2] = v6;
  a2[1].n128_u64[1] = v7;
  a2[2].n128_u8[0] = v8;
  return result;
}

uint64_t sub_1B9017CC8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *((_BYTE *)a1 + 17);
  v6 = *((_BYTE *)a1 + 18);
  v7 = a1[3];
  v8 = *((_BYTE *)a1 + 32);
  v9 = *a2 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings;
  result = swift_beginAccess();
  *(_QWORD *)v9 = v2;
  *(_QWORD *)(v9 + 8) = v3;
  *(_BYTE *)(v9 + 16) = v4;
  *(_BYTE *)(v9 + 17) = v5;
  *(_BYTE *)(v9 + 18) = v6;
  *(_QWORD *)(v9 + 24) = v7;
  *(_BYTE *)(v9 + 32) = v8;
  return result;
}

__n128 sub_1B9017D54@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unint64_t v7;
  unsigned __int8 v8;
  __n128 result;

  v3 = (__n128 *)(v1 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings);
  swift_beginAccess();
  v4 = v3[1].n128_u8[0];
  v5 = v3[1].n128_u8[1];
  v6 = v3[1].n128_u8[2];
  v7 = v3[1].n128_u64[1];
  v8 = v3[2].n128_u8[0];
  result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  a1[1].n128_u8[1] = v5;
  a1[1].n128_u8[2] = v6;
  a1[1].n128_u64[1] = v7;
  a1[2].n128_u8[0] = v8;
  return result;
}

uint64_t sub_1B9017DC8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *((_BYTE *)a1 + 17);
  v6 = *((_BYTE *)a1 + 18);
  v7 = a1[3];
  v8 = *((_BYTE *)a1 + 32);
  v9 = v1 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings;
  result = swift_beginAccess();
  *(_QWORD *)v9 = v2;
  *(_QWORD *)(v9 + 8) = v3;
  *(_BYTE *)(v9 + 16) = v4;
  *(_BYTE *)(v9 + 17) = v5;
  *(_BYTE *)(v9 + 18) = v6;
  *(_QWORD *)(v9 + 24) = v7;
  *(_BYTE *)(v9 + 32) = v8;
  return result;
}

uint64_t (*sub_1B9017E58())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B9017E9C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *a1 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  swift_beginAccess();
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 16);
  *(_BYTE *)(a2 + 16) = v6;
  return sub_1B8E3F144(v4, v5, v6);
}

uint64_t sub_1B9017EF8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *a2 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  v5 = *(_BYTE *)(a1 + 16);
  swift_beginAccess();
  v6 = *(_QWORD *)v4;
  v7 = *(_QWORD *)(v4 + 8);
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = v3;
  v8 = *(_BYTE *)(v4 + 16);
  *(_BYTE *)(v4 + 16) = v5;
  sub_1B8E3F144(v2, v3, v5);
  return sub_1B8E3EF7C(v6, v7, v8);
}

uint64_t sub_1B9017F8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = v1 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  swift_beginAccess();
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  return sub_1B8E3F144(v4, v5, v6);
}

uint64_t sub_1B9017FE4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = v1 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  swift_beginAccess();
  v6 = *(_QWORD *)v5;
  v7 = *(_QWORD *)(v5 + 8);
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = v3;
  v8 = *(_BYTE *)(v5 + 16);
  *(_BYTE *)(v5 + 16) = v4;
  return sub_1B8E3EF7C(v6, v7, v8);
}

uint64_t (*sub_1B9018050())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1B9018094()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CollectionLayoutManager()), sel_init);
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t type metadata accessor for AccessoryGridModuleController()
{
  return objc_opt_self();
}

id sub_1B9018204(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t (*v13)(void *);
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v22;
  char v23;

  v4 = v3;
  v8 = sub_1B9018094();
  v9 = v4 + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  swift_beginAccess();
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(uint64_t (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x1A0);
  sub_1B8E3F144(v10, v11, v12);

  v14 = (char *)v8 + OBJC_IVAR___HUCollectionLayoutManager_delegate;
  swift_beginAccess();
  v15 = MEMORY[0x1BCCC1DA8](v14);
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)sub_1B93EDD84();
    v18 = objc_msgSend(v16, sel_displayedItemsInSection_, v17);

    swift_unknownObjectRelease();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    v19 = (void *)sub_1B93EDF4C();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0DEE9D8];
  }
  v20 = sub_1B8E3EBC4(v10, v11, v12, v8, v19, a3, a1, a2);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v22 = v10;
  *((_QWORD *)&v22 + 1) = v11;
  v23 = v12;
  sub_1B8E3E15C(v20, &v22, a1, a2);

  sub_1B8E3EF7C(v10, v11, v12);
  return v20;
}

id sub_1B9018438(void *a1, void *a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  int v13;
  _BYTE *v14;
  int v15;
  uint64_t v16;
  char v17;
  char *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  _BYTE *v26;
  int v27;
  id result;
  void *v29;
  char *v30;
  objc_super v31;

  v3 = v2;
  v31.receiver = v3;
  v31.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
  objc_msgSendSuper2(&v31, sel_configureCell_forItem_, a1, a2);
  type metadata accessor for TileCell();
  v6 = swift_dynamicCastClass();
  if (!v6)
    goto LABEL_21;
  v7 = (_QWORD *)v6;
  v8 = &v3[OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings];
  swift_beginAccess();
  v9 = *((_QWORD *)v8 + 1);
  v10 = (_QWORD *)((char *)v7 + OBJC_IVAR___HUTileCell_borderStyle);
  swift_beginAccess();
  v11 = *v10;
  *v10 = v9;
  v12 = a1;
  if (v9 != v11)
    objc_msgSend(v7, sel_setNeedsUpdateConfiguration);
  v13 = v8[16];
  v14 = (char *)v7 + OBJC_IVAR___HUTileCell_showPrefixLabel;
  swift_beginAccess();
  v15 = *v14;
  *v14 = v13;
  if (v13 != v15)
    objc_msgSend(v7, sel_setNeedsUpdateConfiguration);
  v16 = *((_QWORD *)v8 + 3);
  v17 = v8[32];
  v18 = (char *)v7 + OBJC_IVAR___HUTileCell_overrideLayout;
  swift_beginAccess();
  v19 = *(_QWORD *)v18;
  v20 = v18[8];
  *(_QWORD *)v18 = v16;
  v18[8] = v17;
  if ((v17 & 1) != 0)
  {
    if (v20)
      goto LABEL_13;
  }
  else
  {
    if (v16 != v19)
      LOBYTE(v20) = 1;
    if ((v20 & 1) == 0)
      goto LABEL_13;
  }
  objc_msgSend(v7, sel_setNeedsUpdateConfiguration);
LABEL_13:
  if ((v8[17] & 1) != 0)
  {
    v21 = (void *)objc_opt_self();
    sub_1B90187C0(a2);
    sub_1B8E23A60(0, (unint64_t *)&unk_1EF20BD40);
    sub_1B8E48724((unint64_t *)&qword_1EF207900, (unint64_t *)&unk_1EF20BD40);
    v22 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v21, sel_hu_preferredToggleableControlItemInControlItems_, v22);

    if (v23)
    {

      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0x128))(v24);
  v25 = v8[18];
  v26 = (char *)v7 + OBJC_IVAR___HUTileCell_useMutedIconOffColors;
  swift_beginAccess();
  v27 = *v26;
  *v26 = v25;
  if (v25 != v27)
    objc_msgSend(v7, sel_setNeedsUpdateConfiguration);

LABEL_21:
  result = (id)swift_dynamicCastObjCProtocolConditional();
  if (result)
  {
    v29 = result;
    v30 = &v3[OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings];
    swift_beginAccess();
    return objc_msgSend(v29, sel_setBackgroundDisplayStyle_, *(_QWORD *)v30);
  }
  return result;
}

void sub_1B90187C0(void *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  objc_opt_self();
  v3 = swift_dynamicCastObjCClass();
  if (!v3)
  {
LABEL_6:
    v10 = objc_msgSend(v1, sel_module);
    v5 = objc_msgSend(v10, sel_itemUpdater);

    if (v5)
    {
      v11 = objc_msgSend(v5, sel_childItemsForItem_, a1);
      v7 = (id)sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
      sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
      v12 = sub_1B93EE0FC();

      if ((v12 & 0xC000000000000001) != 0)
      {
        v13 = MEMORY[0x1E0DEE9E8];
        v27 = MEMORY[0x1E0DEE9E8];
        sub_1B93EE744();
        if (sub_1B93EE7A4())
        {
          do
          {
            swift_dynamicCast();
            objc_opt_self();
            if (swift_dynamicCastObjCClass())
            {
              v14 = v27;
              v15 = *(_QWORD *)(v27 + 16);
              if (*(_QWORD *)(v27 + 24) <= v15)
              {
                sub_1B8FD8608(v15 + 1);
                v14 = v27;
              }
              v16 = sub_1B93EE4E0();
              v17 = v14 + 56;
              v18 = -1 << *(_BYTE *)(v14 + 32);
              v19 = v16 & ~v18;
              v20 = v19 >> 6;
              if (((-1 << v19) & ~*(_QWORD *)(v14 + 56 + 8 * (v19 >> 6))) != 0)
              {
                v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v14 + 56 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
              }
              else
              {
                v22 = 0;
                v23 = (unint64_t)(63 - v18) >> 6;
                do
                {
                  if (++v20 == v23 && (v22 & 1) != 0)
                  {
                    __break(1u);
                    goto LABEL_36;
                  }
                  v24 = v20 == v23;
                  if (v20 == v23)
                    v20 = 0;
                  v22 |= v24;
                  v25 = *(_QWORD *)(v17 + 8 * v20);
                }
                while (v25 == -1);
                v21 = __clz(__rbit64(~v25)) + (v20 << 6);
              }
              *(_QWORD *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
              *(_QWORD *)(*(_QWORD *)(v14 + 48) + 8 * v21) = v26;
              ++*(_QWORD *)(v14 + 16);
            }
            else
            {

            }
          }
          while (sub_1B93EE7A4());
          v13 = v27;
        }
        swift_release();
      }
      else
      {
        v13 = sub_1B9019254(v12);
      }
      sub_1B8FC6ACC(v13);
      swift_unknownObjectRelease();
      swift_release();
    }
    else if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1B93EE9F0())
    {
      sub_1B8E967F4(MEMORY[0x1E0DEE9D8]);
    }
    return;
  }
  v4 = (void *)v3;
  v5 = a1;
  v6 = objc_msgSend(v4, sel_accessory);
  v7 = objc_msgSend(v6, sel_hf_primaryService);

  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, sel_controlItemsForService_, v7);
  if (v8)
  {
    v9 = v8;
    sub_1B8E23A60(0, (unint64_t *)&unk_1EF20BD40);
    sub_1B8E48724((unint64_t *)&qword_1EF207900, (unint64_t *)&unk_1EF20BD40);
    sub_1B93EE0FC();

    return;
  }
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0)
  {
LABEL_36:
    if (sub_1B93EE9F0())
    {
      sub_1B8E967F4(MEMORY[0x1E0DEE9D8]);

      return;
    }
  }

}

BOOL sub_1B9018D34()
{
  void *v0;
  char *v1;
  char *v2;
  uint64_t v3;

  v1 = (char *)objc_msgSend(v0, sel_module);
  v2 = &v1[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType];
  swift_beginAccess();
  v3 = *(_QWORD *)v2;

  return v3 != 0;
}

id sub_1B9018E24(void *a1)
{
  objc_msgSend(a1, sel_setSectionLeadingMargin_, 0.0);
  objc_msgSend(a1, sel_setSectionTrailingMargin_, 0.0);
  return a1;
}

id AccessoryGridModuleController.init(module:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings];
  *(_OWORD *)v3 = xmmword_1B9438F40;
  *((_WORD *)v3 + 8) = 256;
  v3[18] = 0;
  *((_QWORD *)v3 + 3) = 0;
  v3[32] = 1;
  v4 = &v1[OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle];
  *(_OWORD *)v4 = xmmword_1B9436B50;
  v4[16] = 2;
  *(_QWORD *)&v1[OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
  v5 = objc_msgSendSuper2(&v7, sel_initWithModule_, a1);

  return v5;
}

id AccessoryGridModuleController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AccessoryGridModuleController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryGridModuleController.cellSettings.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.cellSettings.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.cellSettings.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.layoutStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.layoutStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.layoutStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.displayedItems(inSection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.shouldShowHeader(forSection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AccessoryGridModuleController.transform(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for AccessoryGridModuleController.CellSettings(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessoryGridModuleController.CellSettings(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryGridModuleController.CellSettings()
{
  return &type metadata for AccessoryGridModuleController.CellSettings;
}

uint64_t sub_1B9019254(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_1B90193B0((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_1B90193B0((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x1BCCC1CD0](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_1B90193B0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t *v18;

  v18 = (unint64_t *)result;
  v4 = 0;
  v5 = 0;
  v6 = a3 + 56;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10)
      goto LABEL_24;
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v10)
        goto LABEL_24;
      v14 = *(_QWORD *)(v6 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v10)
          goto LABEL_24;
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    objc_opt_self();
    result = swift_dynamicCastObjCClass();
    if (result)
    {
      *(unint64_t *)((char *)v18 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_1B8F0BBF8(v18, a2, v4, a3);
      }
    }
  }
  v15 = v13 + 3;
  if (v15 >= v10)
    goto LABEL_24;
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      goto LABEL_24;
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1B90195A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate;
  swift_beginAccess();
  return MEMORY[0x1BCCC1DA8](v1);
}

uint64_t sub_1B9019638()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1B9019690(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BCCC1DA8](v5);
  return sub_1B8E7B1B4;
}

id StatusDetailsViewController.__allocating_init(statusItem:delegate:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return StatusDetailsViewController.init(statusItem:delegate:)(a1);
}

id StatusDetailsViewController.init(statusItem:delegate:)(void *a1)
{
  char *v1;
  int v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;
  void *v11;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___HUStatusDetailsViewController____lazy_storage___collectionLayoutManager] = 0;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  objc_msgSend(a1, sel_copy);
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20BAC0);
  v3 = swift_dynamicCast();
  v4 = objc_allocWithZone((Class)HUHomeStatusDetailsItemManager);
  if (v3)
    v5 = v11;
  else
    v5 = 0;
  v6 = objc_msgSend(v4, sel_initWithDelegate_sourceItem_, 0, v5);

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  v7 = objc_msgSendSuper2(&v10, sel_initUsingCompositionalLayoutWithItemManager_, v6);
  v8 = v6;
  objc_msgSend(v8, sel_setDelegate_, v7);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t type metadata accessor for StatusDetailsViewController()
{
  return objc_opt_self();
}

void sub_1B9019910()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_collectionView);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

    v4 = objc_msgSend(v0, sel_collectionView);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_setContentInset_, 20.0, 0.0, 10.0, 0.0);

      v6 = objc_msgSend(v0, sel_navigationItem);
      v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA380]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_doneButtonPressed_);
      objc_msgSend(v6, sel_setRightBarButtonItem_, v7);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_1B9019BB4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___HUStatusDetailsViewController____lazy_storage___collectionLayoutManager;
  v2 = *(void **)(v0 + OBJC_IVAR___HUStatusDetailsViewController____lazy_storage___collectionLayoutManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___HUStatusDetailsViewController____lazy_storage___collectionLayoutManager);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CollectionLayoutManager()), sel_init);
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_1B9019CAC(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  objc_class *v19;
  uint64_t result;
  void *v21;
  id v22;
  void (*v23)(char *, char *, uint64_t);
  void *v24;
  void *v25;
  id v26;
  _BOOL8 v27;
  objc_super v28;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B93EB900();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v28 - v17;
  v19 = (objc_class *)type metadata accessor for StatusDetailsViewController();
  v28.receiver = v4;
  v28.super_class = v19;
  if (!objc_msgSendSuper2(&v28, sel_presentationCoordinator_shouldBeginInteractivePresentationWithTouchLocation_view_, a1, a2, a3, a4))return 0;
  result = (uint64_t)objc_msgSend(v4, sel_collectionView);
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  v21 = (void *)result;
  v22 = objc_msgSend((id)result, sel_indexPathForItemAtPoint_, a3, a4);

  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_10;
  }
  sub_1B93EB8C4();

  v23 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v23(v11, v15, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_10:
    sub_1B8E26870((uint64_t)v11, &qword_1ED57E7B0);
    return 1;
  }
  v23(v18, v11, v12);
  result = (uint64_t)objc_msgSend(v4, sel_collectionView);
  if (result)
  {
    v24 = (void *)result;
    v25 = (void *)sub_1B93EB8B8();
    v26 = objc_msgSend(v24, sel_cellForItemAtIndexPath_, v25);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    if (v26)
    {
      objc_opt_self();
      v27 = swift_dynamicCastObjCClass() == 0;

      return v27;
    }
    return 1;
  }
LABEL_14:
  __break(1u);
  return result;
}

void sub_1B901A17C(void *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  _BOOL8 v17;
  _QWORD *v18;
  void (*v19)(_BOOL8);
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  id v48;
  id v49;
  char *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  objc_super v67;

  v3 = v2;
  v67.receiver = v2;
  v67.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  objc_msgSendSuper2(&v67, sel_configureCell_forItem_, a1, a2);
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v3, sel__childItemsForItem_, a2);
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20BD40);
  sub_1B901C01C();
  sub_1B93EE0FC();

  v8 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_hu_preferredToggleableControlItemInControlItems_, v8);

  type metadata accessor for AccessoryTileCell();
  v10 = swift_dynamicCastClass();
  if (v10)
  {
    v11 = (_QWORD *)v10;
    if (swift_dynamicCastObjCProtocolConditional())
    {
      objc_opt_self();
      v12 = swift_dynamicCastObjCClass();
      v13 = a1;
      if (v12)
      {

        v9 = 0;
      }
      v14 = (_QWORD *)((char *)v11 + OBJC_IVAR___HUTileCell_backgroundDisplayStyle);
      swift_beginAccess();
      v15 = *v14;
      *v14 = 2;
      if (v15 != 2)
        objc_msgSend(v11, sel_setNeedsUpdateConfiguration);
      v16 = v9;
      v17 = v9 != 0;
      v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
      v19 = *(void (**)(_BOOL8))((*MEMORY[0x1E0DEEDD8] & *v11) + 0x128);
      v20 = v13;
      v19(v17);

      v21 = v20;
      v22 = sub_1B9019BB4();
      v23 = (*(uint64_t (**)(void *))((*v18 & *v22) + 0x120))(a2);
      v25 = v24;

      v26 = (char *)v11 + OBJC_IVAR___HUTileCell__gridSize;
      v28 = *(_QWORD *)((char *)v11 + OBJC_IVAR___HUTileCell__gridSize);
      v27 = *(_QWORD *)((char *)v11 + OBJC_IVAR___HUTileCell__gridSize + 8);
      v29 = *((_BYTE *)v11 + OBJC_IVAR___HUTileCell__gridSize + 16);
      *(_QWORD *)v26 = v23;
      *((_QWORD *)v26 + 1) = v25;
      v26[16] = 0;
      if ((v29 & 1) != 0 || v23 != v28 || v25 != v27)
        objc_msgSend(v11, sel_setNeedsUpdateConfiguration);

      v9 = v16;
    }
  }
  objc_opt_self();
  v30 = swift_dynamicCastObjCClass();
  if (v30)
  {
    v31 = (void *)v30;
    v32 = a1;
    v33 = objc_msgSend(a2, sel_latestResults);
    if (v33)
    {
      v34 = v33;
      v35 = sub_1B93EDD00();

      v36 = sub_1B93EDDB4();
      if (*(_QWORD *)(v35 + 16) && (v38 = sub_1B8E268AC(v36, v37), (v39 & 1) != 0))
      {
        sub_1B8E269F0(*(_QWORD *)(v35 + 56) + 32 * v38, (uint64_t)&v64);
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v65 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EFF8);
        if (swift_dynamicCast())
          v40 = v63;
        else
          v40 = 0;
LABEL_24:
        objc_msgSend(v31, sel_setTitleText_, v40);
        swift_unknownObjectRelease();
        v41 = objc_msgSend(a2, sel_latestResults);
        if (v41)
        {
          v42 = v41;
          v43 = sub_1B93EDD00();

          v44 = sub_1B93EDDB4();
          if (*(_QWORD *)(v43 + 16) && (v46 = sub_1B8E268AC(v44, v45), (v47 & 1) != 0))
          {
            sub_1B8E269F0(*(_QWORD *)(v43 + 56) + 32 * v46, (uint64_t)&v64);
          }
          else
          {
            v64 = 0u;
            v65 = 0u;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v65 + 1))
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EFF8);
            if (swift_dynamicCast())
              v48 = v63;
            else
              v48 = 0;
            goto LABEL_35;
          }
        }
        else
        {
          v64 = 0u;
          v65 = 0u;
        }
        sub_1B8E26870((uint64_t)&v64, (uint64_t *)&unk_1ED57EC00);
        v48 = 0;
LABEL_35:
        objc_msgSend(v31, sel_setDescriptionText_, v48);
        swift_unknownObjectRelease();
        v49 = objc_msgSend(v31, sel_descriptionTextView);
        objc_msgSend(v49, sel_setDelegate_, v3);

        v50 = (char *)sub_1B9019BB4();
        v51 = *(id *)&v50[OBJC_IVAR___HUCollectionLayoutManager_layoutOptions];

        objc_msgSend(v31, sel_setLayoutOptions_, v51);
        goto LABEL_36;
      }
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
    }
    sub_1B8E26870((uint64_t)&v64, (uint64_t *)&unk_1ED57EC00);
    v40 = 0;
    goto LABEL_24;
  }
LABEL_36:
  v66 = &unk_1EF253320;
  v52 = swift_dynamicCastObjCProtocolConditional();
  if (v52)
  {
    v53 = (void *)v52;
    v54 = a1;
    v55 = objc_msgSend(a2, sel_latestResults);
    if (v55)
    {
      v56 = v55;
      v57 = sub_1B93EDD00();

      v58 = sub_1B93EDDB4();
      if (*(_QWORD *)(v57 + 16) && (v60 = sub_1B8E268AC(v58, v59), (v61 & 1) != 0))
      {
        sub_1B8E269F0(*(_QWORD *)(v57 + 56) + 32 * v60, (uint64_t)&v64);
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v65 + 1))
      {
        sub_1B8E23A60(0, (unint64_t *)&qword_1ED57EB10);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v62 = objc_msgSend(v63, sel_BOOLValue);

LABEL_48:
          objc_msgSend(v53, sel_setDisabled_, v62);

          goto LABEL_49;
        }
LABEL_47:
        v62 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
    }
    sub_1B8E26870((uint64_t)&v64, (uint64_t *)&unk_1ED57EC00);
    goto LABEL_47;
  }
LABEL_49:

}

id sub_1B901A874(uint64_t a1, void *a2)
{
  void *v2;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  HUGridLayoutOptions *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v47;
  char v48;
  uint64_t v49;
  CGSize_optional v50;

  v5 = objc_msgSend(v2, sel_itemManager);
  v6 = objc_msgSend(v5, sel_displayedSectionIdentifierForSectionIndex_, a1);

  if (!v6)
  {
    v13 = sub_1B9019BB4();

    v20 = (char *)v13 + OBJC_IVAR___HUCollectionLayoutManager_delegate;
    swift_beginAccess();
    v21 = MEMORY[0x1BCCC1DA8](v20);
    if (v21)
    {
      v22 = (void *)v21;
      v23 = (void *)sub_1B93EDD84();
      v24 = objc_msgSend(v22, sel_displayedItemsInSection_, v23);

      swift_unknownObjectRelease();
      sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
      sub_1B93EDF4C();

    }
    v38 = sub_1B8EA1A34();
    swift_bridgeObjectRelease();
    v47 = xmmword_1B943BA90;
    v48 = 2;
    sub_1B8E3E15C(v38, &v47, 0, 0xE000000000000000);
    goto LABEL_16;
  }
  v7 = sub_1B93EDDB4();
  v9 = v8;

  if (v7 == sub_1B93EDDB4() && v9 == v10)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = sub_1B93EEB10();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      v13 = sub_1B9019BB4();

      v14 = (char *)v13 + OBJC_IVAR___HUCollectionLayoutManager_delegate;
      swift_beginAccess();
      v15 = MEMORY[0x1BCCC1DA8](v14);
      if (v15)
      {
        v16 = (void *)v15;
        v17 = (void *)sub_1B93EDD84();
        v18 = objc_msgSend(v16, sel_displayedItemsInSection_, v17);

        swift_unknownObjectRelease();
        sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
        v19 = sub_1B93EDF4C();

      }
      else
      {
        v19 = MEMORY[0x1E0DEE9D8];
      }
      v38 = (id)sub_1B8E992B0(v19, a2);
      swift_bridgeObjectRelease();
      v47 = xmmword_1B9436B50;
      v48 = 2;
      sub_1B8E3E15C(v38, &v47, v7, v9);
      swift_bridgeObjectRelease();
LABEL_16:

      return v38;
    }
  }
  swift_bridgeObjectRelease();
  swift_getObjectType();
  v50.is_nil = 0;
  NSCollectionLayoutEnvironment.layoutOptions(overrideContentSize:)(v25, v50);
  v27 = v26;
  v28 = (void *)objc_opt_self();
  v29 = objc_msgSend(v28, sel_fractionalWidthDimension_, 1.0);
  objc_msgSend(v27, sel_sectionHeaderCellHeight);
  v30 = objc_msgSend(v28, sel_estimatedDimension_);
  v31 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v29, v30);

  v32 = objc_msgSend((id)objc_opt_self(), sel_itemWithLayoutSize_, v31);
  v33 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1B9436B60;
  *(_QWORD *)(v34 + 32) = v32;
  v49 = v34;
  sub_1B93EDF64();
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E680);
  v35 = v32;
  v36 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  v37 = objc_msgSend(v33, sel_horizontalGroupWithLayoutSize_subitems_, v31, v36);

  v38 = objc_msgSend((id)objc_opt_self(), sel_sectionWithGroup_, v37);
  objc_msgSend(v27, sel_sectionTopMargin);
  v40 = v39;
  objc_msgSend(v27, sel_sectionLeadingMargin);
  v42 = v41;
  objc_msgSend(v27, sel_sectionBottomMargin);
  v44 = v43;
  objc_msgSend(v27, sel_sectionTrailingMargin);
  objc_msgSend(v38, sel_setContentInsets_, v40, v42, v44, v45);

  return v38;
}

uint64_t sub_1B901AE30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EF20C580);
  v5 = swift_task_alloc();
  v3[8] = v5;
  v6 = sub_1B93EBBA0();
  v3[9] = v6;
  v3[10] = *(_QWORD *)(v6 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = sub_1B93EE06C();
  v3[14] = sub_1B93EE060();
  type metadata accessor for DataModelAccessoryControlViewController(0);
  v7 = (_QWORD *)swift_task_alloc();
  v3[15] = v7;
  *v7 = v3;
  v7[1] = sub_1B901AF1C;
  return static DataModelAccessoryControlViewController.findDataModelObjectIdentifier(with:)(v5, a1);
}

uint64_t sub_1B901AF1C()
{
  swift_task_dealloc();
  sub_1B93EE018();
  return swift_task_switch();
}

uint64_t sub_1B901AF8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v16;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1B8E26870(*(_QWORD *)(v0 + 64), qword_1EF20C580);
    v4 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v9 = *(void **)(v0 + 48);
    v16 = *(void **)(v0 + 40);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v5, *(_QWORD *)(v0 + 64), v7);
    type metadata accessor for ItemCollectionViewControlsTransitionHelper();
    v10 = swift_allocObject();
    v11 = v10 + qword_1EF20B740;
    *(_QWORD *)(v10 + qword_1EF20B740 + 8) = 0;
    swift_unknownObjectWeakInit();
    v12 = v10 + qword_1EF20B750;
    *(_OWORD *)v12 = 0u;
    *(_OWORD *)(v12 + 16) = 0u;
    *(_BYTE *)(v12 + 32) = 1;
    swift_beginAccess();
    *(_QWORD *)(v11 + 8) = &protocol witness table for HUControllableItemCollectionViewController;
    swift_unknownObjectWeakAssign();
    *(_QWORD *)(v10 + qword_1EF20B748) = v9;
    v13 = v9;
    v14 = sub_1B93EC68C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    objc_allocWithZone((Class)type metadata accessor for DashboardAccessoryControlViewController(0));
    v4 = sub_1B8F28BA8(v6, v16, v14);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void *))(v0 + 8))(v4);
}

uint64_t sub_1B901B288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_1B93EE06C();
  v4[6] = sub_1B93EE060();
  sub_1B93EE018();
  return swift_task_switch();
}

uint64_t sub_1B901B2F8()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;

  v1 = (void *)v0[5];
  v3 = (void *)v0[3];
  v2 = (const void *)v0[4];
  v4 = (void *)v0[2];
  swift_release();
  v0[7] = (uint64_t)_Block_copy(v2);
  v5 = v4;
  v6 = v3;
  v7 = v1;
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_1B8F6C1C0;
  return sub_1B901AE30(v0[2], v0[3]);
}

id StatusDetailsViewController.__allocating_init(itemManager:collectionViewLayout:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithItemManager_collectionViewLayout_, a1, a2);

  return v5;
}

void StatusDetailsViewController.init(itemManager:collectionViewLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StatusDetailsViewController.__allocating_init(usingCompositionalLayoutWith:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initUsingCompositionalLayoutWithItemManager_, a1);

  return v3;
}

void StatusDetailsViewController.init(usingCompositionalLayoutWith:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StatusDetailsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t StatusDetailsViewController.displayedItems(inSection:)()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_itemManager);
  v2 = (void *)sub_1B93EDD84();
  v3 = objc_msgSend(v1, sel_displayedItemsInSectionWithIdentifier_, v2);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  v4 = sub_1B93EDF4C();

  return v4;
}

Swift::Bool __swiftcall StatusDetailsViewController.shouldShowHeader(forSection:)(Swift::String forSection)
{
  return 1;
}

void __swiftcall StatusDetailsViewController.transform(_:)(HUGridLayoutOptions *__return_ptr retstr, HUGridLayoutOptions *a2)
{
  HUGridLayoutOptions *v2;

  -[HUGridLayoutOptions setSectionTopMargin:](a2, sel_setSectionTopMargin_, 0.0);
  v2 = a2;
}

Swift::Void __swiftcall StatusDetailsViewController.aboutResidentDeviceViewControllerDidFinish(_:)(HUAboutResidentDeviceViewController_optional *a1)
{
  void *v1;

  objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id StatusDetailsViewController.textView(_:shouldInteractWith:in:interaction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B901C074(a2, a5);
}

uint64_t sub_1B901BA0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1B8E96968;
  return v6();
}

uint64_t sub_1B901BA60(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1B8E96968;
  return v7();
}

uint64_t sub_1B901BAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B93EE090();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B93EE084();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B8E26870(a1, (uint64_t *)&unk_1ED57F900);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B93EE018();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1B901BC00()
{
  char *v0;
  char *v1;
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  char *v5;
  uint8_t *v6;
  _QWORD *v7;
  char *v8;
  id v9;
  void *v10;
  char *v11;

  v1 = &v0[OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate];
  swift_beginAccess();
  v2 = (void *)MEMORY[0x1BCCC1DA8](v1);
  if (v2)
  {
    objc_msgSend(v2, sel_statusDetailsViewControllerDidFinish_, v0);
    swift_unknownObjectRelease();
  }
  else
  {
    v3 = sub_1B93EE21C();
    if (qword_1EF207838 != -1)
      swift_once();
    v4 = qword_1EF226E08;
    if (os_log_type_enabled((os_log_t)qword_1EF226E08, v3))
    {
      v5 = v0;
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v6 = 138412290;
      v11 = v5;
      v8 = v5;
      sub_1B93EE600();
      *v7 = v5;

      _os_log_impl(&dword_1B8E1E000, v4, v3, "%@ delegate is nil! Self-dismissing since Done button was pressed.", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
      swift_arrayDestroy();
      MEMORY[0x1BCCC1CD0](v7, -1, -1);
      MEMORY[0x1BCCC1CD0](v6, -1, -1);
    }
    v9 = objc_msgSend(v0, sel_presentingViewController, v11);
    if (v9)
    {
      v10 = v9;

    }
  }
}

uint64_t sub_1B901BDF0()
{
  void *v0;
  char v1;
  uint64_t result;
  void *v3;
  void *v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10[24];
  ValueMetadata *v11;
  unint64_t v12;
  void *v13;

  v13 = &unk_1EF2AC470;
  v0 = (void *)swift_dynamicCastObjCProtocolUnconditional();
  type metadata accessor for AccessoryDetailsRouter();
  v11 = &type metadata for HomeAppFeatures;
  v12 = sub_1B8EA6E84();
  v10[0] = 1;
  v1 = sub_1B93EB960();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if ((v1 & 1) != 0)
  {
    sub_1B8E23A60(0, (unint64_t *)&unk_1EF2110A0);
    if ((sub_1B93EE240() & 1) != 0)
    {
LABEL_3:
      result = sub_1B8F069C8(v0, 0, 0, 0);
      goto LABEL_15;
    }
    v3 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v3)
    {
      objc_msgSend(v3, sel_accessoryRepresentableObject);
      swift_getObjectType();
      if (sub_1B8F07400())
      {
        sub_1B8E23A60(0, (unint64_t *)&qword_1ED57EB20);
        v4 = (void *)sub_1B93EE378();
        v5 = objc_msgSend((id)objc_opt_self(), sel_serviceType_, *MEMORY[0x1E0CB9A80]);
        v6 = sub_1B93EE4EC();

        if ((v6 & 1) != 0)
        {
          v7 = sub_1B93EE3C0();
          v8 = v7;
          if ((v7 & 0xC000000000000001) != 0)
          {
            if (sub_1B93EE780() == 1)
              goto LABEL_9;
          }
          else if (*(_QWORD *)(v7 + 16) == 1)
          {
LABEL_9:
            v9 = (void *)sub_1B8F2BCD0(v8);
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            if (v9)
            {

              goto LABEL_3;
            }
            goto LABEL_14;
          }
          swift_bridgeObjectRelease();
        }
      }
      swift_unknownObjectRelease();
    }
  }
LABEL_14:
  result = (uint64_t)sub_1B8F076BC(v0);
LABEL_15:
  if (!result)
    __break(1u);
  return result;
}

unint64_t sub_1B901C01C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF207900;
  if (!qword_1EF207900)
  {
    v1 = sub_1B8E23A60(255, (unint64_t *)&unk_1EF20BD40);
    result = MEMORY[0x1BCCC1BE0](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF207900);
  }
  return result;
}

id sub_1B901C074(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  NSObject *v12;
  id v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(_BYTE *, uint64_t);
  uint64_t v26;
  id v27;
  id result;
  id v29;
  id v30;
  _BYTE v31[4];
  int v32;
  uint64_t v33;
  os_log_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = sub_1B93EB798();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v31[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v11 = &v31[-v10];
  if (qword_1EF207830 != -1)
    swift_once();
  v12 = qword_1EF226E00;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v11, a1, v5);
  v13 = v2;
  v14 = sub_1B93EE234();
  v15 = v14;
  if (!os_log_type_enabled(v12, v14))
  {

    v25 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
    v25(v11, v5);
    if (!a2)
      goto LABEL_7;
    return 0;
  }
  v16 = swift_slowAlloc();
  v34 = v12;
  v17 = v16;
  v18 = swift_slowAlloc();
  v33 = v6;
  v19 = (_QWORD *)v18;
  v35 = swift_slowAlloc();
  v38 = (uint64_t)v13;
  v39 = v35;
  *(_DWORD *)v17 = 138412546;
  v32 = v15;
  v36 = v8;
  v37 = a1;
  v20 = a2;
  v21 = v13;
  v22 = v13;
  sub_1B93EE600();
  *v19 = v21;

  v13 = v21;
  *(_WORD *)(v17 + 12) = 2080;
  sub_1B8F4B928();
  v23 = sub_1B93EEAE0();
  v38 = sub_1B8E3489C(v23, v24, &v39);
  v8 = v36;
  a1 = v37;
  sub_1B93EE600();
  swift_bridgeObjectRelease();
  v25 = *(void (**)(_BYTE *, uint64_t))(v33 + 8);
  v25(v11, v5);
  _os_log_impl(&dword_1B8E1E000, v34, (os_log_type_t)v32, "%@: User tapped URL: %s", (uint8_t *)v17, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
  swift_arrayDestroy();
  MEMORY[0x1BCCC1CD0](v19, -1, -1);
  v26 = v35;
  swift_arrayDestroy();
  MEMORY[0x1BCCC1CD0](v26, -1, -1);
  MEMORY[0x1BCCC1CD0](v17, -1, -1);
  if (v20)
    return 0;
LABEL_7:
  v27 = objc_msgSend((id)objc_opt_self(), sel_aboutResidentDeviceURL);
  sub_1B93EB780();

  LOBYTE(v27) = MEMORY[0x1BCCBD524](a1, v8);
  v25(v8, v5);
  if ((v27 & 1) == 0)
  {
    v29 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v30 = (id)sub_1B93EB768();

    goto LABEL_11;
  }
  result = objc_msgSend(objc_allocWithZone((Class)HUAboutResidentDeviceViewController), sel_initWithStyle_, 1);
  if (result)
  {
    v29 = result;
    objc_msgSend(result, sel_setDelegate_, v13);
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA7B8]), sel_initWithRootViewController_, v29);
    objc_msgSend(v30, sel_setModalPresentationStyle_, 2);
    objc_msgSend(v13, sel_presentViewController_animated_completion_, v30, 1, 0);
LABEL_11:

    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B901C458@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate;
  swift_beginAccess();
  result = MEMORY[0x1BCCC1DA8](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1B901C4AC()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t method lookup function for StatusDetailsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StatusDetailsViewController.statusDetailsDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of StatusDetailsViewController.statusDetailsDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of StatusDetailsViewController.statusDetailsDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of StatusDetailsViewController.__allocating_init(statusItem:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1B901C568()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1B901C5A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1B8E93FE8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EF211058 + dword_1EF211058))(v2, v3, v5, v4);
}

uint64_t sub_1B901C624()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B901C648(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B8E93FE8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF211088 + dword_1EF211088))(a1, v4);
}

BOOL sub_1B901C6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services);
  swift_getObjectType();
  sub_1B93ECF74();
  v2 = sub_1B93EE3A8();
  v3 = sub_1B8F0F1F8(v2, v1);
  swift_bridgeObjectRelease();
  if ((v3 & 0xC000000000000001) != 0)
    v4 = sub_1B93EE780();
  else
    v4 = *(_QWORD *)(v3 + 16);
  swift_release();
  return v4 > 0;
}

uint64_t sub_1B901C748(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t inited;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;

  v4 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_selectedItems);
  swift_beginAccess();
  v14 = *v4;
  swift_getObjectType();
  sub_1B93ECF74();
  *(_QWORD *)(v2 + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services) = sub_1B93EE3A8();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B9436B60;
  *(_QWORD *)(inited + 32) = a2;
  v13 = inited;
  sub_1B93EDF64();
  if (v13 >> 62)
  {
    v10 = a2;
    sub_1B93ECF74();
    v11 = sub_1B93EE9F0();
    swift_bridgeObjectRelease();
    if (v11)
      goto LABEL_3;
LABEL_5:
    v9 = MEMORY[0x1E0DEE9E8];
    goto LABEL_6;
  }
  v6 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = a2;
  if (!v6)
    goto LABEL_5;
LABEL_3:
  sub_1B8E93470(v13);
  v9 = v8;
LABEL_6:
  swift_bridgeObjectRelease();
  *v4 = v9;
  swift_bridgeObjectRelease();
  sub_1B8E8BA24(&v13, a2);

  return v14;
}

uint64_t sub_1B901C8B0(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v3 = v2;
  v5 = &v3[OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_selectedItems];
  swift_beginAccess();
  v16 = *(_QWORD *)v5;
  sub_1B93ECF74();
  sub_1B8E8BA24(&v15, a2);

  swift_getObjectType();
  v6 = sub_1B93EE3A8();
  v7 = v3;
  sub_1B901D0AC(v6, (uint64_t)v7);
  v9 = v8;
  swift_bridgeObjectRelease();

  if ((v9 & 1) != 0)
  {
    if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0)
    {
      v12 = MEMORY[0x1E0DEE9D8];
      if (sub_1B93EE9F0())
        sub_1B8E95E54(MEMORY[0x1E0DEE9D8]);
      else
        v13 = MEMORY[0x1E0DEE9E8];
      *(_QWORD *)&v7[OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services] = v13;
      swift_bridgeObjectRelease();
      if ((v12 & 0xC000000000000000) != 0 && sub_1B93EE9F0())
      {
        sub_1B8E93470(MEMORY[0x1E0DEE9D8]);
        v10 = v14;
      }
      else
      {
        v10 = MEMORY[0x1E0DEE9E8];
      }
    }
    else
    {
      v10 = MEMORY[0x1E0DEE9E8];
      *(_QWORD *)&v7[OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services] = MEMORY[0x1E0DEE9E8];
      swift_bridgeObjectRelease();
    }
    *(_QWORD *)v5 = v10;
    swift_bridgeObjectRelease();
  }
  return v16;
}

void sub_1B901CA34(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char v20;
  void *v21;
  int64_t v22;
  _QWORD *v23;
  void *v24;
  id v25[12];

  v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_selectedItems);
  swift_beginAccess();
  v4 = *v3;
  sub_1B93ECF74();
  *v3 = sub_1B8F0EB50(a1, v4);
  swift_bridgeObjectRelease();
  v25[3] = (id)MEMORY[0x1E0DEE9E8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
    sub_1B93EE138();
    a1 = (uint64_t)v25[7];
    v23 = v25[8];
    v5 = (uint64_t)v25[9];
    v6 = v25[10];
    v7 = (unint64_t)v25[11];
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v23 = (_QWORD *)(a1 + 56);
    v5 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v6 = 0;
  }
  v22 = (unint64_t)(v5 + 64) >> 6;
  while (a1 < 0)
  {
    v15 = sub_1B93EE7A4();
    if (!v15)
      goto LABEL_35;
    v24 = (void *)v15;
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v16 = v25[0];
    swift_unknownObjectRelease();
    v14 = (char *)v6;
    v12 = v7;
    if (!v16)
      goto LABEL_35;
LABEL_32:
    _s14descr1E6F4C011V26DefaultSelectionControllerCMa();
    sub_1B901D070(&qword_1EF211150, (uint64_t)&unk_1B9441C6C);
    if ((sub_1B93ECBA8() & 1) != 0)
    {
      swift_beginAccess();
      v20 = sub_1B8E8BA24(&v24, v16);
      v21 = v24;
      swift_endAccess();

      if ((v20 & 1) != 0)
      {
LABEL_9:
        sub_1B8E8BA24(v25, v16);

        goto LABEL_10;
      }
    }
    else
    {
      swift_beginAccess();
      v11 = (void *)sub_1B8E8EC90(v16);
      swift_endAccess();

      if (v11)
        goto LABEL_9;
    }

LABEL_10:
    v6 = v14;
    v7 = v12;
  }
  if (v7)
  {
    v12 = (v7 - 1) & v7;
    v13 = __clz(__rbit64(v7)) | ((_QWORD)v6 << 6);
    v14 = (char *)v6;
LABEL_31:
    v16 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v13);
    if (!v16)
      goto LABEL_35;
    goto LABEL_32;
  }
  v17 = (uint64_t)v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v22)
      goto LABEL_35;
    v18 = v23[v17];
    v14 = (char *)v6 + 1;
    if (!v18)
    {
      v14 = (char *)v6 + 2;
      if ((uint64_t)v6 + 2 >= v22)
        goto LABEL_35;
      v18 = v23[(_QWORD)v14];
      if (!v18)
      {
        v14 = (char *)v6 + 3;
        if ((uint64_t)v6 + 3 >= v22)
          goto LABEL_35;
        v18 = v23[(_QWORD)v14];
        if (!v18)
        {
          v14 = (char *)v6 + 4;
          if ((uint64_t)v6 + 4 >= v22)
            goto LABEL_35;
          v18 = v23[(_QWORD)v14];
          if (!v18)
          {
            v19 = (char *)v6 + 5;
            while ((char *)v22 != v19)
            {
              v18 = v23[(_QWORD)v19++];
              if (v18)
              {
                v14 = v19 - 1;
                goto LABEL_30;
              }
            }
LABEL_35:
            sub_1B8E7A20C();
            return;
          }
        }
      }
    }
LABEL_30:
    v12 = (v18 - 1) & v18;
    v13 = __clz(__rbit64(v18)) + ((_QWORD)v14 << 6);
    goto LABEL_31;
  }
  __break(1u);
}

id sub_1B901CE30()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)_s14descr1E6F4C011V26DefaultSelectionControllerCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s14descr1E6F4C011V26DefaultSelectionControllerCMa()
{
  return objc_opt_self();
}

uint64_t sub_1B901CEB8()
{
  return sub_1B901D070((unint64_t *)&qword_1EF20DA28, (uint64_t)&unk_1B9441CB4);
}

uint64_t sub_1B901CEE0(uint64_t a1, void *a2)
{
  return sub_1B901C748(a1, a2);
}

uint64_t sub_1B901CEF4(uint64_t a1, void *a2)
{
  return sub_1B901C8B0(a1, a2);
}

uint64_t sub_1B901CF08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0D2FDA0];
  v3 = sub_1B93EC998();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1B901CF4C()
{
  MEMORY[0x1BCCC1BE0](&unk_1B9441C6C);
  return sub_1B93ECBCC();
}

uint64_t sub_1B901CF98()
{
  MEMORY[0x1BCCC1BE0](&unk_1B9441C6C);
  return sub_1B93ECBD8();
}

uint64_t sub_1B901CFE4()
{
  MEMORY[0x1BCCC1BE0](&unk_1B9441C6C);
  return sub_1B93ECBA8();
}

uint64_t sub_1B901D024()
{
  MEMORY[0x1BCCC1BE0](&unk_1B9441C6C);
  return sub_1B93ECBC0();
}

uint64_t sub_1B901D070(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = _s14descr1E6F4C011V26DefaultSelectionControllerCMa();
    result = MEMORY[0x1BCCC1BE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1B901D0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  char v25;
  uint64_t v26;
  id v27;
  char v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  unint64_t v39;
  void *v40;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
    sub_1B8E48724((unint64_t *)&qword_1EF20ADA0, (unint64_t *)&qword_1EF2082C0);
    sub_1B93EE138();
    v3 = v35;
    v4 = v36;
    v5 = v37;
    v6 = v38;
    v7 = v39;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v4 = a1 + 56;
    v9 = ~v8;
    v10 = -v8;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v7 = v11 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v5 = v9;
    v6 = 0;
  }
  v33 = (unint64_t)(v5 + 64) >> 6;
  v32 = a2;
  v30 = v4;
  v31 = v3;
  while (1)
  {
    v14 = v6;
    if (v3 < 0)
    {
      if (!sub_1B93EE7A4())
        goto LABEL_46;
      sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v17 = v40;
      swift_unknownObjectRelease();
      if (!v40)
        goto LABEL_46;
      goto LABEL_27;
    }
    if (!v7)
      break;
    v15 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v16 = v15 | (v6 << 6);
LABEL_26:
    v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    if (!v17)
      goto LABEL_46;
LABEL_27:
    v34 = v7;
    v20 = *(_QWORD *)(a2
                    + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services);
    if ((v20 & 0xC000000000000001) != 0)
    {
      sub_1B93ECF74();
      v12 = v17;
      v13 = sub_1B93EE7B0();
      swift_bridgeObjectRelease();

      v7 = v34;
      if ((v13 & 1) != 0)
        goto LABEL_46;
    }
    else if (*(_QWORD *)(v20 + 16))
    {
      sub_1B93ECF74();
      v21 = sub_1B93EE4E0();
      v22 = -1 << *(_BYTE *)(v20 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v20 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
        v24 = *(id *)(*(_QWORD *)(v20 + 48) + 8 * v23);
        v25 = sub_1B93EE4EC();

        if ((v25 & 1) != 0)
        {
LABEL_45:

          swift_bridgeObjectRelease();
LABEL_46:
          sub_1B8E7A20C();
          return;
        }
        v26 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v26;
          if (((*(_QWORD *)(v20 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v27 = *(id *)(*(_QWORD *)(v20 + 48) + 8 * v23);
          v28 = sub_1B93EE4EC();

          if ((v28 & 1) != 0)
            goto LABEL_45;
        }

        swift_bridgeObjectRelease();
        v4 = v30;
        v3 = v31;
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      a2 = v32;
      v7 = v34;
    }
    else
    {

      v7 = v34;
    }
  }
  ++v6;
  if (!__OFADD__(v14, 1))
  {
    if (v6 >= v33)
      goto LABEL_46;
    v18 = *(_QWORD *)(v4 + 8 * v6);
    if (!v18)
    {
      v19 = v14 + 2;
      if (v14 + 2 >= v33)
        goto LABEL_46;
      v18 = *(_QWORD *)(v4 + 8 * v19);
      if (v18)
        goto LABEL_24;
      v19 = v14 + 3;
      if (v14 + 3 >= v33)
        goto LABEL_46;
      v18 = *(_QWORD *)(v4 + 8 * v19);
      if (v18)
        goto LABEL_24;
      v19 = v14 + 4;
      if (v14 + 4 >= v33)
        goto LABEL_46;
      v18 = *(_QWORD *)(v4 + 8 * v19);
      if (v18)
      {
LABEL_24:
        v6 = v19;
      }
      else
      {
        v6 = v14 + 5;
        if (v14 + 5 >= v33)
          goto LABEL_46;
        v18 = *(_QWORD *)(v4 + 8 * v6);
        if (!v18)
        {
          v29 = v14 + 6;
          while (v33 != v29)
          {
            v18 = *(_QWORD *)(v4 + 8 * v29++);
            if (v18)
            {
              v6 = v29 - 1;
              goto LABEL_25;
            }
          }
          goto LABEL_46;
        }
      }
    }
LABEL_25:
    v7 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v6 << 6);
    goto LABEL_26;
  }
  __break(1u);
}

id HUUserNotificationTopicServiceListViewController.buildSwiftItemModuleControllerForModule(_:)(void *a1)
{
  unsigned int v2;
  id result;

  type metadata accessor for ActivityLogItemModule();
  v2 = objc_msgSend(a1, sel_isKindOfClass_, swift_getObjCClassFromMetadata());
  result = 0;
  if (v2)
    return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityLogSettingsModuleController()), sel_initWithModule_, a1);
  return result;
}

void sub_1B901D5FC(uint64_t a1)
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
  id v11;
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
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
    sub_1B8E48724((unint64_t *)&qword_1EF20ADA0, (unint64_t *)&qword_1EF2082C0);
    sub_1B93EE138();
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
    sub_1B93ECF74();
    v3 = 0;
  }
  v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    v12 = v3;
    if (v1 < 0)
    {
      if (!sub_1B93EE7A4())
        goto LABEL_33;
      sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v10 = v23;
      swift_unknownObjectRelease();
      if (!v23)
        goto LABEL_33;
      goto LABEL_10;
    }
    if (!v4)
      break;
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v9 = v8 | (v3 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v10)
      goto LABEL_33;
LABEL_10:
    v11 = objc_msgSend(v10, sel_hf_serviceGroup);

    if (v11)
    {

LABEL_33:
      sub_1B8E7A20C();
      return;
    }
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16)
      goto LABEL_33;
    v14 = *(_QWORD *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      v3 = v12 + 2;
      if (v12 + 2 >= v16)
        goto LABEL_33;
      v14 = *(_QWORD *)(v17 + 8 * v3);
      if (!v14)
      {
        v3 = v12 + 3;
        if (v12 + 3 >= v16)
          goto LABEL_33;
        v14 = *(_QWORD *)(v17 + 8 * v3);
        if (!v14)
        {
          v3 = v12 + 4;
          if (v12 + 4 >= v16)
            goto LABEL_33;
          v14 = *(_QWORD *)(v17 + 8 * v3);
          if (!v14)
          {
            v3 = v12 + 5;
            if (v12 + 5 >= v16)
              goto LABEL_33;
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
              goto LABEL_33;
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

char *sub_1B901D900(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  objc_super v21;

  *(_QWORD *)&v1[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_nameAndIconItem] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementItemModule] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_staticItemProvider] = 0;
  v3 = OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementContext;
  v4 = objc_allocWithZone(MEMORY[0x1E0D315E8]);
  v5 = v1;
  v6 = objc_msgSend(v4, sel_init);
  v7 = objc_allocWithZone((Class)type metadata accessor for AccessoryRepresentableItemModule.Context());
  v8 = sub_1B8ED4880(4, 0, 1, 1, 0, v6, 0, 0, 0, 0, v7);

  *(_QWORD *)&v1[v3] = v8;
  type metadata accessor for ServiceGroupSelectionController();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController] = v9;
  v10 = a1;
  v11 = objc_msgSend(v10, sel_serviceGroup);
  v12 = v11;
  if (v11)

  v5[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_creatingNew] = v12 == 0;
  v21.receiver = v5;
  v21.super_class = (Class)type metadata accessor for ServiceGroupEditorItemManager();
  v13 = (char *)objc_msgSendSuper2(&v21, sel_initWithDelegate_sourceItem_, 0, 0);
  v14 = *(char **)&v13[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementContext];
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (uint64_t *)&v14[OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter];
  swift_beginAccess();
  v17 = *v16;
  *v16 = (uint64_t)sub_1B901EFC8;
  v16[1] = v15;
  v18 = v13;
  v19 = v14;
  swift_retain();
  sub_1B8E6FE50(v17);

  swift_release();
  return v18;
}

uint64_t sub_1B901DAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  char v9;
  char v10;
  id v11;
  char v12;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1BCCC1DA8](v2);
  if (v3)
  {
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      swift_getObjectType();
      v4 = sub_1B93EE3A8();
      v5 = v4;
      if ((v4 & 0xC000000000000001) != 0)
      {
        if (!sub_1B93EE780())
          goto LABEL_11;
      }
      else if (!*(_QWORD *)(v4 + 16))
      {
LABEL_11:

        swift_bridgeObjectRelease();
        LOBYTE(v3) = 0;
        return v3 & 1;
      }
      v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController);
      swift_beginAccess();
      v7 = objc_msgSend(*(id *)(v6 + 16), sel_services);
      sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
      v8 = sub_1B93EDF4C();

      sub_1B93ECF74();
      v9 = sub_1B901EB04(v8, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v9 & 1) == 0)
      {
        sub_1B901D5FC(v5);
        if ((v10 & 1) == 0)
        {
          v11 = (id)v3;
          sub_1B901E7E4(v5, (uint64_t)v11);
          LOBYTE(v3) = v12;
          swift_bridgeObjectRelease();

          return v3 & 1;
        }
        goto LABEL_11;
      }

      swift_bridgeObjectRelease();
      LOBYTE(v3) = 1;
    }
    else
    {

      LOBYTE(v3) = 0;
    }
  }
  return v3 & 1;
}

id sub_1B901DCB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  char isUniquelyReferenced_nonNull_native;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  id v19;
  _OWORD v21[2];
  __int128 v22;
  uint64_t ObjectType;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1BCCC1DA8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController);
    swift_beginAccess();
    v5 = objc_msgSend(*(id *)(v4 + 16), sel_primaryServiceType);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend((id)objc_opt_self(), sel_defaultIconDescriptorForServiceType_serviceSubtype_, v5, 0);

      v8 = (void *)*MEMORY[0x1E0D30C60];
      ObjectType = swift_getObjectType();
      *(_QWORD *)&v22 = v7;
      sub_1B8E382C8(&v22, v21);
      v9 = v8;
      swift_unknownObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1B8E37A40(v21, v9, isUniquelyReferenced_nonNull_native);
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
    v11 = (id)*MEMORY[0x1E0D30D28];
    v12 = (void *)sub_1B93EDD84();
    v13 = HULocalizedString(v12);

    v14 = sub_1B93EDDB4();
    v16 = v15;

    ObjectType = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v22 = v14;
    *((_QWORD *)&v22 + 1) = v16;
    sub_1B8E382C8(&v22, v21);
    v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B8E37A40(v21, v11, v17);

    swift_bridgeObjectRelease();
    type metadata accessor for HFItemResultKey(0);
    sub_1B8E2C710((unint64_t *)&qword_1ED57E960, (uint64_t (*)(uint64_t))type metadata accessor for HFItemResultKey, (uint64_t)&unk_1B9437094);
    v18 = (void *)sub_1B93EDCE8();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, v18);

  }
  else
  {
    sub_1B8E23A60(0, &qword_1EF20DE38);
    v18 = (void *)sub_1B93EE1E0();
    v19 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, v18);
  }

  return v19;
}

uint64_t sub_1B901DFDC(void *a1)
{
  char *v1;
  void *v3;
  char *v4;
  id v5;
  id v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v16;

  v16 = MEMORY[0x1E0DEE9D8];
  v3 = *(void **)&v1[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementContext];
  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for AccessoryRepresentableItemModule());
  v5 = v3;
  v6 = a1;
  v7 = v1;
  v8 = sub_1B901E69C(v5, v6, v7, v4);
  v9 = *(_QWORD *)&v7[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController];
  v10 = sub_1B8E2C710(&qword_1EF210578, (uint64_t (*)(uint64_t))type metadata accessor for ServiceGroupSelectionController, (uint64_t)&protocol conformance descriptor for ServiceGroupSelectionController);
  v11 = &v8[OBJC_IVAR___HUAccessoryRepresentableItemModule_selectionController];
  swift_beginAccess();
  *(_QWORD *)v11 = v9;
  *((_QWORD *)v11 + 1) = v10;
  swift_retain();
  swift_unknownObjectRelease();
  v12 = *(void **)&v7[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementItemModule];
  *(_QWORD *)&v7[OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementItemModule] = v8;
  v13 = v8;

  v14 = v13;
  MEMORY[0x1BCCBFCCC]();
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B93EDF7C();
  sub_1B93EDFB8();
  sub_1B93EDF64();

  return v16;
}

uint64_t sub_1B901E1C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  v18 = MEMORY[0x1E0DEE9D8];
  v2 = *(void **)(v0 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_nameAndIconItem);
  if (v2)
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0D31570]);
    v4 = v2;
    v5 = (void *)sub_1B93EDD84();
    v6 = objc_msgSend(v3, sel_initWithIdentifier_, v5);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57EBD0);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1B9436B60;
    *(_QWORD *)(v7 + 32) = v4;
    v17 = v7;
    sub_1B93EDF64();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    v8 = v4;
    v9 = (void *)sub_1B93EDF34();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setItems_, v9, v17);

    v10 = v6;
    MEMORY[0x1BCCBFCCC]();
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B93EDF7C();
    sub_1B93EDFB8();
    sub_1B93EDF64();

  }
  v11 = *(void **)(v1 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementItemModule);
  if (v11)
  {
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
    v12 = v11;
    v13 = (void *)sub_1B93EE0D8();
    v14 = objc_msgSend(v12, sel_buildSectionsWithDisplayedItems_, v13);

    sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
    v15 = sub_1B93EDF4C();

    sub_1B8EFA988(v15);
  }
  return v18;
}

id sub_1B901E5E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceGroupEditorItemManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ServiceGroupEditorItemManager()
{
  return objc_opt_self();
}

char *sub_1B901E69C(void *a1, void *a2, void *a3, char *a4)
{
  char *v8;
  char *v9;
  char *v10;
  id v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  objc_super v17;

  v8 = &a4[OBJC_IVAR___HUAccessoryRepresentableItemModule_selectionController];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&a4[OBJC_IVAR___HUAccessoryRepresentableItemModule_accessoryItemProvider] = 0;
  *(_QWORD *)&a4[OBJC_IVAR___HUAccessoryRepresentableItemModule_context] = a1;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&a4[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType] = 1;
  swift_unknownObjectWeakAssign();
  v9 = &a4[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_itemProviderBlock];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v17.receiver = a4;
  v17.super_class = (Class)type metadata accessor for AccessoryItemModule();
  v10 = a1;
  v11 = objc_msgSendSuper2(&v17, sel_initWithItemUpdater_, a3);

  v12 = &v10[OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_sectionGroupingType];
  swift_beginAccess();
  v13 = *(_QWORD *)v12;
  v14 = (char *)v11;

  v15 = &v14[OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType];
  swift_beginAccess();
  *(_QWORD *)v15 = v13;

  return v14;
}

void sub_1B901E7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1B93ECF74();
    sub_1B93EE744();
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
    sub_1B8E48724((unint64_t *)&qword_1EF20ADA0, (unint64_t *)&qword_1EF2082C0);
    sub_1B93EE138();
    v3 = v20;
    v19 = v21;
    v4 = v22;
    v5 = v23;
    v6 = v24;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v19 = a1 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a1 + 56);
    sub_1B93ECF74();
    v5 = 0;
  }
  v18 = (unint64_t)(v4 + 64) >> 6;
  while (1)
  {
    v14 = v5;
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!sub_1B93EE7A4())
      goto LABEL_31;
    sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v25;
    swift_unknownObjectRelease();
    if (!v25)
      goto LABEL_31;
LABEL_10:
    v13 = *(_QWORD *)(a2 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController);
    swift_beginAccess();
    LODWORD(v13) = objc_msgSend(*(id *)(v13 + 16), sel_shouldAllowAddingService_, v12);

    if ((_DWORD)v13)
      goto LABEL_31;
  }
  if (v6)
  {
    v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v11 = v10 | (v5 << 6);
LABEL_9:
    v12 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v11);
    if (!v12)
      goto LABEL_31;
    goto LABEL_10;
  }
  v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v18)
      goto LABEL_31;
    v16 = *(_QWORD *)(v19 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v14 + 2;
      if (v14 + 2 >= v18)
        goto LABEL_31;
      v16 = *(_QWORD *)(v19 + 8 * v5);
      if (!v16)
      {
        v5 = v14 + 3;
        if (v14 + 3 >= v18)
          goto LABEL_31;
        v16 = *(_QWORD *)(v19 + 8 * v5);
        if (!v16)
        {
          v5 = v14 + 4;
          if (v14 + 4 >= v18)
            goto LABEL_31;
          v16 = *(_QWORD *)(v19 + 8 * v5);
          if (!v16)
          {
            v5 = v14 + 5;
            if (v14 + 5 >= v18)
              goto LABEL_31;
            v16 = *(_QWORD *)(v19 + 8 * v5);
            if (!v16)
            {
              v17 = v14 + 6;
              while (v18 != v17)
              {
                v16 = *(_QWORD *)(v19 + 8 * v17++);
                if (v16)
                {
                  v5 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_1B8E7A20C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v6 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v5 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_1B901EB04(unint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v3 = a1;
  if (a1 >> 62)
    goto LABEL_24;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_1B93ECF74();
  for (; v4; v4 = sub_1B93EE9F0())
  {
    v5 = 0;
    v6 = v3 & 0xC000000000000001;
    v7 = a2 & 0xC000000000000001;
    v25 = v3;
    v26 = v3 + 32;
    v8 = a2 + 56;
    v23 = v3 & 0xC000000000000001;
    v24 = v4;
    while (1)
    {
      v11 = v6 ? (id)MEMORY[0x1BCCC05FC](v5, v3) : *(id *)(v26 + 8 * v5);
      v12 = v11;
      if (__OFADD__(v5++, 1))
        break;
      if (v7)
      {
        v9 = v11;
        v10 = sub_1B93EE7B0();

        if ((v10 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 1;
        }
        if (v5 == v4)
          goto LABEL_25;
      }
      else
      {
        if (*(_QWORD *)(a2 + 16))
        {
          v14 = sub_1B93EE4E0();
          v15 = -1 << *(_BYTE *)(a2 + 32);
          v16 = v14 & ~v15;
          if (((*(_QWORD *)(v8 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
          {
            sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
            v17 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v16);
            v18 = sub_1B93EE4EC();

            if ((v18 & 1) != 0)
            {
LABEL_20:
              swift_bridgeObjectRelease();

              return 1;
            }
            v19 = ~v15;
            while (1)
            {
              v16 = (v16 + 1) & v19;
              if (((*(_QWORD *)(v8 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
                break;
              v20 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v16);
              v21 = sub_1B93EE4EC();

              if ((v21 & 1) != 0)
                goto LABEL_20;
            }
          }
        }

        v4 = v24;
        v3 = v25;
        v7 = a2 & 0xC000000000000001;
        v6 = v23;
        if (v5 == v24)
          goto LABEL_25;
      }
    }
    __break(1u);
LABEL_24:
    sub_1B93ECF74();
  }
LABEL_25:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B901ED40()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v15[7];
  uint64_t v16;

  v1 = v0;
  v16 = MEMORY[0x1E0DEE9D8];
  v15[6] = (id)MEMORY[0x1E0DEE9E8];
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_creatingNew) == 1)
  {
    v2 = (void *)swift_allocObject();
    swift_unknownObjectWeakInit();
    v3 = objc_allocWithZone(MEMORY[0x1E0D31840]);
    v15[4] = sub_1B901EFC0;
    v15[5] = v2;
    v15[0] = (id)MEMORY[0x1E0C809B0];
    v15[1] = (id)1107296256;
    v15[2] = sub_1B8E36AA4;
    v15[3] = &block_descriptor_50;
    v4 = _Block_copy(v15);
    swift_retain();
    v5 = objc_msgSend(v3, sel_initWithResultsBlock_, v4);
    _Block_release(v4);
    swift_release();
    swift_release();
    v6 = *(void **)(v1 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_nameAndIconItem);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_nameAndIconItem) = v5;
    v7 = v5;

    sub_1B8E8BA24(v15, v7);
  }
  v8 = objc_allocWithZone(MEMORY[0x1E0D31848]);
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
  v9 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithItems_, v9);

  v11 = *(void **)(v1 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_staticItemProvider);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_staticItemProvider) = v10;
  v12 = v10;

  v13 = objc_msgSend(v12, sel_asGeneric);
  MEMORY[0x1BCCBFCCC]();
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B93EDF7C();
  sub_1B93EDFB8();
  sub_1B93EDF64();

  return v16;
}

uint64_t sub_1B901EF9C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_1B901EFC0()
{
  uint64_t v0;

  return sub_1B901DCB0(v0);
}

uint64_t sub_1B901EFC8(uint64_t a1)
{
  uint64_t v1;

  return sub_1B901DAFC(a1, v1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_1B9020EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9022244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B9025198(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1B9026FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B902709C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B902A4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B902A718(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B902DF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaPickerControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPickerController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPMediaPickerControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUMediaSelectionViewController.m"), 44, CFSTR("Unable to find class %s"), "MPMediaPickerController");

    __break(1u);
  }
}

void MediaPlayerLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HUMediaSelectionViewController.m"), 43, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getMPPlaybackArchiveConfigurationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPPlaybackArchiveConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED580578 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPPlaybackArchiveConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUMediaSelectionViewController.m"), 45, CFSTR("Unable to find class %s"), "MPPlaybackArchiveConfiguration");

    __break(1u);
  }
}

void sub_1B902EB94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9032840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90341B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B903474C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B9035904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B9035D60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9037748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9037A34(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void sub_1B9037C2C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B903A420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B903BCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B903EA14(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1B903ED48(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

HUQuickControlSliderMetrics *HUQuickControlSliderMetricsForControlSize(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  HUQuickControlSliderMetrics *v6;

  switch(a1)
  {
    case 0:
      v1 = HUQuickControlVerticalControlLargeCornerRadius;
      v2 = HUQuickControlVerticalControlLargeWidth;
      v3 = HUQuickControlVerticalControlLargeHeight;
      break;
    case 1:
      v1 = HUQuickControlVerticalControlRegularCornerRadius;
      v2 = HUQuickControlVerticalControlRegularWidth;
      v3 = HUQuickControlVerticalControlRegularHeight;
      break;
    case 2:
      v1 = HUQuickControlVerticalControlSmallCornerRadius;
      v2 = HUQuickControlVerticalControlSmallWidth;
      v3 = HUQuickControlVerticalControlSmallHeight;
      break;
    case 3:
      v1 = HUQuickControlVerticalControlExtraSmallCornerRadius;
      v2 = HUQuickControlVerticalControlExtraSmallWidth;
      v3 = HUQuickControlVerticalControlExtraSmallHeight;
      break;
    default:
      v3 = 0;
      v2 = 0;
      *(double *)&v1 = 0.0;
      break;
  }
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 1, *(double *)&v2, *(double *)&v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicSize");
  v6 = -[HUQuickControlSliderMetrics initWithSizeDescriptor:cornerRadius:widthToCornerRadiusRatio:]([HUQuickControlSliderMetrics alloc], "initWithSizeDescriptor:cornerRadius:widthToCornerRadiusRatio:", v4, *(double *)&v1, *(double *)&v1 / v5);

  return v6;
}

HUQuickControlStepperViewMetrics *HUQuickControlStepperViewMetricsForOrientation(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  HUQuickControlStepperViewMetrics *v10;

  if ((unint64_t)(a1 - 2) < 2)
  {
    v4 = HUQuickControlVerticalControlSmallCornerRadius;
    v6 = *(double *)&HUQuickControlVerticalControlSmallWidth;
    if (a2)
    {
      v5 = *(double *)&HUQuickControlHorizontalStepperViewSmallHeight;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (a1 == 1)
  {
    v4 = HUQuickControlVerticalControlRegularCornerRadius;
    v6 = *(double *)&HUQuickControlVerticalControlRegularWidth;
    if (a2)
    {
      v5 = *(double *)&HUQuickControlHorizontalStepperViewRegularHeight;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *(double *)&v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if (!a1)
  {
    v4 = HUQuickControlVerticalControlLargeCornerRadius;
    v6 = *(double *)&HUQuickControlVerticalControlLargeWidth;
    v5 = *(double *)&HUQuickControlVerticalControlLargeHeight;
  }
  if (!a2)
LABEL_11:
    v5 = v6 / 1.15999997 * (double)a3;
LABEL_12:
  v7 = v6 * 0.6;
  if ((unint64_t)(a2 - 1) >= 2)
  {
    v8 = *(double *)&v4;
  }
  else
  {
    v6 = v5 * 1.07;
    v5 = v7;
    v8 = *(double *)&v4 * 0.6;
  }
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 1, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUQuickControlStepperViewMetrics initWithSizeDescriptor:orientation:cornerRadius:]([HUQuickControlStepperViewMetrics alloc], "initWithSizeDescriptor:orientation:cornerRadius:", v9, a2, v8);

  return v10;
}

HUQuickControlRingSliderMetrics *HUQuickControlRingSliderMetricsForControlSize(unint64_t a1)
{
  double v1;
  double v2;
  void *v3;
  HUQuickControlRingSliderMetrics *v4;

  v1 = 0.0;
  if (a1 <= 3)
    v1 = dbl_1B9441EB0[a1];
  v2 = v1 * 0.5;
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 1, v1, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUQuickControlRingSliderMetrics initWithSizeDescriptor:outerRadius:]([HUQuickControlRingSliderMetrics alloc], "initWithSizeDescriptor:outerRadius:", v3, v2);

  return v4;
}

id HUQuickControlColorViewMetricsForControlSizeModeAndOrientation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int32x2_t v3;
  int64x2_t v4;
  int64x2_t v5;
  void *v11;
  void *v12;

  if (a2 == 1)
  {
    HUQuickControlSliderMetricsForControlSize(a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a2)
  {
    v11 = 0;
  }
  else
  {
    v3 = vdup_n_s32(a3 == 0);
    v4.i64[0] = v3.u32[0];
    v4.i64[1] = v3.u32[1];
    v5 = (int64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v4, 0x3FuLL)), (int8x16_t)xmmword_1B9441E20, (int8x16_t)xmmword_1B9441EF0);
    __asm { FMOV            V3.2S, #4.5 }
    +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 1, vmlaq_n_f64(vcvtq_f64_f32(vmul_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v5, vdupq_n_s64(1uLL)))), _D3)), vcvtq_f64_u64((uint64x2_t)v5), *(double *)&HUQuickControlPushButtonSmallDiameter));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

HUQuickControlPushButtonMetrics *HUQuickControlPushButtonMetricsForControlSize(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  HUQuickControlPushButtonMetrics *v3;

  if ((unint64_t)(a1 - 2) < 2)
  {
    v1 = HUQuickControlPushButtonSmallDiameter;
  }
  else if (a1 == 1)
  {
    v1 = HUQuickControlPushButtonRegularDiameter;
  }
  else
  {
    v1 = 0;
    if (!a1)
      v1 = HUQuickControlPushButtonLargeDiameter;
  }
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 1, *(double *)&v1, *(double *)&v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HUQuickControlPushButtonMetrics initWithSizeDescriptor:]([HUQuickControlPushButtonMetrics alloc], "initWithSizeDescriptor:", v2);

  return v3;
}

HUQuickControlIconViewMetrics *HUQuickControlIconViewMetricsForControlSize(uint64_t a1, double a2)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  HUQuickControlIconViewMetrics *v6;

  v2 = 120.0;
  if (a1 == 1)
    v2 = 280.0;
  v3 = 330.0;
  if (a1)
    v3 = v2;
  v4 = 100.0;
  if (a2 > 0.0)
    v4 = a2;
  +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUQuickControlIconViewMetrics initWithSizeDescriptor:]([HUQuickControlIconViewMetrics alloc], "initWithSizeDescriptor:", v5);

  return v6;
}

double HUQuickControlIconViewMaxWidth(uint64_t a1)
{
  double result;

  result = 120.0;
  if (a1 == 1)
    result = 280.0;
  if (!a1)
    return 330.0;
  return result;
}

const __CFString *HUQuickControlReachabilityString(unint64_t a1)
{
  if (a1 > 2)
    return &stru_1E6F60E80;
  else
    return off_1E6F4D4B0[a1];
}

void sub_1B9043F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v18 - 152));
  _Unwind_Resume(a1);
}

void sub_1B904BDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B904E7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9052E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9054A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1B905616C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9058DFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9058F68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B905D678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _HUInfoCellImageMargin()
{
  return 24.0;
}

BOOL HUColorWheelCoordinateIsValid(double a1, double a2)
{
  return a2 != 1.79769313e308 || a1 != 1.79769313e308;
}

void sub_1B9066528(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1B906AE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B906F4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1B906F748(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B906FAB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9071DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B9074C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *location)
{
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(a16);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(location);
  objc_destroyWeak(a17);
  objc_destroyWeak((id *)&STACK[0x230]);
  _Unwind_Resume(a1);
}

void sub_1B9078788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1B9079918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9079D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B907A704(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B907B944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B907BA30(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B907BFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B907C0D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B907C5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9081118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90816D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9082CC4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B9089EA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B908B804(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1B908D1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  id *v38;

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90952A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9096B58(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id _HUPreloadViewController(void *a1, char a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(_QWORD);
  uint64_t *v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[4];
  id v39;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NAFuture *_HUPreloadViewController(UIViewController *__strong, BOOL, NAFuture *(^__strong)(void))");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("UIViewController+HUPreloading.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NAFuture *_HUPreloadViewController(UIViewController *__strong, BOOL, NAFuture *(^__strong)(void))");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UIViewController+HUPreloading.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationBlock"));

LABEL_3:
  v8 = v5;
  v9 = &unk_1EF230988;
  if (objc_msgSend(v8, "conformsToProtocol:", v9))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "hu_preloadContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = ___HUPreloadViewController_block_invoke;
    v38[3] = &unk_1E6F4F280;
    v14 = v12;
    v39 = v14;
    objc_msgSend(v8, "_beginDelayingPresentation:cancellationHandler:", v38, 10.0);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__4;
    v36 = __Block_byref_object_dispose__4;
    v37 = 0;
    if ((a2 & 1) == 0)
    {
      v7[2](v7);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v33[5];
      v33[5] = v15;

    }
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = ___HUPreloadViewController_block_invoke_53;
    v27[3] = &unk_1E6F4F2A8;
    v31 = a2;
    v30 = &v32;
    v29 = v7;
    v17 = v8;
    v28 = v17;
    objc_msgSend(v14, "flatMap:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = ___HUPreloadViewController_block_invoke_2;
    v25[3] = &unk_1E6F4F2D0;
    v26 = v17;
    objc_msgSend(v18, "recover:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v7[2](v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

void sub_1B9097210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B9098F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B909A8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B909D318(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1B909F270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B909FAAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B909FDC0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id HURoomForDashboardSectionIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  HURoomIdentifierForDashboardSectionIdentifier(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "hf_roomWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id HUDashboardAccessoryCategorySectionIdentifierForAccessoryTypeGroup(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("accessoryCategorySection"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void HUColorWheelCoordinateForPoint(double a1, double a2)
{
  double v4;
  double v5;

  UIRectGetCenter();
  atan2(v4 - a2, a1 - v5);
}

void sub_1B90A63C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_1B90A7464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90A9324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90A96B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B90AA150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B90AC0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90AC598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90AD4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90AD580(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B90AF798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90B079C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90B1708(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B90B1DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90B2B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90B30B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B90B343C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t HUIsLightColor(void *a1)
{
  id v1;
  double v2;
  int v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "_luminance");
  if (v2 <= 0.95)
    v3 = HFIsColorLighter();
  else
    v3 = 1;
  v4 = v3 | HFIsNearYellow();

  return v4;
}

void sub_1B90BAD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90BAEE8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B90BB89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B90BD190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90BD7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90C4444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90C6AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1B90C9AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CA02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CA82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CAE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CB3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CCC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CD434(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B90CDE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90CF834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B90D32D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90D6520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  if (v26)
    (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1B90D6A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  if (v26)
    (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B90D9EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_1B90DE820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *location)
{
  uint64_t v19;

  objc_destroyWeak(a15);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v19 - 208));
  _Unwind_Resume(a1);
}

void sub_1B90E19C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90E24A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90E2C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1B90E3D58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B90E3F7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double HUCenteredRectMake(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double HUCircleGetPoint(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double Width;
  double MidX;
  double v12;
  CGRect v14;
  CGRect v15;

  Width = CGRectGetWidth(*(CGRect *)&a2);
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetMidY(v15);
  v12 = 0.0;
  if (a1 <= 7)
    v12 = dbl_1B9442278[a1];
  return MidX + Width * 0.5 * v12;
}

void sub_1B90E5DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90E6060(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B90E9DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90EAF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90EFABC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1B90F09B4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak(v4);
  objc_destroyWeak((id *)(v5 - 176));
  _Unwind_Resume(a1);
}

void sub_1B90F0BD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B90F0DDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B90F0FD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B90F17E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;
  id *v34;

  objc_destroyWeak(v33);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90F1FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90F5ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B90F9440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90FD1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90FD2A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1B9103E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91043A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9108378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id location)
{
  id *v57;

  objc_destroyWeak(v57);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HUAnnounceTextButtonFontForSize(double a1, double a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  id v7;
  void *v8;

  v4 = (id)*MEMORY[0x1E0CEB590];
  v5 = HUViewSizeSubclassForViewSize(a1, a2);
  if (!v5)
  {
    v6 = (id *)MEMORY[0x1E0CEB550];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v6 = (id *)MEMORY[0x1E0CEB558];
LABEL_5:
    v7 = *v6;

    v4 = v7;
  }
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1B91099C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B910AE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B910AF74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B910BCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B910D2F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B9110230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B911098C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9112B7C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id _backgroundColorWithTraitCollection(void *a1)
{
  if (objc_msgSend(a1, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id _fadeInGradientWithColor(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[0] = objc_msgSend(v2, "CGColor");
  v3 = objc_retainAutorelease(v1);
  v4 = objc_msgSend(v3, "CGColor");

  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1B9117D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9118280(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_1B91193D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1B911B328(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B911B96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSUICFlamesViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ED57FA88)
    qword_1ED57FA88 = _sl_dlopen();
  if (!qword_1ED57FA88)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SiriUICoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HUWaveformView.m"), 22, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SUICFlamesView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSUICFlamesViewClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HUWaveformView.m"), 23, CFSTR("Unable to find class %s"), "SUICFlamesView");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_1_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B911E670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9122FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HUImageNamed(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  HUNullableImageNamed(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    NSLog(CFSTR("Missing image %@"), v1);

  return v2;
}

id HUNullableImageNamed(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD *v14;

  v1 = a1;
  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __HUNullableImageNamed_block_invoke;
  v11 = &unk_1E6F52DD8;
  v12 = v1;
  v3 = v12;
  v4 = v9;
  if (qword_1ED580AD8 != -1)
    dispatch_once(&qword_1ED580AD8, &__block_literal_global_53_0);
  if (_MergedGlobals_621)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HomeUI_%@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA9E78], "systemAppPersistenteCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = ___HULoadCachedImageWithGenerationBlock_block_invoke;
    v13[3] = &unk_1E6F52E00;
    v14 = v4;
    objc_msgSend(v6, "imageForKey:generatingIfNecessaryWithBlock:", v5, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id HUColorNamed(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CEA478];
  HUHomeUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNamed:inBundle:compatibleWithTraitCollection:", v1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("Missing color %@"), v1);

  return v4;
}

__CFString *HULocalizedStringWithDefaultValue(void *a1, void *a2)
{
  return _HULocalizedStringWithDefaultValue(a1, a2, 0);
}

id HUSiriLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CFE978];
  v2 = a1;
  objc_msgSend(v1, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUIUtteranceForKey:languageCode:", v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "siriLanguageCode: [%@], localizedUIUtterance from MAF: [%@]", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

id HULocalizedSiriTriggerPhrase(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[4];
  _BYTE v24[20];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUHeySiri"), CFSTR("HUHeySiri"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTriggerPhraseForLanguageCode:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCompactVoiceTriggerAvailableForLanguageCode:", v3);

  if (_os_feature_enabled_impl()
    && v9
    && objc_msgSend(v1, "hf_atleastOneMediaAccessorySupportingJustSiri")
    && objc_msgSend(v1, "siriPhraseOptions") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedCompactTriggerPhraseForLanguageCode:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
    v12 = objc_claimAutoreleasedReturnValue();

    HULocalizedStringWithFormat(CFSTR("HUSiriOrHeySiri"), CFSTR("%@%@"), v13, v14, v15, v16, v17, v18, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("“%@”"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v24 = v9;
    *(_WORD *)&v24[4] = 2048;
    *(_QWORD *)&v24[6] = objc_msgSend(v1, "siriPhraseOptions");
    *(_WORD *)&v24[14] = 1024;
    *(_DWORD *)&v24[16] = objc_msgSend(v1, "hf_atleastOneMediaAccessorySupportingJustSiri");
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "compactTriggerPhraseAvailable: %{BOOL}d, siriPhraseOptions = %lu atleastOneMediaAccessorySupportingJustSiri = %{BOOL}d", buf, 0x18u);
  }

  HFLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v24 = v3;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v19;
    *(_WORD *)&v24[18] = 2112;
    v25 = v1;
    _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "siriLanguageCode: %@, triggerPhrase: %@, home:%@", buf, 0x20u);
  }

  return v19;
}

id HULocalizedStringWithFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v17[2];

  v10 = a2;
  _HULocalizedStringWithDefaultValue(a1, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17[1] = &a9;
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = 0;
    v14 = (void *)objc_msgSend(v12, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v11, v10, v13, &a9, v17);
    v15 = v17[0];

    if (!v14)
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v11, v15);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id HULocalizedJustSiriTriggerPhrase()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCompactVoiceTriggerAvailableForLanguageCode:", v1);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedCompactTriggerPhraseForLanguageCode:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "compactTriggerPhraseAvailable: %{BOOL}d", (uint8_t *)v8, 8u);
  }

  return v5;
}

id HULocalizedCategoryOrPrimaryServiceTypeStringWithFormat(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v29[2];

  v11 = a3;
  v12 = (void *)MEMORY[0x1E0CBA1A8];
  v13 = a2;
  v14 = a1;
  objc_msgSend(v12, "hf_getUserFriendlyDescriptionKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_getUserFriendlyDescriptionKey:", v11);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x1E0CB7A70]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@_%@"), v14, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(v22, v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v19, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v29[1] = &a9;
  v29[0] = 0;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithValidatedFormat:validFormatSpecifiers:arguments:error:", v24, v13, &a9, v29);

  v26 = v29[0];
  v27 = v26;
  if (!v25)
    NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v24, v26);

  return v25;
}

id HULocalizedCategoryOrPrimaryServiceTypeModelString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_getUserFriendlyDescriptionKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_getUserFriendlyDescriptionKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x1E0CB7A70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_MAC"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_MAC"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v14, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v13, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id HULocalizedWiFiString(void *a1)
{
  void *v1;
  id v2;
  int v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0D319D0];
  v2 = a1;
  v3 = objc_msgSend(v1, "useWLANInsteadOfWiFi");
  v4 = CFSTR("WIFI");
  if (v3)
    v4 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HULocalizedModelString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0D319D0];
  v2 = a1;
  if ((objc_msgSend(v1, "isAMac") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_MAC"), v2);
  else
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HUSensitiveLocalizedModelString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0D319D0];
  v2 = a1;
  if ((objc_msgSend(v1, "isAMac") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_MAC"), v2);
  else
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _HUBiometryString(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  v1 = (objc_class *)MEMORY[0x1E0CC12A0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_msgSend(v3, "biometryType");

  v5 = CFSTR("NONE");
  if (v4 == 1)
    v5 = CFSTR("TOUCHID");
  if (v4 == 2)
    v5 = CFSTR("FACEID");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HULocalizedBiometryString(void *a1)
{
  void *v1;
  void *v2;

  _HUBiometryString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v1, v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double HUFloatGetSafeScaleForValue(double result)
{
  float v1;
  void *v2;
  double v3;
  double v4;

  v1 = result;
  if (fabsf(v1) < 0.00000011921)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scale");
    v4 = v3;

    return v4;
  }
  return result;
}

double HUFloatRoundForScale(double a1, double a2)
{
  double SafeScaleForValue;

  SafeScaleForValue = HUFloatGetSafeScaleForValue(a2);
  return round(SafeScaleForValue * a1) / SafeScaleForValue;
}

double HUSizeRoundForScale(double a1, double a2, double a3)
{
  double SafeScaleForValue;
  double v6;

  SafeScaleForValue = HUFloatGetSafeScaleForValue(a3);
  v6 = round(a1 * SafeScaleForValue) / SafeScaleForValue;
  HUFloatGetSafeScaleForValue(a3);
  return v6;
}

void sub_1B91273DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9127E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B912A7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B912DDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B913095C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9131408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9133F04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B91370DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_1B9139930(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

void sub_1B9139E44(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B913A018(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B913CF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B913ED7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B913F1C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B913F4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1B913F880(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B913FA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;
  uint64_t v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v24 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B9140F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9144948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9144A9C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9145024(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9145848(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B9147110(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B91472CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9147FF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B91491B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91506E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_1B91550F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9156990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1B91582AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B915D470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B915D68C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B915D924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B915DAC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B915E7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B915F1B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B91600E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9163440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1B916506C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1B916A2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B916A578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getTLToneManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1EF226A88;
  v7 = qword_1EF226A88;
  if (!qword_1EF226A88)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTLToneManagerClass_block_invoke;
    v3[3] = &unk_1E6F4C868;
    v3[4] = &v4;
    __getTLToneManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B916ACE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B916B6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTLToneManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1EF226A90)
    qword_1EF226A90 = _sl_dlopen();
  if (!qword_1EF226A90)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ToneLibraryLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HUAlarmEditViewController.m"), 90, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("TLToneManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTLToneManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HUAlarmEditViewController.m"), 91, CFSTR("Unable to find class %s"), "TLToneManager");

LABEL_8:
    __break(1u);
  }
  qword_1EF226A88 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getMPMediaPickerControllerClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPickerController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF226A98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPMediaPickerControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUAlarmEditViewController.m"), 79, CFSTR("Unable to find class %s"), "MPMediaPickerController");

    __break(1u);
  }
}

void MediaPlayerLibrary_0()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary_0)
    MediaPlayerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HUAlarmEditViewController.m"), 78, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getMPPlaybackArchiveConfigurationClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPPlaybackArchiveConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF226AA0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPPlaybackArchiveConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUAlarmEditViewController.m"), 80, CFSTR("Unable to find class %s"), "MPPlaybackArchiveConfiguration");

    __break(1u);
  }
}

void sub_1B916C820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B916CAB0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B916D4C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B916D5B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B916D804(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;
  id *v4;

  objc_destroyWeak(v4);
  if (v3)
    objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B916DE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B916DF60(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9170178(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9170730(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B9173E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CGFloat HURectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  void *v16;
  uint64_t v17;
  double MaxX;
  double v19;
  double v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "layoutDirection");

  if (v17 == 1)
  {
    v22.origin.x = a5;
    v22.origin.y = a6;
    v22.size.width = a7;
    v22.size.height = a8;
    MaxX = CGRectGetMaxX(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    v19 = MaxX - CGRectGetMinX(v23);
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    v20 = v19 - CGRectGetWidth(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetMinY(v25);
    v26.origin.x = a1;
    v26.origin.y = a2;
    v26.size.width = a3;
    v26.size.height = a4;
    CGRectGetWidth(v26);
    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = a3;
    v27.size.height = a4;
    CGRectGetHeight(v27);
    return v20;
  }
  return a1;
}

void sub_1B917A7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1B917B338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9180354(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1B9181114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9181794(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1B9181C68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9184024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91840FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B91854BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B9186488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9186900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9186B08(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1B9186ED4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B91873DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B9187CBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9187FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91888E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9189D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B918A2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B918C844(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1B918C948(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B918D280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B918D438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B918EBF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B918EF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B918F8E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1B9190C88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9190ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91938CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9195274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  id *v37;

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9199E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1B919AF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B919D5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B91A58DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91A636C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1B91A9E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91ADB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91AE234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91AE4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91AED18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B91B14C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1B91B70B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91B7274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91BC1E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_1B91C03F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91C1EDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B91CB748(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1B91CBD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91D18B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91D3928(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B91D4CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91D75E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91D8158(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B91D82D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B91D86B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91D9444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91E2ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  id *v32;
  uint64_t v33;

  objc_destroyWeak(v32);
  objc_destroyWeak((id *)(v33 - 160));
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_1B91E2FB8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B91E3E2C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1B91E426C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B91E4738(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1B91E4870(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B91E4AB8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B91E8190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v19 - 88));
  _Unwind_Resume(a1);
}

void sub_1B91E84EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91E89EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91EB128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91EB5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B91ED5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91EED28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91EF748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91EFA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_1B91EFD04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91F0130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91F131C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1B91F3BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91F4CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_1B91F52E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B91F7024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getMTRSetupPayloadClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1EF226AE0)
    qword_1EF226AE0 = _sl_dlopen();
  if (!qword_1EF226AE0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MatterLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HUServiceDetailsViewController.m"), 54, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MTRSetupPayload");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTRSetupPayloadClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HUServiceDetailsViewController.m"), 55, CFSTR("Unable to find class %s"), "MTRSetupPayload");

LABEL_8:
    __break(1u);
  }
  qword_1EF226AD8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B91FF34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B920121C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B92016B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9201B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  id *v41;

  objc_destroyWeak(v41);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1B9201CF4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9202358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B920293C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9202CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B92032EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9203E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92043CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

Class __getICQOfferManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1EF226AF8)
    qword_1EF226AF8 = _sl_dlopen();
  if (!qword_1EF226AF8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *iCloudQuotaLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 37, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("ICQOfferManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getICQOfferManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 38, CFSTR("Unable to find class %s"), "ICQOfferManager");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_3_6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getICQUpgradeFlowOptionsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  iCloudQuotaUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ICQUpgradeFlowOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF226B00 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getICQUpgradeFlowOptionsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 33, CFSTR("Unable to find class %s"), "ICQUpgradeFlowOptions");

    __break(1u);
  }
}

void iCloudQuotaUILibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
    iCloudQuotaUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *iCloudQuotaUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 31, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getICQUpgradeFlowManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  iCloudQuotaUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ICQUpgradeFlowManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF226B08 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getICQUpgradeFlowManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 32, CFSTR("Unable to find class %s"), "ICQUpgradeFlowManager");

    __break(1u);
  }
}

void sub_1B92063F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B920742C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9207784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92078D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9207EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9208074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B920827C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9210C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_1B921442C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1B9216BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B921AEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B921B040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMCProfileSummaryCellClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ManagedConfigurationUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MCProfileSummaryCell");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCProfileSummaryCellClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMCProfileSummaryCellClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUAccessorySettingsProfileModuleController.m"), 29, CFSTR("Unable to find class %s"), "MCProfileSummaryCell");

    __break(1u);
  }
}

void ManagedConfigurationUILibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!ManagedConfigurationUILibraryCore_frameworkLibrary)
    ManagedConfigurationUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ManagedConfigurationUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ManagedConfigurationUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HUAccessorySettingsProfileModuleController.m"), 27, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getMCProfileViewControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ManagedConfigurationUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MCProfileViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCProfileViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMCProfileViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUAccessorySettingsProfileModuleController.m"), 28, CFSTR("Unable to find class %s"), "MCProfileViewController");

    __break(1u);
  }
}

void sub_1B921B9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9222D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,id a21)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9222E8C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9223C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9223FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B922653C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B922661C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void sub_1B922BEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B922C3A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B922D108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B922E848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B922EE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B922FD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  id *v35;

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B922FE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HUPriorityMessageDefaultAttributedStringAttributes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 32770, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlignment:", 1);
  objc_msgSend(v1, "setLineBreakMode:", 0);
  objc_msgSend(v1, "setLineSpacing:", -2.0);
  v4 = *MEMORY[0x1E0CEA098];
  v8[0] = *MEMORY[0x1E0CEA0D0];
  v8[1] = v4;
  v9[0] = v1;
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1B923183C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void sub_1B9232F80(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B9234A40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B92357F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9239214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9239F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B923A568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v19 - 88));
  _Unwind_Resume(a1);
}

double HUSetupCodeFieldItemMaxWidth()
{
  return 36.0;
}

double HUSetupCodeFieldItemHeight()
{
  return 56.0;
}

double HUSetupCodeFieldMinMargin()
{
  return 10.0;
}

void sub_1B923D7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B924DA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B924DB10(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92516F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B92517C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92518D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92519E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9251B2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B9251C4C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9251F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9252418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getICQOfferManagerClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  iCloudQuotaLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ICQOfferManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getICQOfferManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getICQOfferManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUCameraUpgradeOfferBannerItem.m"), 29, CFSTR("Unable to find class %s"), "ICQOfferManager");

    __break(1u);
  }
}

void *iCloudQuotaLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!iCloudQuotaLibraryCore_frameworkLibrary)
    iCloudQuotaLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)iCloudQuotaLibraryCore_frameworkLibrary;
  if (!iCloudQuotaLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *iCloudQuotaLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("HUCameraUpgradeOfferBannerItem.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_1B9259C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B925EF04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9263868(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9265A68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9266698(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id HUPillButtonTitleFont()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB538]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v0, "scaledValueForValue:", 15.0);
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1B92674E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1B926A008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B926A0E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B926A490(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B926CAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_1B927041C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B92710B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9271F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92738D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9273F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B927564C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9275D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9275FDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t triggerRangeTypeForEventItem(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = (void *)MEMORY[0x1E0CBA4D0];
  v2 = a1;
  objc_msgSend(v2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thresholdValueRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thresholdValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v1, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v3, v4, v5);
  return v6;
}

void sub_1B927C5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B927FA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B927FF40(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1B9281318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9281450(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9281534(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9281630(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9281894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9281990(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9281A8C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9281F28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B9282020(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B928210C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B928495C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9284ED0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B928C0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22)
{
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  uint64_t v27;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v26);
  objc_destroyWeak(v22);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak((id *)(v27 - 128));
  _Unwind_Resume(a1);
}

void sub_1B928F5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9290050(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v1);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1B9291798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9291C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9291D30(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B929495C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_1B9296E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92979E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1B929A4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B929B040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B929C264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void sub_1B929C594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B929CD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B92A03F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92A1528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void sub_1B92AB444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92ABE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92AE040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92AF174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HUWheelColorIsValid(double a1, double a2, double a3, double a4)
{
  return a1 != 1.79769313e308 || a2 != 1.79769313e308 || a3 != 1.79769313e308 || a4 != 1.79769313e308;
}

double HUWheelColorForUIColor(void *a1)
{
  __int128 v2;
  __int128 v3;

  v2 = HUWheelColorInvalid;
  v3 = unk_1B9442BB8;
  if (!a1)
    return 1.79769313e308;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v2, (char *)&v2 + 8, &v3, 0);
  return *(double *)&v2;
}

id UIColorForHUWheelColor(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 == 1.79769313e308 && a2 == 1.79769313e308 && a3 == 1.79769313e308 && a4 == 1.79769313e308)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

double HUWheelColorForPaletteColor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  double v10;
  void *v12;
  void *v13;

  if (!a1)
    return 1.79769313e308;
  v1 = a1;
  objc_opt_class();
  objc_msgSend(v1, "colorValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HUWheelColor HUWheelColorForPaletteColor(HFColorPaletteColor *__strong _Nonnull)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("HUWheelColor.m"), 44, CFSTR("A color collection is required to create a wheel color."));

  }
  objc_msgSend(v4, "RGBColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "red");
  v7 = v6;
  objc_msgSend(v5, "green");
  objc_msgSend(v5, "blue");
  objc_msgSend(v4, "temperatureColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "temperatureColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temperatureInKelvin");

  }
  v10 = v7;

  return v10;
}

id HUPaletteColorForWheelColor(double a1, double a2, double a3, double a4)
{
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;

  if (a1 == 1.79769313e308 && a2 == 1.79769313e308 && a3 == 1.79769313e308 && a4 == 1.79769313e308)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D316C0]);
    *(float *)&v13 = a1;
    *(float *)&v14 = a2;
    *(float *)&v15 = a3;
    v16 = (void *)objc_msgSend(v12, "initWithRed:green:blue:", v13, v14, v15);
    objc_msgSend(v11, "addObject:", v16);

    if (a4 != 1.79769313e308)
    {
      v17 = objc_alloc(MEMORY[0x1E0D318C0]);
      *(float *)&v18 = a4;
      v19 = (void *)objc_msgSend(v17, "initWithTemperatureInKelvin:", v18);
      objc_msgSend(v11, "addObject:", v19);

    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D312F0]), "initWithPrimitiveColors:", v11);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31300]), "initWithColorCollection:", v20);

  }
  return v21;
}

void sub_1B92B395C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 128));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void sub_1B92B42C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92B9144(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_1B92B9AC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

id HUGridStatusCell_legacyParseTextLines(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _QWORD v44[2];
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v5, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {

      }
      else
      {
        objc_msgSend(v3, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hasSuffix:", v10);

        if (v11)
        {
          objc_msgSend(v3, "string");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "substringWithRange:", 0, objc_msgSend(v3, "length") - objc_msgSend(v5, "length"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "rangeOfString:", v15);
          objc_msgSend(v3, "attributedSubstringFromRange:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v46[0] = v19;
          v46[1] = v5;
          v20 = (void *)MEMORY[0x1E0C99D20];
          v21 = v5;
          objc_msgSend(v20, "arrayWithObjects:count:", v46, 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
          goto LABEL_23;
        }
      }
    }
    objc_msgSend(v3, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("\n"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v15, "count") < 2)
    {
      objc_msgSend(v3, "string");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "containsString:", CFSTR(" "));

      if (!v31
        || (objc_msgSend(v3, "string"),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            v33 = objc_msgSend(v32, "rangeOfString:options:", CFSTR(" "), 4),
            v35 = v34,
            v32,
            v33 == 0x7FFFFFFFFFFFFFFFLL)
        || v33 >= objc_msgSend(v3, "length") + ~v35)
      {
        v43 = v3;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "attributedSubstringFromRange:", 0, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "attributedSubstringFromRange:", v33 + v35, objc_msgSend(v3, "length") + ~v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v36;
        v44[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v15 = v15;
      v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v23)
      {
        v24 = v23;
        v25 = 0;
        v26 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v40 != v26)
              objc_enumerationMutation(v15);
            v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v3, "attributedSubstringFromRange:", v25, objc_msgSend(v28, "length", (_QWORD)v39));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v29);
            v25 += objc_msgSend(v28, "length") + 1;

          }
          v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v24);
      }

    }
    goto LABEL_22;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_23:

  return v8;
}

void sub_1B92C2650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92C327C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92C3354(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92C36A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B92C9C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92CB234(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B92CB5F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B92CBD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92CBF48(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92CC754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92CCA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92D4680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92D5698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92D5F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92DAB64(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_1B92DB504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92DB6F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92E0C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92E1CF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B92E1E10(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92E492C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak((id *)(v12 - 168));
  _Unwind_Resume(a1);
}

void sub_1B92E6524(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92E7C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B92E82BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void sub_1B92E916C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void sub_1B92EE0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92EE2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92EE440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id borderColorSurroundingColor(void *a1, uint64_t a2, int a3)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
LABEL_5:
    objc_msgSend(v3, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v4 = HUIsLightColor(a1);
  v3 = (void *)MEMORY[0x1E0CEA478];
  if (!v4)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1B92F4ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92F4E00(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B92F5254(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B92F76E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  id *v40;

  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B92F7D30(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92F8878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v12 - 160));
  _Unwind_Resume(a1);
}

void sub_1B92F8C78(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B92FBBF0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1B92FBD38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id HUGlobalCoordinateSpace()
{
  id WeakRetained;
  void *v1;
  id v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&__HUGlobalCoordinateSpace);
  v1 = WeakRetained;
  if (WeakRetained)
  {
    v2 = WeakRetained;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinateSpace");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void _HUSetOverrideGlobalCoordinateSpaceWithInputCoordinateSpace(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = a1;
  objc_opt_class();
  v9 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v9;
  else
    v2 = 0;
  v3 = v2;

  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "coordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "coordinateSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&__HUGlobalCoordinateSpace, v8);

  }
}

id _HUSetOverrideGlobalCoordinateSpace(id obj)
{
  return objc_storeWeak(&__HUGlobalCoordinateSpace, obj);
}

double HURoundToScreenScale(double a1)
{
  if (qword_1ED580C48 != -1)
    dispatch_once(&qword_1ED580C48, &__block_literal_global_240);
  return round(*(double *)&_MergedGlobals_637 * a1) / *(double *)&_MergedGlobals_637;
}

double HURoundSizeToScreenScale(double a1, double a2)
{
  double v3;

  v3 = HURoundToScreenScale(a1);
  HURoundToScreenScale(a2);
  return v3;
}

double HUDefaultViewWidthForSizeSubclass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return 320.0;
  else
    return dbl_1B9442D38[a1 - 1];
}

uint64_t HUConstantIntegerForViewSizeSubclass(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  _HUObjectForSizeSubclass(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E70418D8;
  v4 = objc_msgSend(v2, "integerValue");

  return v4;
}

double HUConvertGlobalCoordinatePointToSpace(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a1;
  _HUSetOverrideGlobalCoordinateSpaceWithInputCoordinateSpace(v5);
  HUGlobalCoordinateSpace();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:fromCoordinateSpace:", v6, a2, a3);
  v8 = v7;

  return v8;
}

double HUConvertGlobalCoordinateRectToSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  double v11;
  double v12;

  v9 = a1;
  _HUSetOverrideGlobalCoordinateSpaceWithInputCoordinateSpace(v9);
  HUGlobalCoordinateSpace();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v10, a2, a3, a4, a5);
  v12 = v11;

  return v12;
}

double HUConvertPointToGlobalCoordinateSpace(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a1;
  _HUSetOverrideGlobalCoordinateSpaceWithInputCoordinateSpace(v5);
  HUGlobalCoordinateSpace();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v6, a2, a3);
  v8 = v7;

  return v8;
}

double HUConvertRectToGlobalCoordinateSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  double v11;
  double v12;

  v9 = a1;
  _HUSetOverrideGlobalCoordinateSpaceWithInputCoordinateSpace(v9);
  HUGlobalCoordinateSpace();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v10, a2, a3, a4, a5);
  v12 = v11;

  return v12;
}

double HUSizeRoundedToScreenScale()
{
  void *v0;
  double v1;
  double v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v2 = v1;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();

  return v2;
}

uint64_t CACornerMaskFromUIRectCornerMask(char a1)
{
  return a1 & 0xF;
}

uint64_t UIRectCornerMaskFromCACornerMask(char a1)
{
  return a1 & 0xF;
}

void sub_1B930047C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9304FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9308418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93089B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B930BEA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void sub_1B930CF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B930D390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B930DB10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B930E8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B930EA00(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B930ECF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B930EE0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B930F0F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B93118D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1B93181E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93197A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double HURubberBandedValue(double result, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (vabdd_f64(a5, a4) >= 2.22044605e-16)
  {
    if (a3 >= result)
    {
      if (a2 > result)
      {
        v8 = a4 - a2;
        v9 = (a2 - result) / (a4 - a2);
        v10 = 1.0 - 1.0 / (fabs(v9) * 0.55 + 1.0);
        if (v9 <= 0.0)
          v11 = v10;
        else
          v11 = -v10;
        return a2 + v11 * v8;
      }
    }
    else
    {
      v5 = (result - a3) / (a5 - a3);
      v6 = 1.0 - 1.0 / (fabs(v5) * 0.55 + 1.0);
      if (v5 <= 0.0)
        v7 = -v6;
      else
        v7 = v6;
      return a3 + v7 * (a5 - a3);
    }
  }
  return result;
}

double HURubberBandedAbsoluteValue(double a1, double a2, double a3)
{
  return HURubberBandedValue(a1, 0.0, a2, 0.0, a3);
}

double HURemapWithTimingFunction(void *a1, uint64_t a2, double a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v5 = a1;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat HURemapWithTimingFunction(CAMediaTimingFunction *__strong, CGFloat, NSInteger)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HUMathUtilities.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timingFunction != nil"));

  }
  if (a2 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat HURemapWithTimingFunction(CAMediaTimingFunction *__strong, CGFloat, NSInteger)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("HUMathUtilities.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iterations >= 1"));

    v14 = 0.0;
    if (a3 >= 0.0)
      v14 = a3;
    v8 = fmin(v14, 1.0);
  }
  else
  {
    v6 = 0.0;
    if (a3 >= 0.0)
      v6 = a3;
    v7 = fmin(v6, 1.0);
    *(float *)&v7 = v7;
    do
    {
      objc_msgSend(v5, "_solveForInput:", v7);
      --a2;
    }
    while (a2);
    v8 = *(float *)&v7;
  }

  return v8;
}

double HUSolveCubicBezier(double *a1, double a2)
{
  return (1.0 - a2) * ((1.0 - a2) * 3.0) * a2 * a1[1]
       + (1.0 - a2) * ((1.0 - a2) * (1.0 - a2)) * *a1
       + (1.0 - a2) * 3.0 * a2 * a2 * a1[2]
       + a2 * a2 * a2 * a1[3];
}

double HUComputeSamplesForCubicBezier(double *a1, uint64_t a2, uint64_t a3, double result)
{
  unint64_t v4;
  double v5;

  if (a3)
  {
    v4 = 0;
    result = (double)(unint64_t)(a3 - 1);
    do
    {
      v5 = (double)v4 / result;
      *(double *)(a2 + 8 * v4++) = a1[1] * (v5 * ((1.0 - v5) * ((1.0 - v5) * 3.0)))
                                 + (1.0 - v5) * ((1.0 - v5) * (1.0 - v5)) * *a1
                                 + v5 * (v5 * ((1.0 - v5) * 3.0)) * a1[2]
                                 + v5 * (v5 * v5) * a1[3];
    }
    while (a3 != v4);
  }
  return result;
}

double HUApproximatelyInverseCubicBezierWithSamples(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4;
  int v5;
  double *v6;
  double *v7;
  double v8;
  double v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  int v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = (double)(unint64_t)(a4 - 1);
  v5 = vcvtmd_s64_f64(v4 * a1);
  v6 = (double *)(a3 + 8 * v5);
  v8 = *v6;
  v7 = v6 + 1;
  v9 = v8;
  if (v5 <= (int)a4 - 1)
    v10 = a4 - 1;
  else
    v10 = v5;
  v11 = v5 - 1;
  v12 = v10 - (uint64_t)v5;
  while (1)
  {
    v13 = v9;
    if (!v12)
      break;
    v14 = *v7++;
    v9 = v14;
    ++v11;
    --v12;
    if (vabdd_f64(v14, a1) >= vabdd_f64(v13, a1))
      goto LABEL_9;
  }
  v11 = v10;
LABEL_9:
  v15 = v11 & (v11 >> 31);
  v16 = (double *)(a3 + 8 * v11 - 8);
  do
  {
    v17 = v13;
    v18 = v9;
    if (v11 <= 0)
    {
      v20 = (double)v15 / v4;
      v21 = a1 - v13;
      goto LABEL_15;
    }
    v19 = *v16--;
    v13 = v19;
    --v11;
    v9 = v17;
  }
  while (vabdd_f64(v19, a1) < vabdd_f64(v17, a1));
  v15 = v11 + 1;
  v20 = (double)(v11 + 1) / v4;
  v21 = a1 - v17;
  if (a1 - v17 < 0.0)
    return (double)v11 / v4 + (v20 - (double)v11 / v4) * ((a1 - v13) / (v17 - v13));
LABEL_15:
  if (v15 >= (int)a4 - 1 || v21 <= 0.0)
    return v20;
  else
    return v20 + ((double)(v15 + 1) / v4 - v20) * (v21 / (v18 - v17));
}

unint64_t HUHighestCommonFactor(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = a1;
  if (a2)
  {
    v3 = a2;
    v4 = a1;
    do
    {
      v2 = v3;
      v3 = v4 % v3;
      v4 = v2;
    }
    while (v3);
  }
  return a2 * a1 / v2;
}

double HUClampWithStep(double a1, double a2, long double a3, long double a4)
{
  double v8;
  double v9;
  double v10;

  v8 = fmod(a4, a3);
  v9 = 0.0;
  if (v8 > a3 * 0.5)
    v9 = a3;
  v10 = v9 - v8 + a4;
  if (v10 >= a1)
  {
    a1 = v10;
    if (v10 > a2)
      a1 = a2;
  }
  if (a3 <= 0.0001)
    NSLog(CFSTR("Please make sure your stepvalue is above .0001, or expect undefined madness."));
  return (double)(uint64_t)(a1 * 1000.0) / 1000.0;
}

void sub_1B931E0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B931FB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B932020C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1B9321600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v12 - 168));
  _Unwind_Resume(a1);
}

void sub_1B9321950(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9322324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9322570(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9322B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9322FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93234F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9324ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B932707C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9327D64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void sub_1B932A0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B932B1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B932C35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double HUGridLayoutGutterForCellSizeSubclass()
{
  return 10.0;
}

void sub_1B932F6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9331E98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13)
    (*(void (**)(void))(a13 + 16))();
  _Unwind_Resume(exception_object);
}

void sub_1B9333EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9335078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9337D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B933A4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void sub_1B933BE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9340984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93412F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B934F154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93540C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)&STACK[0x248]);
  _Unwind_Resume(a1);
}

void sub_1B93544C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B935474C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B9354A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9354D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9359648(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B935D94C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B935F594(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B935F6D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B93603C8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B93642E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9366BB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B9367B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93681C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSSUSoundScapesPickerManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)_MergedGlobals_5_2;
  v7 = _MergedGlobals_5_2;
  if (!_MergedGlobals_5_2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSUSoundScapesPickerManagerClass_block_invoke;
    v3[3] = &unk_1E6F4C868;
    v3[4] = &v4;
    __getSSUSoundScapesPickerManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B93685DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9368A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9368C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSSUSoundScapesPickerManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ED5805E8)
    qword_1ED5805E8 = _sl_dlopen();
  if (!qword_1ED5805E8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SoundScapesUtilityLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HUMediaSourceItem.m"), 29, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SSUSoundScapesPickerManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSSUSoundScapesPickerManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HUMediaSourceItem.m"), 30, CFSTR("Unable to find class %s"), "SSUSoundScapesPickerManager");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_5_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getMPMediaPickerControllerClass_block_invoke_1(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPickerController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED5805F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPMediaPickerControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUMediaSourceItem.m"), 24, CFSTR("Unable to find class %s"), "MPMediaPickerController");

    __break(1u);
  }
}

void MediaPlayerLibrary_1()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary_1)
    MediaPlayerLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HUMediaSourceItem.m"), 23, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getMPPlaybackArchiveConfigurationClass_block_invoke_1(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPPlaybackArchiveConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED5805F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPPlaybackArchiveConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HUMediaSourceItem.m"), 25, CFSTR("Unable to find class %s"), "MPPlaybackArchiveConfiguration");

    __break(1u);
  }
}

double HUGetSafeScaleForValue(double result)
{
  float v1;
  void *v2;
  double v3;
  double v4;

  v1 = result;
  if (fabsf(v1) < 0.00000011921)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scale");
    v4 = v3;

    return v4;
  }
  return result;
}

void sub_1B936DD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B936F0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93746D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B9374878(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B937513C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B9375210(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t HUIsPadIdiom()
{
  if (qword_1ED580DB8 != -1)
    dispatch_once(&qword_1ED580DB8, &__block_literal_global_272);
  return _MergedGlobals_640;
}

uint64_t HUIsPhoneIdiom()
{
  if (qword_1ED580DC0 != -1)
    dispatch_once(&qword_1ED580DC0, &__block_literal_global_1);
  return byte_1ED580DB1;
}

BOOL HUIsVeryWidePhoneSize()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;
  v4 = v3;

  if (v2 >= v4)
    v5 = v4;
  else
    v5 = v2;
  return v5 > 375.0;
}

void sub_1B937A02C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B9380A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9382AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9382CEC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *HUImageIdentifierForStreamingOption(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("streaming-off");
  if (a1 == 1)
    v1 = CFSTR("streaming-on");
  if (a1 == 2)
    return CFSTR("streaming-and-recording");
  else
    return v1;
}

id HUCameraBuildFeatureDescriptionAttributedString(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEA5F0];
  v6 = *MEMORY[0x1E0CEB5A0];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v6, 2, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CEA098];
  v28[0] = v9;
  v11 = *MEMORY[0x1E0CEA0A0];
  v27[0] = v10;
  v27[1] = v11;
  if (a1 == 3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v13);
  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v6, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  v26[0] = v18;
  v25[0] = v10;
  if (a1 == 3)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v20);
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "appendAttributedString:", v16);
  objc_msgSend(v22, "appendAttributedString:", v21);

  return v22;
}

id HUCameraBuildHeaderAttributedString(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  switch(a1)
  {
    case 1:
      if (v6)
      {
        objc_msgSend(CFSTR("\n\n"), "stringByAppendingString:", v6);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }
      v11 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5A8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fontDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v14, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0CEA098];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CEA098]);

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v11);
      objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5A0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "mutableCopy");
      if (v7)
      {
        v20 = objc_alloc(MEMORY[0x1E0CB3498]);
        v47 = v16;
        objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v18, 0.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v20, "initWithString:attributes:", v7, v22);

        objc_msgSend(v19, "appendAttributedString:", v23);
      }

      goto LABEL_14;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB5A0], 2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v11, 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x1E0CEA0A0];
      v49[0] = *MEMORY[0x1E0CEA098];
      v49[1] = v24;
      v50[0] = v14;
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v17);
LABEL_14:

      goto LABEL_15;
    case 2:
      v8 = v5;
      if (v6)
      {
        objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v6);
        v9 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v9;
      }
      v26 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5B8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fontDescriptorWithSymbolicTraits:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "fontWithDescriptor:size:", v28, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_alloc(MEMORY[0x1E0CB3498]);
      v31 = *MEMORY[0x1E0CEA0A0];
      v53[0] = *MEMORY[0x1E0CEA098];
      v30 = v53[0];
      v53[1] = v31;
      v54[0] = v11;
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v29, "initWithString:attributes:", v8, v33);

      objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5A0]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fontDescriptorWithSymbolicTraits:", 0x8000);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v17, 0.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc(MEMORY[0x1E0CB3498]);
      v51[1] = v31;
      v52[0] = v46;
      v51[0] = v30;
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v35, "initWithString:attributes:", v7, v37);

      v19 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v19, "appendAttributedString:", v38);
      v39 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v40, "mutableCopy");

      v5 = v8;
      objc_msgSend(v41, "setAlignment:", 1);
      objc_msgSend(v11, "capHeight");
      v43 = v42;
      objc_msgSend(v11, "descender");
      objc_msgSend(v41, "setParagraphSpacing:", v43 + v44);
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0CEA0D0]);
      objc_msgSend(v19, "addAttributes:range:", v39, 0, objc_msgSend(v19, "length"));

      goto LABEL_14;
  }
  v19 = 0;
LABEL_15:

  return v19;
}

void sub_1B9396114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_1B9397190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *location)
{
  uint64_t v14;

  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v14 - 184));
  _Unwind_Resume(a1);
}

void sub_1B939B024(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B939BE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B939FD70(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1B93A0A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93A0AE4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B93A1148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93A20E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93A3E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93A4C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93A5E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void sub_1B93A79BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B93A817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_1B93AA218(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1B93AA394(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_1B93AC934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B93AF758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{

}

void sub_1B93AFB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B93B03DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B93B079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B93B08EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B93B35A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HUSideBarStaticItemTypeString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E6F60460[a1];
}

void sub_1B93B6DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93B6FC0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B93B9FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93C3184(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v6 - 152), 8);
  objc_destroyWeak((id *)(v6 - 120));
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_1B93C3354(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1B93C6D30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *HUStringFromIncomingInvitationResponseControllerState(unint64_t a1)
{
  if (a1 < 4)
    return off_1E6F60620[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown IncomingInvitationResponseControllerState %lu@"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1B93C8EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93C9A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93CA6C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B93CA9A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B93CAC4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B93CB0E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B93CCAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id *location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id a44)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a44);
  _Unwind_Resume(a1);
}

void sub_1B93D0A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93D1AF8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1B93D23E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93D4594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93D466C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B93D4CC4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B93D7F34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B93D81DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B93D8584(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B93D9AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93DBCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93DDB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93E15C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93E41BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93E5584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B93E9E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B93EAA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B93EAB58(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1B93EB510()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1B93EB51C()
{
  return MEMORY[0x1E0CADFB0]();
}

uint64_t sub_1B93EB528()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1B93EB534()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1B93EB540()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1B93EB54C()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1B93EB558()
{
  return MEMORY[0x1E0CAE2A0]();
}

uint64_t sub_1B93EB564()
{
  return MEMORY[0x1E0CAE320]();
}

uint64_t sub_1B93EB570()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1B93EB57C()
{
  return MEMORY[0x1E0CAE3B8]();
}

uint64_t sub_1B93EB588()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1B93EB594()
{
  return MEMORY[0x1E0CAE490]();
}

uint64_t sub_1B93EB5A0()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1B93EB5AC()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1B93EB5B8()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1B93EB5C4()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1B93EB5D0()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1B93EB5DC()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1B93EB5E8()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1B93EB5F4()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1B93EB600()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1B93EB60C()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1B93EB618()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1B93EB624()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1B93EB630()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1B93EB63C()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1B93EB648()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1B93EB654()
{
  return MEMORY[0x1E0CAF7E0]();
}

uint64_t sub_1B93EB660()
{
  return MEMORY[0x1E0CAF7E8]();
}

uint64_t sub_1B93EB66C()
{
  return MEMORY[0x1E0CAF7F8]();
}

uint64_t sub_1B93EB678()
{
  return MEMORY[0x1E0CAF818]();
}

uint64_t sub_1B93EB684()
{
  return MEMORY[0x1E0CAF8A0]();
}

uint64_t sub_1B93EB690()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_1B93EB69C()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1B93EB6A8()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1B93EB6B4()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1B93EB6C0()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1B93EB6CC()
{
  return MEMORY[0x1E0CAF910]();
}

uint64_t sub_1B93EB6D8()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1B93EB6E4()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1B93EB6F0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B93EB6FC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B93EB708()
{
  return MEMORY[0x1E0CAFA88]();
}

uint64_t sub_1B93EB714()
{
  return MEMORY[0x1E0CAFAE0]();
}

uint64_t sub_1B93EB720()
{
  return MEMORY[0x1E0CAFBC0]();
}

uint64_t sub_1B93EB72C()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1B93EB738()
{
  return MEMORY[0x1E0CAFCB0]();
}

uint64_t sub_1B93EB744()
{
  return MEMORY[0x1E0CAFCC0]();
}

uint64_t sub_1B93EB750()
{
  return MEMORY[0x1E0CAFD40]();
}

uint64_t sub_1B93EB75C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1B93EB768()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B93EB774()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1B93EB780()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B93EB78C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1B93EB798()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B93EB7A4()
{
  return MEMORY[0x1E0CB0118]();
}

uint64_t sub_1B93EB7B0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B93EB7BC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B93EB7C8()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1B93EB7D4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B93EB7E0()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1B93EB7EC()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t sub_1B93EB7F8()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1B93EB804()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1B93EB810()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1B93EB81C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1B93EB828()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B93EB834()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B93EB840()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B93EB84C()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1B93EB858()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1B93EB864()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1B93EB870()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B93EB87C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B93EB888()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1B93EB894()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B93EB8A0()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1B93EB8AC()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1B93EB8B8()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1B93EB8C4()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1B93EB8D0()
{
  return MEMORY[0x1E0CE9A00]();
}

uint64_t sub_1B93EB8DC()
{
  return MEMORY[0x1E0CE9A08]();
}

uint64_t sub_1B93EB8E8()
{
  return MEMORY[0x1E0CE9A10]();
}

uint64_t sub_1B93EB8F4()
{
  return MEMORY[0x1E0CE9A20]();
}

uint64_t sub_1B93EB900()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1B93EB90C()
{
  return MEMORY[0x1E0DEFC98]();
}

uint64_t sub_1B93EB918()
{
  return MEMORY[0x1E0DEFCA0]();
}

uint64_t sub_1B93EB924()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1B93EB930()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1B93EB93C()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1B93EB948()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1B93EB954()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1B93EB960()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1B93EB96C()
{
  return MEMORY[0x1E0D32A70]();
}

uint64_t sub_1B93EB978()
{
  return MEMORY[0x1E0D32A80]();
}

uint64_t sub_1B93EB984()
{
  return MEMORY[0x1E0D32A88]();
}

uint64_t sub_1B93EB990()
{
  return MEMORY[0x1E0D32A90]();
}

uint64_t sub_1B93EB99C()
{
  return MEMORY[0x1E0D32AA0]();
}

uint64_t sub_1B93EB9A8()
{
  return MEMORY[0x1E0D32AA8]();
}

uint64_t sub_1B93EB9B4()
{
  return MEMORY[0x1E0D32AB0]();
}

uint64_t sub_1B93EB9C0()
{
  return MEMORY[0x1E0D32AC0]();
}

uint64_t sub_1B93EB9CC()
{
  return MEMORY[0x1E0D32AD8]();
}

uint64_t sub_1B93EB9D8()
{
  return MEMORY[0x1E0D32AE0]();
}

uint64_t sub_1B93EB9E4()
{
  return MEMORY[0x1E0D32AF0]();
}

uint64_t sub_1B93EB9F0()
{
  return MEMORY[0x1E0D32AF8]();
}

uint64_t sub_1B93EB9FC()
{
  return MEMORY[0x1E0D32B08]();
}

uint64_t sub_1B93EBA08()
{
  return MEMORY[0x1E0D32B10]();
}

uint64_t sub_1B93EBA14()
{
  return MEMORY[0x1E0D32B20]();
}

uint64_t sub_1B93EBA20()
{
  return MEMORY[0x1E0D32B28]();
}

uint64_t sub_1B93EBA2C()
{
  return MEMORY[0x1E0D32BA0]();
}

uint64_t sub_1B93EBA38()
{
  return MEMORY[0x1E0D32BA8]();
}

uint64_t sub_1B93EBA44()
{
  return MEMORY[0x1E0D32BB0]();
}

uint64_t sub_1B93EBA50()
{
  return MEMORY[0x1E0D32BC0]();
}

uint64_t sub_1B93EBA5C()
{
  return MEMORY[0x1E0D32BC8]();
}

uint64_t sub_1B93EBA68()
{
  return MEMORY[0x1E0D32BD0]();
}

uint64_t sub_1B93EBA74()
{
  return MEMORY[0x1E0D32BD8]();
}

uint64_t sub_1B93EBA80()
{
  return MEMORY[0x1E0D32BF8]();
}

uint64_t sub_1B93EBA8C()
{
  return MEMORY[0x1E0D336C8]();
}

uint64_t sub_1B93EBA98()
{
  return MEMORY[0x1E0D336D0]();
}

uint64_t sub_1B93EBAA4()
{
  return MEMORY[0x1E0D336E0]();
}

uint64_t sub_1B93EBAB0()
{
  return MEMORY[0x1E0D32070]();
}

uint64_t sub_1B93EBABC()
{
  return MEMORY[0x1E0D32080]();
}

uint64_t sub_1B93EBAC8()
{
  return MEMORY[0x1E0D32090]();
}

uint64_t sub_1B93EBAD4()
{
  return MEMORY[0x1E0D32098]();
}

uint64_t sub_1B93EBAE0()
{
  return MEMORY[0x1E0D320A0]();
}

uint64_t sub_1B93EBAEC()
{
  return MEMORY[0x1E0D320B0]();
}

uint64_t sub_1B93EBAF8()
{
  return MEMORY[0x1E0D320C0]();
}

uint64_t sub_1B93EBB04()
{
  return MEMORY[0x1E0D320C8]();
}

uint64_t sub_1B93EBB10()
{
  return MEMORY[0x1E0D320D0]();
}

uint64_t sub_1B93EBB1C()
{
  return MEMORY[0x1E0D320D8]();
}

uint64_t sub_1B93EBB28()
{
  return MEMORY[0x1E0D320E0]();
}

uint64_t sub_1B93EBB34()
{
  return MEMORY[0x1E0D320E8]();
}

uint64_t sub_1B93EBB40()
{
  return MEMORY[0x1E0D320F0]();
}

uint64_t sub_1B93EBB4C()
{
  return MEMORY[0x1E0D32100]();
}

uint64_t sub_1B93EBB58()
{
  return MEMORY[0x1E0D32108]();
}

uint64_t sub_1B93EBB64()
{
  return MEMORY[0x1E0D32110]();
}

uint64_t sub_1B93EBB70()
{
  return MEMORY[0x1E0D32120]();
}

uint64_t sub_1B93EBB7C()
{
  return MEMORY[0x1E0D32128]();
}

uint64_t sub_1B93EBB88()
{
  return MEMORY[0x1E0D32138]();
}

uint64_t sub_1B93EBB94()
{
  return MEMORY[0x1E0D31B08]();
}

uint64_t sub_1B93EBBA0()
{
  return MEMORY[0x1E0D31B30]();
}

uint64_t sub_1B93EBBAC()
{
  return MEMORY[0x1E0D31B40]();
}

uint64_t sub_1B93EBBB8()
{
  return MEMORY[0x1E0D32140]();
}

uint64_t sub_1B93EBBC4()
{
  return MEMORY[0x1E0D32158]();
}

uint64_t sub_1B93EBBD0()
{
  return MEMORY[0x1E0D32160]();
}

uint64_t sub_1B93EBBDC()
{
  return MEMORY[0x1E0D32170]();
}

uint64_t sub_1B93EBBE8()
{
  return MEMORY[0x1E0D32190]();
}

uint64_t sub_1B93EBBF4()
{
  return MEMORY[0x1E0D321A8]();
}

uint64_t sub_1B93EBC00()
{
  return MEMORY[0x1E0D321B8]();
}

uint64_t sub_1B93EBC0C()
{
  return MEMORY[0x1E0D321C0]();
}

uint64_t sub_1B93EBC18()
{
  return MEMORY[0x1E0D321C8]();
}

uint64_t sub_1B93EBC24()
{
  return MEMORY[0x1E0D321D0]();
}

uint64_t sub_1B93EBC30()
{
  return MEMORY[0x1E0D321D8]();
}

uint64_t sub_1B93EBC3C()
{
  return MEMORY[0x1E0D321F8]();
}

uint64_t sub_1B93EBC48()
{
  return MEMORY[0x1E0D32210]();
}

uint64_t sub_1B93EBC54()
{
  return MEMORY[0x1E0D32228]();
}

uint64_t sub_1B93EBC60()
{
  return MEMORY[0x1E0D32230]();
}

uint64_t sub_1B93EBC6C()
{
  return MEMORY[0x1E0D32238]();
}

uint64_t sub_1B93EBC78()
{
  return MEMORY[0x1E0D32240]();
}

uint64_t sub_1B93EBC84()
{
  return MEMORY[0x1E0D32248]();
}

uint64_t sub_1B93EBC90()
{
  return MEMORY[0x1E0D32250]();
}

uint64_t sub_1B93EBC9C()
{
  return MEMORY[0x1E0D32260]();
}

uint64_t sub_1B93EBCA8()
{
  return MEMORY[0x1E0D32268]();
}

uint64_t sub_1B93EBCB4()
{
  return MEMORY[0x1E0D32278]();
}

uint64_t sub_1B93EBCC0()
{
  return MEMORY[0x1E0D32280]();
}

uint64_t sub_1B93EBCCC()
{
  return MEMORY[0x1E0D32288]();
}

uint64_t sub_1B93EBCD8()
{
  return MEMORY[0x1E0D32290]();
}

uint64_t sub_1B93EBCE4()
{
  return MEMORY[0x1E0D32298]();
}

uint64_t sub_1B93EBCF0()
{
  return MEMORY[0x1E0D322B8]();
}

uint64_t sub_1B93EBCFC()
{
  return MEMORY[0x1E0D322C0]();
}

uint64_t sub_1B93EBD08()
{
  return MEMORY[0x1E0D322F8]();
}

uint64_t sub_1B93EBD14()
{
  return MEMORY[0x1E0D32300]();
}

uint64_t sub_1B93EBD20()
{
  return MEMORY[0x1E0D32310]();
}

uint64_t sub_1B93EBD2C()
{
  return MEMORY[0x1E0D32318]();
}

uint64_t sub_1B93EBD38()
{
  return MEMORY[0x1E0D31B48]();
}

uint64_t sub_1B93EBD44()
{
  return MEMORY[0x1E0D31B50]();
}

uint64_t sub_1B93EBD50()
{
  return MEMORY[0x1E0D32340]();
}

uint64_t sub_1B93EBD5C()
{
  return MEMORY[0x1E0D323A8]();
}

uint64_t sub_1B93EBD68()
{
  return MEMORY[0x1E0D323D0]();
}

uint64_t sub_1B93EBD74()
{
  return MEMORY[0x1E0D323E8]();
}

uint64_t sub_1B93EBD80()
{
  return MEMORY[0x1E0D32400]();
}

uint64_t sub_1B93EBD8C()
{
  return MEMORY[0x1E0D32408]();
}

uint64_t sub_1B93EBD98()
{
  return MEMORY[0x1E0D32410]();
}

uint64_t sub_1B93EBDA4()
{
  return MEMORY[0x1E0D32418]();
}

uint64_t sub_1B93EBDB0()
{
  return MEMORY[0x1E0D32420]();
}

uint64_t sub_1B93EBDBC()
{
  return MEMORY[0x1E0D32438]();
}

uint64_t sub_1B93EBDC8()
{
  return MEMORY[0x1E0D32450]();
}

uint64_t sub_1B93EBDD4()
{
  return MEMORY[0x1E0D32458]();
}

uint64_t sub_1B93EBDE0()
{
  return MEMORY[0x1E0D32460]();
}

uint64_t sub_1B93EBDEC()
{
  return MEMORY[0x1E0D324B8]();
}

uint64_t sub_1B93EBDF8()
{
  return MEMORY[0x1E0D324C0]();
}

uint64_t sub_1B93EBE04()
{
  return MEMORY[0x1E0D324C8]();
}

uint64_t sub_1B93EBE10()
{
  return MEMORY[0x1E0D324D8]();
}

uint64_t sub_1B93EBE1C()
{
  return MEMORY[0x1E0D32528]();
}

uint64_t sub_1B93EBE28()
{
  return MEMORY[0x1E0D32530]();
}

uint64_t sub_1B93EBE34()
{
  return MEMORY[0x1E0D32540]();
}

uint64_t sub_1B93EBE40()
{
  return MEMORY[0x1E0D32558]();
}

uint64_t sub_1B93EBE4C()
{
  return MEMORY[0x1E0D32560]();
}

uint64_t sub_1B93EBE58()
{
  return MEMORY[0x1E0D32568]();
}

uint64_t sub_1B93EBE64()
{
  return MEMORY[0x1E0D32570]();
}

uint64_t sub_1B93EBE70()
{
  return MEMORY[0x1E0D325B0]();
}

uint64_t sub_1B93EBE7C()
{
  return MEMORY[0x1E0D325B8]();
}

uint64_t sub_1B93EBE88()
{
  return MEMORY[0x1E0D325C8]();
}

uint64_t sub_1B93EBE94()
{
  return MEMORY[0x1E0D325F8]();
}

uint64_t sub_1B93EBEA0()
{
  return MEMORY[0x1E0D32608]();
}

uint64_t sub_1B93EBEAC()
{
  return MEMORY[0x1E0D32620]();
}

uint64_t sub_1B93EBEB8()
{
  return MEMORY[0x1E0D32640]();
}

uint64_t sub_1B93EBEC4()
{
  return MEMORY[0x1E0D32648]();
}

uint64_t sub_1B93EBED0()
{
  return MEMORY[0x1E0D32650]();
}

uint64_t sub_1B93EBEDC()
{
  return MEMORY[0x1E0D32658]();
}

uint64_t sub_1B93EBEE8()
{
  return MEMORY[0x1E0D32668]();
}

uint64_t sub_1B93EBEF4()
{
  return MEMORY[0x1E0D32670]();
}

uint64_t sub_1B93EBF00()
{
  return MEMORY[0x1E0D326C8]();
}

uint64_t sub_1B93EBF0C()
{
  return MEMORY[0x1E0D326F8]();
}

uint64_t sub_1B93EBF18()
{
  return MEMORY[0x1E0D32700]();
}

uint64_t sub_1B93EBF24()
{
  return MEMORY[0x1E0D32708]();
}

uint64_t sub_1B93EBF30()
{
  return MEMORY[0x1E0D327E0]();
}

uint64_t sub_1B93EBF3C()
{
  return MEMORY[0x1E0D327E8]();
}

uint64_t sub_1B93EBF48()
{
  return MEMORY[0x1E0D327F8]();
}

uint64_t sub_1B93EBF54()
{
  return MEMORY[0x1E0D32800]();
}

uint64_t sub_1B93EBF60()
{
  return MEMORY[0x1E0D32818]();
}

uint64_t sub_1B93EBF6C()
{
  return MEMORY[0x1E0D328F0]();
}

uint64_t sub_1B93EBF78()
{
  return MEMORY[0x1E0D328F8]();
}

uint64_t sub_1B93EBF84()
{
  return MEMORY[0x1E0D32900]();
}

uint64_t sub_1B93EBF90()
{
  return MEMORY[0x1E0D32910]();
}

uint64_t sub_1B93EBF9C()
{
  return MEMORY[0x1E0D32918]();
}

uint64_t sub_1B93EBFA8()
{
  return MEMORY[0x1E0D32920]();
}

uint64_t sub_1B93EBFB4()
{
  return MEMORY[0x1E0D32930]();
}

uint64_t sub_1B93EBFC0()
{
  return MEMORY[0x1E0D32938]();
}

uint64_t sub_1B93EBFCC()
{
  return MEMORY[0x1E0D32940]();
}

uint64_t sub_1B93EBFD8()
{
  return MEMORY[0x1E0D32950]();
}

uint64_t sub_1B93EBFE4()
{
  return MEMORY[0x1E0D32958]();
}

uint64_t sub_1B93EBFF0()
{
  return MEMORY[0x1E0D32960]();
}

uint64_t sub_1B93EBFFC()
{
  return MEMORY[0x1E0D32988]();
}

uint64_t sub_1B93EC008()
{
  return MEMORY[0x1E0D32990]();
}

uint64_t sub_1B93EC014()
{
  return MEMORY[0x1E0D32998]();
}

uint64_t sub_1B93EC020()
{
  return MEMORY[0x1E0D339E0]();
}

uint64_t sub_1B93EC02C()
{
  return MEMORY[0x1E0D339E8]();
}

uint64_t sub_1B93EC038()
{
  return MEMORY[0x1E0D33A00]();
}

uint64_t sub_1B93EC044()
{
  return MEMORY[0x1E0D33A08]();
}

uint64_t sub_1B93EC050()
{
  return MEMORY[0x1E0D33A10]();
}

uint64_t sub_1B93EC05C()
{
  return MEMORY[0x1E0D33A18]();
}

uint64_t sub_1B93EC068()
{
  return MEMORY[0x1E0D33A20]();
}

uint64_t sub_1B93EC074()
{
  return MEMORY[0x1E0D33A38]();
}

uint64_t sub_1B93EC080()
{
  return MEMORY[0x1E0D33A40]();
}

uint64_t sub_1B93EC08C()
{
  return MEMORY[0x1E0D33A48]();
}

uint64_t sub_1B93EC098()
{
  return MEMORY[0x1E0D33A50]();
}

uint64_t sub_1B93EC0A4()
{
  return MEMORY[0x1E0D33A58]();
}

uint64_t sub_1B93EC0B0()
{
  return MEMORY[0x1E0D33A60]();
}

uint64_t sub_1B93EC0BC()
{
  return MEMORY[0x1E0D33A78]();
}

uint64_t sub_1B93EC0C8()
{
  return MEMORY[0x1E0D33A80]();
}

uint64_t sub_1B93EC0D4()
{
  return MEMORY[0x1E0D33A88]();
}

uint64_t sub_1B93EC0E0()
{
  return MEMORY[0x1E0D33A98]();
}

uint64_t sub_1B93EC0EC()
{
  return MEMORY[0x1E0D33AA0]();
}

uint64_t sub_1B93EC0F8()
{
  return MEMORY[0x1E0D33AA8]();
}

uint64_t sub_1B93EC104()
{
  return MEMORY[0x1E0D33AB0]();
}

uint64_t sub_1B93EC110()
{
  return MEMORY[0x1E0D33AC8]();
}

uint64_t sub_1B93EC11C()
{
  return MEMORY[0x1E0D33AD0]();
}

uint64_t sub_1B93EC128()
{
  return MEMORY[0x1E0D33AD8]();
}

uint64_t sub_1B93EC134()
{
  return MEMORY[0x1E0D1F410]();
}

uint64_t sub_1B93EC140()
{
  return MEMORY[0x1E0D1F418]();
}

uint64_t sub_1B93EC14C()
{
  return MEMORY[0x1E0D33738]();
}

uint64_t sub_1B93EC158()
{
  return MEMORY[0x1E0D33750]();
}

uint64_t sub_1B93EC164()
{
  return MEMORY[0x1E0D33758]();
}

uint64_t sub_1B93EC170()
{
  return MEMORY[0x1E0D33760]();
}

uint64_t sub_1B93EC17C()
{
  return MEMORY[0x1E0D33768]();
}

uint64_t sub_1B93EC188()
{
  return MEMORY[0x1E0D33788]();
}

uint64_t sub_1B93EC194()
{
  return MEMORY[0x1E0D33790]();
}

uint64_t sub_1B93EC1A0()
{
  return MEMORY[0x1E0D337A0]();
}

uint64_t sub_1B93EC1AC()
{
  return MEMORY[0x1E0D337A8]();
}

uint64_t sub_1B93EC1B8()
{
  return MEMORY[0x1E0D337C0]();
}

uint64_t sub_1B93EC1C4()
{
  return MEMORY[0x1E0D337C8]();
}

uint64_t sub_1B93EC1D0()
{
  return MEMORY[0x1E0D337D0]();
}

uint64_t sub_1B93EC1DC()
{
  return MEMORY[0x1E0D337D8]();
}

uint64_t sub_1B93EC1E8()
{
  return MEMORY[0x1E0D337E0]();
}

uint64_t sub_1B93EC1F4()
{
  return MEMORY[0x1E0D337E8]();
}

uint64_t sub_1B93EC200()
{
  return MEMORY[0x1E0D337F0]();
}

uint64_t sub_1B93EC20C()
{
  return MEMORY[0x1E0D337F8]();
}

uint64_t sub_1B93EC218()
{
  return MEMORY[0x1E0D33800]();
}

uint64_t sub_1B93EC224()
{
  return MEMORY[0x1E0D33808]();
}

uint64_t sub_1B93EC230()
{
  return MEMORY[0x1E0D33820]();
}

uint64_t sub_1B93EC23C()
{
  return MEMORY[0x1E0D33848]();
}

uint64_t sub_1B93EC248()
{
  return MEMORY[0x1E0D33858]();
}

uint64_t sub_1B93EC254()
{
  return MEMORY[0x1E0D33860]();
}

uint64_t sub_1B93EC260()
{
  return MEMORY[0x1E0D33868]();
}

uint64_t sub_1B93EC26C()
{
  return MEMORY[0x1E0D33870]();
}

uint64_t sub_1B93EC278()
{
  return MEMORY[0x1E0D33878]();
}

uint64_t sub_1B93EC284()
{
  return MEMORY[0x1E0D33880]();
}

uint64_t sub_1B93EC290()
{
  return MEMORY[0x1E0D338A8]();
}

uint64_t sub_1B93EC29C()
{
  return MEMORY[0x1E0D338B0]();
}

uint64_t sub_1B93EC2A8()
{
  return MEMORY[0x1E0D338C8]();
}

uint64_t sub_1B93EC2B4()
{
  return MEMORY[0x1E0D338D0]();
}

uint64_t sub_1B93EC2C0()
{
  return MEMORY[0x1E0D338F0]();
}

uint64_t sub_1B93EC2CC()
{
  return MEMORY[0x1E0D33910]();
}

uint64_t sub_1B93EC2D8()
{
  return MEMORY[0x1E0D33928]();
}

uint64_t sub_1B93EC2E4()
{
  return MEMORY[0x1E0D33930]();
}

uint64_t sub_1B93EC2F0()
{
  return MEMORY[0x1E0D33938]();
}

uint64_t sub_1B93EC2FC()
{
  return MEMORY[0x1E0D33958]();
}

uint64_t sub_1B93EC308()
{
  return MEMORY[0x1E0D33968]();
}

uint64_t sub_1B93EC314()
{
  return MEMORY[0x1E0D33970]();
}

uint64_t sub_1B93EC320()
{
  return MEMORY[0x1E0D33988]();
}

uint64_t sub_1B93EC32C()
{
  return MEMORY[0x1E0D33990]();
}

uint64_t sub_1B93EC338()
{
  return MEMORY[0x1E0D33998]();
}

uint64_t sub_1B93EC344()
{
  return MEMORY[0x1E0D339A0]();
}

uint64_t sub_1B93EC350()
{
  return MEMORY[0x1E0D339B0]();
}

uint64_t sub_1B93EC35C()
{
  return MEMORY[0x1E0D339B8]();
}

uint64_t sub_1B93EC368()
{
  return MEMORY[0x1E0D339C0]();
}

uint64_t sub_1B93EC374()
{
  return MEMORY[0x1E0D339C8]();
}

uint64_t sub_1B93EC380()
{
  return MEMORY[0x1E0D339D0]();
}

uint64_t sub_1B93EC38C()
{
  return MEMORY[0x1E0D339D8]();
}

uint64_t sub_1B93EC398()
{
  return MEMORY[0x1E0D31B68]();
}

uint64_t sub_1B93EC3A4()
{
  return MEMORY[0x1E0D31B78]();
}

uint64_t sub_1B93EC3B0()
{
  return MEMORY[0x1E0D31B80]();
}

uint64_t sub_1B93EC3BC()
{
  return MEMORY[0x1E0D31B98]();
}

uint64_t sub_1B93EC3C8()
{
  return MEMORY[0x1E0D31BA0]();
}

uint64_t sub_1B93EC3D4()
{
  return MEMORY[0x1E0D31BA8]();
}

uint64_t sub_1B93EC3E0()
{
  return MEMORY[0x1E0D31BB0]();
}

uint64_t sub_1B93EC3EC()
{
  return MEMORY[0x1E0D31BC0]();
}

uint64_t sub_1B93EC3F8()
{
  return MEMORY[0x1E0D31BE8]();
}

uint64_t sub_1B93EC404()
{
  return MEMORY[0x1E0D31BF0]();
}

uint64_t sub_1B93EC410()
{
  return MEMORY[0x1E0D31BF8]();
}

uint64_t sub_1B93EC41C()
{
  return MEMORY[0x1E0D31C00]();
}

uint64_t sub_1B93EC428()
{
  return MEMORY[0x1E0D31C08]();
}

uint64_t sub_1B93EC434()
{
  return MEMORY[0x1E0D31C10]();
}

uint64_t sub_1B93EC440()
{
  return MEMORY[0x1E0D31C18]();
}

uint64_t sub_1B93EC44C()
{
  return MEMORY[0x1E0D31C20]();
}

uint64_t sub_1B93EC458()
{
  return MEMORY[0x1E0D31C28]();
}

uint64_t sub_1B93EC464()
{
  return MEMORY[0x1E0D31C30]();
}

uint64_t sub_1B93EC470()
{
  return MEMORY[0x1E0D31C38]();
}

uint64_t sub_1B93EC47C()
{
  return MEMORY[0x1E0D31C40]();
}

uint64_t sub_1B93EC488()
{
  return MEMORY[0x1E0D31C48]();
}

uint64_t sub_1B93EC494()
{
  return MEMORY[0x1E0D31C50]();
}

uint64_t sub_1B93EC4A0()
{
  return MEMORY[0x1E0D31C58]();
}

uint64_t sub_1B93EC4AC()
{
  return MEMORY[0x1E0D31C60]();
}

uint64_t sub_1B93EC4B8()
{
  return MEMORY[0x1E0D31C68]();
}

uint64_t sub_1B93EC4C4()
{
  return MEMORY[0x1E0D31C70]();
}

uint64_t sub_1B93EC4D0()
{
  return MEMORY[0x1E0D31C78]();
}

uint64_t sub_1B93EC4DC()
{
  return MEMORY[0x1E0D31C80]();
}

uint64_t sub_1B93EC4E8()
{
  return MEMORY[0x1E0D31C88]();
}

uint64_t sub_1B93EC4F4()
{
  return MEMORY[0x1E0D31C90]();
}

uint64_t sub_1B93EC500()
{
  return MEMORY[0x1E0D31C98]();
}

uint64_t sub_1B93EC50C()
{
  return MEMORY[0x1E0D31CA0]();
}

uint64_t sub_1B93EC518()
{
  return MEMORY[0x1E0D31CA8]();
}

uint64_t sub_1B93EC524()
{
  return MEMORY[0x1E0D31CB0]();
}

uint64_t sub_1B93EC530()
{
  return MEMORY[0x1E0D31CB8]();
}

uint64_t sub_1B93EC53C()
{
  return MEMORY[0x1E0D31CC8]();
}

uint64_t sub_1B93EC548()
{
  return MEMORY[0x1E0D31CD0]();
}

uint64_t sub_1B93EC554()
{
  return MEMORY[0x1E0D31CE8]();
}

uint64_t sub_1B93EC560()
{
  return MEMORY[0x1E0D31D00]();
}

uint64_t sub_1B93EC56C()
{
  return MEMORY[0x1E0D31D10]();
}

uint64_t sub_1B93EC578()
{
  return MEMORY[0x1E0D31D30]();
}

uint64_t sub_1B93EC584()
{
  return MEMORY[0x1E0D31D38]();
}

uint64_t sub_1B93EC590()
{
  return MEMORY[0x1E0D31D40]();
}

uint64_t sub_1B93EC59C()
{
  return MEMORY[0x1E0D31D48]();
}

uint64_t sub_1B93EC5A8()
{
  return MEMORY[0x1E0D31D50]();
}

uint64_t sub_1B93EC5B4()
{
  return MEMORY[0x1E0D31D58]();
}

uint64_t sub_1B93EC5C0()
{
  return MEMORY[0x1E0D31D68]();
}

uint64_t sub_1B93EC5CC()
{
  return MEMORY[0x1E0D31D70]();
}

uint64_t sub_1B93EC5D8()
{
  return MEMORY[0x1E0D31D78]();
}

uint64_t sub_1B93EC5E4()
{
  return MEMORY[0x1E0D31D80]();
}

uint64_t sub_1B93EC5F0()
{
  return MEMORY[0x1E0D31D88]();
}

uint64_t sub_1B93EC5FC()
{
  return MEMORY[0x1E0D31D90]();
}

uint64_t sub_1B93EC608()
{
  return MEMORY[0x1E0D31DA0]();
}

uint64_t sub_1B93EC614()
{
  return MEMORY[0x1E0D31DA8]();
}

uint64_t sub_1B93EC620()
{
  return MEMORY[0x1E0D31DB8]();
}

uint64_t sub_1B93EC62C()
{
  return MEMORY[0x1E0D31DC0]();
}

uint64_t sub_1B93EC638()
{
  return MEMORY[0x1E0D31DD0]();
}

uint64_t sub_1B93EC644()
{
  return MEMORY[0x1E0D31DD8]();
}

uint64_t sub_1B93EC650()
{
  return MEMORY[0x1E0D31DE0]();
}

uint64_t sub_1B93EC65C()
{
  return MEMORY[0x1E0D31DE8]();
}

uint64_t sub_1B93EC668()
{
  return MEMORY[0x1E0D31DF8]();
}

uint64_t sub_1B93EC674()
{
  return MEMORY[0x1E0D31E00]();
}

uint64_t sub_1B93EC680()
{
  return MEMORY[0x1E0D31E08]();
}

uint64_t sub_1B93EC68C()
{
  return MEMORY[0x1E0D31E10]();
}

uint64_t sub_1B93EC698()
{
  return MEMORY[0x1E0D31E20]();
}

uint64_t sub_1B93EC6A4()
{
  return MEMORY[0x1E0D31E30]();
}

uint64_t sub_1B93EC6B0()
{
  return MEMORY[0x1E0D31E38]();
}

uint64_t sub_1B93EC6BC()
{
  return MEMORY[0x1E0D31E40]();
}

uint64_t sub_1B93EC6C8()
{
  return MEMORY[0x1E0D31E50]();
}

uint64_t sub_1B93EC6D4()
{
  return MEMORY[0x1E0D31E58]();
}

uint64_t sub_1B93EC6E0()
{
  return MEMORY[0x1E0D31E68]();
}

uint64_t sub_1B93EC6EC()
{
  return MEMORY[0x1E0D31E70]();
}

uint64_t sub_1B93EC6F8()
{
  return MEMORY[0x1E0D31EA0]();
}

uint64_t sub_1B93EC704()
{
  return MEMORY[0x1E0D31EA8]();
}

uint64_t sub_1B93EC710()
{
  return MEMORY[0x1E0D31EC8]();
}

uint64_t sub_1B93EC71C()
{
  return MEMORY[0x1E0D31ED0]();
}

uint64_t sub_1B93EC728()
{
  return MEMORY[0x1E0D31ED8]();
}

uint64_t sub_1B93EC734()
{
  return MEMORY[0x1E0D31EE8]();
}

uint64_t sub_1B93EC740()
{
  return MEMORY[0x1E0D31EF8]();
}

uint64_t sub_1B93EC74C()
{
  return MEMORY[0x1E0D31F00]();
}

uint64_t sub_1B93EC758()
{
  return MEMORY[0x1E0D31F10]();
}

uint64_t sub_1B93EC764()
{
  return MEMORY[0x1E0D31F20]();
}

uint64_t sub_1B93EC770()
{
  return MEMORY[0x1E0D31F30]();
}

uint64_t sub_1B93EC77C()
{
  return MEMORY[0x1E0D31F38]();
}

uint64_t sub_1B93EC788()
{
  return MEMORY[0x1E0D31F40]();
}

uint64_t sub_1B93EC794()
{
  return MEMORY[0x1E0D31F48]();
}

uint64_t sub_1B93EC7A0()
{
  return MEMORY[0x1E0D31F58]();
}

uint64_t sub_1B93EC7AC()
{
  return MEMORY[0x1E0D31F90]();
}

uint64_t sub_1B93EC7B8()
{
  return MEMORY[0x1E0D31F98]();
}

uint64_t sub_1B93EC7C4()
{
  return MEMORY[0x1E0D31FD8]();
}

uint64_t sub_1B93EC7D0()
{
  return MEMORY[0x1E0D31FE8]();
}

uint64_t sub_1B93EC7DC()
{
  return MEMORY[0x1E0D31FF0]();
}

uint64_t sub_1B93EC7E8()
{
  return MEMORY[0x1E0D31FF8]();
}

uint64_t sub_1B93EC7F4()
{
  return MEMORY[0x1E0D32010]();
}

uint64_t sub_1B93EC800()
{
  return MEMORY[0x1E0D32018]();
}

uint64_t sub_1B93EC80C()
{
  return MEMORY[0x1E0D32028]();
}

uint64_t sub_1B93EC818()
{
  return MEMORY[0x1E0D32038]();
}

uint64_t sub_1B93EC824()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1B93EC830()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1B93EC83C()
{
  return MEMORY[0x1E0D32C08]();
}

uint64_t sub_1B93EC848()
{
  return MEMORY[0x1E0D329F8]();
}

uint64_t sub_1B93EC854()
{
  return MEMORY[0x1E0D32048]();
}

uint64_t sub_1B93EC860()
{
  return MEMORY[0x1E0D335E8]();
}

uint64_t sub_1B93EC86C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B93EC878()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B93EC884()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B93EC890()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1B93EC89C()
{
  return MEMORY[0x1E0D2FCA0]();
}

uint64_t sub_1B93EC8A8()
{
  return MEMORY[0x1E0D2FCB0]();
}

uint64_t sub_1B93EC8B4()
{
  return MEMORY[0x1E0D2FCB8]();
}

uint64_t sub_1B93EC8C0()
{
  return MEMORY[0x1E0D2FCC0]();
}

uint64_t sub_1B93EC8CC()
{
  return MEMORY[0x1E0D2FCC8]();
}

uint64_t sub_1B93EC8D8()
{
  return MEMORY[0x1E0D2FCD0]();
}

uint64_t sub_1B93EC8E4()
{
  return MEMORY[0x1E0D2FCD8]();
}

uint64_t sub_1B93EC8F0()
{
  return MEMORY[0x1E0D2FCE0]();
}

uint64_t sub_1B93EC8FC()
{
  return MEMORY[0x1E0D2FCE8]();
}

uint64_t sub_1B93EC908()
{
  return MEMORY[0x1E0D2FCF8]();
}

uint64_t sub_1B93EC914()
{
  return MEMORY[0x1E0D2FD08]();
}

uint64_t sub_1B93EC920()
{
  return MEMORY[0x1E0D2FD18]();
}

uint64_t sub_1B93EC92C()
{
  return MEMORY[0x1E0D2FD38]();
}

uint64_t sub_1B93EC938()
{
  return MEMORY[0x1E0D2FD40]();
}

uint64_t sub_1B93EC944()
{
  return MEMORY[0x1E0D2FD50]();
}

uint64_t sub_1B93EC950()
{
  return MEMORY[0x1E0D2FD58]();
}

uint64_t sub_1B93EC95C()
{
  return MEMORY[0x1E0D2FD68]();
}

uint64_t sub_1B93EC968()
{
  return MEMORY[0x1E0D2FD70]();
}

uint64_t sub_1B93EC974()
{
  return MEMORY[0x1E0D2FD78]();
}

uint64_t sub_1B93EC980()
{
  return MEMORY[0x1E0D2FD80]();
}

uint64_t sub_1B93EC98C()
{
  return MEMORY[0x1E0D2FD88]();
}

uint64_t sub_1B93EC998()
{
  return MEMORY[0x1E0D2FDB0]();
}

uint64_t sub_1B93EC9A4()
{
  return MEMORY[0x1E0D2FDD0]();
}

uint64_t sub_1B93EC9B0()
{
  return MEMORY[0x1E0D2FDD8]();
}

uint64_t sub_1B93EC9BC()
{
  return MEMORY[0x1E0D2FDE0]();
}

uint64_t sub_1B93EC9C8()
{
  return MEMORY[0x1E0D2FDE8]();
}

uint64_t sub_1B93EC9D4()
{
  return MEMORY[0x1E0D2FDF0]();
}

uint64_t sub_1B93EC9E0()
{
  return MEMORY[0x1E0D2FDF8]();
}

uint64_t sub_1B93EC9EC()
{
  return MEMORY[0x1E0D2FE00]();
}

uint64_t sub_1B93EC9F8()
{
  return MEMORY[0x1E0D2FE08]();
}

uint64_t sub_1B93ECA04()
{
  return MEMORY[0x1E0D2FE10]();
}

uint64_t sub_1B93ECA10()
{
  return MEMORY[0x1E0D2FE18]();
}

uint64_t sub_1B93ECA1C()
{
  return MEMORY[0x1E0D2FE20]();
}

uint64_t sub_1B93ECA28()
{
  return MEMORY[0x1E0D2FE28]();
}

uint64_t sub_1B93ECA34()
{
  return MEMORY[0x1E0D2FE30]();
}

uint64_t sub_1B93ECA40()
{
  return MEMORY[0x1E0D2FE38]();
}

uint64_t sub_1B93ECA4C()
{
  return MEMORY[0x1E0D2FE50]();
}

uint64_t sub_1B93ECA58()
{
  return MEMORY[0x1E0D2FE58]();
}

uint64_t sub_1B93ECA64()
{
  return MEMORY[0x1E0D2FE68]();
}

uint64_t sub_1B93ECA70()
{
  return MEMORY[0x1E0D2FE78]();
}

uint64_t sub_1B93ECA7C()
{
  return MEMORY[0x1E0D2FE80]();
}

uint64_t sub_1B93ECA88()
{
  return MEMORY[0x1E0D2FE88]();
}

uint64_t sub_1B93ECA94()
{
  return MEMORY[0x1E0D2FE90]();
}

uint64_t sub_1B93ECAA0()
{
  return MEMORY[0x1E0D2FE98]();
}

uint64_t sub_1B93ECAAC()
{
  return MEMORY[0x1E0D2FEA0]();
}

uint64_t sub_1B93ECAB8()
{
  return MEMORY[0x1E0D2FEA8]();
}

uint64_t sub_1B93ECAC4()
{
  return MEMORY[0x1E0D2FEB0]();
}

uint64_t sub_1B93ECAD0()
{
  return MEMORY[0x1E0D2FEB8]();
}

uint64_t sub_1B93ECADC()
{
  return MEMORY[0x1E0D2FED0]();
}

uint64_t sub_1B93ECAE8()
{
  return MEMORY[0x1E0D2FED8]();
}

uint64_t sub_1B93ECAF4()
{
  return MEMORY[0x1E0D2FEE0]();
}

uint64_t sub_1B93ECB00()
{
  return MEMORY[0x1E0D2FEE8]();
}

uint64_t sub_1B93ECB0C()
{
  return MEMORY[0x1E0D2FEF0]();
}

uint64_t sub_1B93ECB18()
{
  return MEMORY[0x1E0D2FEF8]();
}

uint64_t sub_1B93ECB24()
{
  return MEMORY[0x1E0D2FF00]();
}

uint64_t sub_1B93ECB30()
{
  return MEMORY[0x1E0D2FF08]();
}

uint64_t sub_1B93ECB3C()
{
  return MEMORY[0x1E0D2FF10]();
}

uint64_t sub_1B93ECB48()
{
  return MEMORY[0x1E0D2FF18]();
}

uint64_t sub_1B93ECB54()
{
  return MEMORY[0x1E0D2FF20]();
}

uint64_t sub_1B93ECB60()
{
  return MEMORY[0x1E0D2FF28]();
}

uint64_t sub_1B93ECB6C()
{
  return MEMORY[0x1E0D2FF48]();
}

uint64_t sub_1B93ECB78()
{
  return MEMORY[0x1E0D2FF50]();
}

uint64_t sub_1B93ECB84()
{
  return MEMORY[0x1E0D2FF68]();
}

uint64_t sub_1B93ECB90()
{
  return MEMORY[0x1E0D2FF88]();
}

uint64_t sub_1B93ECB9C()
{
  return MEMORY[0x1E0D2FF98]();
}

uint64_t sub_1B93ECBA8()
{
  return MEMORY[0x1E0D2FFA0]();
}

uint64_t sub_1B93ECBB4()
{
  return MEMORY[0x1E0D2FFA8]();
}

uint64_t sub_1B93ECBC0()
{
  return MEMORY[0x1E0D2FFB0]();
}

uint64_t sub_1B93ECBCC()
{
  return MEMORY[0x1E0D2FFB8]();
}

uint64_t sub_1B93ECBD8()
{
  return MEMORY[0x1E0D2FFC0]();
}

uint64_t sub_1B93ECBE4()
{
  return MEMORY[0x1E0D2FFC8]();
}

uint64_t sub_1B93ECBF0()
{
  return MEMORY[0x1E0D2FFD0]();
}

uint64_t sub_1B93ECBFC()
{
  return MEMORY[0x1E0D2FFD8]();
}

uint64_t sub_1B93ECC08()
{
  return MEMORY[0x1E0D2FFE0]();
}

uint64_t sub_1B93ECC14()
{
  return MEMORY[0x1E0D2FFE8]();
}

uint64_t sub_1B93ECC20()
{
  return MEMORY[0x1E0D2FFF0]();
}

uint64_t sub_1B93ECC2C()
{
  return MEMORY[0x1E0D2FFF8]();
}

uint64_t sub_1B93ECC38()
{
  return MEMORY[0x1E0D30008]();
}

uint64_t sub_1B93ECC44()
{
  return MEMORY[0x1E0D30020]();
}

uint64_t sub_1B93ECC50()
{
  return MEMORY[0x1E0D30028]();
}

uint64_t sub_1B93ECC5C()
{
  return MEMORY[0x1E0CE9A38]();
}

uint64_t sub_1B93ECC68()
{
  return MEMORY[0x1E0CE9A58]();
}

uint64_t sub_1B93ECC74()
{
  return MEMORY[0x1E0CE9A70]();
}

uint64_t sub_1B93ECC80()
{
  return MEMORY[0x1E0CE9A80]();
}

uint64_t sub_1B93ECC8C()
{
  return MEMORY[0x1E0CE9A88]();
}

uint64_t sub_1B93ECC98()
{
  return MEMORY[0x1E0CE9A90]();
}

uint64_t sub_1B93ECCA4()
{
  return MEMORY[0x1E0CE9AA0]();
}

uint64_t sub_1B93ECCB0()
{
  return MEMORY[0x1E0CE9AA8]();
}

uint64_t sub_1B93ECCBC()
{
  return MEMORY[0x1E0CE9AB0]();
}

uint64_t sub_1B93ECCC8()
{
  return MEMORY[0x1E0CE9AC8]();
}

uint64_t sub_1B93ECCD4()
{
  return MEMORY[0x1E0CE9AD0]();
}

uint64_t sub_1B93ECCE0()
{
  return MEMORY[0x1E0CE9B58]();
}

uint64_t sub_1B93ECCEC()
{
  return MEMORY[0x1E0CE9B60]();
}

uint64_t sub_1B93ECCF8()
{
  return MEMORY[0x1E0CE9B68]();
}

uint64_t sub_1B93ECD04()
{
  return MEMORY[0x1E0CE9B78]();
}

uint64_t sub_1B93ECD10()
{
  return MEMORY[0x1E0CE9B90]();
}

uint64_t sub_1B93ECD1C()
{
  return MEMORY[0x1E0CE9B98]();
}

uint64_t sub_1B93ECD28()
{
  return MEMORY[0x1E0CE9BA0]();
}

uint64_t sub_1B93ECD34()
{
  return MEMORY[0x1E0CE9BB0]();
}

uint64_t sub_1B93ECD40()
{
  return MEMORY[0x1E0CE9BC8]();
}

uint64_t sub_1B93ECD4C()
{
  return MEMORY[0x1E0CE9BD0]();
}

uint64_t sub_1B93ECD58()
{
  return MEMORY[0x1E0CE9BD8]();
}

uint64_t sub_1B93ECD64()
{
  return MEMORY[0x1E0CE9BE0]();
}

uint64_t sub_1B93ECD70()
{
  return MEMORY[0x1E0CE9BE8]();
}

uint64_t sub_1B93ECD7C()
{
  return MEMORY[0x1E0CE9BF0]();
}

uint64_t sub_1B93ECD88()
{
  return MEMORY[0x1E0CE9BF8]();
}

uint64_t sub_1B93ECD94()
{
  return MEMORY[0x1E0CE9C00]();
}

uint64_t sub_1B93ECDA0()
{
  return MEMORY[0x1E0CE9C08]();
}

uint64_t sub_1B93ECDAC()
{
  return MEMORY[0x1E0CE9C10]();
}

uint64_t sub_1B93ECDB8()
{
  return MEMORY[0x1E0CE9C20]();
}

uint64_t sub_1B93ECDC4()
{
  return MEMORY[0x1E0CE9C28]();
}

uint64_t sub_1B93ECDD0()
{
  return MEMORY[0x1E0CE9C30]();
}

uint64_t sub_1B93ECDDC()
{
  return MEMORY[0x1E0CE9C50]();
}

uint64_t sub_1B93ECDE8()
{
  return MEMORY[0x1E0CE9C58]();
}

uint64_t sub_1B93ECDF4()
{
  return MEMORY[0x1E0CE9C70]();
}

uint64_t sub_1B93ECE00()
{
  return MEMORY[0x1E0CE9C78]();
}

uint64_t sub_1B93ECE0C()
{
  return MEMORY[0x1E0CE9C80]();
}

uint64_t sub_1B93ECE18()
{
  return MEMORY[0x1E0CE9C88]();
}

uint64_t sub_1B93ECE24()
{
  return MEMORY[0x1E0CE9C90]();
}

uint64_t sub_1B93ECE30()
{
  return MEMORY[0x1E0CE9C98]();
}

uint64_t sub_1B93ECE3C()
{
  return MEMORY[0x1E0CE9CA0]();
}

uint64_t sub_1B93ECE48()
{
  return MEMORY[0x1E0CE9CA8]();
}

uint64_t sub_1B93ECE54()
{
  return MEMORY[0x1E0CE9CB0]();
}

uint64_t sub_1B93ECE60()
{
  return MEMORY[0x1E0CE9CB8]();
}

uint64_t sub_1B93ECE6C()
{
  return MEMORY[0x1E0CE9CC0]();
}

uint64_t sub_1B93ECE78()
{
  return MEMORY[0x1E0CE9CC8]();
}

uint64_t sub_1B93ECE84()
{
  return MEMORY[0x1E0CE9CD8]();
}

uint64_t sub_1B93ECE90()
{
  return MEMORY[0x1E0CE9D98]();
}

uint64_t sub_1B93ECE9C()
{
  return MEMORY[0x1E0CE9DA0]();
}

uint64_t sub_1B93ECEA8()
{
  return MEMORY[0x1E0CE9DA8]();
}

uint64_t sub_1B93ECEB4()
{
  return MEMORY[0x1E0CE9DB0]();
}

uint64_t sub_1B93ECEC0()
{
  return MEMORY[0x1E0CE9258]();
}

uint64_t sub_1B93ECECC()
{
  return MEMORY[0x1E0CE9268]();
}

uint64_t sub_1B93ECED8()
{
  return MEMORY[0x1E0CE9288]();
}

uint64_t sub_1B93ECEE4()
{
  return MEMORY[0x1E0CE92B0]();
}

uint64_t sub_1B93ECEF0()
{
  return MEMORY[0x1E0CE92C8]();
}

uint64_t sub_1B93ECEFC()
{
  return MEMORY[0x1E0CE92E0]();
}

uint64_t sub_1B93ECF08()
{
  return MEMORY[0x1E0CE92E8]();
}

uint64_t sub_1B93ECF14()
{
  return MEMORY[0x1E0CE9300]();
}

uint64_t sub_1B93ECF20()
{
  return MEMORY[0x1E0CE9318]();
}

uint64_t sub_1B93ECF2C()
{
  return MEMORY[0x1E0CE9330]();
}

uint64_t sub_1B93ECF38()
{
  return MEMORY[0x1E0CE9340]();
}

uint64_t sub_1B93ECF44()
{
  return MEMORY[0x1E0CE9350]();
}

uint64_t sub_1B93ECF50()
{
  return MEMORY[0x1E0CE9368]();
}

uint64_t sub_1B93ECF5C()
{
  return MEMORY[0x1E0CE93D8]();
}

uint64_t sub_1B93ECF68()
{
  return MEMORY[0x1E0CE93F0]();
}

uint64_t sub_1B93ECF74()
{
  return MEMORY[0x1E0CE9410]();
}

uint64_t sub_1B93ECF80()
{
  return MEMORY[0x1E0CE9430]();
}

uint64_t sub_1B93ECF8C()
{
  return MEMORY[0x1E0CE9458]();
}

uint64_t sub_1B93ECF98()
{
  return MEMORY[0x1E0CE9490]();
}

uint64_t sub_1B93ECFA4()
{
  return MEMORY[0x1E0CE94D8]();
}

uint64_t sub_1B93ECFB0()
{
  return MEMORY[0x1E0CE94F8]();
}

uint64_t sub_1B93ECFBC()
{
  return MEMORY[0x1E0CE9510]();
}

uint64_t sub_1B93ECFC8()
{
  return MEMORY[0x1E0CE95C8]();
}

uint64_t sub_1B93ECFD4()
{
  return MEMORY[0x1E0CE95F0]();
}

uint64_t sub_1B93ECFE0()
{
  return MEMORY[0x1E0CE9630]();
}

uint64_t sub_1B93ECFEC()
{
  return MEMORY[0x1E0CE9650]();
}

uint64_t sub_1B93ECFF8()
{
  return MEMORY[0x1E0CE9658]();
}

uint64_t sub_1B93ED004()
{
  return MEMORY[0x1E0CE9670]();
}

uint64_t sub_1B93ED010()
{
  return MEMORY[0x1E0CE9680]();
}

uint64_t sub_1B93ED01C()
{
  return MEMORY[0x1E0CE9698]();
}

uint64_t sub_1B93ED028()
{
  return MEMORY[0x1E0CE96A0]();
}

uint64_t sub_1B93ED034()
{
  return MEMORY[0x1E0CE96C0]();
}

uint64_t sub_1B93ED040()
{
  return MEMORY[0x1E0CE96C8]();
}

uint64_t sub_1B93ED04C()
{
  return MEMORY[0x1E0CE96E0]();
}

uint64_t sub_1B93ED058()
{
  return MEMORY[0x1E0CE96E8]();
}

uint64_t sub_1B93ED064()
{
  return MEMORY[0x1E0CE9718]();
}

uint64_t sub_1B93ED070()
{
  return MEMORY[0x1E0CE9738]();
}

uint64_t sub_1B93ED07C()
{
  return MEMORY[0x1E0CE9740]();
}

uint64_t sub_1B93ED088()
{
  return MEMORY[0x1E0CE9760]();
}

uint64_t sub_1B93ED094()
{
  return MEMORY[0x1E0CE9778]();
}

uint64_t sub_1B93ED0A0()
{
  return MEMORY[0x1E0CE9798]();
}

uint64_t sub_1B93ED0AC()
{
  return MEMORY[0x1E0CE97A0]();
}

uint64_t sub_1B93ED0B8()
{
  return MEMORY[0x1E0CE97C8]();
}

uint64_t sub_1B93ED0C4()
{
  return MEMORY[0x1E0CE9858]();
}

uint64_t sub_1B93ED0D0()
{
  return MEMORY[0x1E0CE9878]();
}

uint64_t sub_1B93ED0DC()
{
  return MEMORY[0x1E0CE9890]();
}

uint64_t sub_1B93ED0E8()
{
  return MEMORY[0x1E0CE98A0]();
}

uint64_t sub_1B93ED0F4()
{
  return MEMORY[0x1E0CE98A8]();
}

uint64_t sub_1B93ED100()
{
  return MEMORY[0x1E0CE98C0]();
}

uint64_t sub_1B93ED10C()
{
  return MEMORY[0x1E0CE98E8]();
}

uint64_t sub_1B93ED118()
{
  return MEMORY[0x1E0CE98F0]();
}

uint64_t sub_1B93ED124()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1B93ED130()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1B93ED13C()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_1B93ED148()
{
  return MEMORY[0x1E0C96030]();
}

uint64_t sub_1B93ED154()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1B93ED160()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1B93ED16C()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1B93ED178()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1B93ED184()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1B93ED190()
{
  return MEMORY[0x1E0D33608]();
}

uint64_t sub_1B93ED19C()
{
  return MEMORY[0x1E0D33610]();
}

uint64_t sub_1B93ED1A8()
{
  return MEMORY[0x1E0D33618]();
}

uint64_t sub_1B93ED1B4()
{
  return MEMORY[0x1E0D33660]();
}

uint64_t sub_1B93ED1C0()
{
  return MEMORY[0x1E0D33670]();
}

uint64_t sub_1B93ED1CC()
{
  return MEMORY[0x1E0D33678]();
}

uint64_t sub_1B93ED1D8()
{
  return MEMORY[0x1E0D33690]();
}

uint64_t sub_1B93ED1E4()
{
  return MEMORY[0x1E0D336A0]();
}

uint64_t sub_1B93ED1F0()
{
  return MEMORY[0x1E0D336A8]();
}

uint64_t sub_1B93ED1FC()
{
  return MEMORY[0x1E0CD82E8]();
}

uint64_t sub_1B93ED208()
{
  return MEMORY[0x1E0CD8318]();
}

uint64_t sub_1B93ED214()
{
  return MEMORY[0x1E0CD8338]();
}

uint64_t sub_1B93ED220()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1B93ED22C()
{
  return MEMORY[0x1E0CD85B0]();
}

uint64_t sub_1B93ED238()
{
  return MEMORY[0x1E0CD85C0]();
}

uint64_t sub_1B93ED244()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_1B93ED250()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_1B93ED25C()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1B93ED268()
{
  return MEMORY[0x1E0CD8820]();
}

uint64_t sub_1B93ED274()
{
  return MEMORY[0x1E0CD8970]();
}

uint64_t sub_1B93ED280()
{
  return MEMORY[0x1E0CD8B48]();
}

uint64_t sub_1B93ED28C()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_1B93ED298()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_1B93ED2A4()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_1B93ED2B0()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1B93ED2BC()
{
  return MEMORY[0x1E0CD8E78]();
}

uint64_t sub_1B93ED2C8()
{
  return MEMORY[0x1E0CD8E80]();
}

uint64_t sub_1B93ED2D4()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1B93ED2E0()
{
  return MEMORY[0x1E0CD9798]();
}

uint64_t sub_1B93ED2EC()
{
  return MEMORY[0x1E0CD97A0]();
}

uint64_t sub_1B93ED2F8()
{
  return MEMORY[0x1E0CD97B0]();
}

uint64_t sub_1B93ED304()
{
  return MEMORY[0x1E0CD9808]();
}

uint64_t sub_1B93ED310()
{
  return MEMORY[0x1E0CD9810]();
}

uint64_t sub_1B93ED31C()
{
  return MEMORY[0x1E0CD98C8]();
}

uint64_t sub_1B93ED328()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_1B93ED334()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1B93ED340()
{
  return MEMORY[0x1E0CD9C90]();
}

uint64_t sub_1B93ED34C()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1B93ED358()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_1B93ED364()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_1B93ED370()
{
  return MEMORY[0x1E0CDA4B0]();
}

uint64_t sub_1B93ED37C()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_1B93ED388()
{
  return MEMORY[0x1E0CDA4E8]();
}

uint64_t sub_1B93ED394()
{
  return MEMORY[0x1E0CDA618]();
}

uint64_t sub_1B93ED3A0()
{
  return MEMORY[0x1E0CDA620]();
}

uint64_t sub_1B93ED3AC()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_1B93ED3B8()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_1B93ED3C4()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_1B93ED3D0()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_1B93ED3DC()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1B93ED3E8()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1B93ED3F4()
{
  return MEMORY[0x1E0CDA938]();
}

uint64_t sub_1B93ED400()
{
  return MEMORY[0x1E0CDA9C0]();
}

uint64_t sub_1B93ED40C()
{
  return MEMORY[0x1E0CDA9C8]();
}

uint64_t sub_1B93ED418()
{
  return MEMORY[0x1E0CDA9F0]();
}

uint64_t sub_1B93ED424()
{
  return MEMORY[0x1E0CDA9F8]();
}

uint64_t sub_1B93ED430()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1B93ED43C()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1B93ED448()
{
  return MEMORY[0x1E0CDAC40]();
}

uint64_t sub_1B93ED454()
{
  return MEMORY[0x1E0CDAC48]();
}

uint64_t sub_1B93ED460()
{
  return MEMORY[0x1E0CDAC98]();
}

uint64_t sub_1B93ED46C()
{
  return MEMORY[0x1E0CDACB8]();
}

uint64_t sub_1B93ED478()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1B93ED484()
{
  return MEMORY[0x1E0CDB020]();
}

uint64_t sub_1B93ED490()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1B93ED49C()
{
  return MEMORY[0x1E0CDB268]();
}

uint64_t sub_1B93ED4A8()
{
  return MEMORY[0x1E0CDB288]();
}

uint64_t sub_1B93ED4B4()
{
  return MEMORY[0x1E0CDB400]();
}

uint64_t sub_1B93ED4C0()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1B93ED4CC()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1B93ED4D8()
{
  return MEMORY[0x1E0CDB530]();
}

uint64_t sub_1B93ED4E4()
{
  return MEMORY[0x1E0CDB538]();
}

uint64_t sub_1B93ED4F0()
{
  return MEMORY[0x1E0CDB558]();
}

uint64_t sub_1B93ED4FC()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1B93ED508()
{
  return MEMORY[0x1E0CDB610]();
}

uint64_t sub_1B93ED514()
{
  return MEMORY[0x1E0CDB618]();
}

uint64_t sub_1B93ED520()
{
  return MEMORY[0x1E0CDB628]();
}

uint64_t sub_1B93ED52C()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_1B93ED538()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_1B93ED544()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_1B93ED550()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_1B93ED55C()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_1B93ED568()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_1B93ED574()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_1B93ED580()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_1B93ED58C()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_1B93ED598()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_1B93ED5A4()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_1B93ED5B0()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_1B93ED5BC()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1B93ED5C8()
{
  return MEMORY[0x1E0CDBD58]();
}

uint64_t sub_1B93ED5D4()
{
  return MEMORY[0x1E0CDBD70]();
}

uint64_t sub_1B93ED5E0()
{
  return MEMORY[0x1E0CDBEF8]();
}

uint64_t sub_1B93ED5EC()
{
  return MEMORY[0x1E0CDBF98]();
}

uint64_t sub_1B93ED5F8()
{
  return MEMORY[0x1E0CDBFA8]();
}

uint64_t sub_1B93ED604()
{
  return MEMORY[0x1E0CDC100]();
}

uint64_t sub_1B93ED610()
{
  return MEMORY[0x1E0CDC108]();
}

uint64_t sub_1B93ED61C()
{
  return MEMORY[0x1E0CDC350]();
}

uint64_t sub_1B93ED628()
{
  return MEMORY[0x1E0CDC368]();
}

uint64_t sub_1B93ED634()
{
  return MEMORY[0x1E0CDC388]();
}

uint64_t sub_1B93ED640()
{
  return MEMORY[0x1E0CDC3A8]();
}

uint64_t sub_1B93ED64C()
{
  return MEMORY[0x1E0CDC408]();
}

uint64_t sub_1B93ED658()
{
  return MEMORY[0x1E0CDC418]();
}

uint64_t sub_1B93ED664()
{
  return MEMORY[0x1E0CDC7A0]();
}

uint64_t sub_1B93ED670()
{
  return MEMORY[0x1E0CDC7A8]();
}

uint64_t sub_1B93ED67C()
{
  return MEMORY[0x1E0CDC978]();
}

uint64_t sub_1B93ED688()
{
  return MEMORY[0x1E0CDC990]();
}

uint64_t sub_1B93ED694()
{
  return MEMORY[0x1E0CDCAE0]();
}

uint64_t sub_1B93ED6A0()
{
  return MEMORY[0x1E0CDCAE8]();
}

uint64_t sub_1B93ED6AC()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1B93ED6B8()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1B93ED6C4()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1B93ED6D0()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1B93ED6DC()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1B93ED6E8()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1B93ED6F4()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1B93ED700()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1B93ED70C()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_1B93ED718()
{
  return MEMORY[0x1E0CDD218]();
}

uint64_t sub_1B93ED724()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1B93ED730()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_1B93ED73C()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1B93ED748()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1B93ED754()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1B93ED760()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1B93ED76C()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_1B93ED778()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1B93ED784()
{
  return MEMORY[0x1E0CDD3C0]();
}

uint64_t sub_1B93ED790()
{
  return MEMORY[0x1E0CDD418]();
}

uint64_t sub_1B93ED79C()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1B93ED7A8()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_1B93ED7B4()
{
  return MEMORY[0x1E0CDD4E0]();
}

uint64_t sub_1B93ED7C0()
{
  return MEMORY[0x1E0CDD520]();
}

uint64_t sub_1B93ED7CC()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_1B93ED7D8()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_1B93ED7E4()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_1B93ED7F0()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1B93ED7FC()
{
  return MEMORY[0x1E0CDD638]();
}

uint64_t sub_1B93ED808()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_1B93ED814()
{
  return MEMORY[0x1E0CDD728]();
}

uint64_t sub_1B93ED820()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_1B93ED82C()
{
  return MEMORY[0x1E0CDD780]();
}

uint64_t sub_1B93ED838()
{
  return MEMORY[0x1E0CDD878]();
}

uint64_t sub_1B93ED844()
{
  return MEMORY[0x1E0CDD920]();
}

uint64_t sub_1B93ED850()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_1B93ED85C()
{
  return MEMORY[0x1E0CDDAA0]();
}

uint64_t sub_1B93ED868()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_1B93ED874()
{
  return MEMORY[0x1E0CDDB98]();
}

uint64_t sub_1B93ED880()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1B93ED88C()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1B93ED898()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1B93ED8A4()
{
  return MEMORY[0x1E0CE9910]();
}

uint64_t sub_1B93ED8B0()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1B93ED8BC()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1B93ED8C8()
{
  return MEMORY[0x1E0CDDE78]();
}

uint64_t sub_1B93ED8D4()
{
  return MEMORY[0x1E0CDDEF0]();
}

uint64_t sub_1B93ED8E0()
{
  return MEMORY[0x1E0CDDF08]();
}

uint64_t sub_1B93ED8EC()
{
  return MEMORY[0x1E0CDE140]();
}

uint64_t sub_1B93ED8F8()
{
  return MEMORY[0x1E0CDE230]();
}

uint64_t sub_1B93ED904()
{
  return MEMORY[0x1E0CDE2A8]();
}

uint64_t sub_1B93ED910()
{
  return MEMORY[0x1E0CDE2E8]();
}

uint64_t sub_1B93ED91C()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1B93ED928()
{
  return MEMORY[0x1E0CDE968]();
}

uint64_t sub_1B93ED934()
{
  return MEMORY[0x1E0CDEA88]();
}

uint64_t sub_1B93ED940()
{
  return MEMORY[0x1E0CDEC40]();
}

uint64_t sub_1B93ED94C()
{
  return MEMORY[0x1E0CDEC48]();
}

uint64_t sub_1B93ED958()
{
  return MEMORY[0x1E0CDEEB0]();
}

uint64_t sub_1B93ED964()
{
  return MEMORY[0x1E0CDEF58]();
}

uint64_t sub_1B93ED970()
{
  return MEMORY[0x1E0CDF020]();
}

uint64_t sub_1B93ED97C()
{
  return MEMORY[0x1E0CDF130]();
}

uint64_t sub_1B93ED988()
{
  return MEMORY[0x1E0CDF158]();
}

uint64_t sub_1B93ED994()
{
  return MEMORY[0x1E0CDF2B0]();
}

uint64_t sub_1B93ED9A0()
{
  return MEMORY[0x1E0CDF328]();
}

uint64_t sub_1B93ED9AC()
{
  return MEMORY[0x1E0CDF330]();
}

uint64_t sub_1B93ED9B8()
{
  return MEMORY[0x1E0CDF340]();
}

uint64_t sub_1B93ED9C4()
{
  return MEMORY[0x1E0CDF350]();
}

uint64_t sub_1B93ED9D0()
{
  return MEMORY[0x1E0CDF358]();
}

uint64_t sub_1B93ED9DC()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1B93ED9E8()
{
  return MEMORY[0x1E0CDF3F0]();
}

uint64_t sub_1B93ED9F4()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_1B93EDA00()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_1B93EDA0C()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_1B93EDA18()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_1B93EDA24()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_1B93EDA30()
{
  return MEMORY[0x1E0CDF4E8]();
}

uint64_t sub_1B93EDA3C()
{
  return MEMORY[0x1E0CDF520]();
}

uint64_t sub_1B93EDA48()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_1B93EDA54()
{
  return MEMORY[0x1E0CDF5F8]();
}

uint64_t sub_1B93EDA60()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_1B93EDA6C()
{
  return MEMORY[0x1E0CDF648]();
}

uint64_t sub_1B93EDA78()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t sub_1B93EDA84()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1B93EDA90()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_1B93EDA9C()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_1B93EDAA8()
{
  return MEMORY[0x1E0CDF758]();
}

uint64_t sub_1B93EDAB4()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_1B93EDAC0()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_1B93EDACC()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_1B93EDAD8()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1B93EDAE4()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1B93EDAF0()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1B93EDAFC()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1B93EDB08()
{
  return MEMORY[0x1E0CDF9A8]();
}

uint64_t sub_1B93EDB14()
{
  return MEMORY[0x1E0CDF9E8]();
}

uint64_t sub_1B93EDB20()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1B93EDB2C()
{
  return MEMORY[0x1E0CDFA28]();
}

uint64_t sub_1B93EDB38()
{
  return MEMORY[0x1E0CDFC40]();
}

uint64_t sub_1B93EDB44()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_1B93EDB50()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1B93EDB5C()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_1B93EDB68()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_1B93EDB74()
{
  return MEMORY[0x1E0CDFD90]();
}

uint64_t sub_1B93EDB80()
{
  return MEMORY[0x1E0CDFDB8]();
}

uint64_t sub_1B93EDB8C()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_1B93EDB98()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_1B93EDBA4()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_1B93EDBB0()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_1B93EDBBC()
{
  return MEMORY[0x1E0CDFEF0]();
}

uint64_t sub_1B93EDBC8()
{
  return MEMORY[0x1E0CDFF30]();
}

uint64_t sub_1B93EDBD4()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_1B93EDBE0()
{
  return MEMORY[0x1E0CDFF58]();
}

uint64_t sub_1B93EDBEC()
{
  return MEMORY[0x1E0CDFF60]();
}

uint64_t sub_1B93EDBF8()
{
  return MEMORY[0x1E0CDFF78]();
}

uint64_t sub_1B93EDC04()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1B93EDC10()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_1B93EDC1C()
{
  return MEMORY[0x1E0CE06D0]();
}

uint64_t sub_1B93EDC28()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B93EDC34()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B93EDC40()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B93EDC4C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1B93EDC58()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1B93EDC64()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1B93EDC70()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1B93EDC7C()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1B93EDC88()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1B93EDC94()
{
  return MEMORY[0x1E0D1F340]();
}

uint64_t sub_1B93EDCA0()
{
  return MEMORY[0x1E0D1F348]();
}

uint64_t sub_1B93EDCAC()
{
  return MEMORY[0x1E0D1F3A8]();
}

uint64_t sub_1B93EDCB8()
{
  return MEMORY[0x1E0D1F3D8]();
}

uint64_t sub_1B93EDCC4()
{
  return MEMORY[0x1E0D1F3F8]();
}

uint64_t sub_1B93EDCD0()
{
  return MEMORY[0x1E0D1F408]();
}

uint64_t sub_1B93EDCDC()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1B93EDCE8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B93EDCF4()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t sub_1B93EDD00()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B93EDD0C()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1B93EDD18()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B93EDD24()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_1B93EDD30()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1B93EDD3C()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1B93EDD48()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1B93EDD54()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B93EDD60()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B93EDD6C()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B93EDD78()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B93EDD84()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B93EDD90()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1B93EDD9C()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B93EDDA8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B93EDDB4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B93EDDC0()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1B93EDDCC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B93EDDD8()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1B93EDDE4()
{
  return MEMORY[0x1E0D32A00]();
}

uint64_t sub_1B93EDDF0()
{
  return MEMORY[0x1E0D32A08]();
}

uint64_t sub_1B93EDDFC()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_1B93EDE08()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1B93EDE14()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B93EDE20()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B93EDE2C()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1B93EDE38()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1B93EDE44()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B93EDE50()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B93EDE5C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1B93EDE68()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1B93EDE74()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1B93EDE80()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1B93EDE8C()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1B93EDE98()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B93EDEA4()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B93EDEB0()
{
  return MEMORY[0x1E0D32A10]();
}

uint64_t sub_1B93EDEBC()
{
  return MEMORY[0x1E0D30040]();
}

uint64_t sub_1B93EDEC8()
{
  return MEMORY[0x1E0D30048]();
}

uint64_t sub_1B93EDED4()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1B93EDEE0()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1B93EDEEC()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1B93EDEF8()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_1B93EDF04()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1B93EDF10()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_1B93EDF1C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B93EDF28()
{
  return MEMORY[0x1E0C91CC0]();
}

uint64_t sub_1B93EDF34()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B93EDF40()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1B93EDF4C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B93EDF58()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B93EDF64()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B93EDF70()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1B93EDF7C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B93EDF88()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1B93EDF94()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1B93EDFA0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B93EDFAC()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1B93EDFB8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B93EDFC4()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1B93EDFD0()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1B93EDFDC()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1B93EDFE8()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B93EDFF4()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1B93EE000()
{
  return MEMORY[0x1E0DEAF08]();
}

uint64_t sub_1B93EE00C()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1B93EE018()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B93EE024()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1B93EE030()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1B93EE03C()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t sub_1B93EE048()
{
  return MEMORY[0x1E0DF0640]();
}

uint64_t sub_1B93EE054()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1B93EE060()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1B93EE06C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1B93EE078()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1B93EE084()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B93EE090()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B93EE09C()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1B93EE0A8()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1B93EE0B4()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1B93EE0C0()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1B93EE0CC()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1B93EE0D8()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1B93EE0E4()
{
  return MEMORY[0x1E0CB1BB8]();
}

uint64_t sub_1B93EE0F0()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1B93EE0FC()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1B93EE108()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1B93EE114()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B93EE120()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1B93EE12C()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_1B93EE138()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B93EE144()
{
  return MEMORY[0x1E0DEB340]();
}

uint64_t sub_1B93EE150()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1B93EE15C()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1B93EE168()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1B93EE174()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1B93EE180()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1B93EE18C()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1B93EE198()
{
  return MEMORY[0x1E0DEB678]();
}

uint64_t sub_1B93EE1A4()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1B93EE1B0()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_1B93EE1BC()
{
  return MEMORY[0x1E0D32A20]();
}

uint64_t sub_1B93EE1C8()
{
  return MEMORY[0x1E0CB7860]();
}

uint64_t sub_1B93EE1D4()
{
  return MEMORY[0x1E0D30050]();
}

uint64_t sub_1B93EE1E0()
{
  return MEMORY[0x1E0CB1CB0]();
}

uint64_t sub_1B93EE1EC()
{
  return MEMORY[0x1E0CB1D80]();
}

uint64_t sub_1B93EE1F8()
{
  return MEMORY[0x1E0D30058]();
}

uint64_t sub_1B93EE204()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B93EE210()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B93EE21C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B93EE228()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B93EE234()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B93EE240()
{
  return MEMORY[0x1E0D32A28]();
}

uint64_t sub_1B93EE24C()
{
  return MEMORY[0x1E0D30068]();
}

uint64_t sub_1B93EE258()
{
  return MEMORY[0x1E0CE9E10]();
}

uint64_t sub_1B93EE264()
{
  return MEMORY[0x1E0CE9E18]();
}

uint64_t sub_1B93EE270()
{
  return MEMORY[0x1E0CE9E28]();
}

uint64_t sub_1B93EE27C()
{
  return MEMORY[0x1E0CE9E30]();
}

uint64_t sub_1B93EE288()
{
  return MEMORY[0x1E0D32A30]();
}

uint64_t sub_1B93EE294()
{
  return MEMORY[0x1E0CE9E58]();
}

uint64_t sub_1B93EE2A0()
{
  return MEMORY[0x1E0CB1E80]();
}

uint64_t sub_1B93EE2AC()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1B93EE2B8()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1B93EE2C4()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1B93EE2D0()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B93EE2DC()
{
  return MEMORY[0x1E0D30078]();
}

uint64_t sub_1B93EE2E8()
{
  return MEMORY[0x1E0D30080]();
}

uint64_t sub_1B93EE2F4()
{
  return MEMORY[0x1E0D30088]();
}

uint64_t sub_1B93EE300()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1B93EE30C()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1B93EE318()
{
  return MEMORY[0x1E0CE9E68]();
}

uint64_t sub_1B93EE324()
{
  return MEMORY[0x1E0CE9E70]();
}

uint64_t sub_1B93EE330()
{
  return MEMORY[0x1E0CE9E78]();
}

uint64_t sub_1B93EE33C()
{
  return MEMORY[0x1E0CE9E80]();
}

uint64_t sub_1B93EE348()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1B93EE354()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1B93EE360()
{
  return MEMORY[0x1E0CE9E88]();
}

uint64_t sub_1B93EE36C()
{
  return MEMORY[0x1E0CE9E90]();
}

uint64_t sub_1B93EE378()
{
  return MEMORY[0x1E0D30098]();
}

uint64_t sub_1B93EE384()
{
  return MEMORY[0x1E0D300A0]();
}

uint64_t sub_1B93EE390()
{
  return MEMORY[0x1E0D300A8]();
}

uint64_t sub_1B93EE39C()
{
  return MEMORY[0x1E0D300B0]();
}

uint64_t sub_1B93EE3A8()
{
  return MEMORY[0x1E0D300B8]();
}

uint64_t sub_1B93EE3B4()
{
  return MEMORY[0x1E0D300C0]();
}

uint64_t sub_1B93EE3C0()
{
  return MEMORY[0x1E0D300C8]();
}

uint64_t sub_1B93EE3CC()
{
  return MEMORY[0x1E0D300D0]();
}

uint64_t sub_1B93EE3D8()
{
  return MEMORY[0x1E0D300D8]();
}

uint64_t sub_1B93EE3E4()
{
  return MEMORY[0x1E0D300E0]();
}

uint64_t sub_1B93EE3F0()
{
  return MEMORY[0x1E0D300E8]();
}

uint64_t sub_1B93EE3FC()
{
  return MEMORY[0x1E0CE9EA0]();
}

uint64_t sub_1B93EE408()
{
  return MEMORY[0x1E0CE9EA8]();
}

uint64_t sub_1B93EE414()
{
  return MEMORY[0x1E0D30100]();
}

uint64_t sub_1B93EE420()
{
  return MEMORY[0x1E0D30108]();
}

uint64_t sub_1B93EE42C()
{
  return MEMORY[0x1E0CB1F98]();
}

uint64_t sub_1B93EE438()
{
  return MEMORY[0x1E0D30110]();
}

uint64_t sub_1B93EE444()
{
  return MEMORY[0x1E0D30118]();
}

uint64_t sub_1B93EE450()
{
  return MEMORY[0x1E0D32A40]();
}

uint64_t sub_1B93EE45C()
{
  return MEMORY[0x1E0CE9EC8]();
}

uint64_t sub_1B93EE468()
{
  return MEMORY[0x1E0CE9EE8]();
}

uint64_t sub_1B93EE474()
{
  return MEMORY[0x1E0CB1FE8]();
}

uint64_t sub_1B93EE480()
{
  return MEMORY[0x1E0CE0758]();
}

uint64_t sub_1B93EE48C()
{
  return MEMORY[0x1E0D32050]();
}

uint64_t sub_1B93EE498()
{
  return MEMORY[0x1E0D32058]();
}

uint64_t sub_1B93EE4A4()
{
  return MEMORY[0x1E0D32060]();
}

uint64_t sub_1B93EE4B0()
{
  return MEMORY[0x1E0D32068]();
}

uint64_t sub_1B93EE4BC()
{
  return MEMORY[0x1E0CB20C8]();
}

uint64_t sub_1B93EE4C8()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1B93EE4D4()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1B93EE4E0()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1B93EE4EC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B93EE4F8()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1B93EE504()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1B93EE510()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1B93EE51C()
{
  return MEMORY[0x1E0CE9EF8]();
}

uint64_t sub_1B93EE528()
{
  return MEMORY[0x1E0CE9F08]();
}

uint64_t sub_1B93EE534()
{
  return MEMORY[0x1E0CE9F28]();
}

uint64_t sub_1B93EE540()
{
  return MEMORY[0x1E0CE9F30]();
}

uint64_t sub_1B93EE54C()
{
  return MEMORY[0x1E0CE9F48]();
}

uint64_t sub_1B93EE558()
{
  return MEMORY[0x1E0CE9FD8]();
}

uint64_t sub_1B93EE564()
{
  return MEMORY[0x1E0CE9FE0]();
}

uint64_t sub_1B93EE570()
{
  return MEMORY[0x1E0CEA000]();
}

uint64_t sub_1B93EE57C()
{
  return MEMORY[0x1E0CEA010]();
}

uint64_t sub_1B93EE588()
{
  return MEMORY[0x1E0CEA018]();
}

uint64_t sub_1B93EE594()
{
  return MEMORY[0x1E0CEA020]();
}

uint64_t sub_1B93EE5A0()
{
  return MEMORY[0x1E0D32A48]();
}

uint64_t sub_1B93EE5AC()
{
  return MEMORY[0x1E0D32A50]();
}

uint64_t sub_1B93EE5B8()
{
  return MEMORY[0x1E0D32A58]();
}

uint64_t sub_1B93EE5C4()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1B93EE5D0()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1B93EE5DC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B93EE5E8()
{
  return MEMORY[0x1E0DEBB60]();
}

uint64_t sub_1B93EE5F4()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_1B93EE600()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B93EE60C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B93EE618()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1B93EE624()
{
  return MEMORY[0x1E0CB2430]();
}

uint64_t sub_1B93EE630()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_1B93EE63C()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1B93EE648()
{
  return MEMORY[0x1E0CB2498]();
}

uint64_t sub_1B93EE654()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B93EE660()
{
  return MEMORY[0x1E0CB24D8]();
}

uint64_t sub_1B93EE66C()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1B93EE678()
{
  return MEMORY[0x1E0CB2568]();
}

uint64_t sub_1B93EE684()
{
  return MEMORY[0x1E0CB2578]();
}

uint64_t sub_1B93EE690()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1B93EE69C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B93EE6A8()
{
  return MEMORY[0x1E0DEBEB0]();
}

uint64_t sub_1B93EE6B4()
{
  return MEMORY[0x1E0DEBEE8]();
}

uint64_t sub_1B93EE6C0()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1B93EE6CC()
{
  return MEMORY[0x1E0DEBFB0]();
}

uint64_t sub_1B93EE6D8()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t sub_1B93EE6E4()
{
  return MEMORY[0x1E0DEBFC8]();
}

uint64_t sub_1B93EE6F0()
{
  return MEMORY[0x1E0DEBFF8]();
}

uint64_t sub_1B93EE6FC()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1B93EE708()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B93EE714()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B93EE720()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B93EE72C()
{
  return MEMORY[0x1E0DEC088]();
}

uint64_t sub_1B93EE738()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1B93EE744()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B93EE750()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1B93EE75C()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1B93EE768()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1B93EE774()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1B93EE780()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B93EE78C()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B93EE798()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1B93EE7A4()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B93EE7B0()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1B93EE7BC()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1B93EE7C8()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1B93EE7D4()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B93EE7E0()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B93EE7EC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B93EE7F8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B93EE804()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B93EE810()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B93EE81C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B93EE828()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B93EE834()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B93EE840()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1B93EE84C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B93EE858()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B93EE864()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B93EE870()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1B93EE87C()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1B93EE888()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B93EE894()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B93EE8A0()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1B93EE8AC()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B93EE8B8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B93EE8C4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B93EE8D0()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1B93EE8DC()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1B93EE8E8()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1B93EE8F4()
{
  return MEMORY[0x1E0DF0B40]();
}

uint64_t sub_1B93EE900()
{
  return MEMORY[0x1E0DF0B48]();
}

uint64_t sub_1B93EE90C()
{
  return MEMORY[0x1E0DF0B58]();
}

uint64_t sub_1B93EE918()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1B93EE924()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1B93EE930()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1B93EE93C()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1B93EE948()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B93EE954()
{
  return MEMORY[0x1E0DF0C08]();
}

uint64_t sub_1B93EE960()
{
  return MEMORY[0x1E0DF0C10]();
}

uint64_t sub_1B93EE96C()
{
  return MEMORY[0x1E0DF0C28]();
}

uint64_t sub_1B93EE978()
{
  return MEMORY[0x1E0DF0C40]();
}

uint64_t sub_1B93EE984()
{
  return MEMORY[0x1E0DF0C50]();
}

uint64_t sub_1B93EE990()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1B93EE99C()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1B93EE9A8()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1B93EE9B4()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1B93EE9C0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B93EE9CC()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B93EE9D8()
{
  return MEMORY[0x1E0DECBF0]();
}

uint64_t sub_1B93EE9E4()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1B93EE9F0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B93EE9FC()
{
  return MEMORY[0x1E0DECD28]();
}

uint64_t sub_1B93EEA08()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B93EEA14()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B93EEA20()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1B93EEA2C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B93EEA38()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B93EEA44()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B93EEA50()
{
  return MEMORY[0x1E0DECF20]();
}

uint64_t sub_1B93EEA5C()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1B93EEA68()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1B93EEA74()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1B93EEA80()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B93EEA8C()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1B93EEA98()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1B93EEAA4()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1B93EEAB0()
{
  return MEMORY[0x1E0DED118]();
}

uint64_t sub_1B93EEABC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B93EEAC8()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1B93EEAD4()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B93EEAE0()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B93EEAEC()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1B93EEAF8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B93EEB04()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1B93EEB10()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B93EEB1C()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1B93EEB28()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1B93EEB34()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1B93EEB40()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1B93EEB4C()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B93EEB58()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B93EEB64()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B93EEB70()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1B93EEB7C()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1B93EEB88()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1B93EEB94()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1B93EEBA0()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1B93EEBAC()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B93EEBB8()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B93EEBC4()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B93EEBD0()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B93EEBDC()
{
  return MEMORY[0x1E0DEDB30]();
}

uint64_t sub_1B93EEBE8()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B93EEBF4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B93EEC00()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B93EEC0C()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1B93EEC18()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1B93EEC24()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B93EEC30()
{
  return MEMORY[0x1E0CB26D8]();
}

uint64_t sub_1B93EEC3C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B93EEC48()
{
  return MEMORY[0x1E0D32A60]();
}

uint64_t sub_1B93EEC54()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B93EEC60()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1B93EEC6C()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x1E0CF3178]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CCUICompactModuleContinuousCornerRadius()
{
  return MEMORY[0x1E0D145F8]();
}

uint64_t CCUICompactModuleContinuousCornerRadiusForGridSizeClass()
{
  return MEMORY[0x1E0D14608]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x1E0D14668]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x1E0D14678]();
}

uint64_t CCUINumberOfColumnsForGridSizeClass()
{
  return MEMORY[0x1E0D146C0]();
}

uint64_t CCUINumberOfRowsForGridSizeClass()
{
  return MEMORY[0x1E0D146C8]();
}

uint64_t CCUIScreenBounds()
{
  return MEMORY[0x1E0D14710]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99210](string, range.location, range.length);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB38](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo, releaseCallback);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CEA040](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t COAlarmSiriContextTargetReferenceForAccessory()
{
  return MEMORY[0x1E0D14880]();
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x1E0CA7DF8](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

uint64_t DateMaskToString()
{
  return MEMORY[0x1E0D4F930]();
}

uint64_t DetailDateMaskToString()
{
  return MEMORY[0x1E0D4F938]();
}

uint64_t HFCAPackageAlternateStateForHFCAPackageState()
{
  return MEMORY[0x1E0D30498]();
}

uint64_t HFConvertHSBToRGB()
{
  return MEMORY[0x1E0D30560]();
}

uint64_t HFConvertRGBToHSB()
{
  return MEMORY[0x1E0D30568]();
}

uint64_t HFForceAccessoryFirmwareUpdateOnboarding()
{
  return MEMORY[0x1E0D30600]();
}

uint64_t HFForceAllowAutomationCreation()
{
  return MEMORY[0x1E0D30608]();
}

uint64_t HFForceNaturalLightingOnboarding()
{
  return MEMORY[0x1E0D30610]();
}

uint64_t HFForceOwnerMustUpgradeOnboarding()
{
  return MEMORY[0x1E0D30618]();
}

uint64_t HFForceSafetyAndSecurityOnboarding()
{
  return MEMORY[0x1E0D30620]();
}

uint64_t HFForceSwitchHomeWelcomeOnboarding()
{
  return MEMORY[0x1E0D30628]();
}

uint64_t HFForceTipsOnboarding()
{
  return MEMORY[0x1E0D30630]();
}

uint64_t HFForceUtilityOnboarding()
{
  return MEMORY[0x1E0D30638]();
}

uint64_t HFGetColorForLightTemperature()
{
  return MEMORY[0x1E0D30640]();
}

uint64_t HFHideQuickControls()
{
  return MEMORY[0x1E0D306C0]();
}

uint64_t HFHomeBundle()
{
  return MEMORY[0x1E0D306E0]();
}

uint64_t HFIsColorLighter()
{
  return MEMORY[0x1E0D30890]();
}

uint64_t HFIsNearYellow()
{
  return MEMORY[0x1E0D30898]();
}

uint64_t HFLocalizedCategoryOrPrimaryServiceTypeString()
{
  return MEMORY[0x1E0D30920]();
}

uint64_t HFLocalizedString()
{
  return MEMORY[0x1E0D30930]();
}

uint64_t HFLocalizedStringFromHMCameraAccessMode()
{
  return MEMORY[0x1E0D30938]();
}

uint64_t HFLocalizedStringFromHMUserCameraAccessLevel()
{
  return MEMORY[0x1E0D30940]();
}

uint64_t HFLocalizedStringWithFormat()
{
  return MEMORY[0x1E0D30948]();
}

uint64_t HFLocalizedWiFiString()
{
  return MEMORY[0x1E0D30950]();
}

uint64_t HFLocationServicesAvailableForAuthorizationStatus()
{
  return MEMORY[0x1E0D30958]();
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x1E0D30968]();
}

uint64_t HFPreferenceIdentifyHomePodButtonEnabled()
{
  return MEMORY[0x1E0D30AA0]();
}

uint64_t HFPreferencesAccessorySetValueForKey()
{
  return MEMORY[0x1E0D30AA8]();
}

uint64_t HFPreferencesAccessoryValueForKey()
{
  return MEMORY[0x1E0D30AB0]();
}

uint64_t HFPreferencesBoolForKey()
{
  return MEMORY[0x1E0D30AC0]();
}

uint64_t HFPreferencesBooleanValueForKey()
{
  return MEMORY[0x1E0D30AC8]();
}

uint64_t HFPreferencesInternalDebuggingEnabled()
{
  return MEMORY[0x1E0D30AE8]();
}

uint64_t HFPrimaryStateFromBOOL()
{
  return MEMORY[0x1E0D30AF0]();
}

uint64_t HFProgrammableSwitchInputEventOptionDisplayPriorityMap()
{
  return MEMORY[0x1E0D30AF8]();
}

uint64_t HFProgrammableSwitchLocalizableStringForAccessoryNamingSystemAndIndex()
{
  return MEMORY[0x1E0D30B00]();
}

uint64_t HFSymbolIconAccessoryTypeForSymbol()
{
  return MEMORY[0x1E0D30F38]();
}

uint64_t HKForceDevicesNeedUpgrade()
{
  return MEMORY[0x1E0D30FF8]();
}

uint64_t HMCharacteristicValueLabelNamespaceValidate()
{
  return MEMORY[0x1E0D31000]();
}

uint64_t HMDaysOfTheWeekFromDateComponents()
{
  return MEMORY[0x1E0CB8BA0]();
}

uint64_t HMDaysOfTheWeekToDateComponents()
{
  return MEMORY[0x1E0CB8BA8]();
}

uint64_t HMDaysOfTheWeekToString()
{
  return MEMORY[0x1E0CB8BB0]();
}

uint64_t HMFProductClassToString()
{
  return MEMORY[0x1E0D28070]();
}

uint64_t HMSiriEndpointOnboardingResultAsString()
{
  return MEMORY[0x1E0CB9BA0]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x1E0CB9DD0]();
}

uint64_t HUCommonImageNamed()
{
  return MEMORY[0x1E0D336F0]();
}

uint64_t HUDefaultSizeForIconSize()
{
  return MEMORY[0x1E0D336F8]();
}

uint64_t HUIconImageNamed()
{
  return MEMORY[0x1E0D33700]();
}

uint64_t ICBundleIdentifierForSystemApplicationType()
{
  return MEMORY[0x1E0DDBC90]();
}

uint64_t ICSystemApplicationIsInstalled()
{
  return MEMORY[0x1E0DDBE60]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x1E0D368B0]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x1E0D4E3E0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKCoordinateRegion result;

  MEMORY[0x1E0CC1570]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t MTUIMainScreenScale()
{
  return MEMORY[0x1E0D4FAD0]();
}

uint64_t MTUIRoundToPixel()
{
  return MEMORY[0x1E0D4FAD8]();
}

uint64_t NACGFloatEqualToFloat()
{
  return MEMORY[0x1E0D519F8]();
}

uint64_t NACGFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D51A00]();
}

uint64_t NACGFloatIsZero()
{
  return MEMORY[0x1E0D51A08]();
}

uint64_t NACGFloatLessThanFloat()
{
  return MEMORY[0x1E0D51A10]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1E0D51970]();
}

uint64_t NAStringFromBOOL()
{
  return MEMORY[0x1E0D51988]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSLocalizedStringFromHFMediaAccessControlClassification()
{
  return MEMORY[0x1E0D31010]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

uint64_t NSStringFromBooleanValue()
{
  return MEMORY[0x1E0D31018]();
}

uint64_t NSStringFromCCUIGridSizeClass()
{
  return MEMORY[0x1E0D14758]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSStringToHMSymptomType()
{
  return MEMORY[0x1E0D31020]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1E0D7FE58]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1E0D7FE60]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return MEMORY[0x1E0CEB0B0]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0CEB250]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0CEB3A8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0CEB468]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0CEB4C0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0CEB708](image, completionTarget, completionSelector, contextInfo);
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0CEBA70]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0CEBA80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0CEBA88]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0CEBAA0]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0CEBAA8]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0CEBAB0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0CEBAD8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0CEBAF8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0CEBB20]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0CEBB30]();
}

uint64_t _AXSShowAudioTranscriptions()
{
  return MEMORY[0x1E0DDDCD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIGraphicsDrawIntoImageContextWithOptions()
{
  return MEMORY[0x1E0CEBFE8]();
}

uint64_t _UITableViewDefaultSectionCornerRadiusForTraitCollection()
{
  return MEMORY[0x1E0CEC2C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1E0DE8028](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBC8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1E0DF1020]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

