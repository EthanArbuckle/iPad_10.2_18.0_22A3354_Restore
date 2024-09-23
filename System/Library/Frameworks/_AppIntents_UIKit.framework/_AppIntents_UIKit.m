void static AppManager.sceneConfigurator.setter(uint64_t a1)
{
  _BYTE v2[40];

  if (qword_254064430 != -1)
    swift_once();
  sub_2217B74E4(a1, (uint64_t)v2);
  swift_beginAccess();
  sub_2217B7978((uint64_t)v2, (uint64_t)&xmmword_2540646C0);
  swift_endAccess();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_113();
}

uint64_t type metadata accessor for AppUIKitBridge()
{
  return objc_opt_self();
}

void sub_2217B55C0()
{
  unint64_t v0;
  unint64_t v1;

  sub_2217CB12C();
  if (v0 <= 0x3F)
  {
    sub_2217CA6E0();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_2217B5664(uint64_t a1)
{
  return sub_2217C1234(a1, qword_254064730, MEMORY[0x24BE5F948]);
}

uint64_t sub_2217B5698()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_0_1();
  return MEMORY[0x2276718F4](v1);
}

uint64_t sub_2217B56D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  type metadata accessor for AppUIKitBridge();
  v0 = swift_allocObject();
  sub_2217B581C();
  sub_2217CB264();
  sub_2217CB24C();
  sub_2217C83A0(qword_254064660, v1, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  swift_retain();
  sub_2217CB258();
  swift_release();
  swift_release();
  if (qword_254064670 != -1)
    swift_once();
  v2 = sub_2217CB6FC();
  __swift_project_value_buffer(v2, (uint64_t)qword_254064730);
  v3 = sub_2217CB6E4();
  v4 = sub_2217CB918();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2217B3000, v3, v4, "Instantiated AppUIKitBridge", v5, 2u);
    MEMORY[0x227671870](v5, -1, -1);
  }

  return v0;
}

uint64_t sub_2217B581C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v2 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 24) = v2;
  return v0;
}

uint64_t sub_2217B587C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  OUTLINED_FUNCTION_0_1();
  return MEMORY[0x2276718F4](v1);
}

void sub_2217B5908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_20();
  v4 = v0;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2_4();
  v5 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  OUTLINED_FUNCTION_0_1();
  v6 = MEMORY[0x2276718F4](v5);
  if (v6)
  {
    v7 = (void *)v6;
    if (qword_254064658 != -1)
      swift_once();
    v8 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255707F40) + 48);
    v9 = v4 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode;
    v10 = OUTLINED_FUNCTION_12_3();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v1, v9, v10);
    swift_retain();
    *(_QWORD *)v8 = objc_msgSend(v7, sel_hash);
    *(_BYTE *)(v8 + 8) = 0;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, *MEMORY[0x24BDB5398], v2);
    type metadata accessor for AppUIKitBridge();
    OUTLINED_FUNCTION_7_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    OUTLINED_FUNCTION_27_2((unint64_t *)&unk_254064610, v11, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_27_2(&qword_2540645A0, v12, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_27_2(&qword_254064620, v13, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_27_2((unint64_t *)&unk_2540645F0, v14, (uint64_t)&protocol conformance descriptor for UIView);
    sub_2217CB1B0();

    OUTLINED_FUNCTION_51();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }
  sub_2217B62D8(0);
  OUTLINED_FUNCTION_2_0();
}

void UIAppEntityInteraction.init(entity:)(_QWORD *a1)
{
  void *v1;
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
  int v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v3 = OUTLINED_FUNCTION_4();
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_15_0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6();
  v11 = v10 - v9;
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_14_1(OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v12 = v1;
  sub_2217CB1EC();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(&v12[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entityIdentifier], v11, v7);
  sub_2217B5E94((uint64_t)a1, (uint64_t)&v12[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2217CB1EC();
  v13 = sub_2217CB378();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  *(_DWORD *)&v12[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId] = v13;
  sub_2217CB144();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(&v12[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state], v6, v22);
  if (qword_254064670 != -1)
    swift_once();
  v14 = sub_2217CB6FC();
  __swift_project_value_buffer(v14, (uint64_t)qword_254064730);
  v15 = v12;
  v16 = sub_2217CB6E4();
  v17 = sub_2217CB918();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_35();
    *(_DWORD *)v18 = 136315394;
    sub_2217C1CDC(&qword_255707E38, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5678], MEMORY[0x24BDB5688]);
    v19 = sub_2217CBB4C();
    OUTLINED_FUNCTION_19_1(v19, v20);
    sub_2217CB9E4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 1024;

    sub_2217CB9E4();
    _os_log_impl(&dword_2217B3000, v16, v17, "Entity %s interaction %u created", (uint8_t *)v18, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21();
  }

  v23.receiver = v15;
  v23.super_class = (Class)OUTLINED_FUNCTION_18_0();
  objc_msgSendSuper2(&v23, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  OUTLINED_FUNCTION_2_0();
}

uint64_t type metadata accessor for UIAppEntityInteraction()
{
  uint64_t result;

  result = qword_254064408;
  if (!qword_254064408)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2217B5E94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2217B5F24()
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

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_17() - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2_4();
  v2 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_0_1();
  v3 = MEMORY[0x2276718F4](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if (qword_254064658 != -1)
      swift_once();
    OUTLINED_FUNCTION_13_1(OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity);
    OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDB5390], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 104));
    type metadata accessor for AppUIKitBridge();
    sub_2217BD5F8();
    sub_2217C1CDC((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    OUTLINED_FUNCTION_9_2((unint64_t *)&unk_254064610, v5, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_9_2(&qword_2540645A0, v6, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_9_2(&qword_254064620, v7, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_9_2((unint64_t *)&unk_2540645F0, v8, (uint64_t)&protocol conformance descriptor for UIView);
    swift_retain();
    sub_2217CB1B0();

    swift_release();
    OUTLINED_FUNCTION_11_2(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }
  sub_2217B614C(0);
}

void sub_2217B614C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_0_0();
  v4 = (void *)MEMORY[0x2276718F4](v3);
  swift_unknownObjectWeakAssign();
  sub_2217B6610(v4);

}

uint64_t sub_2217B61BC(void *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  a1;
  OUTLINED_FUNCTION_15_1();
  result = 0;
  if (a1)
  {
    sub_2217BD5F8();
    sub_2217C1CDC(&qword_2540645A0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
    result = sub_2217CB3F0();
  }
  v4 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId;
  *(_QWORD *)v4 = result;
  *(_BYTE *)(v4 + 8) = a1 == 0;
  return result;
}

uint64_t type metadata accessor for UIAppIntentInteraction()
{
  uint64_t result;

  result = qword_2540644E8;
  if (!qword_2540644E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2217B62D8(void *a1)
{
  OUTLINED_FUNCTION_0_0();
  swift_unknownObjectWeakAssign();
  sub_2217B6334();

}

void sub_2217B6334()
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
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  uint64_t v22;

  v1 = v0;
  v2 = sub_2217CB12C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2217CB33C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v0 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  swift_beginAccess();
  v11 = (void *)MEMORY[0x2276718F4](v10);

  if (v11 && (*(_BYTE *)(v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion) & 1) == 0)
  {
    v12 = MEMORY[0x2276718F4](v10);
    if (v12
      && (v13 = (void *)v12,
          v22 = v12,
          v21[1] = sub_2217BD5F8(),
          sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView), v14 = sub_2217CB4F8(), v13, v14))
    {
      v15 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255707F40) + 48)];
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode, v2);
      v16 = (void *)MEMORY[0x2276718F4](v10);
      v22 = (uint64_t)v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255707F30);
      sub_2217BCCA8((unint64_t *)&unk_255707F48, (uint64_t (*)(uint64_t))sub_2217BD5F8, MEMORY[0x24BEE5BD8]);
      v17 = sub_2217CB9D8();

      *(_QWORD *)v15 = v17;
      v15[8] = 0;
      (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDB5398], v6);
      sub_2217CB45C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    else
    {
      sub_2217CB480();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode, v2);
      v18 = (void *)MEMORY[0x2276718F4](v10);
      v22 = (uint64_t)v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255707F30);
      sub_2217BCCA8((unint64_t *)&unk_255707F48, (uint64_t (*)(uint64_t))sub_2217BD5F8, MEMORY[0x24BEE5BD8]);
      sub_2217CB9D8();

      sub_2217CB474();
      v19 = MEMORY[0x2276718F4](v10);
      if (v19)
      {
        v20 = (void *)v19;
        UIView.updateViewProvider(with:)();

      }
      swift_release();
    }
  }
}

void sub_2217B6610(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  id v12;
  char *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  char *v27;
  id v28;
  char *v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  id v38;
  _QWORD *v39;
  os_log_t v40;
  uint64_t v41;
  char *v42;
  int v43;
  os_log_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47[5];
  uint64_t v48;
  char v49;

  v3 = sub_2217CB33C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view];
  swift_beginAccess();
  v8 = MEMORY[0x2276718F4](v7);
  if (v8)
  {
    v9 = (void *)v8;
    if (qword_254064670 != -1)
      swift_once();
    v10 = sub_2217CB6FC();
    __swift_project_value_buffer(v10, (uint64_t)qword_254064730);
    v11 = v1;
    v12 = v9;
    v13 = v11;
    v14 = v12;
    v15 = sub_2217CB6E4();
    v16 = sub_2217CB918();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v47[0] = v46;
      *(_DWORD *)v17 = 136315650;
      sub_2217CB39C();
      sub_2217C1CDC(&qword_255707E38, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5678], MEMORY[0x24BDB5688]);
      v18 = sub_2217CBB4C();
      v48 = sub_2217BEC98(v18, v19, v47);
      sub_2217CB9E4();

      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 1024;
      v20 = *(_DWORD *)&v13[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId];

      LODWORD(v48) = v20;
      sub_2217CB9E4();

      *(_WORD *)(v17 + 18) = 2112;
      v48 = (uint64_t)v14;
      v21 = v14;
      sub_2217CB9E4();
      v22 = v45;
      *v45 = v9;

      _os_log_impl(&dword_2217B3000, v15, v16, "Entity %s attached %u to view %@", (uint8_t *)v17, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557082F0);
      swift_arrayDestroy();
      MEMORY[0x227671870](v22, -1, -1);
      v23 = v46;
      swift_arrayDestroy();
      MEMORY[0x227671870](v23, -1, -1);
      MEMORY[0x227671870](v17, -1, -1);

    }
    else
    {

    }
    sub_2217B5E94((uint64_t)&v13[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity], (uint64_t)v47);
    _sSo6UIViewC17_AppIntents_UIKitE014setRepresentedB6Entityyy0bC00bG0_pSgF_0();

    sub_2217C1D1C((uint64_t)v47);
  }
  else if (a1)
  {
    v24 = qword_254064670;
    v25 = a1;
    if (v24 != -1)
      swift_once();
    v26 = sub_2217CB6FC();
    __swift_project_value_buffer(v26, (uint64_t)qword_254064730);
    v27 = v1;
    v28 = v25;
    v29 = v27;
    v30 = v28;
    v31 = sub_2217CB6E4();
    v32 = sub_2217CB918();
    v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      v34 = swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v47[0] = v46;
      *(_DWORD *)v34 = 136315650;
      v44 = v31;
      sub_2217CB39C();
      v43 = v33;
      sub_2217C1CDC(&qword_255707E38, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5678], MEMORY[0x24BDB5688]);
      v35 = sub_2217CBB4C();
      v48 = sub_2217BEC98(v35, v36, v47);
      v42 = &v49;
      sub_2217CB9E4();

      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 1024;
      v37 = *(_DWORD *)&v29[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId];

      LODWORD(v48) = v37;
      sub_2217CB9E4();

      *(_WORD *)(v34 + 18) = 2112;
      v48 = (uint64_t)v30;
      v38 = v30;
      sub_2217CB9E4();
      v39 = v45;
      *v45 = a1;

      v40 = v44;
      _os_log_impl(&dword_2217B3000, v44, (os_log_type_t)v43, "Entity %s removed %u from view %@", (uint8_t *)v34, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557082F0);
      swift_arrayDestroy();
      MEMORY[0x227671870](v39, -1, -1);
      v41 = v46;
      swift_arrayDestroy();
      MEMORY[0x227671870](v41, -1, -1);
      MEMORY[0x227671870](v34, -1, -1);

    }
    else
    {

    }
    v47[0] = (uint64_t)v30;
    sub_2217BD5F8();
    sub_2217C1CDC((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
    if (sub_2217CB4F8())
    {
      sub_2217B5E94((uint64_t)&v29[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity], (uint64_t)v6);
      (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDB5390], v3);
      sub_2217CB468();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      UIView.updateViewProvider(with:)();
      swift_release();
    }

  }
}

uint64_t DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)@<X0>(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  void *v4;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;

  v36 = a1;
  if (a2)
  {
    objc_opt_self();
    v8 = a2;
    v16 = OUTLINED_FUNCTION_0_3((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v35, v36, v37, 0);
    v17 = v38;
    if (v16)
    {
      sub_2217CB648();

      if (!a3)
        goto LABEL_11;
    }
    else
    {
      v18 = v17;
      v19 = (void *)sub_2217CB600();

      swift_willThrow();
      if (!a3)
        goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_11;
  }
  objc_opt_self();
  v20 = a3;
  v28 = OUTLINED_FUNCTION_0_3((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27, v35, v36, v37, 0);
  v29 = v39;
  if (v28)
  {
    sub_2217CB648();

  }
  else
  {
    v30 = v29;
    v31 = (void *)sub_2217CB600();

    swift_willThrow();
  }
LABEL_11:
  type metadata accessor for LNSymbolImagePlatform(0);
  v32 = CFSTR("UIKit");
  sub_2217CB408();

  v33 = sub_2217CB414();
  return __swift_storeEnumTagSinglePayload(a4, 0, 1, v33);
}

void type metadata accessor for LNSymbolImagePlatform(uint64_t a1)
{
  sub_2217B7C2C(a1, (unint64_t *)&unk_254064420);
}

void sub_2217B6EA0()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
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
  __int128 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  __int128 *v52;
  void (*v53)(char *, __int128 *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  _QWORD v75[9];

  OUTLINED_FUNCTION_20();
  v3 = v2;
  v68 = OUTLINED_FUNCTION_6_1();
  v4 = *(_QWORD *)(v68 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v62 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F18);
  OUTLINED_FUNCTION_7_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_4();
  v63 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F10);
  OUTLINED_FUNCTION_7_3();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (__int128 *)((char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v64 = (uint64_t)&v62 - v15;
  v16 = sub_2217CB15C();
  v17 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  v70 = v17;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_19_3();
  v18 = OUTLINED_FUNCTION_10();
  v71 = *(_QWORD *)(v18 - 8);
  v72 = v18;
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_6();
  v21 = v20 - v19;
  v22 = v3;
  sub_2217B62D8(v3);
  if (!v3)
  {
    if ((v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] & 1) == 0)
      goto LABEL_17;
    v47 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    v48 = OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_35_0(v48, v49, &qword_255707F10);
    v50 = v68;
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v68) != 1)
    {
      v53 = *(void (**)(char *, __int128 *, uint64_t))(v4 + 32);
      v53(v8, v14, v50);
      v54 = OUTLINED_FUNCTION_22_2();
      v55 = v63;
      OUTLINED_FUNCTION_28_0(v63, v56, v57, v54);
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v47, v8, v50);
      sub_2217CB894();
      v58 = sub_2217CB888();
      v59 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v60 = swift_allocObject();
      v61 = MEMORY[0x24BEE6930];
      *(_QWORD *)(v60 + 16) = v58;
      *(_QWORD *)(v60 + 24) = v61;
      v53((char *)(v60 + v59), (__int128 *)v47, v50);
      sub_2217C9244(v55, (uint64_t)&unk_2557085B0, v60);
      swift_release();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v50);
      goto LABEL_17;
    }
    v51 = &qword_255707F10;
    v52 = v14;
    goto LABEL_16;
  }
  v23 = qword_254064658;
  v24 = v22;
  if (v23 != -1)
    swift_once();
  v66 = qword_254064728;
  v25 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255707F40) + 48);
  v67 = v0;
  v26 = OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_8_2(v26);
  swift_retain();
  *(_QWORD *)v25 = objc_msgSend(v24, sel_hash);
  *(_BYTE *)(v25 + 8) = 0;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v71 + 104))(v21, *MEMORY[0x24BDB5398], v72);
  v75[0] = MEMORY[0x24BEE4AF8];
  sub_2217BCCA8(&qword_254064580, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4CD8], MEMORY[0x24BDB4CE8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254064588);
  sub_2217BF45C();
  v27 = v69;
  sub_2217CBA08();
  v65 = type metadata accessor for AppUIKitBridge();
  OUTLINED_FUNCTION_7_1();
  sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
  OUTLINED_FUNCTION_20_0((unint64_t *)&unk_254064610, v28, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_20_0(&qword_2540645A0, v29, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_20_0(&qword_254064620, v30, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_20_0((unint64_t *)&unk_2540645F0, v31, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB198();

  OUTLINED_FUNCTION_51();
  v32 = v67;
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v1, v27);
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v21, v72);
  if (v32[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] == 1)
  {
    v33 = v24;
    v34 = objc_msgSend(v33, sel_window);

    if (!v34)
    {

      goto LABEL_17;
    }
    v35 = &v32[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
    OUTLINED_FUNCTION_0_1();
    v36 = (uint64_t)v35;
    v37 = v64;
    sub_2217C99B8(v36, v64, &qword_255707F10);
    if (__swift_getEnumTagSinglePayload(v37, 1, v68) == 1)
    {
      sub_2217BF400(v37, &qword_255707F10);
      v38 = (uint64_t)&v32[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent];
      OUTLINED_FUNCTION_0_1();
      sub_2217C99B8(v38, (uint64_t)&v73, (uint64_t *)&unk_255707E40);
      if (v74)
      {
        sub_2217B7BEC(&v73, (uint64_t)v75);
        v39 = OUTLINED_FUNCTION_22_2();
        v40 = v63;
        OUTLINED_FUNCTION_28_0(v63, v41, v42, v39);
        sub_2217B5E94((uint64_t)v75, (uint64_t)&v73);
        sub_2217CB894();
        v43 = v32;
        v44 = sub_2217CB888();
        v45 = (_QWORD *)swift_allocObject();
        v46 = MEMORY[0x24BEE6930];
        v45[2] = v44;
        v45[3] = v46;
        v45[4] = v43;
        sub_2217B7BEC(&v73, (uint64_t)(v45 + 5));
        sub_2217C9244(v40, (uint64_t)&unk_2557085C8, (uint64_t)v45);
        swift_release();

        __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
        goto LABEL_17;
      }

      v51 = (uint64_t *)&unk_255707E40;
      v52 = &v73;
    }
    else
    {

      v51 = &qword_255707F10;
      v52 = (__int128 *)v37;
    }
LABEL_16:
    sub_2217BF400((uint64_t)v52, v51);
  }
LABEL_17:
  OUTLINED_FUNCTION_2_0();
}

void sub_2217B74E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_0();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276717EC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_slowAlloc();
}

unint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_2217BD5F8();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_7_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
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

uint64_t OUTLINED_FUNCTION_40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_2217CB264();
}

void OUTLINED_FUNCTION_21()
{
  JUMPOUT(0x227671870);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_19()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_19_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2217BEC98(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_19_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2217C2370(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_willThrow();
}

__n128 OUTLINED_FUNCTION_1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_2217CB6CC();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_1_3(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_2217BCCA8(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_dynamicCast();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276717F8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, unint64_t *a2)
{
  return sub_2217B87E8(0, a2);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_2217CB15C();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_2217CB6C0();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_2217CB33C();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_2217CB6B4();
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_5@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_2217CB66C();
}

void OUTLINED_FUNCTION_2_3(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_2217BCCA8(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, a2, v2);
}

id OUTLINED_FUNCTION_12()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2217B7978(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540644B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2217B79C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217B7A60()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2217CB39C();
  if (v1 <= 0x3F)
  {
    result = sub_2217CB15C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_2217B7B14()
{
  uint64_t result;

  result = sub_2217B56D8();
  qword_254064728 = result;
  return result;
}

double sub_2217B7B30()
{
  double result;

  qword_2540646E0 = 0;
  result = 0.0;
  xmmword_2540646C0 = 0u;
  *(_OWORD *)algn_2540646D0 = 0u;
  return result;
}

void static AppManager.sceneConfigurator.getter(uint64_t a1@<X8>)
{
  __int128 v2;
  uint64_t v3;

  if (qword_254064430 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_1();
  sub_2217B79C0((uint64_t)&xmmword_2540646C0, (uint64_t)&v2, &qword_2540644B8);
  if (v3)
  {
    OUTLINED_FUNCTION_108(&v2);
  }
  else
  {
    *(_QWORD *)(a1 + 24) = &unk_24E7405D8;
    *(_QWORD *)(a1 + 32) = &off_24E7405B0;
    sub_2217C8B10((uint64_t)&v2, (uint64_t)&qword_2540644B8);
  }
  OUTLINED_FUNCTION_113();
}

uint64_t sub_2217B7BEC(__int128 *a1, uint64_t a2)
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

void type metadata accessor for LNStructuredDataRepresentations(uint64_t a1)
{
  sub_2217B7C2C(a1, &qword_255707F60);
}

void type metadata accessor for Event(uint64_t a1)
{
  sub_2217B7C2C(a1, (unint64_t *)&unk_255707F68);
}

void sub_2217B7C2C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_2217B7C70()
{
  uint64_t *v0;

  return sub_2217B7F7C(*v0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2217B7C94(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2217CB7A4();
  *a2 = 0;
  return result;
}

uint64_t sub_2217B7D0C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2217CB7B0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2217B7D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2217B7DAC();
  *a1 = result;
  return result;
}

uint64_t sub_2217B7DAC()
{
  uint64_t v0;

  sub_2217CB7BC();
  v0 = sub_2217CB798();
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *sub_2217B7DE0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2217B7DF0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2217B7DFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2217CB798();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_2217B7E40(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_2217B7E64();
  a1[1] = v2;
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217B7E68()
{
  sub_2217B7F1C(&qword_255707F90, (uint64_t)&unk_2217CCF80);
  sub_2217B7F1C(&qword_255707F98, (uint64_t)&unk_2217CCF20);
  return sub_2217CBB1C();
}

uint64_t sub_2217B7ED4()
{
  return sub_2217B7F1C(&qword_255707F78, (uint64_t)&unk_2217CCEE4);
}

uint64_t sub_2217B7EF8()
{
  return sub_2217B7F1C(&qword_255707F80, (uint64_t)&unk_2217CCEB8);
}

uint64_t sub_2217B7F1C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for LNSymbolImagePlatform(255);
    result = MEMORY[0x227671804](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2217B7F5C()
{
  uint64_t *v0;

  return sub_2217B7F7C(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2217B7F7C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_2217CB7BC();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2217B7FB4()
{
  return sub_2217B7FBC();
}

uint64_t sub_2217B7FBC()
{
  sub_2217CB7BC();
  sub_2217CB7D4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2217B7FFC()
{
  return sub_2217B8004();
}

uint64_t sub_2217B8004()
{
  uint64_t v0;

  sub_2217CB7BC();
  sub_2217CBBA0();
  sub_2217CB7D4();
  v0 = sub_2217CBBB8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2217B8074()
{
  return sub_2217C1DBC();
}

uint64_t sub_2217B8080()
{
  return sub_2217B7F1C(&qword_255707F88, (uint64_t)&unk_2217CCF54);
}

void static ShareableEntity<>.configuration(from:)(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3(a1, &qword_255708060);
  swift_getKeyPath();
  v1 = sub_2217CB864();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708068);
  MEMORY[0x227671804](MEMORY[0x24BEE12C8], v1);
  sub_2217B827C();
  sub_2217CB804();
  swift_release();
  sub_2217B82C0();
  OUTLINED_FUNCTION_0_2();
}

char *keypath_get_selector_itemProvidersForActivityItemsConfiguration()
{
  return sel_itemProvidersForActivityItemsConfiguration;
}

void sub_2217B8190(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(*a1, sel_itemProvidersForActivityItemsConfiguration);
  sub_2217B87E8(0, (unint64_t *)&qword_255708078);
  v4 = sub_2217CB828();

  *a2 = v4;
}

uint64_t sub_2217B820C()
{
  swift_unknownObjectRetain();
  swift_getAtKeyPath();
  return swift_unknownObjectRelease();
}

uint64_t sub_2217B8264()
{
  return sub_2217B820C();
}

unint64_t sub_2217B827C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255708070;
  if (!qword_255708070)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255708068);
    result = MEMORY[0x227671804](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255708070);
  }
  return result;
}

id sub_2217B82C0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_2217B87E8(0, (unint64_t *)&qword_255708078);
  v1 = (void *)sub_2217CB81C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithItemProviders_, v1);

  return v2;
}

void static ShareableEntity.configuration(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[8];

  OUTLINED_FUNCTION_3(a1, &qword_255708060);
  v10[7] = a1;
  v10[4] = a2;
  v10[5] = a3;
  v10[2] = a3;
  v10[3] = swift_getKeyPath();
  v6 = sub_2217CB864();
  v7 = OUTLINED_FUNCTION_3(v6, (unint64_t *)&qword_255708078);
  v8 = MEMORY[0x227671804](MEMORY[0x24BEE12E0], v6);
  sub_2217B8498((void (*)(char *, char *))sub_2217B8470, (uint64_t)v10, v6, v7, MEMORY[0x24BEE4078], v8, MEMORY[0x24BEE40A8], v9);
  swift_release();
  sub_2217B82C0();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_2217B842C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2217CB324();
  *a1 = result;
  return result;
}

uint64_t sub_2217B8470()
{
  return swift_getAtKeyPath();
}

uint64_t sub_2217B8498(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void (*v25)(char *, _QWORD);
  void (*v26)(char *);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t AssociatedTypeWitness;
  void (*v45)(char *, char *);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50[32];
  uint64_t v51;

  v37 = a5;
  v38 = a8;
  v45 = a1;
  v46 = a2;
  v36 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v47 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(v16 - 8);
  v40 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v34 - v19;
  v21 = sub_2217CB8E8();
  if (!v21)
    return sub_2217CB84C();
  v22 = v21;
  v51 = sub_2217CBAC8();
  v41 = sub_2217CBAD4();
  sub_2217CBAB0();
  v43 = a6;
  result = sub_2217CB8DC();
  if ((v22 & 0x8000000000000000) == 0)
  {
    v24 = v22;
    v42 = v15;
    while (v24)
    {
      v48 = v24;
      v25 = (void (*)(char *, _QWORD))sub_2217CB900();
      v26 = *(void (**)(char *))(v10 + 16);
      v27 = v10;
      v28 = AssociatedTypeWitness;
      v26(v13);
      v25(v50, 0);
      v29 = v20;
      v30 = v49;
      v45(v13, v47);
      if (v30)
      {
        (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v47, v37);
      }
      v49 = 0;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
      sub_2217CBABC();
      result = sub_2217CB8F4();
      v24 = v48 - 1;
      v10 = v27;
      if (v48 == 1)
      {
        v32 = v39;
        v31 = v40;
        v33 = v35;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v35, v29, v40);
        sub_2217CBA74();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
        return v51;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2217B87E8(uint64_t a1, unint64_t *a2)
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

id OUTLINED_FUNCTION_0_3(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  void *v12;
  uint64_t v13;

  return objc_msgSend(v12, (SEL)(v13 + 779), a1, 1, &a12);
}

void sub_2217B8850(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_2217CB15C();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  sub_2217B8928((uint64_t)v4);
}

void sub_2217B88D0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_state;
  swift_beginAccess();
  v4 = OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  OUTLINED_FUNCTION_8();
}

void sub_2217B8928(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_state;
  OUTLINED_FUNCTION_7();
  v4 = OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_8();
}

uint64_t (*sub_2217B8980())()
{
  OUTLINED_FUNCTION_7();
  return j__swift_endAccess;
}

void AppEntityViewAnnotation.__allocating_init<A>(entity:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_12();
  AppEntityViewAnnotation.init<A>(entity:state:)(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5();
}

void AppEntityViewAnnotation.init<A>(entity:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;

  v34 = OUTLINED_FUNCTION_11();
  v31 = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6();
  v12 = v11 - v10;
  v33 = sub_2217CB39C();
  v30 = *(_QWORD *)(v33 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_6();
  v16 = v15 - v14;
  v17 = v4;
  sub_2217CB1EC();
  v18 = (uint64_t *)&v17[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_data];
  v18[3] = a3;
  v18[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  v32 = *(_QWORD *)(a3 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v32 + 16))(boxed_opaque_existential_1, a1, a3);
  v20 = *MEMORY[0x24BDB5390];
  v21 = OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v18, v20, v21);
  v22 = &v17[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_state];
  v23 = OUTLINED_FUNCTION_4();
  v24 = *(_QWORD *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v22, a2, v23);
  *(_DWORD *)&v17[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_interactionId] = sub_2217CB378();
  *(_QWORD *)&v17[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_structuredDataRepresentations] = sub_2217CB384();
  sub_2217CB534();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(&v17[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_displayRepresentation], v12, v34);
  v25 = sub_2217CB36C();
  v27 = v26;
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v16, v33);
  v28 = (uint64_t *)&v17[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_entityDescription];
  *v28 = v25;
  v28[1] = v27;

  v35.receiver = v17;
  v35.super_class = (Class)OUTLINED_FUNCTION_9();
  objc_msgSendSuper2(&v35, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a2, v23);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(a1, a3);
  OUTLINED_FUNCTION_2_0();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t type metadata accessor for AppEntityViewAnnotation()
{
  uint64_t result;

  result = qword_254064548;
  if (!qword_254064548)
    return swift_getSingletonMetadata();
  return result;
}

void AppEntityViewAnnotation.__allocating_init<A>(entityType:identifier:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_12();
  AppEntityViewAnnotation.init<A>(entityType:identifier:state:)(a1, a2, a3);
  OUTLINED_FUNCTION_5();
}

void AppEntityViewAnnotation.init<A>(entityType:identifier:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  objc_class *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
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
  objc_super v52;

  v41 = a1;
  v47 = a3;
  v49 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540644F8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_4();
  v51 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254064500);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_4();
  v45 = v7;
  v42 = sub_2217CB618();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_4();
  v43 = v9;
  v10 = OUTLINED_FUNCTION_11();
  v46 = *(_QWORD *)(v10 - 8);
  v38 = v10;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_4();
  v44 = v12;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v48 = AssociatedTypeWitness;
  v50 = v14;
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v16 = (char *)&v38 - v15;
  v17 = sub_2217CB39C();
  v18 = *(_QWORD *)(v17 - 8);
  v39 = v17;
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_6();
  v21 = v20 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, AssociatedTypeWitness);
  v22 = (char *)v40;
  sub_2217CB390();
  v23 = &v22[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_data];
  v24 = (uint64_t)&v23[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254064508) + 48)];
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v23, v21, v17);
  __swift_storeEnumTagSinglePayload(v24, 1, 1, v10);
  v25 = *MEMORY[0x24BDB5388];
  v26 = OUTLINED_FUNCTION_10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v23, v25, v26);
  v27 = &v22[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_state];
  v28 = OUTLINED_FUNCTION_4();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v27, v47, v28);
  *(_DWORD *)&v22[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_interactionId] = sub_2217CB378();
  sub_2217CB60C();
  __swift_storeEnumTagSinglePayload(v45, 1, 1, v42);
  v31 = sub_2217CB414();
  __swift_storeEnumTagSinglePayload(v51, 1, 1, v31);
  v32 = v44;
  sub_2217CB420();
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(&v22[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_displayRepresentation], v32, v38);
  *(_QWORD *)&v22[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_structuredDataRepresentations] = sub_2217CB384();
  v33 = sub_2217CB36C();
  v35 = v34;
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v39);
  v36 = (uint64_t *)&v22[OBJC_IVAR____TtC17_AppIntents_UIKit23AppEntityViewAnnotation_entityDescription];
  *v36 = v33;
  v36[1] = v35;

  v37 = (objc_class *)OUTLINED_FUNCTION_9();
  v52.receiver = v22;
  v52.super_class = v37;
  objc_msgSendSuper2(&v52, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v28);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v48);
  OUTLINED_FUNCTION_2_0();
}

id AppEntityViewAnnotation.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_12(), sel_init);
}

void AppEntityViewAnnotation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AppEntityViewAnnotation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_9();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2217B90D0(uint64_t a1@<X8>)
{
  sub_2217B88D0(a1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t sub_2217B9164()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_2217CB15C();
  if (v1 <= 0x3F)
  {
    result = sub_2217CB33C();
    if (v2 <= 0x3F)
    {
      result = sub_2217CB42C();
      if (v3 <= 0x3F)
        return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for AppEntityViewAnnotation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.state.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.state.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.__allocating_init<A>(entity:state:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AppEntityViewAnnotation.__allocating_init<A>(entityType:identifier:state:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_2217CB33C();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_2217CB42C();
}

uint64_t ShortcutsUIButton.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  swift_beginAccess();
  v4 = OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2217B933C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  swift_beginAccess();
  v4 = sub_2217CB6CC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_2217B93A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_2217CB6CC();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return ShortcutsUIButton.style.setter((uint64_t)v4);
}

uint64_t ShortcutsUIButton.style.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  OUTLINED_FUNCTION_7();
  v4 = OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(v3, a1, v4);
  swift_endAccess();
  sub_2217B94A0();
  return OUTLINED_FUNCTION_3_1();
}

void sub_2217B94A0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v1 = v0;
  v2 = sub_2217CB6CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2217CB69C();
  v16 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557080A0);
  MEMORY[0x24BDAC7A8](v9);
  v10 = OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView], sel_removeFromSuperview);
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  v11 = v1;
  sub_2217CB690();
  v12 = &v11[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v12, v2);
  sub_2217B9F24();
  sub_2217CB744();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
  v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557080B0));
  v14 = (void *)sub_2217CB72C();
  objc_msgSend(v11, sel_addSubview_, v14);
  objc_msgSend(v14, sel_setAutoresizingMask_, 18);
  objc_msgSend(v11, sel_bounds);
  objc_msgSend(v14, sel_setFrame_);
  v15 = *(void **)&v1[v10];
  *(_QWORD *)&v1[v10] = v14;

}

void (*ShortcutsUIButton.style.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_7();
  return sub_2217B9704;
}

void sub_2217B9704(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_2217B94A0();
}

char *ShortcutsUIButton.__allocating_init(style:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ShortcutsUIButton.init(style:)(a1);
}

char *ShortcutsUIButton.init(style:)(uint64_t a1)
{
  char *v1;
  objc_class *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  char *v10;
  objc_super v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_2();
  v4 = v1;
  OUTLINED_FUNCTION_4_0();
  *(_QWORD *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView] = 0;
  v5 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;

  v12.receiver = v1;
  v12.super_class = v3;
  v6 = (char *)objc_msgSendSuper2(&v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v7 = &v6[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  OUTLINED_FUNCTION_7();
  v8 = OUTLINED_FUNCTION_1_1();
  v9 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24);
  v10 = v6;
  v9(v7, a1, v8);
  swift_endAccess();
  sub_2217B94A0();

  OUTLINED_FUNCTION_3_1();
  return v10;
}

uint64_t sub_2217B9850(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2();
  v3 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style];
  v4 = v1;
  OUTLINED_FUNCTION_4_0();
  v5 = OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView] = 0;
  v6 = (uint64_t *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler];
  *v6 = 0;
  v6[1] = 0;

  v7 = OUTLINED_FUNCTION_1_1();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v3, v7);

  sub_2217B9BE0(*v6);
  swift_deallocPartialClassInstance();
  return 0;
}

CGSize __swiftcall ShortcutsUIButton.sizeThatFits(_:)(CGSize a1)
{
  char *v1;
  double height;
  double width;
  void *v4;
  double v5;
  double v6;
  CGSize result;
  objc_super v8;

  height = a1.height;
  width = a1.width;
  v4 = *(void **)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView];
  if (v4)
  {
    objc_msgSend(v4, sel_sizeThatFits_, a1.width, a1.height);
  }
  else
  {
    v8.receiver = v1;
    v8.super_class = (Class)OUTLINED_FUNCTION_2();
    objc_msgSendSuper2(&v8, sel_sizeThatFits_, width, height);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

uint64_t ShortcutsUIButton.addTarget(_:action:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t (**v7)();
  uint64_t v8;
  _BYTE v10[32];

  sub_2217B9B18(a1, (uint64_t)v10);
  v6 = swift_allocObject();
  sub_2217B9B8C((uint64_t)v10, v6 + 16);
  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 56) = a2;
  v7 = (uint64_t (**)())(v3 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);
  v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);
  *v7 = sub_2217B9BD4;
  v7[1] = (uint64_t (*)())v6;
  return sub_2217B9BE0(v8);
}

uint64_t sub_2217B9A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  id v6;
  void *v7;
  _BYTE v8[32];

  sub_2217B9B18(a1, (uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254064540);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    if (a2 == 64)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_performSelector_, a3);
      v6 = v7;
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2217B9B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254064540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2217B9B60()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2217B9B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254064540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2217B9BD4()
{
  uint64_t v0;

  return sub_2217B9A78(v0 + 16, *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_2217B9BE0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2217B9C74(uint64_t result)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(result + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    return sub_2217B9BE0((uint64_t)v1);
  }
  return result;
}

id ShortcutsUIButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ShortcutsUIButton.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ShortcutsUIButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_2();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2217B9DE4()
{
  return type metadata accessor for ShortcutsUIButton();
}

uint64_t type metadata accessor for ShortcutsUIButton()
{
  uint64_t result;

  result = qword_255708090;
  if (!qword_255708090)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2217B9E24()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2217CB6CC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ShortcutsUIButton()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ShortcutsUIButton.__allocating_init(style:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_2217B9EB8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254064540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2217B9EF8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2217B9F1C()
{
  uint64_t v0;

  return sub_2217B9C74(*(_QWORD *)(v0 + 16));
}

unint64_t sub_2217B9F24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557080A8;
  if (!qword_2557080A8)
  {
    v1 = sub_2217CB69C();
    result = MEMORY[0x227671804](MEMORY[0x24BDFBAA8], v1);
    atomic_store(result, (unint64_t *)&qword_2557080A8);
  }
  return result;
}

uint64_t sub_2217B9F64@<X0>(uint64_t a1@<X8>)
{
  return UITableViewAppIntentsDataSource.tableView(_:appEntityIdentifierForRowAt:)(a1);
}

uint64_t UITableViewAppIntentsDataSource.tableView(_:appEntityIdentifierForRowAt:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_2217CB39C();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t UITableView.appIntentsDataSource.getter()
{
  return 0;
}

uint64_t sub_2217B9FB8()
{
  uint64_t v0;

  v0 = swift_unknownObjectRetain();
  return UITableView.appIntentsDataSource.setter(v0);
}

uint64_t (*UITableView.appIntentsDataSource.modify(_QWORD *a1))()
{
  *a1 = 0;
  a1[1] = 0;
  return sub_2217B9FEC;
}

uint64_t sub_2217B9FEC()
{
  return swift_unknownObjectRelease();
}

void sub_2217B9FF4(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t dispatch thunk of UITableViewAppIntentsDataSource.tableView(_:appEntityIdentifierForRowAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void UISceneConnectionOptions._appIntentExecution.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  OUTLINED_FUNCTION_20();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v26 = type metadata accessor for _AppIntentExecution(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v27);
  v28 = OUTLINED_FUNCTION_27();
  v29 = type metadata accessor for _AppIntentExecution.Container(v28);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&a9 - v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707E30);
  OUTLINED_FUNCTION_3_0();
  v35 = MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&a9 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&a9 - v38;
  sub_2217BBD70();
  sub_2217CB990();
  sub_2217BBE70((uint64_t)v39, (uint64_t)v37, &qword_255707E30);
  v40 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v29) != 1)
  {
    sub_2217BBE38((uint64_t)v37, (uint64_t)v33, type metadata accessor for _AppIntentExecution.Container);
    sub_2217BBDAC((uint64_t)v33, v21);
    v41 = v20 + *(int *)(v26 + 20);
    v42 = OUTLINED_FUNCTION_2_2();
    *(_OWORD *)v41 = 0u;
    *(_OWORD *)(v41 + 16) = 0u;
    *(_QWORD *)(v41 + 32) = 0;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v20, v21, v42);
    v43 = v21 + *(int *)(v29 + 20);
    sub_2217BCF18(v41, (uint64_t *)&unk_255707E40);
    sub_2217BBDF0(v43, v41);
    sub_2217BBE38(v20, v25, type metadata accessor for _AppIntentExecution);
    sub_2217BCD58((uint64_t)v33, type metadata accessor for _AppIntentExecution.Container);
    v40 = 0;
  }
  __swift_storeEnumTagSinglePayload(v25, v40, 1, v26);
  sub_2217BCF18((uint64_t)v39, &qword_255707E30);
  OUTLINED_FUNCTION_2_0();
}

void _AppIntentExecution.callAsFunction<A>(for:handler:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(char *);
  uint64_t v4;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *);
  uint64_t v25;

  OUTLINED_FUNCTION_20();
  v2 = v1;
  v23 = v4;
  v24 = v3;
  v21[1] = v5;
  v22 = sub_2217CB0E4();
  v6 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v8 = (char *)v21 - v7;
  v9 = sub_2217CB9CC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v21 - v12;
  v14 = *(_QWORD *)(v2 - 8);
  v15 = MEMORY[0x24BDAC7A8](v11);
  v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v21 - v18;
  v20 = v0 + *(int *)(type metadata accessor for _AppIntentExecution(0) + 20);
  sub_2217BBE70(v20, (uint64_t)&v25, (uint64_t *)&unk_255707E40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255707E40);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_40((uint64_t)v13, 0);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v13, v2);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v2);
    sub_2217CB0CC();
    v24(v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v2);
  }
  else
  {
    OUTLINED_FUNCTION_40((uint64_t)v13, 1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  OUTLINED_FUNCTION_2_0();
}

uint64_t _AppIntentExecution.withExtendedNavigation(_:)(uint64_t a1, uint64_t a2)
{
  os_log_type_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD *v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F18);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  if (qword_255707F58 != -1)
    swift_once();
  v9 = sub_2217CB6FC();
  __swift_project_value_buffer(v9, (uint64_t)qword_2557094E8);
  v10 = sub_2217CB6E4();
  v11 = sub_2217CB930();
  if (OUTLINED_FUNCTION_31(v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_35();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2217B3000, v10, v2, "Client requested extended navigation time", v12, 2u);
    OUTLINED_FUNCTION_21();
  }

  sub_2217CB18C();
  sub_2217CB174();
  v13 = sub_2217CB8AC();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v13);
  v14 = (_QWORD *)OUTLINED_FUNCTION_5_0();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  sub_2217BA584(v8, (uint64_t)&unk_2557080C8, (uint64_t)v14);
  sub_2217CB168();
  swift_release();
  return swift_release();
}

uint64_t sub_2217BA530(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2217BD210;
  return v7();
}

uint64_t sub_2217BA584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2217CB8AC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2217BCF18(a1, &qword_255707F18);
  }
  else
  {
    sub_2217CB8A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2217CB870();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void static NSPredicate.matchingAnyExecution<A>(of:)(uint64_t a1)
{
  __n128 *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_3(a1, &qword_2557080D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080D8);
  v1 = (__n128 *)OUTLINED_FUNCTION_5_0();
  v2 = OUTLINED_FUNCTION_32(v1, (__n128)xmmword_2217CD1E0);
  v4 = v3;
  v1[3].n128_u64[1] = MEMORY[0x24BEE0D00];
  v1[4].n128_u64[0] = sub_2217BC62C();
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u64[1] = v4;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_5();
}

{
  __n128 *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_3(a1, &qword_2557080D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080D8);
  v1 = (__n128 *)OUTLINED_FUNCTION_5_0();
  v2 = OUTLINED_FUNCTION_32(v1, (__n128)xmmword_2217CD1E0);
  v4 = v3;
  v1[3].n128_u64[1] = MEMORY[0x24BEE0D00];
  v1[4].n128_u64[0] = sub_2217BC62C();
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u64[1] = v4;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_5();
}

void static NSPredicate.matching<A>(intent:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
  v0 = OUTLINED_FUNCTION_5_0();
  *(_OWORD *)(v0 + 16) = xmmword_2217CD1F0;
  OUTLINED_FUNCTION_3(v0, &qword_2557080D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080D8);
  v1 = OUTLINED_FUNCTION_5_0();
  *(_OWORD *)(v1 + 16) = xmmword_2217CD1E0;
  v2 = sub_2217CB21C();
  v4 = v3;
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v1 + 64) = sub_2217BC62C();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v4;
  OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 32) = sub_2217CB90C();
  OUTLINED_FUNCTION_45();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080F0);
  sub_2217CB204();
  v5 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3(v5, &qword_2557080F8);
  sub_2217BB0B4(v6, (SEL *)&selRef_andPredicateWithSubpredicates_);
}

uint64_t sub_2217BA940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080D8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2217CD1E0;
  swift_bridgeObjectRetain();
  sub_2217CB7E0();
  sub_2217CB7E0();
  sub_2217B87E8(0, &qword_2557080D0);
  sub_2217CB7E0();
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_2217BC62C();
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  return sub_2217CB90C();
}

uint64_t static NSPredicate.matching<A>(intent:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_27();
  sub_2217CB0E4();
  sub_2217CB0D8();
  static NSPredicate.matching<A>(intent:)();
  v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, a2);
  return v6;
}

void static NSPredicate.matchingAll<A, B>(intent:parameters:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_20();
  v3 = v2;
  v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  v27 = v6;
  if (v2 == 1)
  {
    OUTLINED_FUNCTION_9_0();
    v7 = OUTLINED_FUNCTION_30();
  }
  else
  {
    MEMORY[0x24BDAC7A8](v1);
    OUTLINED_FUNCTION_12_0();
    if (v3)
    {
      v8 = v27 & 0xFFFFFFFFFFFFFFFELL;
      v9 = v0;
      v10 = v3;
      do
      {
        v5 += 8;
        v8 += 8;
        OUTLINED_FUNCTION_14();
        *v9++ = OUTLINED_FUNCTION_30();
        --v10;
      }
      while (v10);
    }
    v7 = OUTLINED_FUNCTION_29();
  }
  v26 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_7_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
  v12 = OUTLINED_FUNCTION_5_0();
  *(_OWORD *)(v12 + 16) = xmmword_2217CD1F0;
  OUTLINED_FUNCTION_3(v12, &qword_2557080D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080D8);
  v13 = (__n128 *)OUTLINED_FUNCTION_5_0();
  v14 = OUTLINED_FUNCTION_25(v13, (__n128)xmmword_2217CD1E0);
  v16 = v15;
  v13[3].n128_u64[1] = MEMORY[0x24BEE0D00];
  v13[4].n128_u64[0] = sub_2217BC62C();
  v13[2].n128_u64[0] = v14;
  v13[2].n128_u64[1] = v16;
  v17 = v7;
  OUTLINED_FUNCTION_15();
  *(_QWORD *)(v12 + 32) = sub_2217CB90C();
  v28 = v12;
  v18 = sub_2217CB834();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_12_0();
  if (v3)
  {
    v19 = (int *)(v7 + 32);
    v20 = &v28;
    v21 = v3;
    do
    {
      if (v3 == 1)
        v22 = 0;
      else
        v22 = *v19;
      OUTLINED_FUNCTION_16(v22);
      *v20++ = v23;
      swift_retain();
      v19 += 4;
      --v21;
    }
    while (v21);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080F0);
  OUTLINED_FUNCTION_36();
  sub_2217CB210();
  OUTLINED_FUNCTION_33();
  v24 = (*(uint64_t (**)(unint64_t, uint64_t))(v26 + 8))(v5, v17);
  v25 = v28;
  OUTLINED_FUNCTION_3(v24, &qword_2557080F8);
  sub_2217BB0B4(v25, (SEL *)&selRef_andPredicateWithSubpredicates_);
  OUTLINED_FUNCTION_2_0();
}

{
  sub_2217BB134();
}

uint64_t sub_2217BAD60(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3((uint64_t)a1, &qword_2557080D0);
  sub_2217BA940(a2, a3);
  MEMORY[0x227670FF4]();
  sub_2217BCEAC(*(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10));
  sub_2217CB858();
  return sub_2217CB834();
}

void static NSPredicate.matchingAny<A, B>(intent:parameters:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int *v20;
  _QWORD *v21;
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

  OUTLINED_FUNCTION_20();
  v3 = v2;
  v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  v30 = v6;
  if (v2 == 1)
  {
    OUTLINED_FUNCTION_9_0();
    v7 = OUTLINED_FUNCTION_30();
  }
  else
  {
    MEMORY[0x24BDAC7A8](v1);
    OUTLINED_FUNCTION_12_0();
    if (v3)
    {
      v8 = v30 & 0xFFFFFFFFFFFFFFFELL;
      v9 = v0;
      v10 = v3;
      do
      {
        v5 += 8;
        v8 += 8;
        OUTLINED_FUNCTION_14();
        *v9++ = OUTLINED_FUNCTION_30();
        --v10;
      }
      while (v10);
    }
    v7 = OUTLINED_FUNCTION_29();
  }
  v31 = v7;
  v29 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_7_0();
  v13 = OUTLINED_FUNCTION_3(v12, &qword_2557080D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080D8);
  v14 = (__n128 *)OUTLINED_FUNCTION_5_0();
  v15 = OUTLINED_FUNCTION_25(v14, (__n128)xmmword_2217CD1E0);
  v17 = v16;
  v14[3].n128_u64[1] = MEMORY[0x24BEE0D00];
  v14[4].n128_u64[0] = sub_2217BC62C();
  v14[2].n128_u64[0] = v15;
  v14[2].n128_u64[1] = v17;
  OUTLINED_FUNCTION_15();
  v18 = (_QWORD *)v13;
  v19 = sub_2217CB90C();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_12_0();
  if (v3)
  {
    v20 = (int *)(v31 + 32);
    v21 = v18;
    v22 = v3;
    do
    {
      if (v3 == 1)
        v23 = 0;
      else
        v23 = *v20;
      OUTLINED_FUNCTION_16(v23);
      *v21++ = v24;
      swift_retain();
      v20 += 4;
      --v22;
    }
    while (v22);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557080F0);
  OUTLINED_FUNCTION_36();
  sub_2217CB210();
  OUTLINED_FUNCTION_33();
  v25 = (*(uint64_t (**)(unint64_t, uint64_t))(v29 + 8))(v5, v31);
  OUTLINED_FUNCTION_3(v25, &qword_2557080F8);
  sub_2217BB0B4(v33, (SEL *)&selRef_orPredicateWithSubpredicates_);
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
  v28 = OUTLINED_FUNCTION_5_0();
  *(_OWORD *)(v28 + 16) = xmmword_2217CD200;
  *(_QWORD *)(v28 + 32) = v19;
  *(_QWORD *)(v28 + 40) = v27;
  v32 = v28;
  sub_2217CB834();
  sub_2217BB0B4(v32, (SEL *)&selRef_andPredicateWithSubpredicates_);
  OUTLINED_FUNCTION_2_0();
}

{
  sub_2217BB134();
}

void sub_2217BB0B4(uint64_t a1, SEL *a2)
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_3(a1, &qword_2557080D0);
  v3 = (void *)sub_2217CB81C();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, v3);

  OUTLINED_FUNCTION_0_5();
}

void sub_2217BB134()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int *v24;
  _QWORD *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;

  OUTLINED_FUNCTION_20();
  v3 = v2;
  v5 = v4;
  v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
  v8 = 8 * v4;
  v32 = v10;
  v33 = v9;
  v34 = v11;
  v31 = v6;
  if (v4 == 1)
  {
    OUTLINED_FUNCTION_9_0();
    v12 = sub_2217CBBDC();
  }
  else
  {
    v35 = v29;
    MEMORY[0x24BDAC7A8](v1);
    v0 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v5)
    {
      v13 = v33 & 0xFFFFFFFFFFFFFFFELL;
      v14 = (_QWORD *)((char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
      v15 = v5;
      do
      {
        v7 += 8;
        v13 += 8;
        OUTLINED_FUNCTION_14();
        *v14++ = sub_2217CBBDC();
        --v15;
      }
      while (v15);
    }
    v12 = OUTLINED_FUNCTION_29();
  }
  v35 = (_QWORD *)v12;
  v30 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_7_0();
  v29[1] = v29;
  v17 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_6();
  v21 = v20 - v19;
  sub_2217CB0E4();
  v22 = sub_2217CB0D8();
  v29[0] = v29;
  MEMORY[0x24BDAC7A8](v22);
  v23 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5)
  {
    v24 = (int *)(v35 + 4);
    v25 = v23;
    v26 = v5;
    do
    {
      if (v5 == 1)
        v27 = 0;
      else
        v27 = *v24;
      OUTLINED_FUNCTION_16(v27);
      *v25++ = v28;
      swift_retain();
      v24 += 4;
      --v26;
    }
    while (v26);
  }
  v32(v21, v23, v5, v3, v31, v34, v33);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v3);
  (*(void (**)(char *, _QWORD *))(v30 + 8))(v0, v35);
  OUTLINED_FUNCTION_2_0();
}

void sub_2217BB34C()
{
  sub_2217CBBAC();
  OUTLINED_FUNCTION_0();
}

void sub_2217BB36C()
{
  OUTLINED_FUNCTION_44();
  sub_2217CBBAC();
  sub_2217CBBB8();
  OUTLINED_FUNCTION_37();
}

uint64_t sub_2217BB39C()
{
  return 1;
}

uint64_t sub_2217BB3AC()
{
  sub_2217CBBA0();
  sub_2217CBBAC();
  return sub_2217CBBB8();
}

BOOL sub_2217BB3F8()
{
  uint64_t v0;

  v0 = sub_2217CBB28();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_2217BB44C()
{
  sub_2217CBBA0();
  sub_2217CB7D4();
  return sub_2217CBBB8();
}

uint64_t sub_2217BB4A4()
{
  return sub_2217CB7D4();
}

uint64_t sub_2217BB4C4()
{
  sub_2217CBBA0();
  sub_2217CB7D4();
  return sub_2217CBBB8();
}

BOOL sub_2217BB514@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2217BB3F8();
  *a1 = result;
  return result;
}

void sub_2217BB548(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = j__OUTLINED_FUNCTION_8_0();
  a1[1] = v2;
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217BB56C@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = sub_2217BB43C();
  *a1 = result != 0;
  return result;
}

uint64_t sub_2217BB598()
{
  return 0;
}

void sub_2217BB5A4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2217BB5B0()
{
  sub_2217BCDA8();
  return sub_2217CBBE8();
}

uint64_t sub_2217BB5D8()
{
  sub_2217BCDA8();
  return sub_2217CBBF4();
}

uint64_t sub_2217BB600(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557081A0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6();
  v6 = v5 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2217BCDA8();
  sub_2217CBBD0();
  sub_2217CB66C();
  sub_2217BCCA8(&qword_2557081A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_2217CBB40();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
}

void sub_2217BB708(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45[3];
  uint64_t v46;

  v38 = a2;
  v42 = sub_2217CB66C();
  v39 = *(_QWORD *)(v42 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v32 - v7;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_255708178);
  v41 = *(_QWORD *)(v46 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6();
  v11 = v10 - v9;
  type metadata accessor for _AppIntentExecution.Container(0);
  OUTLINED_FUNCTION_3_0();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (uint64_t)&v15[*(int *)(v13 + 20)];
  *(_QWORD *)(v16 + 32) = 0;
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2217BCDA8();
  sub_2217CBBC4();
  if (v2)
  {
LABEL_3:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    sub_2217BCF18(v16, (uint64_t *)&unk_255707E40);
    return;
  }
  v35 = v3;
  v36 = v16;
  v17 = v38;
  v18 = v39;
  v37 = a1;
  sub_2217BCCA8(&qword_255708188, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v19 = v40;
  sub_2217CBB34();
  v20 = v41;
  sub_2217CB18C();
  sub_2217CB174();
  sub_2217CB180();
  swift_release();
  if (!v44)
  {
    v38 = v11;
    sub_2217BCF18((uint64_t)&v43, (uint64_t *)&unk_255707E40);
    if (qword_255707F58 != -1)
      swift_once();
    v22 = sub_2217CB6FC();
    __swift_project_value_buffer(v22, (uint64_t)qword_2557094E8);
    v23 = v18;
    v24 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 16);
    v25 = v42;
    v24(v35, v19, v42);
    v26 = sub_2217CB6E4();
    v27 = sub_2217CB924();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_QWORD *)&v45[0] = v34;
      v33 = v28;
      *(_DWORD *)v28 = 136315138;
      sub_2217BCCA8(&qword_255708198, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v29 = sub_2217CBB4C();
      *(_QWORD *)&v43 = sub_2217BEC98(v29, v30, (uint64_t *)v45);
      sub_2217CB9E4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_42();
      _os_log_impl(&dword_2217B3000, v26, v27, "Failed to find contents for %s", v33, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21();
    }
    v31 = *(void (**)(char *, uint64_t))(v23 + 8);
    OUTLINED_FUNCTION_42();

    sub_2217BCDE4();
    swift_allocError();
    swift_willThrow();
    v31(v19, v25);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v38, v46);
    v16 = v36;
    a1 = v37;
    goto LABEL_3;
  }
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v11, v46);
  sub_2217B7BEC(&v43, (uint64_t)v45);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v19, v42);
  v21 = v36;
  sub_2217BCF18(v36, (uint64_t *)&unk_255707E40);
  sub_2217B7BEC(v45, v21);
  sub_2217BBDAC((uint64_t)v15, v17);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  sub_2217BCD58((uint64_t)v15, type metadata accessor for _AppIntentExecution.Container);
}

uint64_t sub_2217BBB74()
{
  OUTLINED_FUNCTION_2_2();
  sub_2217BCCA8(&qword_2557081B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_2217CB78C();
}

void sub_2217BBBC8()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_2_2();
  sub_2217BCCA8(&qword_2557081B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_2217CB78C();
  sub_2217CBBB8();
  OUTLINED_FUNCTION_37();
}

void sub_2217BBC20(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2217BB708(a1, a2);
}

uint64_t sub_2217BBC34(_QWORD *a1)
{
  return sub_2217BB600(a1);
}

uint64_t sub_2217BBC50()
{
  sub_2217CBBA0();
  sub_2217CB66C();
  sub_2217BCCA8(&qword_2557081B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_2217CB78C();
  return sub_2217CBBB8();
}

uint64_t (*sub_2217BBCBC(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_unknownObjectRetain();
  return sub_2217BCFF8;
}

uint64_t type metadata accessor for _AppIntentExecution(uint64_t a1)
{
  return sub_2217BBD40(a1, qword_255707D28);
}

uint64_t type metadata accessor for _AppIntentExecution.Container(uint64_t a1)
{
  return sub_2217BBD40(a1, qword_255707E18);
}

uint64_t sub_2217BBD40(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2217BBD70()
{
  unint64_t result;

  result = qword_255707E08;
  if (!qword_255707E08)
  {
    result = MEMORY[0x227671804](&unk_2217CD360, &unk_24E740298);
    atomic_store(result, (unint64_t *)&qword_255707E08);
  }
  return result;
}

uint64_t sub_2217BBDAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _AppIntentExecution.Container(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2217BBDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255707E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2217BBE38(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_0();
}

void sub_2217BBE70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217BBEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(a1, a2, ObjectType, a4);
}

uint64_t sub_2217BBEF8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *, char *))
{
  uint64_t v6;
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
  uint64_t v18;
  uint64_t v19;

  v6 = type metadata accessor for _AppIntentExecution.Container(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for _AppIntentExecution(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v18 - v13;
  sub_2217BBDAC(a2, (uint64_t)v8);
  v15 = (uint64_t)&v12[*(int *)(v9 + 20)];
  v16 = sub_2217CB66C();
  *(_OWORD *)v15 = 0u;
  *(_OWORD *)(v15 + 16) = 0u;
  *(_QWORD *)(v15 + 32) = 0;
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v12, v8, v16);
  sub_2217BCD10((uint64_t)&v8[*(int *)(v6 + 20)], v15);
  sub_2217BBE38((uint64_t)v12, (uint64_t)v14, type metadata accessor for _AppIntentExecution);
  v19 = a1;
  a3(&v19, v14);
  sub_2217BCD58((uint64_t)v14, type metadata accessor for _AppIntentExecution);
  return swift_release();
}

uint64_t (*sub_2217BC060())@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v0;
  uint64_t (*v1)();
  uint64_t v2;

  v1 = off_255707D40;
  v0 = *(_QWORD *)algn_255707D48;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  swift_retain();
  return sub_2217BCD80;
}

uint64_t sub_2217BC0C0@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD, _QWORD)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = a2(*a1, a1[1]);
  v6 = v5;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v4;
  *(_QWORD *)(result + 24) = v6;
  *a3 = sub_2217BCD88;
  a3[1] = result;
  return result;
}

uint64_t sub_2217BC124(void (**a1)(uint64_t *, char *), uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t *, char *);

  v5 = *a1;
  swift_retain();
  return sub_2217BBEF8(a2, a3, v5);
}

uint64_t sub_2217BC16C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v3[6] = type metadata accessor for _AppIntentExecution.Container(0);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217BC1CC()
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
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
  v6 = OUTLINED_FUNCTION_5_0();
  *(_OWORD *)(v6 + 16) = xmmword_2217CD1F0;
  v7 = OUTLINED_FUNCTION_2_2();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v2, v1, v7);
  v9 = v2 + *(int *)(v3 + 20);
  OUTLINED_FUNCTION_3(v8, (unint64_t *)&unk_2557081C0);
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_QWORD *)(v9 + 32) = 0;
  v10 = OUTLINED_FUNCTION_5_0();
  *(_QWORD *)(v10 + 16) = v5;
  *(_QWORD *)(v10 + 24) = v4;
  swift_retain();
  v11 = sub_2217BC478((uint64_t)sub_2217BCEFC, v10);
  sub_2217BBD70();
  v12 = sub_2217CB708();
  sub_2217BCD58(*(_QWORD *)(v0 + 56), type metadata accessor for _AppIntentExecution.Container);

  *(_QWORD *)(v6 + 32) = v12;
  OUTLINED_FUNCTION_45();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0 + 8))();
}

id sub_2217BC478(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  _QWORD v5[6];

  v5[4] = a1;
  v5[5] = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_2217BC50C;
  v5[3] = &block_descriptor;
  v2 = _Block_copy(v5);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_responderWithHandler_, v2);
  _Block_release(v2);
  swift_release();
  return v3;
}

void sub_2217BC50C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2217BC55C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2217BC588(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2217BC600;
  return sub_2217BA530(a1, v4, v5, v6);
}

uint64_t sub_2217BC600()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2217BC62C()
{
  unint64_t result;

  result = qword_2557080E0;
  if (!qword_2557080E0)
  {
    result = MEMORY[0x227671804](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2557080E0);
  }
  return result;
}

uint64_t dispatch thunk of _AppIntentSceneDelegate.scene(_:willPerform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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

uint64_t getEnumTagSinglePayload for _AppIntentExecution()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for _AppIntentExecution()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata accessor for _AppIntentExecution.Definition()
{
  OUTLINED_FUNCTION_39();
}

void _s17_AppIntents_UIKit19_AppIntentExecutionVwCP_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    *a1 = *a2;
    swift_retain();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
    v7 = *(int *)(a3 + 20);
    v8 = (uint64_t)a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = *(_QWORD *)((char *)a2 + v7 + 24);
    if (v10)
      OUTLINED_FUNCTION_26(v8, v9, v10);
    else
      OUTLINED_FUNCTION_38(v8, v9);
  }
  OUTLINED_FUNCTION_0_5();
}

void _s17_AppIntents_UIKit19_AppIntentExecutionVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  if (*(_QWORD *)(v5 + 24))
    __swift_destroy_boxed_opaque_existential_0(v5);
  else
    OUTLINED_FUNCTION_0();
}

void _s17_AppIntents_UIKit19_AppIntentExecutionVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_41(a1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 24);
  if (v10)
    OUTLINED_FUNCTION_26(v8, v9, v10);
  else
    OUTLINED_FUNCTION_38(v8, v9);
  OUTLINED_FUNCTION_0_5();
}

void _s17_AppIntents_UIKit19_AppIntentExecutionVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v6 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_41(a1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24));
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (__int128 *)(a2 + v7);
  v10 = *((_QWORD *)v9 + 3);
  if (!*(_QWORD *)(a1 + v7 + 24))
  {
    if (v10)
    {
      *(_QWORD *)(v8 + 24) = v10;
      *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
      OUTLINED_FUNCTION_41(v8, **(uint64_t (***)(uint64_t, uint64_t))(v10 - 8));
      goto LABEL_8;
    }
LABEL_7:
    v11 = *v9;
    v12 = v9[1];
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    *(_OWORD *)v8 = v11;
    *(_OWORD *)(v8 + 16) = v12;
    goto LABEL_8;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_0(v8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v8, (uint64_t *)v9);
LABEL_8:
  OUTLINED_FUNCTION_0_5();
}

void _s17_AppIntents_UIKit19_AppIntentExecutionVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v6 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  OUTLINED_FUNCTION_0_5();
}

void _s17_AppIntents_UIKit19_AppIntentExecutionVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v6 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40));
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  if (*(_QWORD *)(a1 + v7 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  v9 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(a2 + v7 + 32);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2217BCAC8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t sub_2217BCB5C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  return result;
}

uint64_t sub_2217BCBE0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2217CB66C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_2217BCC50()
{
  sub_2217BCCA8(&qword_255708160, type metadata accessor for _AppIntentExecution.Container, (uint64_t)&unk_2217CD2A8);
}

void sub_2217BCC7C()
{
  sub_2217BCCA8(&qword_255708168, type metadata accessor for _AppIntentExecution.Container, (uint64_t)&unk_2217CD338);
}

void sub_2217BCCA8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x227671804](a3, v5), a1);
  }
  OUTLINED_FUNCTION_0();
}

void sub_2217BCCE4()
{
  sub_2217BCCA8(&qword_255708170, type metadata accessor for _AppIntentExecution.Container, (uint64_t)&unk_2217CD310);
}

uint64_t sub_2217BCD10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255707E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2217BCD58(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_22(v2);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217BCD80@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_2217BC0C0(a1, *(uint64_t (**)(_QWORD, _QWORD))(v2 + 16), a2);
}

void sub_2217BCD88(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD))(v1 + 16))(*a1);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_2217BCDA8()
{
  unint64_t result;

  result = qword_255708180;
  if (!qword_255708180)
  {
    result = MEMORY[0x227671804](&unk_2217CD58C, &unk_24E7402F0);
    atomic_store(result, (unint64_t *)&qword_255708180);
  }
  return result;
}

unint64_t sub_2217BCDE4()
{
  unint64_t result;

  result = qword_255708190;
  if (!qword_255708190)
  {
    result = MEMORY[0x227671804](&unk_2217CD54C, &unk_24E740380);
    atomic_store(result, (unint64_t *)&qword_255708190);
  }
  return result;
}

uint64_t sub_2217BCE20(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2217BCE84;
  return v6(a1);
}

uint64_t sub_2217BCE84()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217BCEAC(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_2217CB840();
  return result;
}

uint64_t sub_2217BCED8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2217BCEFC()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_0();
}

void sub_2217BCF18(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_22(v2);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217BCF40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2217BCFB0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2557081D0 + dword_2557081D0))(a1, v4);
}

uint64_t sub_2217BCFB0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217BCFD4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2217BCFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2217BBEA8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_2217BD010()
{
  return 0;
}

void type metadata accessor for _AppIntentExecutionError()
{
  OUTLINED_FUNCTION_39();
}

uint64_t sub_2217BD028(unsigned int *a1, int a2)
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

uint64_t sub_2217BD078(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2217BD0B8 + 4 * byte_2217CD230[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2217BD0D8 + 4 * byte_2217CD235[v4]))();
}

_BYTE *sub_2217BD0B8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2217BD0D8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2217BD0E0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2217BD0E8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2217BD0F0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2217BD0F8(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for _AppIntentExecution.Container.CodingKeys()
{
  OUTLINED_FUNCTION_39();
}

unint64_t sub_2217BD114()
{
  unint64_t result;

  result = qword_2557081E0;
  if (!qword_2557081E0)
  {
    result = MEMORY[0x227671804](&unk_2217CD4BC, &unk_24E7402F0);
    atomic_store(result, (unint64_t *)&qword_2557081E0);
  }
  return result;
}

unint64_t sub_2217BD154()
{
  unint64_t result;

  result = qword_2557081E8;
  if (!qword_2557081E8)
  {
    result = MEMORY[0x227671804](&unk_2217CD524, &unk_24E740380);
    atomic_store(result, (unint64_t *)&qword_2557081E8);
  }
  return result;
}

unint64_t sub_2217BD194()
{
  unint64_t result;

  result = qword_2557081F0;
  if (!qword_2557081F0)
  {
    result = MEMORY[0x227671804](&unk_2217CD3F4, &unk_24E7402F0);
    atomic_store(result, (unint64_t *)&qword_2557081F0);
  }
  return result;
}

unint64_t sub_2217BD1D4()
{
  unint64_t result;

  result = qword_2557081F8;
  if (!qword_2557081F8)
  {
    result = MEMORY[0x227671804](&unk_2217CD41C, &unk_24E7402F0);
    atomic_store(result, (unint64_t *)&qword_2557081F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return 0x696669746E656469;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_2217CB354();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_2217CB90C();
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2217CB354();
}

unint64_t OUTLINED_FUNCTION_15()
{
  return 0xD000000000000012;
}

uint64_t OUTLINED_FUNCTION_16@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t **v2;
  uint64_t result;

  result = **v2;
  *(_QWORD *)(v1 + a1) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_25(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2217CB21C();
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = v3;
  return (**(uint64_t (***)(void))(a3 - 8))();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_getTupleTypeMetadata();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_2217CBBDC();
}

BOOL OUTLINED_FUNCTION_31(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_32(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2217CB21C();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;

  return v0 - 96;
}

__n128 OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

uint64_t OUTLINED_FUNCTION_41@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

id OUTLINED_FUNCTION_43()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_2217CBBA0();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_2217CB834();
}

uint64_t sub_2217BD404@<X0>(uint64_t a1@<X8>)
{
  return UICollectionViewAppIntentsDataSource.collectionView(_:appEntityIdentifierForItemAt:)(a1);
}

uint64_t UICollectionViewAppIntentsDataSource.collectionView(_:appEntityIdentifierForItemAt:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_2217CB39C();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t UICollectionView.appIntentsDataSource.getter()
{
  return 0;
}

uint64_t sub_2217BD458()
{
  uint64_t v0;

  v0 = swift_unknownObjectRetain();
  return UICollectionView.appIntentsDataSource.setter(v0);
}

uint64_t (*UICollectionView.appIntentsDataSource.modify(_QWORD *a1))()
{
  *a1 = 0;
  a1[1] = 0;
  return sub_2217B9FEC;
}

void sub_2217BD48C(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t dispatch thunk of UICollectionViewAppIntentsDataSource.collectionView(_:appEntityIdentifierForItemAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

id UIKitBridgeLoader.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UIKitBridgeLoader.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIKitBridgeLoader();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for UIKitBridgeLoader()
{
  return objc_opt_self();
}

id UIKitBridgeLoader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIKitBridgeLoader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static UIKitBridgeLoader.loadBridge()()
{
  uint64_t result;

  if (qword_254064658 != -1)
    return swift_once();
  return result;
}

void UIView.appEntityIdentifier.getter()
{
  OUTLINED_FUNCTION_7_1();
  sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB4C8();
  OUTLINED_FUNCTION_13_0();
}

unint64_t sub_2217BD5F8()
{
  unint64_t result;

  result = qword_254064600;
  if (!qword_254064600)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254064600);
  }
  return result;
}

void sub_2217BD634(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255707D20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217B79C0(a1, (uint64_t)v4, &qword_255707D20);
  UIView.appEntityIdentifier.setter((uint64_t)v4);
}

void UIView.appEntityIdentifier.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255707D20);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OUTLINED_FUNCTION_15_0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_11_1();
  sub_2217B79C0(a1, (uint64_t)v5, &qword_255707D20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_2217BF400((uint64_t)v5, &qword_255707D20);
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    _sSo6UIViewC17_AppIntents_UIKitE014setRepresentedB6Entityyy0bC00bG0_pSgF_0();
    sub_2217BF400(a1, &qword_255707D20);
    sub_2217BF400((uint64_t)v8, &qword_254064538);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v1, v5, v6);
    sub_2217BDB74();
    sub_2217BF400(a1, &qword_255707D20);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  }
}

void _sSo6UIViewC17_AppIntents_UIKitE014setRepresentedB6Entityyy0bC00bG0_pSgF_0()
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
  __int128 v17;
  uint64_t v18;
  _QWORD v19[5];

  OUTLINED_FUNCTION_20();
  v3 = OUTLINED_FUNCTION_22_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_11_1();
  v5 = sub_2217CB33C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6();
  v9 = v8 - v7;
  v19[0] = v0;
  OUTLINED_FUNCTION_7_1();
  sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB4E0();
  sub_2217B79C0(v2, (uint64_t)&v17, &qword_254064538);
  if (v18)
  {
    sub_2217B7BEC(&v17, (uint64_t)v19);
    sub_2217B5E94((uint64_t)v19, v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDB5390], v5);
    if (qword_254064658 != -1)
      swift_once();
    *(_QWORD *)&v17 = MEMORY[0x24BEE4AF8];
    sub_2217BCCA8(&qword_254064580, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4CD8], MEMORY[0x24BDB4CE8]);
    OUTLINED_FUNCTION_19_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254064588);
    OUTLINED_FUNCTION_25_0();
    sub_2217CBA08();
    OUTLINED_FUNCTION_9_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    OUTLINED_FUNCTION_1_3((unint64_t *)&unk_254064610, v10, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_1_3(&qword_2540645A0, v11, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_1_3(&qword_254064620, v12, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_1_3((unint64_t *)&unk_2540645F0, v13, (uint64_t)&protocol conformance descriptor for UIView);
    sub_2217CB198();
    OUTLINED_FUNCTION_18();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  }
  else
  {
    sub_2217BF400((uint64_t)&v17, &qword_254064538);
    if (qword_254064658 != -1)
      swift_once();
    OUTLINED_FUNCTION_9_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    OUTLINED_FUNCTION_2_3((unint64_t *)&unk_254064610, v14, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_2_3(&qword_254064620, v15, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_2_3((unint64_t *)&unk_2540645F0, v16, (uint64_t)&protocol conformance descriptor for UIView);
    swift_retain();
    sub_2217CB1C8();
    swift_release();
  }
  OUTLINED_FUNCTION_2_0();
}

void sub_2217BDB74()
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

  OUTLINED_FUNCTION_20();
  v2 = OUTLINED_FUNCTION_22_0();
  v18 = *(_QWORD *)(v2 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v3);
  v4 = OUTLINED_FUNCTION_3_2();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  OUTLINED_FUNCTION_7_1();
  sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB4D4();
  v9 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254064508) + 48);
  v10 = OUTLINED_FUNCTION_15_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v1, v10);
  v11 = sub_2217CB42C();
  OUTLINED_FUNCTION_28_0(v9, v12, v13, v11);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BDB5388], v4);
  if (qword_254064658 != -1)
    swift_once();
  sub_2217BCCA8(&qword_254064580, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4CD8], MEMORY[0x24BDB4CE8]);
  OUTLINED_FUNCTION_19_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254064588);
  OUTLINED_FUNCTION_25_0();
  sub_2217CBA08();
  OUTLINED_FUNCTION_9_1();
  sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
  OUTLINED_FUNCTION_1_3((unint64_t *)&unk_254064610, v14, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_1_3(&qword_2540645A0, v15, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_1_3(&qword_254064620, v16, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_1_3((unint64_t *)&unk_2540645F0, v17, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB198();
  OUTLINED_FUNCTION_18();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v0, v2);
  OUTLINED_FUNCTION_21_0(v5);
  OUTLINED_FUNCTION_2_0();
}

void (*UIView.appEntityIdentifier.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;

  a1[1] = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255707D20) - 8) + 64);
  a1[2] = malloc(v3);
  a1[3] = malloc(v3);
  *a1 = v1;
  OUTLINED_FUNCTION_7_1();
  sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB4C8();
  return sub_2217BDE98;
}

void sub_2217BDE98(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_0();
    UIView.appEntityIdentifier.setter((uint64_t)v2);
    OUTLINED_FUNCTION_24();
  }
  else
  {
    UIView.appEntityIdentifier.setter(*(_QWORD *)(a1 + 24));
  }
  free(v3);
  OUTLINED_FUNCTION_5_1(v2);
}

void sub_2217BDEEC()
{
  UIView.appEntityIdentifier.getter();
}

void sub_2217BDF0C(uint64_t a1)
{
  UIView.appEntityIdentifier.setter(a1);
}

void (*sub_2217BDF2C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t *v1;
  size_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255707D20) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  v5 = *v1;
  a1[2] = v4;
  a1[3] = v5;
  *a1 = v5;
  sub_2217BD5F8();
  sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
  sub_2217CB4C8();
  return sub_2217BDFD0;
}

void sub_2217BDFD0(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_0();
    UIView.appEntityIdentifier.setter((uint64_t)v3);
    OUTLINED_FUNCTION_24();
  }
  else
  {
    UIView.appEntityIdentifier.setter(*(_QWORD *)(a1 + 16));
  }
  free(v2);
  OUTLINED_FUNCTION_5_1(v3);
}

uint64_t UIView.setEntityProvider<A>(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25[3];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_6();
  v4 = v3 - v2;
  v26 = v5;
  v27 = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  OUTLINED_FUNCTION_26_0((uint64_t)boxed_opaque_existential_1);
  objc_msgSend(v1, sel_bounds);
  v8 = sub_2217CB588();
  swift_allocObject();
  v24 = sub_2217CB57C();
  if (qword_254064670 != -1)
    swift_once();
  v9 = sub_2217CB6FC();
  __swift_project_value_buffer(v9, (uint64_t)qword_254064730);
  v10 = v1;
  v11 = sub_2217CB6E4();
  v12 = sub_2217CB930();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    v14 = objc_msgSend(v10, sel_description);
    v15 = sub_2217CB7BC();
    v17 = v16;

    sub_2217BEC98(v15, v17, v25);
    sub_2217CB9E4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2217B3000, v11, v12, "Attaching custom entity provider to view: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21();
  }

  v26 = v8;
  v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB6508];
  sub_2217BCCA8((unint64_t *)&unk_255707F20, (uint64_t (*)(uint64_t))MEMORY[0x24BDB6508], MEMORY[0x24BDB64F0]);
  v27 = v19;
  sub_2217BCCA8(&qword_255707F38, v18, MEMORY[0x24BDB64F8]);
  v28 = v20;
  v25[0] = v24;
  OUTLINED_FUNCTION_19_0();
  sub_2217CB9A8();
  sub_2217CB264();
  sub_2217CB24C();
  sub_2217CB594();
  OUTLINED_FUNCTION_26_0(v4);
  OUTLINED_FUNCTION_16_0((unint64_t *)&unk_254064610, v21, (uint64_t)&protocol conformance descriptor for UIView);
  OUTLINED_FUNCTION_16_0(&qword_254064620, v22, (uint64_t)&protocol conformance descriptor for UIView);
  swift_unknownObjectRetain();
  sub_2217CB5A0();
  sub_2217CB258();
  OUTLINED_FUNCTION_18();
  swift_release();
  return swift_release();
}

void UIView.annotate(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  __int128 *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[40];
  _QWORD v14[5];

  OUTLINED_FUNCTION_20();
  v1 = OUTLINED_FUNCTION_15_0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = OUTLINED_FUNCTION_3_2();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = (__int128 *)&v13[-v8];
  OUTLINED_FUNCTION_27_0((uint64_t)&v13[-v8]);
  v10 = (*(uint64_t (**)(__int128 *, uint64_t))(v4 + 88))(v9, v3);
  if (v10 == *MEMORY[0x24BDB5398])
  {
    OUTLINED_FUNCTION_4_1();
    v11 = sub_2217CB12C();
    OUTLINED_FUNCTION_21_0(*(_QWORD *)(v11 - 8));
LABEL_7:
    OUTLINED_FUNCTION_2_0();
    return;
  }
  if (v10 == *MEMORY[0x24BDB5390])
  {
    OUTLINED_FUNCTION_4_1();
    sub_2217B7BEC(v9, (uint64_t)v14);
    sub_2217B5E94((uint64_t)v14, (uint64_t)v13);
    _sSo6UIViewC17_AppIntents_UIKitE014setRepresentedB6Entityyy0bC00bG0_pSgF_0();
    sub_2217BF400((uint64_t)v13, &qword_254064538);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    goto LABEL_7;
  }
  if (v10 == *MEMORY[0x24BDB5388])
  {
    OUTLINED_FUNCTION_4_1();
    v12 = (uint64_t)v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254064508) + 48);
    (*(void (**)(uint64_t, __int128 *, uint64_t))(v2 + 32))(v0, v9, v1);
    sub_2217BDB74();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
    sub_2217BF400(v12, &qword_254064558);
    goto LABEL_7;
  }
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  sub_2217CBA80();
  sub_2217CB7E0();
  OUTLINED_FUNCTION_27_0((uint64_t)v7);
  sub_2217CBAE0();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
  sub_2217CBAF8();
  __break(1u);
}

Swift::Void __swiftcall UIView.removeAnnotation()()
{
  _OWORD v0[2];
  uint64_t v1;

  v1 = 0;
  memset(v0, 0, sizeof(v0));
  _sSo6UIViewC17_AppIntents_UIKitE014setRepresentedB6Entityyy0bC00bG0_pSgF_0();
  sub_2217BF400((uint64_t)v0, &qword_254064538);
}

uint64_t UIView.updateViewProvider(with:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_2217CB480();
  OUTLINED_FUNCTION_16_0(&qword_254064568, v0, MEMORY[0x24BDB6040]);
  OUTLINED_FUNCTION_16_0((unint64_t *)&unk_254064570, v1, MEMORY[0x24BDB6048]);
  swift_retain();
  return sub_2217CB9A8();
}

uint64_t sub_2217BE6EC()
{
  return UIView.viewProvider.getter();
}

uint64_t sub_2217BE714()
{
  return UIView.updateViewProvider(with:)();
}

void sub_2217BE738()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[6];

  OUTLINED_FUNCTION_20();
  v53 = v0;
  v2 = v1;
  v43 = v3;
  v4 = sub_2217CB15C();
  v44 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_4();
  v7 = v6;
  v8 = sub_2217CB33C();
  v51 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_4();
  v50 = v10;
  v11 = OUTLINED_FUNCTION_15_0();
  v48 = *(_QWORD *)(v11 - 8);
  v49 = v11;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_0_4();
  v47 = v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = sub_2217CB9CC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v42 - v17;
  v46 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_3_0();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v45 = (char *)&v42 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v2, v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v54[5] = v53;
    OUTLINED_FUNCTION_7_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
    memset(v54, 0, 40);
    sub_2217CB4E0();
    sub_2217BF400((uint64_t)v54, &qword_254064538);
    if (qword_254064658 != -1)
      swift_once();
    OUTLINED_FUNCTION_9_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    OUTLINED_FUNCTION_20_0((unint64_t *)&unk_254064610, v24, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_20_0(&qword_254064620, v25, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_20_0((unint64_t *)&unk_2540645F0, v26, (uint64_t)&protocol conformance descriptor for UIView);
    swift_retain();
    sub_2217CB1C8();
    swift_release();
  }
  else
  {
    v28 = v45;
    v27 = v46;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v45, v18, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v22, v28, AssociatedTypeWitness);
    v29 = v47;
    sub_2217CB390();
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_254064508);
    v31 = v50;
    v32 = v50 + *(int *)(v30 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v50, v29, v49);
    v33 = sub_2217CB42C();
    OUTLINED_FUNCTION_28_0(v32, v34, v35, v33);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v51 + 104))(v31, *MEMORY[0x24BDB5388], v52);
    v54[0] = v53;
    v36 = OUTLINED_FUNCTION_7_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
    v43 = v36;
    sub_2217CB4D4();
    if (qword_254064658 != -1)
      swift_once();
    v54[0] = MEMORY[0x24BEE4AF8];
    sub_2217BCCA8(&qword_254064580, (uint64_t (*)(uint64_t))MEMORY[0x24BDB4CD8], MEMORY[0x24BDB4CE8]);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254064588);
    OUTLINED_FUNCTION_25_0();
    sub_2217CBA08();
    OUTLINED_FUNCTION_9_1();
    sub_2217BCCA8((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    OUTLINED_FUNCTION_2_3((unint64_t *)&unk_254064610, v37, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_2_3(&qword_2540645A0, v38, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_2_3(&qword_254064620, v39, (uint64_t)&protocol conformance descriptor for UIView);
    OUTLINED_FUNCTION_2_3((unint64_t *)&unk_2540645F0, v40, (uint64_t)&protocol conformance descriptor for UIView);
    v41 = v50;
    sub_2217CB198();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v7, v4);
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v41, v52);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, AssociatedTypeWitness);
  }
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_2217BEC98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2217BED68(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2217BF4A0((uint64_t)v12, *a3);
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
      sub_2217BF4A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2217BED68(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2217BEEBC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2217CB9F0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2217BEF80(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2217CBAA4();
    if (!v8)
    {
      result = sub_2217CBAEC();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_2217BEEBC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2217CBB10();
  __break(1u);
  return result;
}

uint64_t sub_2217BEF80(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2217BF014(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2217BF1E8(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2217BF1E8((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2217BF014(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2217CB7F8();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_2217BF184(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2217CBA8C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2217CBB10();
  __break(1u);
LABEL_14:
  result = sub_2217CBAEC();
  __break(1u);
  return result;
}

_QWORD *sub_2217BF184(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708200);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2217BF1E8(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255708200);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2217BF380(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2217BF2BC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2217BF2BC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2217CBB10();
  __break(1u);
  return result;
}

char *sub_2217BF380(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2217CBB10();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_2217BF400(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_0();
}

void sub_2217BF438()
{
  UIView.appEntityIdentifier.getter();
}

unint64_t sub_2217BF45C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254064590;
  if (!qword_254064590)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254064588);
    result = MEMORY[0x227671804](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254064590);
  }
  return result;
}

uint64_t sub_2217BF4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void OUTLINED_FUNCTION_5_1(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return type metadata accessor for AppUIKitBridge();
}

void OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  sub_2217B79C0(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_2217CB39C();
}

void OUTLINED_FUNCTION_16_0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_2217BCCA8(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_release();
}

void OUTLINED_FUNCTION_20_0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_2217BCCA8(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_21_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_2217CB15C();
}

void OUTLINED_FUNCTION_24()
{
  uint64_t v0;
  uint64_t *v1;

  sub_2217BF400(v0, v1);
}

unint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_2217BF45C();
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

void SiriTipUIView.style.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  OUTLINED_FUNCTION_0_0();
  v4 = OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  OUTLINED_FUNCTION_8();
}

uint64_t sub_2217BF5F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  swift_beginAccess();
  v4 = sub_2217CB6B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_2217BF658(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_2217CB6B4();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return SiriTipUIView.style.setter((uint64_t)v4);
}

uint64_t SiriTipUIView.style.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  OUTLINED_FUNCTION_0_0();
  v4 = OUTLINED_FUNCTION_3_3();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v3, a1, v4);
  swift_endAccess();
  sub_2217BF764();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
}

void sub_2217BF764()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_2217CB6B4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2217CB684();
  v24 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255708268);
  MEMORY[0x24BDAC7A8](v9);
  v25 = OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView], sel_removeFromSuperview);
  swift_bridgeObjectRetain();
  sub_2217BFE50();
  sub_2217CB678();
  v10 = &v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v10, v2);
  sub_2217BCCA8(&qword_255708270, (uint64_t (*)(uint64_t))MEMORY[0x24BDFBA98], MEMORY[0x24BDFBA88]);
  sub_2217CB738();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255708278));
  v12 = (void *)sub_2217CB72C();
  objc_msgSend(v1, sel_addSubview_, v12);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, sel_setContentHuggingPriority_forAxis_, 1, v13);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v12, sel_setContentCompressionResistancePriority_forAxis_, 0, v14);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v12, sel_setContentCompressionResistancePriority_forAxis_, 1, v15);
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v16 = objc_msgSend(v12, sel_widthAnchor);
  v17 = objc_msgSend(v1, sel_widthAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

  objc_msgSend(v18, sel_setActive_, 1);
  v19 = objc_msgSend(v12, sel_heightAnchor);
  v20 = objc_msgSend(v1, sel_heightAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

  objc_msgSend(v21, sel_setActive_, 1);
  sub_2217CB720();
  v22 = *(void **)&v1[v25];
  *(_QWORD *)&v1[v25] = v12;

}

void SiriTipUIView.style.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0();
}

void SiriTipUIView.isPresented.getter()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8();
}

void SiriTipUIView.isPresented.setter(char a1)
{
  sub_2217BFC54(a1, &OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_isPresented);
}

void SiriTipUIView.allowsDismissal.getter()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8();
}

uint64_t sub_2217BFBF8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void SiriTipUIView.allowsDismissal.setter(char a1)
{
  sub_2217BFC54(a1, &OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal);
}

void sub_2217BFC54(char a1, _QWORD *a2)
{
  uint64_t v2;
  _BYTE *v4;

  v4 = (_BYTE *)(v2 + *a2);
  OUTLINED_FUNCTION_0_0();
  *v4 = a1;
  sub_2217BF764();
}

void SiriTipUIView.allowsDismissal.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0();
}

void sub_2217BFCE0(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_2217BF764();
  OUTLINED_FUNCTION_0();
}

void SiriTipUIView.loadOnAppear.getter()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8();
}

void SiriTipUIView.loadOnAppear.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear);
  OUTLINED_FUNCTION_0_0();
  *v3 = a1;
  OUTLINED_FUNCTION_8();
}

void SiriTipUIView.loadOnAppear.modify()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0();
}

void sub_2217BFDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  BOOL v5;

  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase + 8);
  if (!v4)
  {
    if (!a2)
      return;
LABEL_10:
    sub_2217BF764();
    return;
  }
  if (!a2)
    goto LABEL_10;
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase) == a1 && v4 == a2;
  if (!v5 && (sub_2217CBB58() & 1) == 0)
    goto LABEL_10;
}

uint64_t sub_2217BFE14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase);
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase + 8);
  *v3 = a1;
  v3[1] = a2;
  sub_2217BFDBC(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2217BFE50()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal);
  swift_beginAccess();
  if (*v1 != 1)
    return 0;
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2217CB894();
  swift_retain();
  v3 = sub_2217CB888();
  v4 = (_QWORD *)swift_allocObject();
  v5 = MEMORY[0x24BEE6930];
  v4[2] = v3;
  v4[3] = v5;
  v4[4] = v2;
  swift_release();
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v7 = sub_2217CB888();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v7;
  v8[3] = v5;
  v8[4] = v6;
  swift_release();
  sub_2217CB750();
  return v10;
}

void sub_2217BFFC4(uint64_t a1@<X2>, unsigned __int8 *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x2276718F4](v3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_isPresented);

  }
  else
  {
    v6 = 1;
  }
  *a2 = v6;
}

void sub_2217C0038(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = *a1;
  v5 = a4 + 16;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x2276718F4](v5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setIsPresented_, v4);

  }
}

void SiriTipUIView.__allocating_init(style:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  SiriTipUIView.init(style:)(a1);
  OUTLINED_FUNCTION_0();
}

char *SiriTipUIView.init(style:)(uint64_t a1)
{
  char *v1;
  objc_class *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v3 = (objc_class *)OUTLINED_FUNCTION_2();
  v4 = v1;
  OUTLINED_FUNCTION_5_2();
  v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_isPresented] = 1;
  v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal] = 0;
  v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView] = 0;
  v5 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;

  v11.receiver = v1;
  v11.super_class = v3;
  v7 = (char *)objc_msgSendSuper2(&v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = &v7[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style];
  OUTLINED_FUNCTION_0_0();
  v9 = OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v8, a1, v9);
  swift_endAccess();
  return v7;
}

uint64_t sub_2217C01D4(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2();
  v3 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style];
  v4 = v1;
  OUTLINED_FUNCTION_5_2();
  v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_isPresented] = 1;
  v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_allowsDismissal] = 0;
  v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear] = 0;
  v5 = OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView] = 0;
  v6 = &v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = (uint64_t *)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
  *v7 = 0;
  v7[1] = 0;

  v8 = OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v3, v8);

  swift_bridgeObjectRelease();
  sub_2217B9BE0(*v7);

  swift_deallocPartialClassInstance();
  return 0;
}

id SiriTipUIView.intrinsicContentSize.getter()
{
  char *v0;
  void *v1;
  objc_super v3;

  v1 = *(void **)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView];
  if (v1)
    return objc_msgSend(v1, sel_intrinsicContentSize);
  v3.receiver = v0;
  v3.super_class = (Class)OUTLINED_FUNCTION_2();
  return objc_msgSendSuper2(&v3, sel_intrinsicContentSize);
}

CGSize __swiftcall SiriTipUIView.sizeThatFits(_:)(CGSize a1)
{
  char *v1;
  double height;
  double width;
  void *v4;
  double v5;
  double v6;
  CGSize result;
  objc_super v8;

  height = a1.height;
  width = a1.width;
  v4 = *(void **)&v1[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView];
  if (v4)
  {
    objc_msgSend(v4, sel_sizeThatFits_, a1.width, a1.height);
  }
  else
  {
    v8.receiver = v1;
    v8.super_class = (Class)OUTLINED_FUNCTION_2();
    objc_msgSendSuper2(&v8, sel_sizeThatFits_, width, height);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

Swift::Void __swiftcall SiriTipUIView.didMoveToWindow()()
{
  char *v0;
  id v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_2();
  objc_msgSendSuper2(&v7, sel_didMoveToWindow);
  v1 = objc_msgSend(v0, sel_window);

  if (v1 && !*(_QWORD *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phrase + 8])
  {
    v2 = (uint64_t *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    if (v3)
    {
      v4 = v2[1];
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v3;
      *(_QWORD *)(v5 + 24) = v4;
      swift_retain_n();
      sub_2217C0568((uint64_t)sub_2217BCEFC, v5);
      sub_2217B9BE0(v3);
      swift_release();
      v6 = *v2;
      *v2 = 0;
      v2[1] = 0;
      sub_2217B9BE0(v6);
    }
  }
}

uint64_t sub_2217C0544()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2217C0568(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v25 = a2;
  v24 = a1;
  v2 = sub_2217CB75C();
  v3 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  v31 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2217CB948();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2217CB93C();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_2217CB780();
  v27 = *(_QWORD *)(v11 - 8);
  v28 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217C109C();
  sub_2217CB774();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2217BCCA8(&qword_255708238, v10, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708240);
  sub_2217C1110(&qword_255708248, &qword_255708240);
  sub_2217CBA08();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5750], v5);
  v14 = (void *)sub_2217CB96C();
  v15 = (_QWORD *)swift_allocObject();
  v16 = v25;
  v15[2] = v24;
  v15[3] = v16;
  v17 = v26;
  v15[4] = v26;
  aBlock[4] = sub_2217C1104;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2217C0DE4;
  aBlock[3] = &block_descriptor_0;
  v18 = _Block_copy(aBlock);
  swift_retain();
  v19 = v17;
  sub_2217CB768();
  v32 = MEMORY[0x24BEE4AF8];
  sub_2217BCCA8(&qword_255708250, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708258);
  sub_2217C1110(&qword_255708260, &qword_255708258);
  v21 = v29;
  v20 = v30;
  sub_2217CBA08();
  MEMORY[0x227671144](0, v13, v21, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
  return swift_release();
}

uint64_t SiriTipUIView.setIntent<A>(intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  uint64_t (**v17)();
  uint64_t v18;
  uint64_t v19;

  v7 = *(_QWORD *)(a2 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9 = &v3[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_loadOnAppear];
  OUTLINED_FUNCTION_0_0();
  if (*v9 == 1 && (v10 = objc_msgSend(v3, sel_window), v10, !v10))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
    v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a2;
    *(_QWORD *)(v16 + 24) = a3;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
    v17 = (uint64_t (**)())&v3[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    v18 = *(_QWORD *)&v3[OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock];
    *v17 = sub_2217C0B24;
    v17[1] = (uint64_t (*)())v16;
    return sub_2217B9BE0(v18);
  }
  else
  {
    sub_2217CB264();
    sub_2217CB24C();
    v11 = sub_2217CB228();
    v13 = v12;
    swift_release();
    return sub_2217BFE14(v11, v13);
  }
}

uint64_t sub_2217C0A5C()
{
  uint64_t v0;

  sub_2217CB264();
  sub_2217CB24C();
  v0 = sub_2217CB228();
  swift_release();
  return v0;
}

uint64_t sub_2217C0ACC()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_2217C0B24()
{
  return sub_2217C0A5C();
}

uint64_t sub_2217C0B40(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v2 = sub_2217CB75C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2217CB780();
  v6 = *(_QWORD *)(v18 - 8);
  v7 = MEMORY[0x24BDAC7A8](v18);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1(v7);
  v12 = v11;
  sub_2217C109C();
  v13 = (void *)sub_2217CB954();
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v14;
  v15[3] = v10;
  v15[4] = v12;
  aBlock[4] = sub_2217C1184;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2217C0DE4;
  aBlock[3] = &block_descriptor_19;
  v16 = _Block_copy(aBlock);
  swift_release();
  sub_2217CB768();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2217BCCA8(&qword_255708250, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708258);
  sub_2217C1110(&qword_255708260, &qword_255708258);
  sub_2217CBA08();
  MEMORY[0x227671144](0, v9, v5, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v18);
}

void sub_2217C0D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x2276718F4](v5);
  if (v6)
  {
    v7 = (void *)v6;
    swift_bridgeObjectRetain();
    sub_2217BFE14(a2, a3);

  }
}

uint64_t sub_2217C0DE8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id SiriTipUIView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void SiriTipUIView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SiriTipUIView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_2();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *keypath_get_selector_isPresented()
{
  return sel_isPresented;
}

void sub_2217C0EE0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = objc_msgSend(*a1, sel_isPresented);
  OUTLINED_FUNCTION_0();
}

id sub_2217C0F0C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPresented_, *a1);
}

void sub_2217C0F24(char *a1)
{
  SiriTipUIView.allowsDismissal.setter(*a1);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217C0FB8()
{
  return type metadata accessor for SiriTipUIView();
}

uint64_t type metadata accessor for SiriTipUIView()
{
  uint64_t result;

  result = qword_255708220;
  if (!qword_255708220)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2217C0FF8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2217CB6B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriTipUIView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriTipUIView.__allocating_init(style:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

unint64_t sub_2217C109C()
{
  unint64_t result;

  result = qword_255708230;
  if (!qword_255708230)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255708230);
  }
  return result;
}

uint64_t sub_2217C10D8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2217C1104()
{
  uint64_t v0;

  return sub_2217C0B40(*(uint64_t (**)(uint64_t))(v0 + 16));
}

void sub_2217C1110(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x227671804](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217C114C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2217C1170()
{
  return objectdestroy_15Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8], (void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

void sub_2217C1184()
{
  uint64_t *v0;

  sub_2217C0D70(v0[2], v0[3], v0[4]);
}

uint64_t sub_2217C1190()
{
  return objectdestroy_15Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

void sub_2217C11A4(unsigned __int8 *a1@<X8>)
{
  uint64_t v1;

  sub_2217BFFC4(*(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_2217C11B0()
{
  return objectdestroy_15Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_15Tm(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 32));
  return swift_deallocObject();
}

void sub_2217C1200(unsigned __int8 *a1)
{
  uint64_t *v1;

  sub_2217C0038(a1, v1[2], v1[3], v1[4]);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_2217CB6A8();
}

uint64_t sub_2217C1220(uint64_t a1)
{
  return sub_2217C1234(a1, qword_2557094E8, MEMORY[0x24BE5F940]);
}

uint64_t sub_2217C1234(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = sub_2217CB6FC();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  result = *a3;
  if (*a3)
  {
    sub_2217CB7EC();
    result = *MEMORY[0x24BE5F950];
    if (*MEMORY[0x24BE5F950])
    {
      sub_2217CB7EC();
      return sub_2217CB6F0();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t UIAppEntityInteraction.entityIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entityIdentifier;
  v4 = OUTLINED_FUNCTION_15_0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void sub_2217C1300(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_2217CB15C();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  sub_2217C13D0((uint64_t)v4);
}

void sub_2217C1380(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state;
  OUTLINED_FUNCTION_0_1();
  v4 = OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  OUTLINED_FUNCTION_8();
}

void sub_2217C13D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state;
  OUTLINED_FUNCTION_0_0();
  v4 = OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_8();
}

uint64_t (*sub_2217C142C())()
{
  OUTLINED_FUNCTION_0_0();
  return j__swift_endAccess;
}

void sub_2217C14B4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_2217B614C(v1);
}

void (*sub_2217C14E0(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_view;
  OUTLINED_FUNCTION_0_1();
  v3[3] = MEMORY[0x2276718F4](v4);
  return sub_2217C1548;
}

void sub_2217C1548(uint64_t a1, char a2)
{
  void *v2;
  id *v3;
  id v4;

  v2 = *(void **)a1;
  v3 = (id *)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    v4 = *(id *)(*(_QWORD *)a1 + 24);
    OUTLINED_FUNCTION_15_1();

  }
  else
  {
    OUTLINED_FUNCTION_15_1();
  }
  free(v2);
}

id UIAppEntityInteraction.__deallocating_deinit()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v2 = OUTLINED_FUNCTION_17();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_4();
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId + 8) & 1) == 0)
  {
    if (qword_254064658 != -1)
      swift_once();
    OUTLINED_FUNCTION_13_1(OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity);
    OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDB5390], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 104));
    type metadata accessor for AppUIKitBridge();
    sub_2217C1CDC((unint64_t *)&unk_2540645E0, (uint64_t (*)(uint64_t))type metadata accessor for AppUIKitBridge, (uint64_t)&unk_2217CD884);
    swift_retain();
    sub_2217CB1A4();
    swift_release();
    OUTLINED_FUNCTION_11_2(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  v5.receiver = v0;
  v5.super_class = (Class)OUTLINED_FUNCTION_18_0();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

void UIAppEntityInteraction.__allocating_init(entity:)(_QWORD *a1)
{
  OUTLINED_FUNCTION_12();
  UIAppEntityInteraction.init(entity:)(a1);
}

void UIAppEntityInteraction.__allocating_init(entity:state:)(_QWORD *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_12();
  UIAppEntityInteraction.init(entity:state:)(a1, a2);
}

void UIAppEntityInteraction.init(entity:state:)(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v23 = OUTLINED_FUNCTION_4();
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_6();
  v21 = (char *)(v7 - v6);
  v8 = OUTLINED_FUNCTION_15_0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_14_1(OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_viewId);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v10 = v2;
  sub_2217CB1EC();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(&v10[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entityIdentifier], v3, v8);
  sub_2217B5E94((uint64_t)a1, (uint64_t)&v10[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2217CB1EC();
  v11 = sub_2217CB378();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v8);
  *(_DWORD *)&v10[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_interactionId] = v11;
  v12 = &v10[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state];
  v22 = v5;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13(&v10[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state], a2, v23);
  if (qword_254064670 != -1)
    swift_once();
  v14 = sub_2217CB6FC();
  __swift_project_value_buffer(v14, (uint64_t)qword_254064730);
  v15 = v10;
  v16 = sub_2217CB6E4();
  v17 = sub_2217CB918();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_35();
    *(_DWORD *)v18 = 136315650;
    sub_2217C1CDC(&qword_255707E38, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5678], MEMORY[0x24BDB5688]);
    v19 = sub_2217CBB4C();
    OUTLINED_FUNCTION_19_1(v19, v20);
    sub_2217CB9E4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 1024;

    sub_2217CB9E4();
    *(_WORD *)(v18 + 18) = 2048;
    OUTLINED_FUNCTION_0_1();
    v13(v21, (uint64_t)v12, v23);
    sub_2217CB150();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v23);

    sub_2217CB9E4();
    _os_log_impl(&dword_2217B3000, v16, v17, "Entity %s with interaction %u and UI state %ld created", (uint8_t *)v18, 0x1Cu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21();
  }

  v25.receiver = v15;
  v25.super_class = (Class)OUTLINED_FUNCTION_18_0();
  objc_msgSendSuper2(&v25, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a2, v23);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  OUTLINED_FUNCTION_2_0();
}

id UIAppEntityInteraction.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_12(), sel_init);
}

void UIAppEntityInteraction.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2217C1B88(uint64_t a1@<X8>)
{
  sub_2217C1380(a1);
}

uint64_t sub_2217C1BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2217B5698();
  *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return type metadata accessor for UIAppEntityInteraction();
}

uint64_t method lookup function for UIAppEntityInteraction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UIAppEntityInteraction.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.state.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.state.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.view.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.view.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.view.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.willMove(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.didMove(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.__allocating_init(entity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of UIAppEntityInteraction.__allocating_init(entity:state:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t sub_2217C1CDC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x227671804](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2217C1D1C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254064538);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_9_2(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  return sub_2217C1CDC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_11_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_12_1@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_13_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2217B5E94(v1 + a1, v2);
}

void OUTLINED_FUNCTION_14_1(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + a1;
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
}

void OUTLINED_FUNCTION_15_1()
{
  void *v0;

  sub_2217B614C(v0);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_2217CB33C();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_unknownObjectWeakInit();
}

uint64_t sub_2217C1DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2217CB7BC();
  v2 = v1;
  if (v0 == sub_2217CB7BC() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2217CBB58();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_45_0();
  return v5 & 1;
}

uint64_t static AppManager.registerUIKitHooks()()
{
  uint64_t result;

  if (qword_254064658 != -1)
    return swift_once();
  return result;
}

unint64_t sub_2217C1E60(char a1)
{
  if (!a1)
    return 0xD000000000000036;
  if (a1 == 1)
    return 0xD00000000000003CLL;
  return 0xD000000000000033;
}

BOOL sub_2217C1EBC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2217C1ECC()
{
  return sub_2217CBBAC();
}

uint64_t sub_2217C1EF0()
{
  sub_2217CBBA0();
  sub_2217CBBAC();
  return sub_2217CBBB8();
}

BOOL sub_2217C1F34(char *a1, char *a2)
{
  return sub_2217C1EBC(*a1, *a2);
}

uint64_t sub_2217C1F40()
{
  return sub_2217C1EF0();
}

uint64_t sub_2217C1F48()
{
  return sub_2217C1ECC();
}

uint64_t sub_2217C1F50()
{
  sub_2217CBBA0();
  sub_2217CBBAC();
  return sub_2217CBBB8();
}

unint64_t sub_2217C1F90()
{
  char *v0;

  return sub_2217C1E60(*v0);
}

uint64_t sub_2217C1FA4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2217C8CF8;
  return sub_2217BCFB0();
}

uint64_t sub_2217C1FEC()
{
  uint64_t v0;

  return sub_2217C2364(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentSceneConfigurator.scene(_:navigateToViewsFor:)()
{
  uint64_t v0;

  return sub_2217C2364(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C200C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_47();
  *(_QWORD *)(v1 + 24) = OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_72();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C2058()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = *(_QWORD **)(v0 + 16);
  swift_release();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v3 = objc_msgSend(v2, sel_connectedScenes);

  v5 = OUTLINED_FUNCTION_3(v4, &qword_255708370);
  sub_2217C7B0C();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_103();
  sub_2217C20F8(v5);
  OUTLINED_FUNCTION_41_0();
  *v1 = v3;
  v6 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_10_1(v6);
}

uint64_t sub_2217C20F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_2217CBA14();
    v4 = v3;
    v5 = 1;
  }
  else
  {
    v2 = sub_2217C82E0(a1);
    v4 = v6;
    v5 = v7 & 1;
  }
  v8 = sub_2217C8028(a1);
  v10 = v9;
  v12 = v11 & 1;
  v13 = sub_2217C8360(v2, v4, v5, v8, v9, v11 & 1);
  sub_2217C8394(v8, v10, v12);
  if (v13)
  {
    sub_2217C8394(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_2217C8078(v2, v4, v5, a1);
    v14 = v15;
    sub_2217C8394(v2, v4, v5);
  }
  return v14;
}

uint64_t sub_2217C21F4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2217C8CF8;
  return sub_2217C200C(a1);
}

uint64_t sub_2217C2244(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_255708360 + dword_255708360);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2217C8CF8;
  return v7(a1, a2);
}

void (*static AppManager.sceneConfigurator.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  static AppManager.sceneConfigurator.getter((uint64_t)v3);
  return sub_2217C22FC;
}

void sub_2217C22FC(uint64_t *a1, char a2)
{
  void *v2;

  v2 = (void *)*a1;
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_91(*a1);
    static AppManager.sceneConfigurator.setter((uint64_t)v2 + 40);
    OUTLINED_FUNCTION_62();
  }
  else
  {
    static AppManager.sceneConfigurator.setter(*a1);
  }
  free(v2);
}

uint64_t AppEntityVisualState.init(with:)()
{
  return sub_2217CB144();
}

uint64_t sub_2217C2364(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2217C2370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = a4;
  v4[6] = a1;
  v4[9] = sub_2217CB450();
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708450);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708458);
  v4[12] = swift_task_alloc();
  sub_2217CB894();
  v4[13] = sub_2217CB888();
  sub_2217CB870();
  return swift_task_switch();
}

uint64_t sub_2217C244C()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;

  swift_release();
  OUTLINED_FUNCTION_0_1();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = *(_QWORD *)(v0 + 88);
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(uint64_t **)(v0 + 48);
    objc_msgSend(*(id *)(Strong + 16), sel_sendAction_to_from_forEvent_, *(_QWORD *)(v0 + 64), 0, 0, 0);
    *(_WORD *)(v0 + 112) = 257;
    v5 = sub_2217CB444();
    v8 = OUTLINED_FUNCTION_96(v3, v6, v7, v5);
    OUTLINED_FUNCTION_28_0(v2, v9, v10, v8);
    *(_QWORD *)(v0 + 40) = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_9_3(&qword_255708460, v11, (void (*)(uint64_t))MEMORY[0x24BDB5ED0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255708468);
    sub_2217C879C(&qword_255708470, &qword_255708468);
    sub_2217CBA08();
    v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255708478);
    sub_2217C879C(&qword_255708480, &qword_255708478);
    v4[4] = v12;
    __swift_allocate_boxed_opaque_existential_1(v4);
    sub_2217C87D0();
    sub_2217C880C();
    OUTLINED_FUNCTION_63();
    swift_release();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_53();
    v13 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  }
  else
  {
    sub_2217CB138();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v14, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_30_0(v15, *MEMORY[0x24BDB4C88]);
    swift_willThrow();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_15_2();
    v13 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v13();
}

uint64_t sub_2217C26AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[19] = sub_2217CB450();
  v3[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708450);
  v3[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708458);
  v3[22] = swift_task_alloc();
  v4 = sub_2217CB2AC();
  v3[23] = v4;
  v3[24] = *(_QWORD *)(v4 - 8);
  v3[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708590);
  v3[26] = swift_task_alloc();
  v5 = sub_2217CB51C();
  v3[27] = v5;
  v3[28] = *(_QWORD *)(v5 - 8);
  v3[29] = swift_task_alloc();
  v6 = sub_2217CB540();
  v3[30] = v6;
  v3[31] = *(_QWORD *)(v6 - 8);
  v3[32] = swift_task_alloc();
  sub_2217CB894();
  v3[33] = sub_2217CB888();
  sub_2217CB870();
  return swift_task_switch();
}

uint64_t sub_2217C2824()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
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
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v39;
  uint64_t v40;

  swift_release();
  OUTLINED_FUNCTION_0_1();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = Strong;
    sub_2217B74E4(*(_QWORD *)(v0 + 136), v0 + 16);
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
    v40 = v2;
    if ((OUTLINED_FUNCTION_36_0() & 1) != 0)
    {
      OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 248));
      v4 = 0;
      v5 = 0x80000002217CCC80;
    }
    else
    {
      OUTLINED_FUNCTION_91(*(_QWORD *)(v0 + 136));
      if ((OUTLINED_FUNCTION_36_0() & 1) != 0)
      {
        v11 = *(_QWORD *)(v0 + 224);
        v3 = *(_QWORD *)(v0 + 232);
        v12 = *(_QWORD *)(v0 + 208);
        v13 = *(_QWORD *)(v0 + 216);
        v15 = *(_QWORD *)(v0 + 192);
        v14 = *(_QWORD *)(v0 + 200);
        v16 = *(_QWORD *)(v0 + 184);
        OUTLINED_FUNCTION_79();
        __swift_storeEnumTagSinglePayload(v17, v18, v19, v13);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v3, v12, v13);
        sub_2217CB504();
        sub_2217CB2A0();
        v5 = v20;
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
        sub_2217CB510();
        v4 = v21;
        v22 = OUTLINED_FUNCTION_107();
        v2 = v40;
        v23(v22);
      }
      else
      {
        v24 = OUTLINED_FUNCTION_28_0(*(_QWORD *)(v0 + 208), v9, v10, *(_QWORD *)(v0 + 216));
        OUTLINED_FUNCTION_89(v24, (uint64_t)&unk_255708590);
        v4 = 0;
        v5 = 0;
      }
    }
    v25 = objc_msgSend(*(id *)(v2 + 16), sel_appintents_responderForKeyEvents);
    if (v5)
    {
      v26 = sub_2217CB798();
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = 0;
    }
    if (v4)
    {
      OUTLINED_FUNCTION_110();
      sub_2217CB798();
      OUTLINED_FUNCTION_41_0();
    }
    else
    {
      v3 = 0;
    }
    v27 = *(_QWORD *)(v0 + 168);
    v28 = *(_QWORD *)(v0 + 176);
    v29 = *(uint64_t **)(v0 + 128);
    v39 = objc_retainAutorelease(v25);
    objc_msgSend(v39, sel_performSelector_withObject_withObject_, sel__startWritingToolsWithTool_sender_, v26, v3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *(_WORD *)(v0 + 272) = 257;
    v30 = sub_2217CB444();
    v33 = OUTLINED_FUNCTION_96(v28, v31, v32, v30);
    OUTLINED_FUNCTION_28_0(v27, v34, v35, v33);
    *(_QWORD *)(v0 + 120) = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_9_3(&qword_255708460, v36, (void (*)(uint64_t))MEMORY[0x24BDB5ED0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255708468);
    sub_2217C879C(&qword_255708470, &qword_255708468);
    sub_2217CBA08();
    v29[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255708478);
    sub_2217C879C(&qword_255708480, &qword_255708478);
    v29[4] = v37;
    __swift_allocate_boxed_opaque_existential_1(v29);
    sub_2217C87D0();
    sub_2217C880C();
    OUTLINED_FUNCTION_63();

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_6_0();
    swift_task_dealloc();
    v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  }
  else
  {
    sub_2217CB138();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v6, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_30_0(v7, *MEMORY[0x24BDB4C88]);
    swift_willThrow();
    OUTLINED_FUNCTION_6_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_7_2();
    v8 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v8();
}

uint64_t sub_2217C2CA8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 96) = a4;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 48) = *v4;
  v6 = sub_2217CB528();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 72) = OUTLINED_FUNCTION_33_0();
  *(_QWORD *)(v5 + 80) = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_47();
  *(_QWORD *)(v5 + 88) = OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_72();
  return OUTLINED_FUNCTION_0_6();
}

void sub_2217C2D28()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  v1 = v0[10];
  v3 = v0[8];
  v2 = v0[9];
  v4 = v0[7];
  swift_release();
  sub_2217CB1F8();
  OUTLINED_FUNCTION_85(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v5 == *MEMORY[0x24BDB6368])
  {
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_40_0();
    v7 = OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v7 + 16) = v1;
    *(_QWORD *)(v7 + 24) = sel_cut_;
    goto LABEL_23;
  }
  if (v5 == *MEMORY[0x24BDB6370])
  {
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_40_0();
    v8 = OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v8 + 16) = v1;
    *(_QWORD *)(v8 + 24) = sel_copy_;
    goto LABEL_23;
  }
  if (v5 == *MEMORY[0x24BDB6388])
  {
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_40_0();
    v9 = OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v9 + 16) = v1;
    *(_QWORD *)(v9 + 24) = sel_paste_;
    goto LABEL_23;
  }
  if (v5 == *MEMORY[0x24BDB6380])
    goto LABEL_8;
  if (v5 == *MEMORY[0x24BDB6338])
    goto LABEL_10;
  if (v5 == *MEMORY[0x24BDB6350] || v5 == *MEMORY[0x24BDB6348])
  {
    OUTLINED_FUNCTION_12_2();
    swift_retain();
  }
  else
  {
    if (v5 == *MEMORY[0x24BDB6340])
    {
LABEL_10:
      OUTLINED_FUNCTION_13_2(v0[8]);
      goto LABEL_23;
    }
    if (v5 == *MEMORY[0x24BDB6360] || v5 == *MEMORY[0x24BDB6358])
    {
LABEL_8:
      OUTLINED_FUNCTION_13_2(v0[8]);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_81();
      goto LABEL_23;
    }
    v11 = v0[10];
    if (v5 != *MEMORY[0x24BDB6378])
    {
      v14 = v0[8];
      v13 = v0[9];
      v15 = v0[7];
      OUTLINED_FUNCTION_32_0();
      OUTLINED_FUNCTION_9_3(&qword_2557083D8, v16, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_30_0(v17, *MEMORY[0x24BDB4C98]);
      swift_willThrow();
      v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v18(v11, v15);
      v18(v13, v15);
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_73();
      __asm { BR              X0 }
    }
    sub_2217C83A0(qword_2540645E0, v6, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
    sub_2217CB1BC();
    OUTLINED_FUNCTION_75();
  }
LABEL_23:
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_73();
  __asm { BR              X2 }
}

uint64_t sub_2217C311C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708498);
  v3[13] = swift_task_alloc();
  v4 = sub_2217CB2D0();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = swift_task_alloc();
  sub_2217CB894();
  v3[17] = sub_2217CB888();
  v3[18] = sub_2217CB870();
  v3[19] = v5;
  return swift_task_switch();
}

uint64_t sub_2217C31D8()
{
  _QWORD *v0;
  uint64_t Strong;
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
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  _QWORD *v16;
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
  uint64_t (*v35)(void);

  OUTLINED_FUNCTION_0_1();
  Strong = swift_weakLoadStrong();
  v0[20] = Strong;
  if (Strong)
  {
    v2 = Strong;
    OUTLINED_FUNCTION_49(v0[11]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
    OUTLINED_FUNCTION_111();
    if ((OUTLINED_FUNCTION_36_0() & 1) != 0)
    {
      v6 = v0[15];
      v5 = v0[16];
      v8 = v0[13];
      v7 = v0[14];
      OUTLINED_FUNCTION_79();
      __swift_storeEnumTagSinglePayload(v9, v10, v11, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v8, v7);
      v12 = objc_msgSend(*(id *)(v2 + 16), sel_appintents_responderForKeyEvents);
      v0[21] = v12;
      v13 = objc_msgSend(v12, sel_undoManager);
      v0[22] = v13;
      if (v13)
      {
        v14 = (uint64_t *)v0[10];
        v15 = v13;
        sub_2217CB2B8();
        v14[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2557084A8);
        v14[4] = swift_getOpaqueTypeConformance2();
        __swift_allocate_boxed_opaque_existential_1(v14);
        v16 = (_QWORD *)swift_task_alloc();
        v0[23] = v16;
        *v16 = v0;
        v16[1] = sub_2217C34C0;
        return sub_2217CB2C4();
      }
      v28 = v0[16];
      v29 = v0[14];
      v30 = v0[15];
      swift_release();
      sub_2217CB5AC();
      OUTLINED_FUNCTION_9_3(&qword_2557084A0, v31, (void (*)(uint64_t))MEMORY[0x24BDB65B8]);
      v32 = OUTLINED_FUNCTION_4_2();
      v34 = OUTLINED_FUNCTION_60(v32, v33);
      OUTLINED_FUNCTION_30_0(v34, *MEMORY[0x24BDB65B0]);
      OUTLINED_FUNCTION_48();

      OUTLINED_FUNCTION_51();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
    }
    else
    {
      v22 = v0[11];
      OUTLINED_FUNCTION_28_0(v0[13], v3, v4, v0[14]);
      v23 = OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_65(v23, (uint64_t)&unk_255708498);
      v24 = OUTLINED_FUNCTION_32_0();
      OUTLINED_FUNCTION_9_3(&qword_2557083D8, v25, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
      OUTLINED_FUNCTION_4_2();
      v27 = v26;
      sub_2217B74E4(v22, v26);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v27, *MEMORY[0x24BDB4C90], v24);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_51();
    }
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v18, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    v19 = OUTLINED_FUNCTION_4_2();
    v21 = OUTLINED_FUNCTION_60(v19, v20);
    OUTLINED_FUNCTION_29_0(v21, *MEMORY[0x24BDB4C88]);
    OUTLINED_FUNCTION_48();
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  v35 = (uint64_t (*)(void))OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8_1(v35);
}

uint64_t sub_2217C34C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_28_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 192) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C3514()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_104();
  swift_release();

  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_43_0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_15_2();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_8_1(v3);
}

uint64_t sub_2217C3574()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_104();
  v4 = *(_QWORD *)(v0 + 80);
  swift_release();

  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_43_0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  __swift_deallocate_boxed_opaque_existential_1(v4);
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_8_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C35E8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[17] = a1;
  v2[18] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557084B0);
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C3644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);

  OUTLINED_FUNCTION_49(*(_QWORD *)(v0 + 144));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557084B8);
  if ((OUTLINED_FUNCTION_24_0() & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 152);
    OUTLINED_FUNCTION_108((__int128 *)(v0 + 96));
    OUTLINED_FUNCTION_70((_QWORD *)(v0 + 16));
    v2 = sub_2217CB654();
    OUTLINED_FUNCTION_28_0(v1, v3, v4, v2);
    v5 = sub_2217C3810();
    sub_2217CA9F4(v5);
    v12 = *(_QWORD *)(v0 + 136);
    OUTLINED_FUNCTION_65(v13, (uint64_t)&unk_2557084B0);

    *(_QWORD *)(v12 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_255708478);
    sub_2217C879C(&qword_255708480, &qword_255708478);
    OUTLINED_FUNCTION_101(v14);
    sub_2217CB2E8();
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    OUTLINED_FUNCTION_11_3();
    v15 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 144);
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_89(v7, (uint64_t)&unk_2557084C0);
    v8 = OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v9, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    OUTLINED_FUNCTION_4_2();
    v11 = v10;
    sub_2217B74E4(v6, v10);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v11, *MEMORY[0x24BDB4C90], v8);
    swift_willThrow();
    swift_task_dealloc();
    v15 = *(uint64_t (**)(void))(v0 + 8);
  }
  return OUTLINED_FUNCTION_8_1(v15);
}

id sub_2217C3810()
{
  return objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
}

uint64_t sub_2217C383C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F18);
  v3[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557084C8);
  v3[21] = swift_task_alloc();
  v4 = sub_2217CB63C();
  v3[22] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[23] = v5;
  v3[24] = *(_QWORD *)(v5 + 64);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C38FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);

  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_49(*(_QWORD *)(v0 + 144));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557084D0);
  if ((OUTLINED_FUNCTION_24_0() & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 152);
    sub_2217B7BEC((__int128 *)(v0 + 96), v0 + 16);
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v0 + 216) = v2;
    OUTLINED_FUNCTION_47();
    v3 = v2;
    *(_QWORD *)(v0 + 224) = sub_2217CB888();
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_72();
    return swift_task_switch();
  }
  else
  {
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_89(v5, (uint64_t)&unk_2557084D8);
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v6, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    v7 = OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_80(v7, v8);
    OUTLINED_FUNCTION_64(v9, *MEMORY[0x24BDB4C90]);
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_11_3();
    v10 = (uint64_t (*)(void))OUTLINED_FUNCTION_78();
    return OUTLINED_FUNCTION_3_4(v10);
  }
}

uint64_t sub_2217C3A24()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 216);
  swift_release();
  *(_QWORD *)(v0 + 232) = sub_2217C3E20();

  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C3A60()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_98();
  if (v0[29])
  {
    v1 = v0[5];
    v2 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
    v3 = (_QWORD *)swift_task_alloc();
    v0[30] = v3;
    *v3 = v0;
    v3[1] = sub_2217C3B50;
    return sub_2217C4040(v0[21], v1, v2);
  }
  else
  {
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v5, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_71(v6, *MEMORY[0x24BDB4C80]);
    OUTLINED_FUNCTION_59();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_11_3();
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_78();
    return OUTLINED_FUNCTION_3_4(v7);
  }
}

uint64_t sub_2217C3B50()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_69();
  *v2 = *v1;
  *(_QWORD *)(v3 + 248) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C3BA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int EnumTagSinglePayload;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;

  v1 = v0[21];
  v2 = v0[22];
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  v4 = (void *)v0[29];
  if (EnumTagSinglePayload == 1)
  {
    sub_2217C8B10(v1, (uint64_t)&qword_2557084C8);
    sub_2217CB3C0();
    OUTLINED_FUNCTION_9_3(&qword_2557084E8, v5, (void (*)(uint64_t))MEMORY[0x24BDB59D8]);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_71(v6, *MEMORY[0x24BDB59D0]);
    OUTLINED_FUNCTION_59();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_11_3();
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_78();
  }
  else
  {
    v8 = v0[25];
    v9 = v0[26];
    v10 = v0[23];
    v11 = v0[20];
    v20 = v0[24];
    v21 = v11;
    v22 = (uint64_t *)v0[17];
    OUTLINED_FUNCTION_68(v9, v1);
    v12 = sub_2217CB8AC();
    OUTLINED_FUNCTION_28_0(v11, v13, v14, v12);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v9, v2);
    v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)(v16 + 24) = 0;
    OUTLINED_FUNCTION_68(v16 + v15, v8);
    *(_QWORD *)(v16 + ((v20 + v15 + 7) & 0xFFFFFFFFFFFFFFF8)) = v4;
    v17 = v4;
    sub_2217C9244(v21, (uint64_t)&unk_2557084F8, v16);
    swift_release();
    v22[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255708478);
    sub_2217C879C(&qword_255708480, &qword_255708478);
    v22[4] = v18;
    __swift_allocate_boxed_opaque_existential_1(v22);
    sub_2217CB2E8();

    OUTLINED_FUNCTION_112(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_15_2();
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  }
  return v7();
}

uint64_t sub_2217C3DC4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_2_5(*(uint64_t (**)(void))(v0 + 8));
}

void *sub_2217C3E20()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;
  void *v14;
  id v15;

  v1 = objc_msgSend(v0, sel_connectedScenes);
  v2 = OUTLINED_FUNCTION_3((uint64_t)v1, &qword_255708370);
  sub_2217C7B0C();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_103();
  sub_2217C71B8(v2);
  OUTLINED_FUNCTION_41_0();
  if (!v1)
    return 0;
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)
  {
LABEL_13:

    return 0;
  }
  v4 = objc_msgSend(v3, sel_windows);
  OUTLINED_FUNCTION_3((uint64_t)v4, &qword_255708518);
  v5 = sub_2217CB828();

  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_24:
  swift_bridgeObjectRetain();
  v6 = sub_2217CBB04();
  if (!v6)
  {
LABEL_12:
    OUTLINED_FUNCTION_99();
    goto LABEL_13;
  }
LABEL_5:
  v7 = 4;
  while (1)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x22767127C](v7 - 4, v5);
    else
      v8 = *(id *)(v5 + 8 * v7);
    v9 = v8;
    v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, sel_isKeyWindow))
      break;

    ++v7;
    if (v10 == v6)
      goto LABEL_12;
  }
  OUTLINED_FUNCTION_99();
  v13 = objc_msgSend(v9, sel_rootViewController);
  if (!v13)
  {

    return 0;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_presentedViewController);
  if (v15)
  {
    do
    {
      v11 = v15;

      v15 = objc_msgSend(v11, sel_presentedViewController);
      v14 = v11;
    }
    while (v15);
  }
  else
  {
    v11 = v14;
  }

  return v11;
}

uint64_t sub_2217C4040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = sub_2217CB288();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[9] = AssociatedTypeWitness;
  v4[10] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C40F4()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_57();
  sub_2217CB348();
  OUTLINED_FUNCTION_84();
  v0 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_55(v0);
  return OUTLINED_FUNCTION_38_0();
}

uint64_t sub_2217C4154()
{
  uint64_t v0;

  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_43_0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C41A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 56);
  sub_2217CB270();
  OUTLINED_FUNCTION_112(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_6_0();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_2_5(v2);
}

uint64_t sub_2217C41F4()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C4228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[16] = a4;
  v5[17] = a5;
  v6 = sub_2217CB63C();
  v5[18] = v6;
  v5[19] = *(_QWORD *)(v6 - 8);
  v5[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C4288()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  OUTLINED_FUNCTION_76();
  v2 = v0[19];
  v1 = v0[20];
  v3 = v0[18];
  v10 = v0[17];
  v4 = v0[16];
  OUTLINED_FUNCTION_3(v5, &qword_255708500);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
  v6 = OUTLINED_FUNCTION_5_0();
  *(_OWORD *)(v6 + 16) = xmmword_2217CD1F0;
  OUTLINED_FUNCTION_3(v6, &qword_255708508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  *(_QWORD *)(v6 + 32) = sub_2217C4480(v1);
  sub_2217CB834();
  v7 = sub_2217C44FC();
  v0[21] = v7;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2217C43D0;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_2217C4580;
  v0[13] = &block_descriptor_56;
  v0[14] = v8;
  objc_msgSend(v7, sel_presentOverViewController_completionHandler_, v10, v0 + 10);
  OUTLINED_FUNCTION_27_1();
  return swift_continuation_await();
}

uint64_t sub_2217C43D0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_54();
  *(_QWORD *)(v0 + 176) = v1;
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C4410()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_13(v1);
}

uint64_t sub_2217C4444()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 168);
  swift_willThrow();

  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_10_1(*(uint64_t (**)(void))(v0 + 8));
}

id sub_2217C4480(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_2217CB624();
  v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  v5 = sub_2217CB63C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

id sub_2217C44FC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_2217B87E8(0, &qword_255708508);
  v1 = (void *)sub_2217CB81C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithItems_, v1);

  return v2;
}

uint64_t sub_2217C4580(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    return sub_2217C45E8(v3, (uint64_t)a3);
  sub_2217B87E8(0, &qword_255708508);
  v5 = sub_2217CB828();
  return sub_2217C4638(v3, v5);
}

uint64_t sub_2217C45E8(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255708510);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_2217C4638(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_2217C4648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[28] = a2;
  v3[29] = a3;
  v3[27] = a1;
  v4 = sub_2217CB294();
  v3[30] = v4;
  v3[31] = *(_QWORD *)(v4 - 8);
  v3[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557084C8);
  v3[33] = swift_task_alloc();
  v5 = sub_2217CB63C();
  v3[34] = v5;
  v3[35] = *(_QWORD *)(v5 - 8);
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C4708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);

  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_49(*(_QWORD *)(v0 + 224));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708520);
  if ((OUTLINED_FUNCTION_24_0() & 1) != 0)
  {
    OUTLINED_FUNCTION_108((__int128 *)(v0 + 96));
    v1 = *(_QWORD *)(v0 + 40);
    v2 = *(_QWORD *)(v0 + 48);
    OUTLINED_FUNCTION_70((_QWORD *)(v0 + 16));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 304) = v3;
    *v3 = v0;
    v3[1] = sub_2217C483C;
    return sub_2217C4CAC(*(_QWORD *)(v0 + 264), v1, v2);
  }
  else
  {
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_89(v5, (uint64_t)&unk_255708528);
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v6, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    v7 = OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_80(v7, v8);
    OUTLINED_FUNCTION_64(v9, *MEMORY[0x24BDB4C90]);
    OUTLINED_FUNCTION_59();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_11_3();
    v10 = (uint64_t (*)(void))OUTLINED_FUNCTION_78();
    return OUTLINED_FUNCTION_3_4(v10);
  }
}

uint64_t sub_2217C483C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_69();
  *v2 = *v1;
  *(_QWORD *)(v3 + 312) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C488C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t EnumTagSinglePayload;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  id v15;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = *(_QWORD *)(v0 + 264);
  v1 = *(_QWORD *)(v0 + 272);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v1);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_65(EnumTagSinglePayload, (uint64_t)&unk_2557084C8);
    sub_2217CB360();
    OUTLINED_FUNCTION_9_3(&qword_255708538, v4, (void (*)(uint64_t))MEMORY[0x24BDB5648]);
    v5 = OUTLINED_FUNCTION_4_2();
    v7 = OUTLINED_FUNCTION_60(v5, v6);
    OUTLINED_FUNCTION_29_0(v7, *MEMORY[0x24BDB5640]);
    OUTLINED_FUNCTION_48();
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_15_2();
    v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_77();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 288);
    v10 = *(_QWORD *)(v0 + 256);
    v34 = *(_QWORD *)(v0 + 248);
    v35 = *(_QWORD *)(v0 + 240);
    v11 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0 + 280) + 32))(*(_QWORD *)(v0 + 296), v2, v1);
    OUTLINED_FUNCTION_3(v11, &qword_255708500);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
    v12 = OUTLINED_FUNCTION_5_0();
    *(_OWORD *)(v12 + 16) = xmmword_2217CD1F0;
    OUTLINED_FUNCTION_3(v12, &qword_255708508);
    v13 = OUTLINED_FUNCTION_107();
    v14(v13);
    *(_QWORD *)(v12 + 32) = sub_2217C4480(v9);
    sub_2217CB834();
    v15 = sub_2217C44FC();
    OUTLINED_FUNCTION_70((_QWORD *)(v0 + 16));
    swift_getDynamicType();
    sub_2217CB3CC();
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 88))(v10, v35);
    if (v16 == *MEMORY[0x24BDB4F78])
    {
      objc_msgSend(v15, sel_setEditingMode_, 2);
    }
    else if (v16 == *MEMORY[0x24BDB4F70])
    {
      objc_msgSend(v15, sel_setEditingMode_, 1);
    }
    else
    {
      OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 248));
    }
    v33 = *(_QWORD *)(v0 + 296);
    v31 = *(_QWORD *)(v0 + 280);
    v32 = *(_QWORD *)(v0 + 272);
    v17 = *(_QWORD **)(v0 + 224);
    v18 = *(_QWORD *)(v0 + 232);
    v19 = *(uint64_t **)(v0 + 216);
    v20 = v17[3];
    v21 = v17[4];
    OUTLINED_FUNCTION_70(v17);
    v22 = OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v22 + 16) = v18;
    *(_QWORD *)(v22 + 24) = v15;
    OUTLINED_FUNCTION_49(v0 + 16);
    v23 = OUTLINED_FUNCTION_5_0();
    sub_2217B7BEC((__int128 *)(v0 + 136), v23 + 16);
    *(_QWORD *)(OUTLINED_FUNCTION_5_0() + 16) = v15;
    v24 = sub_2217CB288();
    OUTLINED_FUNCTION_9_3(&qword_255708570, v25, (void (*)(uint64_t))MEMORY[0x24BDB4F20]);
    *(_QWORD *)(v0 + 176) = v20;
    v26 = MEMORY[0x24BEE4078];
    *(_QWORD *)(v0 + 184) = v24;
    *(_QWORD *)(v0 + 192) = v26;
    *(_QWORD *)(v0 + 200) = v21;
    *(_QWORD *)(v0 + 208) = v27;
    v28 = sub_2217CB558();
    v19[3] = v28;
    v19[4] = MEMORY[0x227671804](MEMORY[0x24BDB63F8], v28);
    v29 = v15;
    swift_retain();
    sub_2217C5488(v19);
    OUTLINED_FUNCTION_82();
    swift_release();
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    OUTLINED_FUNCTION_6_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  }
  return v8();
}

uint64_t sub_2217C4C5C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_2_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C4CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = sub_2217CB288();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[9] = AssociatedTypeWitness;
  v4[10] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C4D60()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_57();
  sub_2217CB3E4();
  OUTLINED_FUNCTION_84();
  v0 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_55(v0);
  return OUTLINED_FUNCTION_38_0();
}

uint64_t sub_2217C4DC0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_43_0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C4E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[17] = a3;
  v4[18] = a4;
  v4[16] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708578);
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557084C8);
  v4[20] = swift_task_alloc();
  v5 = sub_2217CB63C();
  v4[21] = v5;
  v4[22] = *(_QWORD *)(v5 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C4ECC()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0[17] + 16);
  v0[25] = v1;
  OUTLINED_FUNCTION_47();
  v2 = v1;
  v0[26] = sub_2217CB888();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_72();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C4F2C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();
  *(_QWORD *)(v0 + 216) = sub_2217C3E20();

  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C4F68()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);

  OUTLINED_FUNCTION_98();
  v1 = v0[27];
  if (v1)
  {
    v2 = (void *)v0[18];
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_2217C507C;
    v3 = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v4 = v0 + 10;
    v4[1] = 0x40000000;
    v4[2] = sub_2217C4580;
    v4[3] = &block_descriptor_75;
    v4[4] = v3;
    objc_msgSend(v2, sel_presentOverViewController_completionHandler_, v1, v4);
    return swift_continuation_await();
  }
  else
  {
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_9_3(&qword_2557083D8, v6, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
    v7 = OUTLINED_FUNCTION_4_2();
    v9 = OUTLINED_FUNCTION_60(v7, v8);
    OUTLINED_FUNCTION_29_0(v9, *MEMORY[0x24BDB4C80]);
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_15_2();
    v10 = (uint64_t (*)(void))OUTLINED_FUNCTION_77();
    return OUTLINED_FUNCTION_3_4(v10);
  }
}

uint64_t sub_2217C507C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_54();
  *(_QWORD *)(v0 + 224) = v1;
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

void sub_2217C50BC()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0[15];
  if (!((unint64_t)v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_12:
    v21 = v0[20];
    v20 = v0[21];
    OUTLINED_FUNCTION_45_0();
    __swift_storeEnumTagSinglePayload(v21, 1, 1, v20);
    goto LABEL_13;
  }
  if (v1 < 0)
    v19 = v0[15];
  else
    v19 = v1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  sub_2217CBB04();
  OUTLINED_FUNCTION_41_0();
  if (!v19)
    goto LABEL_12;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x22767127C](0, v1);
LABEL_6:
    v3 = v2;
    v5 = v0[22];
    v4 = v0[23];
    v7 = v0[20];
    v6 = v0[21];
    OUTLINED_FUNCTION_45_0();
    v8 = objc_msgSend(v3, sel_url);
    OUTLINED_FUNCTION_103();
    sub_2217CB630();

    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
    v9(v7, v4, v6);
    OUTLINED_FUNCTION_79();
    __swift_storeEnumTagSinglePayload(v10, v11, v12, v6);
    if (OUTLINED_FUNCTION_97(v7) != 1)
    {
      v13 = (void *)v0[27];
      v14 = v0[22];
      v15 = v0[19];
      v9(v0[24], v0[20], v0[21]);
      OUTLINED_FUNCTION_85(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16));
      v16 = sub_2217CB6D8();
      OUTLINED_FUNCTION_28_0(v15, v17, v18, v16);
      OUTLINED_FUNCTION_18_1();
      sub_2217CB27C();

      OUTLINED_FUNCTION_75();
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_20_1();
      goto LABEL_14;
    }
LABEL_13:
    v22 = (void *)v0[27];
    sub_2217C8B10(v0[20], (uint64_t)&qword_2557084C8);
    sub_2217CB360();
    OUTLINED_FUNCTION_9_3(&qword_255708538, v23, (void (*)(uint64_t))MEMORY[0x24BDB5648]);
    v24 = OUTLINED_FUNCTION_4_2();
    v26 = OUTLINED_FUNCTION_60(v24, v25);
    OUTLINED_FUNCTION_29_0(v26, *MEMORY[0x24BDB5640]);
    OUTLINED_FUNCTION_48();

    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_77();
LABEL_14:
    OUTLINED_FUNCTION_73();
    __asm { BR              X0 }
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(v1 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t sub_2217C52DC()
{
  uint64_t v0;
  void *v1;

  OUTLINED_FUNCTION_98();
  v1 = *(void **)(v0 + 216);
  swift_willThrow();

  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_3_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C5324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  return swift_task_switch();
}

uint64_t sub_2217C533C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
  sub_2217CB3D8();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_10_1(v1);
}

uint64_t sub_2217C5388(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = a1;
  return swift_task_switch();
}

uint64_t sub_2217C53A0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[15];
  v0[2] = v0;
  v0[3] = sub_2217C542C;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_2217C547C;
  v3[3] = &block_descriptor_74;
  v3[4] = v2;
  objc_msgSend(v1, sel_cancelPresentationWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_2217C542C()
{
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C546C()
{
  uint64_t (*v0)(void);

  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return v0();
}

uint64_t sub_2217C547C(uint64_t a1)
{
  return j__swift_continuation_resume(*(_QWORD *)(a1 + 32));
}

uint64_t sub_2217C5488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_2217CB288();
  sub_2217C83A0(&qword_255708570, 255, (void (*)(uint64_t))MEMORY[0x24BDB4F20]);
  sub_2217CB558();
  sub_2217C7490();
  swift_retain();
  swift_retain();
  swift_retain();
  result = sub_2217CB54C();
  *a1 = result;
  return result;
}

uint64_t sub_2217C5598(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708580);
  v2[9] = swift_task_alloc();
  v3 = sub_2217CB3B4();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C561C()
{
  _QWORD *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t OpaqueTypeConformance2;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_91(v0[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
  OUTLINED_FUNCTION_110();
  v1 = OUTLINED_FUNCTION_36_0();
  v2 = v0[9];
  v3 = v0[10];
  if (v1)
  {
    OUTLINED_FUNCTION_79();
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v3);
    if (__swift_getEnumTagSinglePayload(v2, 1, v3) != 1)
    {
      v7 = v0[7];
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[11] + 32))(v0[12], v0[9], v0[10]);
      *(_QWORD *)(v7 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_255708588);
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      OUTLINED_FUNCTION_101(OpaqueTypeConformance2);
      v9 = (_QWORD *)swift_task_alloc();
      v0[13] = v9;
      *v9 = v0;
      v9[1] = sub_2217C57B8;
      return sub_2217CB3A8();
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v0[9], 1, 1, v0[10]);
  }
  v11 = v0[8];
  sub_2217C8B10(v0[9], (uint64_t)&unk_255708580);
  v12 = OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_9_3(&qword_2557083D8, v13, (void (*)(uint64_t))MEMORY[0x24BDB4CA0]);
  OUTLINED_FUNCTION_4_2();
  v15 = v14;
  sub_2217B74E4(v11, v14);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v15, *MEMORY[0x24BDB4C90], v12);
  OUTLINED_FUNCTION_59();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  v16 = (uint64_t (*)(void))OUTLINED_FUNCTION_78();
  return OUTLINED_FUNCTION_3_4(v16);
}

uint64_t sub_2217C57B8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_69();
  *v2 = *v1;
  *(_QWORD *)(v3 + 112) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C5808()
{
  _QWORD *v0;
  uint64_t (*v1)(void);

  (*(void (**)(_QWORD, _QWORD))(v0[11] + 8))(v0[12], v0[10]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_2();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_2_5(v1);
}

uint64_t sub_2217C5848()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 88));
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_2_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C5898(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[41] = a1;
  v2[42] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557083A0);
  v2[43] = OUTLINED_FUNCTION_33_0();
  v2[44] = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_47();
  v2[45] = OUTLINED_FUNCTION_39_0();
  v2[46] = OUTLINED_FUNCTION_25_1();
  v2[47] = v3;
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C590C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;

  OUTLINED_FUNCTION_76();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  sub_2217CB264();
  static AppManager.sceneConfigurator.getter((uint64_t)(v22 + 8));
  if (qword_254064670 != -1)
    swift_once();
  v25 = v22[41];
  v26 = sub_2217CB6FC();
  v22[48] = __swift_project_value_buffer(v26, (uint64_t)qword_254064730);
  sub_2217B74E4(v25, (uint64_t)(v22 + 13));
  v27 = sub_2217CB6E4();
  v28 = sub_2217CB930();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)OUTLINED_FUNCTION_35();
    a11 = OUTLINED_FUNCTION_35();
    *(_DWORD *)v29 = 136446210;
    sub_2217B74E4((uint64_t)(v22 + 13), (uint64_t)(v22 + 18));
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
    v30 = sub_2217CB7C8();
    v22[40] = sub_2217BEC98(v30, v31, &a11);
    sub_2217CB9E4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_109();
    _os_log_impl(&dword_2217B3000, v27, v28, "Invoking navigation for %{public}s", v29, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21();
  }
  OUTLINED_FUNCTION_109();

  v32 = v22[42];
  v33 = v22[12];
  __swift_project_boxed_opaque_existential_1(v22 + 8, v22[11]);
  v34 = *(void **)(v32 + 16);
  v22[49] = v34;
  v45 = **(int **)(v33 + 8) + *(_QWORD *)(v33 + 8);
  v34;
  v35 = (_QWORD *)swift_task_alloc();
  v22[50] = v35;
  *v35 = v22;
  v35[1] = sub_2217C5B38;
  OUTLINED_FUNCTION_27_1();
  return v41(v36, v37, v38, v39, v40, v41, v42, v43, a9, v45, a11, a12, a13, a14);
}

uint64_t sub_2217C5B38()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_28_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 408) = v1;
  swift_task_dealloc();
  if (!v1)

  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C5B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _BYTE *v44;
  uint64_t (*v45)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  OUTLINED_FUNCTION_76();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  v25 = (void *)v22[39];
  if (v25)
  {
    v22[54] = v25;
    v22[55] = v25;
    v26 = v22[12];
    __swift_project_boxed_opaque_existential_1(v22 + 8, v22[11]);
    v66 = **(int **)(v26 + 16) + *(_QWORD *)(v26 + 16);
    v25;
    v27 = (_QWORD *)swift_task_alloc();
    v22[56] = v27;
    OUTLINED_FUNCTION_102(v27, (uint64_t)sub_2217C60C4);
    OUTLINED_FUNCTION_27_1();
    return v32(v28, v29, v30, v31, v32, v33, v34, v35, v66, a10, a11, a12, a13, a14);
  }
  else if (objc_msgSend(*(id *)(v22[42] + 16), sel_supportsMultipleScenes))
  {
    OUTLINED_FUNCTION_49(v22[41]);
    v37 = sub_2217CB6E4();
    v38 = sub_2217CB930();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)OUTLINED_FUNCTION_35();
      a10 = OUTLINED_FUNCTION_35();
      *(_DWORD *)v39 = 136446210;
      v40 = OUTLINED_FUNCTION_107();
      sub_2217B74E4(v40, v41);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557083B8);
      v42 = sub_2217CB7C8();
      v22[38] = sub_2217BEC98(v42, v43, &a10);
      sub_2217CB9E4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_62();
      _os_log_impl(&dword_2217B3000, v37, v38, "Requesting new UIscene for %{public}s)", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21();
    }
    OUTLINED_FUNCTION_62();

    v53 = *(void **)(v22[42] + 16);
    v22[6] = sub_2217C6230;
    v22[7] = 0;
    v22[2] = MEMORY[0x24BDAC760];
    v22[3] = 1107296256;
    v22[4] = sub_2217BC50C;
    v22[5] = &block_descriptor_1;
    v54 = _Block_copy(v22 + 2);
    v55 = v53;
    objc_msgSend(v55, sel_requestSceneSessionActivation_userActivity_options_errorHandler_, 0, 0, 0, v54);
    _Block_release(v54);

    v56 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v22[52] = sub_2217CB984();

    v57 = (_QWORD *)OUTLINED_FUNCTION_56();
    v22[53] = v57;
    *v57 = v22;
    v57[1] = sub_2217C5EB8;
    OUTLINED_FUNCTION_27_1();
    return v60(v58, v59, v60, v61, v62, v63, v64, v65, a9, a10, a11, a12, a13, a14);
  }
  else
  {
    swift_release();
    sub_2217C8570();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_94(v44, 2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v22 + 8));
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_27_1();
    return v45(v45, v46, v47, v48, v49, v50, v51, v52, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_2217C5EB8()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_37_0(v0);
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C5EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE *v13;
  uint64_t (*v14)(uint64_t);

  v1 = *(_QWORD *)(v0 + 344);
  sub_2217B79C0(*(_QWORD *)(v0 + 352), v1, &qword_2557083A0);
  v2 = sub_2217CB5D0();
  v3 = OUTLINED_FUNCTION_97(v1);
  v4 = *(_QWORD *)(v0 + 344);
  v5 = *(_QWORD *)(v0 + 352);
  if (v3 == 1)
  {
    sub_2217C8B10(*(_QWORD *)(v0 + 352), (uint64_t)&qword_2557083A0);
    sub_2217C8B10(v4, (uint64_t)&qword_2557083A0);
    *(_OWORD *)(v0 + 264) = 0u;
    *(_OWORD *)(v0 + 280) = 0u;
LABEL_6:
    OUTLINED_FUNCTION_65(v6, (uint64_t)&qword_254064540);
    goto LABEL_7;
  }
  sub_2217CB5C4();
  sub_2217C8B10(v5, (uint64_t)&qword_2557083A0);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
  if (!*(_QWORD *)(v0 + 288))
    goto LABEL_6;
  OUTLINED_FUNCTION_3(v6, &qword_255708370);
  if ((OUTLINED_FUNCTION_36_0() & 1) != 0)
  {
    v7 = *(void **)(v0 + 296);
    *(_QWORD *)(v0 + 432) = 0;
    *(_QWORD *)(v0 + 440) = v7;
    v8 = *(_QWORD *)(v0 + 96);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 88));
    v14 = (uint64_t (*)(uint64_t))(**(int **)(v8 + 16) + *(_QWORD *)(v8 + 16));
    v9 = v7;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 448) = v10;
    v11 = OUTLINED_FUNCTION_102(v10, (uint64_t)sub_2217C60C4);
    return v14(v11);
  }
LABEL_7:
  swift_release();
  sub_2217C8570();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_94(v13, 1);
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_8_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C60C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_28_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 456) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C6118()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);

  v2 = *(void **)(v0 + 432);
  v1 = *(void **)(v0 + 440);

  OUTLINED_FUNCTION_82();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_15_2();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
  return OUTLINED_FUNCTION_2_5(v3);
}

uint64_t sub_2217C617C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 392);
  swift_release();

  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_2_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C61D4()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v2 = *(void **)(v0 + 432);
  v1 = *(void **)(v0 + 440);

  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_2_5(*(uint64_t (**)(void))(v0 + 8));
}

void sub_2217C6230(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (qword_254064670 != -1)
    swift_once();
  v2 = sub_2217CB6FC();
  __swift_project_value_buffer(v2, (uint64_t)qword_254064730);
  v3 = a1;
  v4 = a1;
  oslog = sub_2217CB6E4();
  v5 = sub_2217CB930();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_getErrorValue();
    v8 = sub_2217CBB64();
    sub_2217BEC98(v8, v9, &v11);
    sub_2217CB9E4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2217B3000, oslog, v5, "Unable to request scene activation. %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x227671870](v7, -1, -1);
    MEMORY[0x227671870](v6, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_2217C6408(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = a2;
  v2[5] = *a2;
  v3 = sub_2217CB5D0();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557083A0);
  v2[9] = swift_task_alloc();
  v4 = sub_2217CB978();
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2217C64BC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2[2] = v2[4];
  OUTLINED_FUNCTION_9_3(&qword_2557083C0, a2, MEMORY[0x24BDD0040]);
  swift_retain();
  sub_2217CB8B8();
  OUTLINED_FUNCTION_9_3(&qword_2557083C8, v3, (void (*)(uint64_t))MEMORY[0x24BDD0028]);
  v2[13] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v2[14] = v5;
  *v5 = v2;
  v5[1] = sub_2217C6590;
  return sub_2217CB87C();
}

uint64_t sub_2217C6590()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_37_0(v2);
  if (v1)
  {
    v0[19] = v1;
    OUTLINED_FUNCTION_13_2(v0[11]);
  }
  else
  {
    v0[15] = *MEMORY[0x24BEBE700];
  }
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C65FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v1 = v0[9];
  v2 = v0[6];
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    OUTLINED_FUNCTION_13_2(v0[11]);
    v3 = OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_28_0(v3, v4, v5, v6);
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_11_3();
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
    return OUTLINED_FUNCTION_10_1(v7);
  }
  else
  {
    v9 = v0[8];
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[7] + 32);
    v0[16] = v10;
    v10(v9, v1, v2);
    OUTLINED_FUNCTION_47();
    v0[17] = OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_72();
    return swift_task_switch();
  }
}

uint64_t sub_2217C66B4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  swift_release();
  v1 = (void *)sub_2217CB5B8();
  v2 = sub_2217CB7BC();
  v4 = v3;
  if (v2 == sub_2217CB7BC() && v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_111();
    v7 = sub_2217CBB58();
  }
  *(_BYTE *)(v0 + 160) = v7 & 1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_83();

  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C6750()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  _QWORD *v9;

  if (*(_BYTE *)(v0 + 160) == 1)
  {
    v1 = *(void (**)(uint64_t))(v0 + 128);
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 88));
    v2 = OUTLINED_FUNCTION_110();
    v1(v2);
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_79();
    __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_11_3();
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_20_1();
    return OUTLINED_FUNCTION_2_5(v7);
  }
  else
  {
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 56));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v9;
    *v9 = v0;
    v9[1] = sub_2217C6818;
    return sub_2217CB87C();
  }
}

uint64_t sub_2217C6818()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_37_0(v2);
  if (v1)
  {
    *(_QWORD *)(v0 + 152) = v1;
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 88));
  }
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2217C6874()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_2_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C68B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[3] = a1;
  v2 = sub_2217CB30C();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_26_1();
  v3 = sub_2217CB15C();
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 - 8);
  v1[9] = OUTLINED_FUNCTION_26_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254064560);
  v1[10] = OUTLINED_FUNCTION_26_1();
  v4 = sub_2217CB3FC();
  v1[11] = v4;
  v1[12] = *(_QWORD *)(v4 - 8);
  v1[13] = OUTLINED_FUNCTION_33_0();
  v1[14] = OUTLINED_FUNCTION_50();
  v5 = sub_2217CB33C();
  v1[15] = v5;
  v1[16] = *(_QWORD *)(v5 - 8);
  v1[17] = OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_2217C696C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t, uint64_t);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v21)(_QWORD, unint64_t, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_2217CB4A4();
  sub_2217CB48C();
  v1 = swift_bridgeObjectRetain();
  sub_2217C7F48(v1);
  OUTLINED_FUNCTION_83();
  v2 = sub_2217CB498();
  swift_release();
  OUTLINED_FUNCTION_51();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 128);
    v24 = *(_QWORD *)(v0 + 64);
    v25 = *(_QWORD *)(v0 + 96);
    v23 = *(_QWORD *)(v0 + 40);
    v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v21 = *(void (**)(_QWORD, unint64_t, _QWORD))(v4 + 16);
    v22 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x24BEE4AF8];
    do
    {
      v28 = v3;
      v29 = v6;
      v7 = *(_QWORD *)(v0 + 80);
      v8 = *(_QWORD *)(v0 + 72);
      v9 = *(_QWORD *)(v0 + 48);
      v10 = *(_QWORD *)(v0 + 56);
      v26 = *(_QWORD *)(v0 + 32);
      v27 = *(_QWORD *)(v0 + 88);
      v21(*(_QWORD *)(v0 + 136), v5, *(_QWORD *)(v0 + 120));
      *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
      sub_2217C83A0(&qword_254064580, 255, (void (*)(uint64_t))MEMORY[0x24BDB4CD8]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254064588);
      sub_2217C879C(&qword_254064590, &qword_254064588);
      sub_2217CBA08();
      sub_2217CB300();
      sub_2217CB330();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v9, v26);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v8, v10);
      v11 = OUTLINED_FUNCTION_107();
      v12(v11);
      if (__swift_getEnumTagSinglePayload(v7, 1, v27) == 1)
      {
        sub_2217C8B10(*(_QWORD *)(v0 + 80), (uint64_t)&unk_254064560);
        v6 = v29;
      }
      else
      {
        v13 = *(_QWORD *)(v0 + 104);
        v14 = *(_QWORD *)(v0 + 112);
        v15 = *(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32);
        OUTLINED_FUNCTION_68(v14, *(_QWORD *)(v0 + 80));
        OUTLINED_FUNCTION_68(v13, v14);
        v6 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = OUTLINED_FUNCTION_95(0, *(_QWORD *)(v29 + 16) + 1);
        v17 = *(_QWORD *)(v6 + 16);
        v16 = *(_QWORD *)(v6 + 24);
        if (v17 >= v16 >> 1)
          v6 = OUTLINED_FUNCTION_95(v16 > 1, v17 + 1);
        v18 = *(_QWORD *)(v0 + 104);
        v19 = *(_QWORD *)(v0 + 88);
        *(_QWORD *)(v6 + 16) = v17 + 1;
        v15(v6+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * v17, v18, v19);
      }
      v5 += v22;
      v3 = v28 - 1;
    }
    while (v28 != 1);
    OUTLINED_FUNCTION_99();
  }
  else
  {
    OUTLINED_FUNCTION_83();
    v6 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_53();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_2217C6C98()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2217C6CBC()
{
  sub_2217C6C98();
  OUTLINED_FUNCTION_88();
  return swift_deallocClassInstance();
}

uint64_t sub_2217C6CD4()
{
  _QWORD *v0;
  _QWORD *v1;

  v1[2] = v0;
  v1[3] = *v0;
  sub_2217CB894();
  v1[4] = sub_2217CB888();
  sub_2217CB870();
  return swift_task_switch();
}

uint64_t sub_2217C6D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_106();
  sub_2217C83A0(qword_2540645E0, v1, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  v2 = sub_2217CB1E0();
  return OUTLINED_FUNCTION_23(v2, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C6D98()
{
  _QWORD *v0;
  _QWORD *v1;

  v1[2] = v0;
  v1[3] = *v0;
  sub_2217CB894();
  v1[4] = sub_2217CB888();
  sub_2217CB870();
  return swift_task_switch();
}

uint64_t sub_2217C6E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_106();
  sub_2217C83A0(qword_2540645E0, v1, (void (*)(uint64_t))type metadata accessor for AppUIKitBridge);
  v2 = sub_2217CB1D4();
  return OUTLINED_FUNCTION_23(v2, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C6E5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  char v8;
  _QWORD *v9;

  v8 = a4 & 1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2217C6ED0;
  return sub_2217C2CA8(a1, a2, a3, v8);
}

uint64_t sub_2217C6ED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_66();
  v4 = OUTLINED_FUNCTION_1_2();
  if (!v1)
  {
    v4 = v2;
    v5 = v0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
}

uint64_t sub_2217C6F14(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2217BCFB0;
  return sub_2217C5898(a1);
}

uint64_t sub_2217C6F60(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2217C6FAC;
  return sub_2217C68B0(a1);
}

uint64_t sub_2217C6FAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_1_2();
  if (!v1)
    v4 = a1;
  return OUTLINED_FUNCTION_23(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2217C6FDC()
{
  return sub_2217CB0FC();
}

uint64_t sub_2217C6FE4()
{
  return sub_2217CB0FC();
}

uint64_t sub_2217C6FEC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2217C8CFC;
  return sub_2217CB0F0();
}

uint64_t sub_2217C706C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2217C70D0;
  return sub_2217BC16C(a1, a2, a3);
}

uint64_t sub_2217C70D0(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_2();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_2217C7104()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2217C7138(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2217C717C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_2217C71B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
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
    sub_2217CBA20();
    sub_2217B87E8(0, &qword_255708370);
    sub_2217C7B0C();
    sub_2217CB8D0();
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
  v16 = v2;
  v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_10;
LABEL_8:
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    v11 = v3;
    goto LABEL_29;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v8)
    {
      v14 = *(_QWORD *)(v17 + 8 * v13);
      v11 = v3 + 1;
      if (v14)
        goto LABEL_28;
      v11 = v3 + 2;
      if (v3 + 2 >= v8)
        goto LABEL_34;
      v14 = *(_QWORD *)(v17 + 8 * v11);
      if (v14)
        goto LABEL_28;
      v11 = v3 + 3;
      if (v3 + 3 >= v8)
        goto LABEL_34;
      v14 = *(_QWORD *)(v17 + 8 * v11);
      if (v14)
        goto LABEL_28;
      v11 = v3 + 4;
      if (v3 + 4 >= v8)
        goto LABEL_34;
      v14 = *(_QWORD *)(v17 + 8 * v11);
      if (v14)
      {
LABEL_28:
        v9 = (v14 - 1) & v14;
        v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            if (!objc_msgSend(v12, sel_activationState, v16))
            {
              objc_opt_self();
              if (swift_dynamicCastObjCClass())
                break;
            }

            v3 = v11;
            v4 = v9;
            if ((v1 & 0x8000000000000000) == 0)
              goto LABEL_8;
LABEL_10:
            if (!sub_2217CBA5C())
              break;
            sub_2217B87E8(0, &qword_255708370);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v12 = v23;
            swift_unknownObjectRelease();
            v11 = v3;
            v9 = v4;
          }
          while (v23);
        }
        goto LABEL_34;
      }
      v11 = v3 + 5;
      if (v3 + 5 < v8)
      {
        v14 = *(_QWORD *)(v17 + 8 * v11);
        if (!v14)
        {
          v15 = v3 + 6;
          while (v15 < v8)
          {
            v14 = *(_QWORD *)(v17 + 8 * v15++);
            if (v14)
            {
              v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_34;
        }
        goto LABEL_28;
      }
    }
LABEL_34:
    sub_2217C8568();
    return;
  }
  __break(1u);
}

id sub_2217C7490()
{
  return objc_msgSend((id)objc_opt_self(), sel_progressWithTotalUnitCount_, 0);
}

uint64_t UIView.isVisible.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_isHiddenOrHasHiddenAncestor) ^ 1;
}

void UIView.visualState.getter()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_opt_self();
  if (OUTLINED_FUNCTION_67())
  {
    v7 = OUTLINED_FUNCTION_114();
    objc_msgSend(v1, sel_state);
    goto LABEL_6;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_67())
  {
    v7 = OUTLINED_FUNCTION_114();
    v2 = OUTLINED_FUNCTION_44_0((uint64_t)v7, sel_isSelected);
    v3 = OUTLINED_FUNCTION_44_0((uint64_t)v2, sel_isHighlighted);
    v4 = OUTLINED_FUNCTION_44_0((uint64_t)v3, sel_isFocused);
    OUTLINED_FUNCTION_44_0((uint64_t)v4, sel_isEditing);
LABEL_6:
    sub_2217CB144();

    return;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_67())
  {
    v7 = OUTLINED_FUNCTION_114();
    v5 = OUTLINED_FUNCTION_44_0((uint64_t)v7, sel_isSelected);
    v6 = OUTLINED_FUNCTION_44_0((uint64_t)v5, sel_isHighlighted);
    OUTLINED_FUNCTION_44_0((uint64_t)v6, sel_isFocused);
    goto LABEL_6;
  }
  objc_msgSend(v0, sel_isFocused);
  sub_2217CB144();
}

uint64_t UIView.geometry.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  CGRect v6;
  CGRect v7;

  v1 = objc_msgSend(v0, sel_window);
  if (!v1)
    return sub_2217CB300();
  v2 = v1;
  v3 = objc_msgSend(v1, sel_screen);

  v4 = objc_msgSend(v3, sel_fixedCoordinateSpace);
  if (!v4)
    return sub_2217CB300();
  objc_msgSend(v0, sel_frame);
  objc_msgSend(v0, sel_convertPoint_toCoordinateSpace_, v4);
  v6.origin.x = OUTLINED_FUNCTION_100();
  CGRectGetWidth(v6);
  v7.origin.x = OUTLINED_FUNCTION_100();
  CGRectGetHeight(v7);
  sub_2217CB2F4();
  return swift_unknownObjectRelease();
}

uint64_t sub_2217C77C0()
{
  return UIView.isVisible.getter() & 1;
}

void sub_2217C77E4()
{
  UIView.visualState.getter();
}

uint64_t sub_2217C7804()
{
  return UIView.geometry.getter();
}

id sub_2217C7824(uint64_t a1, uint64_t a2)
{
  return sub_2217C783C(a1, a2, (SEL *)&selRef_frame);
}

id sub_2217C7830(uint64_t a1, uint64_t a2)
{
  return sub_2217C783C(a1, a2, (SEL *)&selRef_bounds);
}

id sub_2217C783C(uint64_t a1, uint64_t a2, SEL *a3)
{
  return sub_2217C7860(a3);
}

id sub_2217C7860(SEL *a1)
{
  void *v1;

  return objc_msgSend(v1, *a1);
}

void **initializeBufferWithCopyOfBuffer for IntentSceneConfiguration(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for IntentSceneConfiguration(id *a1)
{

}

void **assignWithCopy for IntentSceneConfiguration(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  v5 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for IntentSceneConfiguration(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for IntentSceneConfiguration(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IntentSceneConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_2217C79B8(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2217C79D0(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

void type metadata accessor for IntentSceneConfiguration()
{
  OUTLINED_FUNCTION_39();
}

uint64_t dispatch thunk of IntentSceneConfigurator.application(_:sceneFor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 8) + *(_QWORD *)(a5 + 8));
  v11 = swift_task_alloc();
  v12 = (_QWORD *)OUTLINED_FUNCTION_34(v11);
  *v12 = v5;
  v12[1] = sub_2217C8CF8;
  return v14(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of IntentSceneConfigurator.scene(_:navigateToViewsFor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = (_QWORD *)OUTLINED_FUNCTION_56();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2217C8CF8;
  return v11(a1, a2, a3, a4);
}

void type metadata accessor for DefaultIntentSceneConfigurator()
{
  OUTLINED_FUNCTION_39();
}

unint64_t sub_2217C7B0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255708378;
  if (!qword_255708378)
  {
    v1 = sub_2217B87E8(255, &qword_255708370);
    result = MEMORY[0x227671804](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, &qword_255708378);
  }
  return result;
}

uint64_t sub_2217C7B5C(char a1, int64_t a2, char a3, uint64_t a4)
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
  uint64_t v17;
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
        goto LABEL_24;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708388);
  v10 = *(_QWORD *)(sub_2217CB3FC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_2217CBAEC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_2217CB3FC() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_2217C7E4C(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2217C7D2C(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_2217C7D2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_2217CB3FC() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_2217CBB10();
  __break(1u);
  return result;
}

uint64_t sub_2217C7E4C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_2217CBB10();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_2217CB3FC(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_2217CB3FC();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_2217C7F48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708390);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 4);
  v5 = sub_2217C83D4(&v7, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_2217C8568();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_2217C8028(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_2217CBA68();
  else
    return 1 << *(_BYTE *)(a1 + 32);
}

void sub_2217C8078(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
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
      if (sub_2217CBA38() == *(_DWORD *)(a4 + 36))
      {
        sub_2217CBA44();
        sub_2217B87E8(0, &qword_255708370);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_2217CB9B4();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_2217CB9C0();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_2217CB9C0();

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
  MEMORY[0x227671234](a1, a2, v7);
  sub_2217B87E8(0, &qword_255708370);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_2217C82E0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

BOOL sub_2217C8360(uint64_t a1, int a2, char a3, uint64_t a4, int a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) != 0)
LABEL_9:
      JUMPOUT(0x227671210);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((a6 & 1) != 0)
    goto LABEL_8;
  if (a2 != a5)
  {
    __break(1u);
    goto LABEL_8;
  }
  return a1 == a4;
}

uint64_t sub_2217C8394(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_2217C83A0(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (!*a1)
  {
    a3(a2);
    OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_0();
}

_QWORD *sub_2217C83D4(_QWORD *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_36:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_DWORD *)(*(_QWORD *)(a4 + 48) + 4 * v12);
    if (v9 == a3)
      goto LABEL_36;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_18;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    v13 = v8;
LABEL_18:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_19;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    v13 = v15;
    goto LABEL_18;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_14;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_17;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_35;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2217C8568()
{
  return swift_release();
}

unint64_t sub_2217C8570()
{
  unint64_t result;

  result = qword_2557083A8;
  if (!qword_2557083A8)
  {
    result = MEMORY[0x227671804](&unk_2217CDB08, &unk_24E7404A0);
    atomic_store(result, (unint64_t *)&qword_2557083A8);
  }
  return result;
}

uint64_t sub_2217C85AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2217C85D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_66();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_22_1(v1);
  return sub_2217C26AC(v2, v3, v4);
}

uint64_t sub_2217C861C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_66();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_22_1(v1);
  return sub_2217C4648(v2, v3, v4);
}

uint64_t sub_2217C8668()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_66();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_22_1(v1);
  return sub_2217C383C(v2, v3, v4);
}

uint64_t sub_2217C86B4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_66();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_22_1(v1);
  return sub_2217C311C(v2, v3, v4);
}

uint64_t sub_2217C8700()
{
  swift_release();
  OUTLINED_FUNCTION_88();
  return swift_deallocObject();
}

uint64_t sub_2217C871C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_52();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_17_0(v1);
  return OUTLINED_FUNCTION_19_2(v2, v3, v4, v5);
}

uint64_t sub_2217C875C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_52();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_17_0(v1);
  return OUTLINED_FUNCTION_19_2(v2, v3, v4, v5);
}

void sub_2217C879C(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_0();
}

unint64_t sub_2217C87D0()
{
  unint64_t result;

  result = qword_255708488;
  if (!qword_255708488)
  {
    result = MEMORY[0x227671804](MEMORY[0x24BDB6688], MEMORY[0x24BEE4078]);
    atomic_store(result, (unint64_t *)&qword_255708488);
  }
  return result;
}

unint64_t sub_2217C880C()
{
  unint64_t result;

  result = qword_255708490;
  if (!qword_255708490)
  {
    result = MEMORY[0x227671804](MEMORY[0x24BDB6678], MEMORY[0x24BEE4078]);
    atomic_store(result, (unint64_t *)&qword_255708490);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x227671870);
  return result;
}

uint64_t sub_2217C887C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2217CB63C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_2217C890C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(sub_2217CB63C() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = swift_task_alloc();
  v11 = (_QWORD *)OUTLINED_FUNCTION_34(v10);
  *v11 = v2;
  v11[1] = sub_2217C8CF8;
  return sub_2217C4228(a1, v6, v7, v8, v9);
}

uint64_t sub_2217C89AC()
{
  uint64_t v0;

  swift_release();

  OUTLINED_FUNCTION_88();
  return swift_deallocObject();
}

uint64_t sub_2217C89D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_52();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_34(v0);
  v2 = OUTLINED_FUNCTION_17_0(v1);
  return sub_2217C4E10(v2, v3, v4, v5);
}

uint64_t sub_2217C8A1C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2217C8A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_66();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2217C8CF8;
  return sub_2217C5324(v2, v0, v1 + 16);
}

uint64_t sub_2217C8AA0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2217C8AC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2217C8CF8;
  return sub_2217C5388(v2);
}

void sub_2217C8B10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)OUTLINED_FUNCTION_60(a1, a2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v2, v4);
  OUTLINED_FUNCTION_0();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2217C8B50(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_2217C8BD8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2217C8C24 + 4 * byte_2217CD815[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2217C8C58 + 4 * byte_2217CD810[v4]))();
}

uint64_t sub_2217C8C58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217C8C60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2217C8C68);
  return result;
}

uint64_t sub_2217C8C74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2217C8C7CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2217C8C80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217C8C88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217C8C94(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2217C8C9C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for IntentNavigationError()
{
  OUTLINED_FUNCTION_39();
}

unint64_t sub_2217C8CB8()
{
  unint64_t result;

  result = qword_255708598;
  if (!qword_255708598)
  {
    result = MEMORY[0x227671804](&unk_2217CDAE0, &unk_24E7404A0);
    atomic_store(result, (unint64_t *)&qword_255708598);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_8_1(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_9_3(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  sub_2217C83A0(a1, 255, a3);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[8] + 8))(v0[10], v0[7]);
}

uint64_t OUTLINED_FUNCTION_13_2@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_17_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_22_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return sub_2217CB870();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_28_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_29_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 104) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_2217CB138();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_37_0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return sub_2217CB4B0();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_2217CB888();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_44_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_2217CB894();
}

void OUTLINED_FUNCTION_49(uint64_t a1)
{
  uint64_t v1;

  sub_2217B74E4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_54()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 - 8);
  *v2 = *v0;
  *v2 = *v0;
}

uint64_t OUTLINED_FUNCTION_55(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 96) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 64);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_60(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_62()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_2217CB438();
}

void OUTLINED_FUNCTION_65(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2217C8B10(v2, a2);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

void OUTLINED_FUNCTION_69()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

_QWORD *OUTLINED_FUNCTION_70(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(a1, a2, v2);
}

double OUTLINED_FUNCTION_74()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_QWORD *)(v0 + 32) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_75()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_77()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void OUTLINED_FUNCTION_80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2217B74E4(v2, a2);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_85@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_2217CB8C4();
}

uint64_t OUTLINED_FUNCTION_88()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_89(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2217C8B10(v2, a2);
}

void OUTLINED_FUNCTION_91(uint64_t a1)
{
  uint64_t v1;

  sub_2217B74E4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_93()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_94@<X0>(_BYTE *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_95(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_2217C7B5C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_96(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return sub_2217CB2DC();
}

uint64_t OUTLINED_FUNCTION_97(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_99()
{
  return swift_bridgeObjectRelease_n();
}

double OUTLINED_FUNCTION_100()
{
  double v0;

  return v0;
}

uint64_t *OUTLINED_FUNCTION_101(uint64_t a1)
{
  uint64_t *v1;

  v1[4] = a1;
  return __swift_allocate_boxed_opaque_existential_1(v1);
}

uint64_t OUTLINED_FUNCTION_102@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

void OUTLINED_FUNCTION_103()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_104()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_105()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_107()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_108(__int128 *a1)
{
  uint64_t v1;

  return sub_2217B7BEC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_109()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_110()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_111()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_112@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_114()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_115()
{
  JUMPOUT(0x227671804);
}

uint64_t sub_2217C9244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_22_2();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_2217BF400(a1, &qword_255707F18);
  }
  else
  {
    sub_2217CB8A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2217CB870();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

BOOL sub_2217C9368(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2217C9378()
{
  return sub_2217CBBAC();
}

uint64_t sub_2217C939C()
{
  sub_2217CBBA0();
  sub_2217CBBAC();
  return sub_2217CBBB8();
}

BOOL sub_2217C93E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2217C9368(*a1, *a2);
}

uint64_t sub_2217C93EC()
{
  return sub_2217C939C();
}

uint64_t sub_2217C93F4()
{
  return sub_2217C9378();
}

void sub_2217C9444(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_2217B62D8(v1);
}

void (*sub_2217C9470(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_0_0();
  v3[3] = MEMORY[0x2276718F4](v5);
  return sub_2217C94DC;
}

void sub_2217C94DC(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

    sub_2217B6334();
  }
  free(v3);
}

uint64_t sub_2217C954C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F10);
  v5[7] = swift_task_alloc();
  sub_2217CB894();
  v5[8] = sub_2217CB888();
  v5[9] = sub_2217CB870();
  v5[10] = v6;
  return swift_task_switch();
}

uint64_t sub_2217C95DC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD, _QWORD *, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[6];
  v2 = v1[3];
  v3 = v1[4];
  v4 = __swift_project_boxed_opaque_existential_1(v1, v2);
  OUTLINED_FUNCTION_39_1();
  v0[11] = OUTLINED_FUNCTION_41_1();
  v7 = (uint64_t (*)(_QWORD, _QWORD *, uint64_t, uint64_t))((int)*MEMORY[0x24BDB64C0] + MEMORY[0x24BDB64C0]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = sub_2217C9678;
  return v7(v0[7], v4, v2, v3);
}

uint64_t sub_2217C9678()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_28_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2217C96D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  swift_release();
  v3 = OUTLINED_FUNCTION_6_1();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v3);
  v4 = v2 + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier;
  OUTLINED_FUNCTION_0_0();
  sub_2217CA8D4(v1, v4, &qword_255707F10);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217C9770()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_51();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_10_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C97AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  sub_2217CB894();
  v4[3] = sub_2217CB888();
  v4[4] = sub_2217CB870();
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_2217C9818()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_39_1();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)OUTLINED_FUNCTION_56();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = OUTLINED_FUNCTION_17_1(v1, (uint64_t)sub_2217C9860);
  return OUTLINED_FUNCTION_13_3(v2, v3);
}

uint64_t sub_2217C9860()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_28_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2217C98BC()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C98E8()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2217C9920()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_15_3();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_1(v1);
  return sub_2217C97AC(v2, v3, v4, v5);
}

uint64_t sub_2217C9978()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v2 + 8));
}

void sub_2217C99B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_26_2(a1, a2, a3);
  OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2217C99E4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 40);
  return swift_deallocObject();
}

uint64_t sub_2217C9A18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2217CA900;
  return sub_2217C954C(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

void UIAppIntentInteraction.__allocating_init<A>(intent:perform:)()
{
  OUTLINED_FUNCTION_12();
  UIAppIntentInteraction.init<A>(intent:perform:)();
}

void UIAppIntentInteraction.init<A>(intent:perform:)()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  objc_super v12;

  OUTLINED_FUNCTION_20();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_12_3();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_19_3();
  v6 = &v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v7 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
  v8 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_28_0(v7, v9, v10, v8);
  OUTLINED_FUNCTION_21_1();
  v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] = 0;
  v11 = v0;
  sub_2217C9C40(v3);
  sub_2217CB114();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 32))(&v11[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode], v1, v4);
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_42_0();
  sub_2217CB120();
  sub_2217CB240();
  swift_release();

  v12.receiver = v11;
  v12.super_class = (Class)OUTLINED_FUNCTION_37_1();
  objc_msgSendSuper2(&v12, sel_init);
  sub_2217B9BE0(v3);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_2217C9C40(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void UIAppIntentInteraction.__allocating_init<A>(intent:perform:suggestedIntent:)()
{
  OUTLINED_FUNCTION_12();
  UIAppIntentInteraction.init<A>(intent:perform:suggestedIntent:)();
}

void UIAppIntentInteraction.init<A>(intent:perform:suggestedIntent:)()
{
  _BYTE *v0;
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
  _BYTE *v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23[5];

  OUTLINED_FUNCTION_20();
  v2 = v1;
  v4 = v3;
  v21 = v5;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_12_3();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6();
  v12 = v11 - v10;
  v13 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent];
  *(_OWORD *)v13 = 0u;
  *(_OWORD *)(v13 + 16) = 0u;
  *(_QWORD *)(v13 + 32) = 0;
  v14 = (uint64_t)&v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier];
  v15 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_28_0(v14, v16, v17, v15);
  OUTLINED_FUNCTION_21_1();
  v0[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] = 1;
  v18 = v0;
  sub_2217C9C40(v7);
  sub_2217CB114();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 32))(&v18[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode], v12, v8);
  v23[3] = v4;
  v23[4] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
  v20 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 16))(boxed_opaque_existential_1, v21, v4);
  OUTLINED_FUNCTION_0_0();
  sub_2217CA8D4((uint64_t)v23, v13, (uint64_t *)&unk_255707E40);
  swift_endAccess();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_42_0();
  sub_2217CB120();
  sub_2217CB240();
  OUTLINED_FUNCTION_29_1();

  v22.receiver = v18;
  v22.super_class = (Class)OUTLINED_FUNCTION_37_1();
  objc_msgSendSuper2(&v22, sel_init);
  sub_2217B9BE0(v7);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v4);
  OUTLINED_FUNCTION_2_0();
}

void UIAppIntentInteraction.__deallocating_deinit()
{
  void *v0;
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
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  objc_class *v45;
  _QWORD v46[4];
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  objc_super v51;
  uint64_t v52;
  uint64_t v53;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_4();
  v47 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F18);
  OUTLINED_FUNCTION_7_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255707F10);
  OUTLINED_FUNCTION_7_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_4();
  v11 = OUTLINED_FUNCTION_6_1();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v48 = v14;
  v49 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v50 = (char *)v46 - v15;
  if (qword_254064670 != -1)
    swift_once();
  v16 = sub_2217CB6FC();
  __swift_project_value_buffer(v16, (uint64_t)qword_254064730);
  v17 = v0;
  v18 = sub_2217CB6E4();
  v19 = sub_2217CB918();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v46[3] = v2;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v46[2] = v3;
    v53 = v22;
    v46[0] = v1;
    v46[1] = v12;
    *(_DWORD *)v21 = 136315138;
    sub_2217CB120();
    v23 = sub_2217CBC00();
    v52 = sub_2217BEC98(v23, v24, &v53);
    sub_2217CB9E4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2217B3000, v18, v19, "AppIntent %s unassociated from view", v21, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21();
  }

  if (v17[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_forSuggestion] == 1)
  {
    v25 = OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_35_0(v25, v26, &qword_255707F10);
    if (__swift_getEnumTagSinglePayload(v1, 1, v11) == 1)
    {
      sub_2217BF400(v1, &qword_255707F10);
    }
    else
    {
      v37 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 32);
      v38 = v50;
      v37(v50, v1, v11);
      v39 = OUTLINED_FUNCTION_22_2();
      OUTLINED_FUNCTION_28_0(v9, v40, v41, v39);
      v42 = v49;
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v49, v38, v11);
      v43 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      v44 = swift_allocObject();
      *(_QWORD *)(v44 + 16) = 0;
      *(_QWORD *)(v44 + 24) = 0;
      v37((char *)(v44 + v43), (uint64_t)v42, v11);
      sub_2217C9244(v9, (uint64_t)&unk_2557085D8, v44);
      swift_release();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v38, v11);
    }
  }
  else
  {
    v27 = &v17[OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_view];
    OUTLINED_FUNCTION_0_1();
    v28 = MEMORY[0x2276718F4](v27);
    if (v28)
    {
      v29 = (void *)v28;
      v52 = v28;
      OUTLINED_FUNCTION_7_1();
      sub_2217BCCA8((unint64_t *)&unk_2540645D0, (uint64_t (*)(uint64_t))sub_2217BD5F8, (uint64_t)&protocol conformance descriptor for UIView);
      v30 = sub_2217CB4F8();

      if (v30)
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255707F40);
        v32 = v47;
        v33 = v47 + *(int *)(v31 + 48);
        v34 = OUTLINED_FUNCTION_12_3();
        OUTLINED_FUNCTION_8_2(v34);
        v35 = (void *)MEMORY[0x2276718F4](v27);
        v52 = (uint64_t)v35;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255707F30);
        sub_2217BCCA8((unint64_t *)&unk_255707F48, (uint64_t (*)(uint64_t))sub_2217BD5F8, MEMORY[0x24BEE5BD8]);
        v36 = sub_2217CB9D8();

        *(_QWORD *)v33 = v36;
        *(_BYTE *)(v33 + 8) = 0;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v32, *MEMORY[0x24BDB5398], v2);
        sub_2217CB468();
        OUTLINED_FUNCTION_29_1();
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v32, v2);
      }
    }
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_42_0();
    sub_2217CB120();
    sub_2217CB234();
    OUTLINED_FUNCTION_29_1();
  }
  v45 = (objc_class *)OUTLINED_FUNCTION_37_1();
  v51.receiver = v17;
  v51.super_class = v45;
  objc_msgSendSuper2(&v51, sel_dealloc);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_2217CA35C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_2217CA374()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_39_1();
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)OUTLINED_FUNCTION_56();
  *(_QWORD *)(v0 + 32) = v1;
  v2 = OUTLINED_FUNCTION_17_1(v1, (uint64_t)sub_2217CA3BC);
  return OUTLINED_FUNCTION_13_3(v2, v3);
}

uint64_t sub_2217CA3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_28_1();
  v3 = *v2;
  *v4 = v3;
  *(_QWORD *)(v0 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    return OUTLINED_FUNCTION_4_3();
  swift_release();
  return OUTLINED_FUNCTION_10_2(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_2217CA418()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_6_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2217CA4B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_15_3();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_1(v1);
  return sub_2217CA35C(v2, v3, v4, v5);
}

id UIAppIntentInteraction.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_12(), sel_init);
}

void UIAppIntentInteraction.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2217CA604@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2217B587C();
  *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return type metadata accessor for UIAppIntentInteraction();
}

uint64_t method lookup function for UIAppIntentInteraction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UIAppIntentInteraction.view.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.view.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.view.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.willMove(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.didMove(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.__allocating_init<A>(intent:perform:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of UIAppIntentInteraction.__allocating_init<A>(intent:perform:suggestedIntent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

void sub_2217CA6E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255707F08)
  {
    sub_2217CB4BC();
    v0 = sub_2217CB9CC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255707F08);
  }
}

uint64_t getEnumTagSinglePayload for ViewIntentError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewIntentError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2217CA808 + 4 * byte_2217CDB65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2217CA83C + 4 * asc_2217CDB60[v4]))();
}

uint64_t sub_2217CA83C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217CA844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2217CA84CLL);
  return result;
}

uint64_t sub_2217CA858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2217CA860);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2217CA864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217CA86C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2217CA878(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ViewIntentError()
{
  return &type metadata for ViewIntentError;
}

unint64_t sub_2217CA898()
{
  unint64_t result;

  result = qword_2557085E0;
  if (!qword_2557085E0)
  {
    result = MEMORY[0x227671804](&unk_2217CDC30, &type metadata for ViewIntentError);
    atomic_store(result, (unint64_t *)&qword_2557085E0);
  }
  return result;
}

void sub_2217CA8D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_26_2(a1, a2, a3);
  OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  OUTLINED_FUNCTION_0();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_2217CB4BC();
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return sub_2217CB12C();
}

uint64_t OUTLINED_FUNCTION_13_3(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_16_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_17_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_2217CB8AC();
}

uint64_t OUTLINED_FUNCTION_26_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_27_2(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_2217BCCA8(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  return swift_release();
}

void OUTLINED_FUNCTION_35_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_2217C99B8(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_2217CB570();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return sub_2217CB564();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_2217CB24C();
}

void sub_2217CA9F4(void *a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v5 = (char *)&v7 - v4;
  sub_2217CB318();
  swift_getAssociatedConformanceWitness();
  AppEntity.copyToPasteboard(_:localOnly:expirationDate:)(a1, 0, v6, AssociatedTypeWitness);
  OUTLINED_FUNCTION_3_5((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_2_6();
}

void AppEntity.copyToPasteboard(_:localOnly:expirationDate:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _DWORD *v5;
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
  NSObject *v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  _BYTE *v32;
  _QWORD v33[2];
  uint64_t v34;
  _DWORD *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;

  v7 = *(_QWORD *)(a4 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v38 = (uint64_t)v33 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v33 - v13;
  if (sub_2217CAEA0(v4, v15, v16))
  {
    v37 = a1;
    if (qword_254064670 != -1)
      swift_once();
    v17 = sub_2217CB6FC();
    __swift_project_value_buffer(v17, (uint64_t)qword_254064730);
    OUTLINED_FUNCTION_4_4((uint64_t)v14, v4);
    v18 = sub_2217CB6E4();
    v19 = v7;
    v20 = sub_2217CB930();
    if (os_log_type_enabled(v18, v20))
    {
      OUTLINED_FUNCTION_9_4();
      v35 = v5;
      v34 = OUTLINED_FUNCTION_5_3();
      v39 = v34;
      *v5 = 136315138;
      v33[1] = v5 + 1;
      v36 = v19;
      OUTLINED_FUNCTION_4_4(v38, (uint64_t)v14);
      v21 = sub_2217CB7C8();
      v23 = OUTLINED_FUNCTION_8_3(v21, v22);
      OUTLINED_FUNCTION_6_2(v23);
      sub_2217CB9E4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_5((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
      OUTLINED_FUNCTION_7_4(&dword_2217B3000, v18, v20, "Putting content for %s on pasteboard");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21();
    }
    OUTLINED_FUNCTION_3_5((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));

    sub_2217CB050();
    v31 = (void *)sub_2217CB81C();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_setItemProviders_localOnly_expirationDate_, v31, 0, 0);

  }
  else
  {
    if (qword_254064670 != -1)
      swift_once();
    v24 = sub_2217CB6FC();
    v25 = (_DWORD *)__swift_project_value_buffer(v24, (uint64_t)qword_254064730);
    OUTLINED_FUNCTION_4_4((uint64_t)v10, v4);
    v26 = sub_2217CB6E4();
    v27 = sub_2217CB924();
    if (os_log_type_enabled(v26, v27))
    {
      v36 = v7;
      OUTLINED_FUNCTION_9_4();
      v39 = OUTLINED_FUNCTION_5_3();
      *v25 = 136315138;
      v37 = v25 + 1;
      OUTLINED_FUNCTION_4_4(v38, (uint64_t)v10);
      v28 = sub_2217CB7C8();
      v30 = OUTLINED_FUNCTION_8_3(v28, v29);
      OUTLINED_FUNCTION_6_2(v30);
      sub_2217CB9E4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_5((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
      OUTLINED_FUNCTION_7_4(&dword_2217B3000, v26, v27, "%s does not support NSItemProvider");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21();
    }
    OUTLINED_FUNCTION_3_5((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));

    sub_2217CB014();
    swift_allocError();
    *v32 = 1;
    swift_willThrow();
  }
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_2217CAEA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  __int128 v14;

  v4 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255708600);
  if (OUTLINED_FUNCTION_1_5())
  {
    v7 = objc_msgSend((id)v14, sel_itemProvidersForActivityItemsConfiguration);
    sub_2217CB050();
    v8 = sub_2217CB828();
    swift_unknownObjectRelease();

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255708608);
    if (OUTLINED_FUNCTION_1_5())
    {
      sub_2217B7BEC(&v14, (uint64_t)v13);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255708610);
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_2217CD1F0;
      __swift_project_boxed_opaque_existential_1(v13, v13[3]);
      *(_QWORD *)(v9 + 32) = sub_2217CB324();
      v12 = v9;
      sub_2217CB834();
      v8 = v12;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a3);
  return v8;
}

unint64_t sub_2217CB014()
{
  unint64_t result;

  result = qword_2557085F0;
  if (!qword_2557085F0)
  {
    result = MEMORY[0x227671804](&unk_2217CDC58, &type metadata for ViewIntentError);
    atomic_store(result, (unint64_t *)&qword_2557085F0);
  }
  return result;
}

unint64_t sub_2217CB050()
{
  unint64_t result;

  result = qword_255708078;
  if (!qword_255708078)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255708078);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_8_3(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2217BEC98(a1, a2, (uint64_t *)(v2 - 72));
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_slowAlloc();
}

uint64_t sub_2217CB0CC()
{
  return MEMORY[0x24BDB4B18]();
}

uint64_t sub_2217CB0D8()
{
  return MEMORY[0x24BDB4B20]();
}

uint64_t sub_2217CB0E4()
{
  return MEMORY[0x24BDB4B28]();
}

uint64_t sub_2217CB0F0()
{
  return MEMORY[0x24BDB4BA8]();
}

uint64_t sub_2217CB0FC()
{
  return MEMORY[0x24BDB4BB8]();
}

uint64_t sub_2217CB108()
{
  return MEMORY[0x24BDB4BC0]();
}

uint64_t sub_2217CB114()
{
  return MEMORY[0x24BDB4C28]();
}

uint64_t sub_2217CB120()
{
  return MEMORY[0x24BDB4C30]();
}

uint64_t sub_2217CB12C()
{
  return MEMORY[0x24BDB4C40]();
}

uint64_t sub_2217CB138()
{
  return MEMORY[0x24BDB4CA0]();
}

uint64_t sub_2217CB144()
{
  return MEMORY[0x24BDB4CC8]();
}

uint64_t sub_2217CB150()
{
  return MEMORY[0x24BDB4CD0]();
}

uint64_t sub_2217CB15C()
{
  return MEMORY[0x24BDB4CD8]();
}

uint64_t sub_2217CB168()
{
  return MEMORY[0x24BDB4D10]();
}

uint64_t sub_2217CB174()
{
  return MEMORY[0x24BDB4D18]();
}

uint64_t sub_2217CB180()
{
  return MEMORY[0x24BDB4D20]();
}

uint64_t sub_2217CB18C()
{
  return MEMORY[0x24BDB4D28]();
}

uint64_t sub_2217CB198()
{
  return MEMORY[0x24BDB4D50]();
}

uint64_t sub_2217CB1A4()
{
  return MEMORY[0x24BDB4D58]();
}

uint64_t sub_2217CB1B0()
{
  return MEMORY[0x24BDB4D60]();
}

uint64_t sub_2217CB1BC()
{
  return MEMORY[0x24BDB4D68]();
}

uint64_t sub_2217CB1C8()
{
  return MEMORY[0x24BDB4D70]();
}

uint64_t sub_2217CB1D4()
{
  return MEMORY[0x24BDB4D78]();
}

uint64_t sub_2217CB1E0()
{
  return MEMORY[0x24BDB4D80]();
}

uint64_t sub_2217CB1EC()
{
  return MEMORY[0x24BDB4DB0]();
}

uint64_t sub_2217CB1F8()
{
  return MEMORY[0x24BDB4DD0]();
}

uint64_t sub_2217CB204()
{
  return MEMORY[0x24BDB4E20]();
}

uint64_t sub_2217CB210()
{
  return MEMORY[0x24BDB4E28]();
}

uint64_t sub_2217CB21C()
{
  return MEMORY[0x24BDB4E70]();
}

uint64_t sub_2217CB228()
{
  return MEMORY[0x24BDB4EA0]();
}

uint64_t sub_2217CB234()
{
  return MEMORY[0x24BDB4EB0]();
}

uint64_t sub_2217CB240()
{
  return MEMORY[0x24BDB4EB8]();
}

uint64_t sub_2217CB24C()
{
  return MEMORY[0x24BDB4EC0]();
}

uint64_t sub_2217CB258()
{
  return MEMORY[0x24BDB4ED0]();
}

uint64_t sub_2217CB264()
{
  return MEMORY[0x24BDB4ED8]();
}

uint64_t sub_2217CB270()
{
  return MEMORY[0x24BDB4F00]();
}

uint64_t sub_2217CB27C()
{
  return MEMORY[0x24BDB4F08]();
}

uint64_t sub_2217CB288()
{
  return MEMORY[0x24BDB4F20]();
}

uint64_t sub_2217CB294()
{
  return MEMORY[0x24BDB4F80]();
}

uint64_t sub_2217CB2A0()
{
  return MEMORY[0x24BDB4FC0]();
}

uint64_t sub_2217CB2AC()
{
  return MEMORY[0x24BDB4FC8]();
}

uint64_t sub_2217CB2B8()
{
  return MEMORY[0x24BDB4FD0]();
}

uint64_t sub_2217CB2C4()
{
  return MEMORY[0x24BDB4FD8]();
}

uint64_t sub_2217CB2D0()
{
  return MEMORY[0x24BDB4FF0]();
}

uint64_t sub_2217CB2DC()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_2217CB2E8()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_2217CB2F4()
{
  return MEMORY[0x24BDB51D0]();
}

uint64_t sub_2217CB300()
{
  return MEMORY[0x24BDB51D8]();
}

uint64_t sub_2217CB30C()
{
  return MEMORY[0x24BDB51E0]();
}

uint64_t sub_2217CB318()
{
  return MEMORY[0x24BDB5208]();
}

uint64_t sub_2217CB324()
{
  return MEMORY[0x24BDB52B8]();
}

uint64_t sub_2217CB330()
{
  return MEMORY[0x24BDB5380]();
}

uint64_t sub_2217CB33C()
{
  return MEMORY[0x24BDB53A0]();
}

uint64_t sub_2217CB348()
{
  return MEMORY[0x24BDB5408]();
}

uint64_t sub_2217CB354()
{
  return MEMORY[0x24BDB55C8]();
}

uint64_t sub_2217CB360()
{
  return MEMORY[0x24BDB5648]();
}

uint64_t sub_2217CB36C()
{
  return MEMORY[0x24BDB5658]();
}

uint64_t sub_2217CB378()
{
  return MEMORY[0x24BDB5660]();
}

uint64_t sub_2217CB384()
{
  return MEMORY[0x24BDB5668]();
}

uint64_t sub_2217CB390()
{
  return MEMORY[0x24BDB5670]();
}

uint64_t sub_2217CB39C()
{
  return MEMORY[0x24BDB5678]();
}

uint64_t sub_2217CB3A8()
{
  return MEMORY[0x24BDB5950]();
}

uint64_t sub_2217CB3B4()
{
  return MEMORY[0x24BDB5968]();
}

uint64_t sub_2217CB3C0()
{
  return MEMORY[0x24BDB59D8]();
}

uint64_t sub_2217CB3CC()
{
  return MEMORY[0x24BDB59F0]();
}

uint64_t sub_2217CB3D8()
{
  return MEMORY[0x24BDB59F8]();
}

uint64_t sub_2217CB3E4()
{
  return MEMORY[0x24BDB5A08]();
}

uint64_t sub_2217CB3F0()
{
  return MEMORY[0x24BDB5A60]();
}

uint64_t sub_2217CB3FC()
{
  return MEMORY[0x24BDB5D08]();
}

uint64_t sub_2217CB408()
{
  return MEMORY[0x24BDB5D80]();
}

uint64_t sub_2217CB414()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_2217CB420()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_2217CB42C()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_2217CB438()
{
  return MEMORY[0x24BDB5E38]();
}

uint64_t sub_2217CB444()
{
  return MEMORY[0x24BDB5EA0]();
}

uint64_t sub_2217CB450()
{
  return MEMORY[0x24BDB5ED0]();
}

uint64_t sub_2217CB45C()
{
  return MEMORY[0x24BDB6028]();
}

uint64_t sub_2217CB468()
{
  return MEMORY[0x24BDB6038]();
}

uint64_t sub_2217CB474()
{
  return MEMORY[0x24BDB6050]();
}

uint64_t sub_2217CB480()
{
  return MEMORY[0x24BDB6060]();
}

uint64_t sub_2217CB48C()
{
  return MEMORY[0x24BDB6068]();
}

uint64_t sub_2217CB498()
{
  return MEMORY[0x24BDB6070]();
}

uint64_t sub_2217CB4A4()
{
  return MEMORY[0x24BDB6078]();
}

uint64_t sub_2217CB4B0()
{
  return MEMORY[0x24BDB6080]();
}

uint64_t sub_2217CB4BC()
{
  return MEMORY[0x24BDB6158]();
}

uint64_t sub_2217CB4C8()
{
  return MEMORY[0x24BDB6278]();
}

uint64_t sub_2217CB4D4()
{
  return MEMORY[0x24BDB6280]();
}

uint64_t sub_2217CB4E0()
{
  return MEMORY[0x24BDB6288]();
}

uint64_t sub_2217CB4EC()
{
  return MEMORY[0x24BDB6290]();
}

uint64_t sub_2217CB4F8()
{
  return MEMORY[0x24BDB6298]();
}

uint64_t sub_2217CB504()
{
  return MEMORY[0x24BDB62D8]();
}

uint64_t sub_2217CB510()
{
  return MEMORY[0x24BDB62E0]();
}

uint64_t sub_2217CB51C()
{
  return MEMORY[0x24BDB62E8]();
}

uint64_t sub_2217CB528()
{
  return MEMORY[0x24BDB6390]();
}

uint64_t sub_2217CB534()
{
  return MEMORY[0x24BDB63A8]();
}

uint64_t sub_2217CB540()
{
  return MEMORY[0x24BDB63E0]();
}

uint64_t sub_2217CB54C()
{
  return MEMORY[0x24BDB63E8]();
}

uint64_t sub_2217CB558()
{
  return MEMORY[0x24BDB63F0]();
}

uint64_t sub_2217CB564()
{
  return MEMORY[0x24BDB64D0]();
}

uint64_t sub_2217CB570()
{
  return MEMORY[0x24BDB64D8]();
}

uint64_t sub_2217CB57C()
{
  return MEMORY[0x24BDB6500]();
}

uint64_t sub_2217CB588()
{
  return MEMORY[0x24BDB6508]();
}

uint64_t sub_2217CB594()
{
  return MEMORY[0x24BDB65A0]();
}

uint64_t sub_2217CB5A0()
{
  return MEMORY[0x24BDB65A8]();
}

uint64_t sub_2217CB5AC()
{
  return MEMORY[0x24BDB65B8]();
}

uint64_t sub_2217CB5B8()
{
  return MEMORY[0x24BDCB900]();
}

uint64_t sub_2217CB5C4()
{
  return MEMORY[0x24BDCB910]();
}

uint64_t sub_2217CB5D0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2217CB5DC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2217CB5E8()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2217CB5F4()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2217CB600()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2217CB60C()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_2217CB618()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2217CB624()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2217CB630()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2217CB63C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2217CB648()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2217CB654()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2217CB660()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_2217CB66C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2217CB678()
{
  return MEMORY[0x24BDFBA90]();
}

uint64_t sub_2217CB684()
{
  return MEMORY[0x24BDFBA98]();
}

uint64_t sub_2217CB690()
{
  return MEMORY[0x24BDFBAB0]();
}

uint64_t sub_2217CB69C()
{
  return MEMORY[0x24BDFBAB8]();
}

uint64_t sub_2217CB6A8()
{
  return MEMORY[0x24BDFBAF8]();
}

uint64_t sub_2217CB6B4()
{
  return MEMORY[0x24BDFBB00]();
}

uint64_t sub_2217CB6C0()
{
  return MEMORY[0x24BDFBB10]();
}

uint64_t sub_2217CB6CC()
{
  return MEMORY[0x24BDFBB18]();
}

uint64_t sub_2217CB6D8()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_2217CB6E4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2217CB6F0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2217CB6FC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2217CB708()
{
  return MEMORY[0x24BEBC9A8]();
}

uint64_t sub_2217CB714()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t sub_2217CB720()
{
  return MEMORY[0x24BDECC90]();
}

uint64_t sub_2217CB72C()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_2217CB738()
{
  return MEMORY[0x24BDFBB58]();
}

uint64_t sub_2217CB744()
{
  return MEMORY[0x24BDFBB68]();
}

uint64_t sub_2217CB750()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_2217CB75C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2217CB768()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2217CB774()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_2217CB780()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2217CB78C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2217CB798()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2217CB7A4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2217CB7B0()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2217CB7BC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2217CB7C8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2217CB7D4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2217CB7E0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2217CB7EC()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2217CB7F8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2217CB804()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_2217CB810()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2217CB81C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2217CB828()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2217CB834()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2217CB840()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2217CB84C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2217CB858()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2217CB864()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2217CB870()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2217CB87C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2217CB888()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2217CB894()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2217CB8A0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2217CB8AC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2217CB8B8()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_2217CB8C4()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2217CB8D0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2217CB8DC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2217CB8E8()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2217CB8F4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2217CB900()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2217CB90C()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_2217CB918()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2217CB924()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2217CB930()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2217CB93C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2217CB948()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2217CB954()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2217CB960()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2217CB96C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2217CB978()
{
  return MEMORY[0x24BDD0028]();
}

uint64_t sub_2217CB984()
{
  return MEMORY[0x24BDD0058]();
}

uint64_t sub_2217CB990()
{
  return MEMORY[0x24BEBCDD0]();
}

uint64_t _sSo6UIViewC17_AppIntents_UIKitE12viewProvider21UIIntelligenceSupport012IntelligencebC16PayloadProviding_AE0i10SubelementK0pSgvg_0()
{
  return MEMORY[0x24BEBCFC8]();
}

uint64_t sub_2217CB9A8()
{
  return MEMORY[0x24BEBCFD0]();
}

uint64_t sub_2217CB9B4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2217CB9C0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2217CB9CC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2217CB9D8()
{
  return MEMORY[0x24BEE1C88]();
}

uint64_t sub_2217CB9E4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2217CB9F0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2217CB9FC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2217CBA08()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2217CBA14()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_2217CBA20()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2217CBA2C()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_2217CBA38()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_2217CBA44()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_2217CBA50()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_2217CBA5C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2217CBA68()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_2217CBA74()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_2217CBA80()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2217CBA8C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2217CBA98()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2217CBAA4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2217CBAB0()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2217CBABC()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2217CBAC8()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2217CBAD4()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2217CBAE0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2217CBAEC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2217CBAF8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2217CBB04()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2217CBB10()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2217CBB1C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2217CBB28()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2217CBB34()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2217CBB40()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2217CBB4C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2217CBB58()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2217CBB64()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2217CBB70()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2217CBB7C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2217CBB88()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2217CBB94()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2217CBBA0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2217CBBAC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2217CBBB8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2217CBBC4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2217CBBD0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2217CBBDC()
{
  return MEMORY[0x24BEE4698]();
}

uint64_t sub_2217CBBE8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2217CBBF4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2217CBC00()
{
  return MEMORY[0x24BEE4A98]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

